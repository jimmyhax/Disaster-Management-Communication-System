<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Pet_Deceased.aspx.cs" Inherits="Web.App.Pet_DeceasedClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Pet_DeceasedCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Pet_Deceased CRUD Operations:</span></h1>
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
                                    DataKeyNames="Pet_Deceased_ID"
                                    DataSourceID="Pet_Deceased_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Deceased_ID" HeaderText="Pet_Deceased_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Deceased_ID" />
                                        <asp:BoundField DataField="Date_Deceased" HeaderText="Date_Deceased" InsertVisible="False" ReadOnly="True" SortExpression="Date_Deceased" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                                        <asp:BoundField DataField="Funeral" HeaderText="Funeral" InsertVisible="False" ReadOnly="True" SortExpression="Funeral" Visible="false" />
                                        <asp:BoundField DataField="Cemetary_Name" HeaderText="Cemetary_Name" InsertVisible="False" ReadOnly="True" SortExpression="Cemetary_Name" Visible="false" />
                                        <asp:BoundField DataField="Deceased_Type" HeaderText="Deceased_Type" InsertVisible="False" ReadOnly="True" SortExpression="Deceased_Type" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Deceased_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Deceased]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Deceased</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Deceased_Insert_TextBox" ID="Date_Deceased_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Deceased_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Funeral</span>
                                <asp:TextBox class="pull-right form-control" ID="Funeral_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Cemetary_Name</span>
                                <asp:TextBox class="pull-right form-control" ID="Cemetary_Name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Deceased_Type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Deceased_Type_Insert_TextBox" ID="Deceased_Type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Deceased_Type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Created_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Modified_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Deceased_ID"
                                    DataSourceID="Pet_Deceased_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Deceased_ID" HeaderText="Pet_Deceased_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Deceased_ID" />
                                        <asp:BoundField DataField="Date_Deceased" HeaderText="Date_Deceased" InsertVisible="False" ReadOnly="True" SortExpression="Date_Deceased" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                                        <asp:BoundField DataField="Funeral" HeaderText="Funeral" InsertVisible="False" ReadOnly="True" SortExpression="Funeral" Visible="false" />
                                        <asp:BoundField DataField="Cemetary_Name" HeaderText="Cemetary_Name" InsertVisible="False" ReadOnly="True" SortExpression="Cemetary_Name" Visible="false" />
                                        <asp:BoundField DataField="Deceased_Type" HeaderText="Deceased_Type" InsertVisible="False" ReadOnly="True" SortExpression="Deceased_Type" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Deceased_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Deceased]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Deceased_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Deceased_ID_Update_TextBox" ID="Pet_Deceased_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Deceased_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Deceased</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Deceased_Update_TextBox" ID="Date_Deceased_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Deceased_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Funeral</span>
                                <asp:TextBox class="pull-right form-control" ID="Funeral_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Cemetary_Name</span>
                                <asp:TextBox class="pull-right form-control" ID="Cemetary_Name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Deceased_Type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Deceased_Type_Update_TextBox" ID="Deceased_Type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Deceased_Type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Created_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Modified_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Deceased_ID"
                                    DataSourceID="Pet_Deceased_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Deceased_ID" HeaderText="Pet_Deceased_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Deceased_ID" />
                                        <asp:BoundField DataField="Date_Deceased" HeaderText="Date_Deceased" InsertVisible="False" ReadOnly="True" SortExpression="Date_Deceased" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                                        <asp:BoundField DataField="Funeral" HeaderText="Funeral" InsertVisible="False" ReadOnly="True" SortExpression="Funeral" Visible="false" />
                                        <asp:BoundField DataField="Cemetary_Name" HeaderText="Cemetary_Name" InsertVisible="False" ReadOnly="True" SortExpression="Cemetary_Name" Visible="false" />
                                        <asp:BoundField DataField="Deceased_Type" HeaderText="Deceased_Type" InsertVisible="False" ReadOnly="True" SortExpression="Deceased_Type" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Deceased_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Deceased]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Deceased_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Deceased_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Deceased</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Deceased_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Location_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Funeral</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Funeral_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Cemetary_Name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Cemetary_Name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Deceased_Type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Deceased_Type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Created_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Modified_Delete_TextBox" runat="server"></asp:TextBox>
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

