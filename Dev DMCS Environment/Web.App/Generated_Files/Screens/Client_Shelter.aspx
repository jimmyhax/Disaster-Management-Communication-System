<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Client_Shelter.aspx.cs" Inherits="Web.App.Client_ShelterClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Client_ShelterCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Client_Shelter CRUD Operations:</span></h1>
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
                                    DataKeyNames="Client_Shelter_ID"
                                    DataSourceID="Client_Shelter_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" />
                                        <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" />
                                        <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
                                        <asp:BoundField DataField="Current_address" HeaderText="Current_address" InsertVisible="False" ReadOnly="True" SortExpression="Current_address" Visible="false" />
                                        <asp:BoundField DataField="Current_State" HeaderText="Current_State" InsertVisible="False" ReadOnly="True" SortExpression="Current_State" Visible="false" />
                                        <asp:BoundField DataField="Current_City" HeaderText="Current_City" InsertVisible="False" ReadOnly="True" SortExpression="Current_City" Visible="false" />
                                        <asp:BoundField DataField="Current_Zip" HeaderText="Current_Zip" InsertVisible="False" ReadOnly="True" SortExpression="Current_Zip" Visible="false" />
                                        <asp:BoundField DataField="Client_registration_status" HeaderText="Client_registration_status" InsertVisible="False" ReadOnly="True" SortExpression="Client_registration_status" Visible="false" />
                                        <asp:BoundField DataField="Household_size" HeaderText="Household_size" InsertVisible="False" ReadOnly="True" SortExpression="Household_size" Visible="false" />
                                        <asp:BoundField DataField="Shelter_supplies" HeaderText="Shelter_supplies" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_supplies" Visible="false" />
                                        <asp:BoundField DataField="Shelter_occupancy_current" HeaderText="Shelter_occupancy_current" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_occupancy_current" Visible="false" />
                                        <asp:BoundField DataField="New_household_registered" HeaderText="New_household_registered" InsertVisible="False" ReadOnly="True" SortExpression="New_household_registered" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_address" HeaderText="New_Shelter_address" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_address" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_city" HeaderText="New_Shelter_city" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_city" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_State" HeaderText="New_Shelter_State" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_State" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_Zip" HeaderText="New_Shelter_Zip" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_Zip" Visible="false" />
                                        <asp:BoundField DataField="New_Contact_Number" HeaderText="New_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="New_Contact_Number" Visible="false" />
                                        <asp:BoundField DataField="Current_household_members_safe" HeaderText="Current_household_members_safe" InsertVisible="False" ReadOnly="True" SortExpression="Current_household_members_safe" Visible="false" />
                                        <asp:BoundField DataField="CheckIn_Date" HeaderText="CheckIn_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckIn_Date" Visible="false" />
                                        <asp:BoundField DataField="CheckOut_Date" HeaderText="CheckOut_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckOut_Date" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Client_Shelter_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Client_Shelter]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Shelter_ID_Insert_TextBox" ID="Shelter_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_ID_Insert_TextBox" ID="Client_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_address</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_address_Insert_TextBox" ID="Current_address_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_address_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_State</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_State_Insert_TextBox" ID="Current_State_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_State_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_City</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_City_Insert_TextBox" ID="Current_City_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_City_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_Zip</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_Zip_Insert_TextBox" ID="Current_Zip_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_Zip_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_registration_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_registration_status_Insert_TextBox" ID="Client_registration_status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_registration_status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Household_size</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Household_size_Insert_TextBox" ID="Household_size_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Household_size_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_supplies</span>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_supplies_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_occupancy_current</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Shelter_occupancy_current_Insert_TextBox" ID="Shelter_occupancy_current_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_occupancy_current_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_household_registered</span>
                                <asp:TextBox class="pull-right form-control" ID="New_household_registered_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_address</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_address_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_city</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_city_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_State</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_State_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_Zip</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_Zip_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Contact_Number</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Contact_Number_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_household_members_safe</span>
                                <asp:TextBox class="pull-right form-control" ID="Current_household_members_safe_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CheckIn_Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="CheckIn_Date_Insert_TextBox" ID="CheckIn_Date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="CheckIn_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CheckOut_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="CheckOut_Date_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Client_Shelter_ID"
                                    DataSourceID="Client_Shelter_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" />
                                        <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" />
                                        <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
                                        <asp:BoundField DataField="Current_address" HeaderText="Current_address" InsertVisible="False" ReadOnly="True" SortExpression="Current_address" Visible="false" />
                                        <asp:BoundField DataField="Current_State" HeaderText="Current_State" InsertVisible="False" ReadOnly="True" SortExpression="Current_State" Visible="false" />
                                        <asp:BoundField DataField="Current_City" HeaderText="Current_City" InsertVisible="False" ReadOnly="True" SortExpression="Current_City" Visible="false" />
                                        <asp:BoundField DataField="Current_Zip" HeaderText="Current_Zip" InsertVisible="False" ReadOnly="True" SortExpression="Current_Zip" Visible="false" />
                                        <asp:BoundField DataField="Client_registration_status" HeaderText="Client_registration_status" InsertVisible="False" ReadOnly="True" SortExpression="Client_registration_status" Visible="false" />
                                        <asp:BoundField DataField="Household_size" HeaderText="Household_size" InsertVisible="False" ReadOnly="True" SortExpression="Household_size" Visible="false" />
                                        <asp:BoundField DataField="Shelter_supplies" HeaderText="Shelter_supplies" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_supplies" Visible="false" />
                                        <asp:BoundField DataField="Shelter_occupancy_current" HeaderText="Shelter_occupancy_current" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_occupancy_current" Visible="false" />
                                        <asp:BoundField DataField="New_household_registered" HeaderText="New_household_registered" InsertVisible="False" ReadOnly="True" SortExpression="New_household_registered" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_address" HeaderText="New_Shelter_address" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_address" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_city" HeaderText="New_Shelter_city" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_city" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_State" HeaderText="New_Shelter_State" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_State" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_Zip" HeaderText="New_Shelter_Zip" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_Zip" Visible="false" />
                                        <asp:BoundField DataField="New_Contact_Number" HeaderText="New_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="New_Contact_Number" Visible="false" />
                                        <asp:BoundField DataField="Current_household_members_safe" HeaderText="Current_household_members_safe" InsertVisible="False" ReadOnly="True" SortExpression="Current_household_members_safe" Visible="false" />
                                        <asp:BoundField DataField="CheckIn_Date" HeaderText="CheckIn_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckIn_Date" Visible="false" />
                                        <asp:BoundField DataField="CheckOut_Date" HeaderText="CheckOut_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckOut_Date" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Client_Shelter_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Client_Shelter]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Shelter_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_Shelter_ID_Update_TextBox" ID="Client_Shelter_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_Shelter_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Shelter_ID_Update_TextBox" ID="Shelter_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_ID_Update_TextBox" ID="Client_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_address</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_address_Update_TextBox" ID="Current_address_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_address_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_State</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_State_Update_TextBox" ID="Current_State_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_State_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_City</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_City_Update_TextBox" ID="Current_City_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_City_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_Zip</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Current_Zip_Update_TextBox" ID="Current_Zip_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Current_Zip_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_registration_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_registration_status_Update_TextBox" ID="Client_registration_status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_registration_status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Household_size</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Household_size_Update_TextBox" ID="Household_size_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Household_size_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_supplies</span>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_supplies_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_occupancy_current</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Shelter_occupancy_current_Update_TextBox" ID="Shelter_occupancy_current_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_occupancy_current_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_household_registered</span>
                                <asp:TextBox class="pull-right form-control" ID="New_household_registered_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_address</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_address_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_city</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_city_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_State</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_State_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_Zip</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Shelter_Zip_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Contact_Number</span>
                                <asp:TextBox class="pull-right form-control" ID="New_Contact_Number_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_household_members_safe</span>
                                <asp:TextBox class="pull-right form-control" ID="Current_household_members_safe_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CheckIn_Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="CheckIn_Date_Update_TextBox" ID="CheckIn_Date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="CheckIn_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CheckOut_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="CheckOut_Date_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Client_Shelter_ID"
                                    DataSourceID="Client_Shelter_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" />
                                        <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" />
                                        <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
                                        <asp:BoundField DataField="Current_address" HeaderText="Current_address" InsertVisible="False" ReadOnly="True" SortExpression="Current_address" Visible="false" />
                                        <asp:BoundField DataField="Current_State" HeaderText="Current_State" InsertVisible="False" ReadOnly="True" SortExpression="Current_State" Visible="false" />
                                        <asp:BoundField DataField="Current_City" HeaderText="Current_City" InsertVisible="False" ReadOnly="True" SortExpression="Current_City" Visible="false" />
                                        <asp:BoundField DataField="Current_Zip" HeaderText="Current_Zip" InsertVisible="False" ReadOnly="True" SortExpression="Current_Zip" Visible="false" />
                                        <asp:BoundField DataField="Client_registration_status" HeaderText="Client_registration_status" InsertVisible="False" ReadOnly="True" SortExpression="Client_registration_status" Visible="false" />
                                        <asp:BoundField DataField="Household_size" HeaderText="Household_size" InsertVisible="False" ReadOnly="True" SortExpression="Household_size" Visible="false" />
                                        <asp:BoundField DataField="Shelter_supplies" HeaderText="Shelter_supplies" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_supplies" Visible="false" />
                                        <asp:BoundField DataField="Shelter_occupancy_current" HeaderText="Shelter_occupancy_current" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_occupancy_current" Visible="false" />
                                        <asp:BoundField DataField="New_household_registered" HeaderText="New_household_registered" InsertVisible="False" ReadOnly="True" SortExpression="New_household_registered" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_address" HeaderText="New_Shelter_address" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_address" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_city" HeaderText="New_Shelter_city" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_city" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_State" HeaderText="New_Shelter_State" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_State" Visible="false" />
                                        <asp:BoundField DataField="New_Shelter_Zip" HeaderText="New_Shelter_Zip" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_Zip" Visible="false" />
                                        <asp:BoundField DataField="New_Contact_Number" HeaderText="New_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="New_Contact_Number" Visible="false" />
                                        <asp:BoundField DataField="Current_household_members_safe" HeaderText="Current_household_members_safe" InsertVisible="False" ReadOnly="True" SortExpression="Current_household_members_safe" Visible="false" />
                                        <asp:BoundField DataField="CheckIn_Date" HeaderText="CheckIn_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckIn_Date" Visible="false" />
                                        <asp:BoundField DataField="CheckOut_Date" HeaderText="CheckOut_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckOut_Date" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Client_Shelter_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Client_Shelter]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Shelter_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_Shelter_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Shelter_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_address</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Current_address_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_State</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Current_State_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_City</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Current_City_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_Zip</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Current_Zip_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_registration_status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_registration_status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Household_size</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Household_size_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_supplies</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Shelter_supplies_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_occupancy_current</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Shelter_occupancy_current_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_household_registered</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="New_household_registered_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_address</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="New_Shelter_address_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_city</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="New_Shelter_city_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_State</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="New_Shelter_State_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Shelter_Zip</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="New_Shelter_Zip_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">New_Contact_Number</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="New_Contact_Number_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_household_members_safe</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Current_household_members_safe_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CheckIn_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="CheckIn_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CheckOut_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="CheckOut_Date_Delete_TextBox" runat="server"></asp:TextBox>
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

