<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="warehouse_product_Location.aspx.cs" Inherits="Web.App.warehouse_product_LocationClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="warehouse_product_LocationCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>warehouse_product_Location CRUD Operations:</span></h1>
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
                                    DataKeyNames="warehouse_product_location_id"
                                    DataSourceID="warehouse_product_Location_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="warehouse_product_location_id" HeaderText="warehouse_product_location_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_product_location_id" />
                                        <asp:BoundField DataField="warehouse_id" HeaderText="warehouse_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_id" />
                                        <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                                        <asp:BoundField DataField="Time_Date_MIA" HeaderText="Time_Date_MIA" InsertVisible="False" ReadOnly="True" SortExpression="Time_Date_MIA" Visible="false" />
                                        <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                                        <asp:BoundField DataField="min_inv" HeaderText="min_inv" InsertVisible="False" ReadOnly="True" SortExpression="min_inv" Visible="false" />
                                        <asp:BoundField DataField="status" HeaderText="status" InsertVisible="False" ReadOnly="True" SortExpression="status" Visible="false" />
                                        <asp:BoundField DataField="Exp_delivery_date" HeaderText="Exp_delivery_date" InsertVisible="False" ReadOnly="True" SortExpression="Exp_delivery_date" Visible="false" />
                                        <asp:BoundField DataField="qty_onhand" HeaderText="qty_onhand" InsertVisible="False" ReadOnly="True" SortExpression="qty_onhand" Visible="false" />
                                        <asp:BoundField DataField="qty_commit" HeaderText="qty_commit" InsertVisible="False" ReadOnly="True" SortExpression="qty_commit" Visible="false" />
                                        <asp:BoundField DataField="qty_order" HeaderText="qty_order" InsertVisible="False" ReadOnly="True" SortExpression="qty_order" Visible="false" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" Visible="false" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="warehouse_product_Location_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [warehouse_product_Location]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">warehouse_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="warehouse_id_Insert_TextBox" ID="warehouse_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="warehouse_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_id_Insert_TextBox" ID="product_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                                <asp:TextBox class="pull-right form-control" ID="service_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Time_Date_MIA</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Time_Date_MIA_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Experiation_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Experiation_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">min_inv</span>
                                <asp:TextBox class="pull-right form-control" ID="min_inv_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="status_Insert_TextBox" ID="status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Exp_delivery_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Exp_delivery_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_onhand</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qty_onhand_Insert_TextBox" ID="qty_onhand_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qty_onhand_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_commit</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qty_commit_Insert_TextBox" ID="qty_commit_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qty_commit_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_order</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qty_order_Insert_TextBox" ID="qty_order_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qty_order_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox class="pull-right form-control" ID="encounter_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="warehouse_product_location_id"
                                    DataSourceID="warehouse_product_Location_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="warehouse_product_location_id" HeaderText="warehouse_product_location_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_product_location_id" />
                                        <asp:BoundField DataField="warehouse_id" HeaderText="warehouse_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_id" />
                                        <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                                        <asp:BoundField DataField="Time_Date_MIA" HeaderText="Time_Date_MIA" InsertVisible="False" ReadOnly="True" SortExpression="Time_Date_MIA" Visible="false" />
                                        <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                                        <asp:BoundField DataField="min_inv" HeaderText="min_inv" InsertVisible="False" ReadOnly="True" SortExpression="min_inv" Visible="false" />
                                        <asp:BoundField DataField="status" HeaderText="status" InsertVisible="False" ReadOnly="True" SortExpression="status" Visible="false" />
                                        <asp:BoundField DataField="Exp_delivery_date" HeaderText="Exp_delivery_date" InsertVisible="False" ReadOnly="True" SortExpression="Exp_delivery_date" Visible="false" />
                                        <asp:BoundField DataField="qty_onhand" HeaderText="qty_onhand" InsertVisible="False" ReadOnly="True" SortExpression="qty_onhand" Visible="false" />
                                        <asp:BoundField DataField="qty_commit" HeaderText="qty_commit" InsertVisible="False" ReadOnly="True" SortExpression="qty_commit" Visible="false" />
                                        <asp:BoundField DataField="qty_order" HeaderText="qty_order" InsertVisible="False" ReadOnly="True" SortExpression="qty_order" Visible="false" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" Visible="false" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="warehouse_product_Location_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [warehouse_product_Location]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">warehouse_product_location_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="warehouse_product_location_id_Update_TextBox" ID="warehouse_product_location_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="warehouse_product_location_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">warehouse_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="warehouse_id_Update_TextBox" ID="warehouse_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="warehouse_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="product_id_Update_TextBox" ID="product_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="product_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                                <asp:TextBox class="pull-right form-control" ID="service_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Time_Date_MIA</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Time_Date_MIA_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Experiation_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Experiation_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">min_inv</span>
                                <asp:TextBox class="pull-right form-control" ID="min_inv_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="status_Update_TextBox" ID="status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Exp_delivery_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Exp_delivery_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_onhand</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qty_onhand_Update_TextBox" ID="qty_onhand_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qty_onhand_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_commit</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qty_commit_Update_TextBox" ID="qty_commit_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qty_commit_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_order</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qty_order_Update_TextBox" ID="qty_order_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qty_order_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox class="pull-right form-control" ID="encounter_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="warehouse_product_location_id"
                                    DataSourceID="warehouse_product_Location_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="warehouse_product_location_id" HeaderText="warehouse_product_location_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_product_location_id" />
                                        <asp:BoundField DataField="warehouse_id" HeaderText="warehouse_id" InsertVisible="False" ReadOnly="True" SortExpression="warehouse_id" />
                                        <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" Visible="false" />
                                        <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" Visible="false" />
                                        <asp:BoundField DataField="Time_Date_MIA" HeaderText="Time_Date_MIA" InsertVisible="False" ReadOnly="True" SortExpression="Time_Date_MIA" Visible="false" />
                                        <asp:BoundField DataField="Experiation_Date" HeaderText="Experiation_Date" InsertVisible="False" ReadOnly="True" SortExpression="Experiation_Date" Visible="false" />
                                        <asp:BoundField DataField="min_inv" HeaderText="min_inv" InsertVisible="False" ReadOnly="True" SortExpression="min_inv" Visible="false" />
                                        <asp:BoundField DataField="status" HeaderText="status" InsertVisible="False" ReadOnly="True" SortExpression="status" Visible="false" />
                                        <asp:BoundField DataField="Exp_delivery_date" HeaderText="Exp_delivery_date" InsertVisible="False" ReadOnly="True" SortExpression="Exp_delivery_date" Visible="false" />
                                        <asp:BoundField DataField="qty_onhand" HeaderText="qty_onhand" InsertVisible="False" ReadOnly="True" SortExpression="qty_onhand" Visible="false" />
                                        <asp:BoundField DataField="qty_commit" HeaderText="qty_commit" InsertVisible="False" ReadOnly="True" SortExpression="qty_commit" Visible="false" />
                                        <asp:BoundField DataField="qty_order" HeaderText="qty_order" InsertVisible="False" ReadOnly="True" SortExpression="qty_order" Visible="false" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" Visible="false" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="warehouse_product_Location_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [warehouse_product_Location]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">warehouse_product_location_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="warehouse_product_location_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">warehouse_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="warehouse_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">product_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="product_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Location_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">service_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="service_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Time_Date_MIA</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Time_Date_MIA_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Experiation_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Experiation_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">min_inv</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="min_inv_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Exp_delivery_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Exp_delivery_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_onhand</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="qty_onhand_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_commit</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="qty_commit_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qty_order</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="qty_order_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="encounter_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
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

