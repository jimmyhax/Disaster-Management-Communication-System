<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="warehouse_product_Location_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.warehouse_product_Location_Screen" %>
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
                                        <asp:GridView ID="Insert_warehouse_product_Location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="warehouse_product_location_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="warehouse_product_location_id" HeaderText="warehouse_product_location_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_product_location_id" />
                            <asp:BoundField DataField="warehouse_id" HeaderText="warehouse_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_id" />
                            <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                            <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                            <asp:BoundField DataField="Time_Date_MIA" HeaderText="Time_Date_MIA" InsertVisible="False" ReadOnly="True" SortExpression="Time_Date_MIA" Visible="false" />
                            <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                            <asp:BoundField DataField="min_inv" HeaderText="min_inv" InsertVisible="False" ReadOnly="True" SortExpression="min_inv" Visible="false" />
                            <asp:BoundField DataField="status" HeaderText="status" InsertVisible="False" ReadOnly="True" SortExpression="status" Visible="false" />
                            <asp:BoundField DataField="Exp_delivery_date" HeaderText="Exp_delivery_date" InsertVisible="False" ReadOnly="True" SortExpression="Exp_delivery_date" Visible="false" />
                            <asp:BoundField DataField="qty_onhand" HeaderText="qty_onhand" InsertVisible="False" ReadOnly="True" SortExpression="qty_onhand" Visible="false" />
                            <asp:BoundField DataField="qty_commit" HeaderText="qty_commit" InsertVisible="False" ReadOnly="True" SortExpression="qty_commit" Visible="false" />
                            <asp:BoundField DataField="qty_order" HeaderText="qty_order" InsertVisible="False" ReadOnly="True" SortExpression="qty_order" Visible="false" />
                            <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" Visible="false" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [warehouse_product_location_id], [warehouse_id], [product_id], [Location_ID], [service_id], [Time_Date_MIA], [Experiation_Date], [min_inv], [status], [Exp_delivery_date], [qty_onhand], [qty_commit], [qty_order], [encounter_id], [address_id] FROM [warehouse_product_Location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_warehouse_product_Location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_warehouse_product_Location_InfoHead_label" Style="padding: 10px" runat="server" Text="warehouse_product_Location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_warehouse_product_Location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_warehouse_id_lbl" runat="server" Font-Size="Large" Text="warehouse_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_warehouse_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_id_lbl" runat="server" Font-Size="Large" Text="product_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Location_ID_lbl" runat="server" Font-Size="Large" Text="Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Location_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_service_id_lbl" runat="server" Font-Size="Large" Text="service_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_service_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Time_Date_MIA_lbl" runat="server" Font-Size="Large" Text="Time_Date_MIA:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Time_Date_MIA_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Experiation_Date_lbl" runat="server" Font-Size="Large" Text="Experiation_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Experiation_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_min_inv_lbl" runat="server" Font-Size="Large" Text="min_inv:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_min_inv_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_status_lbl" runat="server" Font-Size="Large" Text="status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Exp_delivery_date_lbl" runat="server" Font-Size="Large" Text="Exp_delivery_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Exp_delivery_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_qty_onhand_lbl" runat="server" Font-Size="Large" Text="qty_onhand:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_qty_onhand_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_qty_commit_lbl" runat="server" Font-Size="Large" Text="qty_commit:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_qty_commit_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_qty_order_lbl" runat="server" Font-Size="Large" Text="qty_order:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_qty_order_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_encounter_id_lbl" runat="server" Font-Size="Large" Text="encounter_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_encounter_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpewarehouse_product_LocationInfo" runat="server" CollapseControlID="Insert_warehouse_product_Location_InfoHead" CollapsedText="Show warehouse_product_Location Information" Enabled="True" ExpandControlID="Insert_warehouse_product_Location_InfoHead" ExpandedText="warehouse_product_Location Information" TargetControlID="Insert_warehouse_product_Location_InfoBody" TextLabelID="Insert_warehouse_product_Location_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_warehouse_product_Location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="warehouse_product_location_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="warehouse_product_location_id" HeaderText="warehouse_product_location_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_product_location_id" />
                            <asp:BoundField DataField="warehouse_id" HeaderText="warehouse_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_id" />
                            <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                            <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                            <asp:BoundField DataField="Time_Date_MIA" HeaderText="Time_Date_MIA" InsertVisible="False" ReadOnly="True" SortExpression="Time_Date_MIA" Visible="false" />
                            <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                            <asp:BoundField DataField="min_inv" HeaderText="min_inv" InsertVisible="False" ReadOnly="True" SortExpression="min_inv" Visible="false" />
                            <asp:BoundField DataField="status" HeaderText="status" InsertVisible="False" ReadOnly="True" SortExpression="status" Visible="false" />
                            <asp:BoundField DataField="Exp_delivery_date" HeaderText="Exp_delivery_date" InsertVisible="False" ReadOnly="True" SortExpression="Exp_delivery_date" Visible="false" />
                            <asp:BoundField DataField="qty_onhand" HeaderText="qty_onhand" InsertVisible="False" ReadOnly="True" SortExpression="qty_onhand" Visible="false" />
                            <asp:BoundField DataField="qty_commit" HeaderText="qty_commit" InsertVisible="False" ReadOnly="True" SortExpression="qty_commit" Visible="false" />
                            <asp:BoundField DataField="qty_order" HeaderText="qty_order" InsertVisible="False" ReadOnly="True" SortExpression="qty_order" Visible="false" />
                            <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" Visible="false" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [warehouse_product_location_id], [warehouse_id], [product_id], [Location_ID], [service_id], [Time_Date_MIA], [Experiation_Date], [min_inv], [status], [Exp_delivery_date], [qty_onhand], [qty_commit], [qty_order], [encounter_id], [address_id] FROM [warehouse_product_Location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_warehouse_product_Location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_warehouse_product_Location_InfoHead_label" Style="padding: 10px" runat="server" Text="warehouse_product_Location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_warehouse_product_Location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_warehouse_product_location_id_lbl" runat="server" Font-Size="Large" Text="warehouse_product_location_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_warehouse_product_location_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_warehouse_id_lbl" runat="server" Font-Size="Large" Text="warehouse_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_warehouse_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_id_lbl" runat="server" Font-Size="Large" Text="product_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Location_ID_lbl" runat="server" Font-Size="Large" Text="Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Location_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_service_id_lbl" runat="server" Font-Size="Large" Text="service_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_service_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Time_Date_MIA_lbl" runat="server" Font-Size="Large" Text="Time_Date_MIA:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Time_Date_MIA_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Experiation_Date_lbl" runat="server" Font-Size="Large" Text="Experiation_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Experiation_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_min_inv_lbl" runat="server" Font-Size="Large" Text="min_inv:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_min_inv_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_status_lbl" runat="server" Font-Size="Large" Text="status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Exp_delivery_date_lbl" runat="server" Font-Size="Large" Text="Exp_delivery_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Exp_delivery_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_qty_onhand_lbl" runat="server" Font-Size="Large" Text="qty_onhand:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_qty_onhand_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_qty_commit_lbl" runat="server" Font-Size="Large" Text="qty_commit:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_qty_commit_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_qty_order_lbl" runat="server" Font-Size="Large" Text="qty_order:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_qty_order_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_encounter_id_lbl" runat="server" Font-Size="Large" Text="encounter_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_encounter_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpewarehouse_product_LocationInfo" runat="server" CollapseControlID="Update_warehouse_product_Location_InfoHead" CollapsedText="Show warehouse_product_Location Information" Enabled="True" ExpandControlID="Update_warehouse_product_Location_InfoHead" ExpandedText="warehouse_product_Location Information" TargetControlID="Update_warehouse_product_Location_InfoBody" TextLabelID="Update_warehouse_product_Location_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_warehouse_product_Location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="warehouse_product_location_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="warehouse_product_location_id" HeaderText="warehouse_product_location_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_product_location_id" />
                            <asp:BoundField DataField="warehouse_id" HeaderText="warehouse_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_id" />
                            <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                            <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                            <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                            <asp:BoundField DataField="Time_Date_MIA" HeaderText="Time_Date_MIA" InsertVisible="False" ReadOnly="True" SortExpression="Time_Date_MIA" Visible="false" />
                            <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                            <asp:BoundField DataField="min_inv" HeaderText="min_inv" InsertVisible="False" ReadOnly="True" SortExpression="min_inv" Visible="false" />
                            <asp:BoundField DataField="status" HeaderText="status" InsertVisible="False" ReadOnly="True" SortExpression="status" Visible="false" />
                            <asp:BoundField DataField="Exp_delivery_date" HeaderText="Exp_delivery_date" InsertVisible="False" ReadOnly="True" SortExpression="Exp_delivery_date" Visible="false" />
                            <asp:BoundField DataField="qty_onhand" HeaderText="qty_onhand" InsertVisible="False" ReadOnly="True" SortExpression="qty_onhand" Visible="false" />
                            <asp:BoundField DataField="qty_commit" HeaderText="qty_commit" InsertVisible="False" ReadOnly="True" SortExpression="qty_commit" Visible="false" />
                            <asp:BoundField DataField="qty_order" HeaderText="qty_order" InsertVisible="False" ReadOnly="True" SortExpression="qty_order" Visible="false" />
                            <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" Visible="false" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [warehouse_product_location_id], [warehouse_id], [product_id], [Location_ID], [service_id], [Time_Date_MIA], [Experiation_Date], [min_inv], [status], [Exp_delivery_date], [qty_onhand], [qty_commit], [qty_order], [encounter_id], [address_id] FROM [warehouse_product_Location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_warehouse_product_Location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_warehouse_product_Location_InfoHead_label" Style="padding: 10px" runat="server" Text="warehouse_product_Location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_warehouse_product_Location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_warehouse_product_location_id_lbl" runat="server" Font-Size="Large" Text="warehouse_product_location_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_warehouse_product_location_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_warehouse_id_lbl" runat="server" Font-Size="Large" Text="warehouse_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_warehouse_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_id_lbl" runat="server" Font-Size="Large" Text="product_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Location_ID_lbl" runat="server" Font-Size="Large" Text="Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Location_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_service_id_lbl" runat="server" Font-Size="Large" Text="service_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_service_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Time_Date_MIA_lbl" runat="server" Font-Size="Large" Text="Time_Date_MIA:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Time_Date_MIA_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Experiation_Date_lbl" runat="server" Font-Size="Large" Text="Experiation_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Experiation_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_min_inv_lbl" runat="server" Font-Size="Large" Text="min_inv:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_min_inv_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_status_lbl" runat="server" Font-Size="Large" Text="status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Exp_delivery_date_lbl" runat="server" Font-Size="Large" Text="Exp_delivery_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Exp_delivery_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_qty_onhand_lbl" runat="server" Font-Size="Large" Text="qty_onhand:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_qty_onhand_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_qty_commit_lbl" runat="server" Font-Size="Large" Text="qty_commit:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_qty_commit_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_qty_order_lbl" runat="server" Font-Size="Large" Text="qty_order:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_qty_order_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_encounter_id_lbl" runat="server" Font-Size="Large" Text="encounter_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_encounter_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpewarehouse_product_LocationInfo" runat="server" CollapseControlID="Delete_warehouse_product_Location_InfoHead" CollapsedText="Show warehouse_product_Location Information" Enabled="True" ExpandControlID="Delete_warehouse_product_Location_InfoHead" ExpandedText="warehouse_product_Location Information" TargetControlID="Delete_warehouse_product_Location_InfoBody" TextLabelID="Delete_warehouse_product_Location_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

