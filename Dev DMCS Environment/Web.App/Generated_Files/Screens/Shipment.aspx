<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Shipment.aspx.cs" Inherits="Web.App.ShipmentClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="ShipmentCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Shipment CRUD Operations:</span></h1>
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
                                    DataKeyNames="ShipmentID"
                                    DataSourceID="Shipment_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                                        <asp:BoundField DataField="WarehouseID" HeaderText="WarehouseID" InsertVisible="False" ReadOnly="True" SortExpression="WarehouseID" />
                                        <asp:BoundField DataField="Tracking_Num" HeaderText="Tracking_Num" InsertVisible="False" ReadOnly="True" SortExpression="Tracking_Num" />
                                        <asp:BoundField DataField="Ship_Method" HeaderText="Ship_Method" InsertVisible="False" ReadOnly="True" SortExpression="Ship_Method" Visible="false" />
                                        <asp:BoundField DataField="Other" HeaderText="Other" InsertVisible="False" ReadOnly="True" SortExpression="Other" Visible="false" />
                                        <asp:BoundField DataField="OrderRecByID" HeaderText="OrderRecByID" InsertVisible="False" ReadOnly="True" SortExpression="OrderRecByID" Visible="false" />
                                        <asp:BoundField DataField="FullOrderReceived" HeaderText="FullOrderReceived" InsertVisible="False" ReadOnly="True" SortExpression="FullOrderReceived" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Shipment_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Shipment]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">WarehouseID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="WarehouseID_Insert_TextBox" ID="WarehouseID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="WarehouseID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tracking_Num</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Tracking_Num_Insert_TextBox" ID="Tracking_Num_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Tracking_Num_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Ship_Method</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Ship_Method_Insert_TextBox" ID="Ship_Method_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Ship_Method_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other</span>
                                <asp:TextBox class="pull-right form-control" ID="Other_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderRecByID</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderRecByID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FullOrderReceived</span>
                                <asp:TextBox class="pull-right form-control" ID="FullOrderReceived_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="ShipmentID"
                                    DataSourceID="Shipment_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                                        <asp:BoundField DataField="WarehouseID" HeaderText="WarehouseID" InsertVisible="False" ReadOnly="True" SortExpression="WarehouseID" />
                                        <asp:BoundField DataField="Tracking_Num" HeaderText="Tracking_Num" InsertVisible="False" ReadOnly="True" SortExpression="Tracking_Num" />
                                        <asp:BoundField DataField="Ship_Method" HeaderText="Ship_Method" InsertVisible="False" ReadOnly="True" SortExpression="Ship_Method" Visible="false" />
                                        <asp:BoundField DataField="Other" HeaderText="Other" InsertVisible="False" ReadOnly="True" SortExpression="Other" Visible="false" />
                                        <asp:BoundField DataField="OrderRecByID" HeaderText="OrderRecByID" InsertVisible="False" ReadOnly="True" SortExpression="OrderRecByID" Visible="false" />
                                        <asp:BoundField DataField="FullOrderReceived" HeaderText="FullOrderReceived" InsertVisible="False" ReadOnly="True" SortExpression="FullOrderReceived" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Shipment_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Shipment]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipmentID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ShipmentID_Update_TextBox" ID="ShipmentID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ShipmentID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">WarehouseID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="WarehouseID_Update_TextBox" ID="WarehouseID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="WarehouseID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tracking_Num</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Tracking_Num_Update_TextBox" ID="Tracking_Num_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Tracking_Num_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Ship_Method</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Ship_Method_Update_TextBox" ID="Ship_Method_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Ship_Method_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other</span>
                                <asp:TextBox class="pull-right form-control" ID="Other_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderRecByID</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderRecByID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FullOrderReceived</span>
                                <asp:TextBox class="pull-right form-control" ID="FullOrderReceived_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="ShipmentID"
                                    DataSourceID="Shipment_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                                        <asp:BoundField DataField="WarehouseID" HeaderText="WarehouseID" InsertVisible="False" ReadOnly="True" SortExpression="WarehouseID" />
                                        <asp:BoundField DataField="Tracking_Num" HeaderText="Tracking_Num" InsertVisible="False" ReadOnly="True" SortExpression="Tracking_Num" />
                                        <asp:BoundField DataField="Ship_Method" HeaderText="Ship_Method" InsertVisible="False" ReadOnly="True" SortExpression="Ship_Method" Visible="false" />
                                        <asp:BoundField DataField="Other" HeaderText="Other" InsertVisible="False" ReadOnly="True" SortExpression="Other" Visible="false" />
                                        <asp:BoundField DataField="OrderRecByID" HeaderText="OrderRecByID" InsertVisible="False" ReadOnly="True" SortExpression="OrderRecByID" Visible="false" />
                                        <asp:BoundField DataField="FullOrderReceived" HeaderText="FullOrderReceived" InsertVisible="False" ReadOnly="True" SortExpression="FullOrderReceived" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Shipment_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Shipment]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipmentID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ShipmentID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">WarehouseID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="WarehouseID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tracking_Num</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Tracking_Num_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Ship_Method</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Ship_Method_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Other</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Other_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderRecByID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OrderRecByID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FullOrderReceived</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="FullOrderReceived_Delete_TextBox" runat="server"></asp:TextBox>
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

