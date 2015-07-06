<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"CodeBehind="AccessDenied.aspx.cs" Inherits="Web.App.AccessDenied" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div style="margin-top:50px;margin-left:50px;" class="row">
    <h1 style="margin-left:10px">403</h1>
    <div class="col-md-6">
        <p>Forbidden</p>
        <blockquote>
          <p>The server understood the request, but is refusing to fulfill it. You are not authorized to execute it.
          <%if (IsBlocked){%> 
             <div class="alert alert-error">
                  Your account was blocked. Please contact to Administrator.
             </div>
          <%}%>
          <small>Resource administration</small>
          </p>
        </blockquote>
    </div>
</div>

</asp:Content>
