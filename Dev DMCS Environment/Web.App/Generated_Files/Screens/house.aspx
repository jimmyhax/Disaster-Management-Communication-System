<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="house.aspx.cs" Inherits="Web.App.houseClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="houseCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>house CRUD Operations:</span></h1>
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
                                    DataKeyNames="house_id"
                                    DataSourceID="house_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="house_id" HeaderText="house_id" InsertVisible="False" ReadOnly="True" SortExpression="house_id" />
                                        <asp:BoundField DataField="house_name" HeaderText="house_name" InsertVisible="False" ReadOnly="True" SortExpression="house_name" />
                                        <asp:BoundField DataField="house_eligibility" HeaderText="house_eligibility" InsertVisible="False" ReadOnly="True" SortExpression="house_eligibility" />
                                        <asp:BoundField DataField="house_request_date" HeaderText="house_request_date" InsertVisible="False" ReadOnly="True" SortExpression="house_request_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_amt" HeaderText="house_voucher_amt" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_amt" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_begin_date" HeaderText="house_voucher_begin_date" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_begin_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_exp_date" HeaderText="house_voucher_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_exp_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_num" HeaderText="house_voucher_num" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_num" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_schedule" HeaderText="house_voucher_schedule" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_schedule" Visible="false" />
                                        <asp:BoundField DataField="house_wait_list" HeaderText="house_wait_list" InsertVisible="False" ReadOnly="True" SortExpression="house_wait_list" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="house_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [house]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_name_Insert_TextBox" ID="house_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_eligibility</span>
                                <asp:TextBox class="pull-right form-control" ID="house_eligibility_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_request_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_request_date_Insert_TextBox" ID="house_request_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="house_request_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_amt</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_amt_Insert_TextBox" ID="house_voucher_amt_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_voucher_amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_begin_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_begin_date_Insert_TextBox" ID="house_voucher_begin_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="house_voucher_begin_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_exp_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_exp_date_Insert_TextBox" ID="house_voucher_exp_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="house_voucher_exp_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_num</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_num_Insert_TextBox" ID="house_voucher_num_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_voucher_num_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_schedule</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_schedule_Insert_TextBox" ID="house_voucher_schedule_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_voucher_schedule_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_wait_list</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_wait_list_Insert_TextBox" ID="house_wait_list_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_wait_list_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="house_id"
                                    DataSourceID="house_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="house_id" HeaderText="house_id" InsertVisible="False" ReadOnly="True" SortExpression="house_id" />
                                        <asp:BoundField DataField="house_name" HeaderText="house_name" InsertVisible="False" ReadOnly="True" SortExpression="house_name" />
                                        <asp:BoundField DataField="house_eligibility" HeaderText="house_eligibility" InsertVisible="False" ReadOnly="True" SortExpression="house_eligibility" />
                                        <asp:BoundField DataField="house_request_date" HeaderText="house_request_date" InsertVisible="False" ReadOnly="True" SortExpression="house_request_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_amt" HeaderText="house_voucher_amt" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_amt" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_begin_date" HeaderText="house_voucher_begin_date" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_begin_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_exp_date" HeaderText="house_voucher_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_exp_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_num" HeaderText="house_voucher_num" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_num" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_schedule" HeaderText="house_voucher_schedule" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_schedule" Visible="false" />
                                        <asp:BoundField DataField="house_wait_list" HeaderText="house_wait_list" InsertVisible="False" ReadOnly="True" SortExpression="house_wait_list" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="house_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [house]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_id_Update_TextBox" ID="house_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_name_Update_TextBox" ID="house_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_eligibility</span>
                                <asp:TextBox class="pull-right form-control" ID="house_eligibility_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_request_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_request_date_Update_TextBox" ID="house_request_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="house_request_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_amt</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_amt_Update_TextBox" ID="house_voucher_amt_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_voucher_amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_begin_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_begin_date_Update_TextBox" ID="house_voucher_begin_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="house_voucher_begin_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_exp_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_exp_date_Update_TextBox" ID="house_voucher_exp_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="house_voucher_exp_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_num</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_num_Update_TextBox" ID="house_voucher_num_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_voucher_num_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_schedule</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_voucher_schedule_Update_TextBox" ID="house_voucher_schedule_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_voucher_schedule_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_wait_list</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_wait_list_Update_TextBox" ID="house_wait_list_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_wait_list_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="house_id"
                                    DataSourceID="house_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="house_id" HeaderText="house_id" InsertVisible="False" ReadOnly="True" SortExpression="house_id" />
                                        <asp:BoundField DataField="house_name" HeaderText="house_name" InsertVisible="False" ReadOnly="True" SortExpression="house_name" />
                                        <asp:BoundField DataField="house_eligibility" HeaderText="house_eligibility" InsertVisible="False" ReadOnly="True" SortExpression="house_eligibility" />
                                        <asp:BoundField DataField="house_request_date" HeaderText="house_request_date" InsertVisible="False" ReadOnly="True" SortExpression="house_request_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_amt" HeaderText="house_voucher_amt" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_amt" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_begin_date" HeaderText="house_voucher_begin_date" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_begin_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_exp_date" HeaderText="house_voucher_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_exp_date" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_num" HeaderText="house_voucher_num" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_num" Visible="false" />
                                        <asp:BoundField DataField="house_voucher_schedule" HeaderText="house_voucher_schedule" InsertVisible="False" ReadOnly="True" SortExpression="house_voucher_schedule" Visible="false" />
                                        <asp:BoundField DataField="house_wait_list" HeaderText="house_wait_list" InsertVisible="False" ReadOnly="True" SortExpression="house_wait_list" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="house_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [house]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_eligibility</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_eligibility_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_request_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="house_request_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_voucher_amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_begin_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="house_voucher_begin_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_exp_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="house_voucher_exp_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_num</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_voucher_num_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_voucher_schedule</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_voucher_schedule_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_wait_list</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_wait_list_Delete_TextBox" runat="server"></asp:TextBox>
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

