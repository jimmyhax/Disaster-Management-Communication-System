<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="requestor_Order.aspx.cs" Inherits="Web.App.requestor_OrderClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="requestor_OrderCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>requestor_Order CRUD Operations:</span></h1>
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
                                    DataKeyNames="OrderID"
                                    DataSourceID="requestor_Order_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                        <asp:BoundField DataField="Requestor_ID" HeaderText="Requestor_ID" InsertVisible="False" ReadOnly="True" SortExpression="Requestor_ID" />
                                        <asp:BoundField DataField="EncounterID" HeaderText="EncounterID" InsertVisible="False" ReadOnly="True" SortExpression="EncounterID" />
                                        <asp:BoundField DataField="OrderPriority" HeaderText="OrderPriority" InsertVisible="False" ReadOnly="True" SortExpression="OrderPriority" Visible="false" />
                                        <asp:BoundField DataField="OrderNum" HeaderText="OrderNum" InsertVisible="False" ReadOnly="True" SortExpression="OrderNum" Visible="false" />
                                        <asp:BoundField DataField="ShipToAddressID" HeaderText="ShipToAddressID" InsertVisible="False" ReadOnly="True" SortExpression="ShipToAddressID" Visible="false" />
                                        <asp:BoundField DataField="OrderDeliveryType" HeaderText="OrderDeliveryType" InsertVisible="False" ReadOnly="True" SortExpression="OrderDeliveryType" Visible="false" />
                                        <asp:BoundField DataField="OrderPickUpDate" HeaderText="OrderPickUpDate" InsertVisible="False" ReadOnly="True" SortExpression="OrderPickUpDate" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="requestor_Order_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [requestor_Order]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Requestor_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Requestor_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">EncounterID</span>
                                <asp:TextBox class="pull-right form-control" ID="EncounterID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderPriority</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderPriority_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderNum</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderNum_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipToAddressID</span>
                                <asp:TextBox class="pull-right form-control" ID="ShipToAddressID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderDeliveryType</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderDeliveryType_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderPickUpDate</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="OrderPickUpDate_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="OrderID"
                                    DataSourceID="requestor_Order_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                        <asp:BoundField DataField="Requestor_ID" HeaderText="Requestor_ID" InsertVisible="False" ReadOnly="True" SortExpression="Requestor_ID" />
                                        <asp:BoundField DataField="EncounterID" HeaderText="EncounterID" InsertVisible="False" ReadOnly="True" SortExpression="EncounterID" />
                                        <asp:BoundField DataField="OrderPriority" HeaderText="OrderPriority" InsertVisible="False" ReadOnly="True" SortExpression="OrderPriority" Visible="false" />
                                        <asp:BoundField DataField="OrderNum" HeaderText="OrderNum" InsertVisible="False" ReadOnly="True" SortExpression="OrderNum" Visible="false" />
                                        <asp:BoundField DataField="ShipToAddressID" HeaderText="ShipToAddressID" InsertVisible="False" ReadOnly="True" SortExpression="ShipToAddressID" Visible="false" />
                                        <asp:BoundField DataField="OrderDeliveryType" HeaderText="OrderDeliveryType" InsertVisible="False" ReadOnly="True" SortExpression="OrderDeliveryType" Visible="false" />
                                        <asp:BoundField DataField="OrderPickUpDate" HeaderText="OrderPickUpDate" InsertVisible="False" ReadOnly="True" SortExpression="OrderPickUpDate" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="requestor_Order_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [requestor_Order]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="OrderID_Update_TextBox" ID="OrderID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="OrderID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Requestor_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Requestor_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">EncounterID</span>
                                <asp:TextBox class="pull-right form-control" ID="EncounterID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderPriority</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderPriority_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderNum</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderNum_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipToAddressID</span>
                                <asp:TextBox class="pull-right form-control" ID="ShipToAddressID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderDeliveryType</span>
                                <asp:TextBox class="pull-right form-control" ID="OrderDeliveryType_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderPickUpDate</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="OrderPickUpDate_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="OrderID"
                                    DataSourceID="requestor_Order_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                        <asp:BoundField DataField="Requestor_ID" HeaderText="Requestor_ID" InsertVisible="False" ReadOnly="True" SortExpression="Requestor_ID" />
                                        <asp:BoundField DataField="EncounterID" HeaderText="EncounterID" InsertVisible="False" ReadOnly="True" SortExpression="EncounterID" />
                                        <asp:BoundField DataField="OrderPriority" HeaderText="OrderPriority" InsertVisible="False" ReadOnly="True" SortExpression="OrderPriority" Visible="false" />
                                        <asp:BoundField DataField="OrderNum" HeaderText="OrderNum" InsertVisible="False" ReadOnly="True" SortExpression="OrderNum" Visible="false" />
                                        <asp:BoundField DataField="ShipToAddressID" HeaderText="ShipToAddressID" InsertVisible="False" ReadOnly="True" SortExpression="ShipToAddressID" Visible="false" />
                                        <asp:BoundField DataField="OrderDeliveryType" HeaderText="OrderDeliveryType" InsertVisible="False" ReadOnly="True" SortExpression="OrderDeliveryType" Visible="false" />
                                        <asp:BoundField DataField="OrderPickUpDate" HeaderText="OrderPickUpDate" InsertVisible="False" ReadOnly="True" SortExpression="OrderPickUpDate" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="requestor_Order_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [requestor_Order]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OrderID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Requestor_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Requestor_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">EncounterID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="EncounterID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderPriority</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OrderPriority_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderNum</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OrderNum_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipToAddressID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ShipToAddressID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderDeliveryType</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OrderDeliveryType_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OrderPickUpDate</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="OrderPickUpDate_Delete_TextBox" runat="server"></asp:TextBox>
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

