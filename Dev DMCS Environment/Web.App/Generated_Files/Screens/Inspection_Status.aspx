<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Inspection_Status.aspx.cs" Inherits="Web.App.Inspection_StatusClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Inspection_StatusCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Inspection_Status CRUD Operations:</span></h1>
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
                                    DataKeyNames="InspectionStatus_ID"
                                    DataSourceID="Inspection_Status_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="InspectionStatus_ID" HeaderText="InspectionStatus_ID" InsertVisible="False" ReadOnly="True" SortExpression="InspectionStatus_ID" />
                                        <asp:BoundField DataField="Evacuation_Area_ID" HeaderText="Evacuation_Area_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Area_ID" />
                                        <asp:BoundField DataField="Address_ID" HeaderText="Address_ID" InsertVisible="False" ReadOnly="True" SortExpression="Address_ID" />
                                        <asp:BoundField DataField="Inspection_Code" HeaderText="Inspection_Code" InsertVisible="False" ReadOnly="True" SortExpression="Inspection_Code" Visible="false" />
                                        <asp:BoundField DataField="Client_Found" HeaderText="Client_Found" InsertVisible="False" ReadOnly="True" SortExpression="Client_Found" Visible="false" />
                                        <asp:BoundField DataField="Client_Found_Status" HeaderText="Client_Found_Status" InsertVisible="False" ReadOnly="True" SortExpression="Client_Found_Status" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Inspection_Status_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Inspection_Status]"></asp:SqlDataSource>
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
                                <span class="pull-left">Address_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Address_ID_Insert_TextBox" ID="Address_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Address_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Inspection_Code</span>
                                <asp:TextBox class="pull-right form-control" ID="Inspection_Code_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Found</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_Found_Insert_TextBox" ID="Client_Found_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_Found_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Found_Status</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_Found_Status_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="InspectionStatus_ID"
                                    DataSourceID="Inspection_Status_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="InspectionStatus_ID" HeaderText="InspectionStatus_ID" InsertVisible="False" ReadOnly="True" SortExpression="InspectionStatus_ID" />
                                        <asp:BoundField DataField="Evacuation_Area_ID" HeaderText="Evacuation_Area_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Area_ID" />
                                        <asp:BoundField DataField="Address_ID" HeaderText="Address_ID" InsertVisible="False" ReadOnly="True" SortExpression="Address_ID" />
                                        <asp:BoundField DataField="Inspection_Code" HeaderText="Inspection_Code" InsertVisible="False" ReadOnly="True" SortExpression="Inspection_Code" Visible="false" />
                                        <asp:BoundField DataField="Client_Found" HeaderText="Client_Found" InsertVisible="False" ReadOnly="True" SortExpression="Client_Found" Visible="false" />
                                        <asp:BoundField DataField="Client_Found_Status" HeaderText="Client_Found_Status" InsertVisible="False" ReadOnly="True" SortExpression="Client_Found_Status" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Inspection_Status_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Inspection_Status]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">InspectionStatus_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="InspectionStatus_ID_Update_TextBox" ID="InspectionStatus_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="InspectionStatus_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Evacuation_Area_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Evacuation_Area_ID_Update_TextBox" ID="Evacuation_Area_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Evacuation_Area_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Address_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Address_ID_Update_TextBox" ID="Address_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Address_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Inspection_Code</span>
                                <asp:TextBox class="pull-right form-control" ID="Inspection_Code_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Found</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Client_Found_Update_TextBox" ID="Client_Found_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Client_Found_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Found_Status</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_Found_Status_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="InspectionStatus_ID"
                                    DataSourceID="Inspection_Status_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="InspectionStatus_ID" HeaderText="InspectionStatus_ID" InsertVisible="False" ReadOnly="True" SortExpression="InspectionStatus_ID" />
                                        <asp:BoundField DataField="Evacuation_Area_ID" HeaderText="Evacuation_Area_ID" InsertVisible="False" ReadOnly="True" SortExpression="Evacuation_Area_ID" />
                                        <asp:BoundField DataField="Address_ID" HeaderText="Address_ID" InsertVisible="False" ReadOnly="True" SortExpression="Address_ID" />
                                        <asp:BoundField DataField="Inspection_Code" HeaderText="Inspection_Code" InsertVisible="False" ReadOnly="True" SortExpression="Inspection_Code" Visible="false" />
                                        <asp:BoundField DataField="Client_Found" HeaderText="Client_Found" InsertVisible="False" ReadOnly="True" SortExpression="Client_Found" Visible="false" />
                                        <asp:BoundField DataField="Client_Found_Status" HeaderText="Client_Found_Status" InsertVisible="False" ReadOnly="True" SortExpression="Client_Found_Status" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Inspection_Status_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Inspection_Status]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">InspectionStatus_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="InspectionStatus_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Evacuation_Area_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Evacuation_Area_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Address_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Address_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Inspection_Code</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Inspection_Code_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Found</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_Found_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Found_Status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_Found_Status_Delete_TextBox" runat="server"></asp:TextBox>
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

