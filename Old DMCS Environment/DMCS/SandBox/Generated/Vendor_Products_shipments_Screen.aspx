<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Vendor_Products_shipments_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.Vendor_Products_shipments_Screen" %>
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
                                        <asp:GridView ID="Insert_Vendor_Products_shipments_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="PO_Order_no" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="PO_Order_no" HeaderText="PO_Order_no" InsertVisible="False" ReadOnly="True" SortExpression="PO_Order_no" />
                            <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" InsertVisible="False" ReadOnly="True" SortExpression="VendorID" />
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" Visible="false" />
                            <asp:BoundField DataField="Expect_Delivery_Date" HeaderText="Expect_Delivery_Date" InsertVisible="False" ReadOnly="True" SortExpression="Expect_Delivery_Date" Visible="false" />
                            <asp:BoundField DataField="orderdate" HeaderText="orderdate" InsertVisible="False" ReadOnly="True" SortExpression="orderdate" Visible="false" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="OtherInfo" HeaderText="OtherInfo" InsertVisible="False" ReadOnly="True" SortExpression="OtherInfo" Visible="false" />
                            <asp:BoundField DataField="DateReceived" HeaderText="DateReceived" InsertVisible="False" ReadOnly="True" SortExpression="DateReceived" Visible="false" />
                            <asp:BoundField DataField="AmountReceived" HeaderText="AmountReceived" InsertVisible="False" ReadOnly="True" SortExpression="AmountReceived" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [PO_Order_no], [ShipmentID], [VendorID], [ProductID], [Expect_Delivery_Date], [orderdate], [quantity], [OtherInfo], [DateReceived], [AmountReceived] FROM [Vendor_Products_shipments]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Vendor_Products_shipments_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Vendor_Products_shipments_InfoHead_label" Style="padding: 10px" runat="server" Text="Vendor_Products_shipments Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Vendor_Products_shipments_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ShipmentID_lbl" runat="server" Font-Size="Large" Text="ShipmentID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ShipmentID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_VendorID_lbl" runat="server" Font-Size="Large" Text="VendorID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_VendorID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ProductID_lbl" runat="server" Font-Size="Large" Text="ProductID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ProductID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Expect_Delivery_Date_lbl" runat="server" Font-Size="Large" Text="Expect_Delivery_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Expect_Delivery_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_orderdate_lbl" runat="server" Font-Size="Large" Text="orderdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_orderdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_quantity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_OtherInfo_lbl" runat="server" Font-Size="Large" Text="OtherInfo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_OtherInfo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_DateReceived_lbl" runat="server" Font-Size="Large" Text="DateReceived:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_DateReceived_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_AmountReceived_lbl" runat="server" Font-Size="Large" Text="AmountReceived:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_AmountReceived_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeVendor_Products_shipmentsInfo" runat="server" CollapseControlID="Insert_Vendor_Products_shipments_InfoHead" CollapsedText="Show Vendor_Products_shipments Information" Enabled="True" ExpandControlID="Insert_Vendor_Products_shipments_InfoHead" ExpandedText="Vendor_Products_shipments Information" TargetControlID="Insert_Vendor_Products_shipments_InfoBody" TextLabelID="Insert_Vendor_Products_shipments_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_Vendor_Products_shipments_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="PO_Order_no" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="PO_Order_no" HeaderText="PO_Order_no" InsertVisible="False" ReadOnly="True" SortExpression="PO_Order_no" />
                            <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" InsertVisible="False" ReadOnly="True" SortExpression="VendorID" />
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" Visible="false" />
                            <asp:BoundField DataField="Expect_Delivery_Date" HeaderText="Expect_Delivery_Date" InsertVisible="False" ReadOnly="True" SortExpression="Expect_Delivery_Date" Visible="false" />
                            <asp:BoundField DataField="orderdate" HeaderText="orderdate" InsertVisible="False" ReadOnly="True" SortExpression="orderdate" Visible="false" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="OtherInfo" HeaderText="OtherInfo" InsertVisible="False" ReadOnly="True" SortExpression="OtherInfo" Visible="false" />
                            <asp:BoundField DataField="DateReceived" HeaderText="DateReceived" InsertVisible="False" ReadOnly="True" SortExpression="DateReceived" Visible="false" />
                            <asp:BoundField DataField="AmountReceived" HeaderText="AmountReceived" InsertVisible="False" ReadOnly="True" SortExpression="AmountReceived" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [PO_Order_no], [ShipmentID], [VendorID], [ProductID], [Expect_Delivery_Date], [orderdate], [quantity], [OtherInfo], [DateReceived], [AmountReceived] FROM [Vendor_Products_shipments]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Vendor_Products_shipments_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Vendor_Products_shipments_InfoHead_label" Style="padding: 10px" runat="server" Text="Vendor_Products_shipments Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Vendor_Products_shipments_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_PO_Order_no_lbl" runat="server" Font-Size="Large" Text="PO_Order_no:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_PO_Order_no_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ShipmentID_lbl" runat="server" Font-Size="Large" Text="ShipmentID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ShipmentID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_VendorID_lbl" runat="server" Font-Size="Large" Text="VendorID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_VendorID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ProductID_lbl" runat="server" Font-Size="Large" Text="ProductID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ProductID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Expect_Delivery_Date_lbl" runat="server" Font-Size="Large" Text="Expect_Delivery_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Expect_Delivery_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_orderdate_lbl" runat="server" Font-Size="Large" Text="orderdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_orderdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_quantity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_OtherInfo_lbl" runat="server" Font-Size="Large" Text="OtherInfo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_OtherInfo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_DateReceived_lbl" runat="server" Font-Size="Large" Text="DateReceived:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_DateReceived_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_AmountReceived_lbl" runat="server" Font-Size="Large" Text="AmountReceived:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_AmountReceived_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeVendor_Products_shipmentsInfo" runat="server" CollapseControlID="Update_Vendor_Products_shipments_InfoHead" CollapsedText="Show Vendor_Products_shipments Information" Enabled="True" ExpandControlID="Update_Vendor_Products_shipments_InfoHead" ExpandedText="Vendor_Products_shipments Information" TargetControlID="Update_Vendor_Products_shipments_InfoBody" TextLabelID="Update_Vendor_Products_shipments_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_Vendor_Products_shipments_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="PO_Order_no" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="PO_Order_no" HeaderText="PO_Order_no" InsertVisible="False" ReadOnly="True" SortExpression="PO_Order_no" />
                            <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                            <asp:BoundField DataField="VendorID" HeaderText="VendorID" InsertVisible="False" ReadOnly="True" SortExpression="VendorID" />
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" Visible="false" />
                            <asp:BoundField DataField="Expect_Delivery_Date" HeaderText="Expect_Delivery_Date" InsertVisible="False" ReadOnly="True" SortExpression="Expect_Delivery_Date" Visible="false" />
                            <asp:BoundField DataField="orderdate" HeaderText="orderdate" InsertVisible="False" ReadOnly="True" SortExpression="orderdate" Visible="false" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="OtherInfo" HeaderText="OtherInfo" InsertVisible="False" ReadOnly="True" SortExpression="OtherInfo" Visible="false" />
                            <asp:BoundField DataField="DateReceived" HeaderText="DateReceived" InsertVisible="False" ReadOnly="True" SortExpression="DateReceived" Visible="false" />
                            <asp:BoundField DataField="AmountReceived" HeaderText="AmountReceived" InsertVisible="False" ReadOnly="True" SortExpression="AmountReceived" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [PO_Order_no], [ShipmentID], [VendorID], [ProductID], [Expect_Delivery_Date], [orderdate], [quantity], [OtherInfo], [DateReceived], [AmountReceived] FROM [Vendor_Products_shipments]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Vendor_Products_shipments_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Vendor_Products_shipments_InfoHead_label" Style="padding: 10px" runat="server" Text="Vendor_Products_shipments Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_Vendor_Products_shipments_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_PO_Order_no_lbl" runat="server" Font-Size="Large" Text="PO_Order_no:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_PO_Order_no_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ShipmentID_lbl" runat="server" Font-Size="Large" Text="ShipmentID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ShipmentID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_VendorID_lbl" runat="server" Font-Size="Large" Text="VendorID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_VendorID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ProductID_lbl" runat="server" Font-Size="Large" Text="ProductID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ProductID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Expect_Delivery_Date_lbl" runat="server" Font-Size="Large" Text="Expect_Delivery_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Expect_Delivery_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_orderdate_lbl" runat="server" Font-Size="Large" Text="orderdate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_orderdate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_quantity_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_OtherInfo_lbl" runat="server" Font-Size="Large" Text="OtherInfo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_OtherInfo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_DateReceived_lbl" runat="server" Font-Size="Large" Text="DateReceived:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_DateReceived_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_AmountReceived_lbl" runat="server" Font-Size="Large" Text="AmountReceived:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_AmountReceived_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeVendor_Products_shipmentsInfo" runat="server" CollapseControlID="Delete_Vendor_Products_shipments_InfoHead" CollapsedText="Show Vendor_Products_shipments Information" Enabled="True" ExpandControlID="Delete_Vendor_Products_shipments_InfoHead" ExpandedText="Vendor_Products_shipments Information" TargetControlID="Delete_Vendor_Products_shipments_InfoBody" TextLabelID="Delete_Vendor_Products_shipments_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

