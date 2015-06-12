<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="equipment.aspx.cs" Inherits="DMCS.equipment_" %>
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
                                        <asp:GridView ID="Insert_equipment_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="equipment_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="equipment_id" HeaderText="equipment_id" InsertVisible="False" ReadOnly="True" SortExpression="equipment_id" />
                            <asp:BoundField DataField="resource_ID" HeaderText="resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="resource_ID" />
                            <asp:BoundField DataField="vendor_id" HeaderText="vendor_id" InsertVisible="False" ReadOnly="True" SortExpression="vendor_id" />
                            <asp:BoundField DataField="Description" HeaderText="Description" InsertVisible="False" ReadOnly="True" SortExpression="Description" Visible="false" />
                            <asp:BoundField DataField="costType" HeaderText="costType" InsertVisible="False" ReadOnly="True" SortExpression="costType" Visible="false" />
                            <asp:BoundField DataField="costRate" HeaderText="costRate" InsertVisible="False" ReadOnly="True" SortExpression="costRate" Visible="false" />
                            <asp:BoundField DataField="capacity" HeaderText="capacity" InsertVisible="False" ReadOnly="True" SortExpression="capacity" Visible="false" />
                            <asp:BoundField DataField="make" HeaderText="make" InsertVisible="False" ReadOnly="True" SortExpression="make" Visible="false" />
                            <asp:BoundField DataField="model" HeaderText="model" InsertVisible="False" ReadOnly="True" SortExpression="model" Visible="false" />
                            <asp:BoundField DataField="operatorName" HeaderText="operatorName" InsertVisible="False" ReadOnly="True" SortExpression="operatorName" Visible="false" />
                            <asp:BoundField DataField="startDate" HeaderText="startDate" InsertVisible="False" ReadOnly="True" SortExpression="startDate" Visible="false" />
                            <asp:BoundField DataField="endDate" HeaderText="endDate" InsertVisible="False" ReadOnly="True" SortExpression="endDate" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [equipment_id], [resource_ID], [vendor_id], [Description], [costType], [costRate], [capacity], [make], [model], [operatorName], [startDate], [endDate] FROM [equipment]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_equipment_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_equipment_InfoHead_label" Style="padding: 10px" runat="server" Text="equipment Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_equipment_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_resource_ID_lbl" runat="server" Font-Size="Large" Text="resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_id_lbl" runat="server" Font-Size="Large" Text="vendor_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Description_lbl" runat="server" Font-Size="Large" Text="Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_costType_lbl" runat="server" Font-Size="Large" Text="costType:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_costType_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_costRate_lbl" runat="server" Font-Size="Large" Text="costRate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_costRate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_capacity_lbl" runat="server" Font-Size="Large" Text="capacity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_capacity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_make_lbl" runat="server" Font-Size="Large" Text="make:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_make_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_model_lbl" runat="server" Font-Size="Large" Text="model:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_model_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_operatorName_lbl" runat="server" Font-Size="Large" Text="operatorName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_operatorName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_startDate_lbl" runat="server" Font-Size="Large" Text="startDate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_startDate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_endDate_lbl" runat="server" Font-Size="Large" Text="endDate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_endDate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeequipmentInfo" runat="server" CollapseControlID="Insert_equipment_InfoHead" CollapsedText="Show equipment Information" Enabled="True" ExpandControlID="Insert_equipment_InfoHead" ExpandedText="equipment Information" TargetControlID="Insert_equipment_InfoBody" TextLabelID="Insert_equipment_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_equipment_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="equipment_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="equipment_id" HeaderText="equipment_id" InsertVisible="False" ReadOnly="True" SortExpression="equipment_id" />
                            <asp:BoundField DataField="resource_ID" HeaderText="resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="resource_ID" />
                            <asp:BoundField DataField="vendor_id" HeaderText="vendor_id" InsertVisible="False" ReadOnly="True" SortExpression="vendor_id" />
                            <asp:BoundField DataField="Description" HeaderText="Description" InsertVisible="False" ReadOnly="True" SortExpression="Description" Visible="false" />
                            <asp:BoundField DataField="costType" HeaderText="costType" InsertVisible="False" ReadOnly="True" SortExpression="costType" Visible="false" />
                            <asp:BoundField DataField="costRate" HeaderText="costRate" InsertVisible="False" ReadOnly="True" SortExpression="costRate" Visible="false" />
                            <asp:BoundField DataField="capacity" HeaderText="capacity" InsertVisible="False" ReadOnly="True" SortExpression="capacity" Visible="false" />
                            <asp:BoundField DataField="make" HeaderText="make" InsertVisible="False" ReadOnly="True" SortExpression="make" Visible="false" />
                            <asp:BoundField DataField="model" HeaderText="model" InsertVisible="False" ReadOnly="True" SortExpression="model" Visible="false" />
                            <asp:BoundField DataField="operatorName" HeaderText="operatorName" InsertVisible="False" ReadOnly="True" SortExpression="operatorName" Visible="false" />
                            <asp:BoundField DataField="startDate" HeaderText="startDate" InsertVisible="False" ReadOnly="True" SortExpression="startDate" Visible="false" />
                            <asp:BoundField DataField="endDate" HeaderText="endDate" InsertVisible="False" ReadOnly="True" SortExpression="endDate" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [equipment_id], [resource_ID], [vendor_id], [Description], [costType], [costRate], [capacity], [make], [model], [operatorName], [startDate], [endDate] FROM [equipment]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_equipment_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_equipment_InfoHead_label" Style="padding: 10px" runat="server" Text="equipment Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_equipment_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_equipment_id_lbl" runat="server" Font-Size="Large" Text="equipment_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_equipment_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_resource_ID_lbl" runat="server" Font-Size="Large" Text="resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_id_lbl" runat="server" Font-Size="Large" Text="vendor_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Description_lbl" runat="server" Font-Size="Large" Text="Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_costType_lbl" runat="server" Font-Size="Large" Text="costType:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_costType_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_costRate_lbl" runat="server" Font-Size="Large" Text="costRate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_costRate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_capacity_lbl" runat="server" Font-Size="Large" Text="capacity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_capacity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_make_lbl" runat="server" Font-Size="Large" Text="make:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_make_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_model_lbl" runat="server" Font-Size="Large" Text="model:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_model_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_operatorName_lbl" runat="server" Font-Size="Large" Text="operatorName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_operatorName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_startDate_lbl" runat="server" Font-Size="Large" Text="startDate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_startDate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_endDate_lbl" runat="server" Font-Size="Large" Text="endDate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_endDate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeequipmentInfo" runat="server" CollapseControlID="Update_equipment_InfoHead" CollapsedText="Show equipment Information" Enabled="True" ExpandControlID="Update_equipment_InfoHead" ExpandedText="equipment Information" TargetControlID="Update_equipment_InfoBody" TextLabelID="Update_equipment_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_equipment_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="equipment_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="equipment_id" HeaderText="equipment_id" InsertVisible="False" ReadOnly="True" SortExpression="equipment_id" />
                            <asp:BoundField DataField="resource_ID" HeaderText="resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="resource_ID" />
                            <asp:BoundField DataField="vendor_id" HeaderText="vendor_id" InsertVisible="False" ReadOnly="True" SortExpression="vendor_id" />
                            <asp:BoundField DataField="Description" HeaderText="Description" InsertVisible="False" ReadOnly="True" SortExpression="Description" Visible="false" />
                            <asp:BoundField DataField="costType" HeaderText="costType" InsertVisible="False" ReadOnly="True" SortExpression="costType" Visible="false" />
                            <asp:BoundField DataField="costRate" HeaderText="costRate" InsertVisible="False" ReadOnly="True" SortExpression="costRate" Visible="false" />
                            <asp:BoundField DataField="capacity" HeaderText="capacity" InsertVisible="False" ReadOnly="True" SortExpression="capacity" Visible="false" />
                            <asp:BoundField DataField="make" HeaderText="make" InsertVisible="False" ReadOnly="True" SortExpression="make" Visible="false" />
                            <asp:BoundField DataField="model" HeaderText="model" InsertVisible="False" ReadOnly="True" SortExpression="model" Visible="false" />
                            <asp:BoundField DataField="operatorName" HeaderText="operatorName" InsertVisible="False" ReadOnly="True" SortExpression="operatorName" Visible="false" />
                            <asp:BoundField DataField="startDate" HeaderText="startDate" InsertVisible="False" ReadOnly="True" SortExpression="startDate" Visible="false" />
                            <asp:BoundField DataField="endDate" HeaderText="endDate" InsertVisible="False" ReadOnly="True" SortExpression="endDate" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [equipment_id], [resource_ID], [vendor_id], [Description], [costType], [costRate], [capacity], [make], [model], [operatorName], [startDate], [endDate] FROM [equipment]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_equipment_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_equipment_InfoHead_label" Style="padding: 10px" runat="server" Text="equipment Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_equipment_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_equipment_id_lbl" runat="server" Font-Size="Large" Text="equipment_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_equipment_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_resource_ID_lbl" runat="server" Font-Size="Large" Text="resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_resource_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_id_lbl" runat="server" Font-Size="Large" Text="vendor_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Description_lbl" runat="server" Font-Size="Large" Text="Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_costType_lbl" runat="server" Font-Size="Large" Text="costType:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_costType_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_costRate_lbl" runat="server" Font-Size="Large" Text="costRate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_costRate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_capacity_lbl" runat="server" Font-Size="Large" Text="capacity:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_capacity_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_make_lbl" runat="server" Font-Size="Large" Text="make:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_make_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_model_lbl" runat="server" Font-Size="Large" Text="model:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_model_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_operatorName_lbl" runat="server" Font-Size="Large" Text="operatorName:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_operatorName_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_startDate_lbl" runat="server" Font-Size="Large" Text="startDate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_startDate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_endDate_lbl" runat="server" Font-Size="Large" Text="endDate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_endDate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeequipmentInfo" runat="server" CollapseControlID="Delete_equipment_InfoHead" CollapsedText="Show equipment Information" Enabled="True" ExpandControlID="Delete_equipment_InfoHead" ExpandedText="equipment Information" TargetControlID="Delete_equipment_InfoBody" TextLabelID="Delete_equipment_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

