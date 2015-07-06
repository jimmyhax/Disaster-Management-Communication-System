<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="personDMCS.aspx.cs" Inherits="DMCS.personDMCS_" %>
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
                                        <asp:GridView ID="Insert_personDMCS_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Person_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Person_ID" HeaderText="Person_ID" InsertVisible="False" ReadOnly="True" SortExpression="Person_ID" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" />
                            <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                            <asp:BoundField DataField="address" HeaderText="address" InsertVisible="False" ReadOnly="True" SortExpression="address" Visible="false" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" Visible="false" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="zipcode" HeaderText="zipcode" InsertVisible="False" ReadOnly="True" SortExpression="zipcode" Visible="false" />
                            <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="creditcard" HeaderText="creditcard" InsertVisible="False" ReadOnly="True" SortExpression="creditcard" Visible="false" />
                            <asp:BoundField DataField="availability_date" HeaderText="availability_date" InsertVisible="False" ReadOnly="True" SortExpression="availability_date" Visible="false" />
                            <asp:BoundField DataField="availability_hours" HeaderText="availability_hours" InsertVisible="False" ReadOnly="True" SortExpression="availability_hours" Visible="false" />
                            <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                            <asp:BoundField DataField="marital_status" HeaderText="marital_status" InsertVisible="False" ReadOnly="True" SortExpression="marital_status" Visible="false" />
                            <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                            <asp:BoundField DataField="jobtitle" HeaderText="jobtitle" InsertVisible="False" ReadOnly="True" SortExpression="jobtitle" Visible="false" />
                            <asp:BoundField DataField="workdate" HeaderText="workdate" InsertVisible="False" ReadOnly="True" SortExpression="workdate" Visible="false" />
                            <asp:BoundField DataField="regpay" HeaderText="regpay" InsertVisible="False" ReadOnly="True" SortExpression="regpay" Visible="false" />
                            <asp:BoundField DataField="OT" HeaderText="OT" InsertVisible="False" ReadOnly="True" SortExpression="OT" Visible="false" />
                            <asp:BoundField DataField="OT_rate" HeaderText="OT_rate" InsertVisible="False" ReadOnly="True" SortExpression="OT_rate" Visible="false" />
                            <asp:BoundField DataField="hourly_rate" HeaderText="hourly_rate" InsertVisible="False" ReadOnly="True" SortExpression="hourly_rate" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Person_ID], [Resource_ID], [f_name], [l_name], [address], [city], [state], [zipcode], [phone_primary], [email], [creditcard], [availability_date], [availability_hours], [birthdate], [marital_status], [gender], [jobtitle], [workdate], [regpay], [OT], [OT_rate], [hourly_rate] FROM [personDMCS]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_personDMCS_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_personDMCS_InfoHead_label" Style="padding: 10px" runat="server" Text="personDMCS Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_personDMCS_InfoBody" runat="server" style="overflow:hidden;">
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
                                                     <asp:Label ID="Insert_f_name_lbl" runat="server" Font-Size="Large" Text="f_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_f_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_l_name_lbl" runat="server" Font-Size="Large" Text="l_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_l_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_lbl" runat="server" Font-Size="Large" Text="address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
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
                                                     <asp:Label ID="Insert_zipcode_lbl" runat="server" Font-Size="Large" Text="zipcode:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_zipcode_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_phone_primary_lbl" runat="server" Font-Size="Large" Text="phone_primary:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_phone_primary_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_email_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_creditcard_lbl" runat="server" Font-Size="Large" Text="creditcard:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_creditcard_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_availability_date_lbl" runat="server" Font-Size="Large" Text="availability_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_availability_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_availability_hours_lbl" runat="server" Font-Size="Large" Text="availability_hours:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_availability_hours_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_birthdate_lbl" runat="server" Font-Size="Large" Text="birthdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_birthdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_marital_status_lbl" runat="server" Font-Size="Large" Text="marital_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_marital_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_gender_lbl" runat="server" Font-Size="Large" Text="gender:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_gender_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_jobtitle_lbl" runat="server" Font-Size="Large" Text="jobtitle:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_jobtitle_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_workdate_lbl" runat="server" Font-Size="Large" Text="workdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_workdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_regpay_lbl" runat="server" Font-Size="Large" Text="regpay:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_regpay_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_OT_lbl" runat="server" Font-Size="Large" Text="OT:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_OT_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_OT_rate_lbl" runat="server" Font-Size="Large" Text="OT_rate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_OT_rate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_hourly_rate_lbl" runat="server" Font-Size="Large" Text="hourly_rate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_hourly_rate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpepersonDMCSInfo" runat="server" CollapseControlID="Insert_personDMCS_InfoHead" CollapsedText="Show personDMCS Information" Enabled="True" ExpandControlID="Insert_personDMCS_InfoHead" ExpandedText="personDMCS Information" TargetControlID="Insert_personDMCS_InfoBody" TextLabelID="Insert_personDMCS_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_personDMCS_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Person_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Person_ID" HeaderText="Person_ID" InsertVisible="False" ReadOnly="True" SortExpression="Person_ID" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" />
                            <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                            <asp:BoundField DataField="address" HeaderText="address" InsertVisible="False" ReadOnly="True" SortExpression="address" Visible="false" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" Visible="false" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="zipcode" HeaderText="zipcode" InsertVisible="False" ReadOnly="True" SortExpression="zipcode" Visible="false" />
                            <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="creditcard" HeaderText="creditcard" InsertVisible="False" ReadOnly="True" SortExpression="creditcard" Visible="false" />
                            <asp:BoundField DataField="availability_date" HeaderText="availability_date" InsertVisible="False" ReadOnly="True" SortExpression="availability_date" Visible="false" />
                            <asp:BoundField DataField="availability_hours" HeaderText="availability_hours" InsertVisible="False" ReadOnly="True" SortExpression="availability_hours" Visible="false" />
                            <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                            <asp:BoundField DataField="marital_status" HeaderText="marital_status" InsertVisible="False" ReadOnly="True" SortExpression="marital_status" Visible="false" />
                            <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                            <asp:BoundField DataField="jobtitle" HeaderText="jobtitle" InsertVisible="False" ReadOnly="True" SortExpression="jobtitle" Visible="false" />
                            <asp:BoundField DataField="workdate" HeaderText="workdate" InsertVisible="False" ReadOnly="True" SortExpression="workdate" Visible="false" />
                            <asp:BoundField DataField="regpay" HeaderText="regpay" InsertVisible="False" ReadOnly="True" SortExpression="regpay" Visible="false" />
                            <asp:BoundField DataField="OT" HeaderText="OT" InsertVisible="False" ReadOnly="True" SortExpression="OT" Visible="false" />
                            <asp:BoundField DataField="OT_rate" HeaderText="OT_rate" InsertVisible="False" ReadOnly="True" SortExpression="OT_rate" Visible="false" />
                            <asp:BoundField DataField="hourly_rate" HeaderText="hourly_rate" InsertVisible="False" ReadOnly="True" SortExpression="hourly_rate" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Person_ID], [Resource_ID], [f_name], [l_name], [address], [city], [state], [zipcode], [phone_primary], [email], [creditcard], [availability_date], [availability_hours], [birthdate], [marital_status], [gender], [jobtitle], [workdate], [regpay], [OT], [OT_rate], [hourly_rate] FROM [personDMCS]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_personDMCS_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_personDMCS_InfoHead_label" Style="padding: 10px" runat="server" Text="personDMCS Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_personDMCS_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Person_ID_lbl" runat="server" Font-Size="Large" Text="Person_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Person_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_f_name_lbl" runat="server" Font-Size="Large" Text="f_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_f_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_l_name_lbl" runat="server" Font-Size="Large" Text="l_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_l_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_lbl" runat="server" Font-Size="Large" Text="address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_zipcode_lbl" runat="server" Font-Size="Large" Text="zipcode:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_zipcode_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_phone_primary_lbl" runat="server" Font-Size="Large" Text="phone_primary:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_phone_primary_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_email_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_creditcard_lbl" runat="server" Font-Size="Large" Text="creditcard:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_creditcard_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_availability_date_lbl" runat="server" Font-Size="Large" Text="availability_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_availability_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_availability_hours_lbl" runat="server" Font-Size="Large" Text="availability_hours:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_availability_hours_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_birthdate_lbl" runat="server" Font-Size="Large" Text="birthdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_birthdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_marital_status_lbl" runat="server" Font-Size="Large" Text="marital_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_marital_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_gender_lbl" runat="server" Font-Size="Large" Text="gender:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_gender_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_jobtitle_lbl" runat="server" Font-Size="Large" Text="jobtitle:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_jobtitle_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_workdate_lbl" runat="server" Font-Size="Large" Text="workdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_workdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_regpay_lbl" runat="server" Font-Size="Large" Text="regpay:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_regpay_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_OT_lbl" runat="server" Font-Size="Large" Text="OT:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_OT_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_OT_rate_lbl" runat="server" Font-Size="Large" Text="OT_rate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_OT_rate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_hourly_rate_lbl" runat="server" Font-Size="Large" Text="hourly_rate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_hourly_rate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpepersonDMCSInfo" runat="server" CollapseControlID="Update_personDMCS_InfoHead" CollapsedText="Show personDMCS Information" Enabled="True" ExpandControlID="Update_personDMCS_InfoHead" ExpandedText="personDMCS Information" TargetControlID="Update_personDMCS_InfoBody" TextLabelID="Update_personDMCS_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_personDMCS_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Person_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Person_ID" HeaderText="Person_ID" InsertVisible="False" ReadOnly="True" SortExpression="Person_ID" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" />
                            <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                            <asp:BoundField DataField="address" HeaderText="address" InsertVisible="False" ReadOnly="True" SortExpression="address" Visible="false" />
                            <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" Visible="false" />
                            <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                            <asp:BoundField DataField="zipcode" HeaderText="zipcode" InsertVisible="False" ReadOnly="True" SortExpression="zipcode" Visible="false" />
                            <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="creditcard" HeaderText="creditcard" InsertVisible="False" ReadOnly="True" SortExpression="creditcard" Visible="false" />
                            <asp:BoundField DataField="availability_date" HeaderText="availability_date" InsertVisible="False" ReadOnly="True" SortExpression="availability_date" Visible="false" />
                            <asp:BoundField DataField="availability_hours" HeaderText="availability_hours" InsertVisible="False" ReadOnly="True" SortExpression="availability_hours" Visible="false" />
                            <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                            <asp:BoundField DataField="marital_status" HeaderText="marital_status" InsertVisible="False" ReadOnly="True" SortExpression="marital_status" Visible="false" />
                            <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                            <asp:BoundField DataField="jobtitle" HeaderText="jobtitle" InsertVisible="False" ReadOnly="True" SortExpression="jobtitle" Visible="false" />
                            <asp:BoundField DataField="workdate" HeaderText="workdate" InsertVisible="False" ReadOnly="True" SortExpression="workdate" Visible="false" />
                            <asp:BoundField DataField="regpay" HeaderText="regpay" InsertVisible="False" ReadOnly="True" SortExpression="regpay" Visible="false" />
                            <asp:BoundField DataField="OT" HeaderText="OT" InsertVisible="False" ReadOnly="True" SortExpression="OT" Visible="false" />
                            <asp:BoundField DataField="OT_rate" HeaderText="OT_rate" InsertVisible="False" ReadOnly="True" SortExpression="OT_rate" Visible="false" />
                            <asp:BoundField DataField="hourly_rate" HeaderText="hourly_rate" InsertVisible="False" ReadOnly="True" SortExpression="hourly_rate" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Person_ID], [Resource_ID], [f_name], [l_name], [address], [city], [state], [zipcode], [phone_primary], [email], [creditcard], [availability_date], [availability_hours], [birthdate], [marital_status], [gender], [jobtitle], [workdate], [regpay], [OT], [OT_rate], [hourly_rate] FROM [personDMCS]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_personDMCS_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_personDMCS_InfoHead_label" Style="padding: 10px" runat="server" Text="personDMCS Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_personDMCS_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Person_ID_lbl" runat="server" Font-Size="Large" Text="Person_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Person_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Resource_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_f_name_lbl" runat="server" Font-Size="Large" Text="f_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_f_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_l_name_lbl" runat="server" Font-Size="Large" Text="l_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_l_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_lbl" runat="server" Font-Size="Large" Text="address:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_zipcode_lbl" runat="server" Font-Size="Large" Text="zipcode:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_zipcode_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_phone_primary_lbl" runat="server" Font-Size="Large" Text="phone_primary:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_phone_primary_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_email_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_creditcard_lbl" runat="server" Font-Size="Large" Text="creditcard:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_creditcard_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_availability_date_lbl" runat="server" Font-Size="Large" Text="availability_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_availability_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_availability_hours_lbl" runat="server" Font-Size="Large" Text="availability_hours:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_availability_hours_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_birthdate_lbl" runat="server" Font-Size="Large" Text="birthdate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_birthdate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_marital_status_lbl" runat="server" Font-Size="Large" Text="marital_status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_marital_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_gender_lbl" runat="server" Font-Size="Large" Text="gender:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_gender_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_jobtitle_lbl" runat="server" Font-Size="Large" Text="jobtitle:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_jobtitle_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_workdate_lbl" runat="server" Font-Size="Large" Text="workdate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_workdate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_regpay_lbl" runat="server" Font-Size="Large" Text="regpay:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_regpay_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_OT_lbl" runat="server" Font-Size="Large" Text="OT:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_OT_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_OT_rate_lbl" runat="server" Font-Size="Large" Text="OT_rate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_OT_rate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_hourly_rate_lbl" runat="server" Font-Size="Large" Text="hourly_rate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_hourly_rate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpepersonDMCSInfo" runat="server" CollapseControlID="Delete_personDMCS_InfoHead" CollapsedText="Show personDMCS Information" Enabled="True" ExpandControlID="Delete_personDMCS_InfoHead" ExpandedText="personDMCS Information" TargetControlID="Delete_personDMCS_InfoBody" TextLabelID="Delete_personDMCS_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

