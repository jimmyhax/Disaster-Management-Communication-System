<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create_Evacuation_Area.aspx.cs" Inherits="DMCS.Moduals.Evacuation.Evacuation_Area.Create_Evacuation_Area" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKh3fc-devOsBnE8kjfX2AFq-bXaMK2b8&sensor=false"></script>
        
    <script type="text/javascript" id="mapScript">

        var map, latLng, marker, infoWindow;
        var geocoder = new google.maps.Geocoder();
        var gm = google.maps;
        var iw = new gm.InfoWindow({ maxWidth: 200 });
        var markers = [];
        var infoWindow;
        var mapOptions;
        //ready to accept values on locations to calculate map zoom
        var bounds = new google.maps.LatLngBounds();
        var disaster_bounds = new google.maps.LatLngBounds();

        var address;
        var city;
        var state;
        var zip;
        var county;
        var pet_lat;
        var pet_Long


        function initialize() {

            var polyOptions = {
                strokeColor: '#000000',
                strokeOpacity: 1.0,
                strokeWeight: 3, map: map
            };
            poly = new google.maps.Polygon(polyOptions);
            map = new google.maps.Map(document.getElementById('map_canvas'), {
                center: new google.maps.LatLng(41.5855168, -87.4960574),
                zoom: 10,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            var evtListnr = google.maps.event.addListener(map, "click", function (evt) {
                bounds.extend(evt.latLng);

                addLatLng(evt);
                if (poly.getPath().getLength() == 1) {
                    document.getElementById("Nlat_txt").value = evt.latLng.lat();
                    document.getElementById("Nlong_txt").value = evt.latLng.lng();
                }
                if (poly.getPath().getLength() == 2) {
                    document.getElementById("Slat_txt").value = evt.latLng.lat();
                    document.getElementById("Slong_txt").value = evt.latLng.lng();
                }
                if (poly.getPath().getLength() == 3) {
                    document.getElementById("Elat_txt").value = evt.latLng.lat();
                    document.getElementById("Elong_txt").value = evt.latLng.lng();
                }
                if (poly.getPath().getLength() == 4) {
                    document.getElementById("Wlat_txt").value = evt.latLng.lat();
                    document.getElementById("Wlong_txt").value = evt.latLng.lng();
                    google.maps.event.removeListener(evtListnr);
                    geocode(bounds.getCenter());
                    plotPriority();
                }
            });
            poly.binder = new MVCArrayBinder(poly.getPath());
            poly.setMap(map);
        }
        function getBounds()
        {
            bounds = new google.maps.LatLngBounds();
        var latlng1 = new google.maps.LatLng(document.getElementById("Nlat_txt").value, document.getElementById("Nlong_txt").value);
        var latlng2 = new google.maps.LatLng(document.getElementById("Slat_txt").value, document.getElementById("Slong_txt").value);
        var latlng3 = new google.maps.LatLng(document.getElementById("Elat_txt").value, document.getElementById("Elong_txt").value);
        var latlng4 = new google.maps.LatLng(document.getElementById("Wlat_txt").value, document.getElementById("Wlong_txt").value);
        bounds.extend(latlng1);
        bounds.extend(latlng2);
        bounds.extend(latlng3);
        bounds.extend(latlng4);
        }
        function addLatLng(event) {
            var path = poly.getPath();
            path.push(event.latLng);
            var len = path.getLength();
            var marker = new google.maps.Marker({
                position: event.latLng,
                title: '#' + len,
                map: map,
                draggable: true
            });
            google.maps.event.addListener(marker, 'dragend', function () {
                bounds.extend(marker.getPosition());
                if (len == 1) {
                    document.getElementById("Nlat_txt").value = marker.getPosition().lat();
                    document.getElementById("Nlong_txt").value = marker.getPosition().lng();
                    geocode(bounds.getCenter());
                }
                if (len == 2) {
                    document.getElementById("Slat_txt").value = marker.getPosition().lat();
                    document.getElementById("Slong_txt").value = marker.getPosition().lng();
                    geocode(bounds.getCenter());
                }
                if (len == 3) {
                    document.getElementById("Elat_txt").value = marker.getPosition().lat();
                    document.getElementById("Elong_txt").value = marker.getPosition().lng();
                    geocode(bounds.getCenter());
                }
                if (len == 4) {
                    document.getElementById("Wlat_txt").value = marker.getPosition().lat();
                    document.getElementById("Wlong_txt").value = marker.getPosition().lng();
                    geocode(bounds.getCenter());
                }
                lvl3PriorityCircle.setMap(null);
                lvl2PriorityCircle.setMap(null);
                lvl1PriorityCircle.setMap(null);
                plotPriority();
            });
            marker.bindTo('position', poly.binder, (len - 1).toString());
        }
        function plotPriority()
        {
            var ch_box = document.getElementById('Display_Priority_Lvls_CBox');
            var checkText = document.getElementById('Wlat_txt').value;
            if (ch_box.checked && checkText != '') {
                getBounds();
                var center = bounds.getCenter();
            var lvl1PriorityOptions = {
                strokeColor: '#FF0000',
                strokeOpacity: 0.15,
                strokeWeight: 1,
                fillColor: '#FF0000',
                fillOpacity: 0.15,
                map: map,
                center: center,
                radius: .1 * 1609.34,
                clickable: false
            };
            var lvl2PriorityOptions = {
                strokeColor: '#FA5858',
                strokeOpacity: 0.15,
                strokeWeight: 1,
                fillColor: '#FA5858',
                fillOpacity: 0.15,
                map: map,
                center: center,
                radius: .7 * 1609.34,
                clickable: false
            };
            var lvl3PriorityOptions = {
                strokeColor: '#F5A9A9',
                strokeOpacity: 0.15,
                strokeWeight: 3,
                fillColor: '#F5A9A9',
                fillOpacity: 0.15,
                map: map,
                center: center,
                radius: 1.5 * 1609.34,
                clickable: false
            };
            lvl3PriorityCircle = new google.maps.Circle(lvl3PriorityOptions);
            lvl2PriorityCircle = new google.maps.Circle(lvl2PriorityOptions);
            lvl1PriorityCircle = new google.maps.Circle(lvl1PriorityOptions);
            }
            else {
                lvl3PriorityCircle.setMap(null);
                lvl2PriorityCircle.setMap(null);
                lvl1PriorityCircle.setMap(null);
            }

        }
        //grabbing poly points from the text boxes
        function plotPoly()
        {
            var northLat = '<%=this.nLat%>';
            var northLong = '<%=this.nLong%>';
            var southLat = '<%=this.sLat%>';
            var southLong = '<%=this.sLong%>';
            var eastLat = '<%=this.eLat%>';
            var eastLong = '<%=this.eLong%>';
            var westLat = '<%=this.wLat%>';
            var westLong = '<%=this.wLong%>';
            var markers = [
                new google.maps.LatLng(northLat, northLong),
                new google.maps.LatLng(eastLat, eastLong),
                new google.maps.LatLng(southLat, southLong),
                new google.maps.LatLng(westLat, westLong)
            ];
            //declaring a new polygon with sttings
            var polygon = new google.maps.Polygon({ path: markers.concat(markers[0]), strokeColor: '#3f3', strokeWeight: 1, fillColor: '#00f' });
            //setting polygon on the map
            polygon.setMap(map);
            //checking how many markers there are (database default for desaster is 4 lat and long cords. for N-S-E-W)
            for (var i = 0; i < markers.length; i++) {
                disaster_bounds.extend(markers[i]);
            }
            //Finding the center of the polygon area and centering the map to that location
            if (markers.length > 1) {
                map.setCenter(disaster_bounds.getCenter());
                map.fitBounds(disaster_bounds);
            }
            else {
                map.setCenter(disaster_bounds.getCenter());
                map.setZoom(15);
            }


        }
        
        
        function geocode(position) {

            geocoder.geocode({ latLng: position }, function (responses) {
                var html = '';
                if (responses && responses.length > 0) {

                    var j = 0;

                    for (var i = 0; i < responses[j].address_components.length; i++) {
                        if (responses[j].address_components[i].types[0] == "street_number") {
                            //this is the object you are looking for
                            street_number = responses[j].address_components[i];
                        }
                        if (responses[j].address_components[i].types[0] == "route") {
                            //this is the object you are looking for
                            address = responses[j].address_components[i];
                        }
                        if (responses[j].address_components[i].types[0] == "administrative_area_level_2") {
                            //this is the object you are looking for
                            county = responses[j].address_components[i];
                        }
                        if (responses[j].address_components[i].types[0] == "locality") {
                            //this is the object you are looking for
                            city = responses[j].address_components[i];
                        }
                        if (responses[j].address_components[i].types[0] == "administrative_area_level_1") {
                            //this is the object you are looking for
                            state = responses[j].address_components[i];
                        }
                        if (responses[j].address_components[i].types[0] == "postal_code") {
                            //this is the object you are looking for
                            zip = responses[j].address_components[i];
                        }

                    }

                    address = street_number.long_name + " " + address.long_name;
                    city = city.long_name;
                    state = state.short_name;
                    zip = zip.long_name;
                    county = county.long_name;

                    document.getElementById('address_txt').value = address;
                    document.getElementById('city_txt').value = city;
                    document.getElementById('state_txt').value = state;
                    document.getElementById('zip_txt').value = zip;
                    document.getElementById('county_txt').value = county;
                    document.getElementById('LocationDiscription_txt').value = responses[0].formatted_address;

                } else {
                    html += 'Sorry but Google Maps could not determine the approximate postal address of this location.';
                }

                html += '<br /><br /><strong>Geo Co-ordinates</strong><hr />' + 'Latitude : ' + marker.getPosition().lat() + '<br/>Longitude: ' + marker.getPosition().lng();
                map.panTo(marker.getPosition());
            });
        }
        function MVCArrayBinder(mvcArray) {
            this.array_ = mvcArray;
        }
        MVCArrayBinder.prototype = new google.maps.MVCObject();
        MVCArrayBinder.prototype.get = function (key) {
            if (!isNaN(parseInt(key))) {
                return this.array_.getAt(parseInt(key));
            } else {
                this.array_.get(key);
            }
        }
        MVCArrayBinder.prototype.set = function (key, val) {
            if (!isNaN(parseInt(key))) {
                this.array_.setAt(parseInt(key), val);
            } else {
                this.array_.set(key, val);
            }
        }

    </script>
    <div style="width:100%;">
     <asp:Panel ID="Create_Evacuation_Area_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" width="100%" BackImageUrl="~/Images/panelheader1.jpg">
            <asp:Label ID="Create_Evacuation_Area_InfoHead_label" Style="padding: 10px" runat="server" Text="Report Evacuation Area Coordinates" Font-Size="Large"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="Create_Evacuation_Area_InfoBody" runat="server" Style="overflow: hidden;">

                <div style="margin: 0px; float:left; width:100%; height:auto; border-color: #EA5151; border-left-style: solid; border-left-width: medium; border-right-style: solid; border-right-width: medium; border-top-style: solid; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium;">
                    <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'; float: left;">
                        <tr>
                            <td style="padding: 5px 10px 5px 10px; background-color: #666666; width: 50%;">
                                <asp:Label ID="Label2" runat="server" Text="Disaster Associated?" Style="font-size: large; color: #E2E2E2"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlDisaster" runat="server"
                                    Height="24px" Width="240px"
                                    OnSelectedIndexChanged="ddlDisaster_SelectedIndexChanged"
                                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="disaster_name"
                                    DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Disaster</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                            </td>
                            <td style="padding: 5px 10px 5px 10px; background-color: #666666; width: 50%; padding: 5px 10px 5px 10px;">
                                <asp:Label ID="Error" runat="server" Text="" Style="font-size: large; color: #EA5151"></asp:Label>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Display Priority Levels: " Style="font-size: large; color: #E2E2E2"></asp:Label>
                                <input id="Display_Priority_Lvls_CBox" type="checkbox" OnClick="plotPriority();" Style="color: #E2E2E2;" />
                                

                            </td>
                        </tr>
                    </table>
                    <table width="100%"  bgcolor="Silver" border="3" style="float: left;">
 <tr>
                        <td colspan="2" align="center"
                            style="font-weight: bold; padding: 5px 10px 5px 10px;">Address:
                        <br />
                            <asp:TextBox ID="address_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="48"></asp:TextBox>
                        </td>
                        <td colspan="2" align="center"
                            style="font-weight: bold; padding: 5px 10px 5px 10px;">City:
                        <br />
                            <asp:TextBox ID="city_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="49"></asp:TextBox>
                        </td>
                        <td colspan="2" align="center"
                            style="font-weight: bold; padding: 5px 10px 5px 10px;">State:
                        <br />
                            <asp:TextBox ID="state_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="50"></asp:TextBox>
                        </td>
                        <td colspan="2" align="center"
                            style="font-weight: bold; padding: 5px 10px 5px 10px;">Zip:
                        <br />
                            <asp:TextBox ID="zip_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="51"></asp:TextBox>
                        </td>
                        <td colspan="2" align="center"
                            style="font-weight: bold; padding: 5px 10px 5px 10px;">County:
                        <br />
                            <asp:TextBox ID="county_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="52"></asp:TextBox>
                        </td>
                    </tr>
                    </table>
                    <table width="100%" height="auto" bgcolor="Silver" border="3" align="center" style="float: left;">
                       <tr>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">N lat:
                        <br />
                            <asp:TextBox ID="Nlat_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="53"></asp:TextBox>
                        </td>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">N Long:
                        <br />
                            <asp:TextBox ID="Nlong_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="54"></asp:TextBox>
                        </td>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">S lat:
                        <br />
                            <asp:TextBox ID="Slat_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="53"></asp:TextBox>
                        </td>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">S Long:
                        <br />
                            <asp:TextBox ID="Slong_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="54"></asp:TextBox>
                        </td>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">E lat:
                        <br />
                            <asp:TextBox ID="Elat_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="53"></asp:TextBox>
                        </td>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">E Long:
                        <br />
                            <asp:TextBox ID="Elong_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="54"></asp:TextBox>
                        </td>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">W lat:
                        <br />
                            <asp:TextBox ID="Wlat_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="53"></asp:TextBox>
                        </td>
                        <td colspan="1.25" align="center"
                            style="font-weight: bold; height: 53px; padding: 5px 10px 5px 10px;">W Long:
                        <br />
                            <asp:TextBox ID="Wlong_txt" runat="server" Width="80px" ClientIDMode="Static" TabIndex="54"></asp:TextBox>
                        </td>

                    </tr>
                       <tr>
                        <td colspan="10" align="center"
                            style="font-weight: bold; padding: 5px 10px 5px 10px;">
                            <asp:Label ID="Label9" runat="server" Text="Location Description:" ></asp:Label>
                            <br />
                            <asp:TextBox ID="LocationDiscription_txt" runat="server" Width="426px" ClientIDMode="Static"  Height="105px" TextMode="MultiLine" TabIndex="56"></asp:TextBox>
                        </td>
                        
                    </tr>
                    </table>
                </div>

                <div id="map_canvas" style="margin: 0px; width: 100%; height: 300px; border-color: #666666 #EA5151 #EA5151 #EA5151; border-width: medium; border-style: solid;"></div>


                <table width="100%" bgcolor="Silver" border="3">
                    <tr>
                        <td colspan="2" style="padding: 0px; margin:0px;" width="100%">
                            <asp:Button ID="Insert" runat="server" Text="Send Evacuation_Area" Style="color: #E2E2E2; background-color: #EA5151; width: 100%; height: 28px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px;" CausesValidation="False" OnClick="Insert_Click" />
                        </td>
                    </tr>
                </table>


        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="cpeEvacuation_AreaInfo" runat="server"
            CollapseControlID="Create_Evacuation_Area_InfoHead"
            CollapsedText="Place An Evacuation_Area" Enabled="True"
            ExpandControlID="Create_Evacuation_Area_InfoHead"
            ExpandedText="Place An Evacuation_Area"
            TargetControlID="Create_Evacuation_Area_InfoBody"
            TextLabelID="Create_Evacuation_Area_InfoHead_label">
        </asp:CollapsiblePanelExtender>
                    </div>
        <asp:ToolkitScriptManager runat="server" ID="smtk"></asp:ToolkitScriptManager>

</asp:Content>
