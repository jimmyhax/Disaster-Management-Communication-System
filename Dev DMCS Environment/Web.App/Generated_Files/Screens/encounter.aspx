<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="encounter.aspx.cs" Inherits="Web.App.encounterClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="encounterCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>encounter CRUD Operations:</span></h1>
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
                                    DataKeyNames="encounter_id"
                                    DataSourceID="encounter_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" />
                                        <asp:BoundField DataField="call_center_id" HeaderText="call_center_id" InsertVisible="False" ReadOnly="True" SortExpression="call_center_id" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="create_date" HeaderText="create_date" InsertVisible="False" ReadOnly="True" SortExpression="create_date" Visible="false" />
                                        <asp:BoundField DataField="close_date" HeaderText="close_date" InsertVisible="False" ReadOnly="True" SortExpression="close_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" Visible="false" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">agency_id</span>
                                <asp:TextBox class="pull-right form-control" ID="agency_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">call_center_id</span>
                                <asp:TextBox class="pull-right form-control" ID="call_center_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">create_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="create_date_Insert_TextBox" ID="create_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="create_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">close_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="close_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_id_Insert_TextBox" ID="disaster_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="disaster_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Record_ID_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="encounter_id"
                                    DataSourceID="encounter_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" />
                                        <asp:BoundField DataField="call_center_id" HeaderText="call_center_id" InsertVisible="False" ReadOnly="True" SortExpression="call_center_id" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="create_date" HeaderText="create_date" InsertVisible="False" ReadOnly="True" SortExpression="create_date" Visible="false" />
                                        <asp:BoundField DataField="close_date" HeaderText="close_date" InsertVisible="False" ReadOnly="True" SortExpression="close_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" Visible="false" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="encounter_id_Update_TextBox" ID="encounter_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="encounter_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">agency_id</span>
                                <asp:TextBox class="pull-right form-control" ID="agency_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">call_center_id</span>
                                <asp:TextBox class="pull-right form-control" ID="call_center_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">create_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="create_date_Update_TextBox" ID="create_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="create_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">close_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="close_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_id_Update_TextBox" ID="disaster_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="disaster_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Record_ID_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="encounter_id"
                                    DataSourceID="encounter_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                                        <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" />
                                        <asp:BoundField DataField="call_center_id" HeaderText="call_center_id" InsertVisible="False" ReadOnly="True" SortExpression="call_center_id" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="create_date" HeaderText="create_date" InsertVisible="False" ReadOnly="True" SortExpression="create_date" Visible="false" />
                                        <asp:BoundField DataField="close_date" HeaderText="close_date" InsertVisible="False" ReadOnly="True" SortExpression="close_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" Visible="false" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="encounter_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="case_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">agency_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="agency_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">call_center_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="call_center_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">create_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="create_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">close_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="close_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Location_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Record_ID_Delete_TextBox" runat="server"></asp:TextBox>
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

