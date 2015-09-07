<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Pet_Vaccine_Type.aspx.cs" Inherits="Web.App.Pet_Vaccine_TypeClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Pet_Vaccine_TypeCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Pet_Vaccine_Type CRUD Operations:</span></h1>
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
                                    DataKeyNames="Vaccine_Type_ID"
                                    DataSourceID="Pet_Vaccine_Type_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Vaccine_Type_ID" HeaderText="Vaccine_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type_ID" />
                                        <asp:BoundField DataField="Vaccine_Name" HeaderText="Vaccine_Name" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Name" />
                                        <asp:BoundField DataField="Vaccine_Reactions" HeaderText="Vaccine_Reactions" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Reactions" />
                                        <asp:BoundField DataField="Vaccine_Type" HeaderText="Vaccine_Type" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type" Visible="false" />
                                        <asp:BoundField DataField="Vaccine_Description" HeaderText="Vaccine_Description" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Description" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Vaccine_Type_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Vaccine_Type]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Vaccine_Name_Insert_TextBox" ID="Vaccine_Name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Reactions</span>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Reactions_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Vaccine_Type_Insert_TextBox" ID="Vaccine_Type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Description</span>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Description_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Vaccine_Type_ID"
                                    DataSourceID="Pet_Vaccine_Type_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Vaccine_Type_ID" HeaderText="Vaccine_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type_ID" />
                                        <asp:BoundField DataField="Vaccine_Name" HeaderText="Vaccine_Name" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Name" />
                                        <asp:BoundField DataField="Vaccine_Reactions" HeaderText="Vaccine_Reactions" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Reactions" />
                                        <asp:BoundField DataField="Vaccine_Type" HeaderText="Vaccine_Type" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type" Visible="false" />
                                        <asp:BoundField DataField="Vaccine_Description" HeaderText="Vaccine_Description" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Description" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Vaccine_Type_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Vaccine_Type]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Vaccine_Type_ID_Update_TextBox" ID="Vaccine_Type_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Type_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Vaccine_Name_Update_TextBox" ID="Vaccine_Name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Reactions</span>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Reactions_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Vaccine_Type_Update_TextBox" ID="Vaccine_Type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Description</span>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Description_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Vaccine_Type_ID"
                                    DataSourceID="Pet_Vaccine_Type_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Vaccine_Type_ID" HeaderText="Vaccine_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type_ID" />
                                        <asp:BoundField DataField="Vaccine_Name" HeaderText="Vaccine_Name" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Name" />
                                        <asp:BoundField DataField="Vaccine_Reactions" HeaderText="Vaccine_Reactions" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Reactions" />
                                        <asp:BoundField DataField="Vaccine_Type" HeaderText="Vaccine_Type" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type" Visible="false" />
                                        <asp:BoundField DataField="Vaccine_Description" HeaderText="Vaccine_Description" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Description" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Vaccine_Type_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Vaccine_Type]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Vaccine_Type_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Vaccine_Name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Reactions</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Vaccine_Reactions_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Vaccine_Type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Description</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Vaccine_Description_Delete_TextBox" runat="server"></asp:TextBox>
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

