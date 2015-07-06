<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="location_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.location_Screen" %>
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
                                        <asp:GridView ID="Insert_location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Location_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                            <asp:BoundField DataField="type" HeaderText="type" InsertVisible="False" ReadOnly="True" SortExpression="type" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="zip" HeaderText="zip" InsertVisible="False" ReadOnly="True" SortExpression="zip" Visible="false" />
                            <asp:BoundField DataField="county" HeaderText="county" InsertVisible="False" ReadOnly="True" SortExpression="county" Visible="false" />
                            <asp:BoundField DataField="location_desc" HeaderText="location_desc" InsertVisible="False" ReadOnly="True" SortExpression="location_desc" Visible="false" />
                            <asp:BoundField DataField="n_long" HeaderText="n_long" InsertVisible="False" ReadOnly="True" SortExpression="n_long" Visible="false" />
                            <asp:BoundField DataField="s_long" HeaderText="s_long" InsertVisible="False" ReadOnly="True" SortExpression="s_long" Visible="false" />
                            <asp:BoundField DataField="e_long" HeaderText="e_long" InsertVisible="False" ReadOnly="True" SortExpression="e_long" Visible="false" />
                            <asp:BoundField DataField="w_long" HeaderText="w_long" InsertVisible="False" ReadOnly="True" SortExpression="w_long" Visible="false" />
                            <asp:BoundField DataField="n_lat" HeaderText="n_lat" InsertVisible="False" ReadOnly="True" SortExpression="n_lat" Visible="false" />
                            <asp:BoundField DataField="s_lat" HeaderText="s_lat" InsertVisible="False" ReadOnly="True" SortExpression="s_lat" Visible="false" />
                            <asp:BoundField DataField="e_lat" HeaderText="e_lat" InsertVisible="False" ReadOnly="True" SortExpression="e_lat" Visible="false" />
                            <asp:BoundField DataField="w_lat" HeaderText="w_lat" InsertVisible="False" ReadOnly="True" SortExpression="w_lat" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Location_ID], [type], [city], [state], [zip], [county], [location_desc], [n_long], [s_long], [e_long], [w_long], [n_lat], [s_lat], [e_lat], [w_lat] FROM [location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_location_InfoHead_label" Style="padding: 10px" runat="server" Text="location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_type_lbl" runat="server" Font-Size="Large" Text="type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_city_lbl" runat="server" Font-Size="Large" Text="city:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_city_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_state_lbl" runat="server" Font-Size="Large" Text="state:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_state_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_zip_lbl" runat="server" Font-Size="Large" Text="zip:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_zip_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_county_lbl" runat="server" Font-Size="Large" Text="county:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_county_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_location_desc_lbl" runat="server" Font-Size="Large" Text="location_desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_location_desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_n_long_lbl" runat="server" Font-Size="Large" Text="n_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_n_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_s_long_lbl" runat="server" Font-Size="Large" Text="s_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_s_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_e_long_lbl" runat="server" Font-Size="Large" Text="e_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_e_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_w_long_lbl" runat="server" Font-Size="Large" Text="w_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_w_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_n_lat_lbl" runat="server" Font-Size="Large" Text="n_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_n_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_s_lat_lbl" runat="server" Font-Size="Large" Text="s_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_s_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_e_lat_lbl" runat="server" Font-Size="Large" Text="e_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_e_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_w_lat_lbl" runat="server" Font-Size="Large" Text="w_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_w_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpelocationInfo" runat="server" CollapseControlID="Insert_location_InfoHead" CollapsedText="Show location Information" Enabled="True" ExpandControlID="Insert_location_InfoHead" ExpandedText="location Information" TargetControlID="Insert_location_InfoBody" TextLabelID="Insert_location_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Location_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                            <asp:BoundField DataField="type" HeaderText="type" InsertVisible="False" ReadOnly="True" SortExpression="type" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="zip" HeaderText="zip" InsertVisible="False" ReadOnly="True" SortExpression="zip" Visible="false" />
                            <asp:BoundField DataField="county" HeaderText="county" InsertVisible="False" ReadOnly="True" SortExpression="county" Visible="false" />
                            <asp:BoundField DataField="location_desc" HeaderText="location_desc" InsertVisible="False" ReadOnly="True" SortExpression="location_desc" Visible="false" />
                            <asp:BoundField DataField="n_long" HeaderText="n_long" InsertVisible="False" ReadOnly="True" SortExpression="n_long" Visible="false" />
                            <asp:BoundField DataField="s_long" HeaderText="s_long" InsertVisible="False" ReadOnly="True" SortExpression="s_long" Visible="false" />
                            <asp:BoundField DataField="e_long" HeaderText="e_long" InsertVisible="False" ReadOnly="True" SortExpression="e_long" Visible="false" />
                            <asp:BoundField DataField="w_long" HeaderText="w_long" InsertVisible="False" ReadOnly="True" SortExpression="w_long" Visible="false" />
                            <asp:BoundField DataField="n_lat" HeaderText="n_lat" InsertVisible="False" ReadOnly="True" SortExpression="n_lat" Visible="false" />
                            <asp:BoundField DataField="s_lat" HeaderText="s_lat" InsertVisible="False" ReadOnly="True" SortExpression="s_lat" Visible="false" />
                            <asp:BoundField DataField="e_lat" HeaderText="e_lat" InsertVisible="False" ReadOnly="True" SortExpression="e_lat" Visible="false" />
                            <asp:BoundField DataField="w_lat" HeaderText="w_lat" InsertVisible="False" ReadOnly="True" SortExpression="w_lat" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Location_ID], [type], [city], [state], [zip], [county], [location_desc], [n_long], [s_long], [e_long], [w_long], [n_lat], [s_lat], [e_lat], [w_lat] FROM [location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_location_InfoHead_label" Style="padding: 10px" runat="server" Text="location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Location_ID_lbl" runat="server" Font-Size="Large" Text="Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Location_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_type_lbl" runat="server" Font-Size="Large" Text="type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_city_lbl" runat="server" Font-Size="Large" Text="city:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_city_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_state_lbl" runat="server" Font-Size="Large" Text="state:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_state_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_zip_lbl" runat="server" Font-Size="Large" Text="zip:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_zip_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_county_lbl" runat="server" Font-Size="Large" Text="county:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_county_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_location_desc_lbl" runat="server" Font-Size="Large" Text="location_desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_location_desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_n_long_lbl" runat="server" Font-Size="Large" Text="n_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_n_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_s_long_lbl" runat="server" Font-Size="Large" Text="s_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_s_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_e_long_lbl" runat="server" Font-Size="Large" Text="e_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_e_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_w_long_lbl" runat="server" Font-Size="Large" Text="w_long:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_w_long_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_n_lat_lbl" runat="server" Font-Size="Large" Text="n_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_n_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_s_lat_lbl" runat="server" Font-Size="Large" Text="s_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_s_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_e_lat_lbl" runat="server" Font-Size="Large" Text="e_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_e_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_w_lat_lbl" runat="server" Font-Size="Large" Text="w_lat:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_w_lat_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpelocationInfo" runat="server" CollapseControlID="Update_location_InfoHead" CollapsedText="Show location Information" Enabled="True" ExpandControlID="Update_location_InfoHead" ExpandedText="location Information" TargetControlID="Update_location_InfoBody" TextLabelID="Update_location_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Location_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                            <asp:BoundField DataField="type" HeaderText="type" InsertVisible="False" ReadOnly="True" SortExpression="type" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="zip" HeaderText="zip" InsertVisible="False" ReadOnly="True" SortExpression="zip" Visible="false" />
                            <asp:BoundField DataField="county" HeaderText="county" InsertVisible="False" ReadOnly="True" SortExpression="county" Visible="false" />
                            <asp:BoundField DataField="location_desc" HeaderText="location_desc" InsertVisible="False" ReadOnly="True" SortExpression="location_desc" Visible="false" />
                            <asp:BoundField DataField="n_long" HeaderText="n_long" InsertVisible="False" ReadOnly="True" SortExpression="n_long" Visible="false" />
                            <asp:BoundField DataField="s_long" HeaderText="s_long" InsertVisible="False" ReadOnly="True" SortExpression="s_long" Visible="false" />
                            <asp:BoundField DataField="e_long" HeaderText="e_long" InsertVisible="False" ReadOnly="True" SortExpression="e_long" Visible="false" />
                            <asp:BoundField DataField="w_long" HeaderText="w_long" InsertVisible="False" ReadOnly="True" SortExpression="w_long" Visible="false" />
                            <asp:BoundField DataField="n_lat" HeaderText="n_lat" InsertVisible="False" ReadOnly="True" SortExpression="n_lat" Visible="false" />
                            <asp:BoundField DataField="s_lat" HeaderText="s_lat" InsertVisible="False" ReadOnly="True" SortExpression="s_lat" Visible="false" />
                            <asp:BoundField DataField="e_lat" HeaderText="e_lat" InsertVisible="False" ReadOnly="True" SortExpression="e_lat" Visible="false" />
                            <asp:BoundField DataField="w_lat" HeaderText="w_lat" InsertVisible="False" ReadOnly="True" SortExpression="w_lat" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Location_ID], [type], [city], [state], [zip], [county], [location_desc], [n_long], [s_long], [e_long], [w_long], [n_lat], [s_lat], [e_lat], [w_lat] FROM [location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_location_InfoHead_label" Style="padding: 10px" runat="server" Text="location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Location_ID_lbl" runat="server" Font-Size="Large" Text="Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Location_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_type_lbl" runat="server" Font-Size="Large" Text="type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_city_lbl" runat="server" Font-Size="Large" Text="city:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_city_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_state_lbl" runat="server" Font-Size="Large" Text="state:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_state_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_zip_lbl" runat="server" Font-Size="Large" Text="zip:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_zip_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_county_lbl" runat="server" Font-Size="Large" Text="county:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_county_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_location_desc_lbl" runat="server" Font-Size="Large" Text="location_desc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_location_desc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_n_long_lbl" runat="server" Font-Size="Large" Text="n_long:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_n_long_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_s_long_lbl" runat="server" Font-Size="Large" Text="s_long:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_s_long_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_e_long_lbl" runat="server" Font-Size="Large" Text="e_long:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_e_long_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_w_long_lbl" runat="server" Font-Size="Large" Text="w_long:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_w_long_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_n_lat_lbl" runat="server" Font-Size="Large" Text="n_lat:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_n_lat_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_s_lat_lbl" runat="server" Font-Size="Large" Text="s_lat:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_s_lat_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_e_lat_lbl" runat="server" Font-Size="Large" Text="e_lat:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_e_lat_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_w_lat_lbl" runat="server" Font-Size="Large" Text="w_lat:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_w_lat_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpelocationInfo" runat="server" CollapseControlID="Delete_location_InfoHead" CollapsedText="Show location Information" Enabled="True" ExpandControlID="Delete_location_InfoHead" ExpandedText="location Information" TargetControlID="Delete_location_InfoBody" TextLabelID="Delete_location_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

