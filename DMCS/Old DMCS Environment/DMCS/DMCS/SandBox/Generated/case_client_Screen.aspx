<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="case_client_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.case_client_Screen" %>
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
                                        <asp:GridView ID="Insert_case_client_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="case_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="cable_amt_owed_today" HeaderText="cable_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="cable_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="colessee_name" HeaderText="colessee_name" InsertVisible="False" ReadOnly="True" SortExpression="colessee_name" Visible="false" />
                            <asp:BoundField DataField="child_support" HeaderText="child_support" InsertVisible="False" ReadOnly="True" SortExpression="child_support" Visible="false" />
                            <asp:BoundField DataField="child_support_memo" HeaderText="child_support_memo" InsertVisible="False" ReadOnly="True" SortExpression="child_support_memo" Visible="false" />
                            <asp:BoundField DataField="curr_residence_date" HeaderText="curr_residence_date" InsertVisible="False" ReadOnly="True" SortExpression="curr_residence_date" Visible="false" />
                            <asp:BoundField DataField="electric_amt_owed_today" HeaderText="electric_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="electric_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="employment_memo" HeaderText="employment_memo" InsertVisible="False" ReadOnly="True" SortExpression="employment_memo" Visible="false" />
                            <asp:BoundField DataField="employment_status" HeaderText="employment_status" InsertVisible="False" ReadOnly="True" SortExpression="employment_status" Visible="false" />
                            <asp:BoundField DataField="gas_or_heating_amt_owed_today" HeaderText="gas_or_heating_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="gas_or_heating_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="housing_amt_owed_today" HeaderText="housing_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="housing_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="housing_status" HeaderText="housing_status" InsertVisible="False" ReadOnly="True" SortExpression="housing_status" Visible="false" />
                            <asp:BoundField DataField="income_status" HeaderText="income_status" InsertVisible="False" ReadOnly="True" SortExpression="income_status" Visible="false" />
                            <asp:BoundField DataField="lease_num_adults" HeaderText="lease_num_adults" InsertVisible="False" ReadOnly="True" SortExpression="lease_num_adults" Visible="false" />
                            <asp:BoundField DataField="lease_start_date" HeaderText="lease_start_date" InsertVisible="False" ReadOnly="True" SortExpression="lease_start_date" Visible="false" />
                            <asp:BoundField DataField="minor_children" HeaderText="minor_children" InsertVisible="False" ReadOnly="True" SortExpression="minor_children" Visible="false" />
                            <asp:BoundField DataField="monthly_rent_amt" HeaderText="monthly_rent_amt" InsertVisible="False" ReadOnly="True" SortExpression="monthly_rent_amt" Visible="false" />
                            <asp:BoundField DataField="Other_help_Sources" HeaderText="Other_help_Sources" InsertVisible="False" ReadOnly="True" SortExpression="Other_help_Sources" Visible="false" />
                            <asp:BoundField DataField="Other_help_Sources_memo" HeaderText="Other_help_Sources_memo" InsertVisible="False" ReadOnly="True" SortExpression="Other_help_Sources_memo" Visible="false" />
                            <asp:BoundField DataField="prev_address_id" HeaderText="prev_address_id" InsertVisible="False" ReadOnly="True" SortExpression="prev_address_id" Visible="false" />
                            <asp:BoundField DataField="prev_residence_date" HeaderText="prev_residence_date" InsertVisible="False" ReadOnly="True" SortExpression="prev_residence_date" Visible="false" />
                            <asp:BoundField DataField="relationship_to_head_of_household" HeaderText="relationship_to_head_of_household" InsertVisible="False" ReadOnly="True" SortExpression="relationship_to_head_of_household" Visible="false" />
                            <asp:BoundField DataField="rental_name" HeaderText="rental_name" InsertVisible="False" ReadOnly="True" SortExpression="rental_name" Visible="false" />
                            <asp:BoundField DataField="rental_phone" HeaderText="rental_phone" InsertVisible="False" ReadOnly="True" SortExpression="rental_phone" Visible="false" />
                            <asp:BoundField DataField="sewage_amt_owed_today" HeaderText="sewage_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="sewage_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="telephone_amt_owed_today" HeaderText="telephone_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="telephone_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="trash_removal_amt_owed_today" HeaderText="trash_removal_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="trash_removal_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="us_status_memo" HeaderText="us_status_memo" InsertVisible="False" ReadOnly="True" SortExpression="us_status_memo" Visible="false" />
                            <asp:BoundField DataField="related_ll" HeaderText="related_ll" InsertVisible="False" ReadOnly="True" SortExpression="related_ll" Visible="false" />
                            <asp:BoundField DataField="relation_to_ll" HeaderText="relation_to_ll" InsertVisible="False" ReadOnly="True" SortExpression="relation_to_ll" Visible="false" />
                            <asp:BoundField DataField="mtg_amt_owed_today" HeaderText="mtg_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="mtg_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="utilities_list" HeaderText="utilities_list" InsertVisible="False" ReadOnly="True" SortExpression="utilities_list" Visible="false" />
                            <asp:BoundField DataField="water_amt_owed_today" HeaderText="water_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="water_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="public_asst_app_date" HeaderText="public_asst_app_date" InsertVisible="False" ReadOnly="True" SortExpression="public_asst_app_date" Visible="false" />
                            <asp:BoundField DataField="util_allot_app_date" HeaderText="util_allot_app_date" InsertVisible="False" ReadOnly="True" SortExpression="util_allot_app_date" Visible="false" />
                            <asp:BoundField DataField="util_allot_amt" HeaderText="util_allot_amt" InsertVisible="False" ReadOnly="True" SortExpression="util_allot_amt" Visible="false" />
                            <asp:BoundField DataField="utilities_incl" HeaderText="utilities_incl" InsertVisible="False" ReadOnly="True" SortExpression="utilities_incl" Visible="false" />
                            <asp:BoundField DataField="fd_stmps_app_date" HeaderText="fd_stmps_app_date" InsertVisible="False" ReadOnly="True" SortExpression="fd_stmps_app_date" Visible="false" />
                            <asp:BoundField DataField="fd_stmps_amt" HeaderText="fd_stmps_amt" InsertVisible="False" ReadOnly="True" SortExpression="fd_stmps_amt" Visible="false" />
                            <asp:BoundField DataField="fd_Inc" HeaderText="fd_Inc" InsertVisible="False" ReadOnly="True" SortExpression="fd_Inc" Visible="false" />
                            <asp:BoundField DataField="afdc_app_date" HeaderText="afdc_app_date" InsertVisible="False" ReadOnly="True" SortExpression="afdc_app_date" Visible="false" />
                            <asp:BoundField DataField="afdc_amt" HeaderText="afdc_amt" InsertVisible="False" ReadOnly="True" SortExpression="afdc_amt" Visible="false" />
                            <asp:BoundField DataField="afdc_Inc" HeaderText="afdc_Inc" InsertVisible="False" ReadOnly="True" SortExpression="afdc_Inc" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_app_date" HeaderText="oth_trustee_app_date" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_app_date" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_amt" HeaderText="oth_trustee_amt" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_amt" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_Inc" HeaderText="oth_trustee_Inc" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_Inc" Visible="false" />
                            <asp:BoundField DataField="ss_app_date" HeaderText="ss_app_date" InsertVisible="False" ReadOnly="True" SortExpression="ss_app_date" Visible="false" />
                            <asp:BoundField DataField="ss_amt" HeaderText="ss_amt" InsertVisible="False" ReadOnly="True" SortExpression="ss_amt" Visible="false" />
                            <asp:BoundField DataField="ss_Inc" HeaderText="ss_Inc" InsertVisible="False" ReadOnly="True" SortExpression="ss_Inc" Visible="false" />
                            <asp:BoundField DataField="va_app_date" HeaderText="va_app_date" InsertVisible="False" ReadOnly="True" SortExpression="va_app_date" Visible="false" />
                            <asp:BoundField DataField="va_amt" HeaderText="va_amt" InsertVisible="False" ReadOnly="True" SortExpression="va_amt" Visible="false" />
                            <asp:BoundField DataField="va_Inc" HeaderText="va_Inc" InsertVisible="False" ReadOnly="True" SortExpression="va_Inc" Visible="false" />
                            <asp:BoundField DataField="eap_app_date" HeaderText="eap_app_date" InsertVisible="False" ReadOnly="True" SortExpression="eap_app_date" Visible="false" />
                            <asp:BoundField DataField="eap_amt" HeaderText="eap_amt" InsertVisible="False" ReadOnly="True" SortExpression="eap_amt" Visible="false" />
                            <asp:BoundField DataField="eap_Inc" HeaderText="eap_Inc" InsertVisible="False" ReadOnly="True" SortExpression="eap_Inc" Visible="false" />
                            <asp:BoundField DataField="fema_app_date" HeaderText="fema_app_date" InsertVisible="False" ReadOnly="True" SortExpression="fema_app_date" Visible="false" />
                            <asp:BoundField DataField="fema_amt" HeaderText="fema_amt" InsertVisible="False" ReadOnly="True" SortExpression="fema_amt" Visible="false" />
                            <asp:BoundField DataField="fema_Inc" HeaderText="fema_Inc" InsertVisible="False" ReadOnly="True" SortExpression="fema_Inc" Visible="false" />
                            <asp:BoundField DataField="unempl_app_date" HeaderText="unempl_app_date" InsertVisible="False" ReadOnly="True" SortExpression="unempl_app_date" Visible="false" />
                            <asp:BoundField DataField="unempl_amt" HeaderText="unempl_amt" InsertVisible="False" ReadOnly="True" SortExpression="unempl_amt" Visible="false" />
                            <asp:BoundField DataField="unempl_Inc" HeaderText="unempl_Inc" InsertVisible="False" ReadOnly="True" SortExpression="unempl_Inc" Visible="false" />
                            <asp:BoundField DataField="grants_loans_app_date" HeaderText="grants_loans_app_date" InsertVisible="False" ReadOnly="True" SortExpression="grants_loans_app_date" Visible="false" />
                            <asp:BoundField DataField="grants_loans_amt" HeaderText="grants_loans_amt" InsertVisible="False" ReadOnly="True" SortExpression="grants_loans_amt" Visible="false" />
                            <asp:BoundField DataField="grants_Inc" HeaderText="grants_Inc" InsertVisible="False" ReadOnly="True" SortExpression="grants_Inc" Visible="false" />
                            <asp:BoundField DataField="other_app_date" HeaderText="other_app_date" InsertVisible="False" ReadOnly="True" SortExpression="other_app_date" Visible="false" />
                            <asp:BoundField DataField="other_amt" HeaderText="other_amt" InsertVisible="False" ReadOnly="True" SortExpression="other_amt" Visible="false" />
                            <asp:BoundField DataField="other_Inc" HeaderText="other_Inc" InsertVisible="False" ReadOnly="True" SortExpression="other_Inc" Visible="false" />
                            <asp:BoundField DataField="denial_memo" HeaderText="denial_memo" InsertVisible="False" ReadOnly="True" SortExpression="denial_memo" Visible="false" />
                            <asp:BoundField DataField="welfr_fraud_memo" HeaderText="welfr_fraud_memo" InsertVisible="False" ReadOnly="True" SortExpression="welfr_fraud_memo" Visible="false" />
                            <asp:BoundField DataField="Client_issue_Desc" HeaderText="Client_issue_Desc" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_Desc" Visible="false" />
                            <asp:BoundField DataField="Client_issue_resolved" HeaderText="Client_issue_resolved" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_resolved" Visible="false" />
                            <asp:BoundField DataField="Client_issue_comments" HeaderText="Client_issue_comments" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_comments" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [case_id], [client_id], [address_id], [cable_amt_owed_today], [colessee_name], [child_support], [child_support_memo], [curr_residence_date], [electric_amt_owed_today], [employment_memo], [employment_status], [gas_or_heating_amt_owed_today], [housing_amt_owed_today], [housing_status], [income_status], [lease_num_adults], [lease_start_date], [minor_children], [monthly_rent_amt], [Other_help_Sources], [Other_help_Sources_memo], [prev_address_id], [prev_residence_date], [relationship_to_head_of_household], [rental_name], [rental_phone], [sewage_amt_owed_today], [telephone_amt_owed_today], [trash_removal_amt_owed_today], [us_status_memo], [related_ll], [relation_to_ll], [mtg_amt_owed_today], [utilities_list], [water_amt_owed_today], [public_asst_app_date], [util_allot_app_date], [util_allot_amt], [utilities_incl], [fd_stmps_app_date], [fd_stmps_amt], [fd_Inc], [afdc_app_date], [afdc_amt], [afdc_Inc], [oth_trustee_app_date], [oth_trustee_amt], [oth_trustee_Inc], [ss_app_date], [ss_amt], [ss_Inc], [va_app_date], [va_amt], [va_Inc], [eap_app_date], [eap_amt], [eap_Inc], [fema_app_date], [fema_amt], [fema_Inc], [unempl_app_date], [unempl_amt], [unempl_Inc], [grants_loans_app_date], [grants_loans_amt], [grants_Inc], [other_app_date], [other_amt], [other_Inc], [denial_memo], [welfr_fraud_memo], [Client_issue_Desc], [Client_issue_resolved], [Client_issue_comments] FROM [case_client]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_case_client_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_case_client_InfoHead_label" Style="padding: 10px" runat="server" Text="case_client Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_case_client_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_cable_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="cable_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_cable_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_colessee_name_lbl" runat="server" Font-Size="Large" Text="colessee_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_colessee_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_child_support_lbl" runat="server" Font-Size="Large" Text="child_support:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_child_support_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_child_support_memo_lbl" runat="server" Font-Size="Large" Text="child_support_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_child_support_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_curr_residence_date_lbl" runat="server" Font-Size="Large" Text="curr_residence_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_curr_residence_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_electric_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="electric_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_electric_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employment_memo_lbl" runat="server" Font-Size="Large" Text="employment_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employment_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_employment_status_lbl" runat="server" Font-Size="Large" Text="employment_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_employment_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_gas_or_heating_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="gas_or_heating_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_gas_or_heating_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_housing_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="housing_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_housing_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_housing_status_lbl" runat="server" Font-Size="Large" Text="housing_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_housing_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_income_status_lbl" runat="server" Font-Size="Large" Text="income_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_income_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_lease_num_adults_lbl" runat="server" Font-Size="Large" Text="lease_num_adults:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_lease_num_adults_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_lease_start_date_lbl" runat="server" Font-Size="Large" Text="lease_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_lease_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_minor_children_lbl" runat="server" Font-Size="Large" Text="minor_children:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_minor_children_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_monthly_rent_amt_lbl" runat="server" Font-Size="Large" Text="monthly_rent_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_monthly_rent_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Other_help_Sources_lbl" runat="server" Font-Size="Large" Text="Other_help_Sources:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Other_help_Sources_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Other_help_Sources_memo_lbl" runat="server" Font-Size="Large" Text="Other_help_Sources_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Other_help_Sources_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_prev_address_id_lbl" runat="server" Font-Size="Large" Text="prev_address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_prev_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_prev_residence_date_lbl" runat="server" Font-Size="Large" Text="prev_residence_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_prev_residence_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_relationship_to_head_of_household_lbl" runat="server" Font-Size="Large" Text="relationship_to_head_of_household:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_relationship_to_head_of_household_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_rental_name_lbl" runat="server" Font-Size="Large" Text="rental_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_rental_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_rental_phone_lbl" runat="server" Font-Size="Large" Text="rental_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_rental_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_sewage_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="sewage_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_sewage_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_telephone_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="telephone_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_telephone_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_trash_removal_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="trash_removal_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_trash_removal_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_us_status_memo_lbl" runat="server" Font-Size="Large" Text="us_status_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_us_status_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_related_ll_lbl" runat="server" Font-Size="Large" Text="related_ll:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_related_ll_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_relation_to_ll_lbl" runat="server" Font-Size="Large" Text="relation_to_ll:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_relation_to_ll_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_mtg_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="mtg_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_mtg_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_utilities_list_lbl" runat="server" Font-Size="Large" Text="utilities_list:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_utilities_list_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_water_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="water_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_water_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_public_asst_app_date_lbl" runat="server" Font-Size="Large" Text="public_asst_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_public_asst_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_util_allot_app_date_lbl" runat="server" Font-Size="Large" Text="util_allot_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_util_allot_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_util_allot_amt_lbl" runat="server" Font-Size="Large" Text="util_allot_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_util_allot_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_utilities_incl_lbl" runat="server" Font-Size="Large" Text="utilities_incl:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_utilities_incl_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_fd_stmps_app_date_lbl" runat="server" Font-Size="Large" Text="fd_stmps_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_fd_stmps_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_fd_stmps_amt_lbl" runat="server" Font-Size="Large" Text="fd_stmps_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_fd_stmps_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_fd_Inc_lbl" runat="server" Font-Size="Large" Text="fd_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_fd_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_afdc_app_date_lbl" runat="server" Font-Size="Large" Text="afdc_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_afdc_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_afdc_amt_lbl" runat="server" Font-Size="Large" Text="afdc_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_afdc_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_afdc_Inc_lbl" runat="server" Font-Size="Large" Text="afdc_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_afdc_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_oth_trustee_app_date_lbl" runat="server" Font-Size="Large" Text="oth_trustee_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_oth_trustee_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_oth_trustee_amt_lbl" runat="server" Font-Size="Large" Text="oth_trustee_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_oth_trustee_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_oth_trustee_Inc_lbl" runat="server" Font-Size="Large" Text="oth_trustee_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_oth_trustee_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ss_app_date_lbl" runat="server" Font-Size="Large" Text="ss_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ss_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ss_amt_lbl" runat="server" Font-Size="Large" Text="ss_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ss_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ss_Inc_lbl" runat="server" Font-Size="Large" Text="ss_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ss_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_va_app_date_lbl" runat="server" Font-Size="Large" Text="va_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_va_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_va_amt_lbl" runat="server" Font-Size="Large" Text="va_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_va_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_va_Inc_lbl" runat="server" Font-Size="Large" Text="va_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_va_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_eap_app_date_lbl" runat="server" Font-Size="Large" Text="eap_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_eap_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_eap_amt_lbl" runat="server" Font-Size="Large" Text="eap_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_eap_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_eap_Inc_lbl" runat="server" Font-Size="Large" Text="eap_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_eap_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_fema_app_date_lbl" runat="server" Font-Size="Large" Text="fema_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_fema_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_fema_amt_lbl" runat="server" Font-Size="Large" Text="fema_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_fema_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_fema_Inc_lbl" runat="server" Font-Size="Large" Text="fema_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_fema_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_unempl_app_date_lbl" runat="server" Font-Size="Large" Text="unempl_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_unempl_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_unempl_amt_lbl" runat="server" Font-Size="Large" Text="unempl_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_unempl_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_unempl_Inc_lbl" runat="server" Font-Size="Large" Text="unempl_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_unempl_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_grants_loans_app_date_lbl" runat="server" Font-Size="Large" Text="grants_loans_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_grants_loans_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_grants_loans_amt_lbl" runat="server" Font-Size="Large" Text="grants_loans_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_grants_loans_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_grants_Inc_lbl" runat="server" Font-Size="Large" Text="grants_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_grants_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_other_app_date_lbl" runat="server" Font-Size="Large" Text="other_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_other_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_other_amt_lbl" runat="server" Font-Size="Large" Text="other_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_other_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_other_Inc_lbl" runat="server" Font-Size="Large" Text="other_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_other_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_denial_memo_lbl" runat="server" Font-Size="Large" Text="denial_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_denial_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_welfr_fraud_memo_lbl" runat="server" Font-Size="Large" Text="welfr_fraud_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_welfr_fraud_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Client_issue_Desc_lbl" runat="server" Font-Size="Large" Text="Client_issue_Desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Client_issue_Desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Client_issue_resolved_lbl" runat="server" Font-Size="Large" Text="Client_issue_resolved:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Client_issue_resolved_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Client_issue_comments_lbl" runat="server" Font-Size="Large" Text="Client_issue_comments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Client_issue_comments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpecase_clientInfo" runat="server" CollapseControlID="Insert_case_client_InfoHead" CollapsedText="Show case_client Information" Enabled="True" ExpandControlID="Insert_case_client_InfoHead" ExpandedText="case_client Information" TargetControlID="Insert_case_client_InfoBody" TextLabelID="Insert_case_client_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_case_client_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="case_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="cable_amt_owed_today" HeaderText="cable_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="cable_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="colessee_name" HeaderText="colessee_name" InsertVisible="False" ReadOnly="True" SortExpression="colessee_name" Visible="false" />
                            <asp:BoundField DataField="child_support" HeaderText="child_support" InsertVisible="False" ReadOnly="True" SortExpression="child_support" Visible="false" />
                            <asp:BoundField DataField="child_support_memo" HeaderText="child_support_memo" InsertVisible="False" ReadOnly="True" SortExpression="child_support_memo" Visible="false" />
                            <asp:BoundField DataField="curr_residence_date" HeaderText="curr_residence_date" InsertVisible="False" ReadOnly="True" SortExpression="curr_residence_date" Visible="false" />
                            <asp:BoundField DataField="electric_amt_owed_today" HeaderText="electric_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="electric_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="employment_memo" HeaderText="employment_memo" InsertVisible="False" ReadOnly="True" SortExpression="employment_memo" Visible="false" />
                            <asp:BoundField DataField="employment_status" HeaderText="employment_status" InsertVisible="False" ReadOnly="True" SortExpression="employment_status" Visible="false" />
                            <asp:BoundField DataField="gas_or_heating_amt_owed_today" HeaderText="gas_or_heating_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="gas_or_heating_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="housing_amt_owed_today" HeaderText="housing_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="housing_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="housing_status" HeaderText="housing_status" InsertVisible="False" ReadOnly="True" SortExpression="housing_status" Visible="false" />
                            <asp:BoundField DataField="income_status" HeaderText="income_status" InsertVisible="False" ReadOnly="True" SortExpression="income_status" Visible="false" />
                            <asp:BoundField DataField="lease_num_adults" HeaderText="lease_num_adults" InsertVisible="False" ReadOnly="True" SortExpression="lease_num_adults" Visible="false" />
                            <asp:BoundField DataField="lease_start_date" HeaderText="lease_start_date" InsertVisible="False" ReadOnly="True" SortExpression="lease_start_date" Visible="false" />
                            <asp:BoundField DataField="minor_children" HeaderText="minor_children" InsertVisible="False" ReadOnly="True" SortExpression="minor_children" Visible="false" />
                            <asp:BoundField DataField="monthly_rent_amt" HeaderText="monthly_rent_amt" InsertVisible="False" ReadOnly="True" SortExpression="monthly_rent_amt" Visible="false" />
                            <asp:BoundField DataField="Other_help_Sources" HeaderText="Other_help_Sources" InsertVisible="False" ReadOnly="True" SortExpression="Other_help_Sources" Visible="false" />
                            <asp:BoundField DataField="Other_help_Sources_memo" HeaderText="Other_help_Sources_memo" InsertVisible="False" ReadOnly="True" SortExpression="Other_help_Sources_memo" Visible="false" />
                            <asp:BoundField DataField="prev_address_id" HeaderText="prev_address_id" InsertVisible="False" ReadOnly="True" SortExpression="prev_address_id" Visible="false" />
                            <asp:BoundField DataField="prev_residence_date" HeaderText="prev_residence_date" InsertVisible="False" ReadOnly="True" SortExpression="prev_residence_date" Visible="false" />
                            <asp:BoundField DataField="relationship_to_head_of_household" HeaderText="relationship_to_head_of_household" InsertVisible="False" ReadOnly="True" SortExpression="relationship_to_head_of_household" Visible="false" />
                            <asp:BoundField DataField="rental_name" HeaderText="rental_name" InsertVisible="False" ReadOnly="True" SortExpression="rental_name" Visible="false" />
                            <asp:BoundField DataField="rental_phone" HeaderText="rental_phone" InsertVisible="False" ReadOnly="True" SortExpression="rental_phone" Visible="false" />
                            <asp:BoundField DataField="sewage_amt_owed_today" HeaderText="sewage_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="sewage_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="telephone_amt_owed_today" HeaderText="telephone_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="telephone_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="trash_removal_amt_owed_today" HeaderText="trash_removal_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="trash_removal_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="us_status_memo" HeaderText="us_status_memo" InsertVisible="False" ReadOnly="True" SortExpression="us_status_memo" Visible="false" />
                            <asp:BoundField DataField="related_ll" HeaderText="related_ll" InsertVisible="False" ReadOnly="True" SortExpression="related_ll" Visible="false" />
                            <asp:BoundField DataField="relation_to_ll" HeaderText="relation_to_ll" InsertVisible="False" ReadOnly="True" SortExpression="relation_to_ll" Visible="false" />
                            <asp:BoundField DataField="mtg_amt_owed_today" HeaderText="mtg_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="mtg_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="utilities_list" HeaderText="utilities_list" InsertVisible="False" ReadOnly="True" SortExpression="utilities_list" Visible="false" />
                            <asp:BoundField DataField="water_amt_owed_today" HeaderText="water_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="water_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="public_asst_app_date" HeaderText="public_asst_app_date" InsertVisible="False" ReadOnly="True" SortExpression="public_asst_app_date" Visible="false" />
                            <asp:BoundField DataField="util_allot_app_date" HeaderText="util_allot_app_date" InsertVisible="False" ReadOnly="True" SortExpression="util_allot_app_date" Visible="false" />
                            <asp:BoundField DataField="util_allot_amt" HeaderText="util_allot_amt" InsertVisible="False" ReadOnly="True" SortExpression="util_allot_amt" Visible="false" />
                            <asp:BoundField DataField="utilities_incl" HeaderText="utilities_incl" InsertVisible="False" ReadOnly="True" SortExpression="utilities_incl" Visible="false" />
                            <asp:BoundField DataField="fd_stmps_app_date" HeaderText="fd_stmps_app_date" InsertVisible="False" ReadOnly="True" SortExpression="fd_stmps_app_date" Visible="false" />
                            <asp:BoundField DataField="fd_stmps_amt" HeaderText="fd_stmps_amt" InsertVisible="False" ReadOnly="True" SortExpression="fd_stmps_amt" Visible="false" />
                            <asp:BoundField DataField="fd_Inc" HeaderText="fd_Inc" InsertVisible="False" ReadOnly="True" SortExpression="fd_Inc" Visible="false" />
                            <asp:BoundField DataField="afdc_app_date" HeaderText="afdc_app_date" InsertVisible="False" ReadOnly="True" SortExpression="afdc_app_date" Visible="false" />
                            <asp:BoundField DataField="afdc_amt" HeaderText="afdc_amt" InsertVisible="False" ReadOnly="True" SortExpression="afdc_amt" Visible="false" />
                            <asp:BoundField DataField="afdc_Inc" HeaderText="afdc_Inc" InsertVisible="False" ReadOnly="True" SortExpression="afdc_Inc" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_app_date" HeaderText="oth_trustee_app_date" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_app_date" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_amt" HeaderText="oth_trustee_amt" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_amt" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_Inc" HeaderText="oth_trustee_Inc" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_Inc" Visible="false" />
                            <asp:BoundField DataField="ss_app_date" HeaderText="ss_app_date" InsertVisible="False" ReadOnly="True" SortExpression="ss_app_date" Visible="false" />
                            <asp:BoundField DataField="ss_amt" HeaderText="ss_amt" InsertVisible="False" ReadOnly="True" SortExpression="ss_amt" Visible="false" />
                            <asp:BoundField DataField="ss_Inc" HeaderText="ss_Inc" InsertVisible="False" ReadOnly="True" SortExpression="ss_Inc" Visible="false" />
                            <asp:BoundField DataField="va_app_date" HeaderText="va_app_date" InsertVisible="False" ReadOnly="True" SortExpression="va_app_date" Visible="false" />
                            <asp:BoundField DataField="va_amt" HeaderText="va_amt" InsertVisible="False" ReadOnly="True" SortExpression="va_amt" Visible="false" />
                            <asp:BoundField DataField="va_Inc" HeaderText="va_Inc" InsertVisible="False" ReadOnly="True" SortExpression="va_Inc" Visible="false" />
                            <asp:BoundField DataField="eap_app_date" HeaderText="eap_app_date" InsertVisible="False" ReadOnly="True" SortExpression="eap_app_date" Visible="false" />
                            <asp:BoundField DataField="eap_amt" HeaderText="eap_amt" InsertVisible="False" ReadOnly="True" SortExpression="eap_amt" Visible="false" />
                            <asp:BoundField DataField="eap_Inc" HeaderText="eap_Inc" InsertVisible="False" ReadOnly="True" SortExpression="eap_Inc" Visible="false" />
                            <asp:BoundField DataField="fema_app_date" HeaderText="fema_app_date" InsertVisible="False" ReadOnly="True" SortExpression="fema_app_date" Visible="false" />
                            <asp:BoundField DataField="fema_amt" HeaderText="fema_amt" InsertVisible="False" ReadOnly="True" SortExpression="fema_amt" Visible="false" />
                            <asp:BoundField DataField="fema_Inc" HeaderText="fema_Inc" InsertVisible="False" ReadOnly="True" SortExpression="fema_Inc" Visible="false" />
                            <asp:BoundField DataField="unempl_app_date" HeaderText="unempl_app_date" InsertVisible="False" ReadOnly="True" SortExpression="unempl_app_date" Visible="false" />
                            <asp:BoundField DataField="unempl_amt" HeaderText="unempl_amt" InsertVisible="False" ReadOnly="True" SortExpression="unempl_amt" Visible="false" />
                            <asp:BoundField DataField="unempl_Inc" HeaderText="unempl_Inc" InsertVisible="False" ReadOnly="True" SortExpression="unempl_Inc" Visible="false" />
                            <asp:BoundField DataField="grants_loans_app_date" HeaderText="grants_loans_app_date" InsertVisible="False" ReadOnly="True" SortExpression="grants_loans_app_date" Visible="false" />
                            <asp:BoundField DataField="grants_loans_amt" HeaderText="grants_loans_amt" InsertVisible="False" ReadOnly="True" SortExpression="grants_loans_amt" Visible="false" />
                            <asp:BoundField DataField="grants_Inc" HeaderText="grants_Inc" InsertVisible="False" ReadOnly="True" SortExpression="grants_Inc" Visible="false" />
                            <asp:BoundField DataField="other_app_date" HeaderText="other_app_date" InsertVisible="False" ReadOnly="True" SortExpression="other_app_date" Visible="false" />
                            <asp:BoundField DataField="other_amt" HeaderText="other_amt" InsertVisible="False" ReadOnly="True" SortExpression="other_amt" Visible="false" />
                            <asp:BoundField DataField="other_Inc" HeaderText="other_Inc" InsertVisible="False" ReadOnly="True" SortExpression="other_Inc" Visible="false" />
                            <asp:BoundField DataField="denial_memo" HeaderText="denial_memo" InsertVisible="False" ReadOnly="True" SortExpression="denial_memo" Visible="false" />
                            <asp:BoundField DataField="welfr_fraud_memo" HeaderText="welfr_fraud_memo" InsertVisible="False" ReadOnly="True" SortExpression="welfr_fraud_memo" Visible="false" />
                            <asp:BoundField DataField="Client_issue_Desc" HeaderText="Client_issue_Desc" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_Desc" Visible="false" />
                            <asp:BoundField DataField="Client_issue_resolved" HeaderText="Client_issue_resolved" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_resolved" Visible="false" />
                            <asp:BoundField DataField="Client_issue_comments" HeaderText="Client_issue_comments" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_comments" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [case_id], [client_id], [address_id], [cable_amt_owed_today], [colessee_name], [child_support], [child_support_memo], [curr_residence_date], [electric_amt_owed_today], [employment_memo], [employment_status], [gas_or_heating_amt_owed_today], [housing_amt_owed_today], [housing_status], [income_status], [lease_num_adults], [lease_start_date], [minor_children], [monthly_rent_amt], [Other_help_Sources], [Other_help_Sources_memo], [prev_address_id], [prev_residence_date], [relationship_to_head_of_household], [rental_name], [rental_phone], [sewage_amt_owed_today], [telephone_amt_owed_today], [trash_removal_amt_owed_today], [us_status_memo], [related_ll], [relation_to_ll], [mtg_amt_owed_today], [utilities_list], [water_amt_owed_today], [public_asst_app_date], [util_allot_app_date], [util_allot_amt], [utilities_incl], [fd_stmps_app_date], [fd_stmps_amt], [fd_Inc], [afdc_app_date], [afdc_amt], [afdc_Inc], [oth_trustee_app_date], [oth_trustee_amt], [oth_trustee_Inc], [ss_app_date], [ss_amt], [ss_Inc], [va_app_date], [va_amt], [va_Inc], [eap_app_date], [eap_amt], [eap_Inc], [fema_app_date], [fema_amt], [fema_Inc], [unempl_app_date], [unempl_amt], [unempl_Inc], [grants_loans_app_date], [grants_loans_amt], [grants_Inc], [other_app_date], [other_amt], [other_Inc], [denial_memo], [welfr_fraud_memo], [Client_issue_Desc], [Client_issue_resolved], [Client_issue_comments] FROM [case_client]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_case_client_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_case_client_InfoHead_label" Style="padding: 10px" runat="server" Text="case_client Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_case_client_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_case_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_cable_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="cable_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_cable_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_colessee_name_lbl" runat="server" Font-Size="Large" Text="colessee_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_colessee_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_child_support_lbl" runat="server" Font-Size="Large" Text="child_support:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_child_support_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_child_support_memo_lbl" runat="server" Font-Size="Large" Text="child_support_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_child_support_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_curr_residence_date_lbl" runat="server" Font-Size="Large" Text="curr_residence_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_curr_residence_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_electric_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="electric_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_electric_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employment_memo_lbl" runat="server" Font-Size="Large" Text="employment_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employment_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_employment_status_lbl" runat="server" Font-Size="Large" Text="employment_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_employment_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_gas_or_heating_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="gas_or_heating_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_gas_or_heating_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_housing_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="housing_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_housing_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_housing_status_lbl" runat="server" Font-Size="Large" Text="housing_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_housing_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_income_status_lbl" runat="server" Font-Size="Large" Text="income_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_income_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_lease_num_adults_lbl" runat="server" Font-Size="Large" Text="lease_num_adults:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_lease_num_adults_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_lease_start_date_lbl" runat="server" Font-Size="Large" Text="lease_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_lease_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_minor_children_lbl" runat="server" Font-Size="Large" Text="minor_children:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_minor_children_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_monthly_rent_amt_lbl" runat="server" Font-Size="Large" Text="monthly_rent_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_monthly_rent_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Other_help_Sources_lbl" runat="server" Font-Size="Large" Text="Other_help_Sources:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Other_help_Sources_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Other_help_Sources_memo_lbl" runat="server" Font-Size="Large" Text="Other_help_Sources_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Other_help_Sources_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_prev_address_id_lbl" runat="server" Font-Size="Large" Text="prev_address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_prev_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_prev_residence_date_lbl" runat="server" Font-Size="Large" Text="prev_residence_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_prev_residence_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_relationship_to_head_of_household_lbl" runat="server" Font-Size="Large" Text="relationship_to_head_of_household:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_relationship_to_head_of_household_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_rental_name_lbl" runat="server" Font-Size="Large" Text="rental_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_rental_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_rental_phone_lbl" runat="server" Font-Size="Large" Text="rental_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_rental_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_sewage_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="sewage_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_sewage_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_telephone_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="telephone_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_telephone_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_trash_removal_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="trash_removal_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_trash_removal_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_us_status_memo_lbl" runat="server" Font-Size="Large" Text="us_status_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_us_status_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_related_ll_lbl" runat="server" Font-Size="Large" Text="related_ll:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_related_ll_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_relation_to_ll_lbl" runat="server" Font-Size="Large" Text="relation_to_ll:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_relation_to_ll_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_mtg_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="mtg_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_mtg_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_utilities_list_lbl" runat="server" Font-Size="Large" Text="utilities_list:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_utilities_list_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_water_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="water_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_water_amt_owed_today_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_public_asst_app_date_lbl" runat="server" Font-Size="Large" Text="public_asst_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_public_asst_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_util_allot_app_date_lbl" runat="server" Font-Size="Large" Text="util_allot_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_util_allot_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_util_allot_amt_lbl" runat="server" Font-Size="Large" Text="util_allot_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_util_allot_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_utilities_incl_lbl" runat="server" Font-Size="Large" Text="utilities_incl:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_utilities_incl_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_fd_stmps_app_date_lbl" runat="server" Font-Size="Large" Text="fd_stmps_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_fd_stmps_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_fd_stmps_amt_lbl" runat="server" Font-Size="Large" Text="fd_stmps_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_fd_stmps_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_fd_Inc_lbl" runat="server" Font-Size="Large" Text="fd_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_fd_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_afdc_app_date_lbl" runat="server" Font-Size="Large" Text="afdc_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_afdc_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_afdc_amt_lbl" runat="server" Font-Size="Large" Text="afdc_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_afdc_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_afdc_Inc_lbl" runat="server" Font-Size="Large" Text="afdc_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_afdc_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_oth_trustee_app_date_lbl" runat="server" Font-Size="Large" Text="oth_trustee_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_oth_trustee_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_oth_trustee_amt_lbl" runat="server" Font-Size="Large" Text="oth_trustee_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_oth_trustee_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_oth_trustee_Inc_lbl" runat="server" Font-Size="Large" Text="oth_trustee_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_oth_trustee_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ss_app_date_lbl" runat="server" Font-Size="Large" Text="ss_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ss_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ss_amt_lbl" runat="server" Font-Size="Large" Text="ss_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ss_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ss_Inc_lbl" runat="server" Font-Size="Large" Text="ss_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ss_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_va_app_date_lbl" runat="server" Font-Size="Large" Text="va_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_va_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_va_amt_lbl" runat="server" Font-Size="Large" Text="va_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_va_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_va_Inc_lbl" runat="server" Font-Size="Large" Text="va_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_va_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_eap_app_date_lbl" runat="server" Font-Size="Large" Text="eap_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_eap_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_eap_amt_lbl" runat="server" Font-Size="Large" Text="eap_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_eap_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_eap_Inc_lbl" runat="server" Font-Size="Large" Text="eap_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_eap_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_fema_app_date_lbl" runat="server" Font-Size="Large" Text="fema_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_fema_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_fema_amt_lbl" runat="server" Font-Size="Large" Text="fema_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_fema_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_fema_Inc_lbl" runat="server" Font-Size="Large" Text="fema_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_fema_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_unempl_app_date_lbl" runat="server" Font-Size="Large" Text="unempl_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_unempl_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_unempl_amt_lbl" runat="server" Font-Size="Large" Text="unempl_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_unempl_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_unempl_Inc_lbl" runat="server" Font-Size="Large" Text="unempl_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_unempl_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_grants_loans_app_date_lbl" runat="server" Font-Size="Large" Text="grants_loans_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_grants_loans_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_grants_loans_amt_lbl" runat="server" Font-Size="Large" Text="grants_loans_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_grants_loans_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_grants_Inc_lbl" runat="server" Font-Size="Large" Text="grants_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_grants_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_other_app_date_lbl" runat="server" Font-Size="Large" Text="other_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_other_app_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_other_amt_lbl" runat="server" Font-Size="Large" Text="other_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_other_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_other_Inc_lbl" runat="server" Font-Size="Large" Text="other_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_other_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_denial_memo_lbl" runat="server" Font-Size="Large" Text="denial_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_denial_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_welfr_fraud_memo_lbl" runat="server" Font-Size="Large" Text="welfr_fraud_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_welfr_fraud_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Client_issue_Desc_lbl" runat="server" Font-Size="Large" Text="Client_issue_Desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Client_issue_Desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Client_issue_resolved_lbl" runat="server" Font-Size="Large" Text="Client_issue_resolved:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Client_issue_resolved_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Client_issue_comments_lbl" runat="server" Font-Size="Large" Text="Client_issue_comments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Client_issue_comments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpecase_clientInfo" runat="server" CollapseControlID="Update_case_client_InfoHead" CollapsedText="Show case_client Information" Enabled="True" ExpandControlID="Update_case_client_InfoHead" ExpandedText="case_client Information" TargetControlID="Update_case_client_InfoBody" TextLabelID="Update_case_client_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_case_client_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="case_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="cable_amt_owed_today" HeaderText="cable_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="cable_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="colessee_name" HeaderText="colessee_name" InsertVisible="False" ReadOnly="True" SortExpression="colessee_name" Visible="false" />
                            <asp:BoundField DataField="child_support" HeaderText="child_support" InsertVisible="False" ReadOnly="True" SortExpression="child_support" Visible="false" />
                            <asp:BoundField DataField="child_support_memo" HeaderText="child_support_memo" InsertVisible="False" ReadOnly="True" SortExpression="child_support_memo" Visible="false" />
                            <asp:BoundField DataField="curr_residence_date" HeaderText="curr_residence_date" InsertVisible="False" ReadOnly="True" SortExpression="curr_residence_date" Visible="false" />
                            <asp:BoundField DataField="electric_amt_owed_today" HeaderText="electric_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="electric_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="employment_memo" HeaderText="employment_memo" InsertVisible="False" ReadOnly="True" SortExpression="employment_memo" Visible="false" />
                            <asp:BoundField DataField="employment_status" HeaderText="employment_status" InsertVisible="False" ReadOnly="True" SortExpression="employment_status" Visible="false" />
                            <asp:BoundField DataField="gas_or_heating_amt_owed_today" HeaderText="gas_or_heating_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="gas_or_heating_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="housing_amt_owed_today" HeaderText="housing_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="housing_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="housing_status" HeaderText="housing_status" InsertVisible="False" ReadOnly="True" SortExpression="housing_status" Visible="false" />
                            <asp:BoundField DataField="income_status" HeaderText="income_status" InsertVisible="False" ReadOnly="True" SortExpression="income_status" Visible="false" />
                            <asp:BoundField DataField="lease_num_adults" HeaderText="lease_num_adults" InsertVisible="False" ReadOnly="True" SortExpression="lease_num_adults" Visible="false" />
                            <asp:BoundField DataField="lease_start_date" HeaderText="lease_start_date" InsertVisible="False" ReadOnly="True" SortExpression="lease_start_date" Visible="false" />
                            <asp:BoundField DataField="minor_children" HeaderText="minor_children" InsertVisible="False" ReadOnly="True" SortExpression="minor_children" Visible="false" />
                            <asp:BoundField DataField="monthly_rent_amt" HeaderText="monthly_rent_amt" InsertVisible="False" ReadOnly="True" SortExpression="monthly_rent_amt" Visible="false" />
                            <asp:BoundField DataField="Other_help_Sources" HeaderText="Other_help_Sources" InsertVisible="False" ReadOnly="True" SortExpression="Other_help_Sources" Visible="false" />
                            <asp:BoundField DataField="Other_help_Sources_memo" HeaderText="Other_help_Sources_memo" InsertVisible="False" ReadOnly="True" SortExpression="Other_help_Sources_memo" Visible="false" />
                            <asp:BoundField DataField="prev_address_id" HeaderText="prev_address_id" InsertVisible="False" ReadOnly="True" SortExpression="prev_address_id" Visible="false" />
                            <asp:BoundField DataField="prev_residence_date" HeaderText="prev_residence_date" InsertVisible="False" ReadOnly="True" SortExpression="prev_residence_date" Visible="false" />
                            <asp:BoundField DataField="relationship_to_head_of_household" HeaderText="relationship_to_head_of_household" InsertVisible="False" ReadOnly="True" SortExpression="relationship_to_head_of_household" Visible="false" />
                            <asp:BoundField DataField="rental_name" HeaderText="rental_name" InsertVisible="False" ReadOnly="True" SortExpression="rental_name" Visible="false" />
                            <asp:BoundField DataField="rental_phone" HeaderText="rental_phone" InsertVisible="False" ReadOnly="True" SortExpression="rental_phone" Visible="false" />
                            <asp:BoundField DataField="sewage_amt_owed_today" HeaderText="sewage_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="sewage_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="telephone_amt_owed_today" HeaderText="telephone_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="telephone_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="trash_removal_amt_owed_today" HeaderText="trash_removal_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="trash_removal_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="us_status_memo" HeaderText="us_status_memo" InsertVisible="False" ReadOnly="True" SortExpression="us_status_memo" Visible="false" />
                            <asp:BoundField DataField="related_ll" HeaderText="related_ll" InsertVisible="False" ReadOnly="True" SortExpression="related_ll" Visible="false" />
                            <asp:BoundField DataField="relation_to_ll" HeaderText="relation_to_ll" InsertVisible="False" ReadOnly="True" SortExpression="relation_to_ll" Visible="false" />
                            <asp:BoundField DataField="mtg_amt_owed_today" HeaderText="mtg_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="mtg_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="utilities_list" HeaderText="utilities_list" InsertVisible="False" ReadOnly="True" SortExpression="utilities_list" Visible="false" />
                            <asp:BoundField DataField="water_amt_owed_today" HeaderText="water_amt_owed_today" InsertVisible="False" ReadOnly="True" SortExpression="water_amt_owed_today" Visible="false" />
                            <asp:BoundField DataField="public_asst_app_date" HeaderText="public_asst_app_date" InsertVisible="False" ReadOnly="True" SortExpression="public_asst_app_date" Visible="false" />
                            <asp:BoundField DataField="util_allot_app_date" HeaderText="util_allot_app_date" InsertVisible="False" ReadOnly="True" SortExpression="util_allot_app_date" Visible="false" />
                            <asp:BoundField DataField="util_allot_amt" HeaderText="util_allot_amt" InsertVisible="False" ReadOnly="True" SortExpression="util_allot_amt" Visible="false" />
                            <asp:BoundField DataField="utilities_incl" HeaderText="utilities_incl" InsertVisible="False" ReadOnly="True" SortExpression="utilities_incl" Visible="false" />
                            <asp:BoundField DataField="fd_stmps_app_date" HeaderText="fd_stmps_app_date" InsertVisible="False" ReadOnly="True" SortExpression="fd_stmps_app_date" Visible="false" />
                            <asp:BoundField DataField="fd_stmps_amt" HeaderText="fd_stmps_amt" InsertVisible="False" ReadOnly="True" SortExpression="fd_stmps_amt" Visible="false" />
                            <asp:BoundField DataField="fd_Inc" HeaderText="fd_Inc" InsertVisible="False" ReadOnly="True" SortExpression="fd_Inc" Visible="false" />
                            <asp:BoundField DataField="afdc_app_date" HeaderText="afdc_app_date" InsertVisible="False" ReadOnly="True" SortExpression="afdc_app_date" Visible="false" />
                            <asp:BoundField DataField="afdc_amt" HeaderText="afdc_amt" InsertVisible="False" ReadOnly="True" SortExpression="afdc_amt" Visible="false" />
                            <asp:BoundField DataField="afdc_Inc" HeaderText="afdc_Inc" InsertVisible="False" ReadOnly="True" SortExpression="afdc_Inc" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_app_date" HeaderText="oth_trustee_app_date" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_app_date" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_amt" HeaderText="oth_trustee_amt" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_amt" Visible="false" />
                            <asp:BoundField DataField="oth_trustee_Inc" HeaderText="oth_trustee_Inc" InsertVisible="False" ReadOnly="True" SortExpression="oth_trustee_Inc" Visible="false" />
                            <asp:BoundField DataField="ss_app_date" HeaderText="ss_app_date" InsertVisible="False" ReadOnly="True" SortExpression="ss_app_date" Visible="false" />
                            <asp:BoundField DataField="ss_amt" HeaderText="ss_amt" InsertVisible="False" ReadOnly="True" SortExpression="ss_amt" Visible="false" />
                            <asp:BoundField DataField="ss_Inc" HeaderText="ss_Inc" InsertVisible="False" ReadOnly="True" SortExpression="ss_Inc" Visible="false" />
                            <asp:BoundField DataField="va_app_date" HeaderText="va_app_date" InsertVisible="False" ReadOnly="True" SortExpression="va_app_date" Visible="false" />
                            <asp:BoundField DataField="va_amt" HeaderText="va_amt" InsertVisible="False" ReadOnly="True" SortExpression="va_amt" Visible="false" />
                            <asp:BoundField DataField="va_Inc" HeaderText="va_Inc" InsertVisible="False" ReadOnly="True" SortExpression="va_Inc" Visible="false" />
                            <asp:BoundField DataField="eap_app_date" HeaderText="eap_app_date" InsertVisible="False" ReadOnly="True" SortExpression="eap_app_date" Visible="false" />
                            <asp:BoundField DataField="eap_amt" HeaderText="eap_amt" InsertVisible="False" ReadOnly="True" SortExpression="eap_amt" Visible="false" />
                            <asp:BoundField DataField="eap_Inc" HeaderText="eap_Inc" InsertVisible="False" ReadOnly="True" SortExpression="eap_Inc" Visible="false" />
                            <asp:BoundField DataField="fema_app_date" HeaderText="fema_app_date" InsertVisible="False" ReadOnly="True" SortExpression="fema_app_date" Visible="false" />
                            <asp:BoundField DataField="fema_amt" HeaderText="fema_amt" InsertVisible="False" ReadOnly="True" SortExpression="fema_amt" Visible="false" />
                            <asp:BoundField DataField="fema_Inc" HeaderText="fema_Inc" InsertVisible="False" ReadOnly="True" SortExpression="fema_Inc" Visible="false" />
                            <asp:BoundField DataField="unempl_app_date" HeaderText="unempl_app_date" InsertVisible="False" ReadOnly="True" SortExpression="unempl_app_date" Visible="false" />
                            <asp:BoundField DataField="unempl_amt" HeaderText="unempl_amt" InsertVisible="False" ReadOnly="True" SortExpression="unempl_amt" Visible="false" />
                            <asp:BoundField DataField="unempl_Inc" HeaderText="unempl_Inc" InsertVisible="False" ReadOnly="True" SortExpression="unempl_Inc" Visible="false" />
                            <asp:BoundField DataField="grants_loans_app_date" HeaderText="grants_loans_app_date" InsertVisible="False" ReadOnly="True" SortExpression="grants_loans_app_date" Visible="false" />
                            <asp:BoundField DataField="grants_loans_amt" HeaderText="grants_loans_amt" InsertVisible="False" ReadOnly="True" SortExpression="grants_loans_amt" Visible="false" />
                            <asp:BoundField DataField="grants_Inc" HeaderText="grants_Inc" InsertVisible="False" ReadOnly="True" SortExpression="grants_Inc" Visible="false" />
                            <asp:BoundField DataField="other_app_date" HeaderText="other_app_date" InsertVisible="False" ReadOnly="True" SortExpression="other_app_date" Visible="false" />
                            <asp:BoundField DataField="other_amt" HeaderText="other_amt" InsertVisible="False" ReadOnly="True" SortExpression="other_amt" Visible="false" />
                            <asp:BoundField DataField="other_Inc" HeaderText="other_Inc" InsertVisible="False" ReadOnly="True" SortExpression="other_Inc" Visible="false" />
                            <asp:BoundField DataField="denial_memo" HeaderText="denial_memo" InsertVisible="False" ReadOnly="True" SortExpression="denial_memo" Visible="false" />
                            <asp:BoundField DataField="welfr_fraud_memo" HeaderText="welfr_fraud_memo" InsertVisible="False" ReadOnly="True" SortExpression="welfr_fraud_memo" Visible="false" />
                            <asp:BoundField DataField="Client_issue_Desc" HeaderText="Client_issue_Desc" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_Desc" Visible="false" />
                            <asp:BoundField DataField="Client_issue_resolved" HeaderText="Client_issue_resolved" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_resolved" Visible="false" />
                            <asp:BoundField DataField="Client_issue_comments" HeaderText="Client_issue_comments" InsertVisible="False" ReadOnly="True" SortExpression="Client_issue_comments" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [case_id], [client_id], [address_id], [cable_amt_owed_today], [colessee_name], [child_support], [child_support_memo], [curr_residence_date], [electric_amt_owed_today], [employment_memo], [employment_status], [gas_or_heating_amt_owed_today], [housing_amt_owed_today], [housing_status], [income_status], [lease_num_adults], [lease_start_date], [minor_children], [monthly_rent_amt], [Other_help_Sources], [Other_help_Sources_memo], [prev_address_id], [prev_residence_date], [relationship_to_head_of_household], [rental_name], [rental_phone], [sewage_amt_owed_today], [telephone_amt_owed_today], [trash_removal_amt_owed_today], [us_status_memo], [related_ll], [relation_to_ll], [mtg_amt_owed_today], [utilities_list], [water_amt_owed_today], [public_asst_app_date], [util_allot_app_date], [util_allot_amt], [utilities_incl], [fd_stmps_app_date], [fd_stmps_amt], [fd_Inc], [afdc_app_date], [afdc_amt], [afdc_Inc], [oth_trustee_app_date], [oth_trustee_amt], [oth_trustee_Inc], [ss_app_date], [ss_amt], [ss_Inc], [va_app_date], [va_amt], [va_Inc], [eap_app_date], [eap_amt], [eap_Inc], [fema_app_date], [fema_amt], [fema_Inc], [unempl_app_date], [unempl_amt], [unempl_Inc], [grants_loans_app_date], [grants_loans_amt], [grants_Inc], [other_app_date], [other_amt], [other_Inc], [denial_memo], [welfr_fraud_memo], [Client_issue_Desc], [Client_issue_resolved], [Client_issue_comments] FROM [case_client]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_case_client_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_case_client_InfoHead_label" Style="padding: 10px" runat="server" Text="case_client Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_case_client_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_case_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_client_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_cable_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="cable_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_cable_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_colessee_name_lbl" runat="server" Font-Size="Large" Text="colessee_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_colessee_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_child_support_lbl" runat="server" Font-Size="Large" Text="child_support:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_child_support_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_child_support_memo_lbl" runat="server" Font-Size="Large" Text="child_support_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_child_support_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_curr_residence_date_lbl" runat="server" Font-Size="Large" Text="curr_residence_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_curr_residence_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_electric_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="electric_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_electric_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employment_memo_lbl" runat="server" Font-Size="Large" Text="employment_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employment_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_employment_status_lbl" runat="server" Font-Size="Large" Text="employment_status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_employment_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_gas_or_heating_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="gas_or_heating_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_gas_or_heating_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_housing_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="housing_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_housing_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_housing_status_lbl" runat="server" Font-Size="Large" Text="housing_status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_housing_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_income_status_lbl" runat="server" Font-Size="Large" Text="income_status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_income_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_lease_num_adults_lbl" runat="server" Font-Size="Large" Text="lease_num_adults:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_lease_num_adults_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_lease_start_date_lbl" runat="server" Font-Size="Large" Text="lease_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_lease_start_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_minor_children_lbl" runat="server" Font-Size="Large" Text="minor_children:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_minor_children_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_monthly_rent_amt_lbl" runat="server" Font-Size="Large" Text="monthly_rent_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_monthly_rent_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Other_help_Sources_lbl" runat="server" Font-Size="Large" Text="Other_help_Sources:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Other_help_Sources_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Other_help_Sources_memo_lbl" runat="server" Font-Size="Large" Text="Other_help_Sources_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Other_help_Sources_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_prev_address_id_lbl" runat="server" Font-Size="Large" Text="prev_address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_prev_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_prev_residence_date_lbl" runat="server" Font-Size="Large" Text="prev_residence_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_prev_residence_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_relationship_to_head_of_household_lbl" runat="server" Font-Size="Large" Text="relationship_to_head_of_household:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_relationship_to_head_of_household_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_rental_name_lbl" runat="server" Font-Size="Large" Text="rental_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_rental_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_rental_phone_lbl" runat="server" Font-Size="Large" Text="rental_phone:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_rental_phone_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_sewage_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="sewage_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_sewage_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_telephone_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="telephone_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_telephone_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_trash_removal_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="trash_removal_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_trash_removal_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_us_status_memo_lbl" runat="server" Font-Size="Large" Text="us_status_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_us_status_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_related_ll_lbl" runat="server" Font-Size="Large" Text="related_ll:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_related_ll_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_relation_to_ll_lbl" runat="server" Font-Size="Large" Text="relation_to_ll:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_relation_to_ll_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_mtg_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="mtg_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_mtg_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_utilities_list_lbl" runat="server" Font-Size="Large" Text="utilities_list:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_utilities_list_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_water_amt_owed_today_lbl" runat="server" Font-Size="Large" Text="water_amt_owed_today:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_water_amt_owed_today_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_public_asst_app_date_lbl" runat="server" Font-Size="Large" Text="public_asst_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_public_asst_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_util_allot_app_date_lbl" runat="server" Font-Size="Large" Text="util_allot_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_util_allot_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_util_allot_amt_lbl" runat="server" Font-Size="Large" Text="util_allot_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_util_allot_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_utilities_incl_lbl" runat="server" Font-Size="Large" Text="utilities_incl:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_utilities_incl_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_fd_stmps_app_date_lbl" runat="server" Font-Size="Large" Text="fd_stmps_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_fd_stmps_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_fd_stmps_amt_lbl" runat="server" Font-Size="Large" Text="fd_stmps_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_fd_stmps_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_fd_Inc_lbl" runat="server" Font-Size="Large" Text="fd_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_fd_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_afdc_app_date_lbl" runat="server" Font-Size="Large" Text="afdc_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_afdc_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_afdc_amt_lbl" runat="server" Font-Size="Large" Text="afdc_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_afdc_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_afdc_Inc_lbl" runat="server" Font-Size="Large" Text="afdc_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_afdc_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_oth_trustee_app_date_lbl" runat="server" Font-Size="Large" Text="oth_trustee_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_oth_trustee_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_oth_trustee_amt_lbl" runat="server" Font-Size="Large" Text="oth_trustee_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_oth_trustee_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_oth_trustee_Inc_lbl" runat="server" Font-Size="Large" Text="oth_trustee_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_oth_trustee_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ss_app_date_lbl" runat="server" Font-Size="Large" Text="ss_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ss_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ss_amt_lbl" runat="server" Font-Size="Large" Text="ss_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ss_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ss_Inc_lbl" runat="server" Font-Size="Large" Text="ss_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ss_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_va_app_date_lbl" runat="server" Font-Size="Large" Text="va_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_va_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_va_amt_lbl" runat="server" Font-Size="Large" Text="va_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_va_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_va_Inc_lbl" runat="server" Font-Size="Large" Text="va_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_va_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_eap_app_date_lbl" runat="server" Font-Size="Large" Text="eap_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_eap_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_eap_amt_lbl" runat="server" Font-Size="Large" Text="eap_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_eap_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_eap_Inc_lbl" runat="server" Font-Size="Large" Text="eap_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_eap_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_fema_app_date_lbl" runat="server" Font-Size="Large" Text="fema_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_fema_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_fema_amt_lbl" runat="server" Font-Size="Large" Text="fema_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_fema_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_fema_Inc_lbl" runat="server" Font-Size="Large" Text="fema_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_fema_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_unempl_app_date_lbl" runat="server" Font-Size="Large" Text="unempl_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_unempl_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_unempl_amt_lbl" runat="server" Font-Size="Large" Text="unempl_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_unempl_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_unempl_Inc_lbl" runat="server" Font-Size="Large" Text="unempl_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_unempl_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_grants_loans_app_date_lbl" runat="server" Font-Size="Large" Text="grants_loans_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_grants_loans_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_grants_loans_amt_lbl" runat="server" Font-Size="Large" Text="grants_loans_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_grants_loans_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_grants_Inc_lbl" runat="server" Font-Size="Large" Text="grants_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_grants_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_other_app_date_lbl" runat="server" Font-Size="Large" Text="other_app_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_other_app_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_other_amt_lbl" runat="server" Font-Size="Large" Text="other_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_other_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_other_Inc_lbl" runat="server" Font-Size="Large" Text="other_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_other_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_denial_memo_lbl" runat="server" Font-Size="Large" Text="denial_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_denial_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_welfr_fraud_memo_lbl" runat="server" Font-Size="Large" Text="welfr_fraud_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_welfr_fraud_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Client_issue_Desc_lbl" runat="server" Font-Size="Large" Text="Client_issue_Desc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Client_issue_Desc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Client_issue_resolved_lbl" runat="server" Font-Size="Large" Text="Client_issue_resolved:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Client_issue_resolved_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Client_issue_comments_lbl" runat="server" Font-Size="Large" Text="Client_issue_comments:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Client_issue_comments_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpecase_clientInfo" runat="server" CollapseControlID="Delete_case_client_InfoHead" CollapsedText="Show case_client Information" Enabled="True" ExpandControlID="Delete_case_client_InfoHead" ExpandedText="case_client Information" TargetControlID="Delete_case_client_InfoBody" TextLabelID="Delete_case_client_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

