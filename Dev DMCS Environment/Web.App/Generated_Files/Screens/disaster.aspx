<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="disaster.aspx.cs" Inherits="Web.App.disasterClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="disasterCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>disaster CRUD Operations:</span></h1>
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
                                    DataKeyNames="disaster_id"
                                    DataSourceID="disaster_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                                        <asp:BoundField DataField="disaster_name" HeaderText="disaster_name" InsertVisible="False" ReadOnly="True" SortExpression="disaster_name" />
                                        <asp:BoundField DataField="disaster_type" HeaderText="disaster_type" InsertVisible="False" ReadOnly="True" SortExpression="disaster_type" />
                                        <asp:BoundField DataField="disaster_start_date" HeaderText="disaster_start_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_start_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_end_date" HeaderText="disaster_end_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_end_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_north_latitude" HeaderText="disaster_north_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_north_longitude" HeaderText="disaster_north_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_south_latitude" HeaderText="disaster_south_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_south_longitude" HeaderText="disaster_south_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_east_latitude" HeaderText="disaster_east_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_east_longitude" HeaderText="disaster_east_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_west_latitude" HeaderText="disaster_west_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_west_longitude" HeaderText="disaster_west_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_longitude" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="disaster_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [disaster]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_name_Insert_TextBox" ID="disaster_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="disaster_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_type_Insert_TextBox" ID="disaster_type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="disaster_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_start_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_start_date_Insert_TextBox" ID="disaster_start_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="disaster_start_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_end_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="disaster_end_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_north_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_north_latitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_north_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_north_longitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_south_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_south_latitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_south_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_south_longitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_east_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_east_latitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_east_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_east_longitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_west_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_west_latitude_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_west_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_west_longitude_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="disaster_id"
                                    DataSourceID="disaster_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                                        <asp:BoundField DataField="disaster_name" HeaderText="disaster_name" InsertVisible="False" ReadOnly="True" SortExpression="disaster_name" />
                                        <asp:BoundField DataField="disaster_type" HeaderText="disaster_type" InsertVisible="False" ReadOnly="True" SortExpression="disaster_type" />
                                        <asp:BoundField DataField="disaster_start_date" HeaderText="disaster_start_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_start_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_end_date" HeaderText="disaster_end_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_end_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_north_latitude" HeaderText="disaster_north_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_north_longitude" HeaderText="disaster_north_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_south_latitude" HeaderText="disaster_south_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_south_longitude" HeaderText="disaster_south_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_east_latitude" HeaderText="disaster_east_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_east_longitude" HeaderText="disaster_east_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_west_latitude" HeaderText="disaster_west_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_west_longitude" HeaderText="disaster_west_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_longitude" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="disaster_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [disaster]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_id_Update_TextBox" ID="disaster_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="disaster_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_name_Update_TextBox" ID="disaster_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="disaster_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_type_Update_TextBox" ID="disaster_type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="disaster_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_start_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="disaster_start_date_Update_TextBox" ID="disaster_start_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="disaster_start_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_end_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="disaster_end_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_north_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_north_latitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_north_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_north_longitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_south_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_south_latitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_south_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_south_longitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_east_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_east_latitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_east_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_east_longitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_west_latitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_west_latitude_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_west_longitude</span>
                                <asp:TextBox class="pull-right form-control" ID="disaster_west_longitude_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="disaster_id"
                                    DataSourceID="disaster_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="disaster_id" HeaderText="disaster_id" InsertVisible="False" ReadOnly="True" SortExpression="disaster_id" />
                                        <asp:BoundField DataField="disaster_name" HeaderText="disaster_name" InsertVisible="False" ReadOnly="True" SortExpression="disaster_name" />
                                        <asp:BoundField DataField="disaster_type" HeaderText="disaster_type" InsertVisible="False" ReadOnly="True" SortExpression="disaster_type" />
                                        <asp:BoundField DataField="disaster_start_date" HeaderText="disaster_start_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_start_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_end_date" HeaderText="disaster_end_date" InsertVisible="False" ReadOnly="True" SortExpression="disaster_end_date" Visible="false" />
                                        <asp:BoundField DataField="disaster_north_latitude" HeaderText="disaster_north_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_north_longitude" HeaderText="disaster_north_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_north_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_south_latitude" HeaderText="disaster_south_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_south_longitude" HeaderText="disaster_south_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_south_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_east_latitude" HeaderText="disaster_east_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_east_longitude" HeaderText="disaster_east_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_east_longitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_west_latitude" HeaderText="disaster_west_latitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_latitude" Visible="false" />
                                        <asp:BoundField DataField="disaster_west_longitude" HeaderText="disaster_west_longitude" InsertVisible="False" ReadOnly="True" SortExpression="disaster_west_longitude" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="disaster_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [disaster]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_start_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="disaster_start_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_end_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="disaster_end_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_north_latitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_north_latitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_north_longitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_north_longitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_south_latitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_south_latitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_south_longitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_south_longitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_east_latitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_east_latitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_east_longitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_east_longitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_west_latitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_west_latitude_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">disaster_west_longitude</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="disaster_west_longitude_Delete_TextBox" runat="server"></asp:TextBox>
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

