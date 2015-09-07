<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Mobile_Product.aspx.cs" Inherits="Web.App.Mobile_ProductClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Mobile_ProductCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Mobile_Product CRUD Operations:</span></h1>
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
                                    DataKeyNames="Mobile_Product_id"
                                    DataSourceID="Mobile_Product_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Mobile_Product_id" HeaderText="Mobile_Product_id" InsertVisible="False" ReadOnly="True" SortExpression="Mobile_Product_id" />
                                        <asp:BoundField DataField="Mobile_Unit_id" HeaderText="Mobile_Unit_id" InsertVisible="False" ReadOnly="True" SortExpression="Mobile_Unit_id" />
                                        <asp:BoundField DataField="Product_id" HeaderText="Product_id" InsertVisible="False" ReadOnly="True" SortExpression="Product_id" />
                                        <asp:BoundField DataField="Case_id" HeaderText="Case_id" InsertVisible="False" ReadOnly="True" SortExpression="Case_id" Visible="false" />
                                        <asp:BoundField DataField="Lot_id" HeaderText="Lot_id" InsertVisible="False" ReadOnly="True" SortExpression="Lot_id" Visible="false" />
                                        <asp:BoundField DataField="Min_inv" HeaderText="Min_inv" InsertVisible="False" ReadOnly="True" SortExpression="Min_inv" Visible="false" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" InsertVisible="False" ReadOnly="True" SortExpression="Quantity" Visible="false" />
                                        <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Mobile_Product_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Mobile_Product]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Mobile_Unit_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Mobile_Unit_id_Insert_TextBox" ID="Mobile_Unit_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Mobile_Unit_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Product_id_Insert_TextBox" ID="Product_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Product_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Case_id</span>
                                <asp:TextBox class="pull-right form-control" ID="Case_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Lot_id</span>
                                <asp:TextBox class="pull-right form-control" ID="Lot_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Min_inv</span>
                                <asp:TextBox class="pull-right form-control" ID="Min_inv_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="Quantity_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Experiation_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Experiation_Date_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Mobile_Product_id"
                                    DataSourceID="Mobile_Product_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Mobile_Product_id" HeaderText="Mobile_Product_id" InsertVisible="False" ReadOnly="True" SortExpression="Mobile_Product_id" />
                                        <asp:BoundField DataField="Mobile_Unit_id" HeaderText="Mobile_Unit_id" InsertVisible="False" ReadOnly="True" SortExpression="Mobile_Unit_id" />
                                        <asp:BoundField DataField="Product_id" HeaderText="Product_id" InsertVisible="False" ReadOnly="True" SortExpression="Product_id" />
                                        <asp:BoundField DataField="Case_id" HeaderText="Case_id" InsertVisible="False" ReadOnly="True" SortExpression="Case_id" Visible="false" />
                                        <asp:BoundField DataField="Lot_id" HeaderText="Lot_id" InsertVisible="False" ReadOnly="True" SortExpression="Lot_id" Visible="false" />
                                        <asp:BoundField DataField="Min_inv" HeaderText="Min_inv" InsertVisible="False" ReadOnly="True" SortExpression="Min_inv" Visible="false" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" InsertVisible="False" ReadOnly="True" SortExpression="Quantity" Visible="false" />
                                        <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Mobile_Product_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Mobile_Product]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Mobile_Product_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Mobile_Product_id_Update_TextBox" ID="Mobile_Product_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Mobile_Product_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Mobile_Unit_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Mobile_Unit_id_Update_TextBox" ID="Mobile_Unit_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Mobile_Unit_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Product_id_Update_TextBox" ID="Product_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Product_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Case_id</span>
                                <asp:TextBox class="pull-right form-control" ID="Case_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Lot_id</span>
                                <asp:TextBox class="pull-right form-control" ID="Lot_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Min_inv</span>
                                <asp:TextBox class="pull-right form-control" ID="Min_inv_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="Quantity_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Experiation_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Experiation_Date_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Mobile_Product_id"
                                    DataSourceID="Mobile_Product_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Mobile_Product_id" HeaderText="Mobile_Product_id" InsertVisible="False" ReadOnly="True" SortExpression="Mobile_Product_id" />
                                        <asp:BoundField DataField="Mobile_Unit_id" HeaderText="Mobile_Unit_id" InsertVisible="False" ReadOnly="True" SortExpression="Mobile_Unit_id" />
                                        <asp:BoundField DataField="Product_id" HeaderText="Product_id" InsertVisible="False" ReadOnly="True" SortExpression="Product_id" />
                                        <asp:BoundField DataField="Case_id" HeaderText="Case_id" InsertVisible="False" ReadOnly="True" SortExpression="Case_id" Visible="false" />
                                        <asp:BoundField DataField="Lot_id" HeaderText="Lot_id" InsertVisible="False" ReadOnly="True" SortExpression="Lot_id" Visible="false" />
                                        <asp:BoundField DataField="Min_inv" HeaderText="Min_inv" InsertVisible="False" ReadOnly="True" SortExpression="Min_inv" Visible="false" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" InsertVisible="False" ReadOnly="True" SortExpression="Quantity" Visible="false" />
                                        <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Mobile_Product_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Mobile_Product]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Mobile_Product_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Mobile_Product_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Mobile_Unit_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Mobile_Unit_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Product_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Case_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Case_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Lot_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Lot_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Min_inv</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Min_inv_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Quantity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Quantity_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Experiation_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Experiation_Date_Delete_TextBox" runat="server"></asp:TextBox>
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

