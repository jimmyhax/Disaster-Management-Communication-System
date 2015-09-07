<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProfileFields.aspx.cs" Inherits="Web.App.ProfileFieldsClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="ProfileFieldsCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>ProfileFields CRUD Operations:</span></h1>
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
                                    DataKeyNames="FieldID"
                                    DataSourceID="ProfileFields_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="FieldID" HeaderText="FieldID" InsertVisible="False" ReadOnly="True" SortExpression="FieldID" />
                                        <asp:BoundField DataField="FieldTypeID" HeaderText="FieldTypeID" InsertVisible="False" ReadOnly="True" SortExpression="FieldTypeID" />
                                        <asp:BoundField DataField="FieldName" HeaderText="FieldName" InsertVisible="False" ReadOnly="True" SortExpression="FieldName" />
                                        <asp:BoundField DataField="Comment" HeaderText="Comment" InsertVisible="False" ReadOnly="True" SortExpression="Comment" Visible="false" />
                                        <asp:BoundField DataField="PossibleValues" HeaderText="PossibleValues" InsertVisible="False" ReadOnly="True" SortExpression="PossibleValues" Visible="false" />
                                        <asp:BoundField DataField="TextSelectValue" HeaderText="TextSelectValue" InsertVisible="False" ReadOnly="True" SortExpression="TextSelectValue" Visible="false" />
                                        <asp:BoundField DataField="IsMandatory" HeaderText="IsMandatory" InsertVisible="False" ReadOnly="True" SortExpression="IsMandatory" Visible="false" />
                                        <asp:BoundField DataField="ShowInSignUp" HeaderText="ShowInSignUp" InsertVisible="False" ReadOnly="True" SortExpression="ShowInSignUp" Visible="false" />
                                        <asp:BoundField DataField="FieldGroupID" HeaderText="FieldGroupID" InsertVisible="False" ReadOnly="True" SortExpression="FieldGroupID" Visible="false" />
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" Visible="false" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" Visible="false" />
                                        <asp:BoundField DataField="Modified" HeaderText="Modified" InsertVisible="False" ReadOnly="True" SortExpression="Modified" Visible="false" />
                                        <asp:BoundField DataField="SortValues" HeaderText="SortValues" InsertVisible="False" ReadOnly="True" SortExpression="SortValues" Visible="false" />
                                        <asp:BoundField DataField="IsActive" HeaderText="IsActive" InsertVisible="False" ReadOnly="True" SortExpression="IsActive" Visible="false" />
                                        <asp:BoundField DataField="AdminUseOnly" HeaderText="AdminUseOnly" InsertVisible="False" ReadOnly="True" SortExpression="AdminUseOnly" Visible="false" />
                                        <asp:BoundField DataField="VerticalLayout" HeaderText="VerticalLayout" InsertVisible="False" ReadOnly="True" SortExpression="VerticalLayout" Visible="false" />
                                        <asp:BoundField DataField="Encrypted" HeaderText="Encrypted" InsertVisible="False" ReadOnly="True" SortExpression="Encrypted" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="ProfileFields_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ProfileFields]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldTypeID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FieldTypeID_Insert_TextBox" ID="FieldTypeID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FieldTypeID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldName</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FieldName_Insert_TextBox" ID="FieldName_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FieldName_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Comment</span>
                                <asp:TextBox class="pull-right form-control" ID="Comment_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PossibleValues</span>
                                <asp:TextBox class="pull-right form-control" ID="PossibleValues_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">TextSelectValue</span>
                                <asp:TextBox class="pull-right form-control" ID="TextSelectValue_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsMandatory</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsMandatory_Insert_TextBox" ID="IsMandatory_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsMandatory_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShowInSignUp</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ShowInSignUp_Insert_TextBox" ID="ShowInSignUp_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ShowInSignUp_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldGroupID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FieldGroupID_Insert_TextBox" ID="FieldGroupID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FieldGroupID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="OrderID_Insert_TextBox" ID="OrderID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="OrderID_Insert_TextBox" runat="server"></asp:TextBox>
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
                                <span class="pull-left">SortValues</span>
                                <asp:TextBox class="pull-right form-control" ID="SortValues_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsActive</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsActive_Insert_TextBox" ID="IsActive_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsActive_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AdminUseOnly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="AdminUseOnly_Insert_TextBox" ID="AdminUseOnly_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="AdminUseOnly_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">VerticalLayout</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="VerticalLayout_Insert_TextBox" ID="VerticalLayout_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="VerticalLayout_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Encrypted</span>
                                <asp:TextBox class="pull-right form-control" ID="Encrypted_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="FieldID"
                                    DataSourceID="ProfileFields_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="FieldID" HeaderText="FieldID" InsertVisible="False" ReadOnly="True" SortExpression="FieldID" />
                                        <asp:BoundField DataField="FieldTypeID" HeaderText="FieldTypeID" InsertVisible="False" ReadOnly="True" SortExpression="FieldTypeID" />
                                        <asp:BoundField DataField="FieldName" HeaderText="FieldName" InsertVisible="False" ReadOnly="True" SortExpression="FieldName" />
                                        <asp:BoundField DataField="Comment" HeaderText="Comment" InsertVisible="False" ReadOnly="True" SortExpression="Comment" Visible="false" />
                                        <asp:BoundField DataField="PossibleValues" HeaderText="PossibleValues" InsertVisible="False" ReadOnly="True" SortExpression="PossibleValues" Visible="false" />
                                        <asp:BoundField DataField="TextSelectValue" HeaderText="TextSelectValue" InsertVisible="False" ReadOnly="True" SortExpression="TextSelectValue" Visible="false" />
                                        <asp:BoundField DataField="IsMandatory" HeaderText="IsMandatory" InsertVisible="False" ReadOnly="True" SortExpression="IsMandatory" Visible="false" />
                                        <asp:BoundField DataField="ShowInSignUp" HeaderText="ShowInSignUp" InsertVisible="False" ReadOnly="True" SortExpression="ShowInSignUp" Visible="false" />
                                        <asp:BoundField DataField="FieldGroupID" HeaderText="FieldGroupID" InsertVisible="False" ReadOnly="True" SortExpression="FieldGroupID" Visible="false" />
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" Visible="false" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" Visible="false" />
                                        <asp:BoundField DataField="Modified" HeaderText="Modified" InsertVisible="False" ReadOnly="True" SortExpression="Modified" Visible="false" />
                                        <asp:BoundField DataField="SortValues" HeaderText="SortValues" InsertVisible="False" ReadOnly="True" SortExpression="SortValues" Visible="false" />
                                        <asp:BoundField DataField="IsActive" HeaderText="IsActive" InsertVisible="False" ReadOnly="True" SortExpression="IsActive" Visible="false" />
                                        <asp:BoundField DataField="AdminUseOnly" HeaderText="AdminUseOnly" InsertVisible="False" ReadOnly="True" SortExpression="AdminUseOnly" Visible="false" />
                                        <asp:BoundField DataField="VerticalLayout" HeaderText="VerticalLayout" InsertVisible="False" ReadOnly="True" SortExpression="VerticalLayout" Visible="false" />
                                        <asp:BoundField DataField="Encrypted" HeaderText="Encrypted" InsertVisible="False" ReadOnly="True" SortExpression="Encrypted" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="ProfileFields_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ProfileFields]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FieldID_Update_TextBox" ID="FieldID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FieldID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldTypeID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FieldTypeID_Update_TextBox" ID="FieldTypeID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FieldTypeID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldName</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FieldName_Update_TextBox" ID="FieldName_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FieldName_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Comment</span>
                                <asp:TextBox class="pull-right form-control" ID="Comment_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PossibleValues</span>
                                <asp:TextBox class="pull-right form-control" ID="PossibleValues_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">TextSelectValue</span>
                                <asp:TextBox class="pull-right form-control" ID="TextSelectValue_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsMandatory</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsMandatory_Update_TextBox" ID="IsMandatory_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsMandatory_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShowInSignUp</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ShowInSignUp_Update_TextBox" ID="ShowInSignUp_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ShowInSignUp_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldGroupID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="FieldGroupID_Update_TextBox" ID="FieldGroupID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="FieldGroupID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="OrderID_Update_TextBox" ID="OrderID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="OrderID_Update_TextBox" runat="server"></asp:TextBox>
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
                                <span class="pull-left">SortValues</span>
                                <asp:TextBox class="pull-right form-control" ID="SortValues_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsActive</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="IsActive_Update_TextBox" ID="IsActive_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="IsActive_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AdminUseOnly</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="AdminUseOnly_Update_TextBox" ID="AdminUseOnly_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="AdminUseOnly_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">VerticalLayout</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="VerticalLayout_Update_TextBox" ID="VerticalLayout_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="VerticalLayout_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Encrypted</span>
                                <asp:TextBox class="pull-right form-control" ID="Encrypted_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="FieldID"
                                    DataSourceID="ProfileFields_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="FieldID" HeaderText="FieldID" InsertVisible="False" ReadOnly="True" SortExpression="FieldID" />
                                        <asp:BoundField DataField="FieldTypeID" HeaderText="FieldTypeID" InsertVisible="False" ReadOnly="True" SortExpression="FieldTypeID" />
                                        <asp:BoundField DataField="FieldName" HeaderText="FieldName" InsertVisible="False" ReadOnly="True" SortExpression="FieldName" />
                                        <asp:BoundField DataField="Comment" HeaderText="Comment" InsertVisible="False" ReadOnly="True" SortExpression="Comment" Visible="false" />
                                        <asp:BoundField DataField="PossibleValues" HeaderText="PossibleValues" InsertVisible="False" ReadOnly="True" SortExpression="PossibleValues" Visible="false" />
                                        <asp:BoundField DataField="TextSelectValue" HeaderText="TextSelectValue" InsertVisible="False" ReadOnly="True" SortExpression="TextSelectValue" Visible="false" />
                                        <asp:BoundField DataField="IsMandatory" HeaderText="IsMandatory" InsertVisible="False" ReadOnly="True" SortExpression="IsMandatory" Visible="false" />
                                        <asp:BoundField DataField="ShowInSignUp" HeaderText="ShowInSignUp" InsertVisible="False" ReadOnly="True" SortExpression="ShowInSignUp" Visible="false" />
                                        <asp:BoundField DataField="FieldGroupID" HeaderText="FieldGroupID" InsertVisible="False" ReadOnly="True" SortExpression="FieldGroupID" Visible="false" />
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" Visible="false" />
                                        <asp:BoundField DataField="Created" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" Visible="false" />
                                        <asp:BoundField DataField="Modified" HeaderText="Modified" InsertVisible="False" ReadOnly="True" SortExpression="Modified" Visible="false" />
                                        <asp:BoundField DataField="SortValues" HeaderText="SortValues" InsertVisible="False" ReadOnly="True" SortExpression="SortValues" Visible="false" />
                                        <asp:BoundField DataField="IsActive" HeaderText="IsActive" InsertVisible="False" ReadOnly="True" SortExpression="IsActive" Visible="false" />
                                        <asp:BoundField DataField="AdminUseOnly" HeaderText="AdminUseOnly" InsertVisible="False" ReadOnly="True" SortExpression="AdminUseOnly" Visible="false" />
                                        <asp:BoundField DataField="VerticalLayout" HeaderText="VerticalLayout" InsertVisible="False" ReadOnly="True" SortExpression="VerticalLayout" Visible="false" />
                                        <asp:BoundField DataField="Encrypted" HeaderText="Encrypted" InsertVisible="False" ReadOnly="True" SortExpression="Encrypted" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="ProfileFields_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ProfileFields]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="FieldID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldTypeID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="FieldTypeID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldName</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="FieldName_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Comment</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Comment_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PossibleValues</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="PossibleValues_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">TextSelectValue</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="TextSelectValue_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsMandatory</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="IsMandatory_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShowInSignUp</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ShowInSignUp_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FieldGroupID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="FieldGroupID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OrderID_Delete_TextBox" runat="server"></asp:TextBox>
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
                                <span class="pull-left">SortValues</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="SortValues_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">IsActive</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="IsActive_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AdminUseOnly</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="AdminUseOnly_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">VerticalLayout</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="VerticalLayout_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Encrypted</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Encrypted_Delete_TextBox" runat="server"></asp:TextBox>
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

