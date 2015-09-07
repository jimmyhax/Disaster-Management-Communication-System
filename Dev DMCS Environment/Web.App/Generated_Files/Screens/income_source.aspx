<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="income_source.aspx.cs" Inherits="Web.App.income_sourceClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="income_sourceCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>income_source CRUD Operations:</span></h1>
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
                                    DataKeyNames="income_source_id"
                                    DataSourceID="income_source_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="income_source_id" HeaderText="income_source_id" InsertVisible="False" ReadOnly="True" SortExpression="income_source_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="cash_amt" HeaderText="cash_amt" InsertVisible="False" ReadOnly="True" SortExpression="cash_amt" />
                                        <asp:BoundField DataField="cash_on_hand" HeaderText="cash_on_hand" InsertVisible="False" ReadOnly="True" SortExpression="cash_on_hand" Visible="false" />
                                        <asp:BoundField DataField="wages_stopped" HeaderText="wages_stopped" InsertVisible="False" ReadOnly="True" SortExpression="wages_stopped" Visible="false" />
                                        <asp:BoundField DataField="waiting_on_income" HeaderText="waiting_on_income" InsertVisible="False" ReadOnly="True" SortExpression="waiting_on_income" Visible="false" />
                                        <asp:BoundField DataField="recieving_income" HeaderText="recieving_income" InsertVisible="False" ReadOnly="True" SortExpression="recieving_income" Visible="false" />
                                        <asp:BoundField DataField="no_income" HeaderText="no_income" InsertVisible="False" ReadOnly="True" SortExpression="no_income" Visible="false" />
                                        <asp:BoundField DataField="currently_working" HeaderText="currently_working" InsertVisible="False" ReadOnly="True" SortExpression="currently_working" Visible="false" />
                                        <asp:BoundField DataField="laid_off" HeaderText="laid_off" InsertVisible="False" ReadOnly="True" SortExpression="laid_off" Visible="false" />
                                        <asp:BoundField DataField="never_worked" HeaderText="never_worked" InsertVisible="False" ReadOnly="True" SortExpression="never_worked" Visible="false" />
                                        <asp:BoundField DataField="quit" HeaderText="quit" InsertVisible="False" ReadOnly="True" SortExpression="quit" Visible="false" />
                                        <asp:BoundField DataField="fired" HeaderText="fired" InsertVisible="False" ReadOnly="True" SortExpression="fired" Visible="false" />
                                        <asp:BoundField DataField="sick_leave" HeaderText="sick_leave" InsertVisible="False" ReadOnly="True" SortExpression="sick_leave" Visible="false" />
                                        <asp:BoundField DataField="maternity_leave" HeaderText="maternity_leave" InsertVisible="False" ReadOnly="True" SortExpression="maternity_leave" Visible="false" />
                                        <asp:BoundField DataField="on_strike" HeaderText="on_strike" InsertVisible="False" ReadOnly="True" SortExpression="on_strike" Visible="false" />
                                        <asp:BoundField DataField="trying_to_find_work" HeaderText="trying_to_find_work" InsertVisible="False" ReadOnly="True" SortExpression="trying_to_find_work" Visible="false" />
                                        <asp:BoundField DataField="ckg_acct" HeaderText="ckg_acct" InsertVisible="False" ReadOnly="True" SortExpression="ckg_acct" Visible="false" />
                                        <asp:BoundField DataField="ckg_balance" HeaderText="ckg_balance" InsertVisible="False" ReadOnly="True" SortExpression="ckg_balance" Visible="false" />
                                        <asp:BoundField DataField="ckg_bank" HeaderText="ckg_bank" InsertVisible="False" ReadOnly="True" SortExpression="ckg_bank" Visible="false" />
                                        <asp:BoundField DataField="claims" HeaderText="claims" InsertVisible="False" ReadOnly="True" SortExpression="claims" Visible="false" />
                                        <asp:BoundField DataField="claims_memo" HeaderText="claims_memo" InsertVisible="False" ReadOnly="True" SortExpression="claims_memo" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="gifts_amt" HeaderText="gifts_amt" InsertVisible="False" ReadOnly="True" SortExpression="gifts_amt" Visible="false" />
                                        <asp:BoundField DataField="gifts_inc" HeaderText="gifts_inc" InsertVisible="False" ReadOnly="True" SortExpression="gifts_inc" Visible="false" />
                                        <asp:BoundField DataField="investments" HeaderText="investments" InsertVisible="False" ReadOnly="True" SortExpression="investments" Visible="false" />
                                        <asp:BoundField DataField="life_ins" HeaderText="life_ins" InsertVisible="False" ReadOnly="True" SortExpression="life_ins" Visible="false" />
                                        <asp:BoundField DataField="other_ins" HeaderText="other_ins" InsertVisible="False" ReadOnly="True" SortExpression="other_ins" Visible="false" />
                                        <asp:BoundField DataField="pension_amt" HeaderText="pension_amt" InsertVisible="False" ReadOnly="True" SortExpression="pension_amt" Visible="false" />
                                        <asp:BoundField DataField="pension_inc" HeaderText="pension_inc" InsertVisible="False" ReadOnly="True" SortExpression="pension_inc" Visible="false" />
                                        <asp:BoundField DataField="strike_benefits_amt" HeaderText="strike_benefits_amt" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_amt" Visible="false" />
                                        <asp:BoundField DataField="strike_benefits_inc" HeaderText="strike_benefits_inc" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_inc" Visible="false" />
                                        <asp:BoundField DataField="support_amt" HeaderText="support_amt" InsertVisible="False" ReadOnly="True" SortExpression="support_amt" Visible="false" />
                                        <asp:BoundField DataField="support_inc" HeaderText="support_inc" InsertVisible="False" ReadOnly="True" SortExpression="support_inc" Visible="false" />
                                        <asp:BoundField DataField="SSI_Amt" HeaderText="SSI_Amt" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Amt" Visible="false" />
                                        <asp:BoundField DataField="SSI_Inc" HeaderText="SSI_Inc" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Inc" Visible="false" />
                                        <asp:BoundField DataField="svgs_acct" HeaderText="svgs_acct" InsertVisible="False" ReadOnly="True" SortExpression="svgs_acct" Visible="false" />
                                        <asp:BoundField DataField="svgs_balance" HeaderText="svgs_balance" InsertVisible="False" ReadOnly="True" SortExpression="svgs_balance" Visible="false" />
                                        <asp:BoundField DataField="svgs_bank" HeaderText="svgs_bank" InsertVisible="False" ReadOnly="True" SortExpression="svgs_bank" Visible="false" />
                                        <asp:BoundField DataField="wages_amt" HeaderText="wages_amt" InsertVisible="False" ReadOnly="True" SortExpression="wages_amt" Visible="false" />
                                        <asp:BoundField DataField="wages_inc" HeaderText="wages_inc" InsertVisible="False" ReadOnly="True" SortExpression="wages_inc" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="income_source_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [income_source]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="case_id_Insert_TextBox" ID="case_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cash_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="cash_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cash_on_hand</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="cash_on_hand_Insert_TextBox" ID="cash_on_hand_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="cash_on_hand_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_stopped</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="wages_stopped_Insert_TextBox" ID="wages_stopped_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="wages_stopped_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">waiting_on_income</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="waiting_on_income_Insert_TextBox" ID="waiting_on_income_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="waiting_on_income_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">recieving_income</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="recieving_income_Insert_TextBox" ID="recieving_income_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="recieving_income_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">no_income</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="no_income_Insert_TextBox" ID="no_income_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="no_income_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">currently_working</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="currently_working_Insert_TextBox" ID="currently_working_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="currently_working_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">laid_off</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="laid_off_Insert_TextBox" ID="laid_off_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="laid_off_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">never_worked</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="never_worked_Insert_TextBox" ID="never_worked_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="never_worked_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quit</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="quit_Insert_TextBox" ID="quit_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="quit_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fired</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="fired_Insert_TextBox" ID="fired_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="fired_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sick_leave</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="sick_leave_Insert_TextBox" ID="sick_leave_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="sick_leave_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">maternity_leave</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="maternity_leave_Insert_TextBox" ID="maternity_leave_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="maternity_leave_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">on_strike</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="on_strike_Insert_TextBox" ID="on_strike_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="on_strike_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">trying_to_find_work</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="trying_to_find_work_Insert_TextBox" ID="trying_to_find_work_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="trying_to_find_work_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_acct</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ckg_acct_Insert_TextBox" ID="ckg_acct_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ckg_acct_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_balance</span>
                                <asp:TextBox class="pull-right form-control" ID="ckg_balance_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_bank</span>
                                <asp:TextBox class="pull-right form-control" ID="ckg_bank_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">claims</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="claims_Insert_TextBox" ID="claims_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="claims_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">claims_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="claims_memo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gifts_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="gifts_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gifts_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="gifts_inc_Insert_TextBox" ID="gifts_inc_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="gifts_inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">investments</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="investments_Insert_TextBox" ID="investments_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="investments_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">life_ins</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="life_ins_Insert_TextBox" ID="life_ins_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="life_ins_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_ins</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="other_ins_Insert_TextBox" ID="other_ins_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="other_ins_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pension_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="pension_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pension_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="pension_inc_Insert_TextBox" ID="pension_inc_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="pension_inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">strike_benefits_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="strike_benefits_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">strike_benefits_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="strike_benefits_inc_Insert_TextBox" ID="strike_benefits_inc_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="strike_benefits_inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">support_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="support_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">support_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="support_inc_Insert_TextBox" ID="support_inc_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="support_inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SSI_Amt</span>
                                <asp:TextBox class="pull-right form-control" ID="SSI_Amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SSI_Inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="SSI_Inc_Insert_TextBox" ID="SSI_Inc_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="SSI_Inc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_acct</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="svgs_acct_Insert_TextBox" ID="svgs_acct_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="svgs_acct_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_balance</span>
                                <asp:TextBox class="pull-right form-control" ID="svgs_balance_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_bank</span>
                                <asp:TextBox class="pull-right form-control" ID="svgs_bank_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="wages_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="wages_inc_Insert_TextBox" ID="wages_inc_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="wages_inc_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="income_source_id"
                                    DataSourceID="income_source_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="income_source_id" HeaderText="income_source_id" InsertVisible="False" ReadOnly="True" SortExpression="income_source_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="cash_amt" HeaderText="cash_amt" InsertVisible="False" ReadOnly="True" SortExpression="cash_amt" />
                                        <asp:BoundField DataField="cash_on_hand" HeaderText="cash_on_hand" InsertVisible="False" ReadOnly="True" SortExpression="cash_on_hand" Visible="false" />
                                        <asp:BoundField DataField="wages_stopped" HeaderText="wages_stopped" InsertVisible="False" ReadOnly="True" SortExpression="wages_stopped" Visible="false" />
                                        <asp:BoundField DataField="waiting_on_income" HeaderText="waiting_on_income" InsertVisible="False" ReadOnly="True" SortExpression="waiting_on_income" Visible="false" />
                                        <asp:BoundField DataField="recieving_income" HeaderText="recieving_income" InsertVisible="False" ReadOnly="True" SortExpression="recieving_income" Visible="false" />
                                        <asp:BoundField DataField="no_income" HeaderText="no_income" InsertVisible="False" ReadOnly="True" SortExpression="no_income" Visible="false" />
                                        <asp:BoundField DataField="currently_working" HeaderText="currently_working" InsertVisible="False" ReadOnly="True" SortExpression="currently_working" Visible="false" />
                                        <asp:BoundField DataField="laid_off" HeaderText="laid_off" InsertVisible="False" ReadOnly="True" SortExpression="laid_off" Visible="false" />
                                        <asp:BoundField DataField="never_worked" HeaderText="never_worked" InsertVisible="False" ReadOnly="True" SortExpression="never_worked" Visible="false" />
                                        <asp:BoundField DataField="quit" HeaderText="quit" InsertVisible="False" ReadOnly="True" SortExpression="quit" Visible="false" />
                                        <asp:BoundField DataField="fired" HeaderText="fired" InsertVisible="False" ReadOnly="True" SortExpression="fired" Visible="false" />
                                        <asp:BoundField DataField="sick_leave" HeaderText="sick_leave" InsertVisible="False" ReadOnly="True" SortExpression="sick_leave" Visible="false" />
                                        <asp:BoundField DataField="maternity_leave" HeaderText="maternity_leave" InsertVisible="False" ReadOnly="True" SortExpression="maternity_leave" Visible="false" />
                                        <asp:BoundField DataField="on_strike" HeaderText="on_strike" InsertVisible="False" ReadOnly="True" SortExpression="on_strike" Visible="false" />
                                        <asp:BoundField DataField="trying_to_find_work" HeaderText="trying_to_find_work" InsertVisible="False" ReadOnly="True" SortExpression="trying_to_find_work" Visible="false" />
                                        <asp:BoundField DataField="ckg_acct" HeaderText="ckg_acct" InsertVisible="False" ReadOnly="True" SortExpression="ckg_acct" Visible="false" />
                                        <asp:BoundField DataField="ckg_balance" HeaderText="ckg_balance" InsertVisible="False" ReadOnly="True" SortExpression="ckg_balance" Visible="false" />
                                        <asp:BoundField DataField="ckg_bank" HeaderText="ckg_bank" InsertVisible="False" ReadOnly="True" SortExpression="ckg_bank" Visible="false" />
                                        <asp:BoundField DataField="claims" HeaderText="claims" InsertVisible="False" ReadOnly="True" SortExpression="claims" Visible="false" />
                                        <asp:BoundField DataField="claims_memo" HeaderText="claims_memo" InsertVisible="False" ReadOnly="True" SortExpression="claims_memo" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="gifts_amt" HeaderText="gifts_amt" InsertVisible="False" ReadOnly="True" SortExpression="gifts_amt" Visible="false" />
                                        <asp:BoundField DataField="gifts_inc" HeaderText="gifts_inc" InsertVisible="False" ReadOnly="True" SortExpression="gifts_inc" Visible="false" />
                                        <asp:BoundField DataField="investments" HeaderText="investments" InsertVisible="False" ReadOnly="True" SortExpression="investments" Visible="false" />
                                        <asp:BoundField DataField="life_ins" HeaderText="life_ins" InsertVisible="False" ReadOnly="True" SortExpression="life_ins" Visible="false" />
                                        <asp:BoundField DataField="other_ins" HeaderText="other_ins" InsertVisible="False" ReadOnly="True" SortExpression="other_ins" Visible="false" />
                                        <asp:BoundField DataField="pension_amt" HeaderText="pension_amt" InsertVisible="False" ReadOnly="True" SortExpression="pension_amt" Visible="false" />
                                        <asp:BoundField DataField="pension_inc" HeaderText="pension_inc" InsertVisible="False" ReadOnly="True" SortExpression="pension_inc" Visible="false" />
                                        <asp:BoundField DataField="strike_benefits_amt" HeaderText="strike_benefits_amt" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_amt" Visible="false" />
                                        <asp:BoundField DataField="strike_benefits_inc" HeaderText="strike_benefits_inc" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_inc" Visible="false" />
                                        <asp:BoundField DataField="support_amt" HeaderText="support_amt" InsertVisible="False" ReadOnly="True" SortExpression="support_amt" Visible="false" />
                                        <asp:BoundField DataField="support_inc" HeaderText="support_inc" InsertVisible="False" ReadOnly="True" SortExpression="support_inc" Visible="false" />
                                        <asp:BoundField DataField="SSI_Amt" HeaderText="SSI_Amt" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Amt" Visible="false" />
                                        <asp:BoundField DataField="SSI_Inc" HeaderText="SSI_Inc" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Inc" Visible="false" />
                                        <asp:BoundField DataField="svgs_acct" HeaderText="svgs_acct" InsertVisible="False" ReadOnly="True" SortExpression="svgs_acct" Visible="false" />
                                        <asp:BoundField DataField="svgs_balance" HeaderText="svgs_balance" InsertVisible="False" ReadOnly="True" SortExpression="svgs_balance" Visible="false" />
                                        <asp:BoundField DataField="svgs_bank" HeaderText="svgs_bank" InsertVisible="False" ReadOnly="True" SortExpression="svgs_bank" Visible="false" />
                                        <asp:BoundField DataField="wages_amt" HeaderText="wages_amt" InsertVisible="False" ReadOnly="True" SortExpression="wages_amt" Visible="false" />
                                        <asp:BoundField DataField="wages_inc" HeaderText="wages_inc" InsertVisible="False" ReadOnly="True" SortExpression="wages_inc" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="income_source_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [income_source]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">income_source_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="income_source_id_Update_TextBox" ID="income_source_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="income_source_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="case_id_Update_TextBox" ID="case_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cash_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="cash_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cash_on_hand</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="cash_on_hand_Update_TextBox" ID="cash_on_hand_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="cash_on_hand_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_stopped</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="wages_stopped_Update_TextBox" ID="wages_stopped_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="wages_stopped_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">waiting_on_income</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="waiting_on_income_Update_TextBox" ID="waiting_on_income_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="waiting_on_income_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">recieving_income</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="recieving_income_Update_TextBox" ID="recieving_income_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="recieving_income_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">no_income</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="no_income_Update_TextBox" ID="no_income_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="no_income_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">currently_working</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="currently_working_Update_TextBox" ID="currently_working_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="currently_working_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">laid_off</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="laid_off_Update_TextBox" ID="laid_off_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="laid_off_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">never_worked</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="never_worked_Update_TextBox" ID="never_worked_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="never_worked_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quit</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="quit_Update_TextBox" ID="quit_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="quit_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fired</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="fired_Update_TextBox" ID="fired_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="fired_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sick_leave</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="sick_leave_Update_TextBox" ID="sick_leave_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="sick_leave_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">maternity_leave</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="maternity_leave_Update_TextBox" ID="maternity_leave_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="maternity_leave_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">on_strike</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="on_strike_Update_TextBox" ID="on_strike_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="on_strike_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">trying_to_find_work</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="trying_to_find_work_Update_TextBox" ID="trying_to_find_work_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="trying_to_find_work_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_acct</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ckg_acct_Update_TextBox" ID="ckg_acct_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ckg_acct_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_balance</span>
                                <asp:TextBox class="pull-right form-control" ID="ckg_balance_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_bank</span>
                                <asp:TextBox class="pull-right form-control" ID="ckg_bank_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">claims</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="claims_Update_TextBox" ID="claims_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="claims_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">claims_memo</span>
                                <asp:TextBox class="pull-right form-control" ID="claims_memo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gifts_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="gifts_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gifts_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="gifts_inc_Update_TextBox" ID="gifts_inc_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="gifts_inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">investments</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="investments_Update_TextBox" ID="investments_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="investments_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">life_ins</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="life_ins_Update_TextBox" ID="life_ins_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="life_ins_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_ins</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="other_ins_Update_TextBox" ID="other_ins_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="other_ins_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pension_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="pension_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pension_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="pension_inc_Update_TextBox" ID="pension_inc_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="pension_inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">strike_benefits_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="strike_benefits_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">strike_benefits_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="strike_benefits_inc_Update_TextBox" ID="strike_benefits_inc_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="strike_benefits_inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">support_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="support_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">support_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="support_inc_Update_TextBox" ID="support_inc_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="support_inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SSI_Amt</span>
                                <asp:TextBox class="pull-right form-control" ID="SSI_Amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SSI_Inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="SSI_Inc_Update_TextBox" ID="SSI_Inc_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="SSI_Inc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_acct</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="svgs_acct_Update_TextBox" ID="svgs_acct_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="svgs_acct_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_balance</span>
                                <asp:TextBox class="pull-right form-control" ID="svgs_balance_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_bank</span>
                                <asp:TextBox class="pull-right form-control" ID="svgs_bank_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_amt</span>
                                <asp:TextBox class="pull-right form-control" ID="wages_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_inc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="wages_inc_Update_TextBox" ID="wages_inc_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="wages_inc_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="income_source_id"
                                    DataSourceID="income_source_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="income_source_id" HeaderText="income_source_id" InsertVisible="False" ReadOnly="True" SortExpression="income_source_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="cash_amt" HeaderText="cash_amt" InsertVisible="False" ReadOnly="True" SortExpression="cash_amt" />
                                        <asp:BoundField DataField="cash_on_hand" HeaderText="cash_on_hand" InsertVisible="False" ReadOnly="True" SortExpression="cash_on_hand" Visible="false" />
                                        <asp:BoundField DataField="wages_stopped" HeaderText="wages_stopped" InsertVisible="False" ReadOnly="True" SortExpression="wages_stopped" Visible="false" />
                                        <asp:BoundField DataField="waiting_on_income" HeaderText="waiting_on_income" InsertVisible="False" ReadOnly="True" SortExpression="waiting_on_income" Visible="false" />
                                        <asp:BoundField DataField="recieving_income" HeaderText="recieving_income" InsertVisible="False" ReadOnly="True" SortExpression="recieving_income" Visible="false" />
                                        <asp:BoundField DataField="no_income" HeaderText="no_income" InsertVisible="False" ReadOnly="True" SortExpression="no_income" Visible="false" />
                                        <asp:BoundField DataField="currently_working" HeaderText="currently_working" InsertVisible="False" ReadOnly="True" SortExpression="currently_working" Visible="false" />
                                        <asp:BoundField DataField="laid_off" HeaderText="laid_off" InsertVisible="False" ReadOnly="True" SortExpression="laid_off" Visible="false" />
                                        <asp:BoundField DataField="never_worked" HeaderText="never_worked" InsertVisible="False" ReadOnly="True" SortExpression="never_worked" Visible="false" />
                                        <asp:BoundField DataField="quit" HeaderText="quit" InsertVisible="False" ReadOnly="True" SortExpression="quit" Visible="false" />
                                        <asp:BoundField DataField="fired" HeaderText="fired" InsertVisible="False" ReadOnly="True" SortExpression="fired" Visible="false" />
                                        <asp:BoundField DataField="sick_leave" HeaderText="sick_leave" InsertVisible="False" ReadOnly="True" SortExpression="sick_leave" Visible="false" />
                                        <asp:BoundField DataField="maternity_leave" HeaderText="maternity_leave" InsertVisible="False" ReadOnly="True" SortExpression="maternity_leave" Visible="false" />
                                        <asp:BoundField DataField="on_strike" HeaderText="on_strike" InsertVisible="False" ReadOnly="True" SortExpression="on_strike" Visible="false" />
                                        <asp:BoundField DataField="trying_to_find_work" HeaderText="trying_to_find_work" InsertVisible="False" ReadOnly="True" SortExpression="trying_to_find_work" Visible="false" />
                                        <asp:BoundField DataField="ckg_acct" HeaderText="ckg_acct" InsertVisible="False" ReadOnly="True" SortExpression="ckg_acct" Visible="false" />
                                        <asp:BoundField DataField="ckg_balance" HeaderText="ckg_balance" InsertVisible="False" ReadOnly="True" SortExpression="ckg_balance" Visible="false" />
                                        <asp:BoundField DataField="ckg_bank" HeaderText="ckg_bank" InsertVisible="False" ReadOnly="True" SortExpression="ckg_bank" Visible="false" />
                                        <asp:BoundField DataField="claims" HeaderText="claims" InsertVisible="False" ReadOnly="True" SortExpression="claims" Visible="false" />
                                        <asp:BoundField DataField="claims_memo" HeaderText="claims_memo" InsertVisible="False" ReadOnly="True" SortExpression="claims_memo" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="gifts_amt" HeaderText="gifts_amt" InsertVisible="False" ReadOnly="True" SortExpression="gifts_amt" Visible="false" />
                                        <asp:BoundField DataField="gifts_inc" HeaderText="gifts_inc" InsertVisible="False" ReadOnly="True" SortExpression="gifts_inc" Visible="false" />
                                        <asp:BoundField DataField="investments" HeaderText="investments" InsertVisible="False" ReadOnly="True" SortExpression="investments" Visible="false" />
                                        <asp:BoundField DataField="life_ins" HeaderText="life_ins" InsertVisible="False" ReadOnly="True" SortExpression="life_ins" Visible="false" />
                                        <asp:BoundField DataField="other_ins" HeaderText="other_ins" InsertVisible="False" ReadOnly="True" SortExpression="other_ins" Visible="false" />
                                        <asp:BoundField DataField="pension_amt" HeaderText="pension_amt" InsertVisible="False" ReadOnly="True" SortExpression="pension_amt" Visible="false" />
                                        <asp:BoundField DataField="pension_inc" HeaderText="pension_inc" InsertVisible="False" ReadOnly="True" SortExpression="pension_inc" Visible="false" />
                                        <asp:BoundField DataField="strike_benefits_amt" HeaderText="strike_benefits_amt" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_amt" Visible="false" />
                                        <asp:BoundField DataField="strike_benefits_inc" HeaderText="strike_benefits_inc" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_inc" Visible="false" />
                                        <asp:BoundField DataField="support_amt" HeaderText="support_amt" InsertVisible="False" ReadOnly="True" SortExpression="support_amt" Visible="false" />
                                        <asp:BoundField DataField="support_inc" HeaderText="support_inc" InsertVisible="False" ReadOnly="True" SortExpression="support_inc" Visible="false" />
                                        <asp:BoundField DataField="SSI_Amt" HeaderText="SSI_Amt" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Amt" Visible="false" />
                                        <asp:BoundField DataField="SSI_Inc" HeaderText="SSI_Inc" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Inc" Visible="false" />
                                        <asp:BoundField DataField="svgs_acct" HeaderText="svgs_acct" InsertVisible="False" ReadOnly="True" SortExpression="svgs_acct" Visible="false" />
                                        <asp:BoundField DataField="svgs_balance" HeaderText="svgs_balance" InsertVisible="False" ReadOnly="True" SortExpression="svgs_balance" Visible="false" />
                                        <asp:BoundField DataField="svgs_bank" HeaderText="svgs_bank" InsertVisible="False" ReadOnly="True" SortExpression="svgs_bank" Visible="false" />
                                        <asp:BoundField DataField="wages_amt" HeaderText="wages_amt" InsertVisible="False" ReadOnly="True" SortExpression="wages_amt" Visible="false" />
                                        <asp:BoundField DataField="wages_inc" HeaderText="wages_inc" InsertVisible="False" ReadOnly="True" SortExpression="wages_inc" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="income_source_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [income_source]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">income_source_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="income_source_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="case_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cash_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="cash_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cash_on_hand</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="cash_on_hand_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_stopped</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="wages_stopped_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">waiting_on_income</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="waiting_on_income_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">recieving_income</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="recieving_income_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">no_income</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="no_income_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">currently_working</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="currently_working_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">laid_off</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="laid_off_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">never_worked</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="never_worked_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quit</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="quit_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">fired</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="fired_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sick_leave</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="sick_leave_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">maternity_leave</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="maternity_leave_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">on_strike</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="on_strike_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">trying_to_find_work</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="trying_to_find_work_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_acct</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ckg_acct_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_balance</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ckg_balance_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ckg_bank</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ckg_bank_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">claims</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="claims_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">claims_memo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="claims_memo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gifts_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="gifts_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gifts_inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="gifts_inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">investments</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="investments_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">life_ins</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="life_ins_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_ins</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="other_ins_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pension_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="pension_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pension_inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="pension_inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">strike_benefits_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="strike_benefits_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">strike_benefits_inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="strike_benefits_inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">support_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="support_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">support_inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="support_inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SSI_Amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="SSI_Amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SSI_Inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="SSI_Inc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_acct</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="svgs_acct_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_balance</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="svgs_balance_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">svgs_bank</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="svgs_bank_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="wages_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">wages_inc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="wages_inc_Delete_TextBox" runat="server"></asp:TextBox>
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

