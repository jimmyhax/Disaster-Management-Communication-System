<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Missing_Person.aspx.cs" Inherits="DMCS.Moduals.Missing_Person.Missing_Person" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link href="~/Content/Site.css" rel="stylesheet" />
    <style type="text/css">
        .AlgemBackground {
            background-color: #000000;
            opacity: 0.75;
            filter: alpha(opacity=70);
        }

        .PanelHead {
        }
    </style>
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
        var Client_lat;
        var Client_Long;


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
                    Client_lat = tab1_marker.getPosition().lat();
                    Client_long = tab1_marker.getPosition().lng();
                    var all_in_one = address + ", " + city + ", " + state + " " + zip;

                    //document.getElementById('Insert_address_txt').value = address;
                    //document.getElementById('Insert_city_txt').value = city;
                    //document.getElementById('Insert_state_txt').value = state;
                    //document.getElementById('Insert_zip_txt').value = zip;
                    //document.getElementById('Insert_county_txt').value = county;
                    document.getElementById('Insert_LocationDiscription_txt').value = all_in_one;
                    //document.getElementById('Insert_lat_txt').value = Client_lat;
                    //document.getElementById('Insert_long_txt').value = Client_long;
                    //document.getElementById('Insert_dateFound_txt').value = Date().toString();


                    Client_lat = tab2_marker.getPosition().lat();
                    Client_long = tab2_marker.getPosition().lng();
                    //document.getElementById('Update_address_txt').value = address;
                    //document.getElementById('Update_city_txt').value = city;
                    //document.getElementById('Update_state_txt').value = state;
                    //document.getElementById('Update_zip_txt').value = zip;
                    // document.getElementById('Update_county_txt').value = county;
                    document.getElementById('Update_LocationDiscription_txt').value = all_in_one;
                    //document.getElementById('Update_lat_txt').value = Client_lat;
                    //document.getElementById('Update_long_txt').value = Client_long;
                    //document.getElementById('Update_dateFound_txt').value = Date().toString();

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
                content: '<div id="iw"><strong>Instructions:</strong><br /><br />Click the exact location of the Client <br />to update its current location.</div>'
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
    <div style="width: 100%; height: 100%;">
        <asp:TabContainer ID="MyAjaxTabContainer" runat="server" OnClientActiveTabChanged="resizeMap" UseVerticalStripPlacement="false" ActiveTabIndex="1" Visible="True" BackColor="#e75050" ForeColor="#333333" BorderColor="#E75050" BorderStyle="Double" BorderWidth="10px" Style="margin-right: 0px">
            <asp:TabPanel ID="Insert_TabInsertClient" runat="server" HeaderText="Insert" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>
                    <table id="Table12" width="100%" bgcolor="#efeeef">
                        <tr>
                            <td style="padding-left: 10px">
                                <br />
                                <br />
                                <asp:Label ID="Insert_lbl_Client_Error"
                                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="#AAAAAA"></asp:Label>


                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-left: 10px">
                                <asp:Label runat="server" Text="Choose Disaster" Font-Bold="True" ForeColor="Black" Font-Size="18pt"></asp:Label>


                            </td>
                        </tr>

                        <tr>
                            <td style="font-weight: bold; padding-left: 10px;" align="left">
                                <asp:Label ID="Insert_dmcslabel1" Text="Call Center:" runat="server"></asp:Label>


                                <br />
                                <asp:DropDownList ID="Insert_DDL_Call_Center" runat="server" Height="23px" Width="147px"
                                    DataSourceID="SqlDataSource1" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="1"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">*Select Call Center</asp:ListItem>
                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" ValidationGroup="valGroup_Insert" runat="server" InitialValue="-1" ErrorMessage="Required" ControlToValidate="Insert_DDL_Call_Center" ForeColor="#E84F51"></asp:RequiredFieldValidator>


                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [call_center_name], [call_center_id] FROM [call_center]"></asp:SqlDataSource>


                            </td>
                            <td style="font-weight: bold; padding-left: 10px;" align="left">
                                <asp:Label ID="Insert_Label134" Text="Disaster:" runat="server"></asp:Label>


                                <br />
                                <asp:DropDownList ID="Insert_DDlDisasters" runat="server" Height="23px" Width="147px"
                                    DataSourceID="SqlDataSource2" DataValueField="disaster_id" DataTextField="disaster_Name" TabIndex="2"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">*Select Disaster</asp:ListItem>
                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ValidationGroup="valGroup_Insert" runat="server" InitialValue="-1" ErrorMessage="Required" ControlToValidate="Insert_DDlDisasters" ForeColor="#E84F51"></asp:RequiredFieldValidator>


                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>


                            </td>
                        </tr>

                    </table>



                    <div>
                        <asp:Panel ID="Insert_ClientInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" Width="100%" Height="36px" BackImageUrl="~/Images/panelheader1.jpg">
                            <asp:Label ID="Insert_label106" runat="server" Text="Client Information" Font-Size="XX-Large"></asp:Label>


                        </asp:Panel>


                        <asp:Panel ID="Insert_ClientInfoBody" runat="server">
                            <div>





                                <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'">
                                    <tr>
                                        <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #666666;" width="100%">
                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#E2E2E2" Text="What can you tell us about the missing person?"></asp:Label>



                                        </th>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_f_name_lbl0" runat="server" Text="First Name:*"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_f_name_txt" runat="server" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_f_name_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_m_initial_lbl0" runat="server" Text="MiddleInitial:"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_m_initial_txt" runat="server" Width="121px"></asp:TextBox>


                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_l_name_lbl0" runat="server" Text="Last Name:*"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_l_name_txt" runat="server" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_l_name_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_gender_lbl0" runat="server" Text="Gender:*"></asp:Label>


                                                <br />
                                                <asp:DropDownList ID="Insert_gender_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                                    <asp:ListItem Value="F">Female</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="-1" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_gender_ddl" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_ssn_lbl0" runat="server" Text="SSN:"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_ssn_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_ssn_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>


                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_phone_primary_lbl2" runat="server" Text="Primary Phone:"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_phone_primary_txt" runat="server" Width="121px"></asp:TextBox>


                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_clothing_lbl0" runat="server" Text="Clothing Discription:"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_clothing_txt" runat="server" Width="121px"></asp:TextBox>


                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_date_of_disappearance_lbl0" runat="server" Text="Date Of Disappearance:*"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_date_of_disappearance_txt" runat="server" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_date_of_disappearance_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator id="dateValidator" ValidationGroup="valGroup_Insert" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Insert_date_of_disappearance_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>
                                                <asp:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Insert_date_of_disappearance_txt"></asp:CalendarExtender>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_height_lbl0" runat="server" Text="Height:"></asp:Label>


                                                <br />
                                                <asp:DropDownList ID="Insert_height_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="4 ft">4 ft</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 1 in">4 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 2 in">4 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 3 in">4 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 4 in">4 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 5 in">4 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 6 in">4 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 7 in">4 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 8 in">4 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 9 in">4 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 10 in">4 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 11 in">4 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft">5 ft </asp:ListItem>
                                                    <asp:ListItem Value="5 ft 1 in">5 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 2 in">5 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 3 in">5 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 4 in">5 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 5 in">5 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 6 in">5 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 7 in">5 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 8 in">5 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 9 in">5 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 10 in">5 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 11 in">5 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft">6 ft </asp:ListItem>
                                                    <asp:ListItem Value="6 ft 1 in">6 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 2 in">6 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 3 in">6 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 4 in">6 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 5 in">6 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 6 in">6 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 7 in">6 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 8 in">6 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 9 in">6 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 10 in">6 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 11 in">6 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft">7 ft </asp:ListItem>
                                                    <asp:ListItem Value="7 ft 1 in">7 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 2 in">7 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 3 in">7 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 4 in">7 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 5 in">7 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 6 in">7 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 7 in">7 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 8 in">7 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 9 in">7 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 10 in">7 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 11 in">7 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft">8 ft </asp:ListItem>
                                                    <asp:ListItem Value="8 ft 1 in">8 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 2 in">8 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 3 in">8 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 4 in">8 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 5 in">8 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 6 in">8 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 7 in">8 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 8 in">8 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 9 in">8 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 10 in">8 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 11 in">8 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="9 ft">9 ft </asp:ListItem>
                                                </asp:DropDownList>

                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_weight_lbl0" runat="server" Text="Weight:"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_weight_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_weight_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>


                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_ethnicity_lbl" runat="server" Text="Ethnicity:"></asp:Label>


                                                <br />
                                                <asp:TextBox ID="Insert_ethnicity_txt" runat="server" Width="121px"></asp:TextBox>


                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_eye_color_lbl" runat="server" Text="Eye Color:"></asp:Label>


                                                <br />
                                                <asp:DropDownList ID="Insert_eye_color_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Brown">Brown</asp:ListItem>
                                                    <asp:ListItem Value="Blue">Blue</asp:ListItem>
                                                    <asp:ListItem Value="Green">Green</asp:ListItem>
                                                    <asp:ListItem Value="Blue/Green">Blue/Green</asp:ListItem>
                                                </asp:DropDownList>

                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <br />
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_skin_color_lbl0" runat="server" Text="Skin Color:"></asp:Label>


                                                <br />
                                                <asp:DropDownList ID="Insert_skin_color_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Pale white or freckled">Pale white or freckled</asp:ListItem>
                                                    <asp:ListItem Value="White">White</asp:ListItem>
                                                    <asp:ListItem Value="White to Light Brown">White to Light Brown</asp:ListItem>
                                                    <asp:ListItem Value="Moderate Brown">Moderate Brown</asp:ListItem>
                                                    <asp:ListItem Value="Dark Brown">Dark Brown</asp:ListItem>
                                                    <asp:ListItem Value="Very Dark Brown to Black">Very Dark Brown to Black</asp:ListItem>
                                                </asp:DropDownList>

                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Insert_hair_color_lbl0" runat="server" Text="Hair Color:"></asp:Label>


                                                <br />
                                                <asp:DropDownList ID="Insert_hair_color_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="White">White</asp:ListItem>
                                                    <asp:ListItem Value="Gray">Gray</asp:ListItem>
                                                    <asp:ListItem Value="Black">Black</asp:ListItem>
                                                    <asp:ListItem Value="Dark Brown">Dark Brown</asp:ListItem>
                                                    <asp:ListItem Value="Light Brown">Light Brown</asp:ListItem>
                                                    <asp:ListItem Value="Red">Red</asp:ListItem>
                                                    <asp:ListItem Value="Blonde">Blonde</asp:ListItem>
                                                </asp:DropDownList>

                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                    </tr>
                                </table>
                                <table id="Insert_Table10" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'" width="100%">
                                    <tr>
                                        <td colspan="2" align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Is he or she now deceased?&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">
                                            <asp:RadioButton ID="Insert_missingYes" runat="server" AutoPostBack="True" OnCheckedChanged="Insert_missingChangedYes" TabIndex="16" Text="No" TextAlign="Left" Checked="True" />


                                        </td>
                                        <td align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">
                                            <asp:RadioButton ID="Insert_deceasedYes" runat="server" AutoPostBack="True" OnCheckedChanged="Insert_deceasedChangedYes" TabIndex="18" Text="Yes" TextAlign="Left" />


                                        </td>
                                    </tr>
                                </table>

                                <table width="100%" bgcolor="#aaaaaa">
                                    <tr>
                                        <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #666666;" width="100%">
                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#E2E2E2" Text="Missing persons address information"></asp:Label>


                                        </th>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Insert_Client_city_lbl0" runat="server" Text="City:*"></asp:Label>


                                            <br />
                                            <asp:TextBox ID="Insert_Client_city_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_Client_city_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Insert_Client_state_lbl0" runat="server" Text="State:*"></asp:Label>


                                            <br />
                                            <asp:TextBox ID="Insert_Client_state_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_Client_state_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Insert_Client_country_lbl0" runat="server" Text="Country:*"></asp:Label>


                                                <br />
                                            <asp:TextBox ID="Insert_Client_country_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_Client_country_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Insert_Client_County_Township_lbl" runat="server" Text="County Township:*"></asp:Label>


                                                <br />
                                            <asp:TextBox ID="Insert_Client_County_Township_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_Client_County_Township_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Insert_Client_str_add_lbl" runat="server" Text="Street Address:*"></asp:Label>


                                                <br />
                                            <asp:TextBox ID="Insert_Client_str_add_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_Client_str_add_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                                                                     <asp:Label ID="Insert_Client_zip_plus_four_lbl0" runat="server" Text="Zip Code:*"></asp:Label>


                                                <br />
                                            <asp:TextBox ID="Insert_Client_zip_plus_four_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_Client_zip_plus_four_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
   
                                            <asp:Label ID="Insert_Client_str_add2_lbl0" runat="server" Text="Second Street Address:"></asp:Label>


                                            <br />
                                            <asp:TextBox ID="Insert_Client_str_add2_txt" runat="server" Width="121px"></asp:TextBox>


                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Insert_longitude_lbl" runat="server" Text="Longitude:"></asp:Label>


                                            <br />
                                            <asp:TextBox ID="Insert_Client_longitude_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_Client_longitude_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Insert_latitude_lbl" runat="server" Text="Latitude:"></asp:Label>


                                            <br />
                                            <asp:TextBox ID="Insert_Client_latitude_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Insert" ControlToValidate="Insert_Client_latitude_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>


                                            <br />
                                        </td>
                                    </tr>
                                    </tr>
                                </table>

                                <table width="100%" height="auto" bgcolor="efeeef" style="vertical-align: top" aria-checked="mixed">

                                    <tr>
                                        <td colspan="2" align="left" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Insert_client_other_info_lbl" runat="server" Text="Any other information reagrding the missing individual:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_client_other_info_txt" runat="server" Width="366px" Height="94px" TextMode="MultiLine"></asp:TextBox>

                                            <br />

                                        </td>
                                        <td colspan="2" align="left" style="padding: 5px 10px 5px 10px; vertical-align: top;">

                                            <asp:Label ID="Insert_picture_lbl0" runat="server" Text="picture:"></asp:Label>


                                            <br />
                                            <asp:FileUpload ID="Insert_FileUpload" runat="server" />


                                            <br />
                                            <asp:Image ID="imgViewFile" runat="server" />



                                        </td>

                                    </tr>
                                </table>




                            </div>
                        </asp:Panel>


                        <asp:CollapsiblePanelExtender ID="Insert_cpeClientInfo" runat="server" CollapseControlID="Insert_ClientInfoHead" CollapsedText="Show Client Information" Enabled="True" ExpandControlID="Insert_ClientInfoHead" ExpandedText="Client Information" TargetControlID="Insert_ClientInfoBody" TextLabelID="Insert_label106"></asp:CollapsiblePanelExtender>



                    <div id="Insert_Deceased_Div" runat="server" style="display: none" >
                        <asp:Panel ID="Insert_ClientDeceasedInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" Height="36px" BackImageUrl="~/Images/panelheader2.jpg">
                            <asp:Label ID="Insert_label1" runat="server" Text="Is the Client deceased?" Font-Size="Large"></asp:Label>


                        </asp:Panel>


                        <asp:Panel ID="Insert_ClientDeceasedInfoBody" runat="server">
                            <div>


                                <table width="100%" height="auto" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <th colspan="6" style="padding: 5px 10px 5px 10px; background-color: #666666;">
                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" Text="Death Information" Width="100%" ForeColor="#E2E2E2"></asp:Label>


                                        </th>
                                    </tr>
                                    <tr>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Insert_internal_exam_lbl0" runat="server" Text="internal_exam:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_internal_exam_txt" runat="server" Width="121px"></asp:TextBox>


                                            <br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Insert_date_of_autopsy_lbl" runat="server" Text="date_of_autopsy:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_date_of_autopsy_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator id="CompareValidator1" ValidationGroup="valGroup_Insert_Deceased" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Insert_date_of_autopsy_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>
                                            <asp:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Insert_date_of_autopsy_txt"></asp:CalendarExtender>
                                            <br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Insert_external_exam_lbl" runat="server" Text="external_exam:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_external_exam_txt" runat="server" Width="121px"></asp:TextBox>

                                            <br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">

                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Insert_reason_of_death_lbl" runat="server" Text="reason of death:"></asp:Label>

                                            <br />
                                            <asp:TextBox ID="Insert_reason_of_death_txt" runat="server" Width="121px"></asp:TextBox>

                                            <br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Insert_identifying_marks_lbl" runat="server" Text="identifying_marks:*"></asp:Label>


                                                <br />
                                            <asp:TextBox ID="Insert_identifying_marks_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="valGroup_Insert_Deceased" runat="server" ErrorMessage="Required" ControlToValidate="Insert_identifying_marks_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            <br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Insert_time_of_death_lbl" runat="server" Text="time of death:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Insert_time_of_death_txt" runat="server" Width="121px" cssclass="date-picker"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Insert_time_of_death_txt" ErrorMessage="Required" ForeColor="#E84F51" ValidationGroup="valGroup_Insert_Deceased"></asp:RequiredFieldValidator>
                                            <br />
                                            </input></td>
                                    </tr>
                                </table>





                            </div>

                        </asp:Panel>


                        <asp:CollapsiblePanelExtender ID="Insert_CollapsiblePanelExtender1" runat="server" CollapseControlID="Insert_ClientDeceasedInfoHead" CollapsedText="Show Client Deceased Information" Enabled="True" ExpandControlID="Insert_ClientDeceasedInfoHead" ExpandedText="Hide Client Deceased Information" TargetControlID="Insert_ClientDeceasedInfoBody" TextLabelID="Insert_label1"></asp:CollapsiblePanelExtender>


                    </div>

                        <asp:Panel ID="Insert_ClientLocationInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" Height="36px" BackImageUrl="~/Images/panelheader2.jpg">
                            <asp:Label ID="Insert_label1111" runat="server" Text="Location of Client" Font-Size="XX-Large"></asp:Label>


                        </asp:Panel>


                        <asp:Panel ID="Insert_ClientLocationInfoBody" runat="server">
                            <div>


                                <table id="Table9" width="100%" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <th colspan="6" style="padding: 5px 10px 5px 10px; background-color: #666666;">
                                            <asp:Label ID="Insert_locationknown_L" runat="server" Font-Bold="True" Font-Size="Large" Text="Where was the client last seen?" Width="100%" ForeColor="#E2E2E2"></asp:Label>


                                        </th>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="3" style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Label19" runat="server" Text="Location Discription:*"></asp:Label>


                                                <br />
                                            <asp:TextBox ID="Insert_LocationDiscription_txt" runat="server" ClientIDMode="Static" TabIndex="56" Width="100%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="valGroup_Insert" runat="server" ErrorMessage="Required" ControlToValidate="Insert_LocationDiscription_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>

                                        </td>
                                        <tr>
                                            <td align="left" colspan="6" style="padding-left: 10px; padding-right: 10px; width: 100%" width="100%">
                                                <div id="tab1_map" style="width: 100%; height: 250px;">
                                                </div>
                                            </td>
                                        </tr>


                                    </tr>
                                </table>
                            </div>

                        </asp:Panel>


                        <asp:CollapsiblePanelExtender ID="Insert_CollapsiblePanelExtender2" runat="server" CollapseControlID="Insert_ClientLocationInfoHead" CollapsedText="Show Client Location Information" Enabled="True" ExpandControlID="Insert_ClientLocationInfoHead" ExpandedText="Client Location Information" TargetControlID="Insert_ClientLocationInfoBody" TextLabelID="Insert_label1111"></asp:CollapsiblePanelExtender>


                    </div>
                    <table width=" 100%">
                        <tr align="center">
                            <td></td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Insert_Back_btn" runat="server" Text="Back" Height="30px" Width="120px" TabIndex="58"></asp:Button>


                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Insert_btn" runat="server" Text="Insert" Height="30px" Width="120px" OnClick="insert_Click" TabIndex="57" ValidationGroup="valGroup_Insert" ></asp:Button>


                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Insert_Clear_btn" runat="server" Text="Clear" Height="30px" Width="120px" TabIndex="59" OnClientClick="clear()" OnClick="Insert_Clear_btn_Click"></asp:Button>


                            </td>
                            <td></td>
                        </tr>
                    </table>

                </ContentTemplate>

            </asp:TabPanel>

            <asp:TabPanel ID="Update_TabInsertClient" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>
                    <table id="Table12" width="100%" bgcolor="#efeeef">
                        <tr>
                            <td style="padding-left: 10px">
                                <br />
                                <br />
                                <asp:Label ID="Update_lbl_Client_Error"
                                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="#AAAAAA"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-left: 10px">
                                <asp:Label runat="server" Text="Choose Disaster" Font-Bold="True" ForeColor="Black" Font-Size="18pt"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td style="font-weight: bold; padding-left: 10px;" align="left">
                                <asp:Label ID="Update_dmcslabel1" Text="Call Center:" runat="server"></asp:Label>
                                <br />
                                <asp:DropDownList ID="Update_DDL_Call_Center" runat="server" Height="23px" Width="147px"
                                    DataSourceID="SqlDataSource3" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="1"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Call Center</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="Update_DDL_Call_Center"
                                ErrorMessage="Required" InitialValue="-1"  ValidationGroup="valGroup_Update" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [call_center_name], [call_center_id] FROM [call_center]"></asp:SqlDataSource>
                            </td>
                            <td style="font-weight: bold; padding-left: 10px;" align="left">
                                <asp:Label ID="Update_Label134" Text="Disaster:" runat="server"></asp:Label>
                                <br />
                                <asp:DropDownList ID="Update_DDlDisasters" runat="server" Height="23px" Width="147px"
                                    DataSourceID="SqlDataSource5" DataValueField="disaster_id" DataTextField="disaster_Name" TabIndex="2"
                                    AppendDataBoundItems="True" ViewStateMode="Disabled">
                                    <asp:ListItem Selected="True" Value="-1">Select Disaster</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="Update_DDlDisasters"
                                ErrorMessage="Required" InitialValue="-1"  ValidationGroup="valGroup_Update" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-left: 10px">
                                <asp:Label ID="Update_sClient_L" runat="server" Text="Search For Client" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%"></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold; padding-left: 10px;" align="left" class="auto-style2">
                                <asp:Label ID="Update_firstName_L" Text="First Name:" runat="server"></asp:Label>
                                <br />
                                <asp:TextBox ID="Update_txtFirstName" runat="server" Width="177px" TabIndex="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ValidationGroup="valGroup_ClientName" runat="server" ErrorMessage="Required" ControlToValidate="Update_txtFirstName" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                
                            </td>
                            <td style="font-weight: bold; padding-left: 10px;" align="left" class="auto-style2">
                                <asp:Label ID="Update_lastName_L" Text="Last Name:" runat="server"></asp:Label>
                                <br />
                                <asp:TextBox ID="Update_txtLastName" runat="server" Width="177px" TabIndex="4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" ValidationGroup="valGroup_ClientName" runat="server" ErrorMessage="Required" ControlToValidate="Update_txtLastName" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                
                            </td>
                            <td style="font-weight: bold; padding-left: 10px;" align="left" class="auto-style2">
                                <asp:Button ID="Update_client_search_btn" Text="Search Client" runat="server"
                                    TabIndex="5" OnClick="Update_client_search_btn_Click" ValidationGroup="valGroup_ClientName" />
                            </td>
                        </tr>
                    </table>

                    <div id="Update_gridview1_div" runat="server" style="display: none; overflow-x:auto; width:100%">
                        <table id="Table12" width="100%" bgcolor="#efeeef">
                            <tr>
                                <td width="100%" style="background-color: gray" height="3px" borderwidth="5px"></td>
                            </tr>
                            <tr>
                                <td align="center" width="100%" style="padding-left: 10px">
                                    <asp:GridView ID="Update_gvClientSearchresult" runat="server"
                                        AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                        OnSelectedIndexChanged="Update_gvClientSearchresult_SelectedIndexChanged"
                                        AllowPaging="True" EnableTheming="False" AllowSorting="True"
                                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid"
                                        BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A"
                                        Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center"
                                        DataKeyNames="person_id" OnRowDataBound="Update_RowDataBound">
                                        <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />

                                        <Columns>
                                            <asp:BoundField DataField="f_name" HeaderText="Fisrt Name" />
                                            <asp:BoundField DataField="m_initial" HeaderText="Middle In." SortExpression="m_initial" />
                                            <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="l_name" />
                                            <asp:BoundField DataField="client_status" HeaderText="Missing or Deceased" SortExpression="client_status" />
                                            <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                            <asp:ImageField DataImageUrlField = "client_id" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" HeaderText = "Preview Image" ><ControlStyle Height="100px" Width="150px" /></asp:ImageField>
                                            <asp:BoundField DataField="birthdate" HeaderText="Birthday" SortExpression="birthdate" />
                                            <asp:BoundField DataField="phone_primary" HeaderText="Phone Number" SortExpression="phone_primary" />
                                            <asp:BoundField DataField="ssn" HeaderText="SSN" SortExpression="ssn" />
                                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                            <asp:BoundField DataField="picture" HeaderText="Picture" SortExpression="picture" />
                                            <asp:BoundField DataField="str_add" HeaderText="Street Address" SortExpression="str_add" />
                                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                            <asp:BoundField DataField="person_id" HeaderText="person_id" SortExpression="person_id" Visible="False" />
                                            <asp:BoundField DataField="client_id" HeaderText="client_id" SortExpression="client_id" Visible="False" />
                                            <asp:BoundField DataField="address_id" HeaderText="address_id" SortExpression="address_id" Visible="False" />
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
                                <td align="center" style="padding-left: 10px;" width="100%">
                                    <div>
                                        <asp:Button ID="Update_changeClient" runat="server" OnClick="Update_changeClient_Click" Text="Search Again" Visible="False" Width="99%" BackColor="#666666" ForeColor="#EFEEEF" />
                                    </div>
                                </td>
                            </tr>
                            </tr>
                        </table>
                    </div>



                    <div>
                        <asp:Panel ID="Update_ClientInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" Width="100%" Height="36px" BackImageUrl="~/Images/panelheader1.jpg">
                            <asp:Label ID="Update_label106" runat="server" Text="Client Information" Font-Size="XX-Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Update_ClientInfoBody" runat="server">
                            <div>





                                <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'">
                                    <tr>
                                        <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #666666;" width="100%">
                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#E2E2E2" Text="What can you tell us about the missing person?"></asp:Label>

                                        </th>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_f_name_lbl0" runat="server" Text="First Name:*"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_f_name_txt" runat="server" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_f_name_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_m_initial_lbl0" runat="server" Text="MiddleInitial:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_m_initial_txt" runat="server" Width="121px"></asp:TextBox>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_l_name_lbl0" runat="server" Text="Last Name:*"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_l_name_txt" runat="server" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_l_name_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_gender_lbl0" runat="server" Text="Gender:*"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="Update_gender_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                                    <asp:ListItem Value="F">Female</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" InitialValue="-1" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_gender_ddl" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_ssn_lbl0" runat="server" Text="SSN:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_ssn_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Update" ControlToValidate="Update_ssn_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_phone_primary_lbl2" runat="server" Text="Primary Phone:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_phone_primary_txt" runat="server" Width="121px"></asp:TextBox>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_clothing_lbl0" runat="server" Text="Clothing Discription:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_clothing_txt" runat="server" Width="121px"></asp:TextBox>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_date_of_disappearance_lbl0" runat="server" Text="Date Of Disappearance:*"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_date_of_disappearance_txt" runat="server" Width="121px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_date_of_disappearance_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator id="CompareValidator2" ValidationGroup="valGroup_Update" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Update_date_of_disappearance_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Update_date_of_disappearance_txt"></asp:CalendarExtender>
                                                
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_height_lbl0" runat="server" Text="Height:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="Update_height_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="4 ft">4 ft</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 1 in">4 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 2 in">4 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 3 in">4 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 4 in">4 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 5 in">4 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 6 in">4 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 7 in">4 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 8 in">4 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 9 in">4 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 10 in">4 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="4 ft 11 in">4 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft">5 ft </asp:ListItem>
                                                    <asp:ListItem Value="5 ft 1 in">5 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 2 in">5 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 3 in">5 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 4 in">5 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 5 in">5 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 6 in">5 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 7 in">5 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 8 in">5 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 9 in">5 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 10 in">5 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="5 ft 11 in">5 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft">6 ft </asp:ListItem>
                                                    <asp:ListItem Value="6 ft 1 in">6 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 2 in">6 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 3 in">6 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 4 in">6 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 5 in">6 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 6 in">6 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 7 in">6 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 8 in">6 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 9 in">6 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 10 in">6 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="6 ft 11 in">6 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft">7 ft </asp:ListItem>
                                                    <asp:ListItem Value="7 ft 1 in">7 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 2 in">7 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 3 in">7 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 4 in">7 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 5 in">7 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 6 in">7 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 7 in">7 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 8 in">7 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 9 in">7 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 10 in">7 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="7 ft 11 in">7 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft">8 ft </asp:ListItem>
                                                    <asp:ListItem Value="8 ft 1 in">8 ft 1 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 2 in">8 ft 2 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 3 in">8 ft 3 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 4 in">8 ft 4 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 5 in">8 ft 5 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 6 in">8 ft 6 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 7 in">8 ft 7 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 8 in">8 ft 8 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 9 in">8 ft 9 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 10 in">8 ft 10 in</asp:ListItem>
                                                    <asp:ListItem Value="8 ft 11 in">8 ft 11 in</asp:ListItem>
                                                    <asp:ListItem Value="9 ft">9 ft </asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_weight_lbl0" runat="server" Text="Weight:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_weight_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ValidationGroup="valGroup_Update" ControlToValidate="Update_weight_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>

                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_ethnicity_lbl" runat="server" Text="Ethnicity:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="Update_ethnicity_txt" runat="server" Width="121px"></asp:TextBox>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_eye_color_lbl" runat="server" Text="Eye Color:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="Update_eye_color_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Brown">Brown</asp:ListItem>
                                                    <asp:ListItem Value="Blue">Blue</asp:ListItem>
                                                    <asp:ListItem Value="Green">Green</asp:ListItem>
                                                    <asp:ListItem Value="Blue/Green">Blue/Green</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <br />
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_skin_color_lbl0" runat="server" Text="Skin Color:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="Update_skin_color_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="Pale white or freckled">Pale white or freckled</asp:ListItem>
                                                    <asp:ListItem Value="White">White</asp:ListItem>
                                                    <asp:ListItem Value="White to Light Brown">White to Light Brown</asp:ListItem>
                                                    <asp:ListItem Value="Moderate Brown">Moderate Brown</asp:ListItem>
                                                    <asp:ListItem Value="Dark Brown">Dark Brown</asp:ListItem>
                                                    <asp:ListItem Value="Very Dark Brown to Black">Very Dark Brown to Black</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <asp:Label ID="Update_hair_color_lbl0" runat="server" Text="Hair Color:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="Update_hair_color_ddl" width="121px" runat="server">
                                                    <asp:ListItem Selected="True" Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="White">White</asp:ListItem>
                                                    <asp:ListItem Value="Gray">Gray</asp:ListItem>
                                                    <asp:ListItem Value="Black">Black</asp:ListItem>
                                                    <asp:ListItem Value="Dark Brown">Dark Brown</asp:ListItem>
                                                    <asp:ListItem Value="Light Brown">Light Brown</asp:ListItem>
                                                    <asp:ListItem Value="Red">Red</asp:ListItem>
                                                    <asp:ListItem Value="Blonde">Blonde</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                            </td>
                                            <td style="padding: 5px 10px 5px 10px" width="25%">
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                    </tr>
                                </table>
                                <table id="Update_Table10" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'" width="100%">
                                    <tr>
                                        <td colspan="2" align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Was he or she found deceased?&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">
                                            <asp:RadioButton ID="Update_missingYes" runat="server" AutoPostBack="True" OnCheckedChanged="Update_missingChangedYes" TabIndex="16" Text="No" TextAlign="Left" Checked="True" />
                                        </td>
                                        <td align="center" style="padding-left: 10px; padding-right: 10px; font-weight: bold;">
                                            <asp:RadioButton ID="Update_deceasedYes" runat="server" AutoPostBack="True" OnCheckedChanged="Update_deceasedChangedYes" TabIndex="18" Text="Yes" TextAlign="Left" />
                                        </td>
                                    </tr>
                                </table>
                                
                                <table width="100%" bgcolor="#aaaaaa">
                                    <tr>
                                        <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #666666;" width="100%">
                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#E2E2E2" Text="Missing persons address information"></asp:Label>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_Client_city_lbl0" runat="server" Text="City:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_city_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_Client_city_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_Client_state_lbl0" runat="server" Text="State:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_state_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_Client_state_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_Client_country_lbl0" runat="server" Text="Country:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_country_txt" runat="server" Width="121px" Style="margin-top: 0px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_Client_country_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_Client_County_Township_lbl" runat="server" Text="County Township:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_County_Township_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_Client_County_Township_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_Client_str_add_lbl" runat="server" Text="Street Address:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_str_add_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_Client_str_add_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_Client_zip_plus_four_lbl0" runat="server" Text="Zip Code:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_zip_plus_four_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_Client_zip_plus_four_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                                <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_Client_str_add2_lbl0" runat="server" Text="Second Street Address:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_str_add2_txt" runat="server" Width="121px"></asp:TextBox>
                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_longitude_lbl" runat="server" Text="Longitude:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_longitude_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Update" ControlToValidate="Update_Client_longitude_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>
                                            <br />
                                        </td>
                                        <td style="padding: 5px 10px 5px 10px" width="25%">
                                            <asp:Label ID="Update_latitude_lbl" runat="server" Text="Latitude:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_Client_latitude_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" ValidationGroup="valGroup_Update" ControlToValidate="Update_Client_latitude_txt" ErrorMessage="Numeric value"  ForeColor="#E84F51"/>
                                            <br />
                                        </td>
                                    </tr>
                                    </tr>
                                </table>

                                <table width="100%" height="auto" bgcolor="efeeef" style="vertical-align: top" aria-checked="mixed">

                                    <tr>
                                        <td colspan="2" align="left" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Update_client_other_info_lbl" runat="server" Text="Any other information reagrding the missing individual:"></asp:Label><br />
                                            <asp:TextBox ID="Update_client_other_info_txt" runat="server" Width="366px" Height="94px" TextMode="MultiLine"></asp:TextBox><br />

                                        </td>
                                        <td colspan="2" align="left" style="padding: 5px 10px 5px 10px">


                                            <asp:Label ID="Update_picture_lbl0" runat="server" Text="picture:"></asp:Label>
                                            <br />
                                            <asp:FileUpload ID="Update_FileUpload" runat="server" />

                                        </td>

                                    </tr>
                                </table>




                            </div>
                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Update_cpeClientInfo" runat="server" CollapseControlID="Update_ClientInfoHead" CollapsedText="Show Client Information" Enabled="True" ExpandControlID="Update_ClientInfoHead" ExpandedText="Client Information" TargetControlID="Update_ClientInfoBody" TextLabelID="Update_label106"></asp:CollapsiblePanelExtender>
                    </div>
                    <div id="Update_Deceased_Div" runat="server" style="display: none">
                        <asp:Panel ID="Update_ClientDeceasedInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" Height="36px" BackImageUrl="~/Images/panelheader2.jpg">
                            <asp:Label ID="Update_label1" runat="server" Text="Is the Client deceased?" Font-Size="Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Update_ClientDeceasedInfoBody" runat="server">
                            <div>


                                <table width="100%" height="auto" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <th colspan="6" style="padding: 5px 10px 5px 10px; background-color: #666666;">
                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Death Information" Width="100%" ForeColor="#E2E2E2"></asp:Label>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Update_internal_exam_lbl0" runat="server" Text="internal_exam:"></asp:Label><br />
                                            <asp:TextBox ID="Update_internal_exam_txt" runat="server" Width="121px"></asp:TextBox>
                                            <br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Update_date_of_autopsy_lbl" runat="server" Text="date_of_autopsy:"></asp:Label><br />
                                            <asp:TextBox ID="Update_date_of_autopsy_txt" runat="server" Width="121px"></asp:TextBox><br />
                                                <asp:CompareValidator id="CompareValidator3" ValidationGroup="valGroup_Update" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="Update_date_of_autopsy_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="Update_date_of_autopsy_txt"></asp:CalendarExtender>
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Update_external_exam_lbl" runat="server" Text="external_exam:"></asp:Label><br />
                                            <asp:TextBox ID="Update_external_exam_txt" runat="server" Width="121px"></asp:TextBox><br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                       </td>
                                    </tr>
                                    <tr>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Update_identifying_marks_lbl" runat="server" Text="identifying_marks:*"></asp:Label><br />
                                            <asp:TextBox ID="Update_identifying_marks_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Required" ControlToValidate="Update_identifying_marks_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator><br />
                                        
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Update_reason_of_death_lbl" runat="server" Text="reason_of_death:"></asp:Label><br />
                                            <asp:TextBox ID="Update_reason_of_death_txt" runat="server" Width="121px"></asp:TextBox><br />
                                        </td>
                                        <td width="25%" style="padding: 5px 10px 5px 10px">
                                            <asp:Label ID="Update_time_of_death_lbl" runat="server" Text="time_of_death:*"></asp:Label><br />
                                            <asp:TextBox ID="Update_time_of_death_txt" runat="server" Width="121px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Required" ControlToValidate="Update_time_of_death_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator><br />
                                        </td>
                                    </tr>
                                </table>





                            </div>

                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Update_CollapsiblePanelExtender1" runat="server" CollapseControlID="Update_ClientDeceasedInfoHead" CollapsedText="Show Client Deceased Information" Enabled="True" ExpandControlID="Update_ClientDeceasedInfoHead" ExpandedText="Hide Client Deceased Information" TargetControlID="Update_ClientDeceasedInfoBody" TextLabelID="Update_label1"></asp:CollapsiblePanelExtender>
                    </div>
                    <div>
                        <asp:Panel ID="Update_ClientLocationInfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" Height="36px" BackImageUrl="~/Images/panelheader2.jpg">
                            <asp:Label ID="Update_label1111" runat="server" Text="Location of Client" Font-Size="XX-Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Update_ClientLocationInfoBody" runat="server">
                            <div>


                                <table id="Table9" width="100%" bgcolor="#efeeef" border="3">
                                    <tr>
                                        <th colspan="6" style="padding: 5px 10px 5px 10px; background-color: #666666;">
                                            <asp:Label ID="Update_locationknown_L" runat="server" Font-Bold="True" Font-Size="Large" Text="Where was the client last seen?" Width="100%" ForeColor="#E2E2E2"></asp:Label>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="3" style="padding-left: 10px; padding-right: 10px;">
                                            <asp:Label ID="Label4" runat="server" Text="Location Discription:*"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="Update_LocationDiscription_txt" runat="server" ClientIDMode="Static" TabIndex="56" Width="100%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ValidationGroup="valGroup_Update" runat="server" ErrorMessage="Required" ControlToValidate="Update_LocationDiscription_txt" ForeColor="#E84F51"></asp:RequiredFieldValidator>
                                        </td>
                                        <tr>
                                            <td align="left" colspan="6" style="padding-left: 10px; padding-right: 10px; width: 100%" width="100%">
                                                <div id="tab2_map" style="width: 100%; height: 250px;">
                                                </div>
                                            </td>
                                        </tr>


                                    </tr>
                                </table>
                            </div>

                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Update_CollapsiblePanelExtender2" runat="server" CollapseControlID="Update_ClientLocationInfoHead" CollapsedText="Show Client Location Information" Enabled="True" ExpandControlID="Update_ClientLocationInfoHead" ExpandedText="Client Location Information" TargetControlID="Update_ClientLocationInfoBody" TextLabelID="Update_label1111"></asp:CollapsiblePanelExtender>
                    </div>
                    <table width=" 100%">
                        <tr align="center">
                            <td></td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Update_Back_btn" runat="server" Text="Back" Height="30px" Width="120px" TabIndex="58"></asp:Button>
                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Update_btn" runat="server" Text="Update" Height="30px" Width="120px" OnClick="update_Click" TabIndex="57" ValidationGroup="valGroup_Update"></asp:Button>
                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;">
                                <asp:Button ID="Update_Clear_btn" runat="server" Text="Clear" Height="30px" Width="120px" TabIndex="59" OnClientClick="clear()" OnClick="Update_Clear_btn_Click" CausesValidation="False"></asp:Button>
                            </td>
                            <td></td>
                        </tr>
                    </table>

                </ContentTemplate>

            </asp:TabPanel>


        </asp:TabContainer>

    </div>


</asp:Content>
