<%@ Page Title="" Language="C#" enableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Warehouse_Inventory.aspx.cs" Inherits="DMCS.Moduals.Warehouse_Inventory.Warehouse_Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" EnablePartialRendering="true" ></asp:ScriptManager>
    <script src="https://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
        <script src="JS/JSON2.js" type="text/javascript"></script>
        <script src="JS/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" id="mapScript">
        var geocoder;
        var map;
        var marker;
        var infowindow;
        var infoWindow = new google.maps.InfoWindow();
        var pos = new google.maps.LatLng(39.321550, -98.613281);
        var warehouse_Image = "Images/WarehouseResources.png";
        var expandableHeader_Warehouse_L_Placeholder;
        var instructCountUserLoc = false;
        var instructCountAddress = false;
        var mybounds = new google.maps.LatLngBounds();



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
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35,
                map: map,
                center: pos,
                radius: Radius * 1609.34
            };

            if (document.getElementById("SendLat").value != "" && document.getElementById("SendLng").value != "") {

                pos = new google.maps.LatLng(document.getElementById("SendLat").value, document.getElementById("SendLng").value);
                cityCircle = new google.maps.Circle(populationOptions);
                instructCountAddress = true;
                instructCountUserLoc = true;
                createMarkers();

            }

        }

        function createMarkers() {


            var markers = JSON.parse('<%=grabMapMarkers()%>');
            for (i = 0; i < markers.length; i++) {

                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.latitude, data.longitude);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    icon: warehouse_Image,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                (function (marker, data) {
                    var content = "Name: " + data.warehouse_name + "<br />Distance: " + data.distance + " miles from the searched location";

                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(content);
                        infoWindow.open(map, marker);

                        document.getElementById("passWarehouseID_hf").value = data.warehouse_id;

                        document.getElementById("SelectViewStatus_L").innerHTML = "View " + data.warehouse_name + " 's Resources:";
                        document.getElementById("SelectModStatus_L").innerHTML = "Administer " + data.warehouse_name + " 's Resources:";
                        document.getElementById("warehouseInformation_L_hf").value = "" + data.warehouse_name + " 's Information:";
                        document.getElementById("warehouseInventory_L_hf").value = "" + data.warehouse_name + " 's Inventory:";
                        document.getElementById("Admin_warehouseInformation_L_hf").value = "" + data.warehouse_name + " 's Information:";
                        document.getElementById("Admin_warehouseInventory_L_hf").value = "" + data.warehouse_name + " 's Inventory:";
                    });


                    google.maps.event.addListener(marker, "dblclick", function (e) {
                        map.setZoom(7);
                        map.setCenter(marker.getPosition());
                    });

                })(marker, data);
                mybounds.extend(myLatlng);
            }
            map.fitBounds(mybounds);


        }

        function grabtypes() {
            document.getElementById("passTypes_hf").value = iterateCheckBoxList();
            alert(document.getElementById("passTypes_hf").value);
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
            document.getElementById("SendLat").value = center.lat();
            document.getElementById("SendLng").value = center.lng();
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

            infowindow = new google.maps.InfoWindow(options);
            map.setCenter(options.position);
        }

        //google.maps.visualRefresh = true;
        google.maps.event.addDomListener(window, 'load', initialize);



        ////////////////////////////////////////////////////////////////////////////

        function iterateCheckBoxList() {
            var elementRef = document.getElementById(Type);
            var checkBoxArray = document.getElementById("<%=Type.ClientID %>").getElementsByTagName("input");
            var checkedValues = '';
            typeselect = 0;
            //alert('List length: ' + checkBoxArray.length);

            for (var i = 0; i < checkBoxArray.length; i++) {
                var checkBoxRef = checkBoxArray[i];
                if (checkBoxRef.checked == true) {
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    // AFAIK, you cannot get the value property of a ListItem in a CheckBoxList.
                    // You can only get the Text property, which will be in an HTML label element.
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    typeselect = 1;
                    var labelArray = checkBoxRef.parentNode.getElementsByTagName('label');
                    if (labelArray.length > 0) {
                        if (checkedValues.length > 0) {
                            checkedValues += "," + labelArray[0].innerHTML;
                        }
                        else { checkedValues += labelArray[0].innerHTML; }
                    }
                }
            }
            var arrayOfTypes = checkedValues.split(',');
            return arrayOfTypes;
        }




    </script>
        <script>
            $(document).ready(function () {
                var myArr = [];

                $.ajax({
                    type: "GET",
                    url: "../Content/Search_List_Datasource/search_results.xml", // change to full path of file on server
                    dataType: "xml",
                    success: parseXml,
                    complete: setupAC,
                    failure: function (data) {
                        alert("XML File could not be found");
                    }
                });

                function parseXml(xml) {
                    //find every query value
                    $(xml).find("product").each(function () {
                        myArr.push($(this).attr("label"));
                    });
                }

                function setupAC() {
                    $("input#searchBox").autocomplete({
                        source: myArr,
                        minLength: 1,
                        select: function (event, ui) {
                            $("input#searchBox").val(ui.item.value);
                            $("#searchForm").submit();
                        }
                    });
                }
            });
 </script>
   <div>
        <asp:Panel ID="warehouseChooseInfoHead" runat="server" CssClass="PanelHead" OnClick="CPEDelay()">
            <asp:Label ID="warehouseChoosePanel_L" runat="server" Text="Warehouse Information" ></asp:Label>
        </asp:Panel>
        <asp:Panel ID="warehouseChooseInfoBody" runat="server" >

            <div>
   
        <table id="Table12" width="100%" cellspacing="10" bgcolor="Silver">
           <tr>
               <td colspan="10">
                <asp:Label ID="lbl_warehouse_Error_ADD"
                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="Silver"></asp:Label> 
                   </td>
               </tr>
            <tr>
                <td colspan="10" align="left">
                    <asp:Label runat="server" Text="Choose Warehouse" Font-Bold="True" ForeColor="Black" Font-Size="18pt"></asp:Label>
                    
                </td>

            </tr>
            <tr>
                <td colspan="10" style="background-color: Gray" height="2px">
                </td>
            </tr>
            <tr>
                <td  colspan="3" align="right">
                     <asp:Button ID="searchByAddress_btn" Text="Search By Address" runat="server" 
                                 TabIndex="5" OnClick="Choose_SearchByAddress_Click"  />
                        </td>
                <td  colspan="4" align="center">
                     <asp:Button ID="ChangeSearchType_btn" Text="Change Search Type" runat="server" 
                                 TabIndex="5" OnClick="ChangeSearchType_Click" Visible="False"   />
                        </td>
                <td  colspan="3" align="left">
                     <asp:Button ID="searchByUserLocation_btn" Text="Search by Current Location" runat="server" 
                                 TabIndex="5" OnClick="Choose_SearchByUserLocation_Click" ClientIDMode="Static"  />
                </td>
            </tr>
            <tr>                  
                <td style="font-weight: bold";colspan="2" align="left">
                            <asp:Label ID="Address_L" Text="Address:" runat="server" Visible="False"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtSearchAddress" runat="server" Width="177px" TabIndex="3" ClientIDMode="Static" style="margin-right: 0px" Visible="False" AutoPostBack="True"></asp:TextBox>
                </td>
                <td style="font-weight: bold";colspan="2" align="left">
                            <asp:Label ID="Radius_L" Text="Radius:" runat="server" ClientIDMode="Static" Visible="False"></asp:Label>
                            <br />
                    <asp:DropDownList runat="server" ID="ddlRadius" OnChange = "initialize()" Visible="False" ClientIDMode="Static">
                        <asp:ListItem Value="1">1 miles</asp:ListItem>
                        <asp:ListItem Selected="True" Value="5">5 miles</asp:ListItem>
                        <asp:ListItem Value="7">7 miles</asp:ListItem>
                        <asp:ListItem Value="10">10 miles</asp:ListItem>
                        <asp:ListItem Value="15">15 miles</asp:ListItem>
                        <asp:ListItem Value="20">20 miles</asp:ListItem>
                        <asp:ListItem Value="30">30 miles</asp:ListItem>
                        <asp:ListItem Value="50">50 miles</asp:ListItem>
                        <asp:ListItem Value="75">75 miles</asp:ListItem>
                        <asp:ListItem Value="100">100 miles</asp:ListItem>
                        <asp:ListItem Value="150">150 miles</asp:ListItem>
                        <asp:ListItem Value="15000">Show All</asp:ListItem>
 

                    </asp:DropDownList>
                 </td>
                 
                                
                 <td colspan="1" align="center">
                     <br />
                     <asp:Button ID="sByALocation" Text="Search By Address" runat="server" 
                                 TabIndex="5" OnClick="searchByAddress_Click"  Width="156px" Visible="False" />
                         <br />
                     <asp:Button ID="sByCLocation" Text="Search Your Location" runat="server" 
                                 TabIndex="5"  Width="184px" Visible="False"  OnClick="searchByUserLocation_Click" />
                        </td>
                <td colspan="2" align="center">
                
                </td>
                
                <td style="font-weight: bold"; colspan="1" align="left">
                            <asp:Label ID="Lat_L" Text="Lat:" runat="server" ClientIDMode="Static" Visible="False"></asp:Label>
                            <br />                
                    <asp:TextBox ID="SendLat" runat="server" Width="62px" ClientIDMode="Static" Visible="False"></asp:TextBox>
                </td>
                <td style="font-weight: bold";  align="left">
                            <asp:Label ID="Long_L" Text="Long:" runat="server" ClientIDMode="Static" Visible="False"></asp:Label>
                            <br />  
                    <asp:TextBox ID="SendLng" runat="server"  Width="62px" ClientIDMode="Static" Visible="False"></asp:TextBox>

                </td>
                <td colspan="1"></td>
                
                
            </tr>
            <tr>
                <td colspan="10" style="background-color: gray" height="10px" align="center">

                </td>
            </tr>
            <tr>
                <td colspan="10">
                    <div id="map" style="width: 100%; height: 470px;"></div>   
                </td>
            </tr>
            <tr>
                <td colspan="10" width="50%" align="center" style="font-weight: bold"; >
                    <asp:Label ID="SelectViewStatus_L" runat="server" ClientIDMode="Static"></asp:Label>
                <br />
                    <asp:Button id="view_btn" runat="server" Text="View" Visible="False" Width="100%" OnClick="view_btn_Click" BackColor="Red" ForeColor="White"></asp:Button>
                </td>

            </tr>
            </table>

                           </div>
        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="ChooseCPL" runat="server" CollapseControlID="warehouseChooseInfoHead" CollapsedText="Find a Warehouse" Enabled="True" ExpandControlID="warehouseChooseInfoHead" ExpandedText="Choose a Warehouse" TargetControlID="warehouseChooseInfoBody" TextLabelID="warehouseChoosePanel_L" ClientIDMode="Static">
        </asp:CollapsiblePanelExtender>
    </div>

        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->

    <div>
        <asp:Panel ID="warehouseViewInfoHead" runat="server" CssClass="PanelHead" Visible="False">
            <asp:Label ID="warehouseInformationPanel_L" runat="server" Text="Warehouse Information" ></asp:Label>
        </asp:Panel>
        <asp:Panel ID="warehouseViewInfoBody" runat="server" Visible="false">

            <div>
                <table id="tbl_Add_Pet_ADD" width="100%" style="font-family: Tahoma" cellspacing="10">
                </table>
                <asp:Label ID="warehouseInformation_L" runat="server" ClientIDMode="Static"></asp:Label>
                <br />
                <table width="100%" cellspacing="10" bgcolor="Silver" border="3">
                    <tr>
                         <td colspan="2" align="center"
                            style="font-weight: bold; height: 53px;">Name:
                        <br />
                            <asp:TextBox ID="name_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="48"></asp:TextBox>
                        </td>
                        <td colspan="2" align="center"
                            style="font-weight: bold; height: 53px;">Address:
                        <br />
                            <asp:TextBox ID="address_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="49"></asp:TextBox>
                        </td>
                        <td colspan="2" align="center"
                            style="font-weight: bold; height: 53px;">Type:
                        <br />
                            <asp:TextBox ID="type_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="50"></asp:TextBox>
                        </td>
                        <td colspan="2" align="center"
                            style="font-weight: bold; height: 53px;">Amount of Resources in Warehouse:
                        <br />
                            <asp:TextBox ID="amountOfResources_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="51"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <table width="100%" cellspacing="10" bgcolor="Silver" border="3">
                    <tr>
                         <td colspan="2" align="left">
                   <asp:Label ID="sClient_L_ADD" runat="server" Text="Search For Resource" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%"></asp:Label>
                   </td>
                   <td colspan="4"></td>
   


            </tr>



            <tr>
                <td colspan="6" style="background-color: Gray" height="2px">
                </td>
            </tr>
            <tr>

                
                 <td style="font-weight: bold"; colspan="2" align="left">
                            <asp:Label ID="search_L" Text="Model" runat="server"></asp:Label>
                            <br />
                            <asp:TextBox ID="search_txt" runat="server" Width="177px" TabIndex="4" style="margin-bottom: 0px; Width: 100%;"></asp:TextBox>
                 </td>
                 <td colspan="1" align="left">
                     <asp:Button ID="ProductSearch_btn" Text="Search the Warehouse" runat="server"
                                 TabIndex="7" OnClick="ProductSearch_btn_Click" OnClientClick="grabtypes()" />
                        </td>
                                
                
                
            </tr>
            <tr>
                <td colspan="6" style="background-color: gray" height="10px">

                </td>
            </tr>
            <tr>
            <td align="center" colspan="10" width ="100%" >
                 <asp:GridView ID="gvResourceSearchresult" runat="server"
                                AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="gvResourceSearchresult_SelectedIndexChanged"
                                OnPageIndexChanging="gvResourceSearchresult_PageIndexChanging"
                                DataKeyNames="warehouse_product_location_id" AllowPaging="True" EnableTheming="False" AllowSorting="True" >
                                <Columns>
                                    <asp:BoundField DataField="warehouse_product_location_id" Visible="False" SortExpression="warehouse_product_location_id" />
                                    <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
                                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                    <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation Date" SortExpression="Experiation_Date" />
                                    <asp:BoundField DataField="product_qty" HeaderText="Quantity" SortExpression="product_qty" />
                                    <asp:BoundField DataField="Availability" HeaderText="Is it Avaiable?" SortExpression="Availability" />
                                </Columns>
                                <EditRowStyle BorderStyle="Inset" />
                                <RowStyle BorderColor="Black" BorderStyle="Inset" />
                                <SelectedRowStyle BorderColor="Red" BorderStyle="Outset" />
                            </asp:GridView>
               
            </td>
        </tr>
                                        <tr>
                         <td colspan="2" align="left">
                   <asp:Label ID="Label1" runat="server" Text="All resources in the warehouse" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%"></asp:Label>
                   </td>
                   <td colspan="4"></td>
            </tr>
            <tr>
                <td colspan="6" style="background-color: Gray" height="2px">
                </td>
            </tr>

                                        <tr>
                                            <td align="center" colspan="10" width ="100%" >
                                                <div style="width: 100%; height: 400px; overflow: scroll">
<asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="warehouse_ID" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
    <Columns>
                <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make"></asp:BoundField>
        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model"></asp:BoundField>
        <asp:BoundField DataField="product_type" HeaderText="product_type" SortExpression="product_type"></asp:BoundField>
        <asp:BoundField DataField="product_desc" HeaderText="product_desc" SortExpression="product_desc"></asp:BoundField>
        <asp:BoundField DataField="FEMA_Description" HeaderText="FEMA_Description" SortExpression="FEMA_Description"></asp:BoundField>
        <asp:BoundField DataField="qty_onhand" HeaderText="qty_onhand" SortExpression="qty_onhand"></asp:BoundField>
        <asp:BoundField DataField="qty_commit" HeaderText="qty_commit" SortExpression="qty_commit"></asp:BoundField>
        <asp:BoundField DataField="qty_order" HeaderText="qty_order" SortExpression="qty_order"></asp:BoundField>
        <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability"></asp:BoundField>
    </Columns>
                        </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SP_DMCS_Select_warehouseID_BY_Products_AND_Warehouse_Product_Location_WC" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="passWarehouseID_hf" Name="wareclause" PropertyName="Value" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        </td></tr>
    </table>
        
              
            </div>
        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="cpePetInfo_ADD" runat="server" CollapseControlID="warehouseViewInfoHead" CollapsedText="Show Warehouse Information" Enabled="True" ExpandControlID="warehouseViewInfoHead" ExpandedText="Hide Warehouse Information" TargetControlID="warehouseViewInfoBody" TextLabelID="warehouseInformationPanel_L" ClientIDMode="Static" >
        </asp:CollapsiblePanelExtender>
    </div>

        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->

     

        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->

        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------->


        <%-- <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    CancelControlID="btnCancel" OkControlID="btnOkay"
                    TargetControlID="typebtn" PopupControlID="Panel1"
                    PopupDragHandleControlID="PopupHeader" Drag="true"
                    BackgroundCssClass="ModalPopupBG" DropShadow="True" X="200" Y="300">
                </asp:ModalPopupExtender>
        <asp:Panel ID="Panel1" Style="display: none" runat="server" BorderColor="#333333" BackColor="Silver" BorderStyle="Solid" BorderWidth="3">
                    <div class="HellowWorldPopup">
                        <div class="PopupHeader" id="PopupHeader" align="center">Resource Types</div>
                        <div class="PopupBody">
                            <p>Choose multiple resource types</p>
                            <br />

                                        <div style=" OVERFLOW: auto; WIDTH: 100px; HEIGHT: 200px" align="center">
                                            <asp:CheckBoxList ID="Type"  onchange="iterateCheckBoxList()" runat="server" DataSourceID="sdsProductType" DataTextField="product_type" DataValueField="product_type" AutoPostBack="False">
                                            </asp:CheckBoxList>
                                            <asp:SqlDataSource ID="sdsProductType" runat="server" ConnectionString="Data Source=SGZ-USH447L0JM\SQLEXPRESS;Initial Catalog=disaster_management_DEV;Integrated Security=True" 
                                                SelectCommand = "SELECT DISTINCT [product_type] FROM products, warehouse_product_location WHERE products.product_id = warehouse_product_Location.product_id " ></asp:SqlDataSource>
                                        </div>

                        </div>
                        <div class="Controls">
                            <input id="btnOkay" type="button" value="Done" align="middle" />
                            <input id="btnCancel" type="button" value="Cancel" align="middle" />
                        </div>
                    </div>
                </asp:Panel>--%>

        <asp:HiddenField ID="warehouseInformation_L_hf" runat="server" Value="" ClientIDMode="Static" />
        <asp:HiddenField ID="warehouseInventory_L_hf" runat="server" Value="" ClientIDMode="Static" />


        <asp:HiddenField ID="passWarehouseID_hf" runat="server" Value="" ClientIDMode="Static" />
        <asp:HiddenField ID="passTypes_hf" runat="server" Value="" ClientIDMode="Static" />
        

</asp:Content>
