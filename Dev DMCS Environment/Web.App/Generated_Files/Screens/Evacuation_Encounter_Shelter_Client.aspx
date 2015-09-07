<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Evacuation_Encounter_Shelter_Client.aspx.cs" Inherits="Web.App.Evacuation_Encounter_Shelter_ClientClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Evacuation_Encounter_Shelter_ClientCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Evacuation_Encounter_Shelter_Client CRUD Operations:</span></h1>
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
                                    DataKeyNames="Evacuation_Encounter_Shelter_Client_ID"
                                    DataSourceID="Evacuation_Encounter_Shelter_Client_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Evacuation_Encounter_Shelter_Client_ID" HeaderText="Evacuation_Encounter_Shelter_Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Encounter_Shelter_Client_ID" />
                                        <asp:BoundField DataField="Evacuation_Area_ID" HeaderText="Evacuation_Area_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Area_ID" />
                                        <asp:BoundField DataField="Encounter_Id" HeaderText="Encounter_Id" InsertVisible="False" ReadOnly="True" SortExpression="Encounter_Id" />
                                        <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" InsertVisible="False" ReadOnly="True" SortExpression="Start_Date" Visible="false" />
                                        <asp:BoundField DataField="End_Date" HeaderText="End_Date" InsertVisible="False" ReadOnly="True" SortExpression="End_Date" Visible="false" />
                                        <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" Visible="false" />
                                        <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Evacuation_Encounter_Shelter_Client_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Evacuation_Encounter_Shelter_Client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Evacuation_Area_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Evacuation_Area_ID_Insert_TextBox" ID="Evacuation_Area_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Evacuation_Area_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Encounter_Id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Encounter_Id_Insert_TextBox" ID="Encounter_Id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Encounter_Id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Start_Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Start_Date_Insert_TextBox" ID="Start_Date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Start_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">End_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="End_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Shelter_ID_Insert_TextBox" ID="Shelter_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_ID_Insert_TextBox" ID="Client_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_ID_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Evacuation_Encounter_Shelter_Client_ID"
                                    DataSourceID="Evacuation_Encounter_Shelter_Client_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Evacuation_Encounter_Shelter_Client_ID" HeaderText="Evacuation_Encounter_Shelter_Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Encounter_Shelter_Client_ID" />
                                        <asp:BoundField DataField="Evacuation_Area_ID" HeaderText="Evacuation_Area_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Area_ID" />
                                        <asp:BoundField DataField="Encounter_Id" HeaderText="Encounter_Id" InsertVisible="False" ReadOnly="True" SortExpression="Encounter_Id" />
                                        <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" InsertVisible="False" ReadOnly="True" SortExpression="Start_Date" Visible="false" />
                                        <asp:BoundField DataField="End_Date" HeaderText="End_Date" InsertVisible="False" ReadOnly="True" SortExpression="End_Date" Visible="false" />
                                        <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" Visible="false" />
                                        <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Evacuation_Encounter_Shelter_Client_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Evacuation_Encounter_Shelter_Client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Evacuation_Encounter_Shelter_Client_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Evacuation_Encounter_Shelter_Client_ID_Update_TextBox" ID="Evacuation_Encounter_Shelter_Client_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Evacuation_Encounter_Shelter_Client_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Evacuation_Area_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Evacuation_Area_ID_Update_TextBox" ID="Evacuation_Area_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Evacuation_Area_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Encounter_Id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Encounter_Id_Update_TextBox" ID="Encounter_Id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Encounter_Id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Start_Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Start_Date_Update_TextBox" ID="Start_Date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Start_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">End_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="End_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Shelter_ID_Update_TextBox" ID="Shelter_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Shelter_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_ID_Update_TextBox" ID="Client_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_ID_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Evacuation_Encounter_Shelter_Client_ID"
                                    DataSourceID="Evacuation_Encounter_Shelter_Client_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Evacuation_Encounter_Shelter_Client_ID" HeaderText="Evacuation_Encounter_Shelter_Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Encounter_Shelter_Client_ID" />
                                        <asp:BoundField DataField="Evacuation_Area_ID" HeaderText="Evacuation_Area_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Area_ID" />
                                        <asp:BoundField DataField="Encounter_Id" HeaderText="Encounter_Id" InsertVisible="False" ReadOnly="True" SortExpression="Encounter_Id" />
                                        <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" InsertVisible="False" ReadOnly="True" SortExpression="Start_Date" Visible="false" />
                                        <asp:BoundField DataField="End_Date" HeaderText="End_Date" InsertVisible="False" ReadOnly="True" SortExpression="End_Date" Visible="false" />
                                        <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" Visible="false" />
                                        <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Evacuation_Encounter_Shelter_Client_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Evacuation_Encounter_Shelter_Client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Evacuation_Encounter_Shelter_Client_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Evacuation_Encounter_Shelter_Client_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Evacuation_Area_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Evacuation_Area_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Encounter_Id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Encounter_Id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Start_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Start_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">End_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="End_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Shelter_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Shelter_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_ID_Delete_TextBox" runat="server"></asp:TextBox>
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

