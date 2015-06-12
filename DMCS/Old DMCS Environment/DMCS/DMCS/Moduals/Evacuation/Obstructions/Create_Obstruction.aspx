<%@ Page MaintainScrollPositionOnPostback="True" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="DMCS.Moduals.Evacuation.Obstructions.Create_Obstruction" Title="Disaster Location" Codebehind="Create_Obstruction.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>Polygon Arrays</title>
        <style>
            html, body, #map-canvas {
                height: 100%;
                margin: 0px;
                padding: 0px;
            }
        </style>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script>
            // This example creates a simple polygon representing the Bermuda Triangle.
            // When the user clicks on the polygon an info window opens, showing
            // information about the polygon's coordinates.

            var map;
            var infoWindow;
            var bounds = new google.maps.LatLngBounds();


            function initialize() {
                var mapOptions = {
                    zoom: 5,
                    center: new google.maps.LatLng(40.588189, -87.474003),
                    mapTypeId: google.maps.MapTypeId.TERRAIN
                };

                map = new google.maps.Map(document.getElementById('map-canvas'),
                    mapOptions);
                var lat = '<%=Lat%>';
                var lng = '<%=Lng%>';
                if (lat != 0 || lng != 0)
                {
                    var image = '<%=imageUrl%>';
                    var myLatLng = new google.maps.LatLng(lat, lng);
                    var Obstruction = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        icon: image
                    });
                    map.setZoom(17);
                    map.panTo(Obstruction.position);

                }
                else {
                    var image = '<%=imageUrl%>';
                    var myLatLng = new google.maps.LatLng(39.588189, -87.474003);
                    var Obstruction = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        icon: image
                    });
                    map.setZoom(7);
                    map.panTo(curmarker.position);
                }

            }


            //grabbing poly points from the text boxes
            function plotPoly() {
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
                
                ////checking how many markers there are (database default for desaster is 4 lat and long cords. for N-S-E-W)
                //for (var i = 0; i < markers.length; i++) {
                //    bounds.extend(markers[i]);
                //}
                ////Finding the center of the polygon area and centering the map to that location
                //if (markers.length > 1) {
                //    map.setCenter(bounds.getCenter());
                //    map.fitBounds(bounds);
                //}
                //else {
                //    map.setCenter(bounds.getCenter());
                //    map.setZoom(15);

                //}
               
            }

            //google.maps.event.addDomListener(window, 'load', initialize);

        </script>

    </head>
    <body>









        <asp:Panel ID="Create_Obstruction_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
            <asp:Label ID="Create_Obstruction_InfoHead_label" Style="padding: 10px" runat="server" Text="Report An Obstruction" Font-Size="Large"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="Create_Obstruction_InfoBody" runat="server" Style="overflow: hidden;">
            <div style="width: 100%; height: auto">
                <div style="margin: 0px; width: 60%; float: left; border-color: #EA5151; border-left-style: solid; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium;">
                    <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'; float: left;">
                        <tr>
                            <td style="padding: 5px 10px 5px 10px; background-color: #666666; width: 50%">
                                <asp:Label ID="Label1" runat="server" Text="Disaster Associated?" Style="font-size: large; color: #E2E2E2"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlDisaster" runat="server"
                                    Height="24px" Width="240px"
                                    OnSelectedIndexChanged="ddlDisaster_SelectedIndexChanged"
                                    AutoPostBack="false" DataSourceID="SqlDataSource1" DataTextField="disaster_name"
                                    DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Disaster</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                            </td>
                            <td style="padding: 5px 10px 5px 10px; background-color: #666666; width: 50%">

                                <asp:Label ID="ERROR" runat="server" ForeColor="Red" Text=""></asp:Label>

                            </td>
                        </tr>
                    </table>
                    <table width="100%" height="100%" bgcolor="Silver" border="3" style="float: left;">
                        <tr>
                            <td style="padding: 10px;">
                                <asp:Label ID="Label3" runat="server" Style="font-size: large;" Text="Select The Obstruction Image"></asp:Label><br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <table width="100%" height="auto" bgcolor="Silver" border="3" align="center" style="float: left;">
                        <tr>

                            <td style="padding:10px" align="left">
                                <asp:Image ID="Preview_ImageBox"  runat="server" Width="300px" ImageUrl="~/Moduals/Evacuation/Obstructions/Images/Image_Placeholder.jpg" Height="200px"></asp:Image>
                    
                            </td>
                    <td width="30%" align="left" valign="top" style="padding-left: 30px; padding-right: 15px; font-size: large;">
                                                <asp:Label ID="Type_Lable" runat="server" Text="Type:"></asp:Label><br />
                        <asp:TextBox ID="Type_TextBox" runat="server" Text=""></asp:TextBox><br />
<%--                        <asp:Label ID="Severity_Lable" runat="server" Text="Severity:"></asp:Label><br />
                        <asp:TextBox ID="Severity_TextBox" runat="server" Text=""></asp:TextBox>--%>
                        <br />
                        <asp:Label ID="Date_Reported_Lable" runat="server" Text="Date Reported:"></asp:Label><br />
                        <asp:TextBox ID="Date_Reported_TextBox" runat="server" Text="" Width="180px"></asp:TextBox>
                        <br />
                        <%--<asp:Label ID="Expected_Recovery_Date_Lable" runat="server" Text="Expected Recovery Date:"></asp:Label><br />
                        <asp:TextBox ID="Expected_Recovery_Date_TextBox" runat="server" Text="" Width="180px"></asp:TextBox>
                             --%>       
                    </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center" style="padding: 0;">
                                <asp:Label ID="Obstruction_Message_Lable" runat="server" Text="Please discribe the scene:" Style=" font-size: large;"></asp:Label><br />
                                <asp:TextBox ID="TextBox1" runat="server" Height="150px" TextMode="MultiLine" Width="97%"></asp:TextBox>
                            
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="map-canvas" style="margin: 0px; width: auto; height: 552px; border-color: #EA5151; border-left-style: none; border-left-width: medium; border-right-style: solid; border-right-width: medium; border-top-style: solid; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium;"></div>
                <table width="100%" height="auto" bgcolor="Silver" border="3">
                    <tr>
                        <td colspan="2" style="padding: 0px;" width="100%">
                            <asp:Button ID="Preview_btn" runat="server" Text="Preview and Review the Obstruction Submission" OnClick="PreviewImage_Click" Style="color: #E2E2E2; background-color: #EA5151; width: 100%; height: 28px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px;" OnClientClick="createObstruction()" />
                            <br />
                            <asp:Button ID="Submit_Obstruction_btn" runat="server" Text="Submit Obstruction" OnClick="Submit_Obstruction" Style="color: #E2E2E2; background-color: #EA5151; width: 100%; height: 28px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px;" Visible="False" />
                        </td>
                    </tr>
                </table>

            </div>
        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="cpeObstructionInfo" runat="server"
            CollapseControlID="Create_Obstruction_InfoHead"
            CollapsedText="Submit An Obstruction" Enabled="True"
            ExpandControlID="Create_Obstruction_InfoHead"
            ExpandedText="Submit An Obstruction"
            TargetControlID="Create_Obstruction_InfoBody"
            TextLabelID="Create_Obstruction_InfoHead_label">
        </asp:CollapsiblePanelExtender>

        <asp:ToolkitScriptManager runat="server" ID="smtk"></asp:ToolkitScriptManager>


    </body>
    </html>
</asp:Content>

