<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="tier.aspx.cs" Inherits="Web.App.tierClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="tierCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>tier CRUD Operations:</span></h1>
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
                                    DataKeyNames="tier_id"
                                    DataSourceID="tier_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="tier_id" HeaderText="tier_id" InsertVisible="False" ReadOnly="True" SortExpression="tier_id" />
                                        <asp:BoundField DataField="include_req" HeaderText="include_req" InsertVisible="False" ReadOnly="True" SortExpression="include_req" />
                                        <asp:BoundField DataField="campaign_id" HeaderText="campaign_id" InsertVisible="False" ReadOnly="True" SortExpression="campaign_id" />
                                        <asp:BoundField DataField="Tier_Age_Begin_Month" HeaderText="Tier_Age_Begin_Month" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_Begin_Month" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_Begin_Year" HeaderText="Tier_Age_Begin_Year" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_Begin_Year" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_End_Month" HeaderText="Tier_Age_End_Month" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_End_Month" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_End_Year" HeaderText="Tier_Age_End_Year" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_End_Year" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="tier_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tier]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">include_req</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="include_req_Insert_TextBox" ID="include_req_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="include_req_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">campaign_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="campaign_id_Insert_TextBox" ID="campaign_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="campaign_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_Begin_Month</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_Begin_Month_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_Begin_Year</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_Begin_Year_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_End_Month</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_End_Month_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_End_Year</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_End_Year_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="tier_id"
                                    DataSourceID="tier_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="tier_id" HeaderText="tier_id" InsertVisible="False" ReadOnly="True" SortExpression="tier_id" />
                                        <asp:BoundField DataField="include_req" HeaderText="include_req" InsertVisible="False" ReadOnly="True" SortExpression="include_req" />
                                        <asp:BoundField DataField="campaign_id" HeaderText="campaign_id" InsertVisible="False" ReadOnly="True" SortExpression="campaign_id" />
                                        <asp:BoundField DataField="Tier_Age_Begin_Month" HeaderText="Tier_Age_Begin_Month" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_Begin_Month" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_Begin_Year" HeaderText="Tier_Age_Begin_Year" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_Begin_Year" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_End_Month" HeaderText="Tier_Age_End_Month" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_End_Month" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_End_Year" HeaderText="Tier_Age_End_Year" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_End_Year" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="tier_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tier]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">tier_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="tier_id_Update_TextBox" ID="tier_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="tier_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">include_req</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="include_req_Update_TextBox" ID="include_req_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="include_req_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">campaign_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="campaign_id_Update_TextBox" ID="campaign_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="campaign_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_Begin_Month</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_Begin_Month_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_Begin_Year</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_Begin_Year_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_End_Month</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_End_Month_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_End_Year</span>
                                <asp:TextBox class="pull-right form-control" ID="Tier_Age_End_Year_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="tier_id"
                                    DataSourceID="tier_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="tier_id" HeaderText="tier_id" InsertVisible="False" ReadOnly="True" SortExpression="tier_id" />
                                        <asp:BoundField DataField="include_req" HeaderText="include_req" InsertVisible="False" ReadOnly="True" SortExpression="include_req" />
                                        <asp:BoundField DataField="campaign_id" HeaderText="campaign_id" InsertVisible="False" ReadOnly="True" SortExpression="campaign_id" />
                                        <asp:BoundField DataField="Tier_Age_Begin_Month" HeaderText="Tier_Age_Begin_Month" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_Begin_Month" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_Begin_Year" HeaderText="Tier_Age_Begin_Year" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_Begin_Year" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_End_Month" HeaderText="Tier_Age_End_Month" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_End_Month" Visible="false" />
                                        <asp:BoundField DataField="Tier_Age_End_Year" HeaderText="Tier_Age_End_Year" InsertVisible="False" ReadOnly="True" SortExpression="Tier_Age_End_Year" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="tier_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [tier]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">tier_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="tier_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">include_req</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="include_req_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">campaign_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="campaign_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_Begin_Month</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Tier_Age_Begin_Month_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_Begin_Year</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Tier_Age_Begin_Year_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_End_Month</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Tier_Age_End_Month_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Tier_Age_End_Year</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Tier_Age_End_Year_Delete_TextBox" runat="server"></asp:TextBox>
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
