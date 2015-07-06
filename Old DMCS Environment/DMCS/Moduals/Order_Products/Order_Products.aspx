<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Order_Products.aspx.cs" Inherits="DMCS.Moduals.Order_Products.Order_Products" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #searchBox {
            width: 100%;
        }

        #search {
            width: 605px;
        }
        #map {
        border-bottom:10px solid #EA5151;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html>
    <head>
        <title></title>
        <!-- The below line is a cludge fix for IE9 -->
        <meta http-equiv="X-UA-Compatible" content="IE=8;FF=3;OtherUA=4;charset=utf-8" />
        <!-- Google Map API Key -->
        <script src="https://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
        <!-- Link to utility functions -->
        <script src="Scripts/util.js" type="text/javascript"></script>
        <script src="Scripts/oms.min.js" type="text/javascript"></script>
        <script src="Scripts/JSON2.js" type="text/javascript"></script>
        <script src="Scripts/jquery.js" type="text/javascript"></script>
        <script src="Scripts/jquery.fcbkcomplete.js" type="text/javascript" charset="utf-8"></script>
        <link href="CSS/MPEstyle.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="CSS/style.css" type="text/css" media="screen" charset="utf-8" />
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.js"></script>
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
            var typeselect_nonFEMA = 0;

            //checking of checkboxes have been checked
            var FEAM_ResourceChecked = 0;
            var warehouseChecked = 0;
            var general_ResourceChecked = 0;
            var mobileunitChecked = 0;

            //Google map icons
            var resource_Image = "Images/Resources.png";
            var warehouse_Image = "Images/WarehouseResources.png";
            var mobileunit_Image = "Images/Mobileunit.png";
            var person_Image = "Images/People.png";
            var X_Image = "Images/X_image.png";


            var gm = google.maps;
            var iw = new gm.InfoWindow({ maxWidth: 200 });

            //passing records
            var Product_ID_Array = [];
            var QTY_Input = [];
            var Distance_Input = [];

            var JSON_Product_ID_Array;
            var JSON_QTY_Input;
            var count_items = 0;

            var pos = new google.maps.LatLng(41, -87);


            var circleArray = new Array();
            var warehouseArray = new Array();
            var warehouseIDArray = new Array();
            var mobileunitArray = new Array();
            var mobileunitIDArray = new Array();
            var orderMarkerLocation;

            var myIDArr = [];
            var myNameArr = [];
            //var mySearchedNameArr = [];
            var divCount = 0;
            var deletedindexArr = [];
            var terms;
            var mySearchedNameString;
            

            function initialize() {

                //document.getElementById('sidebar').innerHTML = 
                //'<table width="100%" bgcolor="#aaaaaa" style="font-family: ' + "'Calibri Light'" + '">' + 
                //    '<tr>' + 
                //        '<th colspan="2" style="padding: 5px 10px 5px 10px; background-color: #666666; width:100%" >' + 
                //            '<label style="font-size: large; color: #E2E2E2">Search List</label>' + 
                //        '</th>' + 
                //    '</tr>' +
                //'</table>';

                geocoder = new google.maps.Geocoder();

                mapOptions = {
                    center: new google.maps.LatLng(startingLat, startingLng),
                    zoom: startingZoom,
                    mapTypeId: google.maps.MapTypeId.HYBRID  // Change this to satellite for something cool, or hybrid, etc
                };

                map = new google.maps.Map(document.getElementById('map'), mapOptions);
            }
            google.maps.event.addDomListener(window, 'load', initialize);
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
                //Checking to see what the user wants to search for (checkboxes)
                if (mobileunitChecked == 0 && general_ResourceChecked == 0 && warehouseChecked == 0 && FEAM_ResourceChecked == 0) {
                    //sbar.innerHTML = 'Choose a check box first to view the corresponding locations';
                    alert('please select items to be displayed before proceeding.');
                    return;
                }
                //grab the radius from drop down
                var radius = document.getElementById('ddlRadius').value;
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
                //Checking to see what the user wants to search for (checkboxes) + (Searchbox)
                if (terms.length != 0) {
                    for (var i = deletedindexArr.length - 1; i >= 0; i--)
                        terms.splice(deletedindexArr[i], 1);

                    mySearchedNameString = terms.toString().slice(0, -1);
                    alert(terms);
                    if (FEAM_ResourceChecked == 1 || general_ResourceChecked == 1) {
                        if (FEAM_ResourceChecked == 1) {
                            var Prepair_Textbox_FEMA_Product_Data = 'SearchResponces/Textbox_FEMA_Product_SearchResponse.aspx?productNamesWC=' + mySearchedNameString + '&lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                            Write_Textbox_FEMA_Resource();
                        }
                        if (general_ResourceChecked == 1) {
                            var Prepair_Textbox_General_Product_Data = 'SearchResponces/Textbox_General_Product_SearchResponse.aspx?productNamesWC=' + mySearchedNameString + '&lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                            Write_Textbox_General_Resource();
                        }
                        divCount = 0;
                        deletedindexArr.length = 0;
                        terms.length = 0;
                        document.getElementById('search').value = '';
                    }
                }
                else {
                    if (FEAM_ResourceChecked == 1) {
                        var Prepair_All_FEMA_Product_Data = 'SearchResponces/FEMA_Product_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                        Write_All_FEMA_Resource();
                    }
                    if (general_ResourceChecked == 1) {
                        var Prepair_All_General_Product_Data = 'SearchResponces/General_Product_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                        Write_All_General_Resource();
                    }
                }
                if (warehouseChecked == 1) {
                    var Prepair_Warehouse_Data = 'SearchResponces/Warehouse_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                    Write_Warehouse();
                }
                if (mobileunitChecked == 1) {
                    var Prepair_mobileunit_Data = 'SearchResponces/MobileUnit_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
                    Write_MobileUnit();
                }

                //if (personChecked == 1) { 
                //var Prepair_Person_Data = 'SearchResponces/Person_SearchResponse.aspx?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;                
                //Write_Person(); 
                //}
                //////////////////////////////////////////////////////////////////
                //Each function below writes an XML file that containes the data to grab for later use
                //Textbox search
                function Write_Textbox_FEMA_Resource() {
                    downloadUrl(Prepair_Textbox_FEMA_Product_Data, function (data) {
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
                        border = '<table border="10", width=100%, borderColor="#00FF00">' + '<font size="5"><b>' + 'Resources' + '</font>' + '- FEMA</b>' + '</table>';
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
                function Write_Textbox_General_Resource() {
                    downloadUrl(Prepair_Textbox_General_Product_Data, function (data) {


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
                        border = '<table border="10", width=100%, borderColor="#00FF00">' + '<font size="5"><b>' + 'Resources' + '</font>' + '- non-FEMA</b>' + '</table>';
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



                            //center of disaster or address - distance from resource
                            var distance = parseFloat(locations[i].getAttribute('distance'));

                            //location of a marker
                            var point = new google.maps.LatLng(parseFloat(locations[i].getAttribute('n_lat')), parseFloat(locations[i].getAttribute('n_long')));
                            bounds.extend(point);
                            /////////////////////////////////////////////////////////

                            //what will be in the marker on the map
                            var marker = createMarker_ResourceInWarehouse_nonFEMA(point, Resource_ID, Product_ID, Make, Model, Weight, Location_ID, Location_Type, Location_Desc, City, County, State, Zip, Lat, Long, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Product_Qty, distance, oms);


                            /////////////////////////////////////////////////////////

                            //what will be in the side menu next to map
                            var sidebarEntry = createSidebarEntry_ResourceInWarehouse_nonFEMA(marker, Resource_ID, Product_ID, Make, Model, Weight, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Product_Qty, distance);

                            //////////////////////////////////////////////////////////
                            sbar.appendChild(sidebarEntry);


                        }
                        map.fitBounds(bounds);

                    });

                }
                //no text in text box; checkboxes checked; display all results for that checkbox
                function Write_All_FEMA_Resource() {
                    downloadUrl(Prepair_All_FEMA_Product_Data, function (data) {
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
                        border = '<table border="10", width=100%, borderColor="#00FF00">' + '<font size="5"><b>' + 'Resources' + '</font>' + '- FEMA</b>' + '</table>';
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
                function Write_All_General_Resource() {
                    downloadUrl(Prepair_All_General_Product_Data, function (data) {


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
                        border = '<table border="10", width=100%, borderColor="#00FF00">' + '<font size="5"><b>' + 'Resources' + '</font>' + '- non-FEMA</b>' + '</table>';
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



                            //center of disaster or address - distance from resource
                            var distance = parseFloat(locations[i].getAttribute('distance'));

                            //location of a marker
                            var point = new google.maps.LatLng(parseFloat(locations[i].getAttribute('n_lat')), parseFloat(locations[i].getAttribute('n_long')));
                            bounds.extend(point);
                            /////////////////////////////////////////////////////////

                            //what will be in the marker on the map
                            var marker = createMarker_ResourceInWarehouse_nonFEMA(point, Resource_ID, Product_ID, Make, Model, Weight, Location_ID, Location_Type, Location_Desc, City, County, State, Zip, Lat, Long, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Product_Qty, distance, oms);


                            /////////////////////////////////////////////////////////

                            //what will be in the side menu next to map
                            var sidebarEntry = createSidebarEntry_ResourceInWarehouse_nonFEMA(marker, Resource_ID, Product_ID, Make, Model, Weight, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Product_Qty, distance);

                            //////////////////////////////////////////////////////////
                            sbar.appendChild(sidebarEntry);


                        }
                        map.fitBounds(bounds);

                    });

                }
                //non resource objects
                function Write_Warehouse() {
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
                            warehouseIDArray.push(warehouse_id);

                        }
                        markerOrder = new google.maps.Marker({
                            position: new google.maps.LatLng(center.lat(), center.lng()),
                            title: 'DMCS Order',
                            map: map,
                            draggable: true,
                            icon: resource_Image
                        });
                        //end drag
                        google.maps.event.addListener(markerOrder, 'dragend', function () {
                            orderMarkerLocation = new google.maps.LatLng(markerOrder.position.lat(), markerOrder.position.lng());

                            for (var i = 0; i < circleArray.length; i++) {
                                if (circleArray[i].contains(orderMarkerLocation)) {

                                    var selectedWarehouseMarker = warehouseArray[i];

                                    $.ajax({
                                        url: 'Finalize_Order.aspx/SaveWarehouseID',
                                        type: 'POST',
                                        contentType: 'application/json',
                                        data: JSON.stringify({ ID: warehouseIDArray[i] }),
                                        success: function (result) {

                                        }
                                    });

                                    google.maps.event.trigger(selectedWarehouseMarker, "click");
                                    alert('Warehouse Selected!');
                                    return;
                                }

                            }

                        });
                        //start drag
                        google.maps.event.addListener(markerOrder, 'drag', function () {


                        });
                        //click
                        google.maps.event.addListener(markerOrder, "click", function (e) {
                            infoWindow.setContent(orderMarkerContent);
                            infoWindow.open(map, markerOrder);


                        });



                        map.fitBounds(bounds);

                    });
                }
                function Write_MobileUnit() {
                    downloadUrl(Prepair_mobileunit_Data, function (data) {


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
                            mobileunitIDArray.push(Mobile_Unit_ID);

                        }


                        markerOrder = new google.maps.Marker({
                            position: new google.maps.LatLng(center.lat(), center.lng()),
                            title: 'DMCS Order',
                            map: map,
                            draggable: true,
                            icon: resource_Image
                        });
                        //end drag
                        google.maps.event.addListener(markerOrder, 'dragend', function () {
                            orderMarkerLocation = new google.maps.LatLng(markerOrder.position.lat(), markerOrder.position.lng());


                            for (var i = 0; i < circleArray.length; i++) {
                                if (circleArray[i].contains(orderMarkerLocation)) {

                                    var selectedmobileunitMarker = mobileunitArray[i];

                                    $.ajax({
                                        url: 'Finalize_Order.aspx/SaveMobileunitID',
                                        type: 'POST',
                                        contentType: 'application/json',
                                        data: JSON.stringify({ ID: mobileunitIDArray[i] }),
                                        success: function (result) {
                                            alert('Mobileunit Selected!');
                                        }
                                    });

                                    google.maps.event.trigger(selectedmobileunitMarker, "click");

                                    return;
                                }

                            }

                        });
                        //start drag
                        google.maps.event.addListener(markerOrder, 'drag', function () {


                        });
                        //click
                        google.maps.event.addListener(markerOrder, "click", function (e) {
                            infoWindow.setContent(orderMarkerContent);
                            infoWindow.open(map, markerOrder);


                        });

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
                    draggable: false,
                    animation: google.maps.Animation.DROP
                });

                marker.desc = markerContent;


                // Define the circle
                circle = new google.maps.Circle({
                    map: map,
                    clickable: false,
                    // metres
                    radius: 1000,
                    fillColor: '#fff',
                    fillOpacity: .6,
                    strokeColor: '#313131',
                    strokeOpacity: .4,
                    strokeWeight: .8
                });

                // Attach circle to marker
                circle.bindTo('center', marker, 'position');



                circleArray.push(circle.getBounds());
                warehouseArray.push(marker);







                return marker;
            }
            function createMarker_ResourceInWarehouse(point, Resource_ID, Product_ID, Make, Model, Weight, Location_ID, Location_Type, Location_Desc, City, County, State, Zip, Lat, Long, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Equipment, Product_Qty, distance, oms) {
                if (Make == null)
                { Make = "N/A"; }
                if (Model == null)
                { Model = "N/A"; }
                if (Product_Subtype == null)
                { Product_Subtype = "N/A"; }
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
                        '<tr><td align="Center" colspan="2"><font color="black">' + '<button  type="button" onclick="Ask(' + Product_ID.toString() + '); return false;" style="margin: 0px; width: 100%; color: #CCCCCC; background-color: #EA5151">Assign to an order</button>' + '</font></td></tr>' +
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
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Location Description: <br/>' + '</b>' + Location_Desc + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2">' + '<b><font color="black" size="3">' + 'Exact Location:' + '</b>' + '</font></td></tr>' +
                        '<tr><td align="left" width="50%">' + '<b><font color="black">' + "Lat: <br/>" + '</b>' + parseFloat(Lat).toFixed(2) + '</font></td>' +
                        '<td align="left" width="50%">' + '<b><font color="black">' + 'Long: <br/>' + '</b>' + parseFloat(Long).toFixed(2) + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "Precisely " + parseFloat(distance).toFixed(2) + " miles away." + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + '<button  type="button" onclick="Ask(' + Product_ID.toString() + '); return false;" style="margin: 0px; width: 100%; color: #CCCCCC; background-color: #EA5151">Assign to an order</button>' + '</font></td></tr>' +
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
            function createMarker_ResourceInWarehouse_nonFEMA(point, Resource_ID, Product_ID, Make, Model, Weight, Location_ID, Location_Type, Location_Desc, City, County, State, Zip, Lat, Long, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Product_Qty, distance, oms) {
                if (Make == null)
                { Make = "N/A"; }
                if (Model == null)
                { Model = "N/A"; }
                if (Product_Subtype == null)
                { Product_Subtype = "N/A"; }

                var markerContent;

                
                if (Location_Desc == null) {

                    markerContent =
                        '<table border="1" width="100%"><tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Resource Information' + '</b></font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black" size="3">' + 'Description: <br/>' + '</b></font><font color="black">' + Product_Desc + '</font>' + '</td></tr>' +

                        '<tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Location Information' + '</b></font>' + '</td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'County: <br/>' + '</b>' + County + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Address: <br/>' + '</b>' + City + ' ' + State + ', ' + Zip + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2">' + '<b><font color="black" size="3">' + 'Exact Location:' + '</b>' + '</font></td></tr>' +
                        '<tr><td align="left" width="50%">' + '<b><font color="black">' + "Lat: <br/>" + '</b>' + parseFloat(Lat).toFixed(2) + '</font></td>' +
                        '<td align="left" width="50%">' + '<b><font color="black">' + 'Long: <br/>' + '</b>' + parseFloat(Long).toFixed(2) + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "Precisely " + parseFloat(distance).toFixed(2) + " miles away." + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + '<button  type="button" onclick="Ask(' + Product_ID.toString() + '); return false;" style="margin: 0px; width: 100%; color: #CCCCCC; background-color: #EA5151">Assign to an order</button>' + '</font></td></tr>' +
                        '</td></tr></table>';

                }
                else {
                    markerContent =
                        '<table border="1" width="100%"><tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Resource Information' + '</b></font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black" size="3">' + 'Description: <br/>' + '</b></font><font color="black">' + Product_Desc + '</font>' + '</td></tr>' +

                        '<tr><td colspan="2">' + '<b><font color="black" size="3">' + 'Location Information' + '</b></font>' + '</td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'County: <br/>' + '</b>' + County + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Address: <br/>' + '</b>' + City + ' ' + State + ', ' + Zip + '</font></td></tr>' +
                        '<tr><td align="left" colspan="2">' + '<b><font color="black">' + 'Location Description: <br/>' + '</b>' + Location_Desc + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2">' + '<b><font color="black" size="3">' + 'Exact Location:' + '</b>' + '</font></td></tr>' +
                        '<tr><td align="left" width="50%">' + '<b><font color="black">' + "Lat: <br/>" + '</b>' + parseFloat(Lat).toFixed(2) + '</font></td>' +
                        '<td align="left" width="50%">' + '<b><font color="black">' + 'Long: <br/>' + '</b>' + parseFloat(Long).toFixed(2) + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + "Precisely " + parseFloat(distance).toFixed(2) + " miles away." + '</font></td></tr>' +
                        '<tr><td align="Center" colspan="2"><font color="black">' + '<button  type="button" onclick="Ask(' + Product_ID.toString() + '); return false;" style="margin: 0px; width: 100%; color: #CCCCCC; background-color: #EA5151">Assign to an order</button>' + '</font></td></tr>' +
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
                            '<br/>' + 'Vehicle Description: ' + '<br/>' + Vehicle_Desc;



                var marker = new google.maps.Marker({
                    map: map,
                    position: point,
                    title: Mobile_Unit_ID,
                    icon: mobileunit_Image,
                    animation: google.maps.Animation.DROP
                });


                marker.desc = markerContent;
                // Define the circle
                circle = new google.maps.Circle({
                    map: map,
                    clickable: false,
                    // metres
                    radius: 1000,
                    fillColor: '#fff',
                    fillOpacity: .6,
                    strokeColor: '#313131',
                    strokeOpacity: .4,
                    strokeWeight: .8
                });

                // Attach circle to marker
                circle.bindTo('center', marker, 'position');



                circleArray.push(circle.getBounds());
                mobileunitArray.push(marker);








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
                            '<td colspan="2">' + '<font size="3"><b>Description: </font></b>' + Product_Name + '</td>' +
                        '</tr>' +
                        '<tr><td align="Center" colspan="2">' + '<button  type="button" onclick="Ask(' + Product_ID.toString() + '); return false;" style="margin: 0px; width: 100%; color: #CCCCCC; background-color: #EA5151">Assign to an order</button>' + '</td></tr>' +
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


                    //you could have the marker display other content by calling the following instead--- check it out

                    //infoWindow.setContent(Description);
                    //infoWindow.open(map, marker);
                });
                //when mouse is hovering over 'div'... 
                google.maps.event.addDomListener(div, "mouseover", function () {
                    // darken background
                    div.style.opacity = '0.65';
                    div.style.filter = 'alpha(opacity=65)';
                });
                //when mouse stops hovering over 'div' and leaves area... 
                google.maps.event.addDomListener(div, "mouseout", function () {
                    //bring back to normal
                    div.style.opacity = '1.0';
                    div.style.filter = 'alpha(opacity=100)';
                });


                return div;
            }
            function createSidebarEntry_ResourceInWarehouse_nonFEMA(marker, Resource_ID, Product_ID, Make, Model, Weight, Product_Name, Product_Desc, FEMA_Description, Product_Type, Product_Subtype, Product_Qty, distance) {
                var div = document.createElement('div');
                

                var product_info;

                product_info =
                    '<table border="10", width=100%>' +
                        '<tr>' +
                            '<th>' + '<font size="3">' + 'Type' + '</font>' + '</th>' +
                            '<th>' + '<font size="3">' + 'Name' + '</font>' + '</th>' +
                        '</tr>' +

                         '<tr>' +
                            '<td>' + Product_Type + '</td>' +
                            '<td>' + Product_Name + '</td>' +
                        '</tr>' +

                        '<tr>' +
                            '<td colspan="2">' + '<font size="3"><b>Quantity Avaiable: </font></b>' + Product_Qty + '</td>' +
                        '</tr>' +
                          '<tr>' +
                            '<td colspan="2">' + '<font size="3"><b>Description: </font></b>' + Product_Name + '</td>' +
                        '</tr>' +
                        '<tr><td align="Center" colspan="2">' + '<button  type="button" onclick="Ask(' + Product_ID.toString() + '); return false;" style="margin: 0px; width: 100%; color: #CCCCCC; background-color: #EA5151">Assign to an order</button>' + '</td></tr>' +
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


                    //you could have the marker display other content by calling the following instead--- check it out

                    //infoWindow.setContent(Description);
                    //infoWindow.open(map, marker);
                });
                //when mouse is hovering over 'div'... 
                google.maps.event.addDomListener(div, "mouseover", function () {
                    // darken background
                    div.style.opacity = '0.65';
                    div.style.filter = 'alpha(opacity=65)';
                });
                //when mouse stops hovering over 'div' and leaves area... 
                google.maps.event.addDomListener(div, "mouseout", function () {
                    //bring back to normal
                    div.style.opacity = '1.0';
                    div.style.filter = 'alpha(opacity=100)';
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
                //'<td colspan="2">' + '<font size="3"><b>Description: </font></b>' +
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
                    div.style.opacity = '0.65';
                    div.style.filter = 'alpha(opacity=65)';
                });
                //when mouse stops hovering over 'div' and leaves area... 
                google.maps.event.addDomListener(div, "mouseout", function () {
                    //bring back to normal
                    div.style.opacity = '1.0';
                    div.style.filter = 'alpha(opacity=100)';
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
                // '<td colspan="2">' + '<font size="3"><b>Description: </font></b>' +
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
                    div.style.opacity = '0.65';
                    div.style.filter = 'alpha(opacity=65)';
                });
                //when mouse stops hovering over 'div' and leaves area... 
                google.maps.event.addDomListener(div, "mouseout", function () {
                    //bring back to normal
                    div.style.opacity = '1.0';
                    div.style.filter = 'alpha(opacity=100)';
                });


                return div;
            }
            //////////////////////////////////////////////////////////////////




            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            //check if the check box has been clickon... if check return 1 if not return 0.
            function validate_CheckBoxs() {

                if (document.getElementById('<%= warehouseBox.ClientID %>').checked == true) {
                    warehouseChecked = 1;
                }
                else {
                    warehouseChecked = 0;
                }
                if (document.getElementById('<%= resourceBox.ClientID %>').checked == true) {
                    FEAM_ResourceChecked = 1;
                }
                else {
                    FEAM_ResourceChecked = 0;
                }
                if (document.getElementById('<%= GeneralBox.ClientID %>').checked == true) {
                    general_ResourceChecked = 1;
                }
                else {
                    general_ResourceChecked = 0;
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
                var northLat = document.getElementById('<%=HFNorthLat.ClientID%>').value;
                var northLong = document.getElementById('<%=HFNorthLong.ClientID%>').value;
                var southLat = document.getElementById('<%=HFSouthLat.ClientID%>').value;
                var southLong = document.getElementById('<%=HFSouthLong.ClientID%>').value;
                var eastLat = document.getElementById('<%=HFEastLat.ClientID%>').value;
                var eastLong = document.getElementById('<%=HFEastLong.ClientID%>').value;
                var westLat = document.getElementById('<%=HFWestLat.ClientID%>').value;
                var westLong = document.getElementById('<%=HFWestLong.ClientID%>').value;
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
            //Search Box Functions            
            $(document).ready(function () {
                $.ajax({
                    type: "GET",
                    url: "../../Content/Search_List_Datasource/search_product_results.xml", // change to full path of file on server
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
                        //all search list product names placed in an array
                        myNameArr.push($(this).attr("label"));
                        //all search list product IDs placed in an array
                        myIDArr.push($(this).attr("value"));
                    });
                    
                }
                //for multi select
                function split(val) {
                    return val.split(/,\s*/);
                }
                //for multi select
                function extractLast(term) {
                    return split(term).pop();
                }
                //selecting from box
                function setupAC() {
                    $("input#search").autocomplete({
                        minLength: 0,
                        source: function (request, response) {
                            response($.ui.autocomplete.filter(
                                myNameArr, extractLast(request.term)));
                        },
                        focus: function () {
                            return false;
                        },
                        select: function (event, ui) {
                            
                            //this.value = newly selected product name string
                            terms = split(this.value);
                            //Cleaning up string and placing a 'comma + space' at the end of the string
                            terms.pop();
                            terms.push("'"+ ui.item.value + "'");
                            terms.push("");
                            this.value = terms.join(", ");
                            if (divCount == 0) { document.getElementById('sidebar').innerHTML = ''; }
                            document.getElementById('sidebar').innerHTML +=
                                '<div id="' + divCount + '">' +
                                '<table width="100%"  style="font-family: ' + "'Calibri Light'" + '">' + 
                                    '<tr>' + 
                                        '<td style="padding: 5px 10px 5px 10px; width:95%" >' + 
                                                '<label style="font-size: small; color: #fff;" >' + ui.item.value + '</label>' +
                                        '</td>' + 
                                        '<td style="padding: 5px 10px 5px 10px; width:5%" >' + 
                                            '<button type="button" onclick="deleteSelectedQueue(' + divCount + '); return false;" style="background-image: ' + "url('" + X_Image + "');" + ' background-repeat: no-repeat; width:33px; height:33px;border-top-width: 0px;border-bottom-width: 0px;margin-right: 0px;padding-bottom: 0px;padding-left: 0px;padding-top: 0px;padding-right: 0px;border-right-width: 0px;border-left-width: 0px; background-color:transparent;"></button>' +
                                        '</td>' + 
                                    '</tr>' + 
                                '</table>' + 
                                '</div>';
                            divCount++;
                            //Place selected Product name in an array
                            return false;
                        }
                    });
                }

            });
            function deleteSelectedQueue(indexToDelete)
            {
                document.getElementById(indexToDelete).style.display = 'none';
                deletedindexArr.push(indexToDelete);
            }

            ///////////////////////////////////////
            //Assign to order click on Gmap - two functions in a row
            function Ask(Product_ID) {

                if (confirm('Would you like to add this resource to your order?')) {
                    count_items++;
                    //head on over to the Request_Data.asmx file for some data
                    DMCS.Moduals.Order_Products.Request_Data.get_product_id(Product_ID.toString(), displayMessageCallback);
                    Product_ID_Array.push(Product_ID);
                }
                else {// Do nothing!
                }
            }
            function displayMessageCallback(result) {
                document.getElementById("order").innerHTML += '<label style="font-size: small; color: #E2E2E2;" >' + ''+count_items+'. Description: ' + result + '</label>' + '<br />';
            }
            ///////////////////////////////////////
            //PLace order click 
            function sendToFinal() {

                    window.location = 'Place_Order.aspx?Product_ID_Array=' + Product_ID_Array;
            }
            function showResultsCallback(result) {

                alert(result.toString());
                window.location = 'Place_Order.aspx?Product_ID_Array=' + result;
            }

        </script>

    </head>
    <!--BODY-- content shown on screen and ID-ing Map-textboxes-Buttons-etc. -->
    <body>
        <form id="form1">
            <div>
                <asp:Panel ID="Choose_Order_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                    <asp:Label ID="Choose_Order_InfoHead_label" Style="padding: 10px" runat="server" Text="Place An Order" Font-Size="Large"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Choose_Order_InfoBody" runat="server" Style="overflow: hidden;">
                    <div>
                         <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'"> 
                            <tr>
                                <th colspan="2" style="padding: 5px 10px 5px 10px; background-color: #666666; width:100%" > 
                                    <label style="font-size: large; color: #E2E2E2">Order:</label>
                                </th> 
                            </tr>
                             <tr>
                                 <td align="left" style="padding: 5px 10px 5px 10px; background-color: #666666; width:100%; color: #E2E2E2" valign="top" width="50%">
                                     <div id="order">
                                     </div>
                                 </td>
                             </tr>
                         </table>
                        
                        <table width="100%" bgcolor="#666666" border="3" style="color: #CCCCCC;">
                            <tr>
                                <td width="25%" align="center" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:CheckBox ID="resourceBox" runat="server" onclick="validate_CheckBoxs()" TextAlign="Left" Text="Display FEMA Resources " Font-Size="Smaller" />

                                </td>
                                <td width="25%" align="center" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:CheckBox ID="GeneralBox" runat="server" onclick="validate_CheckBoxs()" Text="Display Non-FEMA Resources" TextAlign="Left" Font-Size="Smaller" />
                                </td>
                                <td width="25%" align="center" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:CheckBox ID="warehouseBox" runat="server" onclick="validate_CheckBoxs()" TextAlign="Left" Text="Display Warehouses" Font-Size="Smaller" />
                                </td>
                                <td width="25%" align="center" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:CheckBox ID="mobileunitBox" runat="server" onclick="validate_CheckBoxs()" TextAlign="Left" Text="Display Mobileunits" Font-Size="Smaller" />
                                </td>
                            </tr>
                        </table>
                        <div style="margin: 0px; border-width: 0px; color: #CCCCCC;">
                            <asp:Button ID="SBDisaster_btn" runat="server" Text="Search By Disaster" OnClick="SearchbyDisaster_Click" ClientIDMode="Static" style="margin-top: 0px;margin-bottom: 0px;" BackColor="#333333" Font-Size="Large" ForeColor="#CCCCCC" Width="100%" BorderWidth="0px"></asp:Button>

                            <asp:Button ID="SBAddress_btn" runat="server" Text="Search By Address" OnClick="SearchbyAddress_Click" ClientIDMode="Static" style="margin-top: 0px;margin-bottom: 0px;"  BackColor="#333333" Font-Size="Large" ForeColor="#CCCCCC" Width="100%" Visible="False" BorderWidth="0px"></asp:Button>
                        </div>
                        <table width="100%" bgcolor="Silver" style=" padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                            <tr>
                                <th style="text-align: left; padding: 5px 10px 0px 10px; vertical-align: bottom;">
                                    <asp:Label ID="Search_Label" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="Search:"></asp:Label>
                                </th>
                                <td width="18.75%" style="padding: 5px 10px 5px 10px;">

                                </td>
                                <td width="18.75%" style="padding: 5px 10px 5px 10px;">
                                    <div id="Address_DDL_DIV" runat="server">
                                        <asp:Label ID="Address_l" runat="server" Font-Size="Large" Text="Address:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtSearchAddress" runat="server">Hammond, IN</asp:TextBox>
                                    </div>
                                    <div id="disaster_DDL_DIV" runat="server" style="display: none">
                                        <asp:Label ID="Disaster_l" runat="server" Font-Size="Large" Text="Disaster Name:" Visible="False"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlDisaster" runat="server" Visible="False"
                                            Height="24px" Width="120px"
                                            OnSelectedIndexChanged="ddlDisaster_SelectedIndexChanged"
                                            AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                                <td width="18.75%" style="padding: 5px 10px 5px 10px;">
                                    <asp:Label runat="server" Text="Disaster Type:" Font-Size="Large" ID="Type_l" Visible="False"></asp:Label>
                                    <br />
                                    <asp:TextBox runat="server" ID="txtDisasterType" Visible="False"></asp:TextBox>

                                </td>
                                <td width="18.75%" style="padding: 5px 10px 5px 10px;">
                                    <asp:Label ID="Distance_l" runat="server" Font-Size="Large" Text="Distance: "></asp:Label>
                                    <br />
                                    <asp:DropDownList runat="server" ID="ddlRadius" ClientIDMode="Static">
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
                                <td width="25%" align="center" nowrap="nowrap" style="border-style: none"></td>
                            </tr>
                        </table>
                        <table width="100%" bgcolor="Silver" style="font-family: 'Calibri Light'; padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                            <tr>
                                <td style="padding: 0px 0px 1px 10px;" width="75%">
                                    <input type="text" id="search" name="searchString" style=" height: 22px; width: 100%" />
                                </td>
                                <td style="padding: 0px 10px 1px 0px;" width="25%">
                                    <input id="Search" onclick="desideSearchType();" style=" color: #FFFFFF; background-color: #EA5151; width: 100%; height: 28px;" type="button" value="Search"> </input>
                                </td>
                            </tr>
                        </table>
                        <div id="sidebar" style="border-style: solid none solid solid; border-width: medium; border-color: #EA5151; overflow: auto; height: 550px; width: 33%; font-size: 11px; color: #CCCCCC; float: left; background-color: #666666; background-image: url('http://localhost:3466/Moduals/Order_Products/Images/Slate.jpg');">
                            <asp:Label runat="server" ID="result_L" ClientIDMode="Static"></asp:Label>
                        </div>
                        <div id="map" style="margin: 0px; border-style: solid solid hidden none; border-width: medium; width: auto; height: 510px; margin-bottom: 0px;margin-top: 0px;"></div>
                        <div style=" text-align:center; background-color:#EA5151; height:40px; width:auto; border-style: hidden solid solid none; border-width: medium;">
                            <asp:Button runat="server"  Text="Place The Order" style="width:50%; margin:0px " BackColor="#EA5151" ForeColor="#CCCCCC" ClientIDMode="Static" ID="Final_btn" OnClientClick="sendToFinal(); return false;" BorderWidth="0"></asp:Button>
                        </div>
                    </div>
                </asp:Panel>
                <asp:CollapsiblePanelExtender ID="cpeOrderInfo" runat="server" 
                    CollapseControlID="Choose_Order_InfoHead" 
                    CollapsedText="Place An Order" Enabled="True" 
                    ExpandControlID="Choose_Order_InfoHead" 
                    ExpandedText="Place An Order" 
                    TargetControlID="Choose_Order_InfoBody" 
                    TextLabelID="Choose_Order_InfoHead_label"></asp:CollapsiblePanelExtender>
            </div>
        </form>
    </body>
    </html>


    <asp:HiddenField ID="pass_client_name_hf" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="pass_address_lat_hf" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="pass_address_long_hf" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="pass_Product_ID_Array_hf" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="pass_QTY_Array_hf" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="passWarehouseID_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passProduct_ID_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passLat_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passLong_hf" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="passWarehouseName_hf" runat="server" Value="" ClientIDMode="Static" />


    <asp:HiddenField ID="HFDisasterName" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFDisasterType" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFNorthLat" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFNorthLong" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSouthLat" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSouthLong" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFEastLat" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFEastLong" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFWestLat" runat="server" Value="" ClientIDMode="Static" />
    <asp:HiddenField ID="HFWestLong" runat="server" Value="" ClientIDMode="Static" />

    <asp:HiddenField ID="HFSelected_Product_ID" runat="server" Value="" ClientIDMode="Static" />

<%--    <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true">
            <Services>
                <asp:ServiceReference Path="Request_Data.asmx" />
            </Services>
    </asp:ScriptManager>--%>

    <asp:ToolkitScriptManager runat="server" ID="smtk">
            <Services>
                <asp:ServiceReference Path="Request_Data.asmx" />
            </Services>
    </asp:ToolkitScriptManager>




</asp:Content>

