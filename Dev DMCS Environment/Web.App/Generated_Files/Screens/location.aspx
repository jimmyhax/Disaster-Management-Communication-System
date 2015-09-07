<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="location.aspx.cs" Inherits="Web.App.locationClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="locationCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>location CRUD Operations:</span></h1>
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
                                    DataKeyNames="Location_ID"
                                    DataSourceID="location_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                                        <asp:BoundField DataField="type" HeaderText="type" InsertVisible="False" ReadOnly="True" SortExpression="type" />
                                        <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                                        <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                                        <asp:BoundField DataField="zip" HeaderText="zip" InsertVisible="False" ReadOnly="True" SortExpression="zip" Visible="false" />
                                        <asp:BoundField DataField="county" HeaderText="county" InsertVisible="False" ReadOnly="True" SortExpression="county" Visible="false" />
                                        <asp:BoundField DataField="location_desc" HeaderText="location_desc" InsertVisible="False" ReadOnly="True" SortExpression="location_desc" Visible="false" />
                                        <asp:BoundField DataField="n_long" HeaderText="n_long" InsertVisible="False" ReadOnly="True" SortExpression="n_long" Visible="false" />
                                        <asp:BoundField DataField="s_long" HeaderText="s_long" InsertVisible="False" ReadOnly="True" SortExpression="s_long" Visible="false" />
                                        <asp:BoundField DataField="e_long" HeaderText="e_long" InsertVisible="False" ReadOnly="True" SortExpression="e_long" Visible="false" />
                                        <asp:BoundField DataField="w_long" HeaderText="w_long" InsertVisible="False" ReadOnly="True" SortExpression="w_long" Visible="false" />
                                        <asp:BoundField DataField="n_lat" HeaderText="n_lat" InsertVisible="False" ReadOnly="True" SortExpression="n_lat" Visible="false" />
                                        <asp:BoundField DataField="s_lat" HeaderText="s_lat" InsertVisible="False" ReadOnly="True" SortExpression="s_lat" Visible="false" />
                                        <asp:BoundField DataField="e_lat" HeaderText="e_lat" InsertVisible="False" ReadOnly="True" SortExpression="e_lat" Visible="false" />
                                        <asp:BoundField DataField="w_lat" HeaderText="w_lat" InsertVisible="False" ReadOnly="True" SortExpression="w_lat" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="location_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="type_Insert_TextBox" ID="type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="city_Insert_TextBox" ID="city_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="city_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">state</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="state_Insert_TextBox" ID="state_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="state_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">zip</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="zip_Insert_TextBox" ID="zip_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="zip_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">county</span>
                                <asp:TextBox class="pull-right form-control" ID="county_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">location_desc</span>
                                <asp:TextBox class="pull-right form-control" ID="location_desc_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">n_long</span>
                                <asp:TextBox class="pull-right form-control" ID="n_long_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">s_long</span>
                                <asp:TextBox class="pull-right form-control" ID="s_long_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">e_long</span>
                                <asp:TextBox class="pull-right form-control" ID="e_long_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">w_long</span>
                                <asp:TextBox class="pull-right form-control" ID="w_long_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">n_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="n_lat_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">s_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="s_lat_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">e_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="e_lat_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">w_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="w_lat_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Location_ID"
                                    DataSourceID="location_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                                        <asp:BoundField DataField="type" HeaderText="type" InsertVisible="False" ReadOnly="True" SortExpression="type" />
                                        <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                                        <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                                        <asp:BoundField DataField="zip" HeaderText="zip" InsertVisible="False" ReadOnly="True" SortExpression="zip" Visible="false" />
                                        <asp:BoundField DataField="county" HeaderText="county" InsertVisible="False" ReadOnly="True" SortExpression="county" Visible="false" />
                                        <asp:BoundField DataField="location_desc" HeaderText="location_desc" InsertVisible="False" ReadOnly="True" SortExpression="location_desc" Visible="false" />
                                        <asp:BoundField DataField="n_long" HeaderText="n_long" InsertVisible="False" ReadOnly="True" SortExpression="n_long" Visible="false" />
                                        <asp:BoundField DataField="s_long" HeaderText="s_long" InsertVisible="False" ReadOnly="True" SortExpression="s_long" Visible="false" />
                                        <asp:BoundField DataField="e_long" HeaderText="e_long" InsertVisible="False" ReadOnly="True" SortExpression="e_long" Visible="false" />
                                        <asp:BoundField DataField="w_long" HeaderText="w_long" InsertVisible="False" ReadOnly="True" SortExpression="w_long" Visible="false" />
                                        <asp:BoundField DataField="n_lat" HeaderText="n_lat" InsertVisible="False" ReadOnly="True" SortExpression="n_lat" Visible="false" />
                                        <asp:BoundField DataField="s_lat" HeaderText="s_lat" InsertVisible="False" ReadOnly="True" SortExpression="s_lat" Visible="false" />
                                        <asp:BoundField DataField="e_lat" HeaderText="e_lat" InsertVisible="False" ReadOnly="True" SortExpression="e_lat" Visible="false" />
                                        <asp:BoundField DataField="w_lat" HeaderText="w_lat" InsertVisible="False" ReadOnly="True" SortExpression="w_lat" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="location_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Location_ID_Update_TextBox" ID="Location_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Location_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="type_Update_TextBox" ID="type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="city_Update_TextBox" ID="city_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="city_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">state</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="state_Update_TextBox" ID="state_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="state_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">zip</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="zip_Update_TextBox" ID="zip_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="zip_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">county</span>
                                <asp:TextBox class="pull-right form-control" ID="county_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">location_desc</span>
                                <asp:TextBox class="pull-right form-control" ID="location_desc_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">n_long</span>
                                <asp:TextBox class="pull-right form-control" ID="n_long_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">s_long</span>
                                <asp:TextBox class="pull-right form-control" ID="s_long_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">e_long</span>
                                <asp:TextBox class="pull-right form-control" ID="e_long_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">w_long</span>
                                <asp:TextBox class="pull-right form-control" ID="w_long_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">n_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="n_lat_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">s_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="s_lat_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">e_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="e_lat_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">w_lat</span>
                                <asp:TextBox class="pull-right form-control" ID="w_lat_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Location_ID"
                                    DataSourceID="location_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Location_ID" HeaderText="Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Location_ID" />
                                        <asp:BoundField DataField="type" HeaderText="type" InsertVisible="False" ReadOnly="True" SortExpression="type" />
                                        <asp:BoundField DataField="city" HeaderText="city" InsertVisible="False" ReadOnly="True" SortExpression="city" />
                                        <asp:BoundField DataField="state" HeaderText="state" InsertVisible="False" ReadOnly="True" SortExpression="state" Visible="false" />
                                        <asp:BoundField DataField="zip" HeaderText="zip" InsertVisible="False" ReadOnly="True" SortExpression="zip" Visible="false" />
                                        <asp:BoundField DataField="county" HeaderText="county" InsertVisible="False" ReadOnly="True" SortExpression="county" Visible="false" />
                                        <asp:BoundField DataField="location_desc" HeaderText="location_desc" InsertVisible="False" ReadOnly="True" SortExpression="location_desc" Visible="false" />
                                        <asp:BoundField DataField="n_long" HeaderText="n_long" InsertVisible="False" ReadOnly="True" SortExpression="n_long" Visible="false" />
                                        <asp:BoundField DataField="s_long" HeaderText="s_long" InsertVisible="False" ReadOnly="True" SortExpression="s_long" Visible="false" />
                                        <asp:BoundField DataField="e_long" HeaderText="e_long" InsertVisible="False" ReadOnly="True" SortExpression="e_long" Visible="false" />
                                        <asp:BoundField DataField="w_long" HeaderText="w_long" InsertVisible="False" ReadOnly="True" SortExpression="w_long" Visible="false" />
                                        <asp:BoundField DataField="n_lat" HeaderText="n_lat" InsertVisible="False" ReadOnly="True" SortExpression="n_lat" Visible="false" />
                                        <asp:BoundField DataField="s_lat" HeaderText="s_lat" InsertVisible="False" ReadOnly="True" SortExpression="s_lat" Visible="false" />
                                        <asp:BoundField DataField="e_lat" HeaderText="e_lat" InsertVisible="False" ReadOnly="True" SortExpression="e_lat" Visible="false" />
                                        <asp:BoundField DataField="w_lat" HeaderText="w_lat" InsertVisible="False" ReadOnly="True" SortExpression="w_lat" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="location_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Location_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Location_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="city_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">state</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="state_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">zip</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="zip_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">county</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="county_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">location_desc</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="location_desc_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">n_long</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="n_long_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">s_long</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="s_long_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">e_long</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="e_long_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">w_long</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="w_long_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">n_lat</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="n_lat_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">s_lat</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="s_lat_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">e_lat</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="e_lat_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">w_lat</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="w_lat_Delete_TextBox" runat="server"></asp:TextBox>
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

