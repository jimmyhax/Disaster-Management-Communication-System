<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Pet_Missing.aspx.cs" Inherits="Web.App.Pet_MissingClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="Pet_MissingCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Pet_Missing CRUD Operations:</span></h1>
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
                                    DataKeyNames="Pet_Missing_ID"
                                    DataSourceID="Pet_Missing_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Missing_ID" HeaderText="Pet_Missing_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Missing_ID" />
                                        <asp:BoundField DataField="Last_Known_Location_ID" HeaderText="Last_Known_Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Last_Known_Location_ID" />
                                        <asp:BoundField DataField="Date_Missing" HeaderText="Date_Missing" InsertVisible="False" ReadOnly="True" SortExpression="Date_Missing" />
                                        <asp:BoundField DataField="Date_Reported" HeaderText="Date_Reported" InsertVisible="False" ReadOnly="True" SortExpression="Date_Reported" Visible="false" />
                                        <asp:BoundField DataField="Collar_Description" HeaderText="Collar_Description" InsertVisible="False" ReadOnly="True" SortExpression="Collar_Description" Visible="false" />
                                        <asp:BoundField DataField="Time_Lost" HeaderText="Time_Lost" InsertVisible="False" ReadOnly="True" SortExpression="Time_Lost" Visible="false" />
                                        <asp:BoundField DataField="Lost_Explanation" HeaderText="Lost_Explanation" InsertVisible="False" ReadOnly="True" SortExpression="Lost_Explanation" Visible="false" />
                                        <asp:BoundField DataField="Length_Owned" HeaderText="Length_Owned" InsertVisible="False" ReadOnly="True" SortExpression="Length_Owned" Visible="false" />
                                        <asp:BoundField DataField="Reward_Amt" HeaderText="Reward_Amt" InsertVisible="False" ReadOnly="True" SortExpression="Reward_Amt" Visible="false" />
                                        <asp:BoundField DataField="Breeder" HeaderText="Breeder" InsertVisible="False" ReadOnly="True" SortExpression="Breeder" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Missing_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Missing]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Last_Known_Location_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Last_Known_Location_ID_Insert_TextBox" ID="Last_Known_Location_ID_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Last_Known_Location_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Missing</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Missing_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Reported</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Reported_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Collar_Description</span>
                                <asp:TextBox class="pull-right form-control" ID="Collar_Description_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Time_Lost</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Time_Lost_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Lost_Explanation</span>
                                <asp:TextBox class="pull-right form-control" ID="Lost_Explanation_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Length_Owned</span>
                                <asp:TextBox class="pull-right form-control" ID="Length_Owned_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Reward_Amt</span>
                                <asp:TextBox class="pull-right form-control" ID="Reward_Amt_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Breeder</span>
                                <asp:TextBox class="pull-right form-control" ID="Breeder_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Created_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Modified_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Missing_ID"
                                    DataSourceID="Pet_Missing_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Missing_ID" HeaderText="Pet_Missing_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Missing_ID" />
                                        <asp:BoundField DataField="Last_Known_Location_ID" HeaderText="Last_Known_Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Last_Known_Location_ID" />
                                        <asp:BoundField DataField="Date_Missing" HeaderText="Date_Missing" InsertVisible="False" ReadOnly="True" SortExpression="Date_Missing" />
                                        <asp:BoundField DataField="Date_Reported" HeaderText="Date_Reported" InsertVisible="False" ReadOnly="True" SortExpression="Date_Reported" Visible="false" />
                                        <asp:BoundField DataField="Collar_Description" HeaderText="Collar_Description" InsertVisible="False" ReadOnly="True" SortExpression="Collar_Description" Visible="false" />
                                        <asp:BoundField DataField="Time_Lost" HeaderText="Time_Lost" InsertVisible="False" ReadOnly="True" SortExpression="Time_Lost" Visible="false" />
                                        <asp:BoundField DataField="Lost_Explanation" HeaderText="Lost_Explanation" InsertVisible="False" ReadOnly="True" SortExpression="Lost_Explanation" Visible="false" />
                                        <asp:BoundField DataField="Length_Owned" HeaderText="Length_Owned" InsertVisible="False" ReadOnly="True" SortExpression="Length_Owned" Visible="false" />
                                        <asp:BoundField DataField="Reward_Amt" HeaderText="Reward_Amt" InsertVisible="False" ReadOnly="True" SortExpression="Reward_Amt" Visible="false" />
                                        <asp:BoundField DataField="Breeder" HeaderText="Breeder" InsertVisible="False" ReadOnly="True" SortExpression="Breeder" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Missing_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Missing]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Missing_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Missing_ID_Update_TextBox" ID="Pet_Missing_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Missing_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Last_Known_Location_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Last_Known_Location_ID_Update_TextBox" ID="Last_Known_Location_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Last_Known_Location_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Missing</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Missing_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Reported</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Reported_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Collar_Description</span>
                                <asp:TextBox class="pull-right form-control" ID="Collar_Description_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Time_Lost</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Time_Lost_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Lost_Explanation</span>
                                <asp:TextBox class="pull-right form-control" ID="Lost_Explanation_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Length_Owned</span>
                                <asp:TextBox class="pull-right form-control" ID="Length_Owned_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Reward_Amt</span>
                                <asp:TextBox class="pull-right form-control" ID="Reward_Amt_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Breeder</span>
                                <asp:TextBox class="pull-right form-control" ID="Breeder_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Created_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Modified_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Missing_ID"
                                    DataSourceID="Pet_Missing_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Missing_ID" HeaderText="Pet_Missing_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Missing_ID" />
                                        <asp:BoundField DataField="Last_Known_Location_ID" HeaderText="Last_Known_Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Last_Known_Location_ID" />
                                        <asp:BoundField DataField="Date_Missing" HeaderText="Date_Missing" InsertVisible="False" ReadOnly="True" SortExpression="Date_Missing" />
                                        <asp:BoundField DataField="Date_Reported" HeaderText="Date_Reported" InsertVisible="False" ReadOnly="True" SortExpression="Date_Reported" Visible="false" />
                                        <asp:BoundField DataField="Collar_Description" HeaderText="Collar_Description" InsertVisible="False" ReadOnly="True" SortExpression="Collar_Description" Visible="false" />
                                        <asp:BoundField DataField="Time_Lost" HeaderText="Time_Lost" InsertVisible="False" ReadOnly="True" SortExpression="Time_Lost" Visible="false" />
                                        <asp:BoundField DataField="Lost_Explanation" HeaderText="Lost_Explanation" InsertVisible="False" ReadOnly="True" SortExpression="Lost_Explanation" Visible="false" />
                                        <asp:BoundField DataField="Length_Owned" HeaderText="Length_Owned" InsertVisible="False" ReadOnly="True" SortExpression="Length_Owned" Visible="false" />
                                        <asp:BoundField DataField="Reward_Amt" HeaderText="Reward_Amt" InsertVisible="False" ReadOnly="True" SortExpression="Reward_Amt" Visible="false" />
                                        <asp:BoundField DataField="Breeder" HeaderText="Breeder" InsertVisible="False" ReadOnly="True" SortExpression="Breeder" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Missing_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet_Missing]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Missing_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Missing_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Last_Known_Location_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Last_Known_Location_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Missing</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Missing_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Reported</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Reported_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Collar_Description</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Collar_Description_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Time_Lost</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Time_Lost_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Lost_Explanation</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Lost_Explanation_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Length_Owned</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Length_Owned_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Reward_Amt</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Reward_Amt_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Breeder</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Breeder_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Created_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Modified_Delete_TextBox" runat="server"></asp:TextBox>
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

