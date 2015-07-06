<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="address.aspx.cs" Inherits="DMCS.address_" %>
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
                                    <td width="100%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Insert_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Insert_address_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="address_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" InsertVisible="False" ReadOnly="True" SortExpression="address_type_id" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                            <asp:BoundField DataField="country" HeaderText="country" InsertVisible="False" ReadOnly="True" SortExpression="country" Visible="false" />
                            <asp:BoundField DataField="County_Township" HeaderText="County_Township" InsertVisible="False" ReadOnly="True" SortExpression="County_Township" Visible="false" />
                            <asp:BoundField DataField="longitude" HeaderText="longitude" InsertVisible="False" ReadOnly="True" SortExpression="longitude" Visible="false" />
                            <asp:BoundField DataField="latitude" HeaderText="latitude" InsertVisible="False" ReadOnly="True" SortExpression="latitude" Visible="false" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="str_add" HeaderText="str_add" InsertVisible="False" ReadOnly="True" SortExpression="str_add" Visible="false" />
                            <asp:BoundField DataField="str_add2" HeaderText="str_add2" InsertVisible="False" ReadOnly="True" SortExpression="str_add2" Visible="false" />
                            <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" InsertVisible="False" ReadOnly="True" SortExpression="zip_plus_four" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [address_id], [address_type_id], [city], [country], [County_Township], [longitude], [latitude], [state], [str_add], [str_add2], [zip_plus_four] FROM [address]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_address_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_address_InfoHead_label" Style="padding: 10px" runat="server" Text="address Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_address_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_type_id_lbl" runat="server" Font-Size="Large" Text="address_type_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_type_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_city_lbl" runat="server" Font-Size="Large" Text="city:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_city_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_country_lbl" runat="server" Font-Size="Large" Text="country:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_country_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_County_Township_lbl" runat="server" Font-Size="Large" Text="County_Township:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_County_Township_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_longitude_lbl" runat="server" Font-Size="Large" Text="longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_latitude_lbl" runat="server" Font-Size="Large" Text="latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_state_lbl" runat="server" Font-Size="Large" Text="state:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_state_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_str_add_lbl" runat="server" Font-Size="Large" Text="str_add:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_str_add_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_str_add2_lbl" runat="server" Font-Size="Large" Text="str_add2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_str_add2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_zip_plus_four_lbl" runat="server" Font-Size="Large" Text="zip_plus_four:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_zip_plus_four_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeaddressInfo" runat="server" CollapseControlID="Insert_address_InfoHead" CollapsedText="Show address Information" Enabled="True" ExpandControlID="Insert_address_InfoHead" ExpandedText="address Information" TargetControlID="Insert_address_InfoBody" TextLabelID="Insert_address_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Update_Tab_Panel" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="100%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Update_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Update_address_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="address_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" InsertVisible="False" ReadOnly="True" SortExpression="address_type_id" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                            <asp:BoundField DataField="country" HeaderText="country" InsertVisible="False" ReadOnly="True" SortExpression="country" Visible="false" />
                            <asp:BoundField DataField="County_Township" HeaderText="County_Township" InsertVisible="False" ReadOnly="True" SortExpression="County_Township" Visible="false" />
                            <asp:BoundField DataField="longitude" HeaderText="longitude" InsertVisible="False" ReadOnly="True" SortExpression="longitude" Visible="false" />
                            <asp:BoundField DataField="latitude" HeaderText="latitude" InsertVisible="False" ReadOnly="True" SortExpression="latitude" Visible="false" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="str_add" HeaderText="str_add" InsertVisible="False" ReadOnly="True" SortExpression="str_add" Visible="false" />
                            <asp:BoundField DataField="str_add2" HeaderText="str_add2" InsertVisible="False" ReadOnly="True" SortExpression="str_add2" Visible="false" />
                            <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" InsertVisible="False" ReadOnly="True" SortExpression="zip_plus_four" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [address_id], [address_type_id], [city], [country], [County_Township], [longitude], [latitude], [state], [str_add], [str_add2], [zip_plus_four] FROM [address]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_address_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_address_InfoHead_label" Style="padding: 10px" runat="server" Text="address Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_address_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_type_id_lbl" runat="server" Font-Size="Large" Text="address_type_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_type_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_city_lbl" runat="server" Font-Size="Large" Text="city:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_city_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_country_lbl" runat="server" Font-Size="Large" Text="country:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_country_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_County_Township_lbl" runat="server" Font-Size="Large" Text="County_Township:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_County_Township_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_longitude_lbl" runat="server" Font-Size="Large" Text="longitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_longitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_latitude_lbl" runat="server" Font-Size="Large" Text="latitude:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_latitude_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                                                     <asp:Label ID="Update_str_add_lbl" runat="server" Font-Size="Large" Text="str_add:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_str_add_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_str_add2_lbl" runat="server" Font-Size="Large" Text="str_add2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_str_add2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_zip_plus_four_lbl" runat="server" Font-Size="Large" Text="zip_plus_four:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_zip_plus_four_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeaddressInfo" runat="server" CollapseControlID="Update_address_InfoHead" CollapsedText="Show address Information" Enabled="True" ExpandControlID="Update_address_InfoHead" ExpandedText="address Information" TargetControlID="Update_address_InfoBody" TextLabelID="Update_address_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Delete_Tab_Panel" runat="server" HeaderText="Delete" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="100%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Delete_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Delete_address_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="address_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" InsertVisible="False" ReadOnly="True" SortExpression="address_type_id" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                            <asp:BoundField DataField="country" HeaderText="country" InsertVisible="False" ReadOnly="True" SortExpression="country" Visible="false" />
                            <asp:BoundField DataField="County_Township" HeaderText="County_Township" InsertVisible="False" ReadOnly="True" SortExpression="County_Township" Visible="false" />
                            <asp:BoundField DataField="longitude" HeaderText="longitude" InsertVisible="False" ReadOnly="True" SortExpression="longitude" Visible="false" />
                            <asp:BoundField DataField="latitude" HeaderText="latitude" InsertVisible="False" ReadOnly="True" SortExpression="latitude" Visible="false" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="str_add" HeaderText="str_add" InsertVisible="False" ReadOnly="True" SortExpression="str_add" Visible="false" />
                            <asp:BoundField DataField="str_add2" HeaderText="str_add2" InsertVisible="False" ReadOnly="True" SortExpression="str_add2" Visible="false" />
                            <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" InsertVisible="False" ReadOnly="True" SortExpression="zip_plus_four" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [address_id], [address_type_id], [city], [country], [County_Township], [longitude], [latitude], [state], [str_add], [str_add2], [zip_plus_four] FROM [address]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_address_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_address_InfoHead_label" Style="padding: 10px" runat="server" Text="address Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_address_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_type_id_lbl" runat="server" Font-Size="Large" Text="address_type_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_type_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_city_lbl" runat="server" Font-Size="Large" Text="city:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_city_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_country_lbl" runat="server" Font-Size="Large" Text="country:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_country_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_County_Township_lbl" runat="server" Font-Size="Large" Text="County_Township:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_County_Township_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_longitude_lbl" runat="server" Font-Size="Large" Text="longitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_longitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_latitude_lbl" runat="server" Font-Size="Large" Text="latitude:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_latitude_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                                                     <asp:Label ID="Delete_str_add_lbl" runat="server" Font-Size="Large" Text="str_add:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_str_add_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_str_add2_lbl" runat="server" Font-Size="Large" Text="str_add2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_str_add2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_zip_plus_four_lbl" runat="server" Font-Size="Large" Text="zip_plus_four:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_zip_plus_four_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeaddressInfo" runat="server" CollapseControlID="Delete_address_InfoHead" CollapsedText="Show address Information" Enabled="True" ExpandControlID="Delete_address_InfoHead" ExpandedText="address Information" TargetControlID="Delete_address_InfoBody" TextLabelID="Delete_address_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

