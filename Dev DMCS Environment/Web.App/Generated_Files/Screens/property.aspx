<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="property.aspx.cs" Inherits="Web.App.propertyClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="propertyCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>property CRUD Operations:</span></h1>
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
                                    DataKeyNames="property_id"
                                    DataSourceID="property_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="property_id" HeaderText="property_id" InsertVisible="False" ReadOnly="True" SortExpression="property_id" />
                                        <asp:BoundField DataField="approx_mrkt_value" HeaderText="approx_mrkt_value" InsertVisible="False" ReadOnly="True" SortExpression="approx_mrkt_value" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="Homeowners_Insurance_Payment" HeaderText="Homeowners_Insurance_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Homeowners_Insurance_Payment" Visible="false" />
                                        <asp:BoundField DataField="monthly_property_payment" HeaderText="monthly_property_payment" InsertVisible="False" ReadOnly="True" SortExpression="monthly_property_payment" Visible="false" />
                                        <asp:BoundField DataField="mortg_comp" HeaderText="mortg_comp" InsertVisible="False" ReadOnly="True" SortExpression="mortg_comp" Visible="false" />
                                        <asp:BoundField DataField="Property_Tax_Payment" HeaderText="Property_Tax_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Property_Tax_Payment" Visible="false" />
                                        <asp:BoundField DataField="own_prop" HeaderText="own_prop" InsertVisible="False" ReadOnly="True" SortExpression="own_prop" Visible="false" />
                                        <asp:BoundField DataField="rent_prop" HeaderText="rent_prop" InsertVisible="False" ReadOnly="True" SortExpression="rent_prop" Visible="false" />
                                        <asp:BoundField DataField="date_purchased" HeaderText="date_purchased" InsertVisible="False" ReadOnly="True" SortExpression="date_purchased" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="property_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [property]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">approx_mrkt_value</span>
                                <asp:TextBox class="pull-right form-control" ID="approx_mrkt_value_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Insert_TextBox" ID="address_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="case_id_Insert_TextBox" ID="case_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_id_Insert_TextBox" ID="client_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Homeowners_Insurance_Payment</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Homeowners_Insurance_Payment_Insert_TextBox" ID="Homeowners_Insurance_Payment_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Homeowners_Insurance_Payment_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">monthly_property_payment</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="monthly_property_payment_Insert_TextBox" ID="monthly_property_payment_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="monthly_property_payment_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mortg_comp</span>
                                <asp:TextBox class="pull-right form-control" ID="mortg_comp_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Property_Tax_Payment</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Property_Tax_Payment_Insert_TextBox" ID="Property_Tax_Payment_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Property_Tax_Payment_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">own_prop</span>
                                <asp:TextBox class="pull-right form-control" ID="own_prop_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rent_prop</span>
                                <asp:TextBox class="pull-right form-control" ID="rent_prop_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_purchased</span>
                                <asp:TextBox class="pull-right form-control" ID="date_purchased_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="property_id"
                                    DataSourceID="property_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="property_id" HeaderText="property_id" InsertVisible="False" ReadOnly="True" SortExpression="property_id" />
                                        <asp:BoundField DataField="approx_mrkt_value" HeaderText="approx_mrkt_value" InsertVisible="False" ReadOnly="True" SortExpression="approx_mrkt_value" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="Homeowners_Insurance_Payment" HeaderText="Homeowners_Insurance_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Homeowners_Insurance_Payment" Visible="false" />
                                        <asp:BoundField DataField="monthly_property_payment" HeaderText="monthly_property_payment" InsertVisible="False" ReadOnly="True" SortExpression="monthly_property_payment" Visible="false" />
                                        <asp:BoundField DataField="mortg_comp" HeaderText="mortg_comp" InsertVisible="False" ReadOnly="True" SortExpression="mortg_comp" Visible="false" />
                                        <asp:BoundField DataField="Property_Tax_Payment" HeaderText="Property_Tax_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Property_Tax_Payment" Visible="false" />
                                        <asp:BoundField DataField="own_prop" HeaderText="own_prop" InsertVisible="False" ReadOnly="True" SortExpression="own_prop" Visible="false" />
                                        <asp:BoundField DataField="rent_prop" HeaderText="rent_prop" InsertVisible="False" ReadOnly="True" SortExpression="rent_prop" Visible="false" />
                                        <asp:BoundField DataField="date_purchased" HeaderText="date_purchased" InsertVisible="False" ReadOnly="True" SortExpression="date_purchased" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="property_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [property]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">property_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="property_id_Update_TextBox" ID="property_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="property_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">approx_mrkt_value</span>
                                <asp:TextBox class="pull-right form-control" ID="approx_mrkt_value_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Update_TextBox" ID="address_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="case_id_Update_TextBox" ID="case_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="case_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_id_Update_TextBox" ID="client_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Homeowners_Insurance_Payment</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Homeowners_Insurance_Payment_Update_TextBox" ID="Homeowners_Insurance_Payment_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Homeowners_Insurance_Payment_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">monthly_property_payment</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="monthly_property_payment_Update_TextBox" ID="monthly_property_payment_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="monthly_property_payment_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mortg_comp</span>
                                <asp:TextBox class="pull-right form-control" ID="mortg_comp_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Property_Tax_Payment</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Property_Tax_Payment_Update_TextBox" ID="Property_Tax_Payment_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Property_Tax_Payment_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">own_prop</span>
                                <asp:TextBox class="pull-right form-control" ID="own_prop_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rent_prop</span>
                                <asp:TextBox class="pull-right form-control" ID="rent_prop_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_purchased</span>
                                <asp:TextBox class="pull-right form-control" ID="date_purchased_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="property_id"
                                    DataSourceID="property_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="property_id" HeaderText="property_id" InsertVisible="False" ReadOnly="True" SortExpression="property_id" />
                                        <asp:BoundField DataField="approx_mrkt_value" HeaderText="approx_mrkt_value" InsertVisible="False" ReadOnly="True" SortExpression="approx_mrkt_value" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" Visible="false" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                                        <asp:BoundField DataField="Homeowners_Insurance_Payment" HeaderText="Homeowners_Insurance_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Homeowners_Insurance_Payment" Visible="false" />
                                        <asp:BoundField DataField="monthly_property_payment" HeaderText="monthly_property_payment" InsertVisible="False" ReadOnly="True" SortExpression="monthly_property_payment" Visible="false" />
                                        <asp:BoundField DataField="mortg_comp" HeaderText="mortg_comp" InsertVisible="False" ReadOnly="True" SortExpression="mortg_comp" Visible="false" />
                                        <asp:BoundField DataField="Property_Tax_Payment" HeaderText="Property_Tax_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Property_Tax_Payment" Visible="false" />
                                        <asp:BoundField DataField="own_prop" HeaderText="own_prop" InsertVisible="False" ReadOnly="True" SortExpression="own_prop" Visible="false" />
                                        <asp:BoundField DataField="rent_prop" HeaderText="rent_prop" InsertVisible="False" ReadOnly="True" SortExpression="rent_prop" Visible="false" />
                                        <asp:BoundField DataField="date_purchased" HeaderText="date_purchased" InsertVisible="False" ReadOnly="True" SortExpression="date_purchased" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="property_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [property]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">property_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="property_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">approx_mrkt_value</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="approx_mrkt_value_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">case_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="case_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Homeowners_Insurance_Payment</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Homeowners_Insurance_Payment_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">monthly_property_payment</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="monthly_property_payment_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">mortg_comp</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="mortg_comp_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Property_Tax_Payment</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Property_Tax_Payment_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">own_prop</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="own_prop_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">rent_prop</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="rent_prop_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_purchased</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="date_purchased_Delete_TextBox" runat="server"></asp:TextBox>
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

