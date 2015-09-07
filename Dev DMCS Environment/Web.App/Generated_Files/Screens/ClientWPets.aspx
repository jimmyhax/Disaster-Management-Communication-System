<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ClientWPets.aspx.cs" Inherits="Web.App.ClientWPetsClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="ClientWPetsCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>ClientWPets CRUD Operations:</span></h1>
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
                                    DataKeyNames="CLIENTWPETS_ID"
                                    DataSourceID="ClientWPets_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="CLIENTWPETS_ID" HeaderText="CLIENTWPETS_ID" InsertVisible="False" ReadOnly="True" SortExpression="CLIENTWPETS_ID" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                                        <asp:BoundField DataField="Client_id" HeaderText="Client_id" InsertVisible="False" ReadOnly="True" SortExpression="Client_id" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="cp_Date" HeaderText="cp_Date" InsertVisible="False" ReadOnly="True" SortExpression="cp_Date" Visible="false" />
                                        <asp:BoundField DataField="ownership" HeaderText="ownership" InsertVisible="False" ReadOnly="True" SortExpression="ownership" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="ClientWPets_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ClientWPets]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Record_ID_Insert_TextBox" ID="Pet_Record_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Record_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cp_Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="cp_Date_Insert_TextBox" ID="cp_Date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="cp_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ownership</span>
                                <asp:TextBox class="pull-right form-control" ID="ownership_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="CLIENTWPETS_ID"
                                    DataSourceID="ClientWPets_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="CLIENTWPETS_ID" HeaderText="CLIENTWPETS_ID" InsertVisible="False" ReadOnly="True" SortExpression="CLIENTWPETS_ID" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                                        <asp:BoundField DataField="Client_id" HeaderText="Client_id" InsertVisible="False" ReadOnly="True" SortExpression="Client_id" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="cp_Date" HeaderText="cp_Date" InsertVisible="False" ReadOnly="True" SortExpression="cp_Date" Visible="false" />
                                        <asp:BoundField DataField="ownership" HeaderText="ownership" InsertVisible="False" ReadOnly="True" SortExpression="ownership" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="ClientWPets_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ClientWPets]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CLIENTWPETS_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="CLIENTWPETS_ID_Update_TextBox" ID="CLIENTWPETS_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="CLIENTWPETS_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Record_ID_Update_TextBox" ID="Pet_Record_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Record_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_id</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cp_Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="cp_Date_Update_TextBox" ID="cp_Date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="cp_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ownership</span>
                                <asp:TextBox class="pull-right form-control" ID="ownership_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="CLIENTWPETS_ID"
                                    DataSourceID="ClientWPets_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="CLIENTWPETS_ID" HeaderText="CLIENTWPETS_ID" InsertVisible="False" ReadOnly="True" SortExpression="CLIENTWPETS_ID" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                                        <asp:BoundField DataField="Client_id" HeaderText="Client_id" InsertVisible="False" ReadOnly="True" SortExpression="Client_id" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="cp_Date" HeaderText="cp_Date" InsertVisible="False" ReadOnly="True" SortExpression="cp_Date" Visible="false" />
                                        <asp:BoundField DataField="ownership" HeaderText="ownership" InsertVisible="False" ReadOnly="True" SortExpression="ownership" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="ClientWPets_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ClientWPets]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">CLIENTWPETS_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="CLIENTWPETS_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Record_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Location_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">cp_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="cp_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ownership</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ownership_Delete_TextBox" runat="server"></asp:TextBox>
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

