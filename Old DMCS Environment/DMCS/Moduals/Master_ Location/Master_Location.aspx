<%@ Page Title="" Language="C#" enableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Master_Location.aspx.cs" Inherits="DMCS.Moduals.Master__Location.Master_Location" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>NoMagic Google Map</title>
        <!-- The below line is a cludge fix for IE9 -->
        <meta http-equiv="X-UA-Compatible" content="IE=8;FF=3;OtherUA=4;charset=utf-8" />
        <!-- Google Map API Key -->
        <script src="https://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
        <!-- Link to utility functions -->
        <script src="Scripts/util.js" type="text/javascript"></script>
        <script src="Scripts/oms.min.js" type="text/javascript"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.6.min.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="Scripts/jquery.fcbkcomplete.js" type="text/javascript" charset="utf-8">
        </script>
        <link href="CSS/MPEstyle.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="~/CSS/style.css" type="text/css" media="screen" charset="utf-8" />

        <!--<script src="markerclusterer.js" type="text/javascript"></script>-->

        <script type="text/javascript" id="mapScript">
            var map;
            var geocoder;
            var markers = [];
            var infoWindow;
            var mapOptions;
            //ready to accept values on locations to calculate map zoom
            var bounds = new google.maps.LatLngBounds();


            var http_request = false;
            var lat = 0;
            var lng = 0;
            var startingLat = 41.1509;  // view of usa
            var startingLng = -81.4855;  // view of usa
            var startingZoom = 5;
            var maximumZoom = 15;

            //checking if desaster has been loaded
            var disasterSet = 0;
            var disasterCenter;
            var disasterBounds;

            var typeselect = 0;

            //checking of checkboxes have been checked
            var resourceChecked = 0;
            var warehouseChecked = 0;
            var mobileunitChecked = 0;

            //Google map icons
            var resource_Image = "Images/Resources.png";
            var warehouse_Image = "Images/WarehouseResources.png";
            var mobileunit_Image = "Images/Mobileunit.png";
            var person_Image = "Images/People.png";

            var gm = google.maps;
            var iw = new gm.InfoWindow({ maxWidth: 200 });



            //when page is accessed this is called to display map and such - *called on page load in cs file*
            function initialize() {

                geocoder = new google.maps.Geocoder();

                mapOptions = {
                    center: new google.maps.LatLng(startingLat, startingLng),
                    zoom: startingZoom,
                    mapTypeId: google.maps.MapTypeId.ROADMAP  // Change this to satellite for something cool, or hybrid, etc
                };

                map = new google.maps.Map(document.getElementById('map'), mapOptions);


            }
            //if disaster is displayed, search by disaster:else by input address using geocoder
            function desideSearchType() {
                initialize();

                if (disasterSet == 0) //disaster not displaied
                { searchBySearchLocation(); }
                else                   //disaster displaied
                { searchByDisasterLocation(disasterCenter); }

            }
            //call searchLocationsNear() with disaster locations center lat and long 
            function searchByDisasterLocation() {
                searchLocationsNear(disasterCenter);

            }
            //call searchLocationsNear() with address and country
            function searchBySearchLocation() {
                var address = document.getElementById('<%=txtSearchAddress.ClientID%>').value
                var searchString = address;
                geocoder.geocode({ address: searchString }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        searchLocationsNear(results[0].geometry.location);
                        map.fitBounds(bounds);
                    }
                    else
                        alert(searchString + ' - not found');

                });
            }
            //used to look up and display resources in the area of the radius drop down box
            function searchLocationsNear(center) {
                //grab the radius from drop down
                var radius = document.getElementById('ddlRadius').value;
                //grabbing the chopped up version of the type string(using split(',') command to make an array and returning the array)
                var searchTypeArray = iterateCheckBoxList();
                //SearchResponce.aspc.vb coding accessed through SearchResponce.aspx * this will be sent to the util.js file to communicate back and forth between pages
                //each will grab specific Stored procedure data...
                //////////////////////////////////////////////////////////////////
                //var Prepair_RNIW_Data = 'SearchResponces/ResourceNotInAWarehouse_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                var Prepair_Warehouse_Data = 'SearchResponces/Warehouse_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                var Prepair_RIW_Data = 'SearchResponces/ResourceInAWarehouse_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                var Prepair_MobileUnit_Data = 'SearchResponces/MobileUnit_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                var Prepair_Person_Data = 'SearchResponces/Person_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                //URL for selecting specific types
                //////////////////////////////////////////////////////////////////
                var Prepair_WC_Resource_Data = 'SearchResponces/WC_ResourceInAWarehouse_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius + '&type1=' + searchTypeArray[0] + '&type2=' + searchTypeArray[1] + '&type3=' + searchTypeArray[2] + '&type4=' + searchTypeArray[3] + '&type5=' + searchTypeArray[4] + '&type6=' + searchTypeArray[5] + '&type7=' + searchTypeArray[6] + '&type8=' + searchTypeArray[7] + '&type9=' + searchTypeArray[8] + '&type10=' + searchTypeArray[9];
                //////////////////////////////////////////////////////////////////
                //clear the sidebar befor a new search
                var sbar = document.getElementById('sidebar');
                sbar.innerHTML = '';
                //////////////////////////////////////////////////////////////////
                //Creating an instance of the spider effect then markers are too close together..
                // when clicked the markers spread
                var oms = new OverlappingMarkerSpiderfier(map);
                oms.addListener('click', function (marker, event) {
                    iw.setContent(marker.desc);
                    iw.maxWidth = 300;
                    iw.open(map, marker);


                });




                //////////////////////////////////////////////////////////////////
                //if search is based on a disaster location load the disaster again
                if (disasterSet == 1) { plotPoly(); }
                //////////////////////////////////////////////////////////////////
                //Checking to see what the user wants to search for (checkboxes)
                if (resourceChecked == 1 && typeselect != 1) { WriteResource(); }
                if (warehouseChecked == 1) { WriteWarehouse(); }
                if (mobileunitChecked == 1) { WriteXMLMobileUnit(); }
                if (typeselect == 1) {
                    document.getElementById('<%=resourceBox.ClientID%>').checked = true;
                    validate_CheckBoxs();
                    Write_WC_Resource();
                }
                //////////////////////////////////////////////////////////////////
                //Checking to see what the user wants to search for (checkboxes)
                if (mobileunitChecked == 0 && warehouseChecked == 0 && resourceChecked == 0 && typeselect == 0) {
                    sbar.innerHTML = 'Choose a check box first to view the corresponding locations';
                    alert('please select items to be displayed before proceeding.');
                }
                //////////////////////////////////////////////////////////////////
                //Each function below writes an XML file that containes the data to grab for later use
                function WriteResource() {
                    downloadUrl(Prepair_RIW_Data, function (data) {


                        /////clear side bar entries and event control
                        var sbar = document.getElementById('sidebar');
                        //sbar.innerHTML = 'No results found.  Please try widening your search area.';

                        if (data.documentElement == null) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }

                        //find all markers (all data within newly-wriiten XML/Stored procedure select statment) 
                        //(they are associated with a variable named 'marker')
                        var locations = data.documentElement.getElementsByTagName('marker');

                        if (locations.length == 0) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }
                        /////////////////////////



                        //create border seperator
                        var div = document.createElement('div');
                        var border;
                        border = '<table border="10", width=100%, borderColor="#00FF00">' + '<font size="5"><b>' + 'Resources' + '</font>' + '</b>' + '</table>';
                        div.innerHTML = border;
                        div.style.cursor = 'pointer';
                        div.style.marginBottom = '5px';
                        sbar.appendChild(div);

                        for (var i = 0; i < locations.length; i++) {


                            var Resource_ID = locations[i].getAttribute('Resource_ID')
                            var Product_ID = locations[i].getAttribute('product_id')
                            var Location_ID = locations[i].getAttribute('resource.Location_ID');

                            var Product_Name = locations[i].getAttribute('product_name');
                            var Product_Desc = locations[i].getAttribute('product_desc');
                            var Product_Type = locations[i].getAttribute('product_type');
                            var Product_Subtype = locations[i].getAttribute('Product_subtype');
                            var Product_Qty = locations[i].getAttribute('product_qty');
                            var Product_Desc = locations[i].getAttribute('product_desc');

                            var FEMA_Description = locations[i].getAttribute('FEMA_Description');
                            var Make = locations[i].getAttribute('Make');
                            var Model = locations[i].getAttribute('Model');
                            var Weight = locations[i].getAttribute('Weight');


                            var Location_Type = locations[i].getAttribute('type');
                            var Location_Desc = locations[i].getAttribute('location_desc');
                            var City = locations[i].getAttribute('city');
                            var County = locations[i].getAttribute('county');
                            var State = locations[i].getAttribute('state');
                            var Zip = locations[i].getAttribute('zip');
                            var Lat = locations[i].getAttribute('n_lat');
                            var Long = locations[i].getAttribute('n_long');

                            var Equipment = locations[i].getAttribute('Equipment');

                            //center of disaster or address - distance from resource
                            var distance = parseFloat(locations[i].getAttribute('distance'));

                            //location of a marker
                            var point = new google.maps.LatLng(parseFloat(locations[i].getAttribute('n_lat')), parseFloat(locations[i].getAttribute('n_long')));
                            bounds.extend(point);
                            /////////////////////////////////////////////////////////

                            //what will be in the marker on the map
                            var marker = createMarker_ResourceInWarehouse(point, Resource_ID, Product_ID,
                                Make, Model, Weight, Location_ID, Location_Type, Location_Desc, City, County, State, Zip, Lat,
                                Long, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Equipment, Product_Qty, distance, oms);


                            /////////////////////////////////////////////////////////

                            //what will be in the side menu next to map
                            var sidebarEntry = createSidebarEntry_ResourceInWarehouse(marker, Resource_ID, Product_ID, Make, Model, Weight, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Equipment, Product_Qty, distance);

                            //////////////////////////////////////////////////////////
                            sbar.appendChild(sidebarEntry);


                        }
                        map.fitBounds(bounds);

                    });
                }
                function WriteWarehouse() {
                    downloadUrl(Prepair_Warehouse_Data, function (data) {


                        /////clear side bar entries and event control
                        var sbar = document.getElementById('sidebar');
                        //sbar.innerHTML = 'No results found.  Please try widening your search area.';

                        if (data.documentElement == null) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }

                        //find all markers (all data within newly-wriiten XML/Stored procedure select statment) 
                        //(they are associated with a variable named 'marker')
                        var locations = data.documentElement.getElementsByTagName('marker');

                        if (locations.length == 0) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }
                        /////////////////////////



                        //create border seperator
                        var div = document.createElement('div');
                        var border;
                        border = '<table border="10", width=100%, borderColor="#D119A3">' + '<font size="5"><b>' + 'WareHouse Resources' + '</font></b>' + '</table>';
                        div.innerHTML = border;
                        div.style.cursor = 'pointer';
                        div.style.marginBottom = '5px';
                        sbar.appendChild(div);

                        for (var i = 0; i < locations.length; i++) {


                            var warehouse_id = locations[i].getAttribute('warehouse_id')
                            var warehouse_type = locations[i].getAttribute('warehouse_type')
                            var warehouse_name = locations[i].getAttribute('warehouse_name');
                            var address_id = locations[i].getAttribute('address_id');

                            var address_type_id = locations[i].getAttribute('address_type_id');
                            var city = locations[i].getAttribute('city');
                            var country = locations[i].getAttribute('country');
                            var latitude = locations[i].getAttribute('latitude');
                            var longitude = locations[i].getAttribute('longitude');
                            var state = locations[i].getAttribute('state');
                            var str_add = locations[i].getAttribute('str_add');
                            var str_add2 = locations[i].getAttribute('str_add2');
                            var zip_plus_four = locations[i].getAttribute('zip_plus_four');




                            //center of disaster or address - distance from resource
                            var distance = parseFloat(locations[i].getAttribute('distance'));

                            //location of a marker
                            var point = new google.maps.LatLng(parseFloat(locations[i].getAttribute('latitude')), parseFloat(locations[i].getAttribute('longitude')));
                            bounds.extend(point);
                            /////////////////////////////////////////////////////////

                            //what will be in the marker on the map
                            var marker = createMarker_Warehouse(point, warehouse_type,
                                warehouse_name, address_id, address_type_id, city, country, latitude, longitude, state,
                                str_add, str_add2, zip_plus_four, distance, oms);


                            /////////////////////////////////////////////////////////

                            //what will be in the side menu next to map
                            var sidebarEntry = createSidebarEntry_Warehouse(marker, warehouse_type, warehouse_name, city, distance);

                            //////////////////////////////////////////////////////////
                            sbar.appendChild(sidebarEntry);


                        }
                        map.fitBounds(bounds);

                    });
                }
                function WriteXMLMobileUnit() {
                    downloadUrl(Prepair_MobileUnit_Data, function (data) {


                        /////clear side bar entries and event control
                        var sbar = document.getElementById('sidebar');


                        if (data.documentElement == null) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }

                        //find all markers (all data within newly-wriiten XML/Stored procedure select statment) 
                        //(they are associated with a variable named 'marker')
                        var locations = data.documentElement.getElementsByTagName('marker');

                        if (locations.length == 0) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }
                        /////////////////////////



                        //create border seperator
                        var div = document.createElement('div');
                        var border;
                        border = '<table border="10", width=100%, borderColor="#565656">' + '<font size="5"><b>' + 'Mobile Units' + '</font></b>' + '</table>';
                        div.innerHTML = border;
                        div.style.cursor = 'pointer';
                        div.style.marginBottom = '5px';
                        sbar.appendChild(div);

                        for (var i = 0; i < locations.length; i++) {


                            var Resource_ID = locations[i].getAttribute('Resource_ID');
                            var Location_ID = locations[i].getAttribute('Location_ID');

                            var Person_ID = locations[i].getAttribute('person_id');


                            var Employee_ID = locations[i].getAttribute('employee_id');
                            var Mobile_Unit_ID = locations[i].getAttribute('mobile_unit_id');
                            var Vehicle_ID = locations[i].getAttribute('vehicle_id');
                            var Call_Center_ID = locations[i].getAttribute('call_center_id');


                            var Location_Type = locations[i].getAttribute('type');
                            var City = locations[i].getAttribute('city');
                            var State = locations[i].getAttribute('state');
                            var Zip = locations[i].getAttribute('zip');
                            var County = locations[i].getAttribute('county');
                            var Location_Desc = locations[i].getAttribute('location_desc');
                            var Long = locations[i].getAttribute('n_long');
                            var Lat = locations[i].getAttribute('n_lat');

                            var Address1 = locations[i].getAttribute('address_id');
                            var Address2 = locations[i].getAttribute('address_id2');
                            var Birthday = locations[i].getAttribute('birthdate');
                            var Certification = locations[i].getAttribute('certification_number');
                            var First_Name = locations[i].getAttribute('f_name');
                            var Middle_Name = locations[i].getAttribute('m_initial');
                            var Last_Name = locations[i].getAttribute('l_name');
                            var FullName = First_Name + ' ' + Middle_Name + ' ' + Last_Name;
                            var Gender = locations[i].getAttribute('gender');
                            var Person_Type = locations[i].getAttribute('person_type');
                            var Phone_Primary = locations[i].getAttribute('phone_primary');
                            var Phone_Secondary = locations[i].getAttribute('phone_secondary');
                            var Email = locations[i].getAttribute('email');

                            var Employee_Department = locations[i].getAttribute('employee_department');
                            var Employee_Leadership = locations[i].getAttribute('employee_leadership');
                            var Employee_Motivation = locations[i].getAttribute('employee_motivation');
                            var Employee_Notes = locations[i].getAttribute('employee_notes');
                            var Employee_Overall = locations[i].getAttribute('employee_overall');
                            var Employee_Payrate = locations[i].getAttribute('employee_payrate');
                            var Employee_Performance = locations[i].getAttribute('employee_performance');
                            var Employee_Quality = locations[i].getAttribute('employee_quality');
                            var Employee_Timeliness = locations[i].getAttribute('employee_timeliness');


                            var Mobile_Desc = locations[i].getAttribute('mobile_desc');


                            var Vehicle_Desc = locations[i].getAttribute('vehicle_desc');
                            var Vin = locations[i].getAttribute('vin');
                            var Client_ID = locations[i].getAttribute('client_id');
                            var Vehicle_Make = locations[i].getAttribute('vehicle_make');
                            var Vehicle_Model = locations[i].getAttribute('vehicle_model');
                            var Vehicle_Type = locations[i].getAttribute('vehicle_type');
                            var Vehicle_Year = locations[i].getAttribute('vehicle_year');
                            var FUELTYPE = locations[i].getAttribute('FUELTYPE');
                            var PLATENUMBER = locations[i].getAttribute('PLATENUMBER');



                            //center of disaster or address - distance from resource
                            var distance = parseFloat(locations[i].getAttribute('distance'));

                            //location of a marker
                            var point = new google.maps.LatLng(parseFloat(locations[i].getAttribute('n_lat')), parseFloat(locations[i].getAttribute('n_long')));
                            bounds.extend(point);

                            //what will be in the marker on the map
                            var marker = createMarker_MobileUnit(point, Resource_ID, Mobile_Unit_ID, Call_Center_ID, Mobile_Desc, Vehicle_Desc, PLATENUMBER, Vin, Vehicle_Make, Vehicle_Model, Vehicle_Year, Vehicle_Type, FUELTYPE, FullName, Gender, Person_Type, Certification, Phone_Primary, Phone_Secondary, Email, oms);


                            //what will be in the side menu next to map
                            var sidebarEntry = createSidebarEntry_Mobileunit(marker, Call_Center_ID, FullName, Employee_Leadership, distance);

                            sbar.appendChild(sidebarEntry);


                        }
                        map.fitBounds(bounds);
                    });
                }
                ///////////////////////////////////////////////////////////////////
                //For Types
                function Write_WC_Resource() {
                    downloadUrl(Prepair_WC_Resource_Data, function (data) {


                        /////clear side bar entries and event control
                        var sbar = document.getElementById('sidebar');
                        //sbar.innerHTML = 'No results found.  Please try widening your search area.';

                        if (data.documentElement == null) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }

                        //find all markers (all data within newly-wriiten XML/Stored procedure select statment) 
                        //(they are associated with a variable named 'marker')
                        var locations = data.documentElement.getElementsByTagName('marker');

                        if (locations.length == 0) {
                            sbar.innerHTML = 'No results found.  Please try widening your search area.';
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);
                            return;
                        }
                        /////////////////////////



                        //create border seperator
                        var div = document.createElement('div');
                        var border;
                        border = '<table border="10", width=100%, borderColor="#00FF00">' + '<font size="5"><b>' + 'Resources' + '</font>' + '- Out Of Warehouse</b>' + '</table>';
                        div.innerHTML = border;
                        div.style.cursor = 'pointer';
                        div.style.marginBottom = '5px';
                        sbar.appendChild(div);

                        for (var i = 0; i < locations.length; i++) {


                            var Resource_ID = locations[i].getAttribute('Resource_ID')
                            var Product_ID = locations[i].getAttribute('product_id')
                            var Location_ID = locations[i].getAttribute('resource.Location_ID');

                            var Product_Name = locations[i].getAttribute('product_name');
                            var Product_Desc = locations[i].getAttribute('product_desc');
                            var Product_Type = locations[i].getAttribute('product_type');
                            var Product_Subtype = locations[i].getAttribute('Product_subtype');
                            var Product_Qty = locations[i].getAttribute('product_qty');
                            var Product_Desc = locations[i].getAttribute('product_desc');

                            var FEMA_Description = locations[i].getAttribute('FEMA_Description');
                            var Make = locations[i].getAttribute('Make');
                            var Model = locations[i].getAttribute('Model');
                            var Weight = locations[i].getAttribute('Weight');

                            var Location_Type = locations[i].getAttribute('type');
                            var Location_Desc = locations[i].getAttribute('location_desc');
                            var City = locations[i].getAttribute('city');
                            var County = locations[i].getAttribute('county');
                            var State = locations[i].getAttribute('state');
                            var Zip = locations[i].getAttribute('zip');
                            var Lat = locations[i].getAttribute('n_lat');
                            var Long = locations[i].getAttribute('n_long');

                            var Equipment = locations[i].getAttribute('Equipment');

                            //center of disaster or address - distance from resource
                            var distance = parseFloat(locations[i].getAttribute('distance'));

                            //location of a marker
                            var point = new google.maps.LatLng(parseFloat(locations[i].getAttribute('n_lat')), parseFloat(locations[i].getAttribute('n_long')));
                            bounds.extend(point);
                            /////////////////////////////////////////////////////////

                            //what will be in the marker on the map
                            var marker = createMarker_ResourceInWarehouse(point, Resource_ID, Product_ID,
                                Make, Model, Weight, Location_ID, Location_Type, Location_Desc, City, County, State, Zip, Lat,
                                Long, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Equipment, Product_Qty, distance, oms);


                            /////////////////////////////////////////////////////////

                            //what will be in the side menu next to map
                            var sidebarEntry = createSidebarEntry_ResourceInWarehouse(marker, Resource_ID, Product_ID, Make, Model, Weight, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Equipment, Product_Qty, distance);

                            //////////////////////////////////////////////////////////
                            sbar.appendChild(sidebarEntry);


                        }
                        map.fitBounds(bounds);

                    });
                }

                return;

            }
            //////////////////////////////////////////////////////////////////
            // Create the marker with address information
            function createMarker_Warehouse(point, warehouse_type, warehouse_name, address_id, address_type_id, city, country, latitude, longitude, state, str_add, str_add2, zip_plus_four, distance, oms) {



                var markerContent;
                if (str_add2 != null) {



                    markerContent = '<table border="1"><tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Description' + '</b></font></td></tr>' +
                       '<tr><td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Name: <br/>' + '</b>' + warehouse_name + '</font></td>' +
                       '<td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Type: <br/>' + '</b>' + warehouse_type + '</font></td></tr>' +

                        '<tr><td colspan="2">' + '<b><font color="black">' + 'Location Information' + '</b></font>' + '</td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black" size="2">' + 'Country: <br/>' + '</b>' + country + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Address: <br/>' + '</b>' + str_add + city + ' ' + state + ', ' + zip_plus_four + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Second Address: <br/>' + '</b>' + str_add2 + city + ' ' + state + ', ' + zip_plus_four + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Exact Location:' + '</b>' + '</td></tr>' +
                        '<tr><td align="left" width="50%" colspan="1">' + '<b><font color="black">' + "Lat: <br/>" + '</b>' + parseFloat(latitude).toFixed(2) + '</font></td>' +
                        '<td align="left" width="50%" colspan="1">' + '<b><font color="black">' + 'Long: <br/>' + '</b>' + parseFloat(longitude).toFixed(2) + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "Precisely " + parseFloat(distance).toFixed(2) + " miles away." + '</font></td></tr>' +
                        '</td></tr></table>';



                }
                else {



                    markerContent = '<table border="1"><tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Description' + '</b></font></td></tr>' +
                       '<tr><td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Name: <br/>' + '</b>' + warehouse_name + '</font></td>' +
                       '<td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Type: <br/>' + '</b>' + warehouse_type + '</font></td></tr>' +

                        '<tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Location Information' + '</b></font>' + '</td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Country: <br/>' + '</b>' + country + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Address: <br/>' + '</b>' + str_add + city + ' ' + state + ', ' + zip_plus_four + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Exact Location:' + '</b>' + '</td></tr>' +
                        '<tr><td align="left" width="50%" colspan="1">' + '<b><font color="black">' + "Lat: <br/>" + '</b>' + parseFloat(latitude).toFixed(2) + '</font></td>' +
                        '<td align="left" width="50%" colspan="1">' + '<b><font color="black">' + 'Long: <br/>' + '</b>' + parseFloat(longitude).toFixed(2) + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "Precisely " + parseFloat(distance).toFixed(2) + " miles away." + '</font></td></tr>' +
                        '</td></tr></table>';
                }

                var marker = new google.maps.Marker({
                    map: map,
                    position: point,
                    title: warehouse_name,
                    icon: warehouse_Image,
                    animation: google.maps.Animation.DROP
                });

                marker.desc = markerContent;






                oms.addMarker(marker);
                return marker;
            }
            function createMarker_ResourceInWarehouse(point, Resource_ID, Product_ID, Make, Model, Weight, Location_ID, Location_Type, Location_Desc, City, County, State, Zip, Lat, Long, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Equipment, Product_Qty, distance, oms) {


                var markerContent;
                if (Location_Desc == null) {

                    markerContent =
                        '<table border="1" width="100%"><tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Resource Information' + '</b></font></td></tr>' +
                        '<tr><td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Make: <br/>' + '</b>' + Make + '</font></td>' +
                        '<td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Model: <br/>' + '</b>' + Model + '</font></td></tr>' +
                        '<tr><td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Type: <br/>' + '</b>' + Equipment + '</font></td>' +
                        '<td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Subtype: <br/>' + '</b>' + Product_Subtype + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black" size="3">' + 'Description: <br/>' + '</b></font><font color="black">' + FEMA_Description + '</font>' + '</td></tr>' +

                        '<tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Location Information' + '</b></font>' + '</td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'County: <br/>' + '</b>' + County + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Address: <br/>' + '</b>' + City + ' ' + State + ', ' + Zip + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2">' + '<b><font color="black" size="3">' + 'Exact Location:' + '</b>' + '</font></td></tr>' +
                        '<tr><td align="left" width="50%">' + '<b><font color="black">' + "Lat: <br/>" + '</b>' + parseFloat(Lat).toFixed(2) + '</font></td>' +
                        '<td align="left" width="50%">' + '<b><font color="black">' + 'Long: <br/>' + '</b>' + parseFloat(Long).toFixed(2) + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "Precisely " + parseFloat(distance).toFixed(2) + " miles away." + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "<button  onclick='MoveResource(" + Product_ID + ", " + Lat + ", " + Long + "); return false;' style='color: #FFFFFF; background-color: #FF0000'>Assign to an order</button> " + '</font></td></tr>' +
                        '</td></tr></table>';

                }
                else {
                    markerContent =
                        '<table border="1" width="100%"><tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Resource Information' + '</b></font></td></tr>' +
                        '<tr><td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Make: <br/>' + '</b>' + Make + '</font></td>' +
                        '<td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Model: <br/>' + '</b>' + Model + '</font></td></tr>' +
                        '<tr><td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Type: <br/>' + '</b>' + Equipment + '</font></td>' +
                        '<td align="left" valign="top" colspan="1">' + '<b><font color="black">' + 'Subtype: <br/>' + '</b>' + Product_Subtype + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black" size="3">' + 'Description: <br/>' + '</b></font><font color="black">' + FEMA_Description + '</font>' + '</td></tr>' +

                        '<tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Location Information' + '</b></font>' + '</td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'County: <br/>' + '</b>' + County + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Address: <br/>' + '</b>' + City + ' ' + State + ', ' + Zip + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Location Discription: <br/>' + '</b>' + Location_Desc + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2">' + '<b><font color="black" size="3">' + 'Exact Location:' + '</b>' + '</font></td></tr>' +
                        '<tr><td align="left" width="50%">' + '<b><font color="black">' + "Lat: <br/>" + '</b>' + parseFloat(Lat).toFixed(2) + '</font></td>' +
                        '<td align="left" width="50%">' + '<b><font color="black">' + 'Long: <br/>' + '</b>' + parseFloat(Long).toFixed(2) + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "Precisely " + parseFloat(distance).toFixed(2) + " miles away." + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "<button  onclick='MoveResource(" + Product_ID + ", " + Lat + ", " + Long + "); return false;' style='color: #FFFFFF; background-color: #FF0000'>Assign to an order</button> " + '</font></td></tr>' +
                        '</td></tr></table>';




                }

                var marker = new google.maps.Marker({
                    map: map,
                    position: point,
                    title: Model,
                    icon: resource_Image,
                    animation: google.maps.Animation.DROP
                });

                marker.desc = markerContent;

                oms.addMarker(marker);
                return marker;
            }
            function createMarker_MobileUnit(point, Resource_ID, Mobile_Unit_ID, Call_Center_ID, Mobile_Desc, Vehicle_Desc, PLATENUMBER, Vin, Vehicle_Make, Vehicle_Model, Vehicle_Year, Vehicle_Type, FUELTYPE, FullName, Gender, Person_Type, Certification, Phone_Primary, Phone_Secondary, Email, oms) {


                var markerContent;


                markerContent = '<br/>' + '<b>' + 'Mobileunit Team Member Description' + '</b>' +
                            '<br/>' + 'Assigned CallCenter ID:' + Call_Center_ID +
                            '<br/>' + 'Name:' + FullName + ' - ' + Person_Type +
                            '<br/>' + 'Gender:' + Gender +
                            '<br/>' + 'Certifications:' + Certification +
                            '<br/>' +
                            '<br/>' + '<b>' + 'Contact Team Member' + '</b>' +
                            '<br/>' + 'Primary Phone Number:' + Phone_Primary +
                            '<br/>' + 'Secondary Phone Number:' + Phone_Secondary +
                            '<br/>' + 'Email:' + Email +
                            '<br/>' +
                            '<br/>' + '<b>' + 'Vehicle Information' + '</b>' +
                            '<br/>' + 'Resource ID/Mobileunit ID: ' + Resource_ID + ' / ' + Mobile_Unit_ID +
                            '<br/>' + 'VIN/Platenumber: ' + Vin + ' / ' + PLATENUMBER +
                            '<br/>' + 'Make: ' + Vehicle_Make +
                            '<br/>' + 'Model: ' + Vehicle_Model +
                            '<br/>' + 'Year: ' + Vehicle_Year +
                            '<br/>' + 'Type: ' + Vehicle_Type +
                            '<br/>' + 'Fuel Type: ' + FUELTYPE +
                            '<br/>' + 'Vehicle Discription: ' + '<br/>' + Vehicle_Desc;



                var marker = new google.maps.Marker({
                    map: map,
                    position: point,
                    title: Mobile_Unit_ID,
                    icon: mobileunit_Image,
                    animation: google.maps.Animation.DROP
                });


                marker.desc = markerContent;
                oms.addMarker(marker);




                return marker;
            }

            //////////////////////////////////////////////////////////////////
            // Create the side bar entry as a menu item
            function createSidebarEntry_ResourceInWarehouse(marker, Resource_ID, Product_ID, Make, Model, Weight, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Equipment, Product_Qty, distance) {
                var div = document.createElement('div');

                var product_info;

                product_info =
                    '<table border="10", width=100%>' +
                        '<tr>' +
                            '<th>' + '<font size="3">' + 'Type' + '</font>' + '</th>' +
                            '<th>' + '<font size="3">' + 'Name' + '</font>' + '</th>' +
                        '</tr>' +

                         '<tr>' +
                            '<td>' + Equipment + '</td>' +
                            '<td>' + Model + '</td>' +
                        '</tr>' +

                        '<tr>' +
                            '<td colspan="2">' + '<font size="3"><b>Quantity Avaiable: </font></b>' + Product_Qty + '</td>' +
                        '</tr>' +
                          '<tr>' +
                            '<td colspan="2">' + '<font size="3"><b>Description: </font></b>' + FEMA_Description + '</td>' +
                        '</tr>' +
                    '</table>';


                var sideInfoContent = '<br/><b><font size="3">Distance: ' + distance.toFixed(2) + ' miles </font>' + '<img src="Images/Resources.png" align = "right">' + '<br/>' +
                     product_info;

                div.innerHTML = sideInfoContent;
                div.style.cursor = 'pointer';
                div.style.marginBottom = '5px';




                //when user clicks the 'div' section...


                google.maps.event.addDomListener(div, "click", function () {
                    //call click function for that marker to display contents
                    google.maps.event.trigger(marker, "click");
                    google.maps.event.trigger(marker, "click");
                    alert(data.product_id);

                    //you could have the marker display other content by calling the following instead--- check it out

                    //infoWindow.setContent(Description);
                    //infoWindow.open(map, marker);
                });
                //when mouse is hovering over 'div'... 
                google.maps.event.addDomListener(div, "mouseover", function () {
                    // darken background
                    div.style.backgroundColor = '#eee';
                });
                //when mouse stops hovering over 'div' and leaves area... 
                google.maps.event.addDomListener(div, "mouseout", function () {
                    //bring back to normal
                    div.style.backgroundColor = '#fff';
                });


                return div;
            }
            function createSidebarEntry_Warehouse(marker, warehouse_type, warehouse_name, city, distance) {
                var div = document.createElement('div');

                var product_info;

                product_info =
                    '<table border="10", width=100%>' +
                        '<tr>' +
                            '<th>' + '<font size="3">' + 'Type' + '</font>' + '</th>' +
                            '<th>' + '<font size="3">' + 'Name' + '</font>' + '</th>' +
                        '</tr>' +

                         '<tr>' +
                            '<td>' + warehouse_type + '</td>' +
                            '<td>' + warehouse_name + '</td>' +
                        '</tr>' +

                        '<tr>' +
                            '<td colspan="2">' + '<font size="3"><b>City: </font></b>' + city + '</td>' +
                        '</tr>' +
                    '</table>';



                var sideInfoContent = '<br/><b><font size="3">Distance: ' + distance.toFixed(2) + ' miles </font>' + '<img src="Images/WarehouseResources.png" align = "right">' + '<br/>' +
                    product_info;

                div.innerHTML = sideInfoContent;
                div.style.cursor = 'pointer';
                div.style.marginBottom = '5px';


                //var Description = 
                //'</table>'+
                //'<tr>' +
                //'<td colspan="2">' + '<font size="3"><b>Discription: </font></b>' +
                //'<br/>' + Product_Desc + '</td>' +
                //'</tr>' +
                //'</table>';

                //when user clicks the 'div' section...

                google.maps.event.addDomListener(div, "click", function () {
                    //call click function for that marker to display contents
                    google.maps.event.trigger(marker, "click");
                    google.maps.event.trigger(marker, "click");

                    //you could have the marker display other content by calling the following instead--- check it out

                    //infoWindow.setContent(Description);
                    //infoWindow.open(map, marker);
                });
                //when mouse is hovering over 'div'... 
                google.maps.event.addDomListener(div, "mouseover", function () {
                    // darken background
                    div.style.backgroundColor = '#eee';
                });
                //when mouse stops hovering over 'div' and leaves area... 
                google.maps.event.addDomListener(div, "mouseout", function () {
                    //bring back to normal
                    div.style.backgroundColor = '#fff';
                });


                return div;
            }
            function createSidebarEntry_Mobileunit(marker, Call_Center_ID, FullName, Employee_Leadership, distance) {
                var div = document.createElement('div');

                var product_info;

                product_info =
                    '<table border="10", width=100%>' +
                        '<tr>' +
                            '<th>' + '<font size="3">' + 'Resource Type' + '</font>' + '</th>' +
                            '<th>' + '<font size="3">' + 'Assigned' + '</font>' + '</th>' +
                        '</tr>' +

                         '<tr>' +
                            '<td>' + 'MobileUnit Member' + '</td>' +
                            '<td>' + 'CallCenter ID(s):' + Call_Center_ID + '</td>' +
                        '</tr>' +

                        '<tr>' +
                            '<td colspan="2">' + '<font size="3"><b>Name: </font></b>' + FullName + '</td>' +
                        '</tr>' +
                          '<tr>' +
                            '<td colspan="2">' + '<font size="3"><b>Role: </font></b>' + Employee_Leadership + '</td>' +
                        '</tr>' +
                    '</table>';


                var sideInfoContent = '<br/><b><font size="3">Distance: ' + distance.toFixed(2) + ' miles </font>' + '<img src="Images/Mobileunit.png" align = "right">' + '<br/>' +
                    product_info;

                div.innerHTML = sideInfoContent;
                div.style.cursor = 'pointer';
                div.style.marginBottom = '5px';


                //var Description = 
                //'</table>'+
                //'<tr>' +
                // '<td colspan="2">' + '<font size="3"><b>Discription: </font></b>' +
                // '<br/>' + Product_Desc + '</td>' +
                //'</tr>' +
                //'</table>';

                //when user clicks the 'div' section...

                google.maps.event.addDomListener(div, "click", function () {
                    //call click function for that marker to display contents
                    google.maps.event.trigger(marker, "click");
                    google.maps.event.trigger(marker, "click");

                    //you could have the marker display other content by calling the following instead--- check it out

                    //infoWindow.setContent(Description);
                    //infoWindow.open(map, marker);
                });
                //when mouse is hovering over 'div'... 
                google.maps.event.addDomListener(div, "mouseover", function () {
                    // darken background
                    div.style.backgroundColor = '#eee';
                });
                //when mouse stops hovering over 'div' and leaves area... 
                google.maps.event.addDomListener(div, "mouseout", function () {
                    //bring back to normal
                    div.style.backgroundColor = '#fff';
                });


                return div;
            }
            //////////////////////////////////////////////////////////////////

            //check if the check box has been clickon... if check return 1 if not return 0.
            function validate_CheckBoxs() {

                if (document.getElementById('<%= warehouseBox.ClientID %>').checked == true) {
                    warehouseChecked = 1;
                }
                else {
                    warehouseChecked = 0;
                }
                if (document.getElementById('<%= resourceBox.ClientID %>').checked == true) {
                    resourceChecked = 1;
                }
                else {
                    resourceChecked = 0;
                }
                if (document.getElementById('<%= mobileunitBox.ClientID %>').checked == true) {
                    mobileunitChecked = 1;
                }
                else {
                    mobileunitChecked = 0;
                }
                return;
            }
            //grabbing poly points from the text boxes
            function plotPoly() {
                //initialize();
                var northLat = document.getElementById('<%=txtNorthLat.ClientID%>').value;
                var northLong = document.getElementById('<%=txtNorthLong.ClientID%>').value;
                var southLat = document.getElementById('<%=txtSouthLat.ClientID%>').value;
                var southLong = document.getElementById('<%=txtSouthLong.ClientID%>').value;
                var eastLat = document.getElementById('<%=txtEastLat.ClientID%>').value;
                var eastLong = document.getElementById('<%=txtEastLong.ClientID%>').value;
                var westLat = document.getElementById('<%=txtWestLat.ClientID%>').value;
                var westLong = document.getElementById('<%=txtWestLong.ClientID%>').value;
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
                //Javascrpts async tasks might not get to set disasterSet to 1; this is a safegard!
                disasterSet = 1;
                SearchBtn_Show_YES();
                //'center' variable can now be referanced as the center lat and long of the disaster
                disasterCenter = bounds.getCenter();
                disasterBounds = bounds;
                //alert(disasterCenter + ' - not found');

            }

            function disasterSet_YES() {
                disasterSet = 1;
            }
            function disasterSet_NO() {
                disasterSet = 0;
            }
            function SearchBtn_Show_YES() {
                document.getElementById("Search").style.display = "block";
            }
            function SearchBtn_Show_NO() {
                document.getElementById("Search").style.display = "none";
            }
            ///////////////////////////////////////

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
                                checkedValues += "/" + labelArray[0].innerHTML;
                            }
                            else { checkedValues += labelArray[0].innerHTML; }
                        }
                    }
                }

                var arrayOfTypes = checkedValues.split('/');

                return arrayOfTypes;
            }

            function MoveResource(Product_ID, Lat, Long) {

                document.location.href = "MoveResource.aspx?Product_ID=" + Product_ID + "&Lat=" + Lat + "&Long=" + Long;

            }

        </script>

    </head>
    <!--BODY-- content shown on screen and ID-ing Map-textboxes-Buttons-etc. -->
    <body>
        <form id="form1">

            <div id="text">
        </div>
        <!--<form action="submit.php" method="POST" accept-charset="utf-8">
            &nbsp;<br/>
            <br/>
            &nbsp;</form>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#select3").fcbkcomplete({
                    json_url: "data.txt",
                    addontab: true,
                    maxitems: 10,
                    input_min_size: 0,
                    height: 10,
                    cache: true,
                    newel: true,
                    select_all_text: "select",
                });
            });
        </script>-->
        
        <div id="testme"></div>
            <div style="margin-left: 20px;">
                <div style="margin-left: 5px;">
                    <table width="100%">
                        <tr>
                            <td width ="50%" align="center">
<asp:Button ID="SBAddress_btn" runat="server" Text="Search By Address" OnClick="SearchbyAddress_Click" ClientIDMode="Static"></asp:Button>
                            </td>
                            <td width="50%" align="center">
<asp:Button ID="SBDisaster_btn" runat="server" Text="Search By Disaster" OnClick="SearchbyDisaster_Click" ClientIDMode="Static"></asp:Button>
                            </td>
                        </tr>
                    </table>


            <table width ="100%">
                <tr>
                    <td>

                    <asp:Label id="Address_l" runat="server" Text="Address: " Visible="False"></asp:Label>

                <asp:TextBox  ID="txtSearchAddress"  runat="server" Visible="False">Hammond, IN</asp:TextBox>
                     </td>
                    <td>
                                <asp:Label ID="Disaster_l" runat="server" Text="Disaster Name:" Visible="False"></asp:Label>

                                <!--<asp:TextBox ID="txtDisasterName" runat="server"></asp:TextBox>-->
                                <asp:DropDownList ID="ddlDisaster" runat="server" Visible="False"
                                    Height="24px" Width="120px"
                                    OnSelectedIndexChanged="ddlDisaster_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                                            
                    </td>
                    <td>
                                <asp:Label runat="server" Text="Disaster Type:" ID="Type_l" Visible="False"></asp:Label>

                                <asp:TextBox runat="server" ID="txtDisasterType" Visible="False"></asp:TextBox>

                    </td>
                    <td>
                <asp:Label id="Distance_l" runat="server" Text="Distance: " Visible="False"></asp:Label>

                     <asp:DropDownList runat="server" ID="ddlRadius"  Visible="False" ClientIDMode="Static">
                        <asp:ListItem Value="1">1 miles</asp:ListItem>
                        <asp:ListItem  Value="5">5 miles</asp:ListItem>
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
                    <td>


                                <asp:Button ID="typebtn" runat="server" Text="Choose Type" Visible="False" />
                                            
                    </td>

                    
                    
                </tr>
            </table>
                </div>

                <div>


                    <asp:Table ID="Table3" runat="server" BorderWidth="2px" Height="100%" Width="100%">
                        <asp:TableRow ID="TableRow4" runat="server">
                            <asp:TableCell>
                                <asp:TableCell ID="TableCell5" runat="server">
                                    <asp:Label runat="server" Text="North Latitude:" ID="lblNorthLat" Visible="False"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ID="TableCell6" runat="server" HorizontalAlign="Left">
                                    <asp:TextBox runat="server" ID="txtNorthLat" Width="50px" Visible="False"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell ID="TableCell7" runat="server">
                                    <asp:Label runat="server" Text="North Longitude:" ID="lblNorthLong" Visible="False"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ID="TableCell8" runat="server" HorizontalAlign="Left">
                                    <asp:TextBox runat="server" ID="txtNorthLong" Width="50px" Visible="False"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableCell>

                            <asp:TableCell ID="TableCell9" runat="server">
                                <asp:Label runat="server" Text="South Latitude:" ID="lblSouthLat" Visible="False"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell10" runat="server" HorizontalAlign="Left">
                                <asp:TextBox runat="server" ID="txtSouthLat" Width="50px" Visible="False"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell11" runat="server">
                                <asp:Label runat="server" Text="South Longitude:" ID="lblSouthLong" Visible="False" ></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell12" runat="server" HorizontalAlign="Left">
                                <asp:TextBox runat="server" ID="txtSouthLong" Width="50px" Visible="False"></asp:TextBox>
                            </asp:TableCell>

                            <asp:TableCell ID="TableCell13" runat="server">
                                <asp:Label runat="server" Text="East Latitude:" ID="lblEastLat" Visible="False"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell14" runat="server" HorizontalAlign="Left">
                                <asp:TextBox runat="server" ID="txtEastLat" Width="50px" Visible="False"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell15" runat="server">
                                <asp:Label runat="server" Text="East Longitude:" ID="lblEastLong" Visible="False"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell16" runat="server" HorizontalAlign="Left">
                                <asp:TextBox runat="server" ID="txtEastLong" Width="50px" Visible="False"></asp:TextBox>
                            </asp:TableCell>

                            <asp:TableCell ID="TableCell17" runat="server">
                                <asp:Label runat="server" Text="West Latitude:" ID="lblWestLat" Visible="False"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell18" runat="server" HorizontalAlign="Left">
                                <asp:TextBox runat="server" ID="txtWestLat" Width="50px" Visible="False"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell19" runat="server">
                                <asp:Label runat="server" Text="West Longitude:" ID="lblWestLong" Visible="False"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ID="TableCell20" runat="server" HorizontalAlign="Left">
                                <asp:TextBox runat="server" ID="txtWestLong" Width="50px" Visible="False"></asp:TextBox>
                            </asp:TableCell>

                        </asp:TableRow>
                    </asp:Table>

                </div>
                <table border="5px" width="100%">

                    <tbody>
                        <tr style="vertical-align: top" align="center">
                            <td class="style6" style="width: 100%">
                                <asp:CheckBox ID="resourceBox" runat="server" onclick="validate_CheckBoxs()" TextAlign="Left" Text="Display Resources" Width="33%" />
                                <asp:CheckBox ID="warehouseBox" runat="server" onclick="validate_CheckBoxs()" TextAlign="Left" Text="Display Warehouses" Width="33%" />
                                <asp:CheckBox ID="mobileunitBox" runat="server" onclick="validate_CheckBoxs()" TextAlign="Left" Text="Display Mobileunits" Width="33%" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                     
                    <div id="sidebar" style="border-style: solid none solid solid; border-width: medium; border-color: #FF0000; overflow: auto; height: 550px; width: 20%; font-size: 11px; color: #000; float: left; ">Search Results:</div>
                        
                            <div id="map" style="border-style: solid solid solid none; border-width: medium; width: auto; height: 550px;"></div>
                        
                    <div><input id="Search"  type="button" onclick="desideSearchType();" value="Search" style="display: none; color: #FFFFFF; background-color: #FF0000; width: 100%;" >  </asp:Button></div>
        </form>  
    </body>
</html>              





                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    CancelControlID="btnCancel" OkControlID="btnOkay"
                    TargetControlID="typebtn" PopupControlID="Panel1"
                    PopupDragHandleControlID="PopupHeader" DropShadow="True" 
                    ClientIDMode="Static" Drag="True" BackgroundCssClass="ModalPopupBG">
                </asp:ModalPopupExtender>

                <asp:Panel ID="Panel1" Style="display: none" runat="server" BorderColor="#333333" BackColor="Silver" BorderStyle="Solid" BorderWidth="3" >
                    <div class="HellowWorldPopup">
                        <div class="PopupHeader" id="PopupHeader">Resource Types</div>
                        <div class="PopupBody">
                            <br />
                            <table align="center" >
                                <tr>
                                    <td>
                                        <div style="BORDER: solid; OVERFLOW: scroll; WIDTH: auto; height: 300px;">
                                            <asp:CheckBoxList ID="Type"  onchange="iterateCheckBoxList()" runat="server" DataSourceID="sdsProductType" DataTextField="Equipment" DataValueField="Equipment" AutoPostBack="False">
                                            </asp:CheckBoxList>
                                            <asp:SqlDataSource ID="sdsProductType" runat="server" ConnectionString="Data Source=SGZ-USH447L0JM\SQLEXPRESS;Initial Catalog=disaster_management_DEV;Integrated Security=True"
                                                SelectCommand="SELECT DISTINCT [Equipment] FROM [FEMA]"></asp:SqlDataSource> 
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="Controls">
                            <input id="btnOkay" type="button" value="Done" />
                            <input id="btnCancel" type="button" value="Cancel" />
                        </div>
                    </div>
                </asp:Panel>


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    


</asp:Content>
