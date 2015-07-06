<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Donor_Product_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.Donor_Product_Screen" %>
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
                                        <asp:GridView ID="Insert_Donor_Product_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="DonorProductID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="DonorProductID" HeaderText="DonorProductID" InsertVisible="False" ReadOnly="True" SortExpression="DonorProductID" />
                            <asp:BoundField DataField="DonorID" HeaderText="DonorID" InsertVisible="False" ReadOnly="True" SortExpression="DonorID" />
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="other_info" HeaderText="other_info" InsertVisible="False" ReadOnly="True" SortExpression="other_info" Visible="false" />
                            <asp:BoundField DataField="Product_rec_date" HeaderText="Product_rec_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_rec_date" Visible="false" />
                            <asp:BoundField DataField="AmountOfProdDonated" HeaderText="AmountOfProdDonated" InsertVisible="False" ReadOnly="True" SortExpression="AmountOfProdDonated" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [DonorProductID], [DonorID], [ProductID], [quantity], [other_info], [Product_rec_date], [AmountOfProdDonated] FROM [Donor_Product]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Donor_Product_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Donor_Product_InfoHead_label" Style="padding: 10px" runat="server" Text="Donor_Product Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Donor_Product_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_DonorID_lbl" runat="server" Font-Size="Large" Text="DonorID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_DonorID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ProductID_lbl" runat="server" Font-Size="Large" Text="ProductID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ProductID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_quantity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_other_info_lbl" runat="server" Font-Size="Large" Text="other_info:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_other_info_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Product_rec_date_lbl" runat="server" Font-Size="Large" Text="Product_rec_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Product_rec_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_AmountOfProdDonated_lbl" runat="server" Font-Size="Large" Text="AmountOfProdDonated:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_AmountOfProdDonated_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeDonor_ProductInfo" runat="server" CollapseControlID="Insert_Donor_Product_InfoHead" CollapsedText="Show Donor_Product Information" Enabled="True" ExpandControlID="Insert_Donor_Product_InfoHead" ExpandedText="Donor_Product Information" TargetControlID="Insert_Donor_Product_InfoBody" TextLabelID="Insert_Donor_Product_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_Donor_Product_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="DonorProductID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="DonorProductID" HeaderText="DonorProductID" InsertVisible="False" ReadOnly="True" SortExpression="DonorProductID" />
                            <asp:BoundField DataField="DonorID" HeaderText="DonorID" InsertVisible="False" ReadOnly="True" SortExpression="DonorID" />
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="other_info" HeaderText="other_info" InsertVisible="False" ReadOnly="True" SortExpression="other_info" Visible="false" />
                            <asp:BoundField DataField="Product_rec_date" HeaderText="Product_rec_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_rec_date" Visible="false" />
                            <asp:BoundField DataField="AmountOfProdDonated" HeaderText="AmountOfProdDonated" InsertVisible="False" ReadOnly="True" SortExpression="AmountOfProdDonated" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [DonorProductID], [DonorID], [ProductID], [quantity], [other_info], [Product_rec_date], [AmountOfProdDonated] FROM [Donor_Product]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Donor_Product_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Donor_Product_InfoHead_label" Style="padding: 10px" runat="server" Text="Donor_Product Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Donor_Product_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_DonorProductID_lbl" runat="server" Font-Size="Large" Text="DonorProductID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_DonorProductID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_DonorID_lbl" runat="server" Font-Size="Large" Text="DonorID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_DonorID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ProductID_lbl" runat="server" Font-Size="Large" Text="ProductID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ProductID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_quantity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_other_info_lbl" runat="server" Font-Size="Large" Text="other_info:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_other_info_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Product_rec_date_lbl" runat="server" Font-Size="Large" Text="Product_rec_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Product_rec_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_AmountOfProdDonated_lbl" runat="server" Font-Size="Large" Text="AmountOfProdDonated:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_AmountOfProdDonated_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeDonor_ProductInfo" runat="server" CollapseControlID="Update_Donor_Product_InfoHead" CollapsedText="Show Donor_Product Information" Enabled="True" ExpandControlID="Update_Donor_Product_InfoHead" ExpandedText="Donor_Product Information" TargetControlID="Update_Donor_Product_InfoBody" TextLabelID="Update_Donor_Product_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_Donor_Product_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="DonorProductID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="DonorProductID" HeaderText="DonorProductID" InsertVisible="False" ReadOnly="True" SortExpression="DonorProductID" />
                            <asp:BoundField DataField="DonorID" HeaderText="DonorID" InsertVisible="False" ReadOnly="True" SortExpression="DonorID" />
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="other_info" HeaderText="other_info" InsertVisible="False" ReadOnly="True" SortExpression="other_info" Visible="false" />
                            <asp:BoundField DataField="Product_rec_date" HeaderText="Product_rec_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_rec_date" Visible="false" />
                            <asp:BoundField DataField="AmountOfProdDonated" HeaderText="AmountOfProdDonated" InsertVisible="False" ReadOnly="True" SortExpression="AmountOfProdDonated" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [DonorProductID], [DonorID], [ProductID], [quantity], [other_info], [Product_rec_date], [AmountOfProdDonated] FROM [Donor_Product]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Donor_Product_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Donor_Product_InfoHead_label" Style="padding: 10px" runat="server" Text="Donor_Product Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_Donor_Product_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_DonorProductID_lbl" runat="server" Font-Size="Large" Text="DonorProductID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_DonorProductID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_DonorID_lbl" runat="server" Font-Size="Large" Text="DonorID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_DonorID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ProductID_lbl" runat="server" Font-Size="Large" Text="ProductID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ProductID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_quantity_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_other_info_lbl" runat="server" Font-Size="Large" Text="other_info:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_other_info_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Product_rec_date_lbl" runat="server" Font-Size="Large" Text="Product_rec_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Product_rec_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_AmountOfProdDonated_lbl" runat="server" Font-Size="Large" Text="AmountOfProdDonated:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_AmountOfProdDonated_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeDonor_ProductInfo" runat="server" CollapseControlID="Delete_Donor_Product_InfoHead" CollapsedText="Show Donor_Product Information" Enabled="True" ExpandControlID="Delete_Donor_Product_InfoHead" ExpandedText="Donor_Product Information" TargetControlID="Delete_Donor_Product_InfoBody" TextLabelID="Delete_Donor_Product_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

