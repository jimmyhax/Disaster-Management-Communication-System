<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="encounter_services.aspx.cs" Inherits="Web.App.encounter_servicesClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="encounter_servicesCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>encounter_services CRUD Operations:</span></h1>
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
                                    DataKeyNames="encounter_serv_id"
                                    DataSourceID="encounter_services_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_serv_id" HeaderText="encounter_serv_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_serv_id" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="mobile_unit_id" HeaderText="mobile_unit_id" InsertVisible="False" ReadOnly="True" SortExpression="mobile_unit_id" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                                        <asp:BoundField DataField="service_date" HeaderText="service_date" InsertVisible="False" ReadOnly="True" SortExpression="service_date" Visible="false" />
                                        <asp:BoundField DataField="service_completed" HeaderText="service_completed" InsertVisible="False" ReadOnly="True" SortExpression="service_completed" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_services_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter_services]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox class="pull-right form-control" ID="encounter_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mobile_unit_id</span>
                                <asp:TextBox class="pull-right form-control" ID="mobile_unit_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="service_id_Insert_TextBox" ID="service_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="service_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="service_date_Insert_TextBox" ID="service_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="service_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_completed</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="service_completed_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="encounter_serv_id"
                                    DataSourceID="encounter_services_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_serv_id" HeaderText="encounter_serv_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_serv_id" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="mobile_unit_id" HeaderText="mobile_unit_id" InsertVisible="False" ReadOnly="True" SortExpression="mobile_unit_id" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                                        <asp:BoundField DataField="service_date" HeaderText="service_date" InsertVisible="False" ReadOnly="True" SortExpression="service_date" Visible="false" />
                                        <asp:BoundField DataField="service_completed" HeaderText="service_completed" InsertVisible="False" ReadOnly="True" SortExpression="service_completed" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_services_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter_services]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_serv_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="encounter_serv_id_Update_TextBox" ID="encounter_serv_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="encounter_serv_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox class="pull-right form-control" ID="encounter_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mobile_unit_id</span>
                                <asp:TextBox class="pull-right form-control" ID="mobile_unit_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="service_id_Update_TextBox" ID="service_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="service_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="service_date_Update_TextBox" ID="service_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="service_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_completed</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="service_completed_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="encounter_serv_id"
                                    DataSourceID="encounter_services_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_serv_id" HeaderText="encounter_serv_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_serv_id" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="mobile_unit_id" HeaderText="mobile_unit_id" InsertVisible="False" ReadOnly="True" SortExpression="mobile_unit_id" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                                        <asp:BoundField DataField="service_date" HeaderText="service_date" InsertVisible="False" ReadOnly="True" SortExpression="service_date" Visible="false" />
                                        <asp:BoundField DataField="service_completed" HeaderText="service_completed" InsertVisible="False" ReadOnly="True" SortExpression="service_completed" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_services_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter_services]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_serv_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="encounter_serv_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="encounter_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mobile_unit_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="mobile_unit_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="service_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="service_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_completed</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="service_completed_Delete_TextBox" runat="server"></asp:TextBox>
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

