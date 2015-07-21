<%@ Page Language="C#" ValidateRequest="False" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScriptGenerator_V2.aspx.cs" Inherits="Web.App.ScriptGenerator_V2" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="sg-container">
        <asp:DropDownList 
            runat="server" 
            ID="Table_Name_DDL" 
            AutoPostBack="True" 
            DataSourceID="tableDataSource" 
            DataTextField="TABLE_NAME" 
            DataValueField="TABLE_NAME" 
            OnSelectedIndexChanged="DDL_SelectedIndexChanged">
            <asp:ListItem Selected="True" Enabled="true">Select Table</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="tableDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME != 'sysdiagrams'"></asp:SqlDataSource>
    </div>
</asp:Content>
