<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="agency.aspx.cs" Inherits="Web.App.agencyClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="agencyCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>agency CRUD Operations:</span></h1>
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
                                    DataKeyNames="agency_id"
                                    DataSourceID="agency_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="agency_name" HeaderText="agency_name" InsertVisible="False" ReadOnly="True" SortExpression="agency_name" />
                                        <asp:BoundField DataField="primary_fName" HeaderText="primary_fName" InsertVisible="False" ReadOnly="True" SortExpression="primary_fName" Visible="false" />
                                        <asp:BoundField DataField="primary_lName" HeaderText="primary_lName" InsertVisible="False" ReadOnly="True" SortExpression="primary_lName" Visible="false" />
                                        <asp:BoundField DataField="primary_phone" HeaderText="primary_phone" InsertVisible="False" ReadOnly="True" SortExpression="primary_phone" Visible="false" />
                                        <asp:BoundField DataField="sec_fName" HeaderText="sec_fName" InsertVisible="False" ReadOnly="True" SortExpression="sec_fName" Visible="false" />
                                        <asp:BoundField DataField="sec_lName" HeaderText="sec_lName" InsertVisible="False" ReadOnly="True" SortExpression="sec_lName" Visible="false" />
                                        <asp:BoundField DataField="sec_phone" HeaderText="sec_phone" InsertVisible="False" ReadOnly="True" SortExpression="sec_phone" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="agency_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [agency]"></asp:SqlDataSource>
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
                                <span class="pull-left">agency_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="agency_name_Insert_TextBox" ID="agency_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="agency_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_fName</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="primary_fName_Insert_TextBox" ID="primary_fName_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="primary_fName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_lName</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="primary_lName_Insert_TextBox" ID="primary_lName_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="primary_lName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_phone</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="primary_phone_Insert_TextBox" ID="primary_phone_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
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
                                    DataKeyNames="agency_id"
                                    DataSourceID="agency_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="agency_name" HeaderText="agency_name" InsertVisible="False" ReadOnly="True" SortExpression="agency_name" />
                                        <asp:BoundField DataField="primary_fName" HeaderText="primary_fName" InsertVisible="False" ReadOnly="True" SortExpression="primary_fName" Visible="false" />
                                        <asp:BoundField DataField="primary_lName" HeaderText="primary_lName" InsertVisible="False" ReadOnly="True" SortExpression="primary_lName" Visible="false" />
                                        <asp:BoundField DataField="primary_phone" HeaderText="primary_phone" InsertVisible="False" ReadOnly="True" SortExpression="primary_phone" Visible="false" />
                                        <asp:BoundField DataField="sec_fName" HeaderText="sec_fName" InsertVisible="False" ReadOnly="True" SortExpression="sec_fName" Visible="false" />
                                        <asp:BoundField DataField="sec_lName" HeaderText="sec_lName" InsertVisible="False" ReadOnly="True" SortExpression="sec_lName" Visible="false" />
                                        <asp:BoundField DataField="sec_phone" HeaderText="sec_phone" InsertVisible="False" ReadOnly="True" SortExpression="sec_phone" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="agency_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [agency]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">agency_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="agency_id_Update_TextBox" ID="agency_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="agency_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Update_TextBox" ID="address_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">agency_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="agency_name_Update_TextBox" ID="agency_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="agency_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_fName</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="primary_fName_Update_TextBox" ID="primary_fName_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="primary_fName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_lName</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="primary_lName_Update_TextBox" ID="primary_lName_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="primary_lName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">primary_phone</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="primary_phone_Update_TextBox" ID="primary_phone_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
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
                                    DataKeyNames="agency_id"
                                    DataSourceID="agency_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="agency_name" HeaderText="agency_name" InsertVisible="False" ReadOnly="True" SortExpression="agency_name" />
                                        <asp:BoundField DataField="primary_fName" HeaderText="primary_fName" InsertVisible="False" ReadOnly="True" SortExpression="primary_fName" Visible="false" />
                                        <asp:BoundField DataField="primary_lName" HeaderText="primary_lName" InsertVisible="False" ReadOnly="True" SortExpression="primary_lName" Visible="false" />
                                        <asp:BoundField DataField="primary_phone" HeaderText="primary_phone" InsertVisible="False" ReadOnly="True" SortExpression="primary_phone" Visible="false" />
                                        <asp:BoundField DataField="sec_fName" HeaderText="sec_fName" InsertVisible="False" ReadOnly="True" SortExpression="sec_fName" Visible="false" />
                                        <asp:BoundField DataField="sec_lName" HeaderText="sec_lName" InsertVisible="False" ReadOnly="True" SortExpression="sec_lName" Visible="false" />
                                        <asp:BoundField DataField="sec_phone" HeaderText="sec_phone" InsertVisible="False" ReadOnly="True" SortExpression="sec_phone" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="agency_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [agency]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">agency_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="agency_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">agency_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="agency_name_Delete_TextBox" runat="server"></asp:TextBox>
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

