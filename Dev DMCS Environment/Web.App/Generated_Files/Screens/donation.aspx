<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="donation.aspx.cs" Inherits="Web.App.donationClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="donationCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>donation CRUD Operations:</span></h1>
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
                                    DataKeyNames="Donation_ID"
                                    DataSourceID="donation_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Donation_ID" HeaderText="Donation_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donation_ID" />
                                        <asp:BoundField DataField="Receipt_ID" HeaderText="Receipt_ID" InsertVisible="False" ReadOnly="True" SortExpression="Receipt_ID" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="Donor_ID" HeaderText="Donor_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donor_ID" Visible="false" />
                                        <asp:BoundField DataField="Date" HeaderText="Date" InsertVisible="False" ReadOnly="True" SortExpression="Date" Visible="false" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" InsertVisible="False" ReadOnly="True" SortExpression="Quantity" Visible="false" />
                                        <asp:BoundField DataField="Agency_ID" HeaderText="Agency_ID" InsertVisible="False" ReadOnly="True" SortExpression="Agency_ID" Visible="false" />
                                        <asp:BoundField DataField="Is_Monetary" HeaderText="Is_Monetary" InsertVisible="False" ReadOnly="True" SortExpression="Is_Monetary" Visible="false" />
                                        <asp:BoundField DataField="Is_FEMA" HeaderText="Is_FEMA" InsertVisible="False" ReadOnly="True" SortExpression="Is_FEMA" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="donation_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [donation]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Receipt_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Receipt_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Resource_ID_Insert_TextBox" ID="Resource_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Resource_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Donor_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Donor_ID_Insert_TextBox" ID="Donor_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Donor_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Insert_TextBox" ID="Date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="Quantity_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Agency_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Agency_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Is_Monetary</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Is_Monetary_Insert_TextBox" ID="Is_Monetary_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Is_Monetary_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Is_FEMA</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Is_FEMA_Insert_TextBox" ID="Is_FEMA_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Is_FEMA_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Donation_ID"
                                    DataSourceID="donation_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Donation_ID" HeaderText="Donation_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donation_ID" />
                                        <asp:BoundField DataField="Receipt_ID" HeaderText="Receipt_ID" InsertVisible="False" ReadOnly="True" SortExpression="Receipt_ID" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="Donor_ID" HeaderText="Donor_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donor_ID" Visible="false" />
                                        <asp:BoundField DataField="Date" HeaderText="Date" InsertVisible="False" ReadOnly="True" SortExpression="Date" Visible="false" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" InsertVisible="False" ReadOnly="True" SortExpression="Quantity" Visible="false" />
                                        <asp:BoundField DataField="Agency_ID" HeaderText="Agency_ID" InsertVisible="False" ReadOnly="True" SortExpression="Agency_ID" Visible="false" />
                                        <asp:BoundField DataField="Is_Monetary" HeaderText="Is_Monetary" InsertVisible="False" ReadOnly="True" SortExpression="Is_Monetary" Visible="false" />
                                        <asp:BoundField DataField="Is_FEMA" HeaderText="Is_FEMA" InsertVisible="False" ReadOnly="True" SortExpression="Is_FEMA" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="donation_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [donation]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Donation_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Donation_ID_Update_TextBox" ID="Donation_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Donation_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Receipt_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Receipt_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Resource_ID_Update_TextBox" ID="Resource_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Resource_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Donor_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Donor_ID_Update_TextBox" ID="Donor_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Donor_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Update_TextBox" ID="Date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="Quantity_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Agency_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Agency_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Is_Monetary</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Is_Monetary_Update_TextBox" ID="Is_Monetary_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Is_Monetary_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Is_FEMA</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Is_FEMA_Update_TextBox" ID="Is_FEMA_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Is_FEMA_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Donation_ID"
                                    DataSourceID="donation_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Donation_ID" HeaderText="Donation_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donation_ID" />
                                        <asp:BoundField DataField="Receipt_ID" HeaderText="Receipt_ID" InsertVisible="False" ReadOnly="True" SortExpression="Receipt_ID" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="Donor_ID" HeaderText="Donor_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donor_ID" Visible="false" />
                                        <asp:BoundField DataField="Date" HeaderText="Date" InsertVisible="False" ReadOnly="True" SortExpression="Date" Visible="false" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" InsertVisible="False" ReadOnly="True" SortExpression="Quantity" Visible="false" />
                                        <asp:BoundField DataField="Agency_ID" HeaderText="Agency_ID" InsertVisible="False" ReadOnly="True" SortExpression="Agency_ID" Visible="false" />
                                        <asp:BoundField DataField="Is_Monetary" HeaderText="Is_Monetary" InsertVisible="False" ReadOnly="True" SortExpression="Is_Monetary" Visible="false" />
                                        <asp:BoundField DataField="Is_FEMA" HeaderText="Is_FEMA" InsertVisible="False" ReadOnly="True" SortExpression="Is_FEMA" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="donation_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [donation]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Donation_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Donation_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Receipt_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Receipt_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Resource_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Donor_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Donor_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Quantity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Quantity_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Agency_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Agency_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Is_Monetary</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Is_Monetary_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Is_FEMA</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Is_FEMA_Delete_TextBox" runat="server"></asp:TextBox>
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

