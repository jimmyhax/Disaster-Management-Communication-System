<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="true" AutoEventWireup="false" CodeBehind="test.aspx.cs" Inherits="DMCS.SandBox.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html>
<head>
<title>jQuery Autocomplete: XML as data source</title>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.js"></script>

<script>
    $(document).ready(function () {
        var myArr = [];

        $.ajax({
            type: "GET",
            url: "../Content/Search_List_Datasource/search_product_results.xml", // change to full path of file on server
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
                }
            });
        }
    });
</script>
</head>
<body style="font-size:62.5%;">

<h1>jQuery Autocomplete using XML as Data Source Example</h1>
<form name="search_form" id="searchForm" method="GET" >
	<label for="searchBox">Keyword Search</label>
	<input type="text" id="searchBox" name="searchString" />
</form>

</body>
</html>
</asp:Content>
