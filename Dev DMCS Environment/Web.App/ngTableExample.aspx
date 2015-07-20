<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ngTableExample.aspx.cs" Inherits="Web.App.ngTableExample" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div ng-controller="gridCtrl">

    <p><strong>Page:</strong> {{tableParams.page()}}

    <p><strong>Count per page:</strong> {{tableParams.count()}}

    <table ng-table="tableParams" class="table">
        <tr ng-repeat="user in $data">
            <td data-title="'Name'">
                {{user.name}}
            </td>
            <td data-title="'Age'">
                {{user.age}}
            </td>
        </tr>
    </table>
</div>
</asp:Content>
