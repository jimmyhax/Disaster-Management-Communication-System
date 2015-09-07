<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="services.aspx.cs" Inherits="Web.App.servicesClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="servicesCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>services CRUD Operations:</span></h1>
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
                                    DataKeyNames="service_id"
                                    DataSourceID="services_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" />
                                        <asp:BoundField DataField="Company" HeaderText="Company" InsertVisible="False" ReadOnly="True" SortExpression="Company" />
                                        <asp:BoundField DataField="service_type" HeaderText="service_type" InsertVisible="False" ReadOnly="True" SortExpression="service_type" />
                                        <asp:BoundField DataField="Estimated_Time" HeaderText="Estimated_Time" InsertVisible="False" ReadOnly="True" SortExpression="Estimated_Time" Visible="false" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" InsertVisible="False" ReadOnly="True" SortExpression="Email" Visible="false" />
                                        <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" InsertVisible="False" ReadOnly="True" SortExpression="Phone_Number" Visible="false" />
                                        <asp:BoundField DataField="Full_Cost" HeaderText="Full_Cost" InsertVisible="False" ReadOnly="True" SortExpression="Full_Cost" Visible="false" />
                                        <asp:BoundField DataField="Estimated_Cost" HeaderText="Estimated_Cost" InsertVisible="False" ReadOnly="True" SortExpression="Estimated_Cost" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="services_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [services]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Company</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Company_Insert_TextBox" ID="Company_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Company_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="service_type_Insert_TextBox" ID="service_type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="service_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Estimated_Time</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Estimated_Time_Insert_TextBox" ID="Estimated_Time_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Estimated_Time_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Email</span>
                                <asp:TextBox class="pull-right form-control" ID="Email_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone_Number</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Phone_Number_Insert_TextBox" ID="Phone_Number_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Phone_Number_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Full_Cost</span>
                                <asp:TextBox class="pull-right form-control" ID="Full_Cost_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Estimated_Cost</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Estimated_Cost_Insert_TextBox" ID="Estimated_Cost_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Estimated_Cost_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="service_id"
                                    DataSourceID="services_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" />
                                        <asp:BoundField DataField="Company" HeaderText="Company" InsertVisible="False" ReadOnly="True" SortExpression="Company" />
                                        <asp:BoundField DataField="service_type" HeaderText="service_type" InsertVisible="False" ReadOnly="True" SortExpression="service_type" />
                                        <asp:BoundField DataField="Estimated_Time" HeaderText="Estimated_Time" InsertVisible="False" ReadOnly="True" SortExpression="Estimated_Time" Visible="false" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" InsertVisible="False" ReadOnly="True" SortExpression="Email" Visible="false" />
                                        <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" InsertVisible="False" ReadOnly="True" SortExpression="Phone_Number" Visible="false" />
                                        <asp:BoundField DataField="Full_Cost" HeaderText="Full_Cost" InsertVisible="False" ReadOnly="True" SortExpression="Full_Cost" Visible="false" />
                                        <asp:BoundField DataField="Estimated_Cost" HeaderText="Estimated_Cost" InsertVisible="False" ReadOnly="True" SortExpression="Estimated_Cost" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="services_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [services]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="service_id_Update_TextBox" ID="service_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="service_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Company</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Company_Update_TextBox" ID="Company_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Company_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="service_type_Update_TextBox" ID="service_type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="service_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Estimated_Time</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Estimated_Time_Update_TextBox" ID="Estimated_Time_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Estimated_Time_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Email</span>
                                <asp:TextBox class="pull-right form-control" ID="Email_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone_Number</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Phone_Number_Update_TextBox" ID="Phone_Number_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Phone_Number_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Full_Cost</span>
                                <asp:TextBox class="pull-right form-control" ID="Full_Cost_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Estimated_Cost</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Estimated_Cost_Update_TextBox" ID="Estimated_Cost_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Estimated_Cost_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="service_id"
                                    DataSourceID="services_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" />
                                        <asp:BoundField DataField="Company" HeaderText="Company" InsertVisible="False" ReadOnly="True" SortExpression="Company" />
                                        <asp:BoundField DataField="service_type" HeaderText="service_type" InsertVisible="False" ReadOnly="True" SortExpression="service_type" />
                                        <asp:BoundField DataField="Estimated_Time" HeaderText="Estimated_Time" InsertVisible="False" ReadOnly="True" SortExpression="Estimated_Time" Visible="false" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" InsertVisible="False" ReadOnly="True" SortExpression="Email" Visible="false" />
                                        <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" InsertVisible="False" ReadOnly="True" SortExpression="Phone_Number" Visible="false" />
                                        <asp:BoundField DataField="Full_Cost" HeaderText="Full_Cost" InsertVisible="False" ReadOnly="True" SortExpression="Full_Cost" Visible="false" />
                                        <asp:BoundField DataField="Estimated_Cost" HeaderText="Estimated_Cost" InsertVisible="False" ReadOnly="True" SortExpression="Estimated_Cost" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="services_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [services]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="service_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Company</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Company_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="service_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Estimated_Time</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Estimated_Time_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Email</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Email_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone_Number</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Phone_Number_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Full_Cost</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Full_Cost_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Estimated_Cost</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Estimated_Cost_Delete_TextBox" runat="server"></asp:TextBox>
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

