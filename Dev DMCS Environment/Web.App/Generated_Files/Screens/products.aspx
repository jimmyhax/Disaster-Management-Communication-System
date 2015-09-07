<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="products.aspx.cs" Inherits="Web.App.productsClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="productsCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>products CRUD Operations:</span></h1>
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
                                    DataKeyNames="product_id"
                                    DataSourceID="products_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="product_name" HeaderText="product_name" InsertVisible="False" ReadOnly="True" SortExpression="product_name" />
                                        <asp:BoundField DataField="product_type" HeaderText="product_type" InsertVisible="False" ReadOnly="True" SortExpression="product_type" Visible="false" />
                                        <asp:BoundField DataField="product_qty" HeaderText="product_qty" InsertVisible="False" ReadOnly="True" SortExpression="product_qty" Visible="false" />
                                        <asp:BoundField DataField="product_desc" HeaderText="product_desc" InsertVisible="False" ReadOnly="True" SortExpression="product_desc" Visible="false" />
                                        <asp:BoundField DataField="product_color" HeaderText="product_color" InsertVisible="False" ReadOnly="True" SortExpression="product_color" Visible="false" />
                                        <asp:BoundField DataField="product_size" HeaderText="product_size" InsertVisible="False" ReadOnly="True" SortExpression="product_size" Visible="false" />
                                        <asp:BoundField DataField="product_cost" HeaderText="product_cost" InsertVisible="False" ReadOnly="True" SortExpression="product_cost" Visible="false" />
                                        <asp:BoundField DataField="Product_exp_date" HeaderText="Product_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_exp_date" Visible="false" />
                                        <asp:BoundField DataField="Product_Alergy_info" HeaderText="Product_Alergy_info" InsertVisible="False" ReadOnly="True" SortExpression="Product_Alergy_info" Visible="false" />
                                        <asp:BoundField DataField="Product_refrigde" HeaderText="Product_refrigde" InsertVisible="False" ReadOnly="True" SortExpression="Product_refrigde" Visible="false" />
                                        <asp:BoundField DataField="Product_Flammable" HeaderText="Product_Flammable" InsertVisible="False" ReadOnly="True" SortExpression="Product_Flammable" Visible="false" />
                                        <asp:BoundField DataField="Product_Hazard" HeaderText="Product_Hazard" InsertVisible="False" ReadOnly="True" SortExpression="Product_Hazard" Visible="false" />
                                        <asp:BoundField DataField="Product_Other" HeaderText="Product_Other" InsertVisible="False" ReadOnly="True" SortExpression="Product_Other" Visible="false" />
                                        <asp:BoundField DataField="Product_Min_Inv" HeaderText="Product_Min_Inv" InsertVisible="False" ReadOnly="True" SortExpression="Product_Min_Inv" Visible="false" />
                                        <asp:BoundField DataField="Product_Barcode" HeaderText="Product_Barcode" InsertVisible="False" ReadOnly="True" SortExpression="Product_Barcode" Visible="false" />
                                        <asp:BoundField DataField="Product_subtype" HeaderText="Product_subtype" InsertVisible="False" ReadOnly="True" SortExpression="Product_subtype" Visible="false" />
                                        <asp:BoundField DataField="Make" HeaderText="Make" InsertVisible="False" ReadOnly="True" SortExpression="Make" Visible="false" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" InsertVisible="False" ReadOnly="True" SortExpression="Model" Visible="false" />
                                        <asp:BoundField DataField="FEMA_Description" HeaderText="FEMA_Description" InsertVisible="False" ReadOnly="True" SortExpression="FEMA_Description" Visible="false" />
                                        <asp:BoundField DataField="Year" HeaderText="Year" InsertVisible="False" ReadOnly="True" SortExpression="Year" Visible="false" />
                                        <asp:BoundField DataField="RFID" HeaderText="RFID" InsertVisible="False" ReadOnly="True" SortExpression="RFID" Visible="false" />
                                        <asp:BoundField DataField="GPS" HeaderText="GPS" InsertVisible="False" ReadOnly="True" SortExpression="GPS" Visible="false" />
                                        <asp:BoundField DataField="Serial_Number" HeaderText="Serial_Number" InsertVisible="False" ReadOnly="True" SortExpression="Serial_Number" Visible="false" />
                                        <asp:BoundField DataField="Height" HeaderText="Height" InsertVisible="False" ReadOnly="True" SortExpression="Height" Visible="false" />
                                        <asp:BoundField DataField="Length" HeaderText="Length" InsertVisible="False" ReadOnly="True" SortExpression="Length" Visible="false" />
                                        <asp:BoundField DataField="Depth" HeaderText="Depth" InsertVisible="False" ReadOnly="True" SortExpression="Depth" Visible="false" />
                                        <asp:BoundField DataField="Weight" HeaderText="Weight" InsertVisible="False" ReadOnly="True" SortExpression="Weight" Visible="false" />
                                        <asp:BoundField DataField="OAI" HeaderText="OAI" InsertVisible="False" ReadOnly="True" SortExpression="OAI" Visible="false" />
                                        <asp:BoundField DataField="OAI_Type" HeaderText="OAI_Type" InsertVisible="False" ReadOnly="True" SortExpression="OAI_Type" Visible="false" />
                                        <asp:BoundField DataField="Use" HeaderText="Use" InsertVisible="False" ReadOnly="True" SortExpression="Use" Visible="false" />
                                        <asp:BoundField DataField="Brand" HeaderText="Brand" InsertVisible="False" ReadOnly="True" SortExpression="Brand" Visible="false" />
                                        <asp:BoundField DataField="Power_Supply" HeaderText="Power_Supply" InsertVisible="False" ReadOnly="True" SortExpression="Power_Supply" Visible="false" />
                                        <asp:BoundField DataField="Gas_Type" HeaderText="Gas_Type" InsertVisible="False" ReadOnly="True" SortExpression="Gas_Type" Visible="false" />
                                        <asp:BoundField DataField="Needs_Gas" HeaderText="Needs_Gas" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Gas" Visible="false" />
                                        <asp:BoundField DataField="Needs_Electricity" HeaderText="Needs_Electricity" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Electricity" Visible="false" />
                                        <asp:BoundField DataField="Availability" HeaderText="Availability" InsertVisible="False" ReadOnly="True" SortExpression="Availability" Visible="false" />
                                        <asp:BoundField DataField="Datetime" HeaderText="Datetime" InsertVisible="False" ReadOnly="True" SortExpression="Datetime" Visible="false" />
                                        <asp:BoundField DataField="OpenStatus" HeaderText="OpenStatus" InsertVisible="False" ReadOnly="True" SortExpression="OpenStatus" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="products_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Resource_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_name_Insert_TextBox" ID="product_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_type_Insert_TextBox" ID="product_type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_qty</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_qty_Insert_TextBox" ID="product_qty_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_qty_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_desc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_desc_Insert_TextBox" ID="product_desc_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_desc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_color</span>
                                <asp:TextBox class="pull-right form-control" ID="product_color_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_size</span>
                                <asp:TextBox class="pull-right form-control" ID="product_size_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_cost</span>
                                <asp:TextBox class="pull-right form-control" ID="product_cost_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_exp_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Product_exp_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Alergy_info</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Alergy_info_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_refrigde</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_refrigde_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Flammable</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Flammable_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Hazard</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Hazard_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Other</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Other_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Min_Inv</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Min_Inv_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Barcode</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Barcode_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_subtype</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_subtype_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Make</span>
                                <asp:TextBox class="pull-right form-control" ID="Make_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Model</span>
                                <asp:TextBox class="pull-right form-control" ID="Model_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FEMA_Description</span>
                                <asp:TextBox class="pull-right form-control" ID="FEMA_Description_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Year</span>
                                <asp:TextBox class="pull-right form-control" ID="Year_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">RFID</span>
                                <asp:TextBox class="pull-right form-control" ID="RFID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">GPS</span>
                                <asp:TextBox class="pull-right form-control" ID="GPS_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Serial_Number</span>
                                <asp:TextBox class="pull-right form-control" ID="Serial_Number_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Height</span>
                                <asp:TextBox class="pull-right form-control" ID="Height_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Length</span>
                                <asp:TextBox class="pull-right form-control" ID="Length_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Depth</span>
                                <asp:TextBox class="pull-right form-control" ID="Depth_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Weight</span>
                                <asp:TextBox class="pull-right form-control" ID="Weight_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OAI</span>
                                <asp:TextBox class="pull-right form-control" ID="OAI_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OAI_Type</span>
                                <asp:TextBox class="pull-right form-control" ID="OAI_Type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Use</span>
                                <asp:TextBox class="pull-right form-control" ID="Use_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Brand</span>
                                <asp:TextBox class="pull-right form-control" ID="Brand_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Power_Supply</span>
                                <asp:TextBox class="pull-right form-control" ID="Power_Supply_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Gas_Type</span>
                                <asp:TextBox class="pull-right form-control" ID="Gas_Type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Needs_Gas</span>
                                <asp:TextBox class="pull-right form-control" ID="Needs_Gas_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Needs_Electricity</span>
                                <asp:TextBox class="pull-right form-control" ID="Needs_Electricity_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Availability</span>
                                <asp:TextBox class="pull-right form-control" ID="Availability_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Datetime</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Datetime_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OpenStatus</span>
                                <asp:TextBox class="pull-right form-control" ID="OpenStatus_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="product_id"
                                    DataSourceID="products_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="product_name" HeaderText="product_name" InsertVisible="False" ReadOnly="True" SortExpression="product_name" />
                                        <asp:BoundField DataField="product_type" HeaderText="product_type" InsertVisible="False" ReadOnly="True" SortExpression="product_type" Visible="false" />
                                        <asp:BoundField DataField="product_qty" HeaderText="product_qty" InsertVisible="False" ReadOnly="True" SortExpression="product_qty" Visible="false" />
                                        <asp:BoundField DataField="product_desc" HeaderText="product_desc" InsertVisible="False" ReadOnly="True" SortExpression="product_desc" Visible="false" />
                                        <asp:BoundField DataField="product_color" HeaderText="product_color" InsertVisible="False" ReadOnly="True" SortExpression="product_color" Visible="false" />
                                        <asp:BoundField DataField="product_size" HeaderText="product_size" InsertVisible="False" ReadOnly="True" SortExpression="product_size" Visible="false" />
                                        <asp:BoundField DataField="product_cost" HeaderText="product_cost" InsertVisible="False" ReadOnly="True" SortExpression="product_cost" Visible="false" />
                                        <asp:BoundField DataField="Product_exp_date" HeaderText="Product_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_exp_date" Visible="false" />
                                        <asp:BoundField DataField="Product_Alergy_info" HeaderText="Product_Alergy_info" InsertVisible="False" ReadOnly="True" SortExpression="Product_Alergy_info" Visible="false" />
                                        <asp:BoundField DataField="Product_refrigde" HeaderText="Product_refrigde" InsertVisible="False" ReadOnly="True" SortExpression="Product_refrigde" Visible="false" />
                                        <asp:BoundField DataField="Product_Flammable" HeaderText="Product_Flammable" InsertVisible="False" ReadOnly="True" SortExpression="Product_Flammable" Visible="false" />
                                        <asp:BoundField DataField="Product_Hazard" HeaderText="Product_Hazard" InsertVisible="False" ReadOnly="True" SortExpression="Product_Hazard" Visible="false" />
                                        <asp:BoundField DataField="Product_Other" HeaderText="Product_Other" InsertVisible="False" ReadOnly="True" SortExpression="Product_Other" Visible="false" />
                                        <asp:BoundField DataField="Product_Min_Inv" HeaderText="Product_Min_Inv" InsertVisible="False" ReadOnly="True" SortExpression="Product_Min_Inv" Visible="false" />
                                        <asp:BoundField DataField="Product_Barcode" HeaderText="Product_Barcode" InsertVisible="False" ReadOnly="True" SortExpression="Product_Barcode" Visible="false" />
                                        <asp:BoundField DataField="Product_subtype" HeaderText="Product_subtype" InsertVisible="False" ReadOnly="True" SortExpression="Product_subtype" Visible="false" />
                                        <asp:BoundField DataField="Make" HeaderText="Make" InsertVisible="False" ReadOnly="True" SortExpression="Make" Visible="false" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" InsertVisible="False" ReadOnly="True" SortExpression="Model" Visible="false" />
                                        <asp:BoundField DataField="FEMA_Description" HeaderText="FEMA_Description" InsertVisible="False" ReadOnly="True" SortExpression="FEMA_Description" Visible="false" />
                                        <asp:BoundField DataField="Year" HeaderText="Year" InsertVisible="False" ReadOnly="True" SortExpression="Year" Visible="false" />
                                        <asp:BoundField DataField="RFID" HeaderText="RFID" InsertVisible="False" ReadOnly="True" SortExpression="RFID" Visible="false" />
                                        <asp:BoundField DataField="GPS" HeaderText="GPS" InsertVisible="False" ReadOnly="True" SortExpression="GPS" Visible="false" />
                                        <asp:BoundField DataField="Serial_Number" HeaderText="Serial_Number" InsertVisible="False" ReadOnly="True" SortExpression="Serial_Number" Visible="false" />
                                        <asp:BoundField DataField="Height" HeaderText="Height" InsertVisible="False" ReadOnly="True" SortExpression="Height" Visible="false" />
                                        <asp:BoundField DataField="Length" HeaderText="Length" InsertVisible="False" ReadOnly="True" SortExpression="Length" Visible="false" />
                                        <asp:BoundField DataField="Depth" HeaderText="Depth" InsertVisible="False" ReadOnly="True" SortExpression="Depth" Visible="false" />
                                        <asp:BoundField DataField="Weight" HeaderText="Weight" InsertVisible="False" ReadOnly="True" SortExpression="Weight" Visible="false" />
                                        <asp:BoundField DataField="OAI" HeaderText="OAI" InsertVisible="False" ReadOnly="True" SortExpression="OAI" Visible="false" />
                                        <asp:BoundField DataField="OAI_Type" HeaderText="OAI_Type" InsertVisible="False" ReadOnly="True" SortExpression="OAI_Type" Visible="false" />
                                        <asp:BoundField DataField="Use" HeaderText="Use" InsertVisible="False" ReadOnly="True" SortExpression="Use" Visible="false" />
                                        <asp:BoundField DataField="Brand" HeaderText="Brand" InsertVisible="False" ReadOnly="True" SortExpression="Brand" Visible="false" />
                                        <asp:BoundField DataField="Power_Supply" HeaderText="Power_Supply" InsertVisible="False" ReadOnly="True" SortExpression="Power_Supply" Visible="false" />
                                        <asp:BoundField DataField="Gas_Type" HeaderText="Gas_Type" InsertVisible="False" ReadOnly="True" SortExpression="Gas_Type" Visible="false" />
                                        <asp:BoundField DataField="Needs_Gas" HeaderText="Needs_Gas" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Gas" Visible="false" />
                                        <asp:BoundField DataField="Needs_Electricity" HeaderText="Needs_Electricity" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Electricity" Visible="false" />
                                        <asp:BoundField DataField="Availability" HeaderText="Availability" InsertVisible="False" ReadOnly="True" SortExpression="Availability" Visible="false" />
                                        <asp:BoundField DataField="Datetime" HeaderText="Datetime" InsertVisible="False" ReadOnly="True" SortExpression="Datetime" Visible="false" />
                                        <asp:BoundField DataField="OpenStatus" HeaderText="OpenStatus" InsertVisible="False" ReadOnly="True" SortExpression="OpenStatus" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="products_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_id_Update_TextBox" ID="product_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Resource_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_name_Update_TextBox" ID="product_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_type_Update_TextBox" ID="product_type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_qty</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_qty_Update_TextBox" ID="product_qty_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_qty_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_desc</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_desc_Update_TextBox" ID="product_desc_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_desc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_color</span>
                                <asp:TextBox class="pull-right form-control" ID="product_color_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_size</span>
                                <asp:TextBox class="pull-right form-control" ID="product_size_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_cost</span>
                                <asp:TextBox class="pull-right form-control" ID="product_cost_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_exp_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Product_exp_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Alergy_info</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Alergy_info_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_refrigde</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_refrigde_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Flammable</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Flammable_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Hazard</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Hazard_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Other</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Other_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Min_Inv</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Min_Inv_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Barcode</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_Barcode_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_subtype</span>
                                <asp:TextBox class="pull-right form-control" ID="Product_subtype_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Make</span>
                                <asp:TextBox class="pull-right form-control" ID="Make_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Model</span>
                                <asp:TextBox class="pull-right form-control" ID="Model_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FEMA_Description</span>
                                <asp:TextBox class="pull-right form-control" ID="FEMA_Description_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Year</span>
                                <asp:TextBox class="pull-right form-control" ID="Year_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">RFID</span>
                                <asp:TextBox class="pull-right form-control" ID="RFID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">GPS</span>
                                <asp:TextBox class="pull-right form-control" ID="GPS_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Serial_Number</span>
                                <asp:TextBox class="pull-right form-control" ID="Serial_Number_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Height</span>
                                <asp:TextBox class="pull-right form-control" ID="Height_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Length</span>
                                <asp:TextBox class="pull-right form-control" ID="Length_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Depth</span>
                                <asp:TextBox class="pull-right form-control" ID="Depth_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Weight</span>
                                <asp:TextBox class="pull-right form-control" ID="Weight_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OAI</span>
                                <asp:TextBox class="pull-right form-control" ID="OAI_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OAI_Type</span>
                                <asp:TextBox class="pull-right form-control" ID="OAI_Type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Use</span>
                                <asp:TextBox class="pull-right form-control" ID="Use_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Brand</span>
                                <asp:TextBox class="pull-right form-control" ID="Brand_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Power_Supply</span>
                                <asp:TextBox class="pull-right form-control" ID="Power_Supply_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Gas_Type</span>
                                <asp:TextBox class="pull-right form-control" ID="Gas_Type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Needs_Gas</span>
                                <asp:TextBox class="pull-right form-control" ID="Needs_Gas_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Needs_Electricity</span>
                                <asp:TextBox class="pull-right form-control" ID="Needs_Electricity_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Availability</span>
                                <asp:TextBox class="pull-right form-control" ID="Availability_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Datetime</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Datetime_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OpenStatus</span>
                                <asp:TextBox class="pull-right form-control" ID="OpenStatus_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="product_id"
                                    DataSourceID="products_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="product_name" HeaderText="product_name" InsertVisible="False" ReadOnly="True" SortExpression="product_name" />
                                        <asp:BoundField DataField="product_type" HeaderText="product_type" InsertVisible="False" ReadOnly="True" SortExpression="product_type" Visible="false" />
                                        <asp:BoundField DataField="product_qty" HeaderText="product_qty" InsertVisible="False" ReadOnly="True" SortExpression="product_qty" Visible="false" />
                                        <asp:BoundField DataField="product_desc" HeaderText="product_desc" InsertVisible="False" ReadOnly="True" SortExpression="product_desc" Visible="false" />
                                        <asp:BoundField DataField="product_color" HeaderText="product_color" InsertVisible="False" ReadOnly="True" SortExpression="product_color" Visible="false" />
                                        <asp:BoundField DataField="product_size" HeaderText="product_size" InsertVisible="False" ReadOnly="True" SortExpression="product_size" Visible="false" />
                                        <asp:BoundField DataField="product_cost" HeaderText="product_cost" InsertVisible="False" ReadOnly="True" SortExpression="product_cost" Visible="false" />
                                        <asp:BoundField DataField="Product_exp_date" HeaderText="Product_exp_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_exp_date" Visible="false" />
                                        <asp:BoundField DataField="Product_Alergy_info" HeaderText="Product_Alergy_info" InsertVisible="False" ReadOnly="True" SortExpression="Product_Alergy_info" Visible="false" />
                                        <asp:BoundField DataField="Product_refrigde" HeaderText="Product_refrigde" InsertVisible="False" ReadOnly="True" SortExpression="Product_refrigde" Visible="false" />
                                        <asp:BoundField DataField="Product_Flammable" HeaderText="Product_Flammable" InsertVisible="False" ReadOnly="True" SortExpression="Product_Flammable" Visible="false" />
                                        <asp:BoundField DataField="Product_Hazard" HeaderText="Product_Hazard" InsertVisible="False" ReadOnly="True" SortExpression="Product_Hazard" Visible="false" />
                                        <asp:BoundField DataField="Product_Other" HeaderText="Product_Other" InsertVisible="False" ReadOnly="True" SortExpression="Product_Other" Visible="false" />
                                        <asp:BoundField DataField="Product_Min_Inv" HeaderText="Product_Min_Inv" InsertVisible="False" ReadOnly="True" SortExpression="Product_Min_Inv" Visible="false" />
                                        <asp:BoundField DataField="Product_Barcode" HeaderText="Product_Barcode" InsertVisible="False" ReadOnly="True" SortExpression="Product_Barcode" Visible="false" />
                                        <asp:BoundField DataField="Product_subtype" HeaderText="Product_subtype" InsertVisible="False" ReadOnly="True" SortExpression="Product_subtype" Visible="false" />
                                        <asp:BoundField DataField="Make" HeaderText="Make" InsertVisible="False" ReadOnly="True" SortExpression="Make" Visible="false" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" InsertVisible="False" ReadOnly="True" SortExpression="Model" Visible="false" />
                                        <asp:BoundField DataField="FEMA_Description" HeaderText="FEMA_Description" InsertVisible="False" ReadOnly="True" SortExpression="FEMA_Description" Visible="false" />
                                        <asp:BoundField DataField="Year" HeaderText="Year" InsertVisible="False" ReadOnly="True" SortExpression="Year" Visible="false" />
                                        <asp:BoundField DataField="RFID" HeaderText="RFID" InsertVisible="False" ReadOnly="True" SortExpression="RFID" Visible="false" />
                                        <asp:BoundField DataField="GPS" HeaderText="GPS" InsertVisible="False" ReadOnly="True" SortExpression="GPS" Visible="false" />
                                        <asp:BoundField DataField="Serial_Number" HeaderText="Serial_Number" InsertVisible="False" ReadOnly="True" SortExpression="Serial_Number" Visible="false" />
                                        <asp:BoundField DataField="Height" HeaderText="Height" InsertVisible="False" ReadOnly="True" SortExpression="Height" Visible="false" />
                                        <asp:BoundField DataField="Length" HeaderText="Length" InsertVisible="False" ReadOnly="True" SortExpression="Length" Visible="false" />
                                        <asp:BoundField DataField="Depth" HeaderText="Depth" InsertVisible="False" ReadOnly="True" SortExpression="Depth" Visible="false" />
                                        <asp:BoundField DataField="Weight" HeaderText="Weight" InsertVisible="False" ReadOnly="True" SortExpression="Weight" Visible="false" />
                                        <asp:BoundField DataField="OAI" HeaderText="OAI" InsertVisible="False" ReadOnly="True" SortExpression="OAI" Visible="false" />
                                        <asp:BoundField DataField="OAI_Type" HeaderText="OAI_Type" InsertVisible="False" ReadOnly="True" SortExpression="OAI_Type" Visible="false" />
                                        <asp:BoundField DataField="Use" HeaderText="Use" InsertVisible="False" ReadOnly="True" SortExpression="Use" Visible="false" />
                                        <asp:BoundField DataField="Brand" HeaderText="Brand" InsertVisible="False" ReadOnly="True" SortExpression="Brand" Visible="false" />
                                        <asp:BoundField DataField="Power_Supply" HeaderText="Power_Supply" InsertVisible="False" ReadOnly="True" SortExpression="Power_Supply" Visible="false" />
                                        <asp:BoundField DataField="Gas_Type" HeaderText="Gas_Type" InsertVisible="False" ReadOnly="True" SortExpression="Gas_Type" Visible="false" />
                                        <asp:BoundField DataField="Needs_Gas" HeaderText="Needs_Gas" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Gas" Visible="false" />
                                        <asp:BoundField DataField="Needs_Electricity" HeaderText="Needs_Electricity" InsertVisible="False" ReadOnly="True" SortExpression="Needs_Electricity" Visible="false" />
                                        <asp:BoundField DataField="Availability" HeaderText="Availability" InsertVisible="False" ReadOnly="True" SortExpression="Availability" Visible="false" />
                                        <asp:BoundField DataField="Datetime" HeaderText="Datetime" InsertVisible="False" ReadOnly="True" SortExpression="Datetime" Visible="false" />
                                        <asp:BoundField DataField="OpenStatus" HeaderText="OpenStatus" InsertVisible="False" ReadOnly="True" SortExpression="OpenStatus" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="products_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Resource_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_qty</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_qty_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_desc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_desc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_color</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_color_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_size</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_size_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_cost</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_cost_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_exp_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Product_exp_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Alergy_info</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_Alergy_info_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_refrigde</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_refrigde_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Flammable</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_Flammable_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Hazard</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_Hazard_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Other</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_Other_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Min_Inv</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_Min_Inv_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_Barcode</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_Barcode_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_subtype</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_subtype_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Make</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Make_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Model</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Model_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">FEMA_Description</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="FEMA_Description_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Year</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Year_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">RFID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="RFID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">GPS</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="GPS_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Serial_Number</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Serial_Number_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Height</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Height_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Length</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Length_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Depth</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Depth_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Weight</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Weight_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OAI</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OAI_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OAI_Type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OAI_Type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Use</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Use_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Brand</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Brand_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Power_Supply</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Power_Supply_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Gas_Type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Gas_Type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Needs_Gas</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Needs_Gas_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Needs_Electricity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Needs_Electricity_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Availability</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Availability_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Datetime</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Datetime_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">OpenStatus</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="OpenStatus_Delete_TextBox" runat="server"></asp:TextBox>
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

