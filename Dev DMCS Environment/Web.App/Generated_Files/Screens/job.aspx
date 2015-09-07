<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="job.aspx.cs" Inherits="Web.App.jobClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="jobCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>job CRUD Operations:</span></h1>
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
                                    DataKeyNames="job_id"
                                    DataSourceID="job_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="job_id" HeaderText="job_id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="company_id" HeaderText="company_id" InsertVisible="False" ReadOnly="True" SortExpression="company_id" />
                                        <asp:BoundField DataField="job_cat_id" HeaderText="job_cat_id" InsertVisible="False" ReadOnly="True" SortExpression="job_cat_id" Visible="false" />
                                        <asp:BoundField DataField="job_posted_date" HeaderText="job_posted_date" InsertVisible="False" ReadOnly="True" SortExpression="job_posted_date" Visible="false" />
                                        <asp:BoundField DataField="job_status" HeaderText="job_status" InsertVisible="False" ReadOnly="True" SortExpression="job_status" Visible="false" />
                                        <asp:BoundField DataField="job_title" HeaderText="job_title" InsertVisible="False" ReadOnly="True" SortExpression="job_title" Visible="false" />
                                        <asp:BoundField DataField="Work_Classification_Full_time" HeaderText="Work_Classification_Full_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Full_time" Visible="false" />
                                        <asp:BoundField DataField="Work_Classification_Part_time" HeaderText="Work_Classification_Part_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Part_time" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Weekly" HeaderText="Work_Payment_Freq_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Weekly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Bi_Weekly" HeaderText="Work_Payment_Freq_Bi_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Weekly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Monthly" HeaderText="Work_Payment_Freq_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Monthly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Bi_Monthly" HeaderText="Work_Payment_Freq_Bi_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Monthly" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="job_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [job]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Insert_TextBox" ID="address_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">company_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="company_id_Insert_TextBox" ID="company_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="company_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_cat_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_cat_id_Insert_TextBox" ID="job_cat_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="job_cat_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_posted_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_posted_date_Insert_TextBox" ID="job_posted_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="job_posted_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_status_Insert_TextBox" ID="job_status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="job_status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_title</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_title_Insert_TextBox" ID="job_title_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="job_title_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Classification_Full_time</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Classification_Full_time_Insert_TextBox" ID="Work_Classification_Full_time_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Classification_Full_time_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Classification_Part_time</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Classification_Part_time_Insert_TextBox" ID="Work_Classification_Part_time_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Classification_Part_time_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Weekly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Weekly_Insert_TextBox" ID="Work_Payment_Freq_Weekly_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Weekly_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Bi_Weekly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Bi_Weekly_Insert_TextBox" ID="Work_Payment_Freq_Bi_Weekly_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Bi_Weekly_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Monthly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Monthly_Insert_TextBox" ID="Work_Payment_Freq_Monthly_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Monthly_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Bi_Monthly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Bi_Monthly_Insert_TextBox" ID="Work_Payment_Freq_Bi_Monthly_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Bi_Monthly_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="job_id"
                                    DataSourceID="job_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="job_id" HeaderText="job_id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="company_id" HeaderText="company_id" InsertVisible="False" ReadOnly="True" SortExpression="company_id" />
                                        <asp:BoundField DataField="job_cat_id" HeaderText="job_cat_id" InsertVisible="False" ReadOnly="True" SortExpression="job_cat_id" Visible="false" />
                                        <asp:BoundField DataField="job_posted_date" HeaderText="job_posted_date" InsertVisible="False" ReadOnly="True" SortExpression="job_posted_date" Visible="false" />
                                        <asp:BoundField DataField="job_status" HeaderText="job_status" InsertVisible="False" ReadOnly="True" SortExpression="job_status" Visible="false" />
                                        <asp:BoundField DataField="job_title" HeaderText="job_title" InsertVisible="False" ReadOnly="True" SortExpression="job_title" Visible="false" />
                                        <asp:BoundField DataField="Work_Classification_Full_time" HeaderText="Work_Classification_Full_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Full_time" Visible="false" />
                                        <asp:BoundField DataField="Work_Classification_Part_time" HeaderText="Work_Classification_Part_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Part_time" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Weekly" HeaderText="Work_Payment_Freq_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Weekly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Bi_Weekly" HeaderText="Work_Payment_Freq_Bi_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Weekly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Monthly" HeaderText="Work_Payment_Freq_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Monthly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Bi_Monthly" HeaderText="Work_Payment_Freq_Bi_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Monthly" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="job_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [job]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_id_Update_TextBox" ID="job_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="job_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Update_TextBox" ID="address_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">company_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="company_id_Update_TextBox" ID="company_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="company_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_cat_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_cat_id_Update_TextBox" ID="job_cat_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="job_cat_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_posted_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_posted_date_Update_TextBox" ID="job_posted_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="job_posted_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_status_Update_TextBox" ID="job_status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="job_status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_title</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="job_title_Update_TextBox" ID="job_title_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="job_title_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Classification_Full_time</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Classification_Full_time_Update_TextBox" ID="Work_Classification_Full_time_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Classification_Full_time_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Classification_Part_time</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Classification_Part_time_Update_TextBox" ID="Work_Classification_Part_time_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Classification_Part_time_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Weekly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Weekly_Update_TextBox" ID="Work_Payment_Freq_Weekly_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Weekly_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Bi_Weekly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Bi_Weekly_Update_TextBox" ID="Work_Payment_Freq_Bi_Weekly_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Bi_Weekly_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Monthly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Monthly_Update_TextBox" ID="Work_Payment_Freq_Monthly_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Monthly_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Bi_Monthly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Work_Payment_Freq_Bi_Monthly_Update_TextBox" ID="Work_Payment_Freq_Bi_Monthly_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Work_Payment_Freq_Bi_Monthly_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="job_id"
                                    DataSourceID="job_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="job_id" HeaderText="job_id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="company_id" HeaderText="company_id" InsertVisible="False" ReadOnly="True" SortExpression="company_id" />
                                        <asp:BoundField DataField="job_cat_id" HeaderText="job_cat_id" InsertVisible="False" ReadOnly="True" SortExpression="job_cat_id" Visible="false" />
                                        <asp:BoundField DataField="job_posted_date" HeaderText="job_posted_date" InsertVisible="False" ReadOnly="True" SortExpression="job_posted_date" Visible="false" />
                                        <asp:BoundField DataField="job_status" HeaderText="job_status" InsertVisible="False" ReadOnly="True" SortExpression="job_status" Visible="false" />
                                        <asp:BoundField DataField="job_title" HeaderText="job_title" InsertVisible="False" ReadOnly="True" SortExpression="job_title" Visible="false" />
                                        <asp:BoundField DataField="Work_Classification_Full_time" HeaderText="Work_Classification_Full_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Full_time" Visible="false" />
                                        <asp:BoundField DataField="Work_Classification_Part_time" HeaderText="Work_Classification_Part_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Part_time" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Weekly" HeaderText="Work_Payment_Freq_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Weekly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Bi_Weekly" HeaderText="Work_Payment_Freq_Bi_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Weekly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Monthly" HeaderText="Work_Payment_Freq_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Monthly" Visible="false" />
                                        <asp:BoundField DataField="Work_Payment_Freq_Bi_Monthly" HeaderText="Work_Payment_Freq_Bi_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Monthly" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="job_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [job]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="job_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">company_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="company_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_cat_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="job_cat_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_posted_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="job_posted_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="job_status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">job_title</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="job_title_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Classification_Full_time</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Work_Classification_Full_time_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Classification_Part_time</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Work_Classification_Part_time_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Weekly</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Work_Payment_Freq_Weekly_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Bi_Weekly</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Work_Payment_Freq_Bi_Weekly_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Monthly</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Work_Payment_Freq_Monthly_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Work_Payment_Freq_Bi_Monthly</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Work_Payment_Freq_Bi_Monthly_Delete_TextBox" runat="server"></asp:TextBox>
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

