<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="case_client.aspx.cs" Inherits="Web.App.case_clientClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="case_clientCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>case_client CRUD Operations:</span></h1>
        </div>
        <div class="body-contents col-lg-12">
            <ajaxToolkit:TabContainer ID="TabContainer" runat="server" ActiveTabIndex="0" Height="100%">
                <ajaxToolkit:TabPanel runat="server" HeaderText="Insert" ID="Insert_Tab">
                    <ContentTemplate>
                        <div class="gridview-container" align="center">
                            <div class="gridview-contents">
                                <asp:GridView
                                    ID="Insert_GridView"
                                    runat="server"
                                    AllowPaging="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="case_id"
                                    DataSourceID="case_client_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="case_client_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [case_client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_id_Insert_TextBox" ID="client_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Insert_TextBox" ID="address_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cable_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="cable_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">colessee_name</span>
                                <asp:TextBox class="pull-right form-control" ID="colessee_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">child_support</span>
                                <asp:TextBox class="pull-right form-control" ID="child_support_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">child_support_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="child_support_memo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">curr_residence_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="curr_residence_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">electric_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="electric_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employment_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="employment_memo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employment_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employment_status_Insert_TextBox" ID="employment_status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employment_status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gas_or_heating_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="gas_or_heating_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">housing_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="housing_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">housing_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="housing_status_Insert_TextBox" ID="housing_status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="housing_status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">income_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="income_status_Insert_TextBox" ID="income_status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="income_status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lease_num_adults</span>
                                <asp:TextBox class="pull-right form-control" ID="lease_num_adults_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lease_start_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="lease_start_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">minor_children</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="minor_children_Insert_TextBox" ID="minor_children_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="minor_children_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">monthly_rent_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="monthly_rent_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other_help_Sources</span>
                                <asp:TextBox class="pull-right form-control" ID="Other_help_Sources_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other_help_Sources_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="Other_help_Sources_memo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prev_address_id</span>
                                <asp:TextBox class="pull-right form-control" ID="prev_address_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prev_residence_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="prev_residence_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">relationship_to_head_of_household</span>
                                <asp:TextBox class="pull-right form-control" ID="relationship_to_head_of_household_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rental_name</span>
                                <asp:TextBox class="pull-right form-control" ID="rental_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rental_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="rental_phone_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sewage_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="sewage_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">telephone_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="telephone_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">trash_removal_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="trash_removal_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">us_status_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="us_status_memo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">related_ll</span>
                                <asp:TextBox class="pull-right form-control" ID="related_ll_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">relation_to_ll</span>
                                <asp:TextBox class="pull-right form-control" ID="relation_to_ll_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mtg_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="mtg_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">utilities_list</span>
                                <asp:TextBox class="pull-right form-control" ID="utilities_list_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">water_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="water_amt_owed_today_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">public_asst_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="public_asst_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">util_allot_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="util_allot_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">util_allot_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="util_allot_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">utilities_incl</span>
                                <asp:TextBox class="pull-right form-control" ID="utilities_incl_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_stmps_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="fd_stmps_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_stmps_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="fd_stmps_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="fd_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="afdc_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="afdc_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="afdc_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="oth_trustee_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="oth_trustee_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="oth_trustee_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="ss_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="ss_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="ss_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="va_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="va_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="va_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="eap_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="eap_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="eap_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="fema_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="fema_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="fema_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="unempl_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="unempl_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="unempl_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_loans_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="grants_loans_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_loans_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="grants_loans_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="grants_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="other_app_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="other_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="other_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">denial_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="denial_memo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">welfr_fraud_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="welfr_fraud_memo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_Desc</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_issue_Desc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_resolved</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_issue_resolved_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_comments</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_issue_comments_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="bottom-btn-container col-lg-12">
                            <asp:Button ID="Insert_Button" runat="server" Text="Create" CssClass="btn btn-default btn-lg one-bottom-btn" OnClick="Insert_Button_Click" ValidationGroup="Insert_Group" />
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Update" ID="Update_Tab">
                    <ContentTemplate>
                        <div class="gridview-container" align="center">
                            <div class="gridview-contents">
                                <asp:GridView
                                    ID="Update_GridView"
                                    runat="server"
                                    AllowPaging="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="case_id"
                                    DataSourceID="case_client_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="case_client_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [case_client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="case_id_Update_TextBox" ID="case_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_id_Update_TextBox" ID="client_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Update_TextBox" ID="address_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cable_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="cable_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">colessee_name</span>
                                <asp:TextBox class="pull-right form-control" ID="colessee_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">child_support</span>
                                <asp:TextBox class="pull-right form-control" ID="child_support_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">child_support_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="child_support_memo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">curr_residence_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="curr_residence_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">electric_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="electric_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employment_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="employment_memo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employment_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employment_status_Update_TextBox" ID="employment_status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employment_status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gas_or_heating_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="gas_or_heating_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">housing_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="housing_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">housing_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="housing_status_Update_TextBox" ID="housing_status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="housing_status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">income_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="income_status_Update_TextBox" ID="income_status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="income_status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lease_num_adults</span>
                                <asp:TextBox class="pull-right form-control" ID="lease_num_adults_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lease_start_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="lease_start_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">minor_children</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="minor_children_Update_TextBox" ID="minor_children_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="minor_children_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">monthly_rent_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="monthly_rent_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other_help_Sources</span>
                                <asp:TextBox class="pull-right form-control" ID="Other_help_Sources_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other_help_Sources_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="Other_help_Sources_memo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prev_address_id</span>
                                <asp:TextBox class="pull-right form-control" ID="prev_address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prev_residence_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="prev_residence_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">relationship_to_head_of_household</span>
                                <asp:TextBox class="pull-right form-control" ID="relationship_to_head_of_household_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rental_name</span>
                                <asp:TextBox class="pull-right form-control" ID="rental_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rental_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="rental_phone_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sewage_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="sewage_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">telephone_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="telephone_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">trash_removal_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="trash_removal_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">us_status_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="us_status_memo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">related_ll</span>
                                <asp:TextBox class="pull-right form-control" ID="related_ll_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">relation_to_ll</span>
                                <asp:TextBox class="pull-right form-control" ID="relation_to_ll_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mtg_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="mtg_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">utilities_list</span>
                                <asp:TextBox class="pull-right form-control" ID="utilities_list_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">water_amt_owed_today</span>
                                <asp:TextBox class="pull-right form-control" ID="water_amt_owed_today_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">public_asst_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="public_asst_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">util_allot_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="util_allot_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">util_allot_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="util_allot_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">utilities_incl</span>
                                <asp:TextBox class="pull-right form-control" ID="utilities_incl_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_stmps_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="fd_stmps_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_stmps_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="fd_stmps_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="fd_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="afdc_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="afdc_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="afdc_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="oth_trustee_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="oth_trustee_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="oth_trustee_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="ss_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="ss_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="ss_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="va_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="va_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="va_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="eap_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="eap_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="eap_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="fema_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="fema_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="fema_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="unempl_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="unempl_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="unempl_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_loans_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="grants_loans_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_loans_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="grants_loans_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="grants_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_app_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="other_app_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="other_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_Inc</span>
                                <asp:TextBox class="pull-right form-control" ID="other_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">denial_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="denial_memo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">welfr_fraud_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="welfr_fraud_memo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_Desc</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_issue_Desc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_resolved</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_issue_resolved_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_comments</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_issue_comments_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="bottom-btn-container col-lg-12">
                            <asp:Button ID="Update_Button" runat="server" Text="Update" CssClass="btn btn-default btn-lg one-bottom-btn" OnClick="Update_Button_Click" ValidationGroup="Update_Group" />
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Delete" ID="Tab_Delete">
                    <ContentTemplate>
                        <div class="gridview-container" align="center">
                            <div class="gridview-contents">
                                <asp:GridView
                                    ID="Delete_GridView"
                                    runat="server"
                                    AllowPaging="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="case_id"
                                    DataSourceID="case_client_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="case_client_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [case_client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="case_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cable_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="cable_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">colessee_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="colessee_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">child_support</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="child_support_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">child_support_memo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="child_support_memo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">curr_residence_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="curr_residence_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">electric_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="electric_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employment_memo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employment_memo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employment_status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employment_status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gas_or_heating_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="gas_or_heating_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">housing_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="housing_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">housing_status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="housing_status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">income_status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="income_status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lease_num_adults</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="lease_num_adults_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lease_start_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="lease_start_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">minor_children</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="minor_children_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">monthly_rent_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="monthly_rent_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other_help_Sources</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Other_help_Sources_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other_help_Sources_memo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Other_help_Sources_memo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prev_address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="prev_address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prev_residence_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="prev_residence_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">relationship_to_head_of_household</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="relationship_to_head_of_household_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rental_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="rental_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rental_phone</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="rental_phone_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sewage_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="sewage_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">telephone_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="telephone_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">trash_removal_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="trash_removal_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">us_status_memo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="us_status_memo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">related_ll</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="related_ll_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">relation_to_ll</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="relation_to_ll_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mtg_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="mtg_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">utilities_list</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="utilities_list_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">water_amt_owed_today</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="water_amt_owed_today_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">public_asst_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="public_asst_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">util_allot_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="util_allot_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">util_allot_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="util_allot_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">utilities_incl</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="utilities_incl_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_stmps_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="fd_stmps_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_stmps_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="fd_stmps_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fd_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="fd_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="afdc_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="afdc_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">afdc_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="afdc_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="oth_trustee_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="oth_trustee_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">oth_trustee_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="oth_trustee_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="ss_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ss_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ss_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ss_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="va_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="va_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">va_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="va_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="eap_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="eap_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eap_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="eap_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="fema_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="fema_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fema_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="fema_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="unempl_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="unempl_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">unempl_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="unempl_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_loans_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="grants_loans_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_loans_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="grants_loans_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">grants_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="grants_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_app_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="other_app_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="other_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="other_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">denial_memo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="denial_memo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">welfr_fraud_memo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="welfr_fraud_memo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_Desc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_issue_Desc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_resolved</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_issue_resolved_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_issue_comments</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_issue_comments_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="bottom-btn-container col-lg-12">
                            <asp:Button ID="Delete_Button" runat="server" Text="Delete" CssClass="btn btn-default btn-lg one-bottom-btn" OnClick="Delete_Button_Click" ValidationGroup="Delete_Group" />
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
        </div>
    </div>
</asp:Content>

