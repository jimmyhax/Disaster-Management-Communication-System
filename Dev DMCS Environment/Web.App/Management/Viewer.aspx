<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Viewer.aspx.cs" Inherits="Web.App.Management.Viewer" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2>Viewer</h2>
    <br />
    <p>
        Login: <% =CurrentUserName%><br />
        Role: Viewer<br />
    </p>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/images/viewer permissions.png" />
</asp:Content>
