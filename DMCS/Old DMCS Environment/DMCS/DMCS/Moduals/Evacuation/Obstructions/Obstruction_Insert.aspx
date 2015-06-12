<%@ Page MaintainScrollPositionOnPostback="True" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="DMCS.Moduals.Evacuation.Obstructions.Obstruction_Insert" Title="Generated_Select" Codebehind="Obstruction_Insert.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">    <!DOCTYPE html>
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
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="Obstruction_ID" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="100%" OnSelectedIndexChanged="Select_Record">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Obstruction_ID" HeaderText="Obstruction_ID" InsertVisible="False" ReadOnly="True" SortExpression="Obstruction_ID" />
                            <asp:BoundField DataField="Evacuation_Area_ID" HeaderText="Evacuation_Area_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Area_ID" />
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                            <asp:BoundField DataField="Date_Reported" HeaderText="Date_Reported" InsertVisible="False" ReadOnly="True" SortExpression="Date_Reported" />
                            <asp:BoundField DataField="Expected_Recovery_Date" HeaderText="Expected_Recovery_Date" InsertVisible="False" ReadOnly="True" SortExpression="Expected_Recovery_Date" />
                            <asp:BoundField DataField="Type" HeaderText="Type" InsertVisible="False" ReadOnly="True" SortExpression="Type" />
                            <asp:BoundField DataField="Severity" HeaderText="Severity" InsertVisible="False" ReadOnly="True" SortExpression="Severity" />
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
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Obstruction_ID], [Evacuation_Area_ID], [Location_ID], [Date_Reported], [Expected_Recovery_Date], [Type], [Severity] FROM [Obstruction]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table width="100%" height="auto" bgcolor="Silver" border="3">
                <td>
            <asp:Label ID="Obstruction_ID_Lable" runat="server" Text="Obstruction_ID:"></asp:Label><br /><asp:TextBox ID="Obstruction_ID_TextBox" runat="server" Text="Obstruction_ID_TextBox"></asp:TextBox><br />
</td>
                <td>
            <asp:Label ID="Evacuation_Area_ID_Lable" runat="server" Text="Evacuation_Area_ID:"></asp:Label><br /><asp:TextBox ID="Evacuation_Area_ID_TextBox" runat="server" Text="Evacuation_Area_ID_TextBox"></asp:TextBox><br />
</td>
                <td>
            <asp:Label ID="Location_ID_Lable" runat="server" Text="Location_ID:"></asp:Label><br /><asp:TextBox ID="Location_ID_TextBox" runat="server" Text="Location_ID_TextBox"></asp:TextBox><br />
</td>
                <td>
            <asp:Label ID="Date_Reported_Lable" runat="server" Text="Date_Reported:"></asp:Label><br /><asp:TextBox ID="Date_Reported_TextBox" runat="server" Text="Date_Reported_TextBox"></asp:TextBox><br />
</td>
                <td>
            <asp:Label ID="Expected_Recovery_Date_Lable" runat="server" Text="Expected_Recovery_Date:"></asp:Label><br /><asp:TextBox ID="Expected_Recovery_Date_TextBox" runat="server" Text="Expected_Recovery_Date_TextBox"></asp:TextBox><br />
</td>
            <tr>
                <td>
            <asp:Label ID="Type_Lable" runat="server" Text="Type:"></asp:Label><br /><asp:TextBox ID="Type_TextBox" runat="server" Text="Type_TextBox"></asp:TextBox><br />
                </td>
            </tr>
                <td>
            <asp:Label ID="Severity_Lable" runat="server" Text="Severity:"></asp:Label><br /><asp:TextBox ID="Severity_TextBox" runat="server" Text="Severity_TextBox"></asp:TextBox><br />
</td>
        </table>
        <table width="100%" height="auto" bgcolor="Silver" border="3">
            <tr>
                <td width="33%">
                </td>
                <td width="34%">
                    <asp:Button ID="Insert" runat="server" Text="Insert" BackColor="#CC0000" ForeColor="Silver" Width="100%" OnClick="INSERT" CausesValidation="False" />
                </td>
                <td width="34%">
                </td>
            </tr>
        </table>
    </body>
    </html>
</asp:Content>

