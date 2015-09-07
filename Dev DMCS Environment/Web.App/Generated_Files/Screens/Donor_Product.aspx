<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Donor_Product.aspx.cs" Inherits="Web.App.Donor_ProductClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Donor_ProductCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Donor_Product CRUD Operations:</span></h1>
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
                                    DataKeyNames="DonorProductID"
                                    DataSourceID="Donor_Product_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="DonorProductID" HeaderText="DonorProductID" InsertVisible="False" ReadOnly="True" SortExpression="DonorProductID" />
                                        <asp:BoundField DataField="DonorID" HeaderText="DonorID" InsertVisible="False" ReadOnly="True" SortExpression="DonorID" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="other_info" HeaderText="other_info" InsertVisible="False" ReadOnly="True" SortExpression="other_info" Visible="false" />
                                        <asp:BoundField DataField="Product_rec_date" HeaderText="Product_rec_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_rec_date" Visible="false" />
                                        <asp:BoundField DataField="AmountOfProdDonated" HeaderText="AmountOfProdDonated" InsertVisible="False" ReadOnly="True" SortExpression="AmountOfProdDonated" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Donor_Product_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Donor_Product]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="DonorID_Insert_TextBox" ID="DonorID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="DonorID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ProductID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ProductID_Insert_TextBox" ID="ProductID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ProductID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="quantity_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_info</span>
                                <asp:TextBox class="pull-right form-control" ID="other_info_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_rec_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Product_rec_date_Insert_TextBox" ID="Product_rec_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Product_rec_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AmountOfProdDonated</span>
                                <asp:TextBox class="pull-right form-control" ID="AmountOfProdDonated_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="DonorProductID"
                                    DataSourceID="Donor_Product_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="DonorProductID" HeaderText="DonorProductID" InsertVisible="False" ReadOnly="True" SortExpression="DonorProductID" />
                                        <asp:BoundField DataField="DonorID" HeaderText="DonorID" InsertVisible="False" ReadOnly="True" SortExpression="DonorID" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="other_info" HeaderText="other_info" InsertVisible="False" ReadOnly="True" SortExpression="other_info" Visible="false" />
                                        <asp:BoundField DataField="Product_rec_date" HeaderText="Product_rec_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_rec_date" Visible="false" />
                                        <asp:BoundField DataField="AmountOfProdDonated" HeaderText="AmountOfProdDonated" InsertVisible="False" ReadOnly="True" SortExpression="AmountOfProdDonated" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Donor_Product_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Donor_Product]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorProductID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="DonorProductID_Update_TextBox" ID="DonorProductID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="DonorProductID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="DonorID_Update_TextBox" ID="DonorID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="DonorID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ProductID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ProductID_Update_TextBox" ID="ProductID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ProductID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="quantity_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_info</span>
                                <asp:TextBox class="pull-right form-control" ID="other_info_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_rec_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Product_rec_date_Update_TextBox" ID="Product_rec_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Product_rec_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AmountOfProdDonated</span>
                                <asp:TextBox class="pull-right form-control" ID="AmountOfProdDonated_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="DonorProductID"
                                    DataSourceID="Donor_Product_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="DonorProductID" HeaderText="DonorProductID" InsertVisible="False" ReadOnly="True" SortExpression="DonorProductID" />
                                        <asp:BoundField DataField="DonorID" HeaderText="DonorID" InsertVisible="False" ReadOnly="True" SortExpression="DonorID" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="other_info" HeaderText="other_info" InsertVisible="False" ReadOnly="True" SortExpression="other_info" Visible="false" />
                                        <asp:BoundField DataField="Product_rec_date" HeaderText="Product_rec_date" InsertVisible="False" ReadOnly="True" SortExpression="Product_rec_date" Visible="false" />
                                        <asp:BoundField DataField="AmountOfProdDonated" HeaderText="AmountOfProdDonated" InsertVisible="False" ReadOnly="True" SortExpression="AmountOfProdDonated" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Donor_Product_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Donor_Product]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorProductID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="DonorProductID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="DonorID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ProductID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ProductID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="quantity_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_info</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="other_info_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Product_rec_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Product_rec_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AmountOfProdDonated</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="AmountOfProdDonated_Delete_TextBox" runat="server"></asp:TextBox>
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

