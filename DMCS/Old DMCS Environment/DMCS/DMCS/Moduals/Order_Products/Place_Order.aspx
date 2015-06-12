<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Place_Order.aspx.cs" Inherits="DMCS.Moduals.Order_Products.Place_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" EnablePartialRendering="true"></asp:ScriptManager>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>
    <script src="Scripts/JSON2.js" type="text/javascript"></script>
    <script src="Scripts/jquery.js" type="text/javascript"></script>
    <link href="CSS/note.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" id="mapScript">
        var geocoder;
        var map;
        var marker;
        var infowindow;
        var infoWindow = new google.maps.InfoWindow();
        var pos = new google.maps.LatLng(41.321550, -87.613281);
        var warehouse_Image = "Images/WarehouseResources.png";
        var resource_Image = "Images/Resources.png";
        var expandableHeader_Warehouse_L_Placeholder;
        var instructCountUserLoc = false;
        var instructCountAddress = false;
        var mybounds = new google.maps.LatLngBounds();
        var noteA;
        var orderMarkerContent = '<span class="infowin">Drop this order on a warehouse.</span>';


        function initialize() {


            geocoder = new google.maps.Geocoder();
            var Radius = document.getElementById("ddlRadius").options[document.getElementById("ddlRadius").selectedIndex].value;

            var mapOptions = {
                zoom: 4,
                center: pos,
                mapTypeId: google.maps.MapTypeId.HYBRID

            }
            map = new google.maps.Map(document.getElementById('map'), mapOptions);

            var populationOptions = {
                strokeColor: '#FF0000',
                strokeOpacity: 0.15,
                strokeWeight: 1,
                fillColor: '#FF0000',
                fillOpacity: 0.15,
                map: map,
                center: pos,
                radius: Radius * 1609.34,
                clickable: false
            };

            if (document.getElementById("passLat_hf").value != "" && document.getElementById("passLong_hf").value != "") {

                pos = new google.maps.LatLng(document.getElementById("passLat_hf").value, document.getElementById("passLong_hf").value);
                cityCircle = new google.maps.Circle(populationOptions);



                instructCountAddress = true;
                instructCountUserLoc = true;
                createMarkers();

            }

        }





        function createMarkers() {

            var circleArray = new Array();
            var warehouseArray = new Array();
            var orderMarkerLocation = map.getCenter();

            markerOrder = new google.maps.Marker({
                position: orderMarkerLocation,
                title: 'DMCS Order',
                map: map,
                draggable: true,
                icon: resource_Image
            }),

            infoA = new google.maps.InfoWindow({
                content: orderMarkerContent
            });

            mybounds.extend(orderMarkerLocation);



            var markers = JSON.parse('<%=grabMapMarkers()%>');

            for (i = 0; i < markers.length; i++) {

                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.latitude, data.longitude);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    icon: warehouse_Image,
                    animation: google.maps.Animation.DROP,
                    map: map

                }),

                // Define the circle
                circle = new google.maps.Circle({
                    map: map,
                    clickable: false,
                    // metres
                    radius: 5000,
                    fillColor: '#fff',
                    fillOpacity: .6,
                    strokeColor: '#313131',
                    strokeOpacity: .4,
                    strokeWeight: .8
                });

                // Attach circle to marker
                circle.bindTo('center', marker, 'position');

                // Note spans
                noteB = jQuery('.bool#b');
                noteA = jQuery('.bool#a');

                circleArray.push(circle.getBounds());

                (function (marker, data) {
                    var content = "<font color='BLACK'><b>Name: </b>" + data.warehouse_name + "<br /><b>Distance: </b>" + data.distance + " miles from the searched location</font>";

                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(content);
                        infoWindow.open(map, marker);

                        document.getElementById("passWarehouseID_hf").value = data.warehouse_id;
                        document.getElementById("passWarehouseName_hf").value = data.warehouse_name;
                        document.getElementById("SelectViewStatus_L").innerHTML = "Send order to  " + data.warehouse_name ;

                    });


                    google.maps.event.addListener(marker, "dblclick", function (e) {
                        map.setZoom(12);
                        map.setCenter(marker.getPosition());
                    });

                })(marker, data);

                warehouseArray.push(marker);
                mybounds.extend(myLatlng);

            }

            //end drag
            google.maps.event.addListener(markerOrder, 'dragend', function () {
                orderMarkerLocation = new google.maps.LatLng(markerOrder.position.lat(), markerOrder.position.lng());

                for (var i = 0; i < circleArray.length; i++) {
                    if (circleArray[i].contains(orderMarkerLocation)) {
                        noteA.text('Warehouse Selected!');
                        var selectedWarehouseMarker = warehouseArray[i];
                        google.maps.event.trigger(selectedWarehouseMarker, "click");
                        noteB.text(document.getElementById("passWarehouseName_hf").value);
                        google.maps.event.trigger(selectedWarehouseMarker, "click");

                        return;
                    }
                    if (noteA.text != 'true') {
                        noteA.text('Not in bounds of a warehouse. Try again.');
                        noteB.text('Not in bounds of a warehouse. Try again.');
                    }
                }

            });
            //start drag
            google.maps.event.addListener(markerOrder, 'drag', function () {
                infoA.close();
                noteA.html("Dragging Marker&hellip;");
                noteB.html("Dragging Marker&hellip;");
            });
            //click
            google.maps.event.addListener(markerOrder, "click", function (e) {
                infoWindow.setContent(orderMarkerContent);
                infoWindow.open(map, markerOrder);


            });
            map.fitBounds(mybounds);


        }

        function grabtypes() {
            document.getElementById("passTypes_hf").value = iterateCheckBoxList();

        }
        function CPEDelay() {

            var FunctionOne = function () {
                // create a deferred object
                var r = $.Deferred();

                // do whatever you want (e.g. ajax/animations other asyc tasks)

                setTimeout(function () {
                    // and call `resolve` on the deferred object, once you're done
                    r.resolve();
                }, 500);

                // return the deferred object
                return r;
            };

            // define FunctionTwo as needed
            var FunctionTwo = function () {
                initialize()
            };

            // call FunctionOne and use the `done` method
            // with `FunctionTwo` as it's parameter
            FunctionOne().done(FunctionTwo);
        }


        function codeCurrentLocation() {
            // Try HTML5 geolocation
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    pos = new google.maps.LatLng(position.coords.latitude,
                                                    position.coords.longitude);
                    grabLocation(pos);
                    if (instructCountUserLoc != true) {
                        marker = new google.maps.Marker({
                            map: map,
                            position: pos
                        });

                        infowindow = new google.maps.InfoWindow({
                            map: map,
                            position: pos,
                            content: 'Location found using HTML5.'
                        });
                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, marker);
                        });

                    }
                    map.setCenter(pos);



                }, function () {
                    handleNoGeolocation(true);
                });
            } else {
                // Browser doesn't support Geolocation
                handleNoGeolocation(false);
            }


        }


        function codeAddress() {
            var searchString = document.getElementById('txtSearchAddress').value;
            geocoder.geocode({ 'address': searchString }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    pos = results[0].geometry.location;
                    grabLocation(pos);

                    if (instructCountAddress != true) {
                        marker = new google.maps.Marker({
                            map: map,
                            position: pos
                        });

                        infowindow = new google.maps.InfoWindow({
                            map: map,
                            position: pos,
                            content: 'The address has been confirmed at this location.'
                        });
                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, marker);
                        });


                    }

                } else {
                    alert('Geocoder was not successful for the following reason: ' + status);
                }
            });


        }

        function grabLocation(center) {
            document.getElementById("passLat_hf").value = center.lat();
            document.getElementById("passLong_hf").value = center.lng();
        }


        function handleNoGeolocation(errorFlag) {
            if (errorFlag) {
                var content = 'Error: The Geolocation service failed.';
            } else {
                var content = 'Error: Please enable location tracking in your browser or choose another search type.';
            }

            var options = {
                map: map,
                position: new google.maps.LatLng(41, -87),
                content: content
            };
            product_id_array
            infowindow = new google.maps.InfoWindow(options);
            map.setCenter(options.position);
        }

        //google.maps.visualRefresh = true;
        google.maps.event.addDomListener(window, 'load', initialize);



        ////////////////////////////////////////////////////////////////////////////






    </script>


    <div id="final_invoice_div" runat="server" style="display: none">
        <table id="Table1" width="100%" cellspacing="10" bgcolor="Silver">
            <tr>
                <td colspan="12" align="left" style="border-style: none">
                    <asp:Label runat="server" ForeColor="Black" Text="Preview Final Invoice: " Font-Size="14pt" Font-Bold="True" ID="Label3"></asp:Label>

                </td>
            </tr>
            <tr>
                <td colspan="12" style="background-color: Gray" height="5px"></td>
            </tr>

            <tr>
                <td rowspan="3" align="left" valign="top">
                    <asp:Label runat="server" Text="DMCS" Font-Bold="True" Font-Size="XX-Large" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Label runat="server" Text="Disaster Management Communication System" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" Text="[CommandCenter Address]" ID="FINAL_CommandCenter_Address_L"></asp:Label>
                </td>
                <td align="right" style="font-size: x-large; color: #808080; font-family: 'Times New Roman'; font-weight: bold;">INVOICE
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td align="right" style="color: #000000">
                    <asp:Label runat="server" Text="Invoice/Case/Order #[?]" ID="FINAL_caseNumber_L"></asp:Label>
                    <br />
                    <asp:Label runat="server" Text="[Date]" ID="FINAL_date_L"></asp:Label>
                </td>
            </tr>

        </table>
        <table id="Table2" width="100%" cellspacing="10" bgcolor="Silver">
            <tr>
                <td width="50%" align="left">
                    <asp:Label runat="server" Text="Shipping To:" Font-Bold="True"></asp:Label><br />
                    <asp:Label runat="server" Text="[Name]" ID="FINAL_to_Name_L"></asp:Label><br />
                    <asp:Label runat="server" Text="[Company Name]" ID="FINAL_to_CompanyName_L"></asp:Label><br />
                    <asp:Label runat="server" Text="[Street Address]" ID="FINAL_to_StreetAddress_L"></asp:Label><br />
                    <asp:Label runat="server" Text="[City, State, and Zip]" ID="FINAL_to_CityStateZip_L"></asp:Label><br />
                </td>

                <td width="50%" align="left">
                    <asp:Label runat="server" Text="Shipping From:" Font-Bold="True"></asp:Label><br />
                    <asp:Label runat="server" Text="[Name]" ID="FINAL_from_Name_L"></asp:Label><br />
                    <asp:Label runat="server" Text="[Company Name]" ID="FINAL_from_CompanyName_L"></asp:Label><br />
                    <asp:Label runat="server" Text="[Street Address]" ID="FINAL_from_StreetAddress_L"></asp:Label><br />
                    <asp:Label runat="server" Text="[City, State, and Zip]" ID="FINAL_from_CityStateZip_L"></asp:Label><br />

                </td>
            </tr>
        </table>
        <table id="Table7" width="100%" cellspacing="10" bgcolor="Silver">
            <tr>
                <td colspan="10" width="100%" align="left">
                    <br />
                    ORDER:
                            <br />
                </td>
            </tr>
            <tr>
                <td colspan="1" width="10%" align="left" style="height: 87px">Item #:
                            <div runat="server" id="FINAL_orderNum_div">
                            </div>
                </td>
                <td colspan="2" width="20%" align="left" style="height: 87px">Product ID/Warehouse ID:
                            <div runat="server" id="FINAL_ProductID_and_WarehouseID_div">
                            </div>
                </td>
                <td colspan="1" width="10%" align="left" style="height: 87px">Quantity:
                            <div runat="server" id="FINAL_orderQTY_div">
                            </div>
                </td>
                <td colspan="6" width="60%" align="left" style="height: 87px">Item Description:
                            <div runat="server" id="FINAL_orderDESCRIPTION_div">
                            </div>
                </td>
            </tr>
        </table>
        <table id="Table7" width="100%" cellspacing="10" bgcolor="Silver">
            <tr>
                <td style="padding-right: 0px;">
                    <asp:Button ID="backBtn" runat="server" Text="Create Another Order" Style="width: 100%; color: #FFFFFF; background-color: #EA5151;" OnClick="backBtn_Click" />
                </td>
                <td style="padding-right: 0px;">
                    <asp:Button ID="menuBtn" runat="server" Text="Back to main menu" Style="width: 100%; color: #FFFFFF; background-color: #EA5151;" OnClick="menuBtn_Click" />
                </td>
            </tr>
        </table>
    </div>

    <div id="placeOrder_div" runat="server" style="padding: 10px; width:100%; text-align: center;">
                    <asp:Label ID="ERROR_txt" runat="server" Text="" Font-Bold="True" ForeColor="#CC0000" BackColor="Silver"></asp:Label>
    </div>            
    <div>
                <asp:Panel ID="Place_Order_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                    <asp:Label ID="Place_Order_InfoHead_label" Style="padding: 10px" runat="server" Text="Place An Order" Font-Size="Large"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Place_Order_InfoBody" runat="server" Style="overflow: hidden;">
                    <div>
                         <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'"> 
                            <tr>
                                <th colspan="2" style="padding: 5px 10px 5px 10px; background-color: #666666; width:100%" > 
                                    <label style="font-size: large; color: #E2E2E2">Assign the order to a warehouse destination</label>
                                </th> 
                            </tr>
                         </table>
                        
                        <table width="100%" bgcolor="#666666" border="3" style="color: #CCCCCC;">
                            <tr>
                                <td width="15%" align="left" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:Label ID="Label5" style="font-size: large; color: #E2E2E2" Text="CallCenter:" runat="server"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DDL_Call_Center" runat="server" Width="147px"
                                    DataSourceID="CallCenters" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="1"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">*Select Call Center</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CallCenters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>"
                                    SelectCommand="SP_DMCS_Get_Call_centers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </td>
                                <td width="15%" align="left" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:Label ID="Label1" style="font-size: large; color: #E2E2E2" Text="Disaster:" runat="server"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DDL_Disaster" runat="server" Width="147px" TabIndex="2" DataSourceID="Disasters" DataTextField="disaster_name" DataValueField="disaster_id"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">*Select Disaster</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Disasters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_name], [disaster_id] FROM [disaster]"></asp:SqlDataSource>
                                </td>
                                <td width="15%" align="left" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:Label ID="Label2" style="font-size: large; color: #E2E2E2" Text="Priority Level:" runat="server"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DDL_Priority_Lvl" runat="server"  Width="100px" TabIndex="2">
                                        <asp:ListItem Selected="True" Value="-1">Select Priority</asp:ListItem>
                                        <asp:ListItem Value="1">Low</asp:ListItem>
                                        <asp:ListItem Value="2">Normal</asp:ListItem>
                                        <asp:ListItem Value="3">High</asp:ListItem>
                                        <asp:ListItem Value="4">Urgent</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td width="55%" align="center" style="padding: 10px; font-weight: bold; height: 53px;">
                                </td>
                            </tr>
                        </table>
                        <div style="margin: 0px; border-width: 0px; color: #CCCCCC;">
                            <asp:Button ID="searchByAddress_btn" Text="Search By Address" runat="server"
                            TabIndex="5" OnClick="Choose_SearchByAddress_Click" BackColor="#333333" ForeColor="White" Width="100%" Style="color: White; background-color: #333333; width: 100%; margin-top: 0px; margin-bottom: 0px; margin-right: 0px;" />
                    
                            <asp:Button ID="searchByUserLocation_btn" Text="Search By Current Location" runat="server"
                            TabIndex="5" OnClick="Choose_SearchByUserLocation_Click" ClientIDMode="Static" BackColor="#333333" ForeColor="White" Width="100%" Style="color: White; background-color: #333333; width: 100%; margin-top: 0px; margin-bottom: 0px; margin-right: 0px;" />
						</div>
                        <table width="100%" bgcolor="Silver" style=" padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                            <tr>
                                <td width="12.5%" style="padding: 5px 10px 5px 10px;">
                                    
                                </td>
                                <td width="21%" style="padding: 5px 10px 5px 10px;">
                                    <div id="Address_DDL_DIV" runat="server">
                                        <asp:Label ID="Address_L" Text="Address:" runat="server" Visible="False"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtSearchAddress" runat="server" Width="314px" TabIndex="3" ClientIDMode="Static" Style="margin-right: 0px" Visible="False" AutoPostBack="True"></asp:TextBox>
                                    </div>
                                    <div id="disaster_DDL_DIV" runat="server" style="display: none">
                                        <asp:Label ID="Label4" ForeColor="Black" Text="Disaster:" runat="server"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="147px" TabIndex="2" DataSourceID="Disasters2" DataTextField="disaster_name" DataValueField="disaster_id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="Disasters2" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_name], [disaster_id] FROM [disaster]"></asp:SqlDataSource>
                                        </div>
                                </td>
                                <td width="8%" style="padding: 5px 10px 5px 10px;">
                                        <asp:Label ID="Radius_L" Text="Radius:" runat="server" ClientIDMode="Static" Visible="False"></asp:Label>
                                        <br />
                                        <asp:DropDownList runat="server" ID="ddlRadius" OnChange="initialize()" Visible="False" ClientIDMode="Static">
                                            <asp:ListItem Value="1">1 miles</asp:ListItem>
                                            <asp:ListItem Value="5">5 miles</asp:ListItem>
                                            <asp:ListItem Value="7">7 miles</asp:ListItem>
                                            <asp:ListItem Value="10">10 miles</asp:ListItem>
                                            <asp:ListItem Value="15">15 miles</asp:ListItem>
                                            <asp:ListItem Value="20">20 miles</asp:ListItem>
                                            <asp:ListItem Value="30">30 miles</asp:ListItem>
                                            <asp:ListItem Value="50">50 miles</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="75">75 miles</asp:ListItem>
                                            <asp:ListItem Value="100">100 miles</asp:ListItem>
                                            <asp:ListItem Value="150">150 miles</asp:ListItem>
                                            <asp:ListItem Value="15000">Show All</asp:ListItem>
                                        </asp:DropDownList>
                                </td>
                                <td width="71%" align="center" nowrap="nowrap" style="border-style: none">
                                    <div>
                                        <asp:Button ID="sByALocation" Text="Search" runat="server"
                                        TabIndex="5" OnClick="searchByAddress_Click" Width="100%" Visible="False" style=" color: #FFFFFF; background-color: #EA5151; width: 100%; height: 28px;" />
                                    </div>
                                    <div>
                                        <asp:Button ID="sByCLocation" Text="Search" runat="server"
                                        TabIndex="5" Width="100%" Visible="False" OnClick="searchByUserLocation_Click" style=" color: #FFFFFF; background-color: #EA5151; width: 100%; height: 28px;"/>
    
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" bgcolor="Silver" style="font-family: 'Calibri Light'; padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                            <tr>
                                <td style="padding: 0px;" width="100%">
                                <div id="note" style="text-align: center; background-color: #666; color: #E2E2E2">
                                    <span id="title">&raquo;Drag the order to a warehouse&laquo;</span><hr />
                                    <span class="info">Order: <span id="a" class="bool"></span></span>&larr;&diams;&rarr; <span class="info">Warehouse: <span id="b" class="bool"></span></span>
                                </div>
                                </td>
                            </tr>
                        </table>
                        <%--<div id="map" style="margin: 0px;  border-style: solid none none solid; border-width: medium; width: 66%; height: 550px; overflow:auto;"></div>
                        <div id="SelectedProduct_div" runat="server" style="border-style: solid solid solid none; border-width: medium; border-color: #EA5151; 
                        height: 550px;  margin:0px; font-size: 11px; color: #CCCCCC; float: right; background-color: #666666; background-image: url('http://localhost:3466/Moduals/Order_Products/Images/Slate.jpg'); 
                        width: auto;"></div>--%>

                        <div id="SelectedProduct_div" runat="server" style="border-style: solid solid hidden none; border-width: medium; border-color: #EA5151;  height: 553px; width: 33%; font-size: 11px; color: #CCCCCC; float: right; background-color: #666666; background-image: url('http://localhost:3466/Moduals/Order_Products/Images/Slate.jpg');"></div>
                        <div id="map" style="margin: 0px; border-style: solid none none solid; border-width: medium; width: auto; height: 515px; margin-bottom: 0px;margin-top: 0px;"></div>
                        


                        <div style="border-color: #CCCCCC #CCCCCC #EA5151 #333333; text-align:center; height: 38px; border-style: hidden none hidden solid; background-color:#666666; border-width: medium; width: auto; margin-bottom: 0px; margin-top: 0px; vertical-align: bottom; color: #E2E2E2;">
                            <asp:Label ID="SelectViewStatus_L" runat="server" ClientIDMode="Static" style="color: #E2E2E2" Font-Size="Large"></asp:Label>
                        </div>
                        <div>
                            <asp:Button runat="server" Width="100%" Text="Place The Order" style="margin-bottom: 0px;margin-top: 0px;" BackColor="#EA5151" ForeColor="#CCCCCC" ClientIDMode="Static" ID="Final_btn" OnClientClick="sendToFinal(); return false;" BorderWidth="0"></asp:Button>                            
                        </div>
                    </div>
                </asp:Panel>
                <asp:CollapsiblePanelExtender ID="cpeOrderInfo" runat="server" 
                    CollapseControlID="Place_Order_InfoHead" 
                    CollapsedText="Place An Order" Enabled="True" 
                    ExpandControlID="Place_Order_InfoHead" 
                    ExpandedText="Place An Order" 
                    TargetControlID="Place_Order_InfoBody" 
                    TextLabelID="Place_Order_InfoHead_label"></asp:CollapsiblePanelExtender>
            </div>
    <asp:HiddenField ID="passWarehouseID_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passProduct_ID_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passLat_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passLong_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passWarehouseName_hf" runat="server" Value="" ClientIDMode="Static" />
</asp:Content>
