<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="vendor.aspx.cs" Inherits="Web.App.vendorClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="vendorCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>vendor CRUD Operations:</span></h1>
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
                                    DataKeyNames="vendor_id"
                                    DataSourceID="vendor_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="vendor_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [vendor]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_name_Insert_TextBox" ID="vendor_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_num</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="phone_num_Insert_TextBox" ID="phone_num_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="phone_num_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">email</span>
                                <asp:TextBox class="pull-right form-control" ID="email_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Insert_TextBox" ID="address_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vendor_address2</span>
                                <asp:TextBox class="pull-right form-control" ID="Vendor_address2_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_job_assign</span>
                                <asp:TextBox class="pull-right form-control" ID="vendor_job_assign_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_start_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_start_date_Insert_TextBox" ID="vendor_start_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="vendor_start_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_end_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="vendor_end_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_meth_of_contact</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_meth_of_contact_Insert_TextBox" ID="vendor_meth_of_contact_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_meth_of_contact_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_status_Insert_TextBox" ID="vendor_status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_meth_of_pay</span>
                                <asp:TextBox class="pull-right form-control" ID="vendor_meth_of_pay_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_type_Insert_TextBox" ID="vendor_type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_comments</span>
                                <asp:TextBox class="pull-right form-control" ID="vendor_comments_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_fName</span>
                                <asp:TextBox class="pull-right form-control" ID="primary_fName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_lName</span>
                                <asp:TextBox class="pull-right form-control" ID="primary_lName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="primary_phone_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_fName</span>
                                <asp:TextBox class="pull-right form-control" ID="sec_fName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_lName</span>
                                <asp:TextBox class="pull-right form-control" ID="sec_lName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="sec_phone_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="vendor_id"
                                    DataSourceID="vendor_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="vendor_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [vendor]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_id_Update_TextBox" ID="vendor_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_name_Update_TextBox" ID="vendor_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_num</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="phone_num_Update_TextBox" ID="phone_num_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="phone_num_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">email</span>
                                <asp:TextBox class="pull-right form-control" ID="email_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Update_TextBox" ID="address_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vendor_address2</span>
                                <asp:TextBox class="pull-right form-control" ID="Vendor_address2_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_job_assign</span>
                                <asp:TextBox class="pull-right form-control" ID="vendor_job_assign_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_start_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_start_date_Update_TextBox" ID="vendor_start_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="vendor_start_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_end_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="vendor_end_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_meth_of_contact</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_meth_of_contact_Update_TextBox" ID="vendor_meth_of_contact_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_meth_of_contact_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_status_Update_TextBox" ID="vendor_status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_meth_of_pay</span>
                                <asp:TextBox class="pull-right form-control" ID="vendor_meth_of_pay_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vendor_type_Update_TextBox" ID="vendor_type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vendor_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_comments</span>
                                <asp:TextBox class="pull-right form-control" ID="vendor_comments_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_fName</span>
                                <asp:TextBox class="pull-right form-control" ID="primary_fName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_lName</span>
                                <asp:TextBox class="pull-right form-control" ID="primary_lName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="primary_phone_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_fName</span>
                                <asp:TextBox class="pull-right form-control" ID="sec_fName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_lName</span>
                                <asp:TextBox class="pull-right form-control" ID="sec_lName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="sec_phone_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="vendor_id"
                                    DataSourceID="vendor_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="vendor_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [vendor]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_num</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="phone_num_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">email</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="email_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vendor_address2</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Vendor_address2_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_job_assign</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_job_assign_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_start_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="vendor_start_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_end_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="vendor_end_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_meth_of_contact</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_meth_of_contact_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_meth_of_pay</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_meth_of_pay_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vendor_comments</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vendor_comments_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_fName</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="primary_fName_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_lName</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="primary_lName_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_phone</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="primary_phone_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_fName</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="sec_fName_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_lName</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="sec_lName_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">sec_phone</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="sec_phone_Delete_TextBox" runat="server"></asp:TextBox>
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

