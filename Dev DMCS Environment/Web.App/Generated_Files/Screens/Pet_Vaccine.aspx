<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Pet_Vaccine.aspx.cs" Inherits="Web.App.Pet_VaccineClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Pet_VaccineCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Pet_Vaccine CRUD Operations:</span></h1>
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
                                    DataKeyNames="Pet_Vaccine_ID"
                                    DataSourceID="Pet_Vaccine_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Vaccine_ID" HeaderText="Pet_Vaccine_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vaccine_ID" />
                                        <asp:BoundField DataField="Vaccine_Type_ID" HeaderText="Vaccine_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type_ID" />
                                        <asp:BoundField DataField="Allergies" HeaderText="Allergies" InsertVisible="False" ReadOnly="True" SortExpression="Allergies" />
                                        <asp:BoundField DataField="Current_Medacations" HeaderText="Current_Medacations" InsertVisible="False" ReadOnly="True" SortExpression="Current_Medacations" Visible="false" />
                                        <asp:BoundField DataField="Last_Vaccine_Given" HeaderText="Last_Vaccine_Given" InsertVisible="False" ReadOnly="True" SortExpression="Last_Vaccine_Given" Visible="false" />
                                        <asp:BoundField DataField="Date_Time_Stamp" HeaderText="Date_Time_Stamp" InsertVisible="False" ReadOnly="True" SortExpression="Date_Time_Stamp" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Vaccine_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Vaccine]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Vaccine_Type_ID_Insert_TextBox" ID="Vaccine_Type_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Type_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Allergies</span>
                                <asp:TextBox class="pull-right form-control" ID="Allergies_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_Medacations</span>
                                <asp:TextBox class="pull-right form-control" ID="Current_Medacations_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Last_Vaccine_Given</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Last_Vaccine_Given_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Time_Stamp</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Time_Stamp_Insert_TextBox" ID="Date_Time_Stamp_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Time_Stamp_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Vaccine_ID"
                                    DataSourceID="Pet_Vaccine_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Vaccine_ID" HeaderText="Pet_Vaccine_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vaccine_ID" />
                                        <asp:BoundField DataField="Vaccine_Type_ID" HeaderText="Vaccine_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type_ID" />
                                        <asp:BoundField DataField="Allergies" HeaderText="Allergies" InsertVisible="False" ReadOnly="True" SortExpression="Allergies" />
                                        <asp:BoundField DataField="Current_Medacations" HeaderText="Current_Medacations" InsertVisible="False" ReadOnly="True" SortExpression="Current_Medacations" Visible="false" />
                                        <asp:BoundField DataField="Last_Vaccine_Given" HeaderText="Last_Vaccine_Given" InsertVisible="False" ReadOnly="True" SortExpression="Last_Vaccine_Given" Visible="false" />
                                        <asp:BoundField DataField="Date_Time_Stamp" HeaderText="Date_Time_Stamp" InsertVisible="False" ReadOnly="True" SortExpression="Date_Time_Stamp" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Vaccine_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Vaccine]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Vaccine_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Vaccine_ID_Update_TextBox" ID="Pet_Vaccine_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Vaccine_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Vaccine_Type_ID_Update_TextBox" ID="Vaccine_Type_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Vaccine_Type_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Allergies</span>
                                <asp:TextBox class="pull-right form-control" ID="Allergies_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_Medacations</span>
                                <asp:TextBox class="pull-right form-control" ID="Current_Medacations_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Last_Vaccine_Given</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Last_Vaccine_Given_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Time_Stamp</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Time_Stamp_Update_TextBox" ID="Date_Time_Stamp_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Time_Stamp_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Vaccine_ID"
                                    DataSourceID="Pet_Vaccine_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Vaccine_ID" HeaderText="Pet_Vaccine_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vaccine_ID" />
                                        <asp:BoundField DataField="Vaccine_Type_ID" HeaderText="Vaccine_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vaccine_Type_ID" />
                                        <asp:BoundField DataField="Allergies" HeaderText="Allergies" InsertVisible="False" ReadOnly="True" SortExpression="Allergies" />
                                        <asp:BoundField DataField="Current_Medacations" HeaderText="Current_Medacations" InsertVisible="False" ReadOnly="True" SortExpression="Current_Medacations" Visible="false" />
                                        <asp:BoundField DataField="Last_Vaccine_Given" HeaderText="Last_Vaccine_Given" InsertVisible="False" ReadOnly="True" SortExpression="Last_Vaccine_Given" Visible="false" />
                                        <asp:BoundField DataField="Date_Time_Stamp" HeaderText="Date_Time_Stamp" InsertVisible="False" ReadOnly="True" SortExpression="Date_Time_Stamp" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Vaccine_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Vaccine]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Vaccine_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Vaccine_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Vaccine_Type_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Vaccine_Type_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Allergies</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Allergies_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Current_Medacations</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Current_Medacations_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Last_Vaccine_Given</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Last_Vaccine_Given_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Time_Stamp</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Time_Stamp_Delete_TextBox" runat="server"></asp:TextBox>
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

