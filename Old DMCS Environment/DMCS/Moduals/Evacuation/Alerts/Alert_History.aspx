<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alert_History.aspx.cs" Inherits="DMCS.Moduals.Evacuation.Alerts.Alert_History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
  <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>TITLE NAME</title>
    </head>
    <body>
        <table width="100%" bgcolor="Silver" border="3">
            <tr>
                <td width="20%" height="50px" style="border-style: none" align="right">
                    <asp:Label ID="Label2" runat="server" Text="Select a Disaster: " Font-Bold="True" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlDisaster" runat="server"
                              Height="24px" Width="240px"
                              OnSelectedIndexChanged="ddlDisaster_SelectedIndexChanged"
                              AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True">
                    </asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                </td>
                <td width="80%" style="border-style: none" align="Center">
                    <asp:Label ID="Label1" runat="server" Text="TEXT" Font-Bold="True" Font-Size="20pt"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="100%" height="100%" bgcolor="Silver" border="3">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="alert_ID" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="100%" OnSelectedIndexChanged="Select_Record">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Alert_ID" HeaderText="Alert_ID" InsertVisible="False" ReadOnly="True" SortExpression="Alert_ID" />
                            <asp:BoundField DataField="Alert_Message" HeaderText="Alert_Message" InsertVisible="False" ReadOnly="True" SortExpression="Alert_Message" />
                            <asp:BoundField DataField="Alet_Type" HeaderText="Alet_Type" InsertVisible="False" ReadOnly="True" SortExpression="Alet_Type" />
                            <asp:BoundField DataField="Alert_Desc" HeaderText="Alert_Desc" InsertVisible="False" ReadOnly="True" SortExpression="Alert_Desc" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>
                        <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                        <RowStyle BackColor="White"></RowStyle>
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>
                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Alert_ID], [Alert_Message], [Alet_Type], [Alert_Desc] FROM [Alert_Test]" ProviderName="<%$ ConnectionStrings:localhost.ProviderName %>"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table width="100%" height="auto" bgcolor="Silver" border="3">
            <tr>
                <td>
                    <asp:TextBox ID="Alert_ID_TextBox" runat="server" Text="Alert_ID_TextBox"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="Alert_Message_TextBox" runat="server" Text="Alert_Message_TextBox"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="Alert_Type_TextBox" runat="server" Text="Alet_Type_TextBox"></asp:TextBox>
                </td>
                <td>
                    <asp:RadioButton ID="Alert_Desc_RadioBtn" runat="server" Text="Alert_Desc_RadioBtn" />
                </td>
        </table>
        <table width="100%" height="auto" bgcolor="Silver" border="3">
            <tr>
                <td width="33%">
                    <asp:Button ID="Insert" runat="server" Text="Insert" BackColor="#CC0000" ForeColor="Silver" Width="100%" OnClick="INSERT" CausesValidation="False" style="margin-bottom: 0px" />
                </td>
                <td width="34%">
                    <asp:Button ID="Update" runat="server" Text="Update" BackColor="#CC0000" ForeColor="Silver" Width="100%" OnClick="UPDATE" CausesValidation="False" />
                </td>
                <td>
                    <asp:Button ID="Delete" runat="server" Text="Delete" BackColor="#CC0000" ForeColor="Silver" Width="100%" OnClick="DELETE" CausesValidation="False" style="margin-bottom: 0px" />
                </td width="33%">
            </tr>
        </table>
    </body>
    </html>
</asp:Content>
