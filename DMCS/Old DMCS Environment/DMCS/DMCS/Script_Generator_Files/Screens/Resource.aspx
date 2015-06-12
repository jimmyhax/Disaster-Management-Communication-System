<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="Resource.aspx.cs" Inherits="DMCS.Resource_" %>
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
                                        <asp:GridView ID="Insert_Resource_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Resource_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="Resource_Type_ID" HeaderText="Resource_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_Type_ID" />
                            <asp:BoundField DataField="Description" HeaderText="Description" InsertVisible="False" ReadOnly="True" SortExpression="Description" />
                            <asp:BoundField DataField="Address" HeaderText="Address" InsertVisible="False" ReadOnly="True" SortExpression="Address" Visible="false" />
                            <asp:BoundField DataField="City" HeaderText="City" InsertVisible="False" ReadOnly="True" SortExpression="City" Visible="false" />
                            <asp:BoundField DataField="State" HeaderText="State" InsertVisible="False" ReadOnly="True" SortExpression="State" Visible="false" />
                            <asp:BoundField DataField="Zip Code" HeaderText="Zip Code" InsertVisible="False" ReadOnly="True" SortExpression="Zip Code" Visible="false" />
                            <asp:BoundField DataField="PayType" HeaderText="PayType" InsertVisible="False" ReadOnly="True" SortExpression="PayType" Visible="false" />
                            <asp:BoundField DataField="PayRate" HeaderText="PayRate" InsertVisible="False" ReadOnly="True" SortExpression="PayRate" Visible="false" />
                            <asp:BoundField DataField="AvailabilityDate" HeaderText="AvailabilityDate" InsertVisible="False" ReadOnly="True" SortExpression="AvailabilityDate" Visible="false" />
                            <asp:BoundField DataField="AvailabilityHours" HeaderText="AvailabilityHours" InsertVisible="False" ReadOnly="True" SortExpression="AvailabilityHours" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Resource_ID], [Resource_Type_ID], [Description], [Address], [City], [State], [Zip Code], [PayType], [PayRate], [AvailabilityDate], [AvailabilityHours] FROM [Resource]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Resource_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Resource_InfoHead_label" Style="padding: 10px" runat="server" Text="Resource Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Resource_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Resource_Type_ID_lbl" runat="server" Font-Size="Large" Text="Resource_Type_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Resource_Type_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Description_lbl" runat="server" Font-Size="Large" Text="Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Address_lbl" runat="server" Font-Size="Large" Text="Address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_City_lbl" runat="server" Font-Size="Large" Text="City:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_City_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_State_lbl" runat="server" Font-Size="Large" Text="State:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_State_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Zip Code_lbl" runat="server" Font-Size="Large" Text="Zip Code:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Zip Code_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_PayType_lbl" runat="server" Font-Size="Large" Text="PayType:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_PayType_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_PayRate_lbl" runat="server" Font-Size="Large" Text="PayRate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_PayRate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_AvailabilityDate_lbl" runat="server" Font-Size="Large" Text="AvailabilityDate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_AvailabilityDate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_AvailabilityHours_lbl" runat="server" Font-Size="Large" Text="AvailabilityHours:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_AvailabilityHours_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeResourceInfo" runat="server" CollapseControlID="Insert_Resource_InfoHead" CollapsedText="Show Resource Information" Enabled="True" ExpandControlID="Insert_Resource_InfoHead" ExpandedText="Resource Information" TargetControlID="Insert_Resource_InfoBody" TextLabelID="Insert_Resource_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_Resource_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Resource_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="Resource_Type_ID" HeaderText="Resource_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_Type_ID" />
                            <asp:BoundField DataField="Description" HeaderText="Description" InsertVisible="False" ReadOnly="True" SortExpression="Description" />
                            <asp:BoundField DataField="Address" HeaderText="Address" InsertVisible="False" ReadOnly="True" SortExpression="Address" Visible="false" />
                            <asp:BoundField DataField="City" HeaderText="City" InsertVisible="False" ReadOnly="True" SortExpression="City" Visible="false" />
                            <asp:BoundField DataField="State" HeaderText="State" InsertVisible="False" ReadOnly="True" SortExpression="State" Visible="false" />
                            <asp:BoundField DataField="Zip Code" HeaderText="Zip Code" InsertVisible="False" ReadOnly="True" SortExpression="Zip Code" Visible="false" />
                            <asp:BoundField DataField="PayType" HeaderText="PayType" InsertVisible="False" ReadOnly="True" SortExpression="PayType" Visible="false" />
                            <asp:BoundField DataField="PayRate" HeaderText="PayRate" InsertVisible="False" ReadOnly="True" SortExpression="PayRate" Visible="false" />
                            <asp:BoundField DataField="AvailabilityDate" HeaderText="AvailabilityDate" InsertVisible="False" ReadOnly="True" SortExpression="AvailabilityDate" Visible="false" />
                            <asp:BoundField DataField="AvailabilityHours" HeaderText="AvailabilityHours" InsertVisible="False" ReadOnly="True" SortExpression="AvailabilityHours" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Resource_ID], [Resource_Type_ID], [Description], [Address], [City], [State], [Zip Code], [PayType], [PayRate], [AvailabilityDate], [AvailabilityHours] FROM [Resource]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Resource_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Resource_InfoHead_label" Style="padding: 10px" runat="server" Text="Resource Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Resource_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Resource_Type_ID_lbl" runat="server" Font-Size="Large" Text="Resource_Type_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Resource_Type_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Description_lbl" runat="server" Font-Size="Large" Text="Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Address_lbl" runat="server" Font-Size="Large" Text="Address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_City_lbl" runat="server" Font-Size="Large" Text="City:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_City_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_State_lbl" runat="server" Font-Size="Large" Text="State:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_State_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Zip Code_lbl" runat="server" Font-Size="Large" Text="Zip Code:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Zip Code_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_PayType_lbl" runat="server" Font-Size="Large" Text="PayType:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_PayType_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_PayRate_lbl" runat="server" Font-Size="Large" Text="PayRate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_PayRate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_AvailabilityDate_lbl" runat="server" Font-Size="Large" Text="AvailabilityDate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_AvailabilityDate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_AvailabilityHours_lbl" runat="server" Font-Size="Large" Text="AvailabilityHours:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_AvailabilityHours_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeResourceInfo" runat="server" CollapseControlID="Update_Resource_InfoHead" CollapsedText="Show Resource Information" Enabled="True" ExpandControlID="Update_Resource_InfoHead" ExpandedText="Resource Information" TargetControlID="Update_Resource_InfoBody" TextLabelID="Update_Resource_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_Resource_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Resource_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="Resource_Type_ID" HeaderText="Resource_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_Type_ID" />
                            <asp:BoundField DataField="Description" HeaderText="Description" InsertVisible="False" ReadOnly="True" SortExpression="Description" />
                            <asp:BoundField DataField="Address" HeaderText="Address" InsertVisible="False" ReadOnly="True" SortExpression="Address" Visible="false" />
                            <asp:BoundField DataField="City" HeaderText="City" InsertVisible="False" ReadOnly="True" SortExpression="City" Visible="false" />
                            <asp:BoundField DataField="State" HeaderText="State" InsertVisible="False" ReadOnly="True" SortExpression="State" Visible="false" />
                            <asp:BoundField DataField="Zip Code" HeaderText="Zip Code" InsertVisible="False" ReadOnly="True" SortExpression="Zip Code" Visible="false" />
                            <asp:BoundField DataField="PayType" HeaderText="PayType" InsertVisible="False" ReadOnly="True" SortExpression="PayType" Visible="false" />
                            <asp:BoundField DataField="PayRate" HeaderText="PayRate" InsertVisible="False" ReadOnly="True" SortExpression="PayRate" Visible="false" />
                            <asp:BoundField DataField="AvailabilityDate" HeaderText="AvailabilityDate" InsertVisible="False" ReadOnly="True" SortExpression="AvailabilityDate" Visible="false" />
                            <asp:BoundField DataField="AvailabilityHours" HeaderText="AvailabilityHours" InsertVisible="False" ReadOnly="True" SortExpression="AvailabilityHours" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Resource_ID], [Resource_Type_ID], [Description], [Address], [City], [State], [Zip Code], [PayType], [PayRate], [AvailabilityDate], [AvailabilityHours] FROM [Resource]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Resource_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Resource_InfoHead_label" Style="padding: 10px" runat="server" Text="Resource Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_Resource_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Resource_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Resource_Type_ID_lbl" runat="server" Font-Size="Large" Text="Resource_Type_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Resource_Type_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Description_lbl" runat="server" Font-Size="Large" Text="Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Address_lbl" runat="server" Font-Size="Large" Text="Address:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Address_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_City_lbl" runat="server" Font-Size="Large" Text="City:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_City_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_State_lbl" runat="server" Font-Size="Large" Text="State:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_State_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Zip Code_lbl" runat="server" Font-Size="Large" Text="Zip Code:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Zip Code_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_PayType_lbl" runat="server" Font-Size="Large" Text="PayType:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_PayType_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_PayRate_lbl" runat="server" Font-Size="Large" Text="PayRate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_PayRate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_AvailabilityDate_lbl" runat="server" Font-Size="Large" Text="AvailabilityDate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_AvailabilityDate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_AvailabilityHours_lbl" runat="server" Font-Size="Large" Text="AvailabilityHours:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_AvailabilityHours_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeResourceInfo" runat="server" CollapseControlID="Delete_Resource_InfoHead" CollapsedText="Show Resource Information" Enabled="True" ExpandControlID="Delete_Resource_InfoHead" ExpandedText="Resource Information" TargetControlID="Delete_Resource_InfoBody" TextLabelID="Delete_Resource_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

