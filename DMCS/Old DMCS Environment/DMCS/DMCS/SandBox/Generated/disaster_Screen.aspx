<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="disaster_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.disaster_Screen" %>
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
        <div style="width: 100%; height: 100%; font-family: 'Calibri Light';">
        <asp:TabContainer ID="MyAjaxTabContainer" runat="server" UseVerticalStripPlacement="false" ActiveTabIndex="2" Visible="True" BackColor="#e75050" ForeColor="#333333" BorderColor="#E75050" BorderStyle="Double" BorderWidth="10px">
                <asp:TabPanel ID="Insert_Tab_Panel" runat="server" HeaderText="Insert" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Insert_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Insert_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Insert_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Insert_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Insert_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Insert_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Insert_disaster_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="disaster_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                            <asp:BoundField DataField="disaster_name" HeaderText="disaster_name" InsertVisible="False" ReadOnly="True" SortExpression="disaster_name" />
                            <asp:BoundField DataField="disaster_type" HeaderText="disaster_type" InsertVisible="False" ReadOnly="True" SortExpression="disaster_type" />
                            <asp:BoundField DataField="disaster_start_date" HeaderText="disaster_start_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_start_date" Visible="false" />
                            <asp:BoundField DataField="disaster_end_date" HeaderText="disaster_end_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_end_date" Visible="false" />
                            <asp:BoundField DataField="disaster_north_latitude" HeaderText="disaster_north_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_north_longitude" HeaderText="disaster_north_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_south_latitude" HeaderText="disaster_south_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_south_longitude" HeaderText="disaster_south_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_east_latitude" HeaderText="disaster_east_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_east_longitude" HeaderText="disaster_east_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_west_latitude" HeaderText="disaster_west_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_west_longitude" HeaderText="disaster_west_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_longitude" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [disaster_id], [disaster_name], [disaster_type], [disaster_start_date], [disaster_end_date], [disaster_north_latitude], [disaster_north_longitude], [disaster_south_latitude], [disaster_south_longitude], [disaster_east_latitude], [disaster_east_longitude], [disaster_west_latitude], [disaster_west_longitude] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_disaster_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_disaster_InfoHead_label" Style="padding: 10px" runat="server" Text="disaster Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_disaster_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_name_lbl" runat="server" Font-Size="Large" Text="disaster_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_type_lbl" runat="server" Font-Size="Large" Text="disaster_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_start_date_lbl" runat="server" Font-Size="Large" Text="disaster_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_end_date_lbl" runat="server" Font-Size="Large" Text="disaster_end_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_end_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_north_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_north_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_north_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_north_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_north_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_north_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_south_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_south_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_south_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_south_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_south_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_south_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_east_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_east_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_east_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_east_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_east_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_east_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_west_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_west_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_west_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_west_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_west_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_west_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Insert_btn" runat="server" Font-Size="Large" Text="Insert" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="INSERT" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Insert_cpedisasterInfo" runat="server" CollapseControlID="Insert_disaster_InfoHead" CollapsedText="Show disaster Information" Enabled="True" ExpandControlID="Insert_disaster_InfoHead" ExpandedText="disaster Information" TargetControlID="Insert_disaster_InfoBody" TextLabelID="Insert_disaster_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Update_Tab_Panel" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Update_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Update_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Update_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Update_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Update_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Update_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Update_disaster_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="disaster_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                            <asp:BoundField DataField="disaster_name" HeaderText="disaster_name" InsertVisible="False" ReadOnly="True" SortExpression="disaster_name" />
                            <asp:BoundField DataField="disaster_type" HeaderText="disaster_type" InsertVisible="False" ReadOnly="True" SortExpression="disaster_type" />
                            <asp:BoundField DataField="disaster_start_date" HeaderText="disaster_start_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_start_date" Visible="false" />
                            <asp:BoundField DataField="disaster_end_date" HeaderText="disaster_end_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_end_date" Visible="false" />
                            <asp:BoundField DataField="disaster_north_latitude" HeaderText="disaster_north_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_north_longitude" HeaderText="disaster_north_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_south_latitude" HeaderText="disaster_south_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_south_longitude" HeaderText="disaster_south_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_east_latitude" HeaderText="disaster_east_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_east_longitude" HeaderText="disaster_east_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_west_latitude" HeaderText="disaster_west_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_west_longitude" HeaderText="disaster_west_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_longitude" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [disaster_id], [disaster_name], [disaster_type], [disaster_start_date], [disaster_end_date], [disaster_north_latitude], [disaster_north_longitude], [disaster_south_latitude], [disaster_south_longitude], [disaster_east_latitude], [disaster_east_longitude], [disaster_west_latitude], [disaster_west_longitude] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_disaster_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_disaster_InfoHead_label" Style="padding: 10px" runat="server" Text="disaster Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_disaster_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_id_lbl" runat="server" Font-Size="Large" Text="disaster_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_name_lbl" runat="server" Font-Size="Large" Text="disaster_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_type_lbl" runat="server" Font-Size="Large" Text="disaster_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_start_date_lbl" runat="server" Font-Size="Large" Text="disaster_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_end_date_lbl" runat="server" Font-Size="Large" Text="disaster_end_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_end_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_north_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_north_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_north_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_north_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_north_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_north_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_south_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_south_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_south_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_south_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_south_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_south_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_east_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_east_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_east_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_east_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_east_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_east_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_west_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_west_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_west_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_west_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_west_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_west_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Update_btn" runat="server" Font-Size="Large" Text="Update" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="UPDATE" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Update_cpedisasterInfo" runat="server" CollapseControlID="Update_disaster_InfoHead" CollapsedText="Show disaster Information" Enabled="True" ExpandControlID="Update_disaster_InfoHead" ExpandedText="disaster Information" TargetControlID="Update_disaster_InfoBody" TextLabelID="Update_disaster_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Delete_Tab_Panel" runat="server" HeaderText="Delete" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Delete_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Delete_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Delete_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Delete_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Delete_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Delete_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Delete_disaster_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="disaster_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                            <asp:BoundField DataField="disaster_name" HeaderText="disaster_name" InsertVisible="False" ReadOnly="True" SortExpression="disaster_name" />
                            <asp:BoundField DataField="disaster_type" HeaderText="disaster_type" InsertVisible="False" ReadOnly="True" SortExpression="disaster_type" />
                            <asp:BoundField DataField="disaster_start_date" HeaderText="disaster_start_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_start_date" Visible="false" />
                            <asp:BoundField DataField="disaster_end_date" HeaderText="disaster_end_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_end_date" Visible="false" />
                            <asp:BoundField DataField="disaster_north_latitude" HeaderText="disaster_north_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_north_longitude" HeaderText="disaster_north_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_south_latitude" HeaderText="disaster_south_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_south_longitude" HeaderText="disaster_south_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_east_latitude" HeaderText="disaster_east_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_east_longitude" HeaderText="disaster_east_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_longitude" Visible="false" />
                            <asp:BoundField DataField="disaster_west_latitude" HeaderText="disaster_west_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_latitude" Visible="false" />
                            <asp:BoundField DataField="disaster_west_longitude" HeaderText="disaster_west_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_longitude" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [disaster_id], [disaster_name], [disaster_type], [disaster_start_date], [disaster_end_date], [disaster_north_latitude], [disaster_north_longitude], [disaster_south_latitude], [disaster_south_longitude], [disaster_east_latitude], [disaster_east_longitude], [disaster_west_latitude], [disaster_west_longitude] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_disaster_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_disaster_InfoHead_label" Style="padding: 10px" runat="server" Text="disaster Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_disaster_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_id_lbl" runat="server" Font-Size="Large" Text="disaster_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_name_lbl" runat="server" Font-Size="Large" Text="disaster_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_type_lbl" runat="server" Font-Size="Large" Text="disaster_type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_start_date_lbl" runat="server" Font-Size="Large" Text="disaster_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_start_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_end_date_lbl" runat="server" Font-Size="Large" Text="disaster_end_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_end_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_north_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_north_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_north_latitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_north_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_north_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_north_longitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_south_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_south_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_south_latitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_south_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_south_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_south_longitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_east_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_east_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_east_latitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_east_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_east_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_east_longitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_west_latitude_lbl" runat="server" Font-Size="Large" Text="disaster_west_latitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_west_latitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_west_longitude_lbl" runat="server" Font-Size="Large" Text="disaster_west_longitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_west_longitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Delete_btn" runat="server" Font-Size="Large" Text="Delete" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="DELETE" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Delete_cpedisasterInfo" runat="server" CollapseControlID="Delete_disaster_InfoHead" CollapsedText="Show disaster Information" Enabled="True" ExpandControlID="Delete_disaster_InfoHead" ExpandedText="disaster Information" TargetControlID="Delete_disaster_InfoBody" TextLabelID="Delete_disaster_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

