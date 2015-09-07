<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MemberRoles.aspx.cs" Inherits="Web.App.MemberRolesClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="MemberRolesCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>MemberRoles CRUD Operations:</span></h1>
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
                                    DataKeyNames="MemberID"
                                    DataSourceID="MemberRoles_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="RoleID" HeaderText="RoleID" InsertVisible="False" ReadOnly="True" SortExpression="RoleID" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="MemberRoles_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [MemberRoles]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">RoleID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="RoleID_Insert_TextBox" ID="RoleID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="RoleID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Created</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Created_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="MemberID"
                                    DataSourceID="MemberRoles_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="RoleID" HeaderText="RoleID" InsertVisible="False" ReadOnly="True" SortExpression="RoleID" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="MemberRoles_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [MemberRoles]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="MemberID_Update_TextBox" ID="MemberID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="MemberID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">RoleID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="RoleID_Update_TextBox" ID="RoleID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="RoleID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Created</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Created_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="MemberID"
                                    DataSourceID="MemberRoles_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="RoleID" HeaderText="RoleID" InsertVisible="False" ReadOnly="True" SortExpression="RoleID" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="MemberRoles_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [MemberRoles]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="MemberID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">RoleID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="RoleID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Created</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Created_Delete_TextBox" runat="server"></asp:TextBox>
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

