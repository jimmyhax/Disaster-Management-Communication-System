<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="deceased.aspx.cs" Inherits="Web.App.deceasedClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="deceasedCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>deceased CRUD Operations:</span></h1>
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
                                    DataKeyNames="deceased_id"
                                    DataSourceID="deceased_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" />
                                        <asp:BoundField DataField="date_of_autopsy" HeaderText="date_of_autopsy" InsertVisible="False" ReadOnly="True" SortExpression="date_of_autopsy" />
                                        <asp:BoundField DataField="external_exam" HeaderText="external_exam" InsertVisible="False" ReadOnly="True" SortExpression="external_exam" />
                                        <asp:BoundField DataField="identifying_marks" HeaderText="identifying_marks" InsertVisible="False" ReadOnly="True" SortExpression="identifying_marks" Visible="false" />
                                        <asp:BoundField DataField="internal_exam" HeaderText="internal_exam" InsertVisible="False" ReadOnly="True" SortExpression="internal_exam" Visible="false" />
                                        <asp:BoundField DataField="reason_of_death" HeaderText="reason_of_death" InsertVisible="False" ReadOnly="True" SortExpression="reason_of_death" Visible="false" />
                                        <asp:BoundField DataField="time_of_death" HeaderText="time_of_death" InsertVisible="False" ReadOnly="True" SortExpression="time_of_death" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="deceased_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [deceased]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_of_autopsy</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="date_of_autopsy_Insert_TextBox" ID="date_of_autopsy_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="date_of_autopsy_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">external_exam</span>
                                <asp:TextBox class="pull-right form-control" ID="external_exam_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">identifying_marks</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="identifying_marks_Insert_TextBox" ID="identifying_marks_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="identifying_marks_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">internal_exam</span>
                                <asp:TextBox class="pull-right form-control" ID="internal_exam_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">reason_of_death</span>
                                <asp:TextBox class="pull-right form-control" ID="reason_of_death_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">time_of_death</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="time_of_death_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="deceased_id"
                                    DataSourceID="deceased_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" />
                                        <asp:BoundField DataField="date_of_autopsy" HeaderText="date_of_autopsy" InsertVisible="False" ReadOnly="True" SortExpression="date_of_autopsy" />
                                        <asp:BoundField DataField="external_exam" HeaderText="external_exam" InsertVisible="False" ReadOnly="True" SortExpression="external_exam" />
                                        <asp:BoundField DataField="identifying_marks" HeaderText="identifying_marks" InsertVisible="False" ReadOnly="True" SortExpression="identifying_marks" Visible="false" />
                                        <asp:BoundField DataField="internal_exam" HeaderText="internal_exam" InsertVisible="False" ReadOnly="True" SortExpression="internal_exam" Visible="false" />
                                        <asp:BoundField DataField="reason_of_death" HeaderText="reason_of_death" InsertVisible="False" ReadOnly="True" SortExpression="reason_of_death" Visible="false" />
                                        <asp:BoundField DataField="time_of_death" HeaderText="time_of_death" InsertVisible="False" ReadOnly="True" SortExpression="time_of_death" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="deceased_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [deceased]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">deceased_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="deceased_id_Update_TextBox" ID="deceased_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="deceased_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_of_autopsy</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="date_of_autopsy_Update_TextBox" ID="date_of_autopsy_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="date_of_autopsy_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">external_exam</span>
                                <asp:TextBox class="pull-right form-control" ID="external_exam_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">identifying_marks</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="identifying_marks_Update_TextBox" ID="identifying_marks_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="identifying_marks_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">internal_exam</span>
                                <asp:TextBox class="pull-right form-control" ID="internal_exam_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">reason_of_death</span>
                                <asp:TextBox class="pull-right form-control" ID="reason_of_death_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">time_of_death</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="time_of_death_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="deceased_id"
                                    DataSourceID="deceased_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" />
                                        <asp:BoundField DataField="date_of_autopsy" HeaderText="date_of_autopsy" InsertVisible="False" ReadOnly="True" SortExpression="date_of_autopsy" />
                                        <asp:BoundField DataField="external_exam" HeaderText="external_exam" InsertVisible="False" ReadOnly="True" SortExpression="external_exam" />
                                        <asp:BoundField DataField="identifying_marks" HeaderText="identifying_marks" InsertVisible="False" ReadOnly="True" SortExpression="identifying_marks" Visible="false" />
                                        <asp:BoundField DataField="internal_exam" HeaderText="internal_exam" InsertVisible="False" ReadOnly="True" SortExpression="internal_exam" Visible="false" />
                                        <asp:BoundField DataField="reason_of_death" HeaderText="reason_of_death" InsertVisible="False" ReadOnly="True" SortExpression="reason_of_death" Visible="false" />
                                        <asp:BoundField DataField="time_of_death" HeaderText="time_of_death" InsertVisible="False" ReadOnly="True" SortExpression="time_of_death" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="deceased_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [deceased]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">deceased_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="deceased_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_of_autopsy</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="date_of_autopsy_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">external_exam</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="external_exam_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">identifying_marks</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="identifying_marks_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">internal_exam</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="internal_exam_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">reason_of_death</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="reason_of_death_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">time_of_death</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="time_of_death_Delete_TextBox" runat="server"></asp:TextBox>
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

