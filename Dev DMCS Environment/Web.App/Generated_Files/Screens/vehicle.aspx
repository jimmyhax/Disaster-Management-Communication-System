<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="vehicle.aspx.cs" Inherits="Web.App.vehicleClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="vehicleCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>vehicle CRUD Operations:</span></h1>
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
                                    DataKeyNames="vehicle_id"
                                    DataSourceID="vehicle_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="vehicle_id" HeaderText="vehicle_id" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="vehicle_make" HeaderText="vehicle_make" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_make" Visible="false" />
                                        <asp:BoundField DataField="vehicle_model" HeaderText="vehicle_model" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_model" Visible="false" />
                                        <asp:BoundField DataField="vehicle_type" HeaderText="vehicle_type" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_type" Visible="false" />
                                        <asp:BoundField DataField="vehicle_year" HeaderText="vehicle_year" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_year" Visible="false" />
                                        <asp:BoundField DataField="vehicle_desc" HeaderText="vehicle_desc" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_desc" Visible="false" />
                                        <asp:BoundField DataField="vin" HeaderText="vin" InsertVisible="False" ReadOnly="True" SortExpression="vin" Visible="false" />
                                        <asp:BoundField DataField="start_mileage" HeaderText="start_mileage" InsertVisible="False" ReadOnly="True" SortExpression="start_mileage" Visible="false" />
                                        <asp:BoundField DataField="first_service_date" HeaderText="first_service_date" InsertVisible="False" ReadOnly="True" SortExpression="first_service_date" Visible="false" />
                                        <asp:BoundField DataField="last_service_date" HeaderText="last_service_date" InsertVisible="False" ReadOnly="True" SortExpression="last_service_date" Visible="false" />
                                        <asp:BoundField DataField="PLATENUMBER" HeaderText="PLATENUMBER" InsertVisible="False" ReadOnly="True" SortExpression="PLATENUMBER" Visible="false" />
                                        <asp:BoundField DataField="FUELTYPE" HeaderText="FUELTYPE" InsertVisible="False" ReadOnly="True" SortExpression="FUELTYPE" Visible="false" />
                                        <asp:BoundField DataField="MPH" HeaderText="MPH" InsertVisible="False" ReadOnly="True" SortExpression="MPH" Visible="false" />
                                        <asp:BoundField DataField="INSURED" HeaderText="INSURED" InsertVisible="False" ReadOnly="True" SortExpression="INSURED" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="vehicle_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [vehicle]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_make</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_make_Insert_TextBox" ID="vehicle_make_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_make_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_model</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_model_Insert_TextBox" ID="vehicle_model_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_model_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_type_Insert_TextBox" ID="vehicle_type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_year</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_year_Insert_TextBox" ID="vehicle_year_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_year_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_desc</span>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_desc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vin</span>
                                <asp:TextBox class="pull-right form-control" ID="vin_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">start_mileage</span>
                                <asp:TextBox class="pull-right form-control" ID="start_mileage_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">first_service_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="first_service_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">last_service_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="last_service_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PLATENUMBER</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="PLATENUMBER_Insert_TextBox" ID="PLATENUMBER_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="PLATENUMBER_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FUELTYPE</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FUELTYPE_Insert_TextBox" ID="FUELTYPE_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FUELTYPE_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MPH</span>
                                <asp:TextBox class="pull-right form-control" ID="MPH_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">INSURED</span>
                                <asp:TextBox class="pull-right form-control" ID="INSURED_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="vehicle_id"
                                    DataSourceID="vehicle_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="vehicle_id" HeaderText="vehicle_id" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="vehicle_make" HeaderText="vehicle_make" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_make" Visible="false" />
                                        <asp:BoundField DataField="vehicle_model" HeaderText="vehicle_model" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_model" Visible="false" />
                                        <asp:BoundField DataField="vehicle_type" HeaderText="vehicle_type" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_type" Visible="false" />
                                        <asp:BoundField DataField="vehicle_year" HeaderText="vehicle_year" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_year" Visible="false" />
                                        <asp:BoundField DataField="vehicle_desc" HeaderText="vehicle_desc" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_desc" Visible="false" />
                                        <asp:BoundField DataField="vin" HeaderText="vin" InsertVisible="False" ReadOnly="True" SortExpression="vin" Visible="false" />
                                        <asp:BoundField DataField="start_mileage" HeaderText="start_mileage" InsertVisible="False" ReadOnly="True" SortExpression="start_mileage" Visible="false" />
                                        <asp:BoundField DataField="first_service_date" HeaderText="first_service_date" InsertVisible="False" ReadOnly="True" SortExpression="first_service_date" Visible="false" />
                                        <asp:BoundField DataField="last_service_date" HeaderText="last_service_date" InsertVisible="False" ReadOnly="True" SortExpression="last_service_date" Visible="false" />
                                        <asp:BoundField DataField="PLATENUMBER" HeaderText="PLATENUMBER" InsertVisible="False" ReadOnly="True" SortExpression="PLATENUMBER" Visible="false" />
                                        <asp:BoundField DataField="FUELTYPE" HeaderText="FUELTYPE" InsertVisible="False" ReadOnly="True" SortExpression="FUELTYPE" Visible="false" />
                                        <asp:BoundField DataField="MPH" HeaderText="MPH" InsertVisible="False" ReadOnly="True" SortExpression="MPH" Visible="false" />
                                        <asp:BoundField DataField="INSURED" HeaderText="INSURED" InsertVisible="False" ReadOnly="True" SortExpression="INSURED" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="vehicle_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [vehicle]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_id_Update_TextBox" ID="vehicle_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_make</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_make_Update_TextBox" ID="vehicle_make_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_make_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_model</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_model_Update_TextBox" ID="vehicle_model_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_model_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_type_Update_TextBox" ID="vehicle_type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_year</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vehicle_year_Update_TextBox" ID="vehicle_year_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_year_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_desc</span>
                                <asp:TextBox class="pull-right form-control" ID="vehicle_desc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vin</span>
                                <asp:TextBox class="pull-right form-control" ID="vin_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">start_mileage</span>
                                <asp:TextBox class="pull-right form-control" ID="start_mileage_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">first_service_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="first_service_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">last_service_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="last_service_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PLATENUMBER</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="PLATENUMBER_Update_TextBox" ID="PLATENUMBER_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="PLATENUMBER_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FUELTYPE</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FUELTYPE_Update_TextBox" ID="FUELTYPE_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FUELTYPE_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MPH</span>
                                <asp:TextBox class="pull-right form-control" ID="MPH_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">INSURED</span>
                                <asp:TextBox class="pull-right form-control" ID="INSURED_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="vehicle_id"
                                    DataSourceID="vehicle_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="vehicle_id" HeaderText="vehicle_id" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="vehicle_make" HeaderText="vehicle_make" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_make" Visible="false" />
                                        <asp:BoundField DataField="vehicle_model" HeaderText="vehicle_model" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_model" Visible="false" />
                                        <asp:BoundField DataField="vehicle_type" HeaderText="vehicle_type" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_type" Visible="false" />
                                        <asp:BoundField DataField="vehicle_year" HeaderText="vehicle_year" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_year" Visible="false" />
                                        <asp:BoundField DataField="vehicle_desc" HeaderText="vehicle_desc" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_desc" Visible="false" />
                                        <asp:BoundField DataField="vin" HeaderText="vin" InsertVisible="False" ReadOnly="True" SortExpression="vin" Visible="false" />
                                        <asp:BoundField DataField="start_mileage" HeaderText="start_mileage" InsertVisible="False" ReadOnly="True" SortExpression="start_mileage" Visible="false" />
                                        <asp:BoundField DataField="first_service_date" HeaderText="first_service_date" InsertVisible="False" ReadOnly="True" SortExpression="first_service_date" Visible="false" />
                                        <asp:BoundField DataField="last_service_date" HeaderText="last_service_date" InsertVisible="False" ReadOnly="True" SortExpression="last_service_date" Visible="false" />
                                        <asp:BoundField DataField="PLATENUMBER" HeaderText="PLATENUMBER" InsertVisible="False" ReadOnly="True" SortExpression="PLATENUMBER" Visible="false" />
                                        <asp:BoundField DataField="FUELTYPE" HeaderText="FUELTYPE" InsertVisible="False" ReadOnly="True" SortExpression="FUELTYPE" Visible="false" />
                                        <asp:BoundField DataField="MPH" HeaderText="MPH" InsertVisible="False" ReadOnly="True" SortExpression="MPH" Visible="false" />
                                        <asp:BoundField DataField="INSURED" HeaderText="INSURED" InsertVisible="False" ReadOnly="True" SortExpression="INSURED" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="vehicle_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [vehicle]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vehicle_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="case_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_make</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vehicle_make_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_model</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vehicle_model_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vehicle_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_year</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vehicle_year_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vehicle_desc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vehicle_desc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vin</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vin_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">start_mileage</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="start_mileage_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">first_service_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="first_service_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">last_service_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="last_service_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PLATENUMBER</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="PLATENUMBER_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FUELTYPE</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="FUELTYPE_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MPH</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="MPH_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">INSURED</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="INSURED_Delete_TextBox" runat="server"></asp:TextBox>
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

