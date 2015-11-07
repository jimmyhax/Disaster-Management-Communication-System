<%@ Page Title="Resource Dashboard" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Resource_Allocation_Dashboard.aspx.cs" Inherits="Web.App.Modules.Resource_Allocation.Resource_Allocation_Dashboard" EnableEventValidation="True" ValidateRequest="True" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="DashboardTemplateCtrl">
        <div class="body-header">
            <h3><span>DMCS</span></h3>
            <%if (HttpContext.Current.User.Identity.IsAuthenticated){ %>
            <h4><span>Welcome, <% =CurrentMemberName %></span></h4>
             <%}else{%> 
            <h4><span>Welcome, please Sign in</span></h4>             
            <%}%> 
        </div>
        <div class="body-contents col-lg-12">
            
            <div class="col-lg-3">
                <a href="<asp:Literal runat="server" Text="<%$RouteUrl:RouteName=Resource_Allocation%>" />">
                    <div class="dashboard-item">
                        <span class="glyphicon glyphicon-user"></span>
                        Resource Search
                    </div>
                </a>
            </div>
            <%--<div class="col-lg-3">
                <a href="<asp:Literal runat="server" Text="<%$RouteUrl:RouteName=Clients%>" />">
                    <div class="dashboard-item">
                    
                    </div>
                </a>
            </div>
            <div class="col-lg-3">
                <a href="<asp:Literal runat="server" Text="<%$RouteUrl:RouteName=Clients%>" />">
                    <div class="dashboard-item">

                    </div>
                </a>
            </div>
            <div class="col-lg-3">
                <a href="<asp:Literal runat="server" Text="<%$RouteUrl:RouteName=Clients%>" />">
                    <div class="dashboard-item">
                
                    </div>
                </a>
            </div>--%>
        </div>
    </div>


</asp:Content>