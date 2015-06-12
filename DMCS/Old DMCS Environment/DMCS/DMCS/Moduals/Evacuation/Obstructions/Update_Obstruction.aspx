<%@ Page MaintainScrollPositionOnPostback="True" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="DMCS.Moduals.Evacuation.Obstructions.Update_Obstruction" Title="Disaster Location" Codebehind="Update_Obstruction.aspx.cs" %>


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

            function initialize() {
                var mapOptions = {
                    zoom: 5,
                    center: new google.maps.LatLng(41.588189, -87.474003),
                    mapTypeId: google.maps.MapTypeId.TERRAIN
                };

                var bermudaTriangle;

                map = new google.maps.Map(document.getElementById('map-canvas'),
                    mapOptions);

                // Define the LatLng coordinates for the polygon.
                var triangleCoords = [
                new google.maps.LatLng(-84.81986, 39.16139), new google.maps.LatLng(-84.81997, 39.18693), new google.maps.LatLng(-84.82011, 39.20367), new google.maps.LatLng(-84.8201, 39.21691), new google.maps.LatLng(-84.82011, 39.21769), new google.maps.LatLng(-84.82015, 39.23031), new google.maps.LatLng(-84.82008, 39.24556), new google.maps.LatLng(-84.81983, 39.24848), new google.maps.LatLng(-84.8201, 39.2516), new google.maps.LatLng(-84.81998, 39.25631), new google.maps.LatLng(-84.81999, 39.25815), new google.maps.LatLng(-84.81993, 39.26126), new google.maps.LatLng(-84.81987, 39.26378), new google.maps.LatLng(-84.81971, 39.26773), new google.maps.LatLng(-84.81962, 39.27009), new google.maps.LatLng(-84.81965, 39.27302), new google.maps.LatLng(-84.81958, 39.27641), new google.maps.LatLng(-84.81944, 39.28443), new google.maps.LatLng(-84.81928, 39.29921), new google.maps.LatLng(-84.81945, 39.30515), new google.maps.LatLng(-84.81959, 39.30521), new google.maps.LatLng(-84.83603, 39.30539), new google.maps.LatLng(-84.84431, 39.30555), new google.maps.LatLng(-84.86945, 39.30585), new google.maps.LatLng(-84.90595, 39.30608), new google.maps.LatLng(-84.91047, 39.30587), new google.maps.LatLng(-84.91146, 39.3059), new google.maps.LatLng(-84.92425, 39.30595), new google.maps.LatLng(-84.93829, 39.30611), new google.maps.LatLng(-84.95822, 39.30633), new google.maps.LatLng(-84.97518, 39.30662), new google.maps.LatLng(-84.97843, 39.30664), new google.maps.LatLng(-84.98459, 39.30668), new google.maps.LatLng(-84.99068, 39.30675), new google.maps.LatLng(-84.99995, 39.30678), new google.maps.LatLng(-85.00742, 39.30683), new google.maps.LatLng(-85.01724, 39.30692), new google.maps.LatLng(-85.02236, 39.30696), new google.maps.LatLng(-85.0304, 39.307), new google.maps.LatLng(-85.03363, 39.30704), new google.maps.LatLng(-85.04185, 39.30709), new google.maps.LatLng(-85.04931, 39.30715), new google.maps.LatLng(-85.05337, 39.30714), new google.maps.LatLng(-85.05752, 39.30721), new google.maps.LatLng(-85.06173, 39.3072), new google.maps.LatLng(-85.06538, 39.3072), new google.maps.LatLng(-85.06557, 39.30723), new google.maps.LatLng(-85.06561, 39.30705), new google.maps.LatLng(-85.07021, 39.28379), new google.maps.LatLng(-85.07108, 39.27869), new google.maps.LatLng(-85.07472, 39.25935), new google.maps.LatLng(-85.07608, 39.25266), new google.maps.LatLng(-85.07765, 39.24439), new google.maps.LatLng(-85.07842, 39.24037), new google.maps.LatLng(-85.07939, 39.23536), new google.maps.LatLng(-85.08041, 39.22986), new google.maps.LatLng(-85.08167, 39.22333), new google.maps.LatLng(-85.08226, 39.22014), new google.maps.LatLng(-85.08822, 39.188), new google.maps.LatLng(-85.08991, 39.17861), new google.maps.LatLng(-85.09061, 39.17498), new google.maps.LatLng(-85.09343, 39.15897), new google.maps.LatLng(-85.09517, 39.14931), new google.maps.LatLng(-85.09867, 39.13057), new google.maps.LatLng(-85.09988, 39.12381), new google.maps.LatLng(-85.10132, 39.11614), new google.maps.LatLng(-85.10262, 39.10871), new google.maps.LatLng(-85.10423, 39.09986), new google.maps.LatLng(-85.10969, 39.06916), new google.maps.LatLng(-85.11707, 39.02948), new google.maps.LatLng(-85.12486, 38.98885), new google.maps.LatLng(-85.12626, 38.98244), new google.maps.LatLng(-85.13106, 38.95562), new google.maps.LatLng(-85.13251, 38.94805), new google.maps.LatLng(-85.12495, 38.95094), new google.maps.LatLng(-85.11977, 38.94701), new google.maps.LatLng(-85.10825, 38.93937), new google.maps.LatLng(-85.09433, 38.93773), new google.maps.LatLng(-85.07956, 38.95128), new google.maps.LatLng(-85.06462, 38.95419), new google.maps.LatLng(-85.058, 38.95577), new google.maps.LatLng(-85.04879, 38.96247), new google.maps.LatLng(-85.03569, 38.97631), new google.maps.LatLng(-85.01692, 38.98234), new google.maps.LatLng(-85.00089, 38.98293), new google.maps.LatLng(-84.99777, 38.99673), new google.maps.LatLng(-84.98665, 38.99532), new google.maps.LatLng(-84.98261, 38.99644), new google.maps.LatLng(-84.97163, 38.99309), new google.maps.LatLng(-84.96186, 38.99498), new google.maps.LatLng(-84.95273, 38.9958), new google.maps.LatLng(-84.95307, 38.99924), new google.maps.LatLng(-84.95269, 38.99925), new google.maps.LatLng(-84.94633, 38.9986), new google.maps.LatLng(-84.94407, 39.00019), new google.maps.LatLng(-84.93788, 39.0055), new google.maps.LatLng(-84.92369, 39.01488), new google.maps.LatLng(-84.9107, 39.01844), new google.maps.LatLng(-84.89574, 39.01521), new google.maps.LatLng(-84.889, 39.02254), new google.maps.LatLng(-84.87786, 39.031), new google.maps.LatLng(-84.87838, 39.03121), new google.maps.LatLng(-84.88343, 39.03477), new google.maps.LatLng(-84.88791, 39.0394), new google.maps.LatLng(-84.88976, 39.04217), new google.maps.LatLng(-84.89284, 39.04659), new google.maps.LatLng(-84.89656, 39.05184), new google.maps.LatLng(-84.89754, 39.05522), new google.maps.LatLng(-84.89739, 39.05727), new google.maps.LatLng(-84.89663, 39.05807), new google.maps.LatLng(-84.89608, 39.05959), new google.maps.LatLng(-84.88887, 39.06638), new google.maps.LatLng(-84.88583, 39.06779), new google.maps.LatLng(-84.87219, 39.07388), new google.maps.LatLng(-84.86953, 39.07457), new google.maps.LatLng(-84.86245, 39.07739), new google.maps.LatLng(-84.85763, 39.08089), new google.maps.LatLng(-84.85528, 39.08345), new google.maps.LatLng(-84.8519, 39.08632), new google.maps.LatLng(-84.84743, 39.08961), new google.maps.LatLng(-84.84428, 39.09209), new google.maps.LatLng(-84.83835, 39.09654), new google.maps.LatLng(-84.8361, 39.098), new google.maps.LatLng(-84.83401, 39.09962), new google.maps.LatLng(-84.83228, 39.10111), new google.maps.LatLng(-84.82646, 39.10407), new google.maps.LatLng(-84.82052, 39.1054), new google.maps.LatLng(-84.82016, 39.10548), new google.maps.LatLng(-84.82016, 39.10561), new google.maps.LatLng(-84.82011, 39.11895), new google.maps.LatLng(-84.82017, 39.12219), new google.maps.LatLng(-84.82005, 39.13258), new google.maps.LatLng(-84.82026, 39.14951), new google.maps.LatLng(-84.82026, 39.15426), new google.maps.LatLng(-84.81981, 39.15853)

                ];

                // Construct the polygon.
                bermudaTriangle = new google.maps.Polygon({
                    paths: triangleCoords,
                    strokeColor: '#FF0000',
                    strokeOpacity: 0.8,
                    strokeWeight: 3,
                    fillColor: '#FF0000',
                    fillOpacity: 0.35
                });

                bermudaTriangle.setMap(map);

                // Add a listener for the click event.
                google.maps.event.addListener(bermudaTriangle, 'click', showArrays);

                infoWindow = new google.maps.InfoWindow();
            }

            /** @this {google.maps.Polygon} */
            function showArrays(event) {

                // Since this polygon has only one path, we can call getPath()
                // to return the MVCArray of LatLngs.
                var vertices = this.getPath();

                var contentString = '<b>Bermuda Triangle polygon</b><br>' +
                    'Clicked location: <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
                    '<br>';

                // Iterate over the vertices.
                for (var i = 0; i < vertices.getLength() ; i++) {
                    var xy = vertices.getAt(i);
                    contentString += '<br>' + 'Coordinate ' + i + ':<br>' + xy.lat() + ',' +
                        xy.lng();
                }

                // Replace the info window's content and position.
                infoWindow.setContent(contentString);
                infoWindow.setPosition(event.latLng);

                infoWindow.open(map);
            }

            google.maps.event.addDomListener(window, 'load', initialize);

        </script>

    </head>
    <body>

        <table width="100%" bgcolor="Silver" border="3">
            <tr>
                <td width="20%" height="50px" style="border-style: none" align="right">
                    <asp:Label ID="Label2" runat="server" Text="Is this alert associated with a Disaster?: " Font-Bold="True" ForeColor="Black"></asp:Label>
                    <asp:DropDownList ID="ddlDisaster" runat="server"
                        Height="24px" Width="240px"
                        OnSelectedIndexChanged="ddlDisaster_SelectedIndexChanged"
                        AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                </td>
                <td width="80%" style="border-style: none" align="Center">
                    <asp:Label ID="Label1" runat="server" Text="Update An Obstruction" Font-Bold="True" Font-Size="20pt"></asp:Label>
                </td>
            </tr>
        </table>

        <div width="60%">
            <table width="100%" bgcolor="Silver" border="3">
                <tr>
                    <td width="50%" bgcolor="Silver" style="border-style: none">
                        
                    </td>
                    <td width="50%">
                        <div id="map-canvas" style="border-style: solid solid solid none; border-width: medium; border-color: #FF0000; overflow: auto; font-size: 11px; color: #000; float: left; width: 100%; height: 500px"></div>
                    </td>
                </tr>
            </table>
        </div>



    </body>
    </html>
</asp:Content>

