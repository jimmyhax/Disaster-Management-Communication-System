<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Members.aspx.cs" Inherits="Web.App.MembersClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="MembersCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Members CRUD Operations:</span></h1>
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
                                    DataSourceID="Members_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" InsertVisible="False" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" InsertVisible="False" ReadOnly="True" SortExpression="Email" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" InsertVisible="False" ReadOnly="True" SortExpression="Password" Visible="false" />
                                        <asp:BoundField DataField="Avatar" HeaderText="Avatar" InsertVisible="False" ReadOnly="True" SortExpression="Avatar" Visible="false" />
                                        <asp:BoundField DataField="IsEnable" HeaderText="IsEnable" InsertVisible="False" ReadOnly="True" SortExpression="IsEnable" Visible="false" />
                                        <asp:BoundField DataField="IsBuiltIn" HeaderText="IsBuiltIn" InsertVisible="False" ReadOnly="True" SortExpression="IsBuiltIn" Visible="false" />
                                        <asp:BoundField DataField="LastLogin" HeaderText="LastLogin" InsertVisible="False" ReadOnly="True" SortExpression="LastLogin" Visible="false" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" Visible="false" />
                                        <asp:BoundField DataField="Modified" HeaderText="Modified" InsertVisible="False" ReadOnly="True" SortExpression="Modified" Visible="false" />
                                        <asp:BoundField DataField="TimeZoneID" HeaderText="TimeZoneID" InsertVisible="False" ReadOnly="True" SortExpression="TimeZoneID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Members_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Members]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Name_Insert_TextBox" ID="Name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Email</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Email_Insert_TextBox" ID="Email_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Email_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Password</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Password_Insert_TextBox" ID="Password_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Password_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Avatar</span>
                                <asp:TextBox class="pull-right form-control" ID="Avatar_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsEnable</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsEnable_Insert_TextBox" ID="IsEnable_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsEnable_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsBuiltIn</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsBuiltIn_Insert_TextBox" ID="IsBuiltIn_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsBuiltIn_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">LastLogin</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="LastLogin_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Created</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Created_Insert_TextBox" ID="Created_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Created_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Modified</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Modified_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">TimeZoneID</span>
                                <asp:TextBox class="pull-right form-control" ID="TimeZoneID_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataSourceID="Members_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" InsertVisible="False" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" InsertVisible="False" ReadOnly="True" SortExpression="Email" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" InsertVisible="False" ReadOnly="True" SortExpression="Password" Visible="false" />
                                        <asp:BoundField DataField="Avatar" HeaderText="Avatar" InsertVisible="False" ReadOnly="True" SortExpression="Avatar" Visible="false" />
                                        <asp:BoundField DataField="IsEnable" HeaderText="IsEnable" InsertVisible="False" ReadOnly="True" SortExpression="IsEnable" Visible="false" />
                                        <asp:BoundField DataField="IsBuiltIn" HeaderText="IsBuiltIn" InsertVisible="False" ReadOnly="True" SortExpression="IsBuiltIn" Visible="false" />
                                        <asp:BoundField DataField="LastLogin" HeaderText="LastLogin" InsertVisible="False" ReadOnly="True" SortExpression="LastLogin" Visible="false" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" Visible="false" />
                                        <asp:BoundField DataField="Modified" HeaderText="Modified" InsertVisible="False" ReadOnly="True" SortExpression="Modified" Visible="false" />
                                        <asp:BoundField DataField="TimeZoneID" HeaderText="TimeZoneID" InsertVisible="False" ReadOnly="True" SortExpression="TimeZoneID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Members_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Members]"></asp:SqlDataSource>
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
                                <span class="pull-left">Name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Name_Update_TextBox" ID="Name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Email</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Email_Update_TextBox" ID="Email_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Email_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Password</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Password_Update_TextBox" ID="Password_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Password_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Avatar</span>
                                <asp:TextBox class="pull-right form-control" ID="Avatar_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsEnable</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsEnable_Update_TextBox" ID="IsEnable_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsEnable_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsBuiltIn</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsBuiltIn_Update_TextBox" ID="IsBuiltIn_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsBuiltIn_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">LastLogin</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="LastLogin_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Created</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Created_Update_TextBox" ID="Created_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Created_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Modified</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Modified_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">TimeZoneID</span>
                                <asp:TextBox class="pull-right form-control" ID="TimeZoneID_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataSourceID="Members_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" InsertVisible="False" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" InsertVisible="False" ReadOnly="True" SortExpression="Email" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" InsertVisible="False" ReadOnly="True" SortExpression="Password" Visible="false" />
                                        <asp:BoundField DataField="Avatar" HeaderText="Avatar" InsertVisible="False" ReadOnly="True" SortExpression="Avatar" Visible="false" />
                                        <asp:BoundField DataField="IsEnable" HeaderText="IsEnable" InsertVisible="False" ReadOnly="True" SortExpression="IsEnable" Visible="false" />
                                        <asp:BoundField DataField="IsBuiltIn" HeaderText="IsBuiltIn" InsertVisible="False" ReadOnly="True" SortExpression="IsBuiltIn" Visible="false" />
                                        <asp:BoundField DataField="LastLogin" HeaderText="LastLogin" InsertVisible="False" ReadOnly="True" SortExpression="LastLogin" Visible="false" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" Visible="false" />
                                        <asp:BoundField DataField="Modified" HeaderText="Modified" InsertVisible="False" ReadOnly="True" SortExpression="Modified" Visible="false" />
                                        <asp:BoundField DataField="TimeZoneID" HeaderText="TimeZoneID" InsertVisible="False" ReadOnly="True" SortExpression="TimeZoneID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Members_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Members]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="MemberID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Email</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Email_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Password</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Password_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Avatar</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Avatar_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsEnable</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="IsEnable_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsBuiltIn</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="IsBuiltIn_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">LastLogin</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="LastLogin_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Created</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Created_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Modified</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Modified_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">TimeZoneID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="TimeZoneID_Delete_TextBox" runat="server"></asp:TextBox>
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

