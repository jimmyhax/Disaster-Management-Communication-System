<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"CodeBehind="About.aspx.cs" Inherits="Web.App.About" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>About</h2>
    <br/>
    <p>The DMCS Admin Portal uses Single Sign On (SSO).  Single Sign On (SSO) is a term used to indicate when a pool of applications need a centralized authentication, so that users login once and access to any application.</p> 
    <p>Implementing a single sign on is quite simple, and can be done by configuring the applications using the web.config file and this tool will help you to create machine key (for validation and encryption/decryption proposes) and manage members (users) and their roles.</p> 
    <p>The general concept is this: members are created, activated, possibly approved by admin, roles are assigned to members. Members can self register by and activate their account or admin can to do that.</p> 
</asp:Content>
