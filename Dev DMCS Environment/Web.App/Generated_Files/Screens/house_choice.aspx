<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="house_choice.aspx.cs" Inherits="Web.App.house_choiceClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="house_choiceCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>house_choice CRUD Operations:</span></h1>
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
                                    DataKeyNames="house_choice_id"
                                    DataSourceID="house_choice_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="house_choice_id" HeaderText="house_choice_id" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_id" />
                                        <asp:BoundField DataField="house_id" HeaderText="house_id" InsertVisible="False" ReadOnly="True" SortExpression="house_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="house_choice_bathrooms" HeaderText="house_choice_bathrooms" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_bathrooms" Visible="false" />
                                        <asp:BoundField DataField="house_choice_comments" HeaderText="house_choice_comments" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_comments" Visible="false" />
                                        <asp:BoundField DataField="house_choice_contact_person_id" HeaderText="house_choice_contact_person_id" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_contact_person_id" Visible="false" />
                                        <asp:BoundField DataField="house_choice_laundry" HeaderText="house_choice_laundry" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_laundry" Visible="false" />
                                        <asp:BoundField DataField="house_choice_no_floors" HeaderText="house_choice_no_floors" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_no_floors" Visible="false" />
                                        <asp:BoundField DataField="house_choice_parking" HeaderText="house_choice_parking" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_parking" Visible="false" />
                                        <asp:BoundField DataField="house_choice_rent" HeaderText="house_choice_rent" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_rent" Visible="false" />
                                        <asp:BoundField DataField="house_choice_type" HeaderText="house_choice_type" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_type" Visible="false" />
                                        <asp:BoundField DataField="house_choice_units_avail" HeaderText="house_choice_units_avail" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_units_avail" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="house_choice_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [house_choice]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_id_Insert_TextBox" ID="house_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Insert_TextBox" ID="address_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_bathrooms</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_bathrooms_Insert_TextBox" ID="house_choice_bathrooms_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_bathrooms_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_comments</span>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_comments_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_contact_person_id</span>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_contact_person_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_laundry</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_laundry_Insert_TextBox" ID="house_choice_laundry_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_laundry_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_no_floors</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_no_floors_Insert_TextBox" ID="house_choice_no_floors_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_no_floors_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_parking</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_parking_Insert_TextBox" ID="house_choice_parking_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_parking_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_rent</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_rent_Insert_TextBox" ID="house_choice_rent_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_rent_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_type_Insert_TextBox" ID="house_choice_type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_units_avail</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_units_avail_Insert_TextBox" ID="house_choice_units_avail_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_units_avail_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="house_choice_id"
                                    DataSourceID="house_choice_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="house_choice_id" HeaderText="house_choice_id" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_id" />
                                        <asp:BoundField DataField="house_id" HeaderText="house_id" InsertVisible="False" ReadOnly="True" SortExpression="house_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="house_choice_bathrooms" HeaderText="house_choice_bathrooms" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_bathrooms" Visible="false" />
                                        <asp:BoundField DataField="house_choice_comments" HeaderText="house_choice_comments" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_comments" Visible="false" />
                                        <asp:BoundField DataField="house_choice_contact_person_id" HeaderText="house_choice_contact_person_id" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_contact_person_id" Visible="false" />
                                        <asp:BoundField DataField="house_choice_laundry" HeaderText="house_choice_laundry" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_laundry" Visible="false" />
                                        <asp:BoundField DataField="house_choice_no_floors" HeaderText="house_choice_no_floors" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_no_floors" Visible="false" />
                                        <asp:BoundField DataField="house_choice_parking" HeaderText="house_choice_parking" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_parking" Visible="false" />
                                        <asp:BoundField DataField="house_choice_rent" HeaderText="house_choice_rent" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_rent" Visible="false" />
                                        <asp:BoundField DataField="house_choice_type" HeaderText="house_choice_type" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_type" Visible="false" />
                                        <asp:BoundField DataField="house_choice_units_avail" HeaderText="house_choice_units_avail" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_units_avail" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="house_choice_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [house_choice]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_id_Update_TextBox" ID="house_choice_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_id_Update_TextBox" ID="house_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Update_TextBox" ID="address_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_bathrooms</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_bathrooms_Update_TextBox" ID="house_choice_bathrooms_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_bathrooms_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_comments</span>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_comments_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_contact_person_id</span>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_contact_person_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_laundry</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_laundry_Update_TextBox" ID="house_choice_laundry_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_laundry_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_no_floors</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_no_floors_Update_TextBox" ID="house_choice_no_floors_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_no_floors_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_parking</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_parking_Update_TextBox" ID="house_choice_parking_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_parking_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_rent</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_rent_Update_TextBox" ID="house_choice_rent_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_rent_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_type_Update_TextBox" ID="house_choice_type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_units_avail</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="house_choice_units_avail_Update_TextBox" ID="house_choice_units_avail_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="house_choice_units_avail_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="house_choice_id"
                                    DataSourceID="house_choice_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="house_choice_id" HeaderText="house_choice_id" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_id" />
                                        <asp:BoundField DataField="house_id" HeaderText="house_id" InsertVisible="False" ReadOnly="True" SortExpression="house_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="house_choice_bathrooms" HeaderText="house_choice_bathrooms" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_bathrooms" Visible="false" />
                                        <asp:BoundField DataField="house_choice_comments" HeaderText="house_choice_comments" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_comments" Visible="false" />
                                        <asp:BoundField DataField="house_choice_contact_person_id" HeaderText="house_choice_contact_person_id" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_contact_person_id" Visible="false" />
                                        <asp:BoundField DataField="house_choice_laundry" HeaderText="house_choice_laundry" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_laundry" Visible="false" />
                                        <asp:BoundField DataField="house_choice_no_floors" HeaderText="house_choice_no_floors" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_no_floors" Visible="false" />
                                        <asp:BoundField DataField="house_choice_parking" HeaderText="house_choice_parking" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_parking" Visible="false" />
                                        <asp:BoundField DataField="house_choice_rent" HeaderText="house_choice_rent" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_rent" Visible="false" />
                                        <asp:BoundField DataField="house_choice_type" HeaderText="house_choice_type" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_type" Visible="false" />
                                        <asp:BoundField DataField="house_choice_units_avail" HeaderText="house_choice_units_avail" InsertVisible="False" ReadOnly="True" SortExpression="house_choice_units_avail" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="house_choice_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [house_choice]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_bathrooms</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_bathrooms_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_comments</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_comments_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_contact_person_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_contact_person_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_laundry</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_laundry_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_no_floors</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_no_floors_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_parking</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_parking_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_rent</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_rent_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">house_choice_units_avail</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="house_choice_units_avail_Delete_TextBox" runat="server"></asp:TextBox>
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

