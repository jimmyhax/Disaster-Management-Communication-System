<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="vendor_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.vendor_Screen" %>
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
                                        <asp:GridView ID="Insert_vendor_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="vendor_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="vendor_id" HeaderText="vendor_id" InsertVisible="False" ReadOnly="True" SortExpression="vendor_id" />
                            <asp:BoundField DataField="vendor_name" HeaderText="vendor_name" InsertVisible="False" ReadOnly="True" SortExpression="vendor_name" />
                            <asp:BoundField DataField="phone_num" HeaderText="phone_num" InsertVisible="False" ReadOnly="True" SortExpression="phone_num" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
                            <asp:BoundField DataField="Vendor_address2" HeaderText="Vendor_address2" InsertVisible="False" ReadOnly="True" SortExpression="Vendor_address2" Visible="false" />
                            <asp:BoundField DataField="vendor_job_assign" HeaderText="vendor_job_assign" InsertVisible="False" ReadOnly="True" SortExpression="vendor_job_assign" Visible="false" />
                            <asp:BoundField DataField="vendor_start_date" HeaderText="vendor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="vendor_start_date" Visible="false" />
                            <asp:BoundField DataField="vendor_end_date" HeaderText="vendor_end_date" InsertVisible="False" ReadOnly="True" SortExpression="vendor_end_date" Visible="false" />
                            <asp:BoundField DataField="vendor_meth_of_contact" HeaderText="vendor_meth_of_contact" InsertVisible="False" ReadOnly="True" SortExpression="vendor_meth_of_contact" Visible="false" />
                            <asp:BoundField DataField="vendor_status" HeaderText="vendor_status" InsertVisible="False" ReadOnly="True" SortExpression="vendor_status" Visible="false" />
                            <asp:BoundField DataField="vendor_meth_of_pay" HeaderText="vendor_meth_of_pay" InsertVisible="False" ReadOnly="True" SortExpression="vendor_meth_of_pay" Visible="false" />
                            <asp:BoundField DataField="vendor_type" HeaderText="vendor_type" InsertVisible="False" ReadOnly="True" SortExpression="vendor_type" Visible="false" />
                            <asp:BoundField DataField="vendor_comments" HeaderText="vendor_comments" InsertVisible="False" ReadOnly="True" SortExpression="vendor_comments" Visible="false" />
                            <asp:BoundField DataField="primary_fName" HeaderText="primary_fName" InsertVisible="False" ReadOnly="True" SortExpression="primary_fName" Visible="false" />
                            <asp:BoundField DataField="primary_lName" HeaderText="primary_lName" InsertVisible="False" ReadOnly="True" SortExpression="primary_lName" Visible="false" />
                            <asp:BoundField DataField="primary_phone" HeaderText="primary_phone" InsertVisible="False" ReadOnly="True" SortExpression="primary_phone" Visible="false" />
                            <asp:BoundField DataField="sec_fName" HeaderText="sec_fName" InsertVisible="False" ReadOnly="True" SortExpression="sec_fName" Visible="false" />
                            <asp:BoundField DataField="sec_lName" HeaderText="sec_lName" InsertVisible="False" ReadOnly="True" SortExpression="sec_lName" Visible="false" />
                            <asp:BoundField DataField="sec_phone" HeaderText="sec_phone" InsertVisible="False" ReadOnly="True" SortExpression="sec_phone" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [vendor_id], [vendor_name], [phone_num], [email], [address_id], [Vendor_address2], [vendor_job_assign], [vendor_start_date], [vendor_end_date], [vendor_meth_of_contact], [vendor_status], [vendor_meth_of_pay], [vendor_type], [vendor_comments], [primary_fName], [primary_lName], [primary_phone], [sec_fName], [sec_lName], [sec_phone] FROM [vendor]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_vendor_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_vendor_InfoHead_label" Style="padding: 10px" runat="server" Text="vendor Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_vendor_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_name_lbl" runat="server" Font-Size="Large" Text="vendor_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_phone_num_lbl" runat="server" Font-Size="Large" Text="phone_num:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_phone_num_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_email_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Vendor_address2_lbl" runat="server" Font-Size="Large" Text="Vendor_address2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Vendor_address2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_job_assign_lbl" runat="server" Font-Size="Large" Text="vendor_job_assign:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_job_assign_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_start_date_lbl" runat="server" Font-Size="Large" Text="vendor_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_end_date_lbl" runat="server" Font-Size="Large" Text="vendor_end_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_end_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_meth_of_contact_lbl" runat="server" Font-Size="Large" Text="vendor_meth_of_contact:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_meth_of_contact_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_status_lbl" runat="server" Font-Size="Large" Text="vendor_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_meth_of_pay_lbl" runat="server" Font-Size="Large" Text="vendor_meth_of_pay:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_meth_of_pay_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_type_lbl" runat="server" Font-Size="Large" Text="vendor_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vendor_comments_lbl" runat="server" Font-Size="Large" Text="vendor_comments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vendor_comments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_primary_fName_lbl" runat="server" Font-Size="Large" Text="primary_fName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_primary_fName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_primary_lName_lbl" runat="server" Font-Size="Large" Text="primary_lName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_primary_lName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_primary_phone_lbl" runat="server" Font-Size="Large" Text="primary_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_primary_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_sec_fName_lbl" runat="server" Font-Size="Large" Text="sec_fName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_sec_fName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_sec_lName_lbl" runat="server" Font-Size="Large" Text="sec_lName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_sec_lName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_sec_phone_lbl" runat="server" Font-Size="Large" Text="sec_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_sec_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpevendorInfo" runat="server" CollapseControlID="Insert_vendor_InfoHead" CollapsedText="Show vendor Information" Enabled="True" ExpandControlID="Insert_vendor_InfoHead" ExpandedText="vendor Information" TargetControlID="Insert_vendor_InfoBody" TextLabelID="Insert_vendor_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_vendor_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="vendor_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="vendor_id" HeaderText="vendor_id" InsertVisible="False" ReadOnly="True" SortExpression="vendor_id" />
                            <asp:BoundField DataField="vendor_name" HeaderText="vendor_name" InsertVisible="False" ReadOnly="True" SortExpression="vendor_name" />
                            <asp:BoundField DataField="phone_num" HeaderText="phone_num" InsertVisible="False" ReadOnly="True" SortExpression="phone_num" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
                            <asp:BoundField DataField="Vendor_address2" HeaderText="Vendor_address2" InsertVisible="False" ReadOnly="True" SortExpression="Vendor_address2" Visible="false" />
                            <asp:BoundField DataField="vendor_job_assign" HeaderText="vendor_job_assign" InsertVisible="False" ReadOnly="True" SortExpression="vendor_job_assign" Visible="false" />
                            <asp:BoundField DataField="vendor_start_date" HeaderText="vendor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="vendor_start_date" Visible="false" />
                            <asp:BoundField DataField="vendor_end_date" HeaderText="vendor_end_date" InsertVisible="False" ReadOnly="True" SortExpression="vendor_end_date" Visible="false" />
                            <asp:BoundField DataField="vendor_meth_of_contact" HeaderText="vendor_meth_of_contact" InsertVisible="False" ReadOnly="True" SortExpression="vendor_meth_of_contact" Visible="false" />
                            <asp:BoundField DataField="vendor_status" HeaderText="vendor_status" InsertVisible="False" ReadOnly="True" SortExpression="vendor_status" Visible="false" />
                            <asp:BoundField DataField="vendor_meth_of_pay" HeaderText="vendor_meth_of_pay" InsertVisible="False" ReadOnly="True" SortExpression="vendor_meth_of_pay" Visible="false" />
                            <asp:BoundField DataField="vendor_type" HeaderText="vendor_type" InsertVisible="False" ReadOnly="True" SortExpression="vendor_type" Visible="false" />
                            <asp:BoundField DataField="vendor_comments" HeaderText="vendor_comments" InsertVisible="False" ReadOnly="True" SortExpression="vendor_comments" Visible="false" />
                            <asp:BoundField DataField="primary_fName" HeaderText="primary_fName" InsertVisible="False" ReadOnly="True" SortExpression="primary_fName" Visible="false" />
                            <asp:BoundField DataField="primary_lName" HeaderText="primary_lName" InsertVisible="False" ReadOnly="True" SortExpression="primary_lName" Visible="false" />
                            <asp:BoundField DataField="primary_phone" HeaderText="primary_phone" InsertVisible="False" ReadOnly="True" SortExpression="primary_phone" Visible="false" />
                            <asp:BoundField DataField="sec_fName" HeaderText="sec_fName" InsertVisible="False" ReadOnly="True" SortExpression="sec_fName" Visible="false" />
                            <asp:BoundField DataField="sec_lName" HeaderText="sec_lName" InsertVisible="False" ReadOnly="True" SortExpression="sec_lName" Visible="false" />
                            <asp:BoundField DataField="sec_phone" HeaderText="sec_phone" InsertVisible="False" ReadOnly="True" SortExpression="sec_phone" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [vendor_id], [vendor_name], [phone_num], [email], [address_id], [Vendor_address2], [vendor_job_assign], [vendor_start_date], [vendor_end_date], [vendor_meth_of_contact], [vendor_status], [vendor_meth_of_pay], [vendor_type], [vendor_comments], [primary_fName], [primary_lName], [primary_phone], [sec_fName], [sec_lName], [sec_phone] FROM [vendor]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_vendor_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_vendor_InfoHead_label" Style="padding: 10px" runat="server" Text="vendor Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_vendor_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_id_lbl" runat="server" Font-Size="Large" Text="vendor_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_name_lbl" runat="server" Font-Size="Large" Text="vendor_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_phone_num_lbl" runat="server" Font-Size="Large" Text="phone_num:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_phone_num_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_email_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Vendor_address2_lbl" runat="server" Font-Size="Large" Text="Vendor_address2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Vendor_address2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_job_assign_lbl" runat="server" Font-Size="Large" Text="vendor_job_assign:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_job_assign_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_start_date_lbl" runat="server" Font-Size="Large" Text="vendor_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_end_date_lbl" runat="server" Font-Size="Large" Text="vendor_end_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_end_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_meth_of_contact_lbl" runat="server" Font-Size="Large" Text="vendor_meth_of_contact:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_meth_of_contact_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_status_lbl" runat="server" Font-Size="Large" Text="vendor_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_meth_of_pay_lbl" runat="server" Font-Size="Large" Text="vendor_meth_of_pay:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_meth_of_pay_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_type_lbl" runat="server" Font-Size="Large" Text="vendor_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vendor_comments_lbl" runat="server" Font-Size="Large" Text="vendor_comments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vendor_comments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_primary_fName_lbl" runat="server" Font-Size="Large" Text="primary_fName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_primary_fName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_primary_lName_lbl" runat="server" Font-Size="Large" Text="primary_lName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_primary_lName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_primary_phone_lbl" runat="server" Font-Size="Large" Text="primary_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_primary_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_sec_fName_lbl" runat="server" Font-Size="Large" Text="sec_fName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_sec_fName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_sec_lName_lbl" runat="server" Font-Size="Large" Text="sec_lName:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_sec_lName_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_sec_phone_lbl" runat="server" Font-Size="Large" Text="sec_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_sec_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpevendorInfo" runat="server" CollapseControlID="Update_vendor_InfoHead" CollapsedText="Show vendor Information" Enabled="True" ExpandControlID="Update_vendor_InfoHead" ExpandedText="vendor Information" TargetControlID="Update_vendor_InfoBody" TextLabelID="Update_vendor_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_vendor_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="vendor_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="vendor_id" HeaderText="vendor_id" InsertVisible="False" ReadOnly="True" SortExpression="vendor_id" />
                            <asp:BoundField DataField="vendor_name" HeaderText="vendor_name" InsertVisible="False" ReadOnly="True" SortExpression="vendor_name" />
                            <asp:BoundField DataField="phone_num" HeaderText="phone_num" InsertVisible="False" ReadOnly="True" SortExpression="phone_num" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
                            <asp:BoundField DataField="Vendor_address2" HeaderText="Vendor_address2" InsertVisible="False" ReadOnly="True" SortExpression="Vendor_address2" Visible="false" />
                            <asp:BoundField DataField="vendor_job_assign" HeaderText="vendor_job_assign" InsertVisible="False" ReadOnly="True" SortExpression="vendor_job_assign" Visible="false" />
                            <asp:BoundField DataField="vendor_start_date" HeaderText="vendor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="vendor_start_date" Visible="false" />
                            <asp:BoundField DataField="vendor_end_date" HeaderText="vendor_end_date" InsertVisible="False" ReadOnly="True" SortExpression="vendor_end_date" Visible="false" />
                            <asp:BoundField DataField="vendor_meth_of_contact" HeaderText="vendor_meth_of_contact" InsertVisible="False" ReadOnly="True" SortExpression="vendor_meth_of_contact" Visible="false" />
                            <asp:BoundField DataField="vendor_status" HeaderText="vendor_status" InsertVisible="False" ReadOnly="True" SortExpression="vendor_status" Visible="false" />
                            <asp:BoundField DataField="vendor_meth_of_pay" HeaderText="vendor_meth_of_pay" InsertVisible="False" ReadOnly="True" SortExpression="vendor_meth_of_pay" Visible="false" />
                            <asp:BoundField DataField="vendor_type" HeaderText="vendor_type" InsertVisible="False" ReadOnly="True" SortExpression="vendor_type" Visible="false" />
                            <asp:BoundField DataField="vendor_comments" HeaderText="vendor_comments" InsertVisible="False" ReadOnly="True" SortExpression="vendor_comments" Visible="false" />
                            <asp:BoundField DataField="primary_fName" HeaderText="primary_fName" InsertVisible="False" ReadOnly="True" SortExpression="primary_fName" Visible="false" />
                            <asp:BoundField DataField="primary_lName" HeaderText="primary_lName" InsertVisible="False" ReadOnly="True" SortExpression="primary_lName" Visible="false" />
                            <asp:BoundField DataField="primary_phone" HeaderText="primary_phone" InsertVisible="False" ReadOnly="True" SortExpression="primary_phone" Visible="false" />
                            <asp:BoundField DataField="sec_fName" HeaderText="sec_fName" InsertVisible="False" ReadOnly="True" SortExpression="sec_fName" Visible="false" />
                            <asp:BoundField DataField="sec_lName" HeaderText="sec_lName" InsertVisible="False" ReadOnly="True" SortExpression="sec_lName" Visible="false" />
                            <asp:BoundField DataField="sec_phone" HeaderText="sec_phone" InsertVisible="False" ReadOnly="True" SortExpression="sec_phone" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [vendor_id], [vendor_name], [phone_num], [email], [address_id], [Vendor_address2], [vendor_job_assign], [vendor_start_date], [vendor_end_date], [vendor_meth_of_contact], [vendor_status], [vendor_meth_of_pay], [vendor_type], [vendor_comments], [primary_fName], [primary_lName], [primary_phone], [sec_fName], [sec_lName], [sec_phone] FROM [vendor]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_vendor_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_vendor_InfoHead_label" Style="padding: 10px" runat="server" Text="vendor Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_vendor_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_id_lbl" runat="server" Font-Size="Large" Text="vendor_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_name_lbl" runat="server" Font-Size="Large" Text="vendor_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_phone_num_lbl" runat="server" Font-Size="Large" Text="phone_num:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_phone_num_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_email_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Vendor_address2_lbl" runat="server" Font-Size="Large" Text="Vendor_address2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Vendor_address2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_job_assign_lbl" runat="server" Font-Size="Large" Text="vendor_job_assign:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_job_assign_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_start_date_lbl" runat="server" Font-Size="Large" Text="vendor_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_start_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_end_date_lbl" runat="server" Font-Size="Large" Text="vendor_end_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_end_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_meth_of_contact_lbl" runat="server" Font-Size="Large" Text="vendor_meth_of_contact:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_meth_of_contact_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_status_lbl" runat="server" Font-Size="Large" Text="vendor_status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_meth_of_pay_lbl" runat="server" Font-Size="Large" Text="vendor_meth_of_pay:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_meth_of_pay_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_type_lbl" runat="server" Font-Size="Large" Text="vendor_type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vendor_comments_lbl" runat="server" Font-Size="Large" Text="vendor_comments:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vendor_comments_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_primary_fName_lbl" runat="server" Font-Size="Large" Text="primary_fName:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_primary_fName_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_primary_lName_lbl" runat="server" Font-Size="Large" Text="primary_lName:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_primary_lName_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_primary_phone_lbl" runat="server" Font-Size="Large" Text="primary_phone:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_primary_phone_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_sec_fName_lbl" runat="server" Font-Size="Large" Text="sec_fName:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_sec_fName_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_sec_lName_lbl" runat="server" Font-Size="Large" Text="sec_lName:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_sec_lName_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_sec_phone_lbl" runat="server" Font-Size="Large" Text="sec_phone:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_sec_phone_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpevendorInfo" runat="server" CollapseControlID="Delete_vendor_InfoHead" CollapsedText="Show vendor Information" Enabled="True" ExpandControlID="Delete_vendor_InfoHead" ExpandedText="vendor Information" TargetControlID="Delete_vendor_InfoBody" TextLabelID="Delete_vendor_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

