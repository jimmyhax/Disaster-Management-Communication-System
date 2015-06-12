<%@ Page Title="Pets" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Pets.aspx.cs" Inherits="DMCS.Moduals.Missing_Pets.Missing_Pets_Modual" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="CSS/XPStyle.css" />
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <script src="Scripts/Timepicker.js" type="text/javascript"></script>
    <link href="CSS/jquery-ui.css.css" rel="Stylesheet" type="text/css" />
    <link href="CSS/Timepicker.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $('[id$=Insert_time_of_death_txt]').datetimepicker();

            $('[id$=Update_time_of_death_txt]').datetimepicker();
        });
    </script>
    <style type="text/css">
        .AlgemBackground {
            background-color: #000000;
            opacity: 0.75;
            filter: alpha(opacity=70);
        }
        .auto-style3 {
            height: 45px;
        }
    </style>
    <script src="https://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
    <script type="text/javascript" id="mapScript">

        var tab1_map, tab2_map, latLng, tab1_marker, tab2_marker, infoWindow;
        var geocoder = new google.maps.Geocoder();
        var gm = google.maps;
        var iw = new gm.InfoWindow({ maxWidth: 200 });
        var infoWindow;

        var address;
        var city;
        var state;
        var zip;
        var county;
        var pet_lat;
        var pet_Long;


        function initialize() {

            //Second Map
            geocoder = new google.maps.Geocoder();
            var myOptions = {
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            tab2_map = new google.maps.Map(document.getElementById('tab2_map'),
                myOptions);
            tab1_map = new google.maps.Map(document.getElementById('tab1_map'),
               myOptions);
            ////////////////////////////////////////////////////
            if (geoPosition.init())
                geoPosition.getCurrentPosition(locationFound, defaultLocation, { enableHighAccuracy: true });
            else
                defaultLocation();
        }

        //fix for ajax tabs
        function resizeMap() {


            var myOptions = {
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            tab2_map = new google.maps.Map(document.getElementById('tab2_map'),
                            myOptions);
            tab1_map = new google.maps.Map(document.getElementById('tab1_map'),
               myOptions);

            google.maps.event.trigger(tab1_map, 'resize');
            google.maps.event.trigger(tab2_map, 'resize');
            if (geoPosition.init())
                geoPosition.getCurrentPosition(locationFound, defaultLocation, { enableHighAccuracy: true });
            else
                defaultLocation();
        }
        //add images pop up
        function ShowModal() {
            //var modalPopupBehavior = $find('mpeBehavior3');
            alert("HI!");
            $find('mpeBehavior3').show();
            alert("HI!");
            //modalPopupBehavior.updated();
            return true;
        }
        //////////////////////////////////////////////////
        /////////////////////////////////////////////////
        ////////////////////////////////////////////////
        ///////////////////////////////////////////////
        //////////////////////////////////////////////
        /////////////////////////////////////////////
        ////////////////////////////////////////////
        ///////////////////////////////////////////
        //////////////////////////////////////////
        /////////////////////////////////////////

        function showAddress(val) {
            infoWindow.close();
            _gaq.push(['_trackEvent', 'Maps', 'Search', val, 0, true]);
            geocoder.geocode({ 'address': val }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    tab1_marker.setPosition(results[0].geometry.location);
                    geocode(results[0].geometry.location);
                    tab2_marker.setPosition(results[0].geometry.location);
                    geocode(results[0].geometry.location);
                } else {
                    alert("Sorry but Google Maps could not find this location.");
                }
            });
        }



        function geocode(position) {
            geocoder.geocode({ latLng: position }, function (responses) {
                var tab1_html = "";
                var tab2_html = "";
                if (responses && responses.length > 0) {


                    _gaq.push(['_trackEvent', 'Maps', 'Drag', responses[0].formattedress, 0, true]);

                    var j = 0;


                    //console.log(responses[j]);
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
                    pet_lat = tab1_marker.getPosition().lat();
                    pet_long = tab1_marker.getPosition().lng();
                    var all_in_one = address + ", " + city + ", " + state + " " + zip;

                    document.getElementById('Insert_address_txt').value = address;
                    document.getElementById('Insert_city_txt').value = city;
                    document.getElementById('Insert_state_txt').value = state;
                    document.getElementById('Insert_zip_txt').value = zip;
                    document.getElementById('Insert_county_txt').value = county;
                    document.getElementById('Insert_LocationDiscription_txt').value = all_in_one;
                    document.getElementById('Insert_lat_txt').value = pet_lat;
                    document.getElementById('Insert_long_txt').value = pet_long;


                    pet_lat = tab2_marker.getPosition().lat();
                    pet_long = tab2_marker.getPosition().lng();
                    document.getElementById('Update_address_txt').value = address;
                    document.getElementById('Update_city_txt').value = city;
                    document.getElementById('Update_state_txt').value = state;
                    document.getElementById('Update_zip_txt').value = zip;
                    document.getElementById('Update_county_txt').value = county;
                    document.getElementById('Update_LocationDiscription_txt').value = all_in_one;
                    document.getElementById('Update_lat_txt').value = pet_lat;
                    document.getElementById('Update_long_txt').value = pet_long;

                    tab1_html += '<strong>Postal Address:</strong><hr/>' + all_in_one;
                    tab2_html += '<strong>Postal Address:</strong><hr/>' + all_in_one;


                } else {
                    tab1_html += 'Sorry but Google Maps could not determine the approximate postal address of this location.';
                    tab2_html += 'Sorry but Google Maps could not determine the approximate postal address of this location.';
                }

                tab1_html += '<br /><br /><strong>Geo Co-ordinates</strong><hr />' + 'Latitude : ' + tab1_marker.getPosition().lat() + '<br/>Longitude: ' + tab1_marker.getPosition().lng();
                tab2_html += '<br /><br /><strong>Geo Co-ordinates</strong><hr />' + 'Latitude : ' + tab2_marker.getPosition().lat() + '<br/>Longitude: ' + tab2_marker.getPosition().lng();
                tab1_map.panTo(tab1_marker.getPosition());
                tab2_map.panTo(tab2_marker.getPosition());
                infoWindow.setContent("<div id='iw'>" + tab1_html + "</div>");
                infoWindow.setContent("<div id='iw'>" + tab2_html + "</div>");
                infoWindow.open(tab1_map, tab1_marker);
                infoWindow.open(tab2_map, tab2_marker);

            });
        }

        function locationFound(position) {
            showMap(position.coords.latitude, position.coords.longitude);
        }

        function defaultLocation() {
            showMap(38.8977, -77.0366);
        }

        function showMap(lat, lng) {

            latLng = new google.maps.LatLng(lat, lng);

            var adUnitDiv = document.createElement('div');

            var width = window.innerWidth || document.documentElement.clientWidth;

            tab2_map.setCenter(latLng);
            tab1_map.setCenter(latLng);

            tab2_marker = new google.maps.Marker({
                position: latLng, map: tab2_map, draggable: true, animation: google.maps.Animation.DROP
            });

            tab1_marker = new google.maps.Marker({
                position: latLng, map: tab1_map, draggable: true, animation: google.maps.Animation.DROP
            });

            infoWindow = new google.maps.InfoWindow({
                content: '<div id="iw"><strong>Instructions:</strong><br /><br />Click the exact location of the pet <br />to update its current location.</div>'
            });

            infoWindow.open(tab1_map, tab1_marker);
            infoWindow.open(tab2_map, tab2_marker);

            google.maps.event.addListener(tab1_marker, 'dragstart', function (e) {
                infoWindow.close();
            });
            google.maps.event.addListener(tab2_marker, 'dragstart', function (e) {
                infoWindow.close();
            });

            google.maps.event.addListener(tab1_marker, 'dragend', function (e) {
                var point = tab1_marker.getPosition();
                tab1_map.panTo(point);
                geocode(point);
            });
            google.maps.event.addListener(tab2_marker, 'dragend', function (e) {
                var point = tab2_marker.getPosition();
                tab2_map.panTo(point);
                geocode(point);
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);

        /////////////////////////////////////////

        var geoPosition = function () {

            var pub = {};
            var provider = null;
            var u = "undefined";
            var ipGeolocationSrv = 'http://freegeoip.net/json/?callback=JSONPCallback';

            pub.getCurrentPosition = function (success, error, opts) {
                provider.getCurrentPosition(success, error, opts);
            }

            pub.jsonp = {
                callbackCounter: 0,

                fetch: function (url, callback) {
                    var fn = 'JSONPCallback_' + this.callbackCounter++;
                    window[fn] = this.evalJSONP(callback);
                    url = url.replace('=JSONPCallback', '=' + fn);

                    var scriptTag = document.createElement('SCRIPT');
                    scriptTag.src = url;
                    document.getElementsByTagName('HEAD')[0].appendChild(scriptTag);
                },

                evalJSONP: function (callback) {
                    return function (data) {
                        callback(data);
                    }
                }
            }


            pub.init = function () {
                try {
                    //console.debug(( typeof(geoPositionSimulator)!=u ) && (geoPositionSimulator.length > 0 ) );
                    if ((typeof (geoPositionSimulator) != u) && (geoPositionSimulator.length > 0)) {
                        provider = geoPositionSimulator;
                    } else if (typeof (bondi) != u && typeof (bondi.geolocation) != u) {
                        provider = bondi.geolocation;
                    } else if (typeof (navigator.geolocation) != u) {
                        provider = navigator.geolocation;
                        pub.getCurrentPosition = function (success, error, opts) {
                            function _success(p) {
                                //for mozilla geode,it returns the coordinates slightly differently
                                var params;
                                if (typeof (p.latitude) != u) {
                                    params = {
                                        timestamp: p.timestamp,
                                        coords: {
                                            latitude: p.latitude,
                                            longitude: p.longitude
                                        }
                                    };
                                } else {
                                    params = p;
                                }
                                success(params);
                            }
                            provider.getCurrentPosition(_success, error, opts);
                        }
                    } else if (typeof (window.blackberry) != u && blackberry.location.GPSSupported) {
                        // set to autonomous mode
                        if (typeof (blackberry.location.setAidMode) == u) {
                            return false;
                        }
                        blackberry.location.setAidMode(2);
                        //override default method implementation
                        pub.getCurrentPosition = function (success, error, opts) {
                            //alert(parseFloat(navigator.appVersion));
                            //passing over callbacks as parameter didn't work consistently
                            //in the onLocationUpdate method, thats why they have to be set
                            //outside
                            bb.success = success;
                            bb.error = error;
                            //function needs to be a string according to
                            //http://www.tonybunce.com/2008/05/08/Blackberry-Browser-Amp-GPS.aspx
                            if (opts['timeout']) {
                                bb.blackberryTimeoutId = setTimeout("handleBlackBerryLocationTimeout()", opts['timeout']);
                            } else {
                                //default timeout when none is given to prevent a hanging script
                                bb.blackberryTimeoutId = setTimeout("handleBlackBerryLocationTimeout()", 60000);
                            }
                            blackberry.location.onLocationUpdate("handleBlackBerryLocation()");
                            blackberry.location.refreshLocation();
                        }
                        provider = blackberry.location;

                    } else if (typeof (Mojo) != u && typeof (Mojo.Service.Request) != "Mojo.Service.Request") {
                        provider = true;
                        pub.getCurrentPosition = function (success, error, opts) {
                            parameters = {};
                            if (opts) {
                                //http://developer.palm.com/index.php?option=com_content&view=article&id=1673#GPS-getCurrentPosition
                                if (opts.enableHighAccuracy && opts.enableHighAccuracy == true) {
                                    parameters.accuracy = 1;
                                }
                                if (opts.maximumAge) {
                                    parameters.maximumAge = opts.maximumAge;
                                }
                                if (opts.responseTime) {
                                    if (opts.responseTime < 5) {
                                        parameters.responseTime = 1;
                                    } else if (opts.responseTime < 20) {
                                        parameters.responseTime = 2;
                                    } else {
                                        parameters.timeout = 3;
                                    }
                                }
                            }

                            r = new Mojo.Service.Request('palm://com.palm.location', {
                                method: "getCurrentPosition",
                                parameters: parameters,
                                onSuccess: function (p) {
                                    success({
                                        timestamp: p.timestamp,
                                        coords: {
                                            latitude: p.latitude,
                                            longitude: p.longitude,
                                            heading: p.heading
                                        }
                                    });
                                },
                                onFailure: function (e) {
                                    if (e.errorCode == 1) {
                                        error({
                                            code: 3,
                                            message: "Timeout"
                                        });
                                    } else if (e.errorCode == 2) {
                                        error({
                                            code: 2,
                                            message: "Position unavailable"
                                        });
                                    } else {
                                        error({
                                            code: 0,
                                            message: "Unknown Error: webOS-code" + errorCode
                                        });
                                    }
                                }
                            });
                        }

                    }
                    else if (typeof (device) != u && typeof (device.getServiceObject) != u) {
                        provider = device.getServiceObject("Service.Location", "ILocation");

                        //override default method implementation
                        pub.getCurrentPosition = function (success, error, opts) {
                            function callback(transId, eventCode, result) {
                                if (eventCode == 4) {
                                    error({ message: "Position unavailable", code: 2 });
                                } else {
                                    //no timestamp of location given?
                                    success({
                                        timestamp: null,
                                        coords: {
                                            latitude: result.ReturnValue.Latitude,
                                            longitude: result.ReturnValue.Longitude,
                                            altitude: result.ReturnValue.Altitude,
                                            heading: result.ReturnValue.Heading
                                        }
                                    });
                                }
                            }
                            //location criteria

                            var criteria = new Object();
                            criteria.LocationInformationClass = "BasicLocationInformation";
                            //make the call
                            provider.ILocation.GetLocation(criteria, callback);
                        }
                    } else {
                        pub.getCurrentPosition = function (success, error, opts) {
                            pub.jsonp.fetch(ipGeolocationSrv,
                                    function (p) {
                                        success({
                                            timestamp: p.timestamp,
                                            coords: {
                                                latitude: p.latitude,
                                                longitude: p.longitude,
                                                heading: p.heading
                                            }
                                        });
                                    });
                        }
                        provider = true;
                    }


                }
                catch (e) {
                    if (typeof (console) != u) console.log(e);
                    return false;
                }
                return provider != null;
            }
            return pub;
        }();
        /////////////////////////////////////
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-50062-24']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

        /////////////////////////////////////////////////////////////////////////////////////////////////////////


    </script>

    <!--webpage content-->
    <div style="width: 100%; height: 100%; margin-left: 0px;">

        <asp:TabContainer ID="MyAjaxTabContainer" runat="server" OnClientActiveTabChanged="resizeMap" UseVerticalStripPlacement="false" ActiveTabIndex="1" Visible="True" BackColor="#e75050" ForeColor="#333333" BorderColor="#E75050" BorderStyle="Double" BorderWidth="10px">
            <asp:TabPanel ID="Insert_TabInsertPet" runat="server" HeaderText="Insert" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>
                    <table id="Table12" width="100%" cellspacing="10" bgcolor="#efeeef">
                        <tr>
                            <td colspan="5" style="padding-left: 10px">
                                <br />
                                <br />
                                <asp:Label ID="Insert_lbl_pet_Error"
                                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="Silver"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" style="padding-left: 10px">
                                <asp:Label runat="server" Text="Choose Disaster" Font-Bold="True" ForeColor="Black" Font-Size="18pt"></asp:Label>
                            </td>
                            <td colspan="3"></td>
                        </tr>

                        <tr>
                            <td style="font-weight: bold; padding-left: 10px;" colspan="1" align="left" class="auto-style3">
                                <asp:Label ID="Insert_dmcslabel1" Text="Call Center:" runat="server"></asp:Label>
                                <br />
                                <asp:DropDownList ID="Insert_DDL_Call_Center" runat="server" Height="23px" Width="147px"
                                    DataSourceID="SqlDataSource1" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="1"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Call Center</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [call_center_name], [call_center_id] FROM [call_center]"></asp:SqlDataSource>
                            </td>
                            <td style="font-weight: bold; padding-left: 10px;" colspan="1" align="left" class="auto-style3">
                                <asp:Label ID="Insert_Label134" Text="Disaster:" runat="server"></asp:Label>
                                <br />
                                <asp:DropDownList ID="Insert_DDlDisasters" runat="server" Height="23px" Width="147px"
                                    DataSourceID="SqlDataSource2" DataValueField="disaster_id" DataTextField="disaster_Name" TabIndex="2"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Disaster</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                            </td>
                            <td colspan="3" class="auto-style3">

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" style="padding-left: 10px">
                                <asp:Label ID="Insert_sClient_L" runat="server" Text="Search For Owner" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%"></asp:Label>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold; padding-left: 10px;" colspan="1" align="left" class="auto-style3">
                                <asp:Label ID="Insert_firstName_L" Text="First Name:" runat="server"></asp:Label><br />
                                <asp:TextBox ID="Insert_txtFirstName" runat="server" Width="177px" TabIndex="3"></asp:TextBox>
                            </td>
                            <td style="font-weight: bold; padding-left: 10px;" colspan="2" align="left" class="auto-style3">
                                <asp:Label ID="Insert_lastName_L" Text="Last Name:" runat="server"></asp:Label><br />
                                <asp:TextBox ID="Insert_txtLastName" runat="server" Width="177px" TabIndex="4"></asp:TextBox>
                            </td>
                            <td colspan="1" align="left" class="auto-style3">
                                <asp:Button ID="Insert_btnNameSearch" Text="Search Client" runat="server"
                                    OnClick="Insert_BtnNameSearch_Click" TabIndex="5" />
                            </td>
                            <td class="auto-style3"></td>
                        </tr>
                    </table>
                    <table id="Table12" width="100%" cellspacing="10" bgcolor="#efeeef">
                        <tr>
                            <td width="100%" style="background-color: gray" height="10px" borderwidth="5px"></td>
                        </tr>
                        <tr>
                            <td align="left" width="30%" style="padding-left: 10px">
                                <asp:GridView ID="Insert_gvClientSearchresult" runat="server"
                                    AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                    OnSelectedIndexChanged="Insert_gvClientSearchresult_SelectedIndexChanged"
                                    OnPageIndexChanging="Insert_gvClientSearchresult_PageIndexChanging"
                                    DataKeyNames="person_id" AllowPaging="True" EnableTheming="False" AllowSorting="True" 
                                    BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A"
                                    Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" Visible="False" />
                                        <asp:BoundField DataField="f_name" HeaderText="f_name" SortExpression="f_name" />
                                        <asp:BoundField DataField="m_initial" HeaderText="m_initial" SortExpression="m_initial" />
                                        <asp:BoundField DataField="l_name"
                                            HeaderText="l_name" SortExpression="l_name" />
                                        <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" SortExpression="phone_primary" />
                                        <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" SortExpression="phone_secondary" Visible="False" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                    </Columns>

                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                    <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                    <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                    <RowStyle BackColor="#CCCCCC"></RowStyle>
                                    <SelectedRowStyle BackColor="#EA4C4C" Font-Bold="True" ForeColor="#CCCCCC"></SelectedRowStyle>
                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                    <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>

                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:localhost %>' SelectCommand="SELECT [person_id], [f_name], [m_initial], [l_name], [phone_primary], [phone_secondary], [email] FROM [person]"></asp:SqlDataSource>



                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-left: 10px;" width="100%">
                                <asp:GridView ID="Insert_GVcases" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Case_id" OnSelectedIndexChanged="Insert_GVcases_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A"
                                    Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Case_id" HeaderText="Case number" />
                                        <asp:BoundField DataField="applic_start_date_time" HeaderText="Case open Date" />
                                        <asp:BoundField DataField="applic_end_date_time" HeaderText="Case Close Date" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                    <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                    <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                    <RowStyle BackColor="#CCCCCC"></RowStyle>
                                    <SelectedRowStyle BackColor="#EA4C4C" Font-Bold="True" ForeColor="#CCCCCC"></SelectedRowStyle>
                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                    <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="padding-left: 10px; padding-right: 10px;" width="100%">
                                <asp:Button ID="Insert_changeClient" runat="server" OnClick="Insert_changeClient_Click" Text="Search Again" Visible="False" Width="99%" BackColor="#666666" ForeColor="#EFEEEF" />
                            </td>
                        </tr>
                        </tr>
                    </table>


                    <div>
                        <asp:Panel ID="Insert_PetInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Insert_label106" runat="server" Text="Pet Information" Font-Size="Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Insert_PetInfoBody" runat="server">
                            <div>
                                <table id="Insert_tbl_Pet" width="100%" style="font-family: Tahoma" cellspacing="10">
                                </table>



                                <div style="padding: 10px">
                                    <asp:Label ID="Label10" runat="server" Text="What type of pet?" Font-Bold="True" Font-Size="Large"></asp:Label>






                                </div>


                                <table id="Insert_typeTable" width="100%" cellspacing="10" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Species:*&nbsp;
                        <br />

                                            <asp:DropDownList ID="Insert_petSpecies_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Canine">Canine (e.g. Dog)</asp:ListItem>
                                                    <asp:ListItem Value="Feline">Feline (e.g. Cat)</asp:ListItem>
                                                    <asp:ListItem Value="Guinea Pig">Guinea Pig</asp:ListItem>
                                                    <asp:ListItem Value="Rabbit">Rabbit</asp:ListItem>
                                                    <asp:ListItem Value="Ferret">Ferret</asp:ListItem>
                                                    <asp:ListItem Value="Rodent">Rodent (e.g. Hamster)</asp:ListItem>
                                                    <asp:ListItem Value="Snake">Snake</asp:ListItem>
                                                    <asp:ListItem Value="Lizard">Lizard</asp:ListItem>
                                                    <asp:ListItem Value="Turtle">Turtle</asp:ListItem>
                                                    <asp:ListItem Value="Bird">Bird</asp:ListItem>
                                                    <asp:ListItem Value="Sheep">Sheep</asp:ListItem>
                                                    <asp:ListItem Value="Horse">Horse</asp:ListItem>
                                                    <asp:ListItem Value="Cattle">Cattle (e.g. Cow)</asp:ListItem>
                                                    <asp:ListItem Value="Fowl">Fowl (e.g. Chicken)</asp:ListItem>
                                                    <asp:ListItem Value="Bore">Bore (e.g. Pig)</asp:ListItem>
                                                    <asp:ListItem Value="Llama">Llama</asp:ListItem>
                                                </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petSpecies_ddl" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>
                                                




                                        </td>

                                        <td align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Type:*&nbsp;
                        <br />
                                            <asp:DropDownList ID="Insert_petType_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Dog">Dog</asp:ListItem>
                                                    <asp:ListItem Value="Cat">Cat</asp:ListItem>
                                                    <asp:ListItem Value="Small Mammal">Small Mammal (e.g. Guinea Pig)</asp:ListItem>
                                                    <asp:ListItem Value="Reptile">Reptile (e.g. Snake)</asp:ListItem>
                                                    <asp:ListItem Value="Bird">Bird (e.g. Parrot)</asp:ListItem>
                                                    <asp:ListItem Value="Sheep">Sheep</asp:ListItem>
                                                    <asp:ListItem Value="Horse">Horse</asp:ListItem>
                                                    <asp:ListItem Value="Cattle">Cattle (e.g. Cow)</asp:ListItem>
                                                    <asp:ListItem Value="Fowl">Fowl (e.g. Chicken)</asp:ListItem>
                                                    <asp:ListItem Value="Bore">Bore (e.g. Pig)</asp:ListItem>
                                                    <asp:ListItem Value="Llama">Llama</asp:ListItem>
                                                </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petType_ddl" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>







                                        </td>
                                        <td align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Breed:*&nbsp;
                        <br />
                                            <asp:TextBox ID="Insert_petBreed_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="13"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petBreed_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>







                                        </td>
                                        <td align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Gender:*
                        <br />
                                            <asp:DropDownList ID="Insert_petGender_DDL" runat="server" TabIndex="14" ClientIDMode="Static" Width="121px">
                                                <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                <asp:ListItem Text="Male" Value="m"></asp:ListItem>
                                                <asp:ListItem Text="Female" Value="f"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petGender_DDL" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>







                                        </td>
                                        <td align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Color:*<br />
                                            <asp:TextBox ID="Insert_petColor_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petColor_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>







                                        </td>
                                    </tr>
                                    <table id="Insert_Table10" bgcolor="Silver" cellspacing="10" width="100%">
                                        <tr>
                                            <td align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Is the Pet Missing?&nbsp;
                                <br />
                                                <asp:RadioButton ID="Insert_missingYes" runat="server" AutoPostBack="True" OnCheckedChanged="Insert_missingChangedYes" TabIndex="16" Text="Yes" TextAlign="Left" Checked="True" />
                                            </td>
                                            <td align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Is the Pet Deceased?&nbsp;
                                <br />
                                                <asp:RadioButton ID="Insert_deceasedYes" runat="server" AutoPostBack="True" OnCheckedChanged="Insert_deceasedChangedYes" TabIndex="18" Text="Yes" TextAlign="Left" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div style="padding: 10px">
                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" Text="What other information do you have on this pet?"></asp:Label>
                                    </div>
                                    <table id="Insert_Table1" bgcolor="#efeeef" border="3px" cellspacing="10" width="100%">
                                        <tr>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Pet Name:*&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petName_txt" runat="server" ClientIDMode="Static" TabIndex="20" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petName_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="left" colspan="1" style="padding-left: 10px; padding-right: 10px;">Date Of Birth:&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petDateOfBirth_txt" runat="server" ClientIDMode="Static" TabIndex="21" Width="121px"></asp:TextBox>
                                                <asp:CompareValidator id="CompareValidator6" ValidationGroup="valGroup_Insert" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Insert_petDateOfBirth_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                                                <asp:CalendarExtender ID="CalendarExtender8" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Insert_petDateOfBirth_txt"></asp:CalendarExtender>
                                                
                                                <td align="left" colspan="1" nowrap="nowrap" style="width: 143px; height: 121px;">Is the pet Neutered?
                                    <br />
                                                    <asp:DropDownList ID="Insert_petNeutered_DDL" runat="server" ClientIDMode="Static" TabIndex="22" Width="121px">
                                                        <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                        <asp:ListItem Text="Yes" Value="y"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="n"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Weight:&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petWeight_txt" runat="server" ClientIDMode="Static" TabIndex="23" Width="121px"></asp:TextBox>
                                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_petWeight_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">RFID:&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petRFID_txt" runat="server" ClientIDMode="Static" TabIndex="24" Width="121px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table id="Insert_Table2" bgcolor="#efeeef" border="3px" cellspacing="10" width="100%">
                                        <tr>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">License Tag:&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petLicenseTag_txt" runat="server" ClientIDMode="Static" TabIndex="25" Width="121px"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="1" style="padding-left: 10px; padding-right: 10px;">Vet. ID:&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petVetID_txt" runat="server" ClientIDMode="Static" TabIndex="26" Width="121px"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Tatoo Number:&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petTatooNumber_txt" runat="server" ClientIDMode="Static" TabIndex="27" Width="121px"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Pet Condition:*&nbsp;
                                <br />
                                                <asp:DropDownList ID="Insert_petCondition_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Healthy">Healthy</asp:ListItem>
                                                    <asp:ListItem Value="Disabled">Disabled</asp:ListItem>
                                                    <asp:ListItem Value="Sick">Sick</asp:ListItem>
                                                    <asp:ListItem Value="Requires Medication">Requires Medication</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Pet Status:*<br />
                                                <asp:TextBox ID="Insert_petStatus_txt" runat="server" ClientIDMode="Static" TabIndex="29" Width="121px" ReadOnly="True" Text="Missing"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petStatus_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            </td>
                                        </tr>
                                    </table>
                                    <table bgcolor="#efeeef" border="3px" cellspacing="8" width="100%">
                                        <tr>
                                            <td align="center" colspan="6" style="padding-left: 10px; padding-right: 10px;">Pet Discription:*&nbsp;
                                <br />
                                                <asp:TextBox ID="Insert_petDiscription_txt" runat="server" ClientIDMode="Static" Height="131px" TabIndex="30" TextMode="MultiLine" Width="428px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_petDiscription_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            </td>
                                            <td align="center" colspan="4" style="font-weight: bold;">Add or edit a picture of the pet:<br />
                                                <asp:Image ID="Insert_Preview_ImageBox"  runat="server" Width="200px" ImageUrl="Image/petPlaceHolder.png" Height="125px"></asp:Image><br />
                                                <asp:FileUpload ID="Insert_FileUpload1" runat="server" ValidationGroup="valGroup_Image_Name" onchange="this.form.submit()" BackColor="Silver" /><asp:Button ID="Insert_Change_PetImage_btn" Width="200px" runat="server" Text="Change Image" OnClick="Insert_Change_PetImage_btn_Click" Visible="False" Height="31px" />
                                                <asp:Label ID="Insert_Image_Name" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </table>
                            </div>
                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Insert_cpePetInfo" runat="server" CollapseControlID="Insert_PetInfoHead" CollapsedText="Show Pet Information" Enabled="True" ExpandControlID="Insert_PetInfoHead" ExpandedText="Hide Pet Information" TargetControlID="Insert_PetInfoBody" TextLabelID="Insert_label106"></asp:CollapsiblePanelExtender>
                    </div>

                    <div>
                        <asp:Panel ID="Insert_PetMissingInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Insert_label2" runat="server" Text="Pet Missing Information" Font-Size="Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Insert_PetMissingInfoBody" runat="server">
                            <div>
                                <table width="100%" style="font-family: Tahoma;" cellspacing="10">

                                    <tr>
                                        <td colspan="10">
                                            <asp:Label ID="Insert_lblSearchErrormsg"
                                                runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>





                                        </td>
                                    </tr>

                                </table>



                                <div style="padding: 10px">
                                    <asp:Label ID="Label12" runat="server" Text="Pet Missing Information " Font-Bold="True" Font-Size="Large"></asp:Label>






                                </div>



 <table id="Insert_Table7" width="100%" cellspacing="10" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td width="100%" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Date and time pet went missing:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" align="left" style="padding-left: 10px; padding-right: 10px;">Date:*<br />
                                            <asp:TextBox ID="Insert_DateMissing_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="32"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_DateMissing_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator id="CompareValidator2" ValidationGroup="valGroup_Insert" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Insert_DateMissing_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Insert_DateMissing_txt"></asp:CalendarExtender>
                                                

                                        </td>
                                        <td width="50%" align="left" style="padding-left: 10px; padding-right: 10px;">Years Of Ownership:<br />
                                            <asp:TextBox ID="Insert_LengthOwned_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="34"></asp:TextBox>
                                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_LengthOwned_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Time:*&nbsp;
                            <br />
                                            <asp:TextBox ID="Insert_TimeLost_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="33"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_TimeLost_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>







                                        </td>





                                        <td width="50%" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Insert_rewardAmount_L" runat="server" Text="Reward Amount:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_RewardAmt_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="38"></asp:TextBox>
                                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_RewardAmt_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" width="50%"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Insert_Label5" runat="server" Text="Collar Discription:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_collarDescription_txt" runat="server" Width="426px" ClientIDMode="Static" Height="105px" TextMode="MultiLine" TabIndex="39"></asp:TextBox>

                                        </td>
                                        <td align="left" width="50%" rowspan="2"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Insert_Label6" runat="server" Text="How Did The Pet Become Lost?:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_lostExplanation_txt" runat="server" Width="426px" ClientIDMode="Static" Height="260px" TextMode="MultiLine" TabIndex="40"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" width="50%"
                                            style="padding-left: 10px; padding-right: 10px;">Breader Information::&nbsp;
                        <br />
                                            <asp:TextBox ID="Insert_Breeder_txt" runat="server" Width="426px" ClientIDMode="Static" Height="105px" TextMode="MultiLine" TabIndex="41"></asp:TextBox>

                                        </td>


                                    </tr>

                                </table>
                                                            </div>
                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Insert_PetMissing_CPE" runat="server" CollapseControlID="Insert_PetMissingInfoHead" CollapsedText="Show Pet Missing Information" Enabled="True" ExpandControlID="Insert_PetMissingInfoHead" ExpandedText="Hide Pet Missing Information" TargetControlID="Insert_PetMissingInfoBody" TextLabelID="Insert_label2"></asp:CollapsiblePanelExtender>
                    </div>

                    <div>
                        <asp:Panel ID="Insert_PetDeceasedInfoHead" runat="server" CssClass="PanelHead" Visible="False" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Insert_label1" runat="server" Text="Is the pet deceased?" Font-Size="Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Insert_PetDeceasedInfoBody" runat="server" Visible="False">
                            <div>
                                <table width="100%" style="font-family: Tahoma" cellspacing="10">

                                    <tr>
                                        <td colspan="10">
                                            <asp:Label ID="Insert_Label3"
                                                runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>





                                        </td>
                                    </tr>

                                </table>



                                <div style="padding: 10px">
                                    <asp:Label ID="Label13" runat="server" Text="Death Information " Font-Bold="True" Font-Size="Large"></asp:Label>






                                </div>




                                <table id="Insert_Table5" width="100%" cellspacing="10" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td colspan="5" align="center"
                                            style="padding-left: 10px; padding-right: 10px;">Date found:*
                        <br />
                                            <asp:TextBox ID="Insert_DateDeceased_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="44"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_DateDeceased_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator id="CompareValidator1" ValidationGroup="valGroup_Insert" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Insert_DateDeceased_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Insert_DateDeceased_txt"></asp:CalendarExtender>
                                               






                                        </td>
                                        <td colspan="5" align="center"
                                            style="padding-left: 10px; padding-right: 10px;">Service Type:*
                        <br />
                                            <asp:DropDownList ID="Insert_serviceType_DDL" runat="server" TabIndex="45" OnSelectedIndexChanged="Insert_serviceTypeChange" ClientIDMode="Static" AutoPostBack="True">
                                                <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                <asp:ListItem Text="Cremation" Value="C"></asp:ListItem>
                                                <asp:ListItem Text="Burial" Value="B"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_serviceType_DDL" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>






                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" align="center"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Insert_cemetaryName_L" runat="server" Text="Cemetary Name or Location Information:" Visible="False"></asp:Label>






                                            <br />
                                            <asp:TextBox ID="Insert_cemetaryName_txt" runat="server" Width="426px" ClientIDMode="Static" Visible="False" Height="105px" TextMode="MultiLine" TabIndex="46"></asp:TextBox>






                                        </td>
                                        <td colspan="5" align="center"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Insert_funeral_L" runat="server" Text="Funeral Information:" Visible="False"></asp:Label>






                                            <br />
                                            <asp:TextBox ID="Insert_funeral_txt" runat="server" Width="426px" ClientIDMode="Static" Visible="False" Height="105px" TextMode="MultiLine" TabIndex="47"></asp:TextBox>






                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Insert_CollapsiblePanelExtender1" runat="server" CollapseControlID="Insert_PetDeceasedInfoHead" CollapsedText="Show Pet Deceased Information" Enabled="True" ExpandControlID="Insert_PetDeceasedInfoHead" ExpandedText="Hide Pet Deceased Information" TargetControlID="Insert_PetDeceasedInfoBody" TextLabelID="Insert_label1"></asp:CollapsiblePanelExtender>
                    </div>

                    <div>
                        <asp:Panel ID="Insert_PetLocationInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Insert_label1111" runat="server" Text="Location of Pet" Font-Size="Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Insert_PetLocationInfoBody" runat="server">
                            <div>
                                <table width="100%" style="font-family: Tahoma" cellspacing="10">

                                    <tr>
                                        <td>
                                            <asp:Label ID="Insert_Label8"
                                                runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>





                                        </td>
                                    </tr>

                                </table>


                                <div style="padding: 10px">
                                    <asp:Label ID="Insert_locationknown_L" runat="server" Text="Where was the pet last seen? " Font-Bold="True" Font-Size="Large"></asp:Label>






                                </div>


                                <table id="Table9" width="100%" cellspacing="12" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Address:*
                        <br />
                                            <asp:TextBox ID="Insert_address_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="48"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_address_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>






                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">City:*
                        <br />
                                            <asp:TextBox ID="Insert_city_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="49"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_city_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>







                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">State:*
                        <br />
                                            <asp:TextBox ID="Insert_state_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_state_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>







                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Zip:*
                        <br />
                                            <asp:TextBox ID="Insert_zip_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="51"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_zip_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_zip_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>







                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">County:*
                        <br />
                                            <asp:TextBox ID="Insert_county_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="52"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_county_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>







                                        </td>
                                        <td colspan="1" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">lat:*
                        <br />
                                            <asp:TextBox ID="Insert_lat_txt" runat="server" Width="30px" ClientIDMode="Static" TabIndex="53"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_lat_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_lat_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>








                                        </td>
                                        <td colspan="1" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Long:*
                        <br />
                                            <asp:TextBox ID="Insert_long_txt" runat="server" Width="30px" ClientIDMode="Static" TabIndex="54"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_long_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_long_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>
                                                






                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Label19" runat="server" Text="Location Discription:"></asp:Label>






                                            <br />
                                            <asp:TextBox ID="Insert_LocationDiscription_txt" runat="server" Width="426px" ClientIDMode="Static" Height="105px" TextMode="MultiLine" TabIndex="56"></asp:TextBox>






                                        </td>
                                        <td colspan="3" align="left" style="padding-left: 10px; padding-right: 10px;">Date Found:*
                        <br />
                                            <asp:TextBox ID="Insert_dateFound_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="55"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_dateFound_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Insert_dateFound_txt"></asp:CalendarExtender>
                                                






                                        </td>
                                    </tr>
                                    <tr>

                                        <td align="left"
                                            style="padding-left: 10px; padding-right: 10px;" colspan="12">

                                            <div id="tab1_map" style="width: 100%; height: 500px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Insert_CollapsiblePanelExtender2" runat="server" CollapseControlID="Insert_PetLocationInfoHead" CollapsedText="Show Pet Location Information" Enabled="True" ExpandControlID="Insert_PetLocationInfoHead" ExpandedText="Hide Pet Location Information" TargetControlID="Insert_PetLocationInfoBody" TextLabelID="Insert_label1111"></asp:CollapsiblePanelExtender>
                    </div>

                    <table width=" 100%">
                        <tr align="center">
                            <td></td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Insert_Back_btn" runat="server" Text="Back" Height="30px" Width="120px" TabIndex="58"></asp:Button>






                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">

                                <asp:Button ID="Insert_btn" runat="server" Text="Insert" Height="30px" Width="120px" OnClick="Insert" TabIndex="57" ValidationGroup="valGroup_Insert"></asp:Button>





                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Insert_Clear_btn" runat="server" Text="Clear" Height="30px" Width="120px" TabIndex="59" OnClientClick="clear()"></asp:Button>






                            </td>
                            <td></td>
                        </tr>
                    </table>
                </ContentTemplate>










            </asp:TabPanel>

            <asp:TabPanel ID="Update_TabUpdatePet" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>
                    <table id="Update_Table11" width="100%" cellspacing="10" bgcolor="#efeeef">
                        <tr>
                            <td colspan="5" style="padding-right: 10px; padding-left: 10px;">
                                <asp:Label ID="Update_lbl_pet_Error"
                                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="Silver"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" style="padding-right: 10px; padding-left: 10px;">
                                <asp:Label runat="server" Text="Choose Disaster" Font-Bold="True" ForeColor="Black" Font-Size="18pt"></asp:Label>

                            </td>
                            <td colspan="3"></td>
                        </tr>

                        <tr>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;" colspan="1" align="left">
                                <asp:Label ID="Update_dmcslabel1" Text="Call Center:*" runat="server"></asp:Label>

                                <br />
                                <asp:DropDownList ID="Update_DDL_Call_Center" runat="server" Height="23px" Width="147px"
                                    DataSourceID="Update_CallCenters" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="1"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Call Center</asp:ListItem>
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="Update_CallCenters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>"
                                    SelectCommand="SP_DMCS_Get_Call_centers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;" colspan="1" align="left">
                                <asp:Label ID="Update_Label134" Text="Disaster:*" runat="server"></asp:Label>

                                <br />
                                <asp:DropDownList ID="Update_DDlDisasters" runat="server" Height="23px" Width="147px"
                                    DataSourceID="Update_sqldisasters" DataValueField="disaster_id" DataTextField="disaster_Name" TabIndex="2"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Disaster</asp:ListItem>
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="Update_sqldisasters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>"
                                    SelectCommand="SP_DMCS_Get_disasters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                            </td>

                            <td colspan="3"></td>



                        </tr>
                        <tr>
                            <td colspan="2" align="left" style="padding-right: 10px; padding-left: 10px;">
                                <asp:Label ID="Update_PetSearchSelected_L" runat="server" Text="Search For The Pet*" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%" Font-Overline="False"></asp:Label>

                            </td>

                        </tr>

                        <tr>

                            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                                <asp:Label ID="Update_petName_L" Text="Pet Name: " runat="server"></asp:Label>

                                <br />
                                <asp:TextBox ID="Update_sPetName_txt" runat="server" Width="121px" TabIndex="6" ClientIDMode="Static" OnTextChanged="Update_sPetName_txt_TextChanged"></asp:TextBox>

                            </td>


                            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                                <asp:Label ID="Update_petType_L" Text="Pet Type: " runat="server"></asp:Label>

                                <br />
                                <asp:DropDownList ID="Update_sPetType_DDL" runat="server" TabIndex="7"  ClientIDMode="Static" Width="121px">
                                    <asp:ListItem Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="Canine">Canine (e.g. Dog)</asp:ListItem>
                                    <asp:ListItem Value="Feline">Feline (e.g. Cat)</asp:ListItem>
                                    <asp:ListItem Value="Guinea Pig">Guinea Pig</asp:ListItem>
                                    <asp:ListItem Value="Rabbit">Rabbit</asp:ListItem>
                                    <asp:ListItem Value="Ferret">Ferret</asp:ListItem>
                                    <asp:ListItem Value="Rodent">Rodent (e.g. Hamster)</asp:ListItem>
                                    <asp:ListItem Value="Snake">Snake</asp:ListItem>
                                    <asp:ListItem Value="Lizard">Lizard</asp:ListItem>
                                    <asp:ListItem Value="Turtle">Turtle</asp:ListItem>
                                    <asp:ListItem Value="Bird">Bird</asp:ListItem>
                                    <asp:ListItem Value="Sheep">Sheep</asp:ListItem>
                                    <asp:ListItem Value="Horse">Horse</asp:ListItem>
                                    <asp:ListItem Value="Cattle">Cattle (e.g. Cow)</asp:ListItem>
                                    <asp:ListItem Value="Fowl">Fowl (e.g. Chicken)</asp:ListItem>
                                    <asp:ListItem Value="Bore">Bore (e.g. Pig)</asp:ListItem>
                                    <asp:ListItem Value="Llama">Llama</asp:ListItem>
                                </asp:DropDownList>

                            </td>
                            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                                <asp:Label ID="Update_petBreed_L" Text="Pet Breed: " runat="server"></asp:Label>

                                <br />
                                <asp:TextBox ID="Update_sPetBreed_txt" runat="server" Width="121px" TabIndex="8" ClientIDMode="Static" OnTextChanged="Update_sPetName_txt_TextChanged"></asp:TextBox>

                            </td>
                            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                                <asp:Button ID="Update_searchByDisc_btn" Text="Search Pets" runat="server"
                                    OnClick="BtnPetNameSearch_Click" TabIndex="10" Width="212px" />

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" style="padding-left: 10px; padding-right: 10px;">
                                <asp:Label ID="Update_sClient_L" runat="server" Text="Search For Owner" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                                <asp:Label ID="Update_firstName_L" Text="First Name:" runat="server"></asp:Label>

                                <br />
                                <asp:TextBox ID="Update_txtfirstname" runat="server" Width="121px" TabIndex="3"></asp:TextBox>

                            </td>
                            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                                <asp:Label ID="Update_lastName_L" Text="Last Name:" runat="server"></asp:Label>

                                <br />
                                <asp:TextBox ID="Update_txtlastname" runat="server" Width="121px" TabIndex="4"></asp:TextBox>

                            </td>
                            <td colspan="1"></td>
                            <td colspan="2" align="left" style="padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Update_BtnNameSearch" Text="Search Client" runat="server"
                                    OnClick="Update_BtnNameSearch_Click" TabIndex="5" Width="212px" />

                            </td>

                        </tr>
                    </table>
                    <table id="Update_Table11" width="100%" cellspacing="10" bgcolor="#efeeef">

                        <tr>
                            <td width="100%" colspan="2" style="background-color: gray; padding-right: 10px; padding-left: 10px;" height="10px"></td>
                        </tr>
                        <tr>
                            <td align="center" width="100%" style="padding-right: 10px; padding-left: 10px;">
                                <asp:GridView ID="Update_gvPetSearchresult" runat="server"
                                    AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                    OnSelectedIndexChanged="gvPetSearchresult_SelectedIndexChanged"
                                    OnPageIndexChanging="gvPetSearchresult_PageIndexChanging"
                                    DataKeyNames="Pet_Record_ID" AllowPaging="True" EnableTheming="False" AllowSorting="True"  ClientIDMode="Static"
                                    BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A"
                                    Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center" OnRowDataBound="Update_RowDataBound">
                                    <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Pet_Record_ID" Visible="False" />
                                        <asp:BoundField DataField="Pet_Name" HeaderText="The Pets Name" SortExpression="Name" />
                                        <asp:BoundField DataField="Pet_Gender" HeaderText="The Pets Gender" SortExpression="Age" />
                                        <asp:BoundField DataField="Pet_Color" HeaderText="The Pets Color" SortExpression="Color" />
                                        <asp:ImageField DataImageUrlField = "Pet_Record_ID" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID={0}" HeaderText = "Preview Image" >
                                            <ControlStyle Height="100px" Width="150px" />
                                        </asp:ImageField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                    <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                    <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                    <RowStyle BackColor="#CCCCCC"></RowStyle>
                                    <SelectedRowStyle BackColor="#EA4C4C" Font-Bold="True" ForeColor="#CCCCCC"></SelectedRowStyle>
                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                    <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>



                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="100%" style="padding-right: 10px; padding-left: 10px;">
                                <asp:GridView ID="Update_gvClientSearchresult" runat="server"
                                    AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                    OnSelectedIndexChanged="Update_gvClientSearchresult_SelectedIndexChanged"
                                    DataKeyNames="person_id" AllowPaging="True" EnableTheming="False" AllowSorting="True" 
                                    BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A"
                                    Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="person_id" Visible="False" />
                                        <asp:BoundField DataField="f_name" HeaderText="First Name" SortExpression="First Name" />
                                        <asp:BoundField DataField="m_initial" HeaderText="Initial" SortExpression="Initial" />
                                        <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="Last Name" />
                                        <asp:BoundField DataField="phone_primary" HeaderText="Phone" SortExpression="Phone" />
                                        <asp:BoundField DataField="phone_secondary" HeaderText="Alt Phone" SortExpression="Alt Phone" Visible="False" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="ssn" HeaderText="Social Security #" SortExpression="Social Security #" Visible="False" />
                                        <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver/State ID" SortExpression="Driver/State ID" Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                    <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                    <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                    <RowStyle BackColor="#CCCCCC"></RowStyle>
                                    <SelectedRowStyle BackColor="#EA4C4C" Font-Bold="True" ForeColor="#CCCCCC"></SelectedRowStyle>
                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                    <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>

                        </tr>
                        <tr>
                            <td align="center" width="100%" style="padding-right: 10px; padding-left: 10px;">
                                <asp:GridView ID="Update_GVcases" runat="server"
                                    AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                    DataKeyNames="Case_id" AllowPaging="True"
                                    OnSelectedIndexChanged="Update_GVcases_SelectedIndexChanged"
                                    BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A"
                                    Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Case_id" HeaderText="Case number" />
                                        <asp:BoundField DataField="applic_start_date_time" HeaderText="Case open Date" />
                                        <asp:BoundField DataField="applic_end_date_time" HeaderText="Case Close Date" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                    <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                    <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                    <RowStyle BackColor="#CCCCCC"></RowStyle>
                                    <SelectedRowStyle BackColor="#EA4C4C" Font-Bold="True" ForeColor="#CCCCCC"></SelectedRowStyle>
                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                    <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>


                            </td>
                        </tr>
                    </table>


                    <div>
                        <asp:Panel ID="Update_PetInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Update_label106" runat="server" Text="Pet Information " Font-Size="Large"></asp:Label>

                        </asp:Panel>

                        <asp:Panel ID="Update_PetInfoBody" runat="server">

                            <div>
                                <table id="Update_Insert_tbl_Pet" width="100%" style="font-family: Tahoma" cellspacing="10">
                                </table>



                                <div style="padding-left: 10px; padding-right: 10px;">
                                    <asp:Label ID="Update_Label18" runat="server" Text="What type of pet?" Font-Bold="True" Font-Size="Large"></asp:Label>

                                </div>


                                <table id="Update_typeTable" width="100%" cellspacing="10" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Species:*&nbsp;
                        <br />
                                            <asp:DropDownList ID="Update_petSpecies_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Canine">Canine (e.g. Dog)</asp:ListItem>
                                                    <asp:ListItem Value="Feline">Feline (e.g. Cat)</asp:ListItem>
                                                    <asp:ListItem Value="Guinea Pig">Guinea Pig</asp:ListItem>
                                                    <asp:ListItem Value="Rabbit">Rabbit</asp:ListItem>
                                                    <asp:ListItem Value="Ferret">Ferret</asp:ListItem>
                                                    <asp:ListItem Value="Rodent">Rodent (e.g. Hamster)</asp:ListItem>
                                                    <asp:ListItem Value="Snake">Snake</asp:ListItem>
                                                    <asp:ListItem Value="Lizard">Lizard</asp:ListItem>
                                                    <asp:ListItem Value="Turtle">Turtle</asp:ListItem>
                                                    <asp:ListItem Value="Bird">Bird</asp:ListItem>
                                                    <asp:ListItem Value="Sheep">Sheep</asp:ListItem>
                                                    <asp:ListItem Value="Horse">Horse</asp:ListItem>
                                                    <asp:ListItem Value="Cattle">Cattle (e.g. Cow)</asp:ListItem>
                                                    <asp:ListItem Value="Fowl">Fowl (e.g. Chicken)</asp:ListItem>
                                                    <asp:ListItem Value="Bore">Bore (e.g. Pig)</asp:ListItem>
                                                    <asp:ListItem Value="Llama">Llama</asp:ListItem>
                                                </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petSpecies_ddl" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>
                                                
                                        </td>

                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Type:*&nbsp;
                        <br />
                                            <asp:DropDownList ID="Update_petType_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Dog">Dog</asp:ListItem>
                                                    <asp:ListItem Value="Cat">Cat</asp:ListItem>
                                                    <asp:ListItem Value="Small Mammal">Small Mammal (e.g. Guinea Pig)</asp:ListItem>
                                                    <asp:ListItem Value="Reptile">Reptile (e.g. Snake)</asp:ListItem>
                                                    <asp:ListItem Value="Bird">Bird (e.g. Parrot)</asp:ListItem>
                                                    <asp:ListItem Value="Sheep">Sheep</asp:ListItem>
                                                    <asp:ListItem Value="Horse">Horse</asp:ListItem>
                                                    <asp:ListItem Value="Cattle">Cattle (e.g. Cow)</asp:ListItem>
                                                    <asp:ListItem Value="Fowl">Fowl (e.g. Chicken)</asp:ListItem>
                                                    <asp:ListItem Value="Bore">Bore (e.g. Pig)</asp:ListItem>
                                                    <asp:ListItem Value="Llama">Llama</asp:ListItem>
                                                </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petType_ddl" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>


                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Pet Breed:*&nbsp;
                        <br />
                                            <asp:TextBox ID="Update_petBreed_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="13"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petBreed_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>


                                        </td>
                                        <td colspan="1" align="left"
                                            style="width: 143px; height: 53px;">Pet Gender:*
                        <br />
                                            <asp:DropDownList ID="Update_petGender_DDL" runat="server" TabIndex="14" ClientIDMode="Static" Width="121px">
													<asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
													<asp:ListItem Text="Male" Value="m"></asp:ListItem>
													<asp:ListItem Text="Female" Value="f"></asp:ListItem>
												</asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petGender_DDL" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>


                                        </td>
                                        <td colspan="2" align="left"
                                            style="height: 16px;">Pet Color:*<br />
                                            <asp:TextBox ID="Update_petColor_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petColor_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                

                                        </td>
                                    </tr>
                                    <table width="100%" cellspacing="10" bgcolor="Silver">
                                        <tr>
                                            <td align="center"
                                                style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Is the Pet Missing?&nbsp;
                        <br />
                                                <asp:RadioButton ID="Update_missingYes" runat="server" Text="Yes" OnCheckedChanged="Update_missingChangedYes" AutoPostBack="True" TabIndex="16" TextAlign="Left" Checked="True" />

                                            </td>
                                            <td align="center"
                                                style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Is the Pet Deceased?&nbsp;
                        <br />
                                                <asp:RadioButton ID="Update_deceasedYes" runat="server" Text="Yes" OnCheckedChanged="Update_deceasedChangedYes" AutoPostBack="True" TabIndex="18" TextAlign="Left" />

                                            </td>
                                        </tr>
                                    </table>


                                    <div style="padding-left: 10px; padding-right: 10px;">
                                        <asp:Label ID="Update_Label17" runat="server" Font-Bold="True" Font-Size="Large" Text="What other information do you have on this pet"></asp:Label>

                                    </div>
                                    <table id="Update_Table1" bgcolor="#efeeef" border="3px" cellspacing="10" width="100%">
                                        <tr>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Pet Name:*<br />
                                                <asp:TextBox ID="Update_petName_txt" runat="server" ClientIDMode="Static" TabIndex="20" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petName_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>


                                            </td>
                                            <td align="left" colspan="1" style="padding-left: 10px; padding-right: 10px;">Date Of Birth:&nbsp;
                                <br />
                                                <asp:TextBox ID="Update_petDateOfBirth_txt" runat="server" ClientIDMode="Static" TabIndex="21" Width="121px"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Update_petDateOfBirth_txt"></asp:CalendarExtender>
                                                

                                                <td align="left" colspan="1" nowrap="nowrap" style="width: 143px; height: 53px;">Is the pet Neutered?
                                    <br />
                                                    <asp:DropDownList ID="Update_petNeutered_DDL" runat="server" ClientIDMode="Static" TabIndex="22" Width="121px">
                                                        <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                        <asp:ListItem Text="Yes" Value="y"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="n"></asp:ListItem>
                                                    </asp:DropDownList>

                                                </td>
                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Weight:&nbsp;
                                <br />
                                                <asp:TextBox ID="Update_petWeight_txt" runat="server" ClientIDMode="Static" TabIndex="23" Width="121px"></asp:TextBox>
                                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Update" ControlToValidate="Update_petWeight_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">RFID:&nbsp;
                                <br />
                                                <asp:TextBox ID="Update_petRFID_txt" runat="server" ClientIDMode="Static" TabIndex="24" Width="121px"></asp:TextBox>

                                            </td>
                                        </tr>
                                    </table>
                                    <table id="Update_Table2" bgcolor="#efeeef" border="3px" cellspacing="10" width="100%">
                                        <tr>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">License Tag:&nbsp;
                                <br />
                                                <asp:TextBox ID="Update_petLicenseTag_txt" runat="server" ClientIDMode="Static" TabIndex="25" Width="121px"></asp:TextBox>

                                            </td>
                                            <td align="left" colspan="1" style="padding-left: 10px; padding-right: 10px;">Vet. ID:&nbsp;
                                <br />
                                                <asp:TextBox ID="Update_petVetID_txt" runat="server" ClientIDMode="Static" TabIndex="26" Width="121px"></asp:TextBox>

                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Tatoo Number:&nbsp;
                                <br />
                                                <asp:TextBox ID="Update_petTatooNumber_txt" runat="server" ClientIDMode="Static" TabIndex="27" Width="121px"></asp:TextBox>

                                            </td>
                                            <td align="left" colspan="2" style="padding-left: 10px; padding-right: 10px;">Pet Condition:*<br />
                                                <asp:DropDownList ID="Update_petConditionID_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Healthy">Healthy</asp:ListItem>
                                                    <asp:ListItem Value="Disabled">Disabled</asp:ListItem>
                                                    <asp:ListItem Value="Sick">Sick</asp:ListItem>
                                                    <asp:ListItem Value="Requires Medication">Requires Medication</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petConditionID_ddl" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>
                                                

                                            </td>
                                            <td align="left" colspan="2" style="height: 16px;">Pet Status:*<br />
                                                <asp:TextBox ID="Update_petStatusID_txt" runat="server" ClientIDMode="Static" TabIndex="29" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petStatusID_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>


                                            </td>
                                        </tr>
                                    </table>
                                    <table id="Update_Table3" bgcolor="#efeeef" border="3px" cellspacing="8" width="100%">
                                        <tr>
                                            <td align="left" colspan="8" style="padding-left: 10px; padding-right: 10px;">Pet Discription:*<br />
                                                <asp:TextBox ID="Update_petDiscription_txt" runat="server" ClientIDMode="Static" Height="131px" TabIndex="30" TextMode="MultiLine" Width="628px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_petDiscription_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>


                                            </td>
                                            <td align="left" colspan="2" style="font-weight: bold; height: 16px;">Add or edit a picture of the pet:<br />
                                                <asp:Image ID="Update_Preview_ImageBox"  runat="server" Width="200px" ImageUrl="Image/petPlaceHolder.png" Height="125px"></asp:Image><br />
                                                <asp:FileUpload ID="Update_FileUpload1" runat="server" onchange="this.form.submit()"/><asp:Button ID="Update_Change_PetImage_btn" Width="200px" runat="server" Text="Change Image" OnClick="Update_Change_Image_btn_Click" Visible="False" Height="31px" />
                                                <asp:Label ID="Update_Image_Name" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </table>
                            </div>
                        </asp:Panel>

                        <asp:CollapsiblePanelExtender ID="Update_cpePetInfo" runat="server" CollapseControlID="Update_PetInfoHead" CollapsedText="Show Pet Information" Enabled="True" ExpandControlID="Update_PetInfoHead" ExpandedText="Hide Pet Information" TargetControlID="Update_PetInfoBody" TextLabelID="Update_lblPetinfo"></asp:CollapsiblePanelExtender>

                    </div>

                    <div>
                        <asp:Panel ID="Update_PetMissingInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Update_label2" runat="server" Text="Pet Missing Information" Font-Size="Large"></asp:Label>

                        </asp:Panel>

                        <asp:Panel ID="Update_PetMissingInfoBody" runat="server">

                            <div>
                                <table id="Update_Table6" width="100%" style="font-family: Tahoma" cellspacing="10">

                                    <tr>
                                        <td colspan="10">
                                            <asp:Label ID="Update_lblSearchErrormsg"
                                                runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                    </tr>

                                </table>



                                <div style="padding-left: 10px; padding-right: 10px;">
                                    <asp:Label ID="Update_Label16" runat="server" Text="Pet Missing Information" Font-Bold="True" Font-Size="Large"></asp:Label>

                                </div>




                                <table id="Update_Table7" width="100%" cellspacing="10" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td width="100%" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Date and time pet went missing:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" align="left" style="padding-left: 10px; padding-right: 10px;">Date:*<br />
                                            <asp:TextBox ID="Update_DateMissing_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="32"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_DateMissing_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator id="CompareValidator3" ValidationGroup="valGroup_Update" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Update_DateMissing_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                                                <asp:CalendarExtender ID="CalendarExtender5" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Update_DateMissing_txt"></asp:CalendarExtender>
                                                

                                        </td>
                                        <td width="50%" align="left" style="padding-left: 10px; padding-right: 10px;">Years Of Ownership:<br />
                                            <asp:TextBox ID="Update_LengthOwned_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="34"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Update" ControlToValidate="Update_LengthOwned_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Time:*&nbsp;
                            <br />
                                            <asp:TextBox ID="Update_TimeLost_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="33"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_TimeLost_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>







                                        </td>





                                        <td width="50%" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Update_rewardAmount_L" runat="server" Text="Reward Amount:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Update_RewardAmt_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="38"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Update" ControlToValidate="Update_RewardAmt_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" width="50%"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Update_Label5" runat="server" Text="Collar Discription:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Update_collarDescription_txt" runat="server" Width="426px" ClientIDMode="Static" Height="105px" TextMode="MultiLine" TabIndex="39"></asp:TextBox>

                                        </td>
                                        <td align="left" width="50%" rowspan="2"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Update_Label6" runat="server" Text="How Did The Pet Become Lost?:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Update_lostExplanation_txt" runat="server" Width="426px" ClientIDMode="Static" Height="260px" TextMode="MultiLine" TabIndex="40"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" width="50%"
                                            style="padding-left: 10px; padding-right: 10px;">Breader Information::&nbsp;
                        <br />
                                            <asp:TextBox ID="Update_Breeder_txt" runat="server" Width="426px" ClientIDMode="Static" Height="105px" TextMode="MultiLine" TabIndex="41"></asp:TextBox>

                                        </td>


                                    </tr>

                                </table>
                            </div>



                        </asp:Panel>

                        <asp:CollapsiblePanelExtender ID="Update_PetMissing_CPE" runat="server" CollapseControlID="Update_PetMissingInfoHead" CollapsedText="Show Pet Missing Information" Enabled="True" ExpandControlID="Update_PetMissingInfoHead" ExpandedText="Hide Pet Missing Information" TargetControlID="Update_PetMissingInfoBody" TextLabelID="Update_lblPetinfo"></asp:CollapsiblePanelExtender>

                    </div>

                    <div>
                        <asp:Panel ID="Update_PetDeceasedInfoHead" runat="server" CssClass="PanelHead" Visible="False" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Update_label1" runat="server" Text="Is the pet deceased?" Font-Size="Large"></asp:Label>

                        </asp:Panel>

                        <asp:Panel ID="Update_PetDeceasedInfoBody" runat="server" Visible="False">
                            <div>
                                <table id="Update_Table4" width="100%" style="font-family: Tahoma" cellspacing="10">

                                    <tr>
                                        <td colspan="10">
                                            <asp:Label ID="Update_Label3"
                                                runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                    </tr>

                                </table>



                                <div style="padding-left: 10px; padding-right: 10px;">
                                    <asp:Label ID="Update_Label15" runat="server" Text="Death Information" Font-Bold="True" Font-Size="Large"></asp:Label>

                                </div>




                                <table id="Update_Table5" width="100%" cellspacing="10" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td colspan="5" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Date found:*
                        <br />
                                            <asp:TextBox ID="Update_DateDeceased_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="44"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_DateDeceased_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator id="CompareValidator4" ValidationGroup="valGroup_Update" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Update_DateDeceased_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                                            <asp:CalendarExtender ID="CalendarExtender6" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Update_DateDeceased_txt"></asp:CalendarExtender>
                                               
                                        </td>
                                        <td colspan="5" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Service Type:*
                        <br />
                                            <asp:DropDownList ID="Update_serviceType_DDL" runat="server" TabIndex="45" OnSelectedIndexChanged="Update_serviceTypeChange" ClientIDMode="Static" AutoPostBack="True">
                                                <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                <asp:ListItem Text="Cremation" Value="C"></asp:ListItem>
                                                <asp:ListItem Text="Burial" Value="B"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_serviceType_DDL" ForeColor="#E84F51" InitialValue="-1"></asp:RequiredFieldValidator>
                                                

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Update_cemetaryName_L" runat="server" Text="Cemetary Name or Location Information:" Visible="False"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Update_cemetaryName_txt" runat="server" Width="426px" ClientIDMode="Static" Visible="False" Height="105px" TextMode="MultiLine" TabIndex="46"></asp:TextBox>

                                        </td>
                                        <td colspan="5" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Update_funeral_L" runat="server" Text="Funeral Information:" Visible="False"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Update_funeral_txt" runat="server" Width="426px" ClientIDMode="Static" Visible="False" Height="105px" TextMode="MultiLine" TabIndex="47"></asp:TextBox>

                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </asp:Panel>

                        <asp:CollapsiblePanelExtender ID="Update_CollapsiblePanelExtender1" runat="server" CollapseControlID="Update_PetDeceasedInfoHead" CollapsedText="Show Pet Deceased Information" Enabled="True" ExpandControlID="Update_PetDeceasedInfoHead" ExpandedText="Hide Pet Deceased Information" TargetControlID="Update_PetDeceasedInfoBody" TextLabelID="Update_lblPetinfo"></asp:CollapsiblePanelExtender>

                    </div>

                    <div>
                        <asp:Panel ID="Update_PetLocationInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Update_label7" runat="server" Text="Location of Pet" Font-Size="Large"></asp:Label>

                        </asp:Panel>

                        <asp:Panel ID="Update_PetLocationInfoBody" runat="server">
                            <div>
                                <table id="Update_Table8" width="100%" style="font-family: Tahoma" cellspacing="10">

                                    <tr>
                                        <td colspan="10">
                                            <asp:Label ID="Update_Label8"
                                                runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                    </tr>

                                </table>


                                <div style="padding-left: 10px; padding-right: 10px;">
                                    <asp:Label ID="Update_locationknown_L" runat="server" Text="Where is the Pet Located?" Font-Bold="True" Font-Size="Large"></asp:Label>

                                </div>


                                <table id="Update_Table9" width="100%" cellspacing="12" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Address:*<br />
                                            <asp:TextBox ID="Update_address_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="48"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_address_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                
                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">City:*
                        <br />
                                            <asp:TextBox ID="Update_city_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="49"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_city_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">State:*
                        <br />
                                            <asp:TextBox ID="Update_state_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_state_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Zip:*
                        <br />
                                            <asp:TextBox ID="Update_zip_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="51"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator37" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_zip_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Update" ControlToValidate="Update_zip_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                        </td>
                                        <td colspan="2" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">County:*
                        <br />
                                            <asp:TextBox ID="Update_county_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="52"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator38" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_county_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                        </td>
                                        <td colspan="1" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">lat:*
                        <br />
                                            <asp:TextBox ID="Update_lat_txt" runat="server" Width="30px" ClientIDMode="Static" TabIndex="53"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_lat_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Update" ControlToValidate="Update_lat_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                        </td>
                                        <td colspan="1" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">Long:*
                        <br />
                                            <asp:TextBox ID="Update_long_txt" runat="server" Width="30px" ClientIDMode="Static" TabIndex="54"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator40" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_long_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Update" ControlToValidate="Update_lat_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" align="left"
                                            style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Update_Label9" runat="server" Text="Location Discription:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Update_LocationDiscription_txt" runat="server" Width="426px" ClientIDMode="Static" Height="105px" TextMode="MultiLine" TabIndex="56"></asp:TextBox>

                                        </td>
                                        <td colspan="3" align="left" style="padding-left: 10px; padding-right: 10px;">Date Found:*
                        <br />
                                            <asp:TextBox ID="Update_dateFound_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="55"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator41" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_dateFound_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
												<asp:CompareValidator id="CompareValidator5" ValidationGroup="valGroup_Update" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Update_dateFound_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
												<asp:CalendarExtender ID="CalendarExtender7" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Update_dateFound_txt"></asp:CalendarExtender>
                                                
                                        </td>
                                    </tr>
                                    <tr>

                                        <td align="left"
                                            style="padding-left: 10px; padding-right: 10px;" colspan="12">

                                            <div id="tab2_map" style="width: 100%; height: 500px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </asp:Panel>

                        <asp:CollapsiblePanelExtender ID="Update_CollapsiblePanelExtender2" runat="server" CollapseControlID="Update_PetLocationInfoHead" CollapsedText="Show Pet Location Information" Enabled="True" ExpandControlID="Update_PetLocationInfoHead" ExpandedText="Hide Pet Location Information" TargetControlID="Update_PetLocationInfoBody" TextLabelID="Update_lblPetinfo"></asp:CollapsiblePanelExtender>

                    </div>



                    <table width=" 100%">
                        <tr align="center">
                            <td></td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Update_Back_btn" runat="server" Text="Back" Height="30px" Width="120px" TabIndex="58"></asp:Button>

                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Update_btn" runat="server" Text="Update" Height="30px" Width="120px" OnClick="update" TabIndex="57" ValidationGroup="valGroup_Update"></asp:Button>

                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Update_Clear_btn" runat="server" Text="Clear" Height="30px" Width="120px" TabIndex="59" click="clear"></asp:Button>

                            </td>
                            <td></td>
                        </tr>
                    </table>

                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>

    </div>


</asp:Content>
