<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Donor.aspx.cs" Inherits="Web.App.DonorClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="DonorCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Donor CRUD Operations:</span></h1>
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
                                    DataKeyNames="donor_id"
                                    DataSourceID="Donor_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="donor_id" HeaderText="donor_id" InsertVisible="False" ReadOnly="True" SortExpression="donor_id" />
                                        <asp:BoundField DataField="PersonID" HeaderText="PersonID" InsertVisible="False" ReadOnly="True" SortExpression="PersonID" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" InsertVisible="False" ReadOnly="True" SortExpression="Status" />
                                        <asp:BoundField DataField="DonorType" HeaderText="DonorType" InsertVisible="False" ReadOnly="True" SortExpression="DonorType" Visible="false" />
                                        <asp:BoundField DataField="AgencyID" HeaderText="AgencyID" InsertVisible="False" ReadOnly="True" SortExpression="AgencyID" Visible="false" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" InsertVisible="False" ReadOnly="True" SortExpression="Phone" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Donor_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Donor]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PersonID</span>
                                <asp:TextBox class="pull-right form-control" ID="PersonID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Status</span>
                                <asp:TextBox class="pull-right form-control" ID="Status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorType</span>
                                <asp:TextBox class="pull-right form-control" ID="DonorType_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AgencyID</span>
                                <asp:TextBox class="pull-right form-control" ID="AgencyID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone</span>
                                <asp:TextBox class="pull-right form-control" ID="Phone_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="donor_id"
                                    DataSourceID="Donor_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="donor_id" HeaderText="donor_id" InsertVisible="False" ReadOnly="True" SortExpression="donor_id" />
                                        <asp:BoundField DataField="PersonID" HeaderText="PersonID" InsertVisible="False" ReadOnly="True" SortExpression="PersonID" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" InsertVisible="False" ReadOnly="True" SortExpression="Status" />
                                        <asp:BoundField DataField="DonorType" HeaderText="DonorType" InsertVisible="False" ReadOnly="True" SortExpression="DonorType" Visible="false" />
                                        <asp:BoundField DataField="AgencyID" HeaderText="AgencyID" InsertVisible="False" ReadOnly="True" SortExpression="AgencyID" Visible="false" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" InsertVisible="False" ReadOnly="True" SortExpression="Phone" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Donor_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Donor]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">donor_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="donor_id_Update_TextBox" ID="donor_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="donor_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PersonID</span>
                                <asp:TextBox class="pull-right form-control" ID="PersonID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Status</span>
                                <asp:TextBox class="pull-right form-control" ID="Status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorType</span>
                                <asp:TextBox class="pull-right form-control" ID="DonorType_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AgencyID</span>
                                <asp:TextBox class="pull-right form-control" ID="AgencyID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone</span>
                                <asp:TextBox class="pull-right form-control" ID="Phone_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="donor_id"
                                    DataSourceID="Donor_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="donor_id" HeaderText="donor_id" InsertVisible="False" ReadOnly="True" SortExpression="donor_id" />
                                        <asp:BoundField DataField="PersonID" HeaderText="PersonID" InsertVisible="False" ReadOnly="True" SortExpression="PersonID" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" InsertVisible="False" ReadOnly="True" SortExpression="Status" />
                                        <asp:BoundField DataField="DonorType" HeaderText="DonorType" InsertVisible="False" ReadOnly="True" SortExpression="DonorType" Visible="false" />
                                        <asp:BoundField DataField="AgencyID" HeaderText="AgencyID" InsertVisible="False" ReadOnly="True" SortExpression="AgencyID" Visible="false" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" InsertVisible="False" ReadOnly="True" SortExpression="Phone" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Donor_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Donor]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">donor_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="donor_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">PersonID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="PersonID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DonorType</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="DonorType_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">AgencyID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="AgencyID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Phone_Delete_TextBox" runat="server"></asp:TextBox>
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

