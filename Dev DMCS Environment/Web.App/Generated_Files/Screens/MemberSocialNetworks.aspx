<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MemberSocialNetworks.aspx.cs" Inherits="Web.App.MemberSocialNetworksClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="MemberSocialNetworksCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>MemberSocialNetworks CRUD Operations:</span></h1>
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
                                    DataKeyNames="MemberSocialNetworkID"
                                    DataSourceID="MemberSocialNetworks_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberSocialNetworkID" HeaderText="MemberSocialNetworkID" InsertVisible="False" ReadOnly="True" SortExpression="MemberSocialNetworkID" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="SocialNetworkID" HeaderText="SocialNetworkID" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkID" />
                                        <asp:BoundField DataField="SocialNetworkUserID" HeaderText="SocialNetworkUserID" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserID" Visible="false" />
                                        <asp:BoundField DataField="SocialNetworkUserEmail" HeaderText="SocialNetworkUserEmail" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserEmail" Visible="false" />
                                        <asp:BoundField DataField="SocialNetworkUserName" HeaderText="SocialNetworkUserName" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserName" Visible="false" />
                                        <asp:BoundField DataField="AccessToken" HeaderText="AccessToken" InsertVisible="False" ReadOnly="True" SortExpression="AccessToken" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="MemberSocialNetworks_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [MemberSocialNetworks]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="MemberID_Insert_TextBox" ID="MemberID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="MemberID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="SocialNetworkID_Insert_TextBox" ID="SocialNetworkID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="SocialNetworkUserID_Insert_TextBox" ID="SocialNetworkUserID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkUserID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserEmail</span>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkUserEmail_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserName</span>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkUserName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AccessToken</span>
                                <asp:TextBox class="pull-right form-control" ID="AccessToken_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="MemberSocialNetworkID"
                                    DataSourceID="MemberSocialNetworks_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberSocialNetworkID" HeaderText="MemberSocialNetworkID" InsertVisible="False" ReadOnly="True" SortExpression="MemberSocialNetworkID" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="SocialNetworkID" HeaderText="SocialNetworkID" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkID" />
                                        <asp:BoundField DataField="SocialNetworkUserID" HeaderText="SocialNetworkUserID" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserID" Visible="false" />
                                        <asp:BoundField DataField="SocialNetworkUserEmail" HeaderText="SocialNetworkUserEmail" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserEmail" Visible="false" />
                                        <asp:BoundField DataField="SocialNetworkUserName" HeaderText="SocialNetworkUserName" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserName" Visible="false" />
                                        <asp:BoundField DataField="AccessToken" HeaderText="AccessToken" InsertVisible="False" ReadOnly="True" SortExpression="AccessToken" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="MemberSocialNetworks_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [MemberSocialNetworks]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberSocialNetworkID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="MemberSocialNetworkID_Update_TextBox" ID="MemberSocialNetworkID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="MemberSocialNetworkID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="MemberID_Update_TextBox" ID="MemberID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="MemberID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="SocialNetworkID_Update_TextBox" ID="SocialNetworkID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="SocialNetworkUserID_Update_TextBox" ID="SocialNetworkUserID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkUserID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserEmail</span>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkUserEmail_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserName</span>
                                <asp:TextBox class="pull-right form-control" ID="SocialNetworkUserName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AccessToken</span>
                                <asp:TextBox class="pull-right form-control" ID="AccessToken_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="MemberSocialNetworkID"
                                    DataSourceID="MemberSocialNetworks_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="MemberSocialNetworkID" HeaderText="MemberSocialNetworkID" InsertVisible="False" ReadOnly="True" SortExpression="MemberSocialNetworkID" />
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="SocialNetworkID" HeaderText="SocialNetworkID" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkID" />
                                        <asp:BoundField DataField="SocialNetworkUserID" HeaderText="SocialNetworkUserID" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserID" Visible="false" />
                                        <asp:BoundField DataField="SocialNetworkUserEmail" HeaderText="SocialNetworkUserEmail" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserEmail" Visible="false" />
                                        <asp:BoundField DataField="SocialNetworkUserName" HeaderText="SocialNetworkUserName" InsertVisible="False" ReadOnly="True" SortExpression="SocialNetworkUserName" Visible="false" />
                                        <asp:BoundField DataField="AccessToken" HeaderText="AccessToken" InsertVisible="False" ReadOnly="True" SortExpression="AccessToken" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="MemberSocialNetworks_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [MemberSocialNetworks]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberSocialNetworkID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="MemberSocialNetworkID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">MemberID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="MemberID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="SocialNetworkID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="SocialNetworkUserID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserEmail</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="SocialNetworkUserEmail_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">SocialNetworkUserName</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="SocialNetworkUserName_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AccessToken</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="AccessToken_Delete_TextBox" runat="server"></asp:TextBox>
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

