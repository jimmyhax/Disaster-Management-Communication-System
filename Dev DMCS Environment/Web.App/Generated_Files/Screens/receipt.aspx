<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="receipt.aspx.cs" Inherits="Web.App.receiptClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="receiptCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>receipt CRUD Operations:</span></h1>
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
                                    DataKeyNames="Receipt_ID"
                                    DataSourceID="receipt_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Receipt_ID" HeaderText="Receipt_ID" InsertVisible="False" ReadOnly="True" SortExpression="Receipt_ID" />
                                        <asp:BoundField DataField="Account_ID" HeaderText="Account_ID" InsertVisible="False" ReadOnly="True" SortExpression="Account_ID" />
                                        <asp:BoundField DataField="Check_Num" HeaderText="Check_Num" InsertVisible="False" ReadOnly="True" SortExpression="Check_Num" />
                                        <asp:BoundField DataField="DLN" HeaderText="DLN" InsertVisible="False" ReadOnly="True" SortExpression="DLN" Visible="false" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" InsertVisible="False" ReadOnly="True" SortExpression="Phone" Visible="false" />
                                        <asp:BoundField DataField="Pay_Type" HeaderText="Pay_Type" InsertVisible="False" ReadOnly="True" SortExpression="Pay_Type" Visible="false" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" InsertVisible="False" ReadOnly="True" SortExpression="Amount" Visible="false" />
                                        <asp:BoundField DataField="Transfer" HeaderText="Transfer" InsertVisible="False" ReadOnly="True" SortExpression="Transfer" Visible="false" />
                                        <asp:BoundField DataField="Recieve" HeaderText="Recieve" InsertVisible="False" ReadOnly="True" SortExpression="Recieve" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="receipt_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [receipt]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Account_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Account_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Check_Num</span>
                                <asp:TextBox class="pull-right form-control" ID="Check_Num_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DLN</span>
                                <asp:TextBox class="pull-right form-control" ID="DLN_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone</span>
                                <asp:TextBox class="pull-right form-control" ID="Phone_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pay_Type</span>
                                <asp:TextBox class="pull-right form-control" ID="Pay_Type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Amount</span>
                                <asp:TextBox class="pull-right form-control" ID="Amount_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Transfer</span>
                                <asp:TextBox class="pull-right form-control" ID="Transfer_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Recieve</span>
                                <asp:TextBox class="pull-right form-control" ID="Recieve_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Receipt_ID"
                                    DataSourceID="receipt_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Receipt_ID" HeaderText="Receipt_ID" InsertVisible="False" ReadOnly="True" SortExpression="Receipt_ID" />
                                        <asp:BoundField DataField="Account_ID" HeaderText="Account_ID" InsertVisible="False" ReadOnly="True" SortExpression="Account_ID" />
                                        <asp:BoundField DataField="Check_Num" HeaderText="Check_Num" InsertVisible="False" ReadOnly="True" SortExpression="Check_Num" />
                                        <asp:BoundField DataField="DLN" HeaderText="DLN" InsertVisible="False" ReadOnly="True" SortExpression="DLN" Visible="false" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" InsertVisible="False" ReadOnly="True" SortExpression="Phone" Visible="false" />
                                        <asp:BoundField DataField="Pay_Type" HeaderText="Pay_Type" InsertVisible="False" ReadOnly="True" SortExpression="Pay_Type" Visible="false" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" InsertVisible="False" ReadOnly="True" SortExpression="Amount" Visible="false" />
                                        <asp:BoundField DataField="Transfer" HeaderText="Transfer" InsertVisible="False" ReadOnly="True" SortExpression="Transfer" Visible="false" />
                                        <asp:BoundField DataField="Recieve" HeaderText="Recieve" InsertVisible="False" ReadOnly="True" SortExpression="Recieve" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="receipt_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [receipt]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Receipt_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Receipt_ID_Update_TextBox" ID="Receipt_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Receipt_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Account_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Account_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Check_Num</span>
                                <asp:TextBox class="pull-right form-control" ID="Check_Num_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DLN</span>
                                <asp:TextBox class="pull-right form-control" ID="DLN_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone</span>
                                <asp:TextBox class="pull-right form-control" ID="Phone_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pay_Type</span>
                                <asp:TextBox class="pull-right form-control" ID="Pay_Type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Amount</span>
                                <asp:TextBox class="pull-right form-control" ID="Amount_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Transfer</span>
                                <asp:TextBox class="pull-right form-control" ID="Transfer_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Recieve</span>
                                <asp:TextBox class="pull-right form-control" ID="Recieve_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Receipt_ID"
                                    DataSourceID="receipt_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Receipt_ID" HeaderText="Receipt_ID" InsertVisible="False" ReadOnly="True" SortExpression="Receipt_ID" />
                                        <asp:BoundField DataField="Account_ID" HeaderText="Account_ID" InsertVisible="False" ReadOnly="True" SortExpression="Account_ID" />
                                        <asp:BoundField DataField="Check_Num" HeaderText="Check_Num" InsertVisible="False" ReadOnly="True" SortExpression="Check_Num" />
                                        <asp:BoundField DataField="DLN" HeaderText="DLN" InsertVisible="False" ReadOnly="True" SortExpression="DLN" Visible="false" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" InsertVisible="False" ReadOnly="True" SortExpression="Phone" Visible="false" />
                                        <asp:BoundField DataField="Pay_Type" HeaderText="Pay_Type" InsertVisible="False" ReadOnly="True" SortExpression="Pay_Type" Visible="false" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" InsertVisible="False" ReadOnly="True" SortExpression="Amount" Visible="false" />
                                        <asp:BoundField DataField="Transfer" HeaderText="Transfer" InsertVisible="False" ReadOnly="True" SortExpression="Transfer" Visible="false" />
                                        <asp:BoundField DataField="Recieve" HeaderText="Recieve" InsertVisible="False" ReadOnly="True" SortExpression="Recieve" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="receipt_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [receipt]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Receipt_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Receipt_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Account_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Account_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Check_Num</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Check_Num_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">DLN</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="DLN_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Phone</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Phone_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pay_Type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pay_Type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Amount</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Amount_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Transfer</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Transfer_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Recieve</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Recieve_Delete_TextBox" runat="server"></asp:TextBox>
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

