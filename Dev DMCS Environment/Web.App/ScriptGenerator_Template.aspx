<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ScriptGenerator_Template.aspx.cs" Inherits="Web.App.ScriptGenerator_Template" EnableEventValidation="True" ValidateRequest="True" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="ScriptGeneratorTemplateCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Address CRUD</span></h1>
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
                                    DataSourceID="Address_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" SortExpression="address_type_id" />
                                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                        <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                                        <asp:BoundField DataField="County_Township" HeaderText="County_Township" SortExpression="County_Township" />
                                        <asp:BoundField DataField="longitude" HeaderText="longitude" SortExpression="longitude" />
                                        <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Address_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [address]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_type_id</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_type_id_Insert_TextBox" ID="address_type_id_Insert_TextBox_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="address_type_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="city_Insert_TextBox" ID="city_Insert_TextBox_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="city_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">country</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="country_Insert_TextBox" ID="country_Insert_TextBox_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                </div>
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
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="state_Insert_TextBox" ID="state_Insert_TextBox_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="state_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="str_add_Insert_TextBox" ID="str_add_Insert_TextBox_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                </div>
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
                            <div class="input-group text-center form-group">
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
                                    DataSourceID="Address_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" SortExpression="address_type_id" />
                                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                        <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                                        <asp:BoundField DataField="County_Township" HeaderText="County_Township" SortExpression="County_Township" />
                                        <asp:BoundField DataField="longitude" HeaderText="longitude" SortExpression="longitude" />
                                        <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
                                        <%--<asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                    <asp:BoundField DataField="str_add" HeaderText="str_add" SortExpression="str_add" />
                    <asp:BoundField DataField="str_add2" HeaderText="str_add2" SortExpression="str_add2" />
                    <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" SortExpression="zip_plus_four" />--%>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Address_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [address]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control disabled" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_type_id</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_type_id_Update_TextBox" ID="RequiredFieldValidator1" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="address_type_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="city_Update_TextBox" ID="RequiredFieldValidator2" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="city_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">country</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="country_Update_TextBox" ID="RequiredFieldValidator3" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                                </div>
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
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="state_Update_TextBox" ID="RequiredFieldValidator4" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="state_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="str_add_Update_TextBox" ID="RequiredFieldValidator5" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                                </div>
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
                            <div class="input-group text-center form-group">
                                <%--FREE SPACE--%>
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
                                    DataSourceID="Address_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" SortExpression="address_type_id" />
                                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                        <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                                        <asp:BoundField DataField="County_Township" HeaderText="County_Township" SortExpression="County_Township" />
                                        <asp:BoundField DataField="longitude" HeaderText="longitude" SortExpression="longitude" />
                                        <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
                                        <%--<asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                        <asp:BoundField DataField="str_add" HeaderText="str_add" SortExpression="str_add" />
                        <asp:BoundField DataField="str_add2" HeaderText="str_add2" SortExpression="str_add2" />
                        <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" SortExpression="zip_plus_four" />--%>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Address_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [address]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control form-control-disabled" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_type_id</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_type_id_Delete_TextBox" ID="RequiredFieldValidator6" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Delete_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="address_type_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">city</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="city_Delete_TextBox" ID="RequiredFieldValidator7" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Delete_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="city_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">country</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="country_Delete_TextBox" ID="RequiredFieldValidator8" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Delete_Group"></asp:RequiredFieldValidator>
                                </div>
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
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="state_Delete_TextBox" ID="RequiredFieldValidator9" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Delete_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="state_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">str_add</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="str_add_Delete_TextBox" ID="RequiredFieldValidator10" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Delete_Group"></asp:RequiredFieldValidator>
                                </div>
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
                            <div class="input-group text-center form-group">
                                <%--FREE SPACE--%>
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
