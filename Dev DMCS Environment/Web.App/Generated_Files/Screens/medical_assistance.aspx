<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="medical_assistance.aspx.cs" Inherits="Web.App.medical_assistanceClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="medical_assistanceCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>medical_assistance CRUD Operations:</span></h1>
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
                                    DataKeyNames="medical_assist_order_id"
                                    DataSourceID="medical_assistance_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="medical_assist_order_id" HeaderText="medical_assist_order_id" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_order_id" />
                                        <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                                        <asp:BoundField DataField="medical_assist_date" HeaderText="medical_assist_date" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_date" />
                                        <asp:BoundField DataField="medical_assist_doctor_id" HeaderText="medical_assist_doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_doctor_id" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_hosp_price" HeaderText="medical_assist_hosp_price" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_hosp_price" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_hospital_name" HeaderText="medical_assist_hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_hospital_name" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_meds" HeaderText="medical_assist_script_meds" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_meds" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_price" HeaderText="medical_assist_script_price" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_price" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_quantity" HeaderText="medical_assist_script_quantity" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_quantity" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="medical_assistance_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [medical_assistance]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">em_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="em_id_Insert_TextBox" ID="em_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="em_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="medical_assist_date_Insert_TextBox" ID="medical_assist_date_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="medical_assist_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_doctor_id</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_doctor_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_hosp_price</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_hosp_price_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_hospital_name</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_hospital_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_meds</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_script_meds_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_price</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_script_price_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_script_quantity_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="medical_assist_order_id"
                                    DataSourceID="medical_assistance_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="medical_assist_order_id" HeaderText="medical_assist_order_id" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_order_id" />
                                        <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                                        <asp:BoundField DataField="medical_assist_date" HeaderText="medical_assist_date" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_date" />
                                        <asp:BoundField DataField="medical_assist_doctor_id" HeaderText="medical_assist_doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_doctor_id" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_hosp_price" HeaderText="medical_assist_hosp_price" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_hosp_price" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_hospital_name" HeaderText="medical_assist_hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_hospital_name" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_meds" HeaderText="medical_assist_script_meds" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_meds" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_price" HeaderText="medical_assist_script_price" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_price" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_quantity" HeaderText="medical_assist_script_quantity" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_quantity" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="medical_assistance_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [medical_assistance]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_order_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="medical_assist_order_id_Update_TextBox" ID="medical_assist_order_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_order_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">em_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="em_id_Update_TextBox" ID="em_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="em_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_date</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="medical_assist_date_Update_TextBox" ID="medical_assist_date_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="medical_assist_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_doctor_id</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_doctor_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_hosp_price</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_hosp_price_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_hospital_name</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_hospital_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_meds</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_script_meds_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_price</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_script_price_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="medical_assist_script_quantity_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="medical_assist_order_id"
                                    DataSourceID="medical_assistance_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="medical_assist_order_id" HeaderText="medical_assist_order_id" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_order_id" />
                                        <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                                        <asp:BoundField DataField="medical_assist_date" HeaderText="medical_assist_date" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_date" />
                                        <asp:BoundField DataField="medical_assist_doctor_id" HeaderText="medical_assist_doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_doctor_id" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_hosp_price" HeaderText="medical_assist_hosp_price" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_hosp_price" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_hospital_name" HeaderText="medical_assist_hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_hospital_name" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_meds" HeaderText="medical_assist_script_meds" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_meds" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_price" HeaderText="medical_assist_script_price" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_price" Visible="false" />
                                        <asp:BoundField DataField="medical_assist_script_quantity" HeaderText="medical_assist_script_quantity" InsertVisible="False" ReadOnly="True" SortExpression="medical_assist_script_quantity" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="medical_assistance_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [medical_assistance]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_order_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="medical_assist_order_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">em_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="em_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="medical_assist_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_doctor_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="medical_assist_doctor_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_hosp_price</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="medical_assist_hosp_price_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_hospital_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="medical_assist_hospital_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_meds</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="medical_assist_script_meds_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_price</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="medical_assist_script_price_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">medical_assist_script_quantity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="medical_assist_script_quantity_Delete_TextBox" runat="server"></asp:TextBox>
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

