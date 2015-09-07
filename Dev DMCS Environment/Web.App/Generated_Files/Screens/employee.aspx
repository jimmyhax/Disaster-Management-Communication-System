<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="employee.aspx.cs" Inherits="Web.App.employeeClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="employeeCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>employee CRUD Operations:</span></h1>
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
                                    DataKeyNames="employee_id"
                                    DataSourceID="employee_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" InsertVisible="False" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="employee_date_hired" HeaderText="employee_date_hired" InsertVisible="False" ReadOnly="True" SortExpression="employee_date_hired" />
                                        <asp:BoundField DataField="employee_department" HeaderText="employee_department" InsertVisible="False" ReadOnly="True" SortExpression="employee_department" Visible="false" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="employee_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [employee]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">member_id</span>
                                <asp:TextBox class="pull-right form-control" ID="member_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_date_hired</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_date_hired_Insert_TextBox" ID="employee_date_hired_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="employee_date_hired_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_department</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_department_Insert_TextBox" ID="employee_department_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employee_department_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_hours_worked</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_hours_worked_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_leadership</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_leadership_Insert_TextBox" ID="employee_leadership_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employee_leadership_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_motivation</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_motivation_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_notes</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_notes_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_overall</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_overall_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_payrate</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_payrate_Insert_TextBox" ID="employee_payrate_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employee_payrate_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_performance</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_performance_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_quality</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_quality_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_timeliness</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_timeliness_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">username</span>
                                <asp:TextBox class="pull-right form-control" ID="username_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pswd</span>
                                <asp:TextBox class="pull-right form-control" ID="pswd_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="employee_id"
                                    DataSourceID="employee_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" InsertVisible="False" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="employee_date_hired" HeaderText="employee_date_hired" InsertVisible="False" ReadOnly="True" SortExpression="employee_date_hired" />
                                        <asp:BoundField DataField="employee_department" HeaderText="employee_department" InsertVisible="False" ReadOnly="True" SortExpression="employee_department" Visible="false" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="employee_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [employee]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_id_Update_TextBox" ID="employee_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employee_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">member_id</span>
                                <asp:TextBox class="pull-right form-control" ID="member_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_date_hired</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_date_hired_Update_TextBox" ID="employee_date_hired_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="employee_date_hired_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_department</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_department_Update_TextBox" ID="employee_department_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employee_department_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_hours_worked</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_hours_worked_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_leadership</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_leadership_Update_TextBox" ID="employee_leadership_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employee_leadership_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_motivation</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_motivation_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_notes</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_notes_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_overall</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_overall_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_payrate</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="employee_payrate_Update_TextBox" ID="employee_payrate_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="employee_payrate_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_performance</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_performance_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_quality</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_quality_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_timeliness</span>
                                <asp:TextBox class="pull-right form-control" ID="employee_timeliness_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">username</span>
                                <asp:TextBox class="pull-right form-control" ID="username_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pswd</span>
                                <asp:TextBox class="pull-right form-control" ID="pswd_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="employee_id"
                                    DataSourceID="employee_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" InsertVisible="False" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="employee_date_hired" HeaderText="employee_date_hired" InsertVisible="False" ReadOnly="True" SortExpression="employee_date_hired" />
                                        <asp:BoundField DataField="employee_department" HeaderText="employee_department" InsertVisible="False" ReadOnly="True" SortExpression="employee_department" Visible="false" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="employee_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [employee]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">member_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="member_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_date_hired</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="employee_date_hired_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_department</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_department_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_hours_worked</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_hours_worked_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_leadership</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_leadership_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_motivation</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_motivation_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_notes</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_notes_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_overall</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_overall_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_payrate</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_payrate_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_performance</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_performance_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_quality</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_quality_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">employee_timeliness</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="employee_timeliness_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">username</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="username_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pswd</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="pswd_Delete_TextBox" runat="server"></asp:TextBox>
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

