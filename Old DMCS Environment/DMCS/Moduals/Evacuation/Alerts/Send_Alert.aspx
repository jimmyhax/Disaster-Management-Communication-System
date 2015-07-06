<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" ValidateRequest="False" AutoEventWireup="true" CodeBehind="Send_Alert.aspx.cs" Inherits="DMCS.Moduals.Evacuation.Alerts.Send_Alert" %>

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

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKh3fc-devOsBnE8kjfX2AFq-bXaMK2b8&sensor=false"></script>
        <script>


            var IN_Jasper_Selected = false;
            var IN_Lake_Selected = false;
            var IN_LaPorte_Selected = false;
            var IN_Newton_Selected = false;
            var IN_Porter_Selected = false;


            var map;
            var infoWindow;
            var count = 0;
            var county_list = '';
            var bounds = new google.maps.LatLngBounds();



            function initialize() {
                var mapOptions = {
                    zoom: 5,
                    center: new google.maps.LatLng(41.588189, -87.474003),
                    mapTypeId: google.maps.MapTypeId.TERRAIN
                };


                map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);

                layer = new google.maps.FusionTablesLayer({
                    query: {
                        select: 'geometry',
                        from: '0IMZAFCwR-t7jZnVzaW9udGFibGVzOjIxMDIxNw',
                        where: '\'State Abbr.\' IN (\'IL\', \'IN\')'
                    },
                    styles: [{
                        polygonOptions: {
                            strokeColor: '#666666', strokeOpacity: 0.8, strokeWeight: 3, fillColor: '#666666', fillOpacity: 0.35
                        }
                    }]
                });
                layer.setMap(map);

                var IN_JasperCoords = [new google.maps.LatLng(41.1795, -86.93007), new google.maps.LatLng(41.18009, -86.93003), new google.maps.LatLng(41.18191, -86.93001), new google.maps.LatLng(41.18522, -86.93005), new google.maps.LatLng(41.19402, -86.92998), new google.maps.LatLng(41.19767, -86.92995), new google.maps.LatLng(41.20116, -86.9299), new google.maps.LatLng(41.20809, -86.92988), new google.maps.LatLng(41.20815, -86.92988), new google.maps.LatLng(41.20858, -86.92988), new google.maps.LatLng(41.20892, -86.92987), new google.maps.LatLng(41.21317, -86.92984), new google.maps.LatLng(41.2199, -86.92975), new google.maps.LatLng(41.22258, -86.92972), new google.maps.LatLng(41.22278, -86.92971), new google.maps.LatLng(41.22303, -86.92973), new google.maps.LatLng(41.22793, -86.92967), new google.maps.LatLng(41.23017, -86.92966), new google.maps.LatLng(41.2344, -86.92978), new google.maps.LatLng(41.23666, -86.93005), new google.maps.LatLng(41.23677, -86.93007), new google.maps.LatLng(41.2368, -86.93008), new google.maps.LatLng(41.23638, -86.93054), new google.maps.LatLng(41.22666, -86.94899), new google.maps.LatLng(41.21964, -86.96895), new google.maps.LatLng(41.2257, -86.98187), new google.maps.LatLng(41.23605, -87.0009), new google.maps.LatLng(41.24168, -87.01234), new google.maps.LatLng(41.24952, -87.02567), new google.maps.LatLng(41.25803, -87.04009), new google.maps.LatLng(41.26256, -87.04793), new google.maps.LatLng(41.26987, -87.06097), new google.maps.LatLng(41.27186, -87.06815), new google.maps.LatLng(41.2736, -87.07476), new google.maps.LatLng(41.27825, -87.09218), new google.maps.LatLng(41.28124, -87.10329), new google.maps.LatLng(41.2842, -87.1144), new google.maps.LatLng(41.28636, -87.12212), new google.maps.LatLng(41.28463, -87.13597), new google.maps.LatLng(41.28201, -87.14341), new google.maps.LatLng(41.27919, -87.15137), new google.maps.LatLng(41.27686, -87.15803), new google.maps.LatLng(41.27368, -87.16706), new google.maps.LatLng(41.27071, -87.17584), new google.maps.LatLng(41.2689, -87.18119), new google.maps.LatLng(41.26636, -87.18897), new google.maps.LatLng(41.2621, -87.19614), new google.maps.LatLng(41.24233, -87.21852), new google.maps.LatLng(41.24203, -87.21886), new google.maps.LatLng(41.24202, -87.21886), new google.maps.LatLng(41.23706, -87.22454), new google.maps.LatLng(41.23548, -87.22646), new google.maps.LatLng(41.23516, -87.22742), new google.maps.LatLng(41.23396, -87.23096), new google.maps.LatLng(41.23341, -87.23262), new google.maps.LatLng(41.23238, -87.23569), new google.maps.LatLng(41.2317, -87.23769), new google.maps.LatLng(41.2311, -87.23946), new google.maps.LatLng(41.23061, -87.2409), new google.maps.LatLng(41.23008, -87.24247), new google.maps.LatLng(41.23008, -87.24247), new google.maps.LatLng(41.22935, -87.24461), new google.maps.LatLng(41.22822, -87.24798), new google.maps.LatLng(41.22786, -87.24902), new google.maps.LatLng(41.22755, -87.24994), new google.maps.LatLng(41.226, -87.25426), new google.maps.LatLng(41.22515, -87.25674), new google.maps.LatLng(41.22437, -87.25901), new google.maps.LatLng(41.22325, -87.26227), new google.maps.LatLng(41.22274, -87.26375), new google.maps.LatLng(41.22223, -87.26528), new google.maps.LatLng(41.22148, -87.26745), new google.maps.LatLng(41.22078, -87.26951), new google.maps.LatLng(41.21942, -87.27348), new google.maps.LatLng(41.21884, -87.27517), new google.maps.LatLng(41.2186, -87.27587), new google.maps.LatLng(41.21859, -87.27588), new google.maps.LatLng(41.2184, -87.27587), new google.maps.LatLng(41.21434, -87.27586), new google.maps.LatLng(41.19662, -87.27573), new google.maps.LatLng(41.17851, -87.27571), new google.maps.LatLng(41.17542, -87.27586), new google.maps.LatLng(41.17361, -87.27552), new google.maps.LatLng(41.16751, -87.27568), new google.maps.LatLng(41.15891, -87.27572), new google.maps.LatLng(41.15117, -87.27569), new google.maps.LatLng(41.14611, -87.27571), new google.maps.LatLng(41.13698, -87.27568), new google.maps.LatLng(41.11535, -87.27579), new google.maps.LatLng(41.10222, -87.27586), new google.maps.LatLng(41.0884, -87.27589), new google.maps.LatLng(41.05972, -87.27596), new google.maps.LatLng(41.04201, -87.27601), new google.maps.LatLng(41.02427, -87.27606), new google.maps.LatLng(41.00703, -87.27611), new google.maps.LatLng(40.97599, -87.27639), new google.maps.LatLng(40.92556, -87.27655), new google.maps.LatLng(40.91151, -87.27218), new google.maps.LatLng(40.87678, -87.26802), new google.maps.LatLng(40.85952, -87.26795), new google.maps.LatLng(40.84251, -87.26786), new google.maps.LatLng(40.80918, -87.26763), new google.maps.LatLng(40.75004, -87.26724), new google.maps.LatLng(40.73658, -87.2673), new google.maps.LatLng(40.73659, -87.26462), new google.maps.LatLng(40.73659, -87.26037), new google.maps.LatLng(40.7366, -87.25198), new google.maps.LatLng(40.73661, -87.24289), new google.maps.LatLng(40.73664, -87.23538), new google.maps.LatLng(40.73664, -87.23226), new google.maps.LatLng(40.73665, -87.2276), new google.maps.LatLng(40.73665, -87.21904), new google.maps.LatLng(40.73666, -87.21478), new google.maps.LatLng(40.73668, -87.20912), new google.maps.LatLng(40.7367, -87.19665), new google.maps.LatLng(40.73671, -87.19201), new google.maps.LatLng(40.7367, -87.18542), new google.maps.LatLng(40.73672, -87.17607), new google.maps.LatLng(40.7367, -87.17092), new google.maps.LatLng(40.7367, -87.16284), new google.maps.LatLng(40.73671, -87.1596), new google.maps.LatLng(40.7367, -87.15365), new google.maps.LatLng(40.73668, -87.14887), new google.maps.LatLng(40.73667, -87.14484), new google.maps.LatLng(40.73666, -87.13507), new google.maps.LatLng(40.73665, -87.13086), new google.maps.LatLng(40.73665, -87.1183), new google.maps.LatLng(40.73664, -87.11569), new google.maps.LatLng(40.7366, -87.10721), new google.maps.LatLng(40.73654, -87.09869), new google.maps.LatLng(40.73654, -87.09839), new google.maps.LatLng(40.73666, -87.09839), new google.maps.LatLng(40.74423, -87.09849), new google.maps.LatLng(40.75778, -87.09865), new google.maps.LatLng(40.76581, -87.09869), new google.maps.LatLng(40.7801, -87.09926), new google.maps.LatLng(40.7944, -87.09957), new google.maps.LatLng(40.80631, -87.09979), new google.maps.LatLng(40.81451, -87.09978), new google.maps.LatLng(40.82363, -87.09962), new google.maps.LatLng(40.83723, -87.09979), new google.maps.LatLng(40.8377, -87.08072), new google.maps.LatLng(40.83772, -87.07208), new google.maps.LatLng(40.83795, -87.04275), new google.maps.LatLng(40.83794, -87.0295), new google.maps.LatLng(40.83793, -87.00928), new google.maps.LatLng(40.83792, -86.98644), new google.maps.LatLng(40.85731, -86.98691), new google.maps.LatLng(40.86965, -86.98709), new google.maps.LatLng(40.87691, -86.98714), new google.maps.LatLng(40.89244, -86.98729), new google.maps.LatLng(40.89755, -86.98734), new google.maps.LatLng(40.9055, -86.98739), new google.maps.LatLng(40.91219, -86.98327), new google.maps.LatLng(40.91217, -86.97296), new google.maps.LatLng(40.91221, -86.95125), new google.maps.LatLng(40.91242, -86.93076), new google.maps.LatLng(40.91789, -86.9308), new google.maps.LatLng(40.92702, -86.93087), new google.maps.LatLng(40.94147, -86.93094), new google.maps.LatLng(40.95407, -86.93099), new google.maps.LatLng(40.96406, -86.93099), new google.maps.LatLng(40.97007, -86.93098), new google.maps.LatLng(40.97949, -86.93093), new google.maps.LatLng(40.98592, -86.93091), new google.maps.LatLng(40.99187, -86.93091), new google.maps.LatLng(40.99994, -86.93086), new google.maps.LatLng(41.01265, -86.93078), new google.maps.LatLng(41.01993, -86.93075), new google.maps.LatLng(41.02674, -86.93075), new google.maps.LatLng(41.03587, -86.93071), new google.maps.LatLng(41.04194, -86.93071), new google.maps.LatLng(41.05065, -86.93063), new google.maps.LatLng(41.05811, -86.93061), new google.maps.LatLng(41.06422, -86.93062), new google.maps.LatLng(41.08551, -86.93057), new google.maps.LatLng(41.09952, -86.93051), new google.maps.LatLng(41.10765, -86.93048), new google.maps.LatLng(41.12084, -86.93048), new google.maps.LatLng(41.1218, -86.93047), new google.maps.LatLng(41.12857, -86.93034), new google.maps.LatLng(41.15832, -86.93037)];
                var IN_LakeCoords = [new google.maps.LatLng(41.37778, -87.52626), new google.maps.LatLng(41.37499, -87.52629), new google.maps.LatLng(41.36767, -87.52635), new google.maps.LatLng(41.35089, -87.52648), new google.maps.LatLng(41.33857, -87.52656), new google.maps.LatLng(41.32709, -87.52666), new google.maps.LatLng(41.32625, -87.52667), new google.maps.LatLng(41.31422, -87.52672), new google.maps.LatLng(41.30832, -87.52676), new google.maps.LatLng(41.3053, -87.52671), new google.maps.LatLng(41.29817, -87.52673), new google.maps.LatLng(41.29805, -87.52673), new google.maps.LatLng(41.28804, -87.52674), new google.maps.LatLng(41.28266, -87.52674), new google.maps.LatLng(41.27531, -87.52671), new google.maps.LatLng(41.27246, -87.52669), new google.maps.LatLng(41.26797, -87.52667), new google.maps.LatLng(41.2639, -87.52665), new google.maps.LatLng(41.26104, -87.52663), new google.maps.LatLng(41.2595, -87.52663), new google.maps.LatLng(41.25485, -87.5266), new google.maps.LatLng(41.25329, -87.5266), new google.maps.LatLng(41.25004, -87.52658), new google.maps.LatLng(41.24465, -87.52655), new google.maps.LatLng(41.23853, -87.52652), new google.maps.LatLng(41.23041, -87.52652), new google.maps.LatLng(41.22383, -87.5265), new google.maps.LatLng(41.20914, -87.52651), new google.maps.LatLng(41.19448, -87.52651), new google.maps.LatLng(41.18941, -87.52654), new google.maps.LatLng(41.18926, -87.52654), new google.maps.LatLng(41.18403, -87.52656), new google.maps.LatLng(41.17967, -87.52658), new google.maps.LatLng(41.17673, -87.52658), new google.maps.LatLng(41.17382, -87.52658), new google.maps.LatLng(41.16989, -87.52658), new google.maps.LatLng(41.16977, -87.52658), new google.maps.LatLng(41.16615, -87.52659), new google.maps.LatLng(41.16609, -87.52659), new google.maps.LatLng(41.16611, -87.52654), new google.maps.LatLng(41.16648, -87.52242), new google.maps.LatLng(41.16848, -87.50021), new google.maps.LatLng(41.16971, -87.48678), new google.maps.LatLng(41.17021, -87.47424), new google.maps.LatLng(41.17051, -87.46395), new google.maps.LatLng(41.17216, -87.45387), new google.maps.LatLng(41.17404, -87.44876), new google.maps.LatLng(41.17429, -87.44627), new google.maps.LatLng(41.17299, -87.44118), new google.maps.LatLng(41.17137, -87.43699), new google.maps.LatLng(41.1698, -87.43313), new google.maps.LatLng(41.16775, -87.42788), new google.maps.LatLng(41.16472, -87.41955), new google.maps.LatLng(41.16223, -87.41289), new google.maps.LatLng(41.16274, -87.39565), new google.maps.LatLng(41.17258, -87.38087), new google.maps.LatLng(41.17575, -87.3685), new google.maps.LatLng(41.17884, -87.35731), new google.maps.LatLng(41.1825, -87.34412), new google.maps.LatLng(41.18257, -87.34066), new google.maps.LatLng(41.18257, -87.34066), new google.maps.LatLng(41.18303, -87.33126), new google.maps.LatLng(41.19394, -87.31407), new google.maps.LatLng(41.20941, -87.29361), new google.maps.LatLng(41.21574, -87.28422), new google.maps.LatLng(41.21852, -87.2761), new google.maps.LatLng(41.21859, -87.27588), new google.maps.LatLng(41.2186, -87.27587), new google.maps.LatLng(41.21884, -87.27517), new google.maps.LatLng(41.21942, -87.27348), new google.maps.LatLng(41.22078, -87.26951), new google.maps.LatLng(41.22148, -87.26745), new google.maps.LatLng(41.22223, -87.26528), new google.maps.LatLng(41.22274, -87.26375), new google.maps.LatLng(41.22325, -87.26227), new google.maps.LatLng(41.22437, -87.25901), new google.maps.LatLng(41.22515, -87.25674), new google.maps.LatLng(41.226, -87.25426), new google.maps.LatLng(41.22755, -87.24994), new google.maps.LatLng(41.22786, -87.24902), new google.maps.LatLng(41.22822, -87.24798), new google.maps.LatLng(41.22935, -87.24461), new google.maps.LatLng(41.23008, -87.24247), new google.maps.LatLng(41.23061, -87.2409), new google.maps.LatLng(41.2311, -87.23946), new google.maps.LatLng(41.2317, -87.23769), new google.maps.LatLng(41.23238, -87.23569), new google.maps.LatLng(41.23341, -87.23262), new google.maps.LatLng(41.23396, -87.23096), new google.maps.LatLng(41.23516, -87.22742), new google.maps.LatLng(41.23548, -87.22646), new google.maps.LatLng(41.23706, -87.22454), new google.maps.LatLng(41.24202, -87.21886), new google.maps.LatLng(41.24203, -87.21886), new google.maps.LatLng(41.24214, -87.21888), new google.maps.LatLng(41.26032, -87.21914), new google.maps.LatLng(41.26523, -87.21886), new google.maps.LatLng(41.28625, -87.21903), new google.maps.LatLng(41.31277, -87.21977), new google.maps.LatLng(41.34721, -87.22003), new google.maps.LatLng(41.37525, -87.21967), new google.maps.LatLng(41.39109, -87.2197), new google.maps.LatLng(41.40624, -87.21995), new google.maps.LatLng(41.42638, -87.21951), new google.maps.LatLng(41.43581, -87.21971), new google.maps.LatLng(41.45103, -87.21958), new google.maps.LatLng(41.47642, -87.21975), new google.maps.LatLng(41.48889, -87.22009), new google.maps.LatLng(41.52493, -87.22074), new google.maps.LatLng(41.54328, -87.22123), new google.maps.LatLng(41.54816, -87.22137), new google.maps.LatLng(41.56117, -87.22168), new google.maps.LatLng(41.57011, -87.22186), new google.maps.LatLng(41.57982, -87.22173), new google.maps.LatLng(41.58928, -87.22191), new google.maps.LatLng(41.59544, -87.22226), new google.maps.LatLng(41.60714, -87.22246), new google.maps.LatLng(41.61477, -87.22254), new google.maps.LatLng(41.62015, -87.22263), new google.maps.LatLng(41.75872, -87.22098), new google.maps.LatLng(41.76089, -87.221), new google.maps.LatLng(41.76062, -87.25004), new google.maps.LatLng(41.75995, -87.51894), new google.maps.LatLng(41.70838, -87.52404), new google.maps.LatLng(41.70358, -87.52497), new google.maps.LatLng(41.68694, -87.52481), new google.maps.LatLng(41.67373, -87.52478), new google.maps.LatLng(41.66038, -87.52474), new google.maps.LatLng(41.65464, -87.52534), new google.maps.LatLng(41.64464, -87.52467), new google.maps.LatLng(41.63194, -87.52484), new google.maps.LatLng(41.62573, -87.52464), new google.maps.LatLng(41.61383, -87.52514), new google.maps.LatLng(41.60331, -87.52522), new google.maps.LatLng(41.59353, -87.52538), new google.maps.LatLng(41.58786, -87.52543), new google.maps.LatLng(41.5822, -87.5253), new google.maps.LatLng(41.57687, -87.52469), new google.maps.LatLng(41.56178, -87.52487), new google.maps.LatLng(41.55133, -87.52494), new google.maps.LatLng(41.54443, -87.52484), new google.maps.LatLng(41.51091, -87.52504), new google.maps.LatLng(41.50294, -87.5252), new google.maps.LatLng(41.49887, -87.52514), new google.maps.LatLng(41.49442, -87.52514), new google.maps.LatLng(41.48225, -87.52535), new google.maps.LatLng(41.47035, -87.5257), new google.maps.LatLng(41.47028, -87.5257), new google.maps.LatLng(41.46194, -87.52567), new google.maps.LatLng(41.46093, -87.52559), new google.maps.LatLng(41.45733, -87.52562), new google.maps.LatLng(41.45102, -87.52589), new google.maps.LatLng(41.4435, -87.52592), new google.maps.LatLng(41.43939, -87.52581), new google.maps.LatLng(41.43002, -87.52587), new google.maps.LatLng(41.42618, -87.5259)];
                var IN_LaPorteCoords = [new google.maps.LatLng(41.27067, -86.92986), new google.maps.LatLng(41.25125, -86.92961), new google.maps.LatLng(41.2368, -86.93008), new google.maps.LatLng(41.2368, -86.93007), new google.maps.LatLng(41.25637, -86.89095), new google.maps.LatLng(41.26547, -86.86258), new google.maps.LatLng(41.26599, -86.85414), new google.maps.LatLng(41.27051, -86.84168), new google.maps.LatLng(41.27156, -86.82572), new google.maps.LatLng(41.27544, -86.80935), new google.maps.LatLng(41.28406, -86.78708), new google.maps.LatLng(41.30411, -86.76489), new google.maps.LatLng(41.31152, -86.75494), new google.maps.LatLng(41.31482, -86.74934), new google.maps.LatLng(41.31708, -86.7462), new google.maps.LatLng(41.3245, -86.73831), new google.maps.LatLng(41.33674, -86.73576), new google.maps.LatLng(41.34238, -86.73175), new google.maps.LatLng(41.34536, -86.72925), new google.maps.LatLng(41.3501, -86.72585), new google.maps.LatLng(41.35797, -86.724), new google.maps.LatLng(41.3966, -86.70331), new google.maps.LatLng(41.40535, -86.69495), new google.maps.LatLng(41.40751, -86.6904), new google.maps.LatLng(41.41245, -86.67857), new google.maps.LatLng(41.41338, -86.67343), new google.maps.LatLng(41.42168, -86.65906), new google.maps.LatLng(41.43287, -86.52662), new google.maps.LatLng(41.43289, -86.52471), new google.maps.LatLng(41.44019, -86.52472), new google.maps.LatLng(41.47655, -86.52473), new google.maps.LatLng(41.48551, -86.52472), new google.maps.LatLng(41.50544, -86.52508), new google.maps.LatLng(41.52942, -86.49949), new google.maps.LatLng(41.56342, -86.49512), new google.maps.LatLng(41.59334, -86.48634), new google.maps.LatLng(41.60226, -86.48656), new google.maps.LatLng(41.61075, -86.48666), new google.maps.LatLng(41.61639, -86.48646), new google.maps.LatLng(41.63537, -86.48682), new google.maps.LatLng(41.63823, -86.4869), new google.maps.LatLng(41.64212, -86.48703), new google.maps.LatLng(41.66028, -86.52639), new google.maps.LatLng(41.67158, -86.52603), new google.maps.LatLng(41.67832, -86.52585), new google.maps.LatLng(41.68651, -86.52566), new google.maps.LatLng(41.69136, -86.52551), new google.maps.LatLng(41.69711, -86.52536), new google.maps.LatLng(41.70671, -86.52511), new google.maps.LatLng(41.71112, -86.52494), new google.maps.LatLng(41.71902, -86.52478), new google.maps.LatLng(41.73289, -86.52456), new google.maps.LatLng(41.74585, -86.52443), new google.maps.LatLng(41.75539, -86.52432), new google.maps.LatLng(41.75956, -86.52422), new google.maps.LatLng(41.75966, -86.52422), new google.maps.LatLng(41.75963, -86.53151), new google.maps.LatLng(41.75962, -86.53232), new google.maps.LatLng(41.75963, -86.53515), new google.maps.LatLng(41.75957, -86.56694), new google.maps.LatLng(41.75957, -86.56694), new google.maps.LatLng(41.7595, -86.59494), new google.maps.LatLng(41.75959, -86.62218), new google.maps.LatLng(41.75974, -86.64003), new google.maps.LatLng(41.75971, -86.66875), new google.maps.LatLng(41.75979, -86.69979), new google.maps.LatLng(41.75982, -86.71916), new google.maps.LatLng(41.75987, -86.72766), new google.maps.LatLng(41.75992, -86.74771), new google.maps.LatLng(41.75996, -86.75292), new google.maps.LatLng(41.76011, -86.76763), new google.maps.LatLng(41.76021, -86.78052), new google.maps.LatLng(41.76023, -86.78397), new google.maps.LatLng(41.76027, -86.80067), new google.maps.LatLng(41.76027, -86.8045), new google.maps.LatLng(41.76028, -86.80616), new google.maps.LatLng(41.76028, -86.80856), new google.maps.LatLng(41.76028, -86.81051), new google.maps.LatLng(41.76029, -86.81607), new google.maps.LatLng(41.7603, -86.82237), new google.maps.LatLng(41.7603, -86.82496), new google.maps.LatLng(41.76027, -86.84171), new google.maps.LatLng(41.76089, -86.92167), new google.maps.LatLng(41.76103, -86.93333), new google.maps.LatLng(41.73038, -86.93311), new google.maps.LatLng(41.70302, -86.93261), new google.maps.LatLng(41.6965, -86.93253), new google.maps.LatLng(41.69298, -86.93245), new google.maps.LatLng(41.68872, -86.93241), new google.maps.LatLng(41.67894, -86.93245), new google.maps.LatLng(41.66004, -86.93236), new google.maps.LatLng(41.64582, -86.9323), new google.maps.LatLng(41.62519, -86.9323), new google.maps.LatLng(41.61199, -86.93213), new google.maps.LatLng(41.59876, -86.93183), new google.maps.LatLng(41.58631, -86.9315), new google.maps.LatLng(41.56968, -86.93116), new google.maps.LatLng(41.55153, -86.93057), new google.maps.LatLng(41.54557, -86.93064), new google.maps.LatLng(41.50452, -86.92963), new google.maps.LatLng(41.46316, -86.92936), new google.maps.LatLng(41.43619, -86.93017)];
                var IN_NewtonCoords = [new google.maps.LatLng(41.16775, -87.42788), new google.maps.LatLng(41.1698, -87.43313), new google.maps.LatLng(41.17137, -87.43699), new google.maps.LatLng(41.17299, -87.44118), new google.maps.LatLng(41.17404, -87.44876), new google.maps.LatLng(41.17216, -87.45387), new google.maps.LatLng(41.17051, -87.46395), new google.maps.LatLng(41.17021, -87.47424), new google.maps.LatLng(41.16971, -87.48678), new google.maps.LatLng(41.16848, -87.50021), new google.maps.LatLng(41.16648, -87.52242), new google.maps.LatLng(41.16611, -87.52654), new google.maps.LatLng(41.16609, -87.52659), new google.maps.LatLng(41.16603, -87.52659), new google.maps.LatLng(41.16417, -87.52657), new google.maps.LatLng(41.16121, -87.52663), new google.maps.LatLng(41.15952, -87.5266), new google.maps.LatLng(41.15479, -87.52665), new google.maps.LatLng(41.15274, -87.52656), new google.maps.LatLng(41.13973, -87.52657), new google.maps.LatLng(41.12779, -87.52665), new google.maps.LatLng(41.11927, -87.52665), new google.maps.LatLng(41.11325, -87.52664), new google.maps.LatLng(41.11006, -87.52662), new google.maps.LatLng(41.10318, -87.52661), new google.maps.LatLng(41.09898, -87.52656), new google.maps.LatLng(41.09279, -87.52658), new google.maps.LatLng(41.08717, -87.52651), new google.maps.LatLng(41.0833, -87.52656), new google.maps.LatLng(41.07647, -87.52654), new google.maps.LatLng(41.06268, -87.5265), new google.maps.LatLng(41.05888, -87.52644), new google.maps.LatLng(41.05648, -87.52645), new google.maps.LatLng(41.0501, -87.52638), new google.maps.LatLng(41.04315, -87.52634), new google.maps.LatLng(41.03953, -87.52635), new google.maps.LatLng(41.02537, -87.52641), new google.maps.LatLng(41.01695, -87.52628), new google.maps.LatLng(41.01039, -87.52621), new google.maps.LatLng(41.01035, -87.52621), new google.maps.LatLng(41.01023, -87.52621), new google.maps.LatLng(41.00581, -87.5263), new google.maps.LatLng(40.9983, -87.52627), new google.maps.LatLng(40.9813, -87.5261), new google.maps.LatLng(40.97573, -87.52603), new google.maps.LatLng(40.96629, -87.526), new google.maps.LatLng(40.95883, -87.526), new google.maps.LatLng(40.95175, -87.526), new google.maps.LatLng(40.93759, -87.52612), new google.maps.LatLng(40.92608, -87.5261), new google.maps.LatLng(40.90835, -87.526), new google.maps.LatLng(40.89761, -87.52596), new google.maps.LatLng(40.89415, -87.52644), new google.maps.LatLng(40.85396, -87.52583), new google.maps.LatLng(40.84679, -87.52572), new google.maps.LatLng(40.82741, -87.52566), new google.maps.LatLng(40.81314, -87.52577), new google.maps.LatLng(40.80912, -87.52583), new google.maps.LatLng(40.80311, -87.5259), new google.maps.LatLng(40.795, -87.52588), new google.maps.LatLng(40.795, -87.52588), new google.maps.LatLng(40.79029, -87.52586), new google.maps.LatLng(40.78098, -87.5259), new google.maps.LatLng(40.77499, -87.526), new google.maps.LatLng(40.76999, -87.526), new google.maps.LatLng(40.75143, -87.52599), new google.maps.LatLng(40.73695, -87.52603), new google.maps.LatLng(40.73688, -87.52603), new google.maps.LatLng(40.73689, -87.52552), new google.maps.LatLng(40.73694, -87.51422), new google.maps.LatLng(40.73695, -87.50962), new google.maps.LatLng(40.73696, -87.50272), new google.maps.LatLng(40.73694, -87.49405), new google.maps.LatLng(40.73693, -87.48447), new google.maps.LatLng(40.73688, -87.47307), new google.maps.LatLng(40.73682, -87.46121), new google.maps.LatLng(40.73676, -87.45114), new google.maps.LatLng(40.73671, -87.44127), new google.maps.LatLng(40.73665, -87.42978), new google.maps.LatLng(40.73663, -87.4267), new google.maps.LatLng(40.73659, -87.41144), new google.maps.LatLng(40.73656, -87.40203), new google.maps.LatLng(40.73653, -87.39209), new google.maps.LatLng(40.73651, -87.38252), new google.maps.LatLng(40.73651, -87.37441), new google.maps.LatLng(40.73652, -87.35951), new google.maps.LatLng(40.73652, -87.35618), new google.maps.LatLng(40.73653, -87.3437), new google.maps.LatLng(40.73655, -87.32459), new google.maps.LatLng(40.73657, -87.31226), new google.maps.LatLng(40.73655, -87.2979), new google.maps.LatLng(40.73656, -87.2894), new google.maps.LatLng(40.73656, -87.28154), new google.maps.LatLng(40.73657, -87.26999), new google.maps.LatLng(40.73658, -87.2673), new google.maps.LatLng(40.75004, -87.26724), new google.maps.LatLng(40.80918, -87.26763), new google.maps.LatLng(40.84251, -87.26786), new google.maps.LatLng(40.85952, -87.26795), new google.maps.LatLng(40.87678, -87.26802), new google.maps.LatLng(40.91151, -87.27218), new google.maps.LatLng(40.92556, -87.27655), new google.maps.LatLng(40.97599, -87.27639), new google.maps.LatLng(41.00703, -87.27611), new google.maps.LatLng(41.02427, -87.27606), new google.maps.LatLng(41.04201, -87.27601), new google.maps.LatLng(41.05972, -87.27596), new google.maps.LatLng(41.0884, -87.27589), new google.maps.LatLng(41.10222, -87.27586), new google.maps.LatLng(41.11535, -87.27579), new google.maps.LatLng(41.13698, -87.27568), new google.maps.LatLng(41.14611, -87.27571), new google.maps.LatLng(41.15117, -87.27569), new google.maps.LatLng(41.15891, -87.27572), new google.maps.LatLng(41.16751, -87.27568), new google.maps.LatLng(41.17361, -87.27552), new google.maps.LatLng(41.17542, -87.27586), new google.maps.LatLng(41.17851, -87.27571), new google.maps.LatLng(41.19662, -87.27573), new google.maps.LatLng(41.21434, -87.27586), new google.maps.LatLng(41.2184, -87.27587), new google.maps.LatLng(41.21859, -87.27588), new google.maps.LatLng(41.21852, -87.2761), new google.maps.LatLng(41.21574, -87.28422), new google.maps.LatLng(41.20941, -87.29361), new google.maps.LatLng(41.19394, -87.31407), new google.maps.LatLng(41.18303, -87.33126), new google.maps.LatLng(41.18257, -87.34066), new google.maps.LatLng(41.1825, -87.34412)];
                var IN_PorterCoords = [new google.maps.LatLng(41.59876, -86.93183), new google.maps.LatLng(41.61199, -86.93213), new google.maps.LatLng(41.62519, -86.9323), new google.maps.LatLng(41.64582, -86.9323), new google.maps.LatLng(41.67894, -86.93245), new google.maps.LatLng(41.68872, -86.93241), new google.maps.LatLng(41.69298, -86.93245), new google.maps.LatLng(41.6965, -86.93253), new google.maps.LatLng(41.70302, -86.93261), new google.maps.LatLng(41.73038, -86.93311), new google.maps.LatLng(41.76103, -86.93333), new google.maps.LatLng(41.76104, -86.93354), new google.maps.LatLng(41.76104, -86.93416), new google.maps.LatLng(41.76104, -86.93437), new google.maps.LatLng(41.76087, -86.9725), new google.maps.LatLng(41.76074, -87.00003), new google.maps.LatLng(41.76052, -87.0869), new google.maps.LatLng(41.76042, -87.12504), new google.maps.LatLng(41.76061, -87.12504), new google.maps.LatLng(41.76118, -87.12504), new google.maps.LatLng(41.76137, -87.12504), new google.maps.LatLng(41.76128, -87.14158), new google.maps.LatLng(41.76104, -87.19123), new google.maps.LatLng(41.76096, -87.20777), new google.maps.LatLng(41.76094, -87.21042), new google.maps.LatLng(41.7609, -87.21835), new google.maps.LatLng(41.76089, -87.221), new google.maps.LatLng(41.75872, -87.22098), new google.maps.LatLng(41.62015, -87.22263), new google.maps.LatLng(41.61477, -87.22254), new google.maps.LatLng(41.60714, -87.22246), new google.maps.LatLng(41.59544, -87.22226), new google.maps.LatLng(41.58928, -87.22191), new google.maps.LatLng(41.57982, -87.22173), new google.maps.LatLng(41.57011, -87.22186), new google.maps.LatLng(41.56117, -87.22168), new google.maps.LatLng(41.54816, -87.22137), new google.maps.LatLng(41.54328, -87.22123), new google.maps.LatLng(41.52493, -87.22074), new google.maps.LatLng(41.48889, -87.22009), new google.maps.LatLng(41.47642, -87.21975), new google.maps.LatLng(41.45103, -87.21958), new google.maps.LatLng(41.43581, -87.21971), new google.maps.LatLng(41.42638, -87.21951), new google.maps.LatLng(41.40624, -87.21995), new google.maps.LatLng(41.39109, -87.2197), new google.maps.LatLng(41.37525, -87.21967), new google.maps.LatLng(41.34721, -87.22003), new google.maps.LatLng(41.31277, -87.21977), new google.maps.LatLng(41.28625, -87.21903), new google.maps.LatLng(41.26523, -87.21886), new google.maps.LatLng(41.26032, -87.21914), new google.maps.LatLng(41.24214, -87.21888), new google.maps.LatLng(41.24203, -87.21886), new google.maps.LatLng(41.24233, -87.21852), new google.maps.LatLng(41.2621, -87.19614), new google.maps.LatLng(41.26636, -87.18897), new google.maps.LatLng(41.2689, -87.18119), new google.maps.LatLng(41.27071, -87.17584), new google.maps.LatLng(41.27368, -87.16706), new google.maps.LatLng(41.27368, -87.16706), new google.maps.LatLng(41.27686, -87.15803), new google.maps.LatLng(41.27919, -87.15137), new google.maps.LatLng(41.28201, -87.14341), new google.maps.LatLng(41.28463, -87.13597), new google.maps.LatLng(41.28636, -87.12212), new google.maps.LatLng(41.2842, -87.1144), new google.maps.LatLng(41.28124, -87.10329), new google.maps.LatLng(41.27825, -87.09218), new google.maps.LatLng(41.2736, -87.07476), new google.maps.LatLng(41.27186, -87.06815), new google.maps.LatLng(41.26987, -87.06097), new google.maps.LatLng(41.26256, -87.04793), new google.maps.LatLng(41.25803, -87.04009), new google.maps.LatLng(41.24952, -87.02567), new google.maps.LatLng(41.24168, -87.01234), new google.maps.LatLng(41.23605, -87.0009), new google.maps.LatLng(41.2257, -86.98187), new google.maps.LatLng(41.21964, -86.96895), new google.maps.LatLng(41.22666, -86.94899), new google.maps.LatLng(41.23638, -86.93054), new google.maps.LatLng(41.2368, -86.93008), new google.maps.LatLng(41.25125, -86.92961), new google.maps.LatLng(41.27067, -86.92986), new google.maps.LatLng(41.302, -86.93028), new google.maps.LatLng(41.32482, -86.93056), new google.maps.LatLng(41.33785, -86.93067), new google.maps.LatLng(41.36306, -86.93054), new google.maps.LatLng(41.41175, -86.93021), new google.maps.LatLng(41.4361, -86.93017), new google.maps.LatLng(41.43619, -86.93017)];
                var Poly_IN_Jasper = new google.maps.Polygon({ paths: IN_JasperCoords, strokeColor: '#666666', strokeOpacity: 0.8, strokeWeight: 3, fillColor: '#666666', fillOpacity: 0.35 });
                var Poly_IN_Lake = new google.maps.Polygon({ paths: IN_LakeCoords, strokeColor: '#666666', strokeOpacity: 0.8, strokeWeight: 3, fillColor: '#666666', fillOpacity: 0.35 });
                var Poly_IN_LaPorte = new google.maps.Polygon({ paths: IN_LaPorteCoords, strokeColor: '#666666', strokeOpacity: 0.8, strokeWeight: 3, fillColor: '#666666', fillOpacity: 0.35 });
                var Poly_IN_Newton = new google.maps.Polygon({ paths: IN_NewtonCoords, strokeColor: '#666666', strokeOpacity: 0.8, strokeWeight: 3, fillColor: '#666666', fillOpacity: 0.35 });
                var Poly_IN_Porter = new google.maps.Polygon({ paths: IN_PorterCoords, strokeColor: '#666666', strokeOpacity: 0.8, strokeWeight: 3, fillColor: '#666666', fillOpacity: 0.35 });
                Poly_IN_Jasper.setMap(map);
                Poly_IN_Lake.setMap(map);
                Poly_IN_LaPorte.setMap(map);
                Poly_IN_Newton.setMap(map);
                Poly_IN_Porter.setMap(map);
                google.maps.event.addListener(Poly_IN_Lake, 'click', function (event) {
                    if (IN_Lake_Selected == true) {
                        Poly_IN_Lake.setOptions({ strokeWeight: 2.0, fillColor: '#666666' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Lake:</b><img src="Images/xMark.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Lake_Selected = false;
                        return;
                    }
                    else {
                        Poly_IN_Lake.setOptions({ strokeWeight: 2.0, fillColor: 'red' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Lake:</b><img src="Images/Check.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Lake_Selected = true;
                        getCounties()
                        return;
                    }
                });
                google.maps.event.addListener(Poly_IN_LaPorte, 'click', function (event) {
                    if (IN_LaPorte_Selected == true) {
                        Poly_IN_LaPorte.setOptions({ strokeWeight: 2.0, fillColor: '#666666' });
                        var contentString = '<table width="100%"><tr><td><b>IN_LaPorte:</b><img src="Images/xMark.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_LaPorte_Selected = false;
                        return;
                    }
                    else {
                        Poly_IN_LaPorte.setOptions({ strokeWeight: 2.0, fillColor: 'red' });
                        var contentString = '<table width="100%"><tr><td><b>IN_LaPorte:</b><img src="Images/Check.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_LaPorte_Selected = true;
                        return;
                    }
                });
                google.maps.event.addListener(Poly_IN_Newton, 'click', function (event) {
                    if (IN_Newton_Selected == true) {
                        Poly_IN_Newton.setOptions({ strokeWeight: 2.0, fillColor: '#666666' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Newton:</b><img src="Images/xMark.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Newton_Selected = false;
                        return;
                    }
                    else {
                        Poly_IN_Newton.setOptions({ strokeWeight: 2.0, fillColor: 'red' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Newton:</b><img src="Images/Check.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Newton_Selected = true;
                        return;
                    }
                });
                google.maps.event.addListener(Poly_IN_Porter, 'click', function (event) {
                    if (IN_Porter_Selected == true) {
                        Poly_IN_Porter.setOptions({ strokeWeight: 2.0, fillColor: '#666666' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Porter:</b><img src="Images/xMark.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Porter_Selected = false;
                        return;
                    }
                    else {
                        Poly_IN_Porter.setOptions({ strokeWeight: 2.0, fillColor: 'red' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Porter:</b><img src="Images/Check.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Porter_Selected = true;
                        return;
                    }
                });
                google.maps.event.addListener(Poly_IN_Jasper, 'click', function (event) {
                    if (IN_Jasper_Selected == true) {
                        Poly_IN_Jasper.setOptions({ strokeWeight: 2.0, fillColor: '#666666' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Jasper:</b><img src="Images/xMark.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Jasper_Selected = false;
                        return;
                    }
                    else {
                        Poly_IN_Jasper.setOptions({ strokeWeight: 2.0, fillColor: 'red' });
                        var contentString = '<table width="100%"><tr><td><b>IN_Jasper:</b><img src="Images/Check.png" width=15 height=15></td></tr></table>';
                        infoWindow.setContent(contentString);
                        infoWindow.setPosition(event.latLng);
                        infoWindow.open(map);
                        setTimeout(function () { infoWindow.close(); }, '500');
                        IN_Jasper_Selected = true;
                        return;
                    }
                });
                infoWindow = new google.maps.InfoWindow();
            }




            function getCounties() {

                if (IN_Lake_Selected == true) {
                    county_list += "LAKE,";
                }
                document.getElementById("<%= HF_Counties_txt.ClientID %>").value = county_list;


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
                //checking how many markers there are (database default for desaster is 4 lat and long cords. for N-S-E-W)
                for (var i = 0; i < markers.length; i++) {
                    bounds.extend(markers[i]);
                }
                //Finding the center of the polygon area and centering the map to that location
                if (markers.length > 1) {
                    map.setCenter(bounds.getCenter());
                    map.fitBounds(bounds);
                }
                else {
                    map.setCenter(bounds.getCenter());
                    map.setZoom(15);

                }
            }




        </script>

    </head>
    <body>
        <%--        <asp:TabContainer ID="MyAjaxTabContainer" runat="server" OnClientActiveTabChanged="resizeMap" UseVerticalStripPlacement="false" ActiveTabIndex="0" Visible="True" BackColor="#EFEEEF" ForeColor="#333333" BorderColor="#EFEEEF" BorderStyle="Double" BorderWidth="10px">
            <asp:TabPanel ID="Insert_TabInsertClient" runat="server" HeaderText="Place An Alert" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>--%>
        <asp:Panel ID="Create_Alert_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
            <asp:Label ID="Create_Alert_InfoHead_label" Style="padding: 10px" runat="server" Text="Place An Order" Font-Size="Large"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="Create_Alert_InfoBody" runat="server" Style="overflow: hidden;">
            <div style="width: 100%; height: auto">
                <div style="margin: 0px; width: 60%; float: left; border-color: #EA5151; border-left-style: solid; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium;">
                    <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'; float: left;">
                        <tr>
                            <td style="padding: 5px 10px 5px 10px; background-color: #666666; width: 50%">
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
                            <td style="padding: 5px 10px 5px 10px; background-color: #666666; width: 50%">
                                <asp:Label ID="Label1" runat="server" Text="HTML Message?" Style="font-size: large; color: #E2E2E2"></asp:Label>
                                <asp:CheckBox ID="CBox_HTML" runat="server" Style="color: #E2E2E2;" />
                                <br />
                            </td>
                        </tr>
                    </table>
                    <table width="100%" height="100%" bgcolor="Silver" border="3" style="float: left;">
                        <tr>
                            <td style="padding: 0px;">
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="Alert_ID" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="100%" OnSelectedIndexChanged="Select_Record" Height="200px" ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                        <asp:BoundField DataField="Alert_ID" HeaderText="Alert_ID" InsertVisible="False" ReadOnly="True" SortExpression="Alert_ID" />
                                        <asp:BoundField DataField="Alert_Message" HeaderText="Alert_Message" InsertVisible="False" ReadOnly="True" SortExpression="Alert_Message" />
                                        <asp:BoundField DataField="Alert_Type" HeaderText="Alert_Type" InsertVisible="False" ReadOnly="True" SortExpression="Alert_Type" />
                                        <asp:BoundField DataField="Date" HeaderText="Date" InsertVisible="False" ReadOnly="True" SortExpression="Date" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                    <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                    <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                    <RowStyle BackColor="#CCCCCC"></RowStyle>
                                    <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="#CCCCCC"></SelectedRowStyle>
                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                    <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [Alert_ID], [Alert_Message], [Alert_Type], [Date] FROM [Alert]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" height="auto" bgcolor="Silver" border="3" align="center" style="float: left;">
                        <tr>
                            <td></td>

                            <td align="center">
                                <asp:Label ID="Alert_Type_Lable" runat="server" Text="Alert Type:" Style="font-size: large;"></asp:Label><br />
                                <asp:TextBox ID="Alert_Type_TextBox" runat="server" Width="222px"></asp:TextBox><br />
                            </td>
                            <td align="center">
                                <asp:Label ID="Date_Lable" runat="server" Text="Date:" Style="font-size: large;"></asp:Label><br />
                                <asp:TextBox ID="Date_TextBox" runat="server" Width="135px"></asp:TextBox><br />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center" style="padding: 0;">
                                <asp:Label ID="Alert_Message_Lable" runat="server" Text="Alert Message:" Style="font-size: large;"></asp:Label><br />
                                <asp:TextBox ID="Alert_Message_TextBox" runat="server" TextMode="MultiLine" Width="100%" Height="200px"></asp:TextBox><br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="map-canvas" style="margin: 0px; width: auto; height: 552px; border-color: #EA5151; border-left-style: none; border-left-width: medium; border-right-style: solid; border-right-width: medium; border-top-style: solid; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium;"></div>
                <table width="100%" height="auto" bgcolor="Silver" border="3">
                    <tr>
                        <td colspan="2" style="padding: 0px;" width="100%">
                            <asp:Button ID="Insert" runat="server" Text="Send Alert" Style="color: #E2E2E2; background-color: #EA5151; width: 100%; height: 28px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px;" CausesValidation="False" OnClick="INSERT" />
                        </td>
                    </tr>
                </table>

            </div>
        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="cpeOrderInfo" runat="server"
            CollapseControlID="Create_Alert_InfoHead"
            CollapsedText="Place An Alert" Enabled="True"
            ExpandControlID="Create_Alert_InfoHead"
            ExpandedText="Place An Alert"
            TargetControlID="Create_Alert_InfoBody"
            TextLabelID="Create_Alert_InfoHead_label">
        </asp:CollapsiblePanelExtender>

        <%--                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>--%>


        <asp:HiddenField ID="HF_Counties_txt" runat="Server" />

        <asp:ToolkitScriptManager runat="server" ID="smtk"></asp:ToolkitScriptManager>

    </body>
    </html>
</asp:Content>

