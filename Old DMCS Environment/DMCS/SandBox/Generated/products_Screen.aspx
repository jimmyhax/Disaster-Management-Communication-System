<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="products_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.products_Screen" %>
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
                                        <asp:GridView ID="Insert_products_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="product_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="product_name" HeaderText="product_name" InsertVisible="False" ReadOnly="True" SortExpression="product_name" />
                            <asp:BoundField DataField="product_type" HeaderText="product_type" InsertVisible="False" ReadOnly="True" SortExpression="product_type" Visible="false" />
                            <asp:BoundField DataField="product_qty" HeaderText="product_qty" InsertVisible="False" ReadOnly="True" SortExpression="product_qty" Visible="false" />
                            <asp:BoundField DataField="product_desc" HeaderText="product_desc" InsertVisible="False" ReadOnly="True" SortExpression="product_desc" Visible="false" />
                            <asp:BoundField DataField="product_color" HeaderText="product_color" InsertVisible="False" ReadOnly="True" SortExpression="product_color" Visible="false" />
                            <asp:BoundField DataField="product_size" HeaderText="product_size" InsertVisible="False" ReadOnly="True" SortExpression="product_size" Visible="false" />
                            <asp:BoundField DataField="product_cost" HeaderText="product_cost" InsertVisible="False" ReadOnly="True" SortExpression="product_cost" Visible="false" />
                            <asp:BoundField DataField="Product_exp_date" HeaderText="Product_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_exp_date" Visible="false" />
                            <asp:BoundField DataField="Product_Alergy_info" HeaderText="Product_Alergy_info" InsertVisible="False" ReadOnly="True" SortExpression="Product_Alergy_info" Visible="false" />
                            <asp:BoundField DataField="Product_refrigde" HeaderText="Product_refrigde" InsertVisible="False" ReadOnly="True" SortExpression="Product_refrigde" Visible="false" />
                            <asp:BoundField DataField="Product_Flammable" HeaderText="Product_Flammable" InsertVisible="False" ReadOnly="True" SortExpression="Product_Flammable" Visible="false" />
                            <asp:BoundField DataField="Product_Hazard" HeaderText="Product_Hazard" InsertVisible="False" ReadOnly="True" SortExpression="Product_Hazard" Visible="false" />
                            <asp:BoundField DataField="Product_Other" HeaderText="Product_Other" InsertVisible="False" ReadOnly="True" SortExpression="Product_Other" Visible="false" />
                            <asp:BoundField DataField="Product_Min_Inv" HeaderText="Product_Min_Inv" InsertVisible="False" ReadOnly="True" SortExpression="Product_Min_Inv" Visible="false" />
                            <asp:BoundField DataField="Product_Barcode" HeaderText="Product_Barcode" InsertVisible="False" ReadOnly="True" SortExpression="Product_Barcode" Visible="false" />
                            <asp:BoundField DataField="Product_subtype" HeaderText="Product_subtype" InsertVisible="False" ReadOnly="True" SortExpression="Product_subtype" Visible="false" />
                            <asp:BoundField DataField="Make" HeaderText="Make" InsertVisible="False" ReadOnly="True" SortExpression="Make" Visible="false" />
                            <asp:BoundField DataField="Model" HeaderText="Model" InsertVisible="False" ReadOnly="True" SortExpression="Model" Visible="false" />
                            <asp:BoundField DataField="FEMA_Description" HeaderText="FEMA_Description" InsertVisible="False" ReadOnly="True" SortExpression="FEMA_Description" Visible="false" />
                            <asp:BoundField DataField="Year" HeaderText="Year" InsertVisible="False" ReadOnly="True" SortExpression="Year" Visible="false" />
                            <asp:BoundField DataField="RFID" HeaderText="RFID" InsertVisible="False" ReadOnly="True" SortExpression="RFID" Visible="false" />
                            <asp:BoundField DataField="GPS" HeaderText="GPS" InsertVisible="False" ReadOnly="True" SortExpression="GPS" Visible="false" />
                            <asp:BoundField DataField="Serial_Number" HeaderText="Serial_Number" InsertVisible="False" ReadOnly="True" SortExpression="Serial_Number" Visible="false" />
                            <asp:BoundField DataField="Height" HeaderText="Height" InsertVisible="False" ReadOnly="True" SortExpression="Height" Visible="false" />
                            <asp:BoundField DataField="Length" HeaderText="Length" InsertVisible="False" ReadOnly="True" SortExpression="Length" Visible="false" />
                            <asp:BoundField DataField="Depth" HeaderText="Depth" InsertVisible="False" ReadOnly="True" SortExpression="Depth" Visible="false" />
                            <asp:BoundField DataField="Weight" HeaderText="Weight" InsertVisible="False" ReadOnly="True" SortExpression="Weight" Visible="false" />
                            <asp:BoundField DataField="OAI" HeaderText="OAI" InsertVisible="False" ReadOnly="True" SortExpression="OAI" Visible="false" />
                            <asp:BoundField DataField="OAI_Type" HeaderText="OAI_Type" InsertVisible="False" ReadOnly="True" SortExpression="OAI_Type" Visible="false" />
                            <asp:BoundField DataField="Use" HeaderText="Use" InsertVisible="False" ReadOnly="True" SortExpression="Use" Visible="false" />
                            <asp:BoundField DataField="Brand" HeaderText="Brand" InsertVisible="False" ReadOnly="True" SortExpression="Brand" Visible="false" />
                            <asp:BoundField DataField="Power_Supply" HeaderText="Power_Supply" InsertVisible="False" ReadOnly="True" SortExpression="Power_Supply" Visible="false" />
                            <asp:BoundField DataField="Gas_Type" HeaderText="Gas_Type" InsertVisible="False" ReadOnly="True" SortExpression="Gas_Type" Visible="false" />
                            <asp:BoundField DataField="Needs_Gas" HeaderText="Needs_Gas" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Gas" Visible="false" />
                            <asp:BoundField DataField="Needs_Electricity" HeaderText="Needs_Electricity" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Electricity" Visible="false" />
                            <asp:BoundField DataField="Availability" HeaderText="Availability" InsertVisible="False" ReadOnly="True" SortExpression="Availability" Visible="false" />
                            <asp:BoundField DataField="Datetime" HeaderText="Datetime" InsertVisible="False" ReadOnly="True" SortExpression="Datetime" Visible="false" />
                            <asp:BoundField DataField="OpenStatus" HeaderText="OpenStatus" InsertVisible="False" ReadOnly="True" SortExpression="OpenStatus" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [product_id], [Resource_ID], [product_name], [product_type], [product_qty], [product_desc], [product_color], [product_size], [product_cost], [Product_exp_date], [Product_Alergy_info], [Product_refrigde], [Product_Flammable], [Product_Hazard], [Product_Other], [Product_Min_Inv], [Product_Barcode], [Product_subtype], [Make], [Model], [FEMA_Description], [Year], [RFID], [GPS], [Serial_Number], [Height], [Length], [Depth], [Weight], [OAI], [OAI_Type], [Use], [Brand], [Power_Supply], [Gas_Type], [Needs_Gas], [Needs_Electricity], [Availability], [Datetime], [OpenStatus] FROM [products]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_products_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_products_InfoHead_label" Style="padding: 10px" runat="server" Text="products Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_products_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_name_lbl" runat="server" Font-Size="Large" Text="product_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_type_lbl" runat="server" Font-Size="Large" Text="product_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_qty_lbl" runat="server" Font-Size="Large" Text="product_qty:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_qty_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_desc_lbl" runat="server" Font-Size="Large" Text="product_desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_color_lbl" runat="server" Font-Size="Large" Text="product_color:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_color_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_size_lbl" runat="server" Font-Size="Large" Text="product_size:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_size_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_product_cost_lbl" runat="server" Font-Size="Large" Text="product_cost:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_product_cost_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_exp_date_lbl" runat="server" Font-Size="Large" Text="Product_exp_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_exp_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_Alergy_info_lbl" runat="server" Font-Size="Large" Text="Product_Alergy_info:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_Alergy_info_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_refrigde_lbl" runat="server" Font-Size="Large" Text="Product_refrigde:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_refrigde_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_Flammable_lbl" runat="server" Font-Size="Large" Text="Product_Flammable:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_Flammable_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_Hazard_lbl" runat="server" Font-Size="Large" Text="Product_Hazard:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_Hazard_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_Other_lbl" runat="server" Font-Size="Large" Text="Product_Other:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_Other_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_Min_Inv_lbl" runat="server" Font-Size="Large" Text="Product_Min_Inv:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_Min_Inv_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_Barcode_lbl" runat="server" Font-Size="Large" Text="Product_Barcode:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_Barcode_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_subtype_lbl" runat="server" Font-Size="Large" Text="Product_subtype:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_subtype_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Make_lbl" runat="server" Font-Size="Large" Text="Make:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Make_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Model_lbl" runat="server" Font-Size="Large" Text="Model:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Model_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_FEMA_Description_lbl" runat="server" Font-Size="Large" Text="FEMA_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_FEMA_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Year_lbl" runat="server" Font-Size="Large" Text="Year:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Year_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_RFID_lbl" runat="server" Font-Size="Large" Text="RFID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_RFID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_GPS_lbl" runat="server" Font-Size="Large" Text="GPS:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_GPS_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Serial_Number_lbl" runat="server" Font-Size="Large" Text="Serial_Number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Serial_Number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Height_lbl" runat="server" Font-Size="Large" Text="Height:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Height_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Length_lbl" runat="server" Font-Size="Large" Text="Length:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Length_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Depth_lbl" runat="server" Font-Size="Large" Text="Depth:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Depth_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Weight_lbl" runat="server" Font-Size="Large" Text="Weight:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Weight_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_OAI_lbl" runat="server" Font-Size="Large" Text="OAI:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_OAI_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_OAI_Type_lbl" runat="server" Font-Size="Large" Text="OAI_Type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_OAI_Type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Use_lbl" runat="server" Font-Size="Large" Text="Use:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Use_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Brand_lbl" runat="server" Font-Size="Large" Text="Brand:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Brand_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Power_Supply_lbl" runat="server" Font-Size="Large" Text="Power_Supply:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Power_Supply_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Gas_Type_lbl" runat="server" Font-Size="Large" Text="Gas_Type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Gas_Type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Needs_Gas_lbl" runat="server" Font-Size="Large" Text="Needs_Gas:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Needs_Gas_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Needs_Electricity_lbl" runat="server" Font-Size="Large" Text="Needs_Electricity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Needs_Electricity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Availability_lbl" runat="server" Font-Size="Large" Text="Availability:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Availability_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Datetime_lbl" runat="server" Font-Size="Large" Text="Datetime:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Datetime_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_OpenStatus_lbl" runat="server" Font-Size="Large" Text="OpenStatus:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_OpenStatus_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeproductsInfo" runat="server" CollapseControlID="Insert_products_InfoHead" CollapsedText="Show products Information" Enabled="True" ExpandControlID="Insert_products_InfoHead" ExpandedText="products Information" TargetControlID="Insert_products_InfoBody" TextLabelID="Insert_products_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_products_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="product_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="product_name" HeaderText="product_name" InsertVisible="False" ReadOnly="True" SortExpression="product_name" />
                            <asp:BoundField DataField="product_type" HeaderText="product_type" InsertVisible="False" ReadOnly="True" SortExpression="product_type" Visible="false" />
                            <asp:BoundField DataField="product_qty" HeaderText="product_qty" InsertVisible="False" ReadOnly="True" SortExpression="product_qty" Visible="false" />
                            <asp:BoundField DataField="product_desc" HeaderText="product_desc" InsertVisible="False" ReadOnly="True" SortExpression="product_desc" Visible="false" />
                            <asp:BoundField DataField="product_color" HeaderText="product_color" InsertVisible="False" ReadOnly="True" SortExpression="product_color" Visible="false" />
                            <asp:BoundField DataField="product_size" HeaderText="product_size" InsertVisible="False" ReadOnly="True" SortExpression="product_size" Visible="false" />
                            <asp:BoundField DataField="product_cost" HeaderText="product_cost" InsertVisible="False" ReadOnly="True" SortExpression="product_cost" Visible="false" />
                            <asp:BoundField DataField="Product_exp_date" HeaderText="Product_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_exp_date" Visible="false" />
                            <asp:BoundField DataField="Product_Alergy_info" HeaderText="Product_Alergy_info" InsertVisible="False" ReadOnly="True" SortExpression="Product_Alergy_info" Visible="false" />
                            <asp:BoundField DataField="Product_refrigde" HeaderText="Product_refrigde" InsertVisible="False" ReadOnly="True" SortExpression="Product_refrigde" Visible="false" />
                            <asp:BoundField DataField="Product_Flammable" HeaderText="Product_Flammable" InsertVisible="False" ReadOnly="True" SortExpression="Product_Flammable" Visible="false" />
                            <asp:BoundField DataField="Product_Hazard" HeaderText="Product_Hazard" InsertVisible="False" ReadOnly="True" SortExpression="Product_Hazard" Visible="false" />
                            <asp:BoundField DataField="Product_Other" HeaderText="Product_Other" InsertVisible="False" ReadOnly="True" SortExpression="Product_Other" Visible="false" />
                            <asp:BoundField DataField="Product_Min_Inv" HeaderText="Product_Min_Inv" InsertVisible="False" ReadOnly="True" SortExpression="Product_Min_Inv" Visible="false" />
                            <asp:BoundField DataField="Product_Barcode" HeaderText="Product_Barcode" InsertVisible="False" ReadOnly="True" SortExpression="Product_Barcode" Visible="false" />
                            <asp:BoundField DataField="Product_subtype" HeaderText="Product_subtype" InsertVisible="False" ReadOnly="True" SortExpression="Product_subtype" Visible="false" />
                            <asp:BoundField DataField="Make" HeaderText="Make" InsertVisible="False" ReadOnly="True" SortExpression="Make" Visible="false" />
                            <asp:BoundField DataField="Model" HeaderText="Model" InsertVisible="False" ReadOnly="True" SortExpression="Model" Visible="false" />
                            <asp:BoundField DataField="FEMA_Description" HeaderText="FEMA_Description" InsertVisible="False" ReadOnly="True" SortExpression="FEMA_Description" Visible="false" />
                            <asp:BoundField DataField="Year" HeaderText="Year" InsertVisible="False" ReadOnly="True" SortExpression="Year" Visible="false" />
                            <asp:BoundField DataField="RFID" HeaderText="RFID" InsertVisible="False" ReadOnly="True" SortExpression="RFID" Visible="false" />
                            <asp:BoundField DataField="GPS" HeaderText="GPS" InsertVisible="False" ReadOnly="True" SortExpression="GPS" Visible="false" />
                            <asp:BoundField DataField="Serial_Number" HeaderText="Serial_Number" InsertVisible="False" ReadOnly="True" SortExpression="Serial_Number" Visible="false" />
                            <asp:BoundField DataField="Height" HeaderText="Height" InsertVisible="False" ReadOnly="True" SortExpression="Height" Visible="false" />
                            <asp:BoundField DataField="Length" HeaderText="Length" InsertVisible="False" ReadOnly="True" SortExpression="Length" Visible="false" />
                            <asp:BoundField DataField="Depth" HeaderText="Depth" InsertVisible="False" ReadOnly="True" SortExpression="Depth" Visible="false" />
                            <asp:BoundField DataField="Weight" HeaderText="Weight" InsertVisible="False" ReadOnly="True" SortExpression="Weight" Visible="false" />
                            <asp:BoundField DataField="OAI" HeaderText="OAI" InsertVisible="False" ReadOnly="True" SortExpression="OAI" Visible="false" />
                            <asp:BoundField DataField="OAI_Type" HeaderText="OAI_Type" InsertVisible="False" ReadOnly="True" SortExpression="OAI_Type" Visible="false" />
                            <asp:BoundField DataField="Use" HeaderText="Use" InsertVisible="False" ReadOnly="True" SortExpression="Use" Visible="false" />
                            <asp:BoundField DataField="Brand" HeaderText="Brand" InsertVisible="False" ReadOnly="True" SortExpression="Brand" Visible="false" />
                            <asp:BoundField DataField="Power_Supply" HeaderText="Power_Supply" InsertVisible="False" ReadOnly="True" SortExpression="Power_Supply" Visible="false" />
                            <asp:BoundField DataField="Gas_Type" HeaderText="Gas_Type" InsertVisible="False" ReadOnly="True" SortExpression="Gas_Type" Visible="false" />
                            <asp:BoundField DataField="Needs_Gas" HeaderText="Needs_Gas" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Gas" Visible="false" />
                            <asp:BoundField DataField="Needs_Electricity" HeaderText="Needs_Electricity" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Electricity" Visible="false" />
                            <asp:BoundField DataField="Availability" HeaderText="Availability" InsertVisible="False" ReadOnly="True" SortExpression="Availability" Visible="false" />
                            <asp:BoundField DataField="Datetime" HeaderText="Datetime" InsertVisible="False" ReadOnly="True" SortExpression="Datetime" Visible="false" />
                            <asp:BoundField DataField="OpenStatus" HeaderText="OpenStatus" InsertVisible="False" ReadOnly="True" SortExpression="OpenStatus" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [product_id], [Resource_ID], [product_name], [product_type], [product_qty], [product_desc], [product_color], [product_size], [product_cost], [Product_exp_date], [Product_Alergy_info], [Product_refrigde], [Product_Flammable], [Product_Hazard], [Product_Other], [Product_Min_Inv], [Product_Barcode], [Product_subtype], [Make], [Model], [FEMA_Description], [Year], [RFID], [GPS], [Serial_Number], [Height], [Length], [Depth], [Weight], [OAI], [OAI_Type], [Use], [Brand], [Power_Supply], [Gas_Type], [Needs_Gas], [Needs_Electricity], [Availability], [Datetime], [OpenStatus] FROM [products]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_products_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_products_InfoHead_label" Style="padding: 10px" runat="server" Text="products Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_products_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_id_lbl" runat="server" Font-Size="Large" Text="product_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_name_lbl" runat="server" Font-Size="Large" Text="product_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_type_lbl" runat="server" Font-Size="Large" Text="product_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_qty_lbl" runat="server" Font-Size="Large" Text="product_qty:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_qty_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_desc_lbl" runat="server" Font-Size="Large" Text="product_desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_color_lbl" runat="server" Font-Size="Large" Text="product_color:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_color_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_size_lbl" runat="server" Font-Size="Large" Text="product_size:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_size_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_product_cost_lbl" runat="server" Font-Size="Large" Text="product_cost:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_product_cost_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_exp_date_lbl" runat="server" Font-Size="Large" Text="Product_exp_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_exp_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_Alergy_info_lbl" runat="server" Font-Size="Large" Text="Product_Alergy_info:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_Alergy_info_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_refrigde_lbl" runat="server" Font-Size="Large" Text="Product_refrigde:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_refrigde_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_Flammable_lbl" runat="server" Font-Size="Large" Text="Product_Flammable:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_Flammable_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_Hazard_lbl" runat="server" Font-Size="Large" Text="Product_Hazard:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_Hazard_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_Other_lbl" runat="server" Font-Size="Large" Text="Product_Other:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_Other_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_Min_Inv_lbl" runat="server" Font-Size="Large" Text="Product_Min_Inv:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_Min_Inv_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_Barcode_lbl" runat="server" Font-Size="Large" Text="Product_Barcode:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_Barcode_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_subtype_lbl" runat="server" Font-Size="Large" Text="Product_subtype:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_subtype_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Make_lbl" runat="server" Font-Size="Large" Text="Make:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Make_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Model_lbl" runat="server" Font-Size="Large" Text="Model:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Model_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_FEMA_Description_lbl" runat="server" Font-Size="Large" Text="FEMA_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_FEMA_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Year_lbl" runat="server" Font-Size="Large" Text="Year:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Year_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_RFID_lbl" runat="server" Font-Size="Large" Text="RFID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_RFID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_GPS_lbl" runat="server" Font-Size="Large" Text="GPS:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_GPS_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Serial_Number_lbl" runat="server" Font-Size="Large" Text="Serial_Number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Serial_Number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Height_lbl" runat="server" Font-Size="Large" Text="Height:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Height_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Length_lbl" runat="server" Font-Size="Large" Text="Length:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Length_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Depth_lbl" runat="server" Font-Size="Large" Text="Depth:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Depth_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Weight_lbl" runat="server" Font-Size="Large" Text="Weight:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Weight_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_OAI_lbl" runat="server" Font-Size="Large" Text="OAI:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_OAI_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_OAI_Type_lbl" runat="server" Font-Size="Large" Text="OAI_Type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_OAI_Type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Use_lbl" runat="server" Font-Size="Large" Text="Use:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Use_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Brand_lbl" runat="server" Font-Size="Large" Text="Brand:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Brand_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Power_Supply_lbl" runat="server" Font-Size="Large" Text="Power_Supply:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Power_Supply_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Gas_Type_lbl" runat="server" Font-Size="Large" Text="Gas_Type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Gas_Type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Needs_Gas_lbl" runat="server" Font-Size="Large" Text="Needs_Gas:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Needs_Gas_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Needs_Electricity_lbl" runat="server" Font-Size="Large" Text="Needs_Electricity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Needs_Electricity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Availability_lbl" runat="server" Font-Size="Large" Text="Availability:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Availability_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Datetime_lbl" runat="server" Font-Size="Large" Text="Datetime:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Datetime_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_OpenStatus_lbl" runat="server" Font-Size="Large" Text="OpenStatus:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_OpenStatus_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeproductsInfo" runat="server" CollapseControlID="Update_products_InfoHead" CollapsedText="Show products Information" Enabled="True" ExpandControlID="Update_products_InfoHead" ExpandedText="products Information" TargetControlID="Update_products_InfoBody" TextLabelID="Update_products_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_products_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="product_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="product_name" HeaderText="product_name" InsertVisible="False" ReadOnly="True" SortExpression="product_name" />
                            <asp:BoundField DataField="product_type" HeaderText="product_type" InsertVisible="False" ReadOnly="True" SortExpression="product_type" Visible="false" />
                            <asp:BoundField DataField="product_qty" HeaderText="product_qty" InsertVisible="False" ReadOnly="True" SortExpression="product_qty" Visible="false" />
                            <asp:BoundField DataField="product_desc" HeaderText="product_desc" InsertVisible="False" ReadOnly="True" SortExpression="product_desc" Visible="false" />
                            <asp:BoundField DataField="product_color" HeaderText="product_color" InsertVisible="False" ReadOnly="True" SortExpression="product_color" Visible="false" />
                            <asp:BoundField DataField="product_size" HeaderText="product_size" InsertVisible="False" ReadOnly="True" SortExpression="product_size" Visible="false" />
                            <asp:BoundField DataField="product_cost" HeaderText="product_cost" InsertVisible="False" ReadOnly="True" SortExpression="product_cost" Visible="false" />
                            <asp:BoundField DataField="Product_exp_date" HeaderText="Product_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_exp_date" Visible="false" />
                            <asp:BoundField DataField="Product_Alergy_info" HeaderText="Product_Alergy_info" InsertVisible="False" ReadOnly="True" SortExpression="Product_Alergy_info" Visible="false" />
                            <asp:BoundField DataField="Product_refrigde" HeaderText="Product_refrigde" InsertVisible="False" ReadOnly="True" SortExpression="Product_refrigde" Visible="false" />
                            <asp:BoundField DataField="Product_Flammable" HeaderText="Product_Flammable" InsertVisible="False" ReadOnly="True" SortExpression="Product_Flammable" Visible="false" />
                            <asp:BoundField DataField="Product_Hazard" HeaderText="Product_Hazard" InsertVisible="False" ReadOnly="True" SortExpression="Product_Hazard" Visible="false" />
                            <asp:BoundField DataField="Product_Other" HeaderText="Product_Other" InsertVisible="False" ReadOnly="True" SortExpression="Product_Other" Visible="false" />
                            <asp:BoundField DataField="Product_Min_Inv" HeaderText="Product_Min_Inv" InsertVisible="False" ReadOnly="True" SortExpression="Product_Min_Inv" Visible="false" />
                            <asp:BoundField DataField="Product_Barcode" HeaderText="Product_Barcode" InsertVisible="False" ReadOnly="True" SortExpression="Product_Barcode" Visible="false" />
                            <asp:BoundField DataField="Product_subtype" HeaderText="Product_subtype" InsertVisible="False" ReadOnly="True" SortExpression="Product_subtype" Visible="false" />
                            <asp:BoundField DataField="Make" HeaderText="Make" InsertVisible="False" ReadOnly="True" SortExpression="Make" Visible="false" />
                            <asp:BoundField DataField="Model" HeaderText="Model" InsertVisible="False" ReadOnly="True" SortExpression="Model" Visible="false" />
                            <asp:BoundField DataField="FEMA_Description" HeaderText="FEMA_Description" InsertVisible="False" ReadOnly="True" SortExpression="FEMA_Description" Visible="false" />
                            <asp:BoundField DataField="Year" HeaderText="Year" InsertVisible="False" ReadOnly="True" SortExpression="Year" Visible="false" />
                            <asp:BoundField DataField="RFID" HeaderText="RFID" InsertVisible="False" ReadOnly="True" SortExpression="RFID" Visible="false" />
                            <asp:BoundField DataField="GPS" HeaderText="GPS" InsertVisible="False" ReadOnly="True" SortExpression="GPS" Visible="false" />
                            <asp:BoundField DataField="Serial_Number" HeaderText="Serial_Number" InsertVisible="False" ReadOnly="True" SortExpression="Serial_Number" Visible="false" />
                            <asp:BoundField DataField="Height" HeaderText="Height" InsertVisible="False" ReadOnly="True" SortExpression="Height" Visible="false" />
                            <asp:BoundField DataField="Length" HeaderText="Length" InsertVisible="False" ReadOnly="True" SortExpression="Length" Visible="false" />
                            <asp:BoundField DataField="Depth" HeaderText="Depth" InsertVisible="False" ReadOnly="True" SortExpression="Depth" Visible="false" />
                            <asp:BoundField DataField="Weight" HeaderText="Weight" InsertVisible="False" ReadOnly="True" SortExpression="Weight" Visible="false" />
                            <asp:BoundField DataField="OAI" HeaderText="OAI" InsertVisible="False" ReadOnly="True" SortExpression="OAI" Visible="false" />
                            <asp:BoundField DataField="OAI_Type" HeaderText="OAI_Type" InsertVisible="False" ReadOnly="True" SortExpression="OAI_Type" Visible="false" />
                            <asp:BoundField DataField="Use" HeaderText="Use" InsertVisible="False" ReadOnly="True" SortExpression="Use" Visible="false" />
                            <asp:BoundField DataField="Brand" HeaderText="Brand" InsertVisible="False" ReadOnly="True" SortExpression="Brand" Visible="false" />
                            <asp:BoundField DataField="Power_Supply" HeaderText="Power_Supply" InsertVisible="False" ReadOnly="True" SortExpression="Power_Supply" Visible="false" />
                            <asp:BoundField DataField="Gas_Type" HeaderText="Gas_Type" InsertVisible="False" ReadOnly="True" SortExpression="Gas_Type" Visible="false" />
                            <asp:BoundField DataField="Needs_Gas" HeaderText="Needs_Gas" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Gas" Visible="false" />
                            <asp:BoundField DataField="Needs_Electricity" HeaderText="Needs_Electricity" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Electricity" Visible="false" />
                            <asp:BoundField DataField="Availability" HeaderText="Availability" InsertVisible="False" ReadOnly="True" SortExpression="Availability" Visible="false" />
                            <asp:BoundField DataField="Datetime" HeaderText="Datetime" InsertVisible="False" ReadOnly="True" SortExpression="Datetime" Visible="false" />
                            <asp:BoundField DataField="OpenStatus" HeaderText="OpenStatus" InsertVisible="False" ReadOnly="True" SortExpression="OpenStatus" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [product_id], [Resource_ID], [product_name], [product_type], [product_qty], [product_desc], [product_color], [product_size], [product_cost], [Product_exp_date], [Product_Alergy_info], [Product_refrigde], [Product_Flammable], [Product_Hazard], [Product_Other], [Product_Min_Inv], [Product_Barcode], [Product_subtype], [Make], [Model], [FEMA_Description], [Year], [RFID], [GPS], [Serial_Number], [Height], [Length], [Depth], [Weight], [OAI], [OAI_Type], [Use], [Brand], [Power_Supply], [Gas_Type], [Needs_Gas], [Needs_Electricity], [Availability], [Datetime], [OpenStatus] FROM [products]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_products_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_products_InfoHead_label" Style="padding: 10px" runat="server" Text="products Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_products_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_id_lbl" runat="server" Font-Size="Large" Text="product_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Resource_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_name_lbl" runat="server" Font-Size="Large" Text="product_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_type_lbl" runat="server" Font-Size="Large" Text="product_type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_qty_lbl" runat="server" Font-Size="Large" Text="product_qty:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_qty_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_desc_lbl" runat="server" Font-Size="Large" Text="product_desc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_desc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_color_lbl" runat="server" Font-Size="Large" Text="product_color:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_color_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_size_lbl" runat="server" Font-Size="Large" Text="product_size:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_size_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_product_cost_lbl" runat="server" Font-Size="Large" Text="product_cost:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_product_cost_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_exp_date_lbl" runat="server" Font-Size="Large" Text="Product_exp_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_exp_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_Alergy_info_lbl" runat="server" Font-Size="Large" Text="Product_Alergy_info:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_Alergy_info_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_refrigde_lbl" runat="server" Font-Size="Large" Text="Product_refrigde:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_refrigde_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_Flammable_lbl" runat="server" Font-Size="Large" Text="Product_Flammable:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_Flammable_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_Hazard_lbl" runat="server" Font-Size="Large" Text="Product_Hazard:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_Hazard_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_Other_lbl" runat="server" Font-Size="Large" Text="Product_Other:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_Other_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_Min_Inv_lbl" runat="server" Font-Size="Large" Text="Product_Min_Inv:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_Min_Inv_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_Barcode_lbl" runat="server" Font-Size="Large" Text="Product_Barcode:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_Barcode_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_subtype_lbl" runat="server" Font-Size="Large" Text="Product_subtype:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_subtype_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Make_lbl" runat="server" Font-Size="Large" Text="Make:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Make_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Model_lbl" runat="server" Font-Size="Large" Text="Model:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Model_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_FEMA_Description_lbl" runat="server" Font-Size="Large" Text="FEMA_Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_FEMA_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Year_lbl" runat="server" Font-Size="Large" Text="Year:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Year_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_RFID_lbl" runat="server" Font-Size="Large" Text="RFID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_RFID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_GPS_lbl" runat="server" Font-Size="Large" Text="GPS:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_GPS_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Serial_Number_lbl" runat="server" Font-Size="Large" Text="Serial_Number:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Serial_Number_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Height_lbl" runat="server" Font-Size="Large" Text="Height:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Height_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Length_lbl" runat="server" Font-Size="Large" Text="Length:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Length_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Depth_lbl" runat="server" Font-Size="Large" Text="Depth:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Depth_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Weight_lbl" runat="server" Font-Size="Large" Text="Weight:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Weight_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_OAI_lbl" runat="server" Font-Size="Large" Text="OAI:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_OAI_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_OAI_Type_lbl" runat="server" Font-Size="Large" Text="OAI_Type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_OAI_Type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Use_lbl" runat="server" Font-Size="Large" Text="Use:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Use_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Brand_lbl" runat="server" Font-Size="Large" Text="Brand:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Brand_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Power_Supply_lbl" runat="server" Font-Size="Large" Text="Power_Supply:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Power_Supply_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Gas_Type_lbl" runat="server" Font-Size="Large" Text="Gas_Type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Gas_Type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Needs_Gas_lbl" runat="server" Font-Size="Large" Text="Needs_Gas:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Needs_Gas_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Needs_Electricity_lbl" runat="server" Font-Size="Large" Text="Needs_Electricity:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Needs_Electricity_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Availability_lbl" runat="server" Font-Size="Large" Text="Availability:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Availability_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Datetime_lbl" runat="server" Font-Size="Large" Text="Datetime:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Datetime_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_OpenStatus_lbl" runat="server" Font-Size="Large" Text="OpenStatus:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_OpenStatus_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeproductsInfo" runat="server" CollapseControlID="Delete_products_InfoHead" CollapsedText="Show products Information" Enabled="True" ExpandControlID="Delete_products_InfoHead" ExpandedText="products Information" TargetControlID="Delete_products_InfoBody" TextLabelID="Delete_products_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

