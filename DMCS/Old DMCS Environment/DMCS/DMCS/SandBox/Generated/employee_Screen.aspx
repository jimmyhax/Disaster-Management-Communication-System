<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="employee_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.employee_Screen" %>
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
                                        <asp:GridView ID="Insert_employee_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="employee_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                            <asp:BoundField DataField="employee_date_hired" HeaderText="employee_date_hired" InsertVisible="False" ReadOnly="True" SortExpression="employee_date_hired" />
                            <asp:BoundField DataField="employee_department" HeaderText="employee_department" InsertVisible="False" ReadOnly="True" SortExpression="employee_department" />
                            <asp:BoundField DataField="employee_hours_worked" HeaderText="employee_hours_worked" InsertVisible="False" ReadOnly="True" SortExpression="employee_hours_worked" Visible="false" />
                            <asp:BoundField DataField="employee_leadership" HeaderText="employee_leadership" InsertVisible="False" ReadOnly="True" SortExpression="employee_leadership" Visible="false" />
                            <asp:BoundField DataField="employee_motivation" HeaderText="employee_motivation" InsertVisible="False" ReadOnly="True" SortExpression="employee_motivation" Visible="false" />
                            <asp:BoundField DataField="employee_notes" HeaderText="employee_notes" InsertVisible="False" ReadOnly="True" SortExpression="employee_notes" Visible="false" />
                            <asp:BoundField DataField="employee_overall" HeaderText="employee_overall" InsertVisible="False" ReadOnly="True" SortExpression="employee_overall" Visible="false" />
                            <asp:BoundField DataField="employee_payrate" HeaderText="employee_payrate" InsertVisible="False" ReadOnly="True" SortExpression="employee_payrate" Visible="false" />
                            <asp:BoundField DataField="employee_performance" HeaderText="employee_performance" InsertVisible="False" ReadOnly="True" SortExpression="employee_performance" Visible="false" />
                            <asp:BoundField DataField="employee_quality" HeaderText="employee_quality" InsertVisible="False" ReadOnly="True" SortExpression="employee_quality" Visible="false" />
                            <asp:BoundField DataField="employee_timeliness" HeaderText="employee_timeliness" InsertVisible="False" ReadOnly="True" SortExpression="employee_timeliness" Visible="false" />
                            <asp:BoundField DataField="username" HeaderText="username" InsertVisible="False" ReadOnly="True" SortExpression="username" Visible="false" />
                            <asp:BoundField DataField="pswd" HeaderText="pswd" InsertVisible="False" ReadOnly="True" SortExpression="pswd" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [employee_id], [employee_date_hired], [employee_department], [employee_hours_worked], [employee_leadership], [employee_motivation], [employee_notes], [employee_overall], [employee_payrate], [employee_performance], [employee_quality], [employee_timeliness], [username], [pswd] FROM [employee]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_employee_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_employee_InfoHead_label" Style="padding: 10px" runat="server" Text="employee Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_employee_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_date_hired_lbl" runat="server" Font-Size="Large" Text="employee_date_hired:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_date_hired_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_department_lbl" runat="server" Font-Size="Large" Text="employee_department:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_department_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_hours_worked_lbl" runat="server" Font-Size="Large" Text="employee_hours_worked:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_hours_worked_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_leadership_lbl" runat="server" Font-Size="Large" Text="employee_leadership:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_leadership_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_motivation_lbl" runat="server" Font-Size="Large" Text="employee_motivation:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_motivation_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_notes_lbl" runat="server" Font-Size="Large" Text="employee_notes:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_notes_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_overall_lbl" runat="server" Font-Size="Large" Text="employee_overall:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_overall_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_payrate_lbl" runat="server" Font-Size="Large" Text="employee_payrate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_payrate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_performance_lbl" runat="server" Font-Size="Large" Text="employee_performance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_performance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_quality_lbl" runat="server" Font-Size="Large" Text="employee_quality:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_quality_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employee_timeliness_lbl" runat="server" Font-Size="Large" Text="employee_timeliness:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employee_timeliness_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_username_lbl" runat="server" Font-Size="Large" Text="username:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_username_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_pswd_lbl" runat="server" Font-Size="Large" Text="pswd:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_pswd_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeemployeeInfo" runat="server" CollapseControlID="Insert_employee_InfoHead" CollapsedText="Show employee Information" Enabled="True" ExpandControlID="Insert_employee_InfoHead" ExpandedText="employee Information" TargetControlID="Insert_employee_InfoBody" TextLabelID="Insert_employee_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_employee_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="employee_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                            <asp:BoundField DataField="employee_date_hired" HeaderText="employee_date_hired" InsertVisible="False" ReadOnly="True" SortExpression="employee_date_hired" />
                            <asp:BoundField DataField="employee_department" HeaderText="employee_department" InsertVisible="False" ReadOnly="True" SortExpression="employee_department" />
                            <asp:BoundField DataField="employee_hours_worked" HeaderText="employee_hours_worked" InsertVisible="False" ReadOnly="True" SortExpression="employee_hours_worked" Visible="false" />
                            <asp:BoundField DataField="employee_leadership" HeaderText="employee_leadership" InsertVisible="False" ReadOnly="True" SortExpression="employee_leadership" Visible="false" />
                            <asp:BoundField DataField="employee_motivation" HeaderText="employee_motivation" InsertVisible="False" ReadOnly="True" SortExpression="employee_motivation" Visible="false" />
                            <asp:BoundField DataField="employee_notes" HeaderText="employee_notes" InsertVisible="False" ReadOnly="True" SortExpression="employee_notes" Visible="false" />
                            <asp:BoundField DataField="employee_overall" HeaderText="employee_overall" InsertVisible="False" ReadOnly="True" SortExpression="employee_overall" Visible="false" />
                            <asp:BoundField DataField="employee_payrate" HeaderText="employee_payrate" InsertVisible="False" ReadOnly="True" SortExpression="employee_payrate" Visible="false" />
                            <asp:BoundField DataField="employee_performance" HeaderText="employee_performance" InsertVisible="False" ReadOnly="True" SortExpression="employee_performance" Visible="false" />
                            <asp:BoundField DataField="employee_quality" HeaderText="employee_quality" InsertVisible="False" ReadOnly="True" SortExpression="employee_quality" Visible="false" />
                            <asp:BoundField DataField="employee_timeliness" HeaderText="employee_timeliness" InsertVisible="False" ReadOnly="True" SortExpression="employee_timeliness" Visible="false" />
                            <asp:BoundField DataField="username" HeaderText="username" InsertVisible="False" ReadOnly="True" SortExpression="username" Visible="false" />
                            <asp:BoundField DataField="pswd" HeaderText="pswd" InsertVisible="False" ReadOnly="True" SortExpression="pswd" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [employee_id], [employee_date_hired], [employee_department], [employee_hours_worked], [employee_leadership], [employee_motivation], [employee_notes], [employee_overall], [employee_payrate], [employee_performance], [employee_quality], [employee_timeliness], [username], [pswd] FROM [employee]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_employee_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_employee_InfoHead_label" Style="padding: 10px" runat="server" Text="employee Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_employee_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_id_lbl" runat="server" Font-Size="Large" Text="employee_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_date_hired_lbl" runat="server" Font-Size="Large" Text="employee_date_hired:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_date_hired_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_department_lbl" runat="server" Font-Size="Large" Text="employee_department:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_department_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_hours_worked_lbl" runat="server" Font-Size="Large" Text="employee_hours_worked:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_hours_worked_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_leadership_lbl" runat="server" Font-Size="Large" Text="employee_leadership:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_leadership_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_motivation_lbl" runat="server" Font-Size="Large" Text="employee_motivation:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_motivation_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_notes_lbl" runat="server" Font-Size="Large" Text="employee_notes:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_notes_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_overall_lbl" runat="server" Font-Size="Large" Text="employee_overall:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_overall_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_payrate_lbl" runat="server" Font-Size="Large" Text="employee_payrate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_payrate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_performance_lbl" runat="server" Font-Size="Large" Text="employee_performance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_performance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_quality_lbl" runat="server" Font-Size="Large" Text="employee_quality:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_quality_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employee_timeliness_lbl" runat="server" Font-Size="Large" Text="employee_timeliness:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employee_timeliness_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_username_lbl" runat="server" Font-Size="Large" Text="username:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_username_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_pswd_lbl" runat="server" Font-Size="Large" Text="pswd:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_pswd_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeemployeeInfo" runat="server" CollapseControlID="Update_employee_InfoHead" CollapsedText="Show employee Information" Enabled="True" ExpandControlID="Update_employee_InfoHead" ExpandedText="employee Information" TargetControlID="Update_employee_InfoBody" TextLabelID="Update_employee_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_employee_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="employee_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                            <asp:BoundField DataField="employee_date_hired" HeaderText="employee_date_hired" InsertVisible="False" ReadOnly="True" SortExpression="employee_date_hired" />
                            <asp:BoundField DataField="employee_department" HeaderText="employee_department" InsertVisible="False" ReadOnly="True" SortExpression="employee_department" />
                            <asp:BoundField DataField="employee_hours_worked" HeaderText="employee_hours_worked" InsertVisible="False" ReadOnly="True" SortExpression="employee_hours_worked" Visible="false" />
                            <asp:BoundField DataField="employee_leadership" HeaderText="employee_leadership" InsertVisible="False" ReadOnly="True" SortExpression="employee_leadership" Visible="false" />
                            <asp:BoundField DataField="employee_motivation" HeaderText="employee_motivation" InsertVisible="False" ReadOnly="True" SortExpression="employee_motivation" Visible="false" />
                            <asp:BoundField DataField="employee_notes" HeaderText="employee_notes" InsertVisible="False" ReadOnly="True" SortExpression="employee_notes" Visible="false" />
                            <asp:BoundField DataField="employee_overall" HeaderText="employee_overall" InsertVisible="False" ReadOnly="True" SortExpression="employee_overall" Visible="false" />
                            <asp:BoundField DataField="employee_payrate" HeaderText="employee_payrate" InsertVisible="False" ReadOnly="True" SortExpression="employee_payrate" Visible="false" />
                            <asp:BoundField DataField="employee_performance" HeaderText="employee_performance" InsertVisible="False" ReadOnly="True" SortExpression="employee_performance" Visible="false" />
                            <asp:BoundField DataField="employee_quality" HeaderText="employee_quality" InsertVisible="False" ReadOnly="True" SortExpression="employee_quality" Visible="false" />
                            <asp:BoundField DataField="employee_timeliness" HeaderText="employee_timeliness" InsertVisible="False" ReadOnly="True" SortExpression="employee_timeliness" Visible="false" />
                            <asp:BoundField DataField="username" HeaderText="username" InsertVisible="False" ReadOnly="True" SortExpression="username" Visible="false" />
                            <asp:BoundField DataField="pswd" HeaderText="pswd" InsertVisible="False" ReadOnly="True" SortExpression="pswd" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [employee_id], [employee_date_hired], [employee_department], [employee_hours_worked], [employee_leadership], [employee_motivation], [employee_notes], [employee_overall], [employee_payrate], [employee_performance], [employee_quality], [employee_timeliness], [username], [pswd] FROM [employee]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_employee_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_employee_InfoHead_label" Style="padding: 10px" runat="server" Text="employee Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_employee_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_id_lbl" runat="server" Font-Size="Large" Text="employee_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_date_hired_lbl" runat="server" Font-Size="Large" Text="employee_date_hired:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_date_hired_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_department_lbl" runat="server" Font-Size="Large" Text="employee_department:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_department_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_hours_worked_lbl" runat="server" Font-Size="Large" Text="employee_hours_worked:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_hours_worked_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_leadership_lbl" runat="server" Font-Size="Large" Text="employee_leadership:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_leadership_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_motivation_lbl" runat="server" Font-Size="Large" Text="employee_motivation:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_motivation_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_notes_lbl" runat="server" Font-Size="Large" Text="employee_notes:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_notes_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_overall_lbl" runat="server" Font-Size="Large" Text="employee_overall:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_overall_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_payrate_lbl" runat="server" Font-Size="Large" Text="employee_payrate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_payrate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_performance_lbl" runat="server" Font-Size="Large" Text="employee_performance:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_performance_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_quality_lbl" runat="server" Font-Size="Large" Text="employee_quality:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_quality_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employee_timeliness_lbl" runat="server" Font-Size="Large" Text="employee_timeliness:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employee_timeliness_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_username_lbl" runat="server" Font-Size="Large" Text="username:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_username_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_pswd_lbl" runat="server" Font-Size="Large" Text="pswd:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_pswd_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeemployeeInfo" runat="server" CollapseControlID="Delete_employee_InfoHead" CollapsedText="Show employee Information" Enabled="True" ExpandControlID="Delete_employee_InfoHead" ExpandedText="employee Information" TargetControlID="Delete_employee_InfoBody" TextLabelID="Delete_employee_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

