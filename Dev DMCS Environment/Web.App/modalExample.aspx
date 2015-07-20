<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="modalExample.aspx.cs" Inherits="Web.App.patterns.examples.modalExample" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="modalCtrl">
        <div>

            <input type="button" class="btn btn-default" ng-click="open()">Open me!</input>
            <input type="button" class="btn btn-default" ng-click="open('lg')">Large modal</input>
            <input type="button" class="btn btn-default" ng-click="open('sm')">Small modal</input>
            <input type="button" class="btn btn-default" ng-click="toggleAnimation()">Toggle Animation ({{ animationsEnabled }})</input>
            <div ng-show="selected">Selection from a modal: {{ selected }}</div>
        </div>
    </div>

</asp:Content>
