<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="address.aspx.cs" Inherits="Web.App.addressClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="addressCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>address CRUD Operations:</span></h1>
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
                                    DataKeyNames="address_id"
                                    DataSourceID="address_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" InsertVisible="False" ReadOnly="True" SortExpression="address_type_id" />
                                        <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                                        <asp:BoundField DataField="country" HeaderText="country" InsertVisible="False" ReadOnly="True" SortExpression="country" Visible="false" />
                                        <asp:BoundField DataField="County_Township" HeaderText="County_Township" InsertVisible="False" ReadOnly="True" SortExpression="County_Township" Visible="false" />
                                        <asp:BoundField DataField="longitude" HeaderText="longitude" InsertVisible="False" ReadOnly="True" SortExpression="longitude" Visible="false" />
                                        <asp:BoundField DataField="latitude" HeaderText="latitude" InsertVisible="False" ReadOnly="True" SortExpression="latitude" Visible="false" />
                                        <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                                        <asp:BoundField DataField="str_add" HeaderText="str_add" InsertVisible="False" ReadOnly="True" SortExpression="str_add" Visible="false" />
                                        <asp:BoundField DataField="str_add2" HeaderText="str_add2" InsertVisible="False" ReadOnly="True" SortExpression="str_add2" Visible="false" />
                                        <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" InsertVisible="False" ReadOnly="True" SortExpression="zip_plus_four" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="address_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [address]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_type_id</span>
                                <asp:TextBox class="pull-right form-control" ID="address_type_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                                <asp:TextBox class="pull-right form-control" ID="city_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">country</span>
                                <asp:TextBox class="pull-right form-control" ID="country_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">County_Township</span>
                                <asp:TextBox class="pull-right form-control" ID="County_Township_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="longitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="latitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">state</span>
                                <asp:TextBox class="pull-right form-control" ID="state_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add</span>
                                <asp:TextBox class="pull-right form-control" ID="str_add_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add2</span>
                                <asp:TextBox class="pull-right form-control" ID="str_add2_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">zip_plus_four</span>
                                <asp:TextBox class="pull-right form-control" ID="zip_plus_four_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="address_id"
                                    DataSourceID="address_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" InsertVisible="False" ReadOnly="True" SortExpression="address_type_id" />
                                        <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                                        <asp:BoundField DataField="country" HeaderText="country" InsertVisible="False" ReadOnly="True" SortExpression="country" Visible="false" />
                                        <asp:BoundField DataField="County_Township" HeaderText="County_Township" InsertVisible="False" ReadOnly="True" SortExpression="County_Township" Visible="false" />
                                        <asp:BoundField DataField="longitude" HeaderText="longitude" InsertVisible="False" ReadOnly="True" SortExpression="longitude" Visible="false" />
                                        <asp:BoundField DataField="latitude" HeaderText="latitude" InsertVisible="False" ReadOnly="True" SortExpression="latitude" Visible="false" />
                                        <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                                        <asp:BoundField DataField="str_add" HeaderText="str_add" InsertVisible="False" ReadOnly="True" SortExpression="str_add" Visible="false" />
                                        <asp:BoundField DataField="str_add2" HeaderText="str_add2" InsertVisible="False" ReadOnly="True" SortExpression="str_add2" Visible="false" />
                                        <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" InsertVisible="False" ReadOnly="True" SortExpression="zip_plus_four" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="address_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [address]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control form-control-disabled" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_type_id</span>
                                <asp:TextBox class="pull-right form-control" ID="address_type_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                                <asp:TextBox class="pull-right form-control" ID="city_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">country</span>
                                <asp:TextBox class="pull-right form-control" ID="country_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">County_Township</span>
                                <asp:TextBox class="pull-right form-control" ID="County_Township_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="longitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="latitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">state</span>
                                <asp:TextBox class="pull-right form-control" ID="state_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add</span>
                                <asp:TextBox class="pull-right form-control" ID="str_add_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add2</span>
                                <asp:TextBox class="pull-right form-control" ID="str_add2_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">zip_plus_four</span>
                                <asp:TextBox class="pull-right form-control" ID="zip_plus_four_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="address_id"
                                    DataSourceID="address_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" InsertVisible="False" ReadOnly="True" SortExpression="address_type_id" />
                                        <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                                        <asp:BoundField DataField="country" HeaderText="country" InsertVisible="False" ReadOnly="True" SortExpression="country" Visible="false" />
                                        <asp:BoundField DataField="County_Township" HeaderText="County_Township" InsertVisible="False" ReadOnly="True" SortExpression="County_Township" Visible="false" />
                                        <asp:BoundField DataField="longitude" HeaderText="longitude" InsertVisible="False" ReadOnly="True" SortExpression="longitude" Visible="false" />
                                        <asp:BoundField DataField="latitude" HeaderText="latitude" InsertVisible="False" ReadOnly="True" SortExpression="latitude" Visible="false" />
                                        <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                                        <asp:BoundField DataField="str_add" HeaderText="str_add" InsertVisible="False" ReadOnly="True" SortExpression="str_add" Visible="false" />
                                        <asp:BoundField DataField="str_add2" HeaderText="str_add2" InsertVisible="False" ReadOnly="True" SortExpression="str_add2" Visible="false" />
                                        <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" InsertVisible="False" ReadOnly="True" SortExpression="zip_plus_four" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="address_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [address]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control form-control-disabled" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_type_id</span>
                                <asp:TextBox class="pull-right form-control" ID="address_type_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                                <asp:TextBox class="pull-right form-control" ID="city_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">country</span>
                                <asp:TextBox class="pull-right form-control" ID="country_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">County_Township</span>
                                <asp:TextBox class="pull-right form-control" ID="County_Township_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="longitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="latitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">state</span>
                                <asp:TextBox class="pull-right form-control" ID="state_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add</span>
                                <asp:TextBox class="pull-right form-control" ID="str_add_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add2</span>
                                <asp:TextBox class="pull-right form-control" ID="str_add2_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">zip_plus_four</span>
                                <asp:TextBox class="pull-right form-control" ID="zip_plus_four_Delete_TextBox" runat="server"></asp:TextBox>
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

