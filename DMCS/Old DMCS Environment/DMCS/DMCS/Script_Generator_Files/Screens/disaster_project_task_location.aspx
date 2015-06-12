<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="disaster_project_task_location.aspx.cs" Inherits="DMCS.disaster_project_task_location_" %>
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
                                        <asp:GridView ID="Insert_disaster_project_task_location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="disaster_project_task_location_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="disaster_project_task_location_id" HeaderText="disaster_project_task_location_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_project_task_location_id" />
                            <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                            <asp:BoundField DataField="project_id" HeaderText="project_id" InsertVisible="False" ReadOnly="True" SortExpression="project_id" />
                            <asp:BoundField DataField="task_id" HeaderText="task_id" InsertVisible="False" ReadOnly="True" SortExpression="task_id" Visible="false" />
                            <asp:BoundField DataField="demo_location_id" HeaderText="demo_location_id" InsertVisible="False" ReadOnly="True" SortExpression="demo_location_id" Visible="false" />
                            <asp:BoundField DataField="demo_id" HeaderText="demo_id" InsertVisible="False" ReadOnly="True" SortExpression="demo_id" Visible="false" />
                            <asp:BoundField DataField="est_task_hours" HeaderText="est_task_hours" InsertVisible="False" ReadOnly="True" SortExpression="est_task_hours" Visible="false" />
                            <asp:BoundField DataField="est_task_costs" HeaderText="est_task_costs" InsertVisible="False" ReadOnly="True" SortExpression="est_task_costs" Visible="false" />
                            <asp:BoundField DataField="auth_name_rec_perf_rating" HeaderText="auth_name_rec_perf_rating" InsertVisible="False" ReadOnly="True" SortExpression="auth_name_rec_perf_rating" Visible="false" />
                            <asp:BoundField DataField="date_rec_perf_date" HeaderText="date_rec_perf_date" InsertVisible="False" ReadOnly="True" SortExpression="date_rec_perf_date" Visible="false" />
                            <asp:BoundField DataField="aut_name_review_time" HeaderText="aut_name_review_time" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_review_time" Visible="false" />
                            <asp:BoundField DataField="date_ok_timesh_rep" HeaderText="date_ok_timesh_rep" InsertVisible="False" ReadOnly="True" SortExpression="date_ok_timesh_rep" Visible="false" />
                            <asp:BoundField DataField="auth_name_pay_rel_person" HeaderText="auth_name_pay_rel_person" InsertVisible="False" ReadOnly="True" SortExpression="auth_name_pay_rel_person" Visible="false" />
                            <asp:BoundField DataField="date_person_paid_rel" HeaderText="date_person_paid_rel" InsertVisible="False" ReadOnly="True" SortExpression="date_person_paid_rel" Visible="false" />
                            <asp:BoundField DataField="aut_name_prod_inv_ck_pay_ven" HeaderText="aut_name_prod_inv_ck_pay_ven" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_prod_inv_ck_pay_ven" Visible="false" />
                            <asp:BoundField DataField="aut_name_eq_ret_refurb" HeaderText="aut_name_eq_ret_refurb" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_eq_ret_refurb" Visible="false" />
                            <asp:BoundField DataField="date_prod_inv_rel_ven_paid" HeaderText="date_prod_inv_rel_ven_paid" InsertVisible="False" ReadOnly="True" SortExpression="date_prod_inv_rel_ven_paid" Visible="false" />
                            <asp:BoundField DataField="date_eq_rel_ven_paid" HeaderText="date_eq_rel_ven_paid" InsertVisible="False" ReadOnly="True" SortExpression="date_eq_rel_ven_paid" Visible="false" />
                            <asp:BoundField DataField="task_authorized_name_reimburse" HeaderText="task_authorized_name_reimburse" InsertVisible="False" ReadOnly="True" SortExpression="task_authorized_name_reimburse" Visible="false" />
                            <asp:BoundField DataField="date_task_reimburse" HeaderText="date_task_reimburse" InsertVisible="False" ReadOnly="True" SortExpression="date_task_reimburse" Visible="false" />
                            <asp:BoundField DataField="ok_close_task_name" HeaderText="ok_close_task_name" InsertVisible="False" ReadOnly="True" SortExpression="ok_close_task_name" Visible="false" />
                            <asp:BoundField DataField="close_task_date" HeaderText="close_task_date" InsertVisible="False" ReadOnly="True" SortExpression="close_task_date" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [disaster_project_task_location_id], [disaster_id], [project_id], [task_id], [demo_location_id], [demo_id], [est_task_hours], [est_task_costs], [auth_name_rec_perf_rating], [date_rec_perf_date], [aut_name_review_time], [date_ok_timesh_rep], [auth_name_pay_rel_person], [date_person_paid_rel], [aut_name_prod_inv_ck_pay_ven], [aut_name_eq_ret_refurb], [date_prod_inv_rel_ven_paid], [date_eq_rel_ven_paid], [task_authorized_name_reimburse], [date_task_reimburse], [ok_close_task_name], [close_task_date] FROM [disaster_project_task_location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_disaster_project_task_location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_disaster_project_task_location_InfoHead_label" Style="padding: 10px" runat="server" Text="disaster_project_task_location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_disaster_project_task_location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_disaster_id_lbl" runat="server" Font-Size="Large" Text="disaster_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_disaster_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_project_id_lbl" runat="server" Font-Size="Large" Text="project_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_project_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_task_id_lbl" runat="server" Font-Size="Large" Text="task_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_task_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_demo_location_id_lbl" runat="server" Font-Size="Large" Text="demo_location_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_demo_location_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_demo_id_lbl" runat="server" Font-Size="Large" Text="demo_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_demo_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_est_task_hours_lbl" runat="server" Font-Size="Large" Text="est_task_hours:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_est_task_hours_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_est_task_costs_lbl" runat="server" Font-Size="Large" Text="est_task_costs:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_est_task_costs_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_auth_name_rec_perf_rating_lbl" runat="server" Font-Size="Large" Text="auth_name_rec_perf_rating:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_auth_name_rec_perf_rating_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_rec_perf_date_lbl" runat="server" Font-Size="Large" Text="date_rec_perf_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_rec_perf_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_aut_name_review_time_lbl" runat="server" Font-Size="Large" Text="aut_name_review_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_aut_name_review_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_ok_timesh_rep_lbl" runat="server" Font-Size="Large" Text="date_ok_timesh_rep:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_ok_timesh_rep_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_auth_name_pay_rel_person_lbl" runat="server" Font-Size="Large" Text="auth_name_pay_rel_person:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_auth_name_pay_rel_person_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_person_paid_rel_lbl" runat="server" Font-Size="Large" Text="date_person_paid_rel:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_person_paid_rel_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_aut_name_prod_inv_ck_pay_ven_lbl" runat="server" Font-Size="Large" Text="aut_name_prod_inv_ck_pay_ven:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_aut_name_prod_inv_ck_pay_ven_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_aut_name_eq_ret_refurb_lbl" runat="server" Font-Size="Large" Text="aut_name_eq_ret_refurb:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_aut_name_eq_ret_refurb_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_prod_inv_rel_ven_paid_lbl" runat="server" Font-Size="Large" Text="date_prod_inv_rel_ven_paid:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_prod_inv_rel_ven_paid_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_eq_rel_ven_paid_lbl" runat="server" Font-Size="Large" Text="date_eq_rel_ven_paid:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_eq_rel_ven_paid_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_task_authorized_name_reimburse_lbl" runat="server" Font-Size="Large" Text="task_authorized_name_reimburse:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_task_authorized_name_reimburse_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_task_reimburse_lbl" runat="server" Font-Size="Large" Text="date_task_reimburse:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_task_reimburse_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ok_close_task_name_lbl" runat="server" Font-Size="Large" Text="ok_close_task_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ok_close_task_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_close_task_date_lbl" runat="server" Font-Size="Large" Text="close_task_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_close_task_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpedisaster_project_task_locationInfo" runat="server" CollapseControlID="Insert_disaster_project_task_location_InfoHead" CollapsedText="Show disaster_project_task_location Information" Enabled="True" ExpandControlID="Insert_disaster_project_task_location_InfoHead" ExpandedText="disaster_project_task_location Information" TargetControlID="Insert_disaster_project_task_location_InfoBody" TextLabelID="Insert_disaster_project_task_location_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_disaster_project_task_location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="disaster_project_task_location_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="disaster_project_task_location_id" HeaderText="disaster_project_task_location_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_project_task_location_id" />
                            <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                            <asp:BoundField DataField="project_id" HeaderText="project_id" InsertVisible="False" ReadOnly="True" SortExpression="project_id" />
                            <asp:BoundField DataField="task_id" HeaderText="task_id" InsertVisible="False" ReadOnly="True" SortExpression="task_id" Visible="false" />
                            <asp:BoundField DataField="demo_location_id" HeaderText="demo_location_id" InsertVisible="False" ReadOnly="True" SortExpression="demo_location_id" Visible="false" />
                            <asp:BoundField DataField="demo_id" HeaderText="demo_id" InsertVisible="False" ReadOnly="True" SortExpression="demo_id" Visible="false" />
                            <asp:BoundField DataField="est_task_hours" HeaderText="est_task_hours" InsertVisible="False" ReadOnly="True" SortExpression="est_task_hours" Visible="false" />
                            <asp:BoundField DataField="est_task_costs" HeaderText="est_task_costs" InsertVisible="False" ReadOnly="True" SortExpression="est_task_costs" Visible="false" />
                            <asp:BoundField DataField="auth_name_rec_perf_rating" HeaderText="auth_name_rec_perf_rating" InsertVisible="False" ReadOnly="True" SortExpression="auth_name_rec_perf_rating" Visible="false" />
                            <asp:BoundField DataField="date_rec_perf_date" HeaderText="date_rec_perf_date" InsertVisible="False" ReadOnly="True" SortExpression="date_rec_perf_date" Visible="false" />
                            <asp:BoundField DataField="aut_name_review_time" HeaderText="aut_name_review_time" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_review_time" Visible="false" />
                            <asp:BoundField DataField="date_ok_timesh_rep" HeaderText="date_ok_timesh_rep" InsertVisible="False" ReadOnly="True" SortExpression="date_ok_timesh_rep" Visible="false" />
                            <asp:BoundField DataField="auth_name_pay_rel_person" HeaderText="auth_name_pay_rel_person" InsertVisible="False" ReadOnly="True" SortExpression="auth_name_pay_rel_person" Visible="false" />
                            <asp:BoundField DataField="date_person_paid_rel" HeaderText="date_person_paid_rel" InsertVisible="False" ReadOnly="True" SortExpression="date_person_paid_rel" Visible="false" />
                            <asp:BoundField DataField="aut_name_prod_inv_ck_pay_ven" HeaderText="aut_name_prod_inv_ck_pay_ven" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_prod_inv_ck_pay_ven" Visible="false" />
                            <asp:BoundField DataField="aut_name_eq_ret_refurb" HeaderText="aut_name_eq_ret_refurb" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_eq_ret_refurb" Visible="false" />
                            <asp:BoundField DataField="date_prod_inv_rel_ven_paid" HeaderText="date_prod_inv_rel_ven_paid" InsertVisible="False" ReadOnly="True" SortExpression="date_prod_inv_rel_ven_paid" Visible="false" />
                            <asp:BoundField DataField="date_eq_rel_ven_paid" HeaderText="date_eq_rel_ven_paid" InsertVisible="False" ReadOnly="True" SortExpression="date_eq_rel_ven_paid" Visible="false" />
                            <asp:BoundField DataField="task_authorized_name_reimburse" HeaderText="task_authorized_name_reimburse" InsertVisible="False" ReadOnly="True" SortExpression="task_authorized_name_reimburse" Visible="false" />
                            <asp:BoundField DataField="date_task_reimburse" HeaderText="date_task_reimburse" InsertVisible="False" ReadOnly="True" SortExpression="date_task_reimburse" Visible="false" />
                            <asp:BoundField DataField="ok_close_task_name" HeaderText="ok_close_task_name" InsertVisible="False" ReadOnly="True" SortExpression="ok_close_task_name" Visible="false" />
                            <asp:BoundField DataField="close_task_date" HeaderText="close_task_date" InsertVisible="False" ReadOnly="True" SortExpression="close_task_date" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [disaster_project_task_location_id], [disaster_id], [project_id], [task_id], [demo_location_id], [demo_id], [est_task_hours], [est_task_costs], [auth_name_rec_perf_rating], [date_rec_perf_date], [aut_name_review_time], [date_ok_timesh_rep], [auth_name_pay_rel_person], [date_person_paid_rel], [aut_name_prod_inv_ck_pay_ven], [aut_name_eq_ret_refurb], [date_prod_inv_rel_ven_paid], [date_eq_rel_ven_paid], [task_authorized_name_reimburse], [date_task_reimburse], [ok_close_task_name], [close_task_date] FROM [disaster_project_task_location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_disaster_project_task_location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_disaster_project_task_location_InfoHead_label" Style="padding: 10px" runat="server" Text="disaster_project_task_location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_disaster_project_task_location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_project_task_location_id_lbl" runat="server" Font-Size="Large" Text="disaster_project_task_location_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_project_task_location_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_disaster_id_lbl" runat="server" Font-Size="Large" Text="disaster_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_disaster_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_project_id_lbl" runat="server" Font-Size="Large" Text="project_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_project_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_task_id_lbl" runat="server" Font-Size="Large" Text="task_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_task_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_demo_location_id_lbl" runat="server" Font-Size="Large" Text="demo_location_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_demo_location_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_demo_id_lbl" runat="server" Font-Size="Large" Text="demo_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_demo_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_est_task_hours_lbl" runat="server" Font-Size="Large" Text="est_task_hours:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_est_task_hours_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_est_task_costs_lbl" runat="server" Font-Size="Large" Text="est_task_costs:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_est_task_costs_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_auth_name_rec_perf_rating_lbl" runat="server" Font-Size="Large" Text="auth_name_rec_perf_rating:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_auth_name_rec_perf_rating_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_rec_perf_date_lbl" runat="server" Font-Size="Large" Text="date_rec_perf_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_rec_perf_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_aut_name_review_time_lbl" runat="server" Font-Size="Large" Text="aut_name_review_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_aut_name_review_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_ok_timesh_rep_lbl" runat="server" Font-Size="Large" Text="date_ok_timesh_rep:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_ok_timesh_rep_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_auth_name_pay_rel_person_lbl" runat="server" Font-Size="Large" Text="auth_name_pay_rel_person:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_auth_name_pay_rel_person_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_person_paid_rel_lbl" runat="server" Font-Size="Large" Text="date_person_paid_rel:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_person_paid_rel_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_aut_name_prod_inv_ck_pay_ven_lbl" runat="server" Font-Size="Large" Text="aut_name_prod_inv_ck_pay_ven:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_aut_name_prod_inv_ck_pay_ven_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_aut_name_eq_ret_refurb_lbl" runat="server" Font-Size="Large" Text="aut_name_eq_ret_refurb:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_aut_name_eq_ret_refurb_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_prod_inv_rel_ven_paid_lbl" runat="server" Font-Size="Large" Text="date_prod_inv_rel_ven_paid:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_prod_inv_rel_ven_paid_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_eq_rel_ven_paid_lbl" runat="server" Font-Size="Large" Text="date_eq_rel_ven_paid:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_eq_rel_ven_paid_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_task_authorized_name_reimburse_lbl" runat="server" Font-Size="Large" Text="task_authorized_name_reimburse:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_task_authorized_name_reimburse_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_task_reimburse_lbl" runat="server" Font-Size="Large" Text="date_task_reimburse:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_task_reimburse_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ok_close_task_name_lbl" runat="server" Font-Size="Large" Text="ok_close_task_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ok_close_task_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_close_task_date_lbl" runat="server" Font-Size="Large" Text="close_task_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_close_task_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpedisaster_project_task_locationInfo" runat="server" CollapseControlID="Update_disaster_project_task_location_InfoHead" CollapsedText="Show disaster_project_task_location Information" Enabled="True" ExpandControlID="Update_disaster_project_task_location_InfoHead" ExpandedText="disaster_project_task_location Information" TargetControlID="Update_disaster_project_task_location_InfoBody" TextLabelID="Update_disaster_project_task_location_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_disaster_project_task_location_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="disaster_project_task_location_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="disaster_project_task_location_id" HeaderText="disaster_project_task_location_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_project_task_location_id" />
                            <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                            <asp:BoundField DataField="project_id" HeaderText="project_id" InsertVisible="False" ReadOnly="True" SortExpression="project_id" />
                            <asp:BoundField DataField="task_id" HeaderText="task_id" InsertVisible="False" ReadOnly="True" SortExpression="task_id" Visible="false" />
                            <asp:BoundField DataField="demo_location_id" HeaderText="demo_location_id" InsertVisible="False" ReadOnly="True" SortExpression="demo_location_id" Visible="false" />
                            <asp:BoundField DataField="demo_id" HeaderText="demo_id" InsertVisible="False" ReadOnly="True" SortExpression="demo_id" Visible="false" />
                            <asp:BoundField DataField="est_task_hours" HeaderText="est_task_hours" InsertVisible="False" ReadOnly="True" SortExpression="est_task_hours" Visible="false" />
                            <asp:BoundField DataField="est_task_costs" HeaderText="est_task_costs" InsertVisible="False" ReadOnly="True" SortExpression="est_task_costs" Visible="false" />
                            <asp:BoundField DataField="auth_name_rec_perf_rating" HeaderText="auth_name_rec_perf_rating" InsertVisible="False" ReadOnly="True" SortExpression="auth_name_rec_perf_rating" Visible="false" />
                            <asp:BoundField DataField="date_rec_perf_date" HeaderText="date_rec_perf_date" InsertVisible="False" ReadOnly="True" SortExpression="date_rec_perf_date" Visible="false" />
                            <asp:BoundField DataField="aut_name_review_time" HeaderText="aut_name_review_time" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_review_time" Visible="false" />
                            <asp:BoundField DataField="date_ok_timesh_rep" HeaderText="date_ok_timesh_rep" InsertVisible="False" ReadOnly="True" SortExpression="date_ok_timesh_rep" Visible="false" />
                            <asp:BoundField DataField="auth_name_pay_rel_person" HeaderText="auth_name_pay_rel_person" InsertVisible="False" ReadOnly="True" SortExpression="auth_name_pay_rel_person" Visible="false" />
                            <asp:BoundField DataField="date_person_paid_rel" HeaderText="date_person_paid_rel" InsertVisible="False" ReadOnly="True" SortExpression="date_person_paid_rel" Visible="false" />
                            <asp:BoundField DataField="aut_name_prod_inv_ck_pay_ven" HeaderText="aut_name_prod_inv_ck_pay_ven" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_prod_inv_ck_pay_ven" Visible="false" />
                            <asp:BoundField DataField="aut_name_eq_ret_refurb" HeaderText="aut_name_eq_ret_refurb" InsertVisible="False" ReadOnly="True" SortExpression="aut_name_eq_ret_refurb" Visible="false" />
                            <asp:BoundField DataField="date_prod_inv_rel_ven_paid" HeaderText="date_prod_inv_rel_ven_paid" InsertVisible="False" ReadOnly="True" SortExpression="date_prod_inv_rel_ven_paid" Visible="false" />
                            <asp:BoundField DataField="date_eq_rel_ven_paid" HeaderText="date_eq_rel_ven_paid" InsertVisible="False" ReadOnly="True" SortExpression="date_eq_rel_ven_paid" Visible="false" />
                            <asp:BoundField DataField="task_authorized_name_reimburse" HeaderText="task_authorized_name_reimburse" InsertVisible="False" ReadOnly="True" SortExpression="task_authorized_name_reimburse" Visible="false" />
                            <asp:BoundField DataField="date_task_reimburse" HeaderText="date_task_reimburse" InsertVisible="False" ReadOnly="True" SortExpression="date_task_reimburse" Visible="false" />
                            <asp:BoundField DataField="ok_close_task_name" HeaderText="ok_close_task_name" InsertVisible="False" ReadOnly="True" SortExpression="ok_close_task_name" Visible="false" />
                            <asp:BoundField DataField="close_task_date" HeaderText="close_task_date" InsertVisible="False" ReadOnly="True" SortExpression="close_task_date" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [disaster_project_task_location_id], [disaster_id], [project_id], [task_id], [demo_location_id], [demo_id], [est_task_hours], [est_task_costs], [auth_name_rec_perf_rating], [date_rec_perf_date], [aut_name_review_time], [date_ok_timesh_rep], [auth_name_pay_rel_person], [date_person_paid_rel], [aut_name_prod_inv_ck_pay_ven], [aut_name_eq_ret_refurb], [date_prod_inv_rel_ven_paid], [date_eq_rel_ven_paid], [task_authorized_name_reimburse], [date_task_reimburse], [ok_close_task_name], [close_task_date] FROM [disaster_project_task_location]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_disaster_project_task_location_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_disaster_project_task_location_InfoHead_label" Style="padding: 10px" runat="server" Text="disaster_project_task_location Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_disaster_project_task_location_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_project_task_location_id_lbl" runat="server" Font-Size="Large" Text="disaster_project_task_location_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_project_task_location_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_disaster_id_lbl" runat="server" Font-Size="Large" Text="disaster_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_disaster_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_project_id_lbl" runat="server" Font-Size="Large" Text="project_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_project_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_task_id_lbl" runat="server" Font-Size="Large" Text="task_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_task_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_demo_location_id_lbl" runat="server" Font-Size="Large" Text="demo_location_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_demo_location_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_demo_id_lbl" runat="server" Font-Size="Large" Text="demo_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_demo_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_est_task_hours_lbl" runat="server" Font-Size="Large" Text="est_task_hours:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_est_task_hours_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_est_task_costs_lbl" runat="server" Font-Size="Large" Text="est_task_costs:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_est_task_costs_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_auth_name_rec_perf_rating_lbl" runat="server" Font-Size="Large" Text="auth_name_rec_perf_rating:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_auth_name_rec_perf_rating_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_rec_perf_date_lbl" runat="server" Font-Size="Large" Text="date_rec_perf_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_rec_perf_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_aut_name_review_time_lbl" runat="server" Font-Size="Large" Text="aut_name_review_time:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_aut_name_review_time_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_ok_timesh_rep_lbl" runat="server" Font-Size="Large" Text="date_ok_timesh_rep:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_ok_timesh_rep_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_auth_name_pay_rel_person_lbl" runat="server" Font-Size="Large" Text="auth_name_pay_rel_person:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_auth_name_pay_rel_person_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_person_paid_rel_lbl" runat="server" Font-Size="Large" Text="date_person_paid_rel:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_person_paid_rel_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_aut_name_prod_inv_ck_pay_ven_lbl" runat="server" Font-Size="Large" Text="aut_name_prod_inv_ck_pay_ven:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_aut_name_prod_inv_ck_pay_ven_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_aut_name_eq_ret_refurb_lbl" runat="server" Font-Size="Large" Text="aut_name_eq_ret_refurb:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_aut_name_eq_ret_refurb_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_prod_inv_rel_ven_paid_lbl" runat="server" Font-Size="Large" Text="date_prod_inv_rel_ven_paid:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_prod_inv_rel_ven_paid_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_eq_rel_ven_paid_lbl" runat="server" Font-Size="Large" Text="date_eq_rel_ven_paid:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_eq_rel_ven_paid_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_task_authorized_name_reimburse_lbl" runat="server" Font-Size="Large" Text="task_authorized_name_reimburse:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_task_authorized_name_reimburse_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_task_reimburse_lbl" runat="server" Font-Size="Large" Text="date_task_reimburse:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_task_reimburse_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ok_close_task_name_lbl" runat="server" Font-Size="Large" Text="ok_close_task_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ok_close_task_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_close_task_date_lbl" runat="server" Font-Size="Large" Text="close_task_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_close_task_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpedisaster_project_task_locationInfo" runat="server" CollapseControlID="Delete_disaster_project_task_location_InfoHead" CollapsedText="Show disaster_project_task_location Information" Enabled="True" ExpandControlID="Delete_disaster_project_task_location_InfoHead" ExpandedText="disaster_project_task_location Information" TargetControlID="Delete_disaster_project_task_location_InfoBody" TextLabelID="Delete_disaster_project_task_location_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

