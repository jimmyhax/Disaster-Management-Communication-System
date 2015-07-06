<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" ValidateRequest="False" CodeBehind="test1.aspx.cs" Inherits="DMCS.SandBox.test1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table width="100%">
        <tr>
            <td width="50%">
                <asp:TextBox ID="recieverTextbox" runat="server" Width="100%" TextMode="MultiLine" Height="150px"></asp:TextBox>

            </td>
            <td width="50%">
                 <asp:TextBox ID="generatorTextbox" runat="server" Width="100%" TextMode="MultiLine" Height="150px"></asp:TextBox> 
            </td>
        </tr>
        <tr>
            <td colspan="2" width="100%">
                <asp:Button ID="Button1" width="100%" runat="server" Text="Generate" OnClick="Button1_Click1" />
            </td>
        </tr>
    </table>
</asp:Content>
