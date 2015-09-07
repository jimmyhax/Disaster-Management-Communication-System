<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Vendor_Products_shipments.aspx.cs" Inherits="Web.App.Vendor_Products_shipmentsClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Vendor_Products_shipmentsCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Vendor_Products_shipments CRUD Operations:</span></h1>
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
                                    DataKeyNames="PO_Order_no"
                                    DataSourceID="Vendor_Products_shipments_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="PO_Order_no" HeaderText="PO_Order_no" InsertVisible="False" ReadOnly="True" SortExpression="PO_Order_no" />
                                        <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                                        <asp:BoundField DataField="VendorID" HeaderText="VendorID" InsertVisible="False" ReadOnly="True" SortExpression="VendorID" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" Visible="false" />
                                        <asp:BoundField DataField="Expect_Delivery_Date" HeaderText="Expect_Delivery_Date" InsertVisible="False" ReadOnly="True" SortExpression="Expect_Delivery_Date" Visible="false" />
                                        <asp:BoundField DataField="orderdate" HeaderText="orderdate" InsertVisible="False" ReadOnly="True" SortExpression="orderdate" Visible="false" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="OtherInfo" HeaderText="OtherInfo" InsertVisible="False" ReadOnly="True" SortExpression="OtherInfo" Visible="false" />
                                        <asp:BoundField DataField="DateReceived" HeaderText="DateReceived" InsertVisible="False" ReadOnly="True" SortExpression="DateReceived" Visible="false" />
                                        <asp:BoundField DataField="AmountReceived" HeaderText="AmountReceived" InsertVisible="False" ReadOnly="True" SortExpression="AmountReceived" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Vendor_Products_shipments_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Vendor_Products_shipments]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipmentID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ShipmentID_Insert_TextBox" ID="ShipmentID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ShipmentID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">VendorID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="VendorID_Insert_TextBox" ID="VendorID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="VendorID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ProductID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ProductID_Insert_TextBox" ID="ProductID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ProductID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Expect_Delivery_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Expect_Delivery_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">orderdate</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="orderdate_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="quantity_Insert_TextBox" ID="quantity_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="quantity_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OtherInfo</span>
                                <asp:TextBox class="pull-right form-control" ID="OtherInfo_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DateReceived</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="DateReceived_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AmountReceived</span>
                                <asp:TextBox class="pull-right form-control" ID="AmountReceived_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="PO_Order_no"
                                    DataSourceID="Vendor_Products_shipments_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="PO_Order_no" HeaderText="PO_Order_no" InsertVisible="False" ReadOnly="True" SortExpression="PO_Order_no" />
                                        <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                                        <asp:BoundField DataField="VendorID" HeaderText="VendorID" InsertVisible="False" ReadOnly="True" SortExpression="VendorID" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" Visible="false" />
                                        <asp:BoundField DataField="Expect_Delivery_Date" HeaderText="Expect_Delivery_Date" InsertVisible="False" ReadOnly="True" SortExpression="Expect_Delivery_Date" Visible="false" />
                                        <asp:BoundField DataField="orderdate" HeaderText="orderdate" InsertVisible="False" ReadOnly="True" SortExpression="orderdate" Visible="false" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="OtherInfo" HeaderText="OtherInfo" InsertVisible="False" ReadOnly="True" SortExpression="OtherInfo" Visible="false" />
                                        <asp:BoundField DataField="DateReceived" HeaderText="DateReceived" InsertVisible="False" ReadOnly="True" SortExpression="DateReceived" Visible="false" />
                                        <asp:BoundField DataField="AmountReceived" HeaderText="AmountReceived" InsertVisible="False" ReadOnly="True" SortExpression="AmountReceived" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Vendor_Products_shipments_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Vendor_Products_shipments]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PO_Order_no</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="PO_Order_no_Update_TextBox" ID="PO_Order_no_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="PO_Order_no_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipmentID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ShipmentID_Update_TextBox" ID="ShipmentID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ShipmentID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">VendorID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="VendorID_Update_TextBox" ID="VendorID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="VendorID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ProductID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ProductID_Update_TextBox" ID="ProductID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ProductID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Expect_Delivery_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Expect_Delivery_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">orderdate</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="orderdate_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="quantity_Update_TextBox" ID="quantity_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="quantity_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OtherInfo</span>
                                <asp:TextBox class="pull-right form-control" ID="OtherInfo_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DateReceived</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="DateReceived_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AmountReceived</span>
                                <asp:TextBox class="pull-right form-control" ID="AmountReceived_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="PO_Order_no"
                                    DataSourceID="Vendor_Products_shipments_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="PO_Order_no" HeaderText="PO_Order_no" InsertVisible="False" ReadOnly="True" SortExpression="PO_Order_no" />
                                        <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" InsertVisible="False" ReadOnly="True" SortExpression="ShipmentID" />
                                        <asp:BoundField DataField="VendorID" HeaderText="VendorID" InsertVisible="False" ReadOnly="True" SortExpression="VendorID" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" Visible="false" />
                                        <asp:BoundField DataField="Expect_Delivery_Date" HeaderText="Expect_Delivery_Date" InsertVisible="False" ReadOnly="True" SortExpression="Expect_Delivery_Date" Visible="false" />
                                        <asp:BoundField DataField="orderdate" HeaderText="orderdate" InsertVisible="False" ReadOnly="True" SortExpression="orderdate" Visible="false" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="OtherInfo" HeaderText="OtherInfo" InsertVisible="False" ReadOnly="True" SortExpression="OtherInfo" Visible="false" />
                                        <asp:BoundField DataField="DateReceived" HeaderText="DateReceived" InsertVisible="False" ReadOnly="True" SortExpression="DateReceived" Visible="false" />
                                        <asp:BoundField DataField="AmountReceived" HeaderText="AmountReceived" InsertVisible="False" ReadOnly="True" SortExpression="AmountReceived" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Vendor_Products_shipments_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Vendor_Products_shipments]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PO_Order_no</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="PO_Order_no_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ShipmentID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ShipmentID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">VendorID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="VendorID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ProductID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ProductID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Expect_Delivery_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Expect_Delivery_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">orderdate</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="orderdate_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="quantity_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OtherInfo</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OtherInfo_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DateReceived</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="DateReceived_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AmountReceived</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="AmountReceived_Delete_TextBox" runat="server"></asp:TextBox>
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

