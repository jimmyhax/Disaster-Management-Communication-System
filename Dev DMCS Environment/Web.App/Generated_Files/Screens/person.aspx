<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="person.aspx.cs" Inherits="Web.App.personClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="personCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>person CRUD Operations:</span></h1>
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
                                    DataKeyNames="person_id"
                                    DataSourceID="person_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_id2" HeaderText="address_id2" InsertVisible="False" ReadOnly="True" SortExpression="address_id2" Visible="false" />
                                        <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                                        <asp:BoundField DataField="certification_number" HeaderText="certification_number" InsertVisible="False" ReadOnly="True" SortExpression="certification_number" Visible="false" />
                                        <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" Visible="false" />
                                        <asp:BoundField DataField="m_initial" HeaderText="m_initial" InsertVisible="False" ReadOnly="True" SortExpression="m_initial" Visible="false" />
                                        <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                                        <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                                        <asp:BoundField DataField="person_type" HeaderText="person_type" InsertVisible="False" ReadOnly="True" SortExpression="person_type" Visible="false" />
                                        <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                                        <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" InsertVisible="False" ReadOnly="True" SortExpression="phone_secondary" Visible="false" />
                                        <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                                        <asp:BoundField DataField="ssn" HeaderText="ssn" InsertVisible="False" ReadOnly="True" SortExpression="ssn" Visible="false" />
                                        <asp:BoundField DataField="Maiden_Name" HeaderText="Maiden_Name" InsertVisible="False" ReadOnly="True" SortExpression="Maiden_Name" Visible="false" />
                                        <asp:BoundField DataField="Visa_Issue_Date" HeaderText="Visa_Issue_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Issue_Date" Visible="false" />
                                        <asp:BoundField DataField="Visa_Expire_Date" HeaderText="Visa_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Expire_Date" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B1" HeaderText="Visa_Selected_Value_B1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B2" HeaderText="Visa_Selected_Value_B2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_K1" HeaderText="Visa_Selected_Value_K1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_K3" HeaderText="Visa_Selected_Value_K3" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K3" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_L1" HeaderText="Visa_Selected_Value_L1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_L2" HeaderText="Visa_Selected_Value_L2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H4" HeaderText="Visa_Selected_Value_H4" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H4" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_F1" HeaderText="Visa_Selected_Value_F1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_F1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_J1" HeaderText="Visa_Selected_Value_J1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_J1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_M1" HeaderText="Visa_Selected_Value_M1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_M1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H_1B" HeaderText="Visa_Selected_Value_H_1B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_1B" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H_2B" HeaderText="Visa_Selected_Value_H_2B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_2B" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B_2" HeaderText="Visa_Selected_Value_B_2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B_2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_Schengen" HeaderText="Visa_Selected_Value_Schengen" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_Schengen" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Resid_Date" HeaderText="Perm_Resident_Alien_Resid_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Resid_Date" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Expire_Date" HeaderText="Perm_Resident_Alien_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Expire_Date" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_A_number" HeaderText="Perm_Resident_Alien_A_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_A_number" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_USCIS_number" HeaderText="Perm_Resident_Alien_USCIS_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_USCIS_number" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Birth_Country" HeaderText="Perm_Resident_Alien_Birth_Country" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Birth_Country" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Category" HeaderText="Perm_Resident_Alien_Category" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Category" Visible="false" />
                                        <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver_State_ID" InsertVisible="False" ReadOnly="True" SortExpression="Driver_State_ID" Visible="false" />
                                        <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" InsertVisible="False" ReadOnly="True" SortExpression="Citizenship" Visible="false" />
                                        <asp:BoundField DataField="Marital_Status" HeaderText="Marital_Status" InsertVisible="False" ReadOnly="True" SortExpression="Marital_Status" Visible="false" />
                                        <asp:BoundField DataField="Minor_Children" HeaderText="Minor_Children" InsertVisible="False" ReadOnly="True" SortExpression="Minor_Children" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="person_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [person]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Resource_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Insert_TextBox" ID="address_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id2</span>
                                <asp:TextBox class="pull-right form-control" ID="address_id2_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">birthdate</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="birthdate_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">certification_number</span>
                                <asp:TextBox class="pull-right form-control" ID="certification_number_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">f_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="f_name_Insert_TextBox" ID="f_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="f_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">m_initial</span>
                                <asp:TextBox class="pull-right form-control" ID="m_initial_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">l_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="l_name_Insert_TextBox" ID="l_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="l_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gender</span>
                                <asp:TextBox class="pull-right form-control" ID="gender_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">person_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="person_type_Insert_TextBox" ID="person_type_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="person_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_primary</span>
                                <asp:TextBox class="pull-right form-control" ID="phone_primary_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_secondary</span>
                                <asp:TextBox class="pull-right form-control" ID="phone_secondary_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">email</span>
                                <asp:TextBox class="pull-right form-control" ID="email_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ssn</span>
                                <asp:TextBox class="pull-right form-control" ID="ssn_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Maiden_Name</span>
                                <asp:TextBox class="pull-right form-control" ID="Maiden_Name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Issue_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Visa_Issue_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Expire_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Visa_Expire_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_B1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B2</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_B2_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_K1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_K1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_K3</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_K3_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_L1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_L1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_L2</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_L2_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H4</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_H4_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_F1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_F1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_J1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_J1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_M1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_M1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H_1B</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_H_1B_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H_2B</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_H_2B_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B_2</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_B_2_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_Schengen</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_Schengen_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Resid_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Perm_Resident_Alien_Resid_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Expire_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Perm_Resident_Alien_Expire_Date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_A_number</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_A_number_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_USCIS_number</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_USCIS_number_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Birth_Country</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_Birth_Country_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Category</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_Category_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Driver_State_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Driver_State_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Citizenship</span>
                                <asp:TextBox class="pull-right form-control" ID="Citizenship_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Marital_Status</span>
                                <asp:TextBox class="pull-right form-control" ID="Marital_Status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Minor_Children</span>
                                <asp:TextBox class="pull-right form-control" ID="Minor_Children_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="person_id"
                                    DataSourceID="person_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_id2" HeaderText="address_id2" InsertVisible="False" ReadOnly="True" SortExpression="address_id2" Visible="false" />
                                        <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                                        <asp:BoundField DataField="certification_number" HeaderText="certification_number" InsertVisible="False" ReadOnly="True" SortExpression="certification_number" Visible="false" />
                                        <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" Visible="false" />
                                        <asp:BoundField DataField="m_initial" HeaderText="m_initial" InsertVisible="False" ReadOnly="True" SortExpression="m_initial" Visible="false" />
                                        <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                                        <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                                        <asp:BoundField DataField="person_type" HeaderText="person_type" InsertVisible="False" ReadOnly="True" SortExpression="person_type" Visible="false" />
                                        <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                                        <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" InsertVisible="False" ReadOnly="True" SortExpression="phone_secondary" Visible="false" />
                                        <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                                        <asp:BoundField DataField="ssn" HeaderText="ssn" InsertVisible="False" ReadOnly="True" SortExpression="ssn" Visible="false" />
                                        <asp:BoundField DataField="Maiden_Name" HeaderText="Maiden_Name" InsertVisible="False" ReadOnly="True" SortExpression="Maiden_Name" Visible="false" />
                                        <asp:BoundField DataField="Visa_Issue_Date" HeaderText="Visa_Issue_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Issue_Date" Visible="false" />
                                        <asp:BoundField DataField="Visa_Expire_Date" HeaderText="Visa_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Expire_Date" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B1" HeaderText="Visa_Selected_Value_B1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B2" HeaderText="Visa_Selected_Value_B2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_K1" HeaderText="Visa_Selected_Value_K1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_K3" HeaderText="Visa_Selected_Value_K3" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K3" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_L1" HeaderText="Visa_Selected_Value_L1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_L2" HeaderText="Visa_Selected_Value_L2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H4" HeaderText="Visa_Selected_Value_H4" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H4" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_F1" HeaderText="Visa_Selected_Value_F1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_F1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_J1" HeaderText="Visa_Selected_Value_J1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_J1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_M1" HeaderText="Visa_Selected_Value_M1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_M1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H_1B" HeaderText="Visa_Selected_Value_H_1B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_1B" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H_2B" HeaderText="Visa_Selected_Value_H_2B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_2B" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B_2" HeaderText="Visa_Selected_Value_B_2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B_2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_Schengen" HeaderText="Visa_Selected_Value_Schengen" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_Schengen" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Resid_Date" HeaderText="Perm_Resident_Alien_Resid_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Resid_Date" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Expire_Date" HeaderText="Perm_Resident_Alien_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Expire_Date" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_A_number" HeaderText="Perm_Resident_Alien_A_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_A_number" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_USCIS_number" HeaderText="Perm_Resident_Alien_USCIS_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_USCIS_number" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Birth_Country" HeaderText="Perm_Resident_Alien_Birth_Country" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Birth_Country" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Category" HeaderText="Perm_Resident_Alien_Category" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Category" Visible="false" />
                                        <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver_State_ID" InsertVisible="False" ReadOnly="True" SortExpression="Driver_State_ID" Visible="false" />
                                        <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" InsertVisible="False" ReadOnly="True" SortExpression="Citizenship" Visible="false" />
                                        <asp:BoundField DataField="Marital_Status" HeaderText="Marital_Status" InsertVisible="False" ReadOnly="True" SortExpression="Marital_Status" Visible="false" />
                                        <asp:BoundField DataField="Minor_Children" HeaderText="Minor_Children" InsertVisible="False" ReadOnly="True" SortExpression="Minor_Children" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="person_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [person]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">person_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="person_id_Update_TextBox" ID="person_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="person_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Resource_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_id_Update_TextBox" ID="address_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="address_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id2</span>
                                <asp:TextBox class="pull-right form-control" ID="address_id2_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">birthdate</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="birthdate_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">certification_number</span>
                                <asp:TextBox class="pull-right form-control" ID="certification_number_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">f_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="f_name_Update_TextBox" ID="f_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="f_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">m_initial</span>
                                <asp:TextBox class="pull-right form-control" ID="m_initial_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">l_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="l_name_Update_TextBox" ID="l_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="l_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gender</span>
                                <asp:TextBox class="pull-right form-control" ID="gender_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">person_type</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="person_type_Update_TextBox" ID="person_type_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="person_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_primary</span>
                                <asp:TextBox class="pull-right form-control" ID="phone_primary_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_secondary</span>
                                <asp:TextBox class="pull-right form-control" ID="phone_secondary_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">email</span>
                                <asp:TextBox class="pull-right form-control" ID="email_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ssn</span>
                                <asp:TextBox class="pull-right form-control" ID="ssn_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Maiden_Name</span>
                                <asp:TextBox class="pull-right form-control" ID="Maiden_Name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Issue_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Visa_Issue_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Expire_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Visa_Expire_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_B1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B2</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_B2_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_K1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_K1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_K3</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_K3_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_L1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_L1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_L2</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_L2_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H4</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_H4_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_F1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_F1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_J1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_J1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_M1</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_M1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H_1B</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_H_1B_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H_2B</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_H_2B_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B_2</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_B_2_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_Schengen</span>
                                <asp:TextBox class="pull-right form-control" ID="Visa_Selected_Value_Schengen_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Resid_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Perm_Resident_Alien_Resid_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Expire_Date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Perm_Resident_Alien_Expire_Date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_A_number</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_A_number_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_USCIS_number</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_USCIS_number_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Birth_Country</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_Birth_Country_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Category</span>
                                <asp:TextBox class="pull-right form-control" ID="Perm_Resident_Alien_Category_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Driver_State_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Driver_State_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Citizenship</span>
                                <asp:TextBox class="pull-right form-control" ID="Citizenship_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Marital_Status</span>
                                <asp:TextBox class="pull-right form-control" ID="Marital_Status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Minor_Children</span>
                                <asp:TextBox class="pull-right form-control" ID="Minor_Children_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="person_id"
                                    DataSourceID="person_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                                        <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                                        <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                                        <asp:BoundField DataField="address_id2" HeaderText="address_id2" InsertVisible="False" ReadOnly="True" SortExpression="address_id2" Visible="false" />
                                        <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                                        <asp:BoundField DataField="certification_number" HeaderText="certification_number" InsertVisible="False" ReadOnly="True" SortExpression="certification_number" Visible="false" />
                                        <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" Visible="false" />
                                        <asp:BoundField DataField="m_initial" HeaderText="m_initial" InsertVisible="False" ReadOnly="True" SortExpression="m_initial" Visible="false" />
                                        <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                                        <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                                        <asp:BoundField DataField="person_type" HeaderText="person_type" InsertVisible="False" ReadOnly="True" SortExpression="person_type" Visible="false" />
                                        <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                                        <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" InsertVisible="False" ReadOnly="True" SortExpression="phone_secondary" Visible="false" />
                                        <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                                        <asp:BoundField DataField="ssn" HeaderText="ssn" InsertVisible="False" ReadOnly="True" SortExpression="ssn" Visible="false" />
                                        <asp:BoundField DataField="Maiden_Name" HeaderText="Maiden_Name" InsertVisible="False" ReadOnly="True" SortExpression="Maiden_Name" Visible="false" />
                                        <asp:BoundField DataField="Visa_Issue_Date" HeaderText="Visa_Issue_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Issue_Date" Visible="false" />
                                        <asp:BoundField DataField="Visa_Expire_Date" HeaderText="Visa_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Expire_Date" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B1" HeaderText="Visa_Selected_Value_B1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B2" HeaderText="Visa_Selected_Value_B2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_K1" HeaderText="Visa_Selected_Value_K1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_K3" HeaderText="Visa_Selected_Value_K3" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K3" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_L1" HeaderText="Visa_Selected_Value_L1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_L2" HeaderText="Visa_Selected_Value_L2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H4" HeaderText="Visa_Selected_Value_H4" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H4" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_F1" HeaderText="Visa_Selected_Value_F1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_F1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_J1" HeaderText="Visa_Selected_Value_J1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_J1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_M1" HeaderText="Visa_Selected_Value_M1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_M1" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H_1B" HeaderText="Visa_Selected_Value_H_1B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_1B" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_H_2B" HeaderText="Visa_Selected_Value_H_2B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_2B" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_B_2" HeaderText="Visa_Selected_Value_B_2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B_2" Visible="false" />
                                        <asp:BoundField DataField="Visa_Selected_Value_Schengen" HeaderText="Visa_Selected_Value_Schengen" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_Schengen" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Resid_Date" HeaderText="Perm_Resident_Alien_Resid_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Resid_Date" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Expire_Date" HeaderText="Perm_Resident_Alien_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Expire_Date" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_A_number" HeaderText="Perm_Resident_Alien_A_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_A_number" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_USCIS_number" HeaderText="Perm_Resident_Alien_USCIS_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_USCIS_number" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Birth_Country" HeaderText="Perm_Resident_Alien_Birth_Country" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Birth_Country" Visible="false" />
                                        <asp:BoundField DataField="Perm_Resident_Alien_Category" HeaderText="Perm_Resident_Alien_Category" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Category" Visible="false" />
                                        <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver_State_ID" InsertVisible="False" ReadOnly="True" SortExpression="Driver_State_ID" Visible="false" />
                                        <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" InsertVisible="False" ReadOnly="True" SortExpression="Citizenship" Visible="false" />
                                        <asp:BoundField DataField="Marital_Status" HeaderText="Marital_Status" InsertVisible="False" ReadOnly="True" SortExpression="Marital_Status" Visible="false" />
                                        <asp:BoundField DataField="Minor_Children" HeaderText="Minor_Children" InsertVisible="False" ReadOnly="True" SortExpression="Minor_Children" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="person_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [person]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">person_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="person_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Resource_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Resource_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">address_id2</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="address_id2_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">birthdate</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="birthdate_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">certification_number</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="certification_number_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">f_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="f_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">m_initial</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="m_initial_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">l_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="l_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">gender</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="gender_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">person_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="person_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_primary</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="phone_primary_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">phone_secondary</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="phone_secondary_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">email</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="email_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ssn</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ssn_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Maiden_Name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Maiden_Name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Issue_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Visa_Issue_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Expire_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Visa_Expire_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B1</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_B1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B2</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_B2_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_K1</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_K1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_K3</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_K3_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_L1</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_L1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_L2</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_L2_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H4</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_H4_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_F1</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_F1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_J1</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_J1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_M1</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_M1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H_1B</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_H_1B_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_H_2B</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_H_2B_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_B_2</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_B_2_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Visa_Selected_Value_Schengen</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Visa_Selected_Value_Schengen_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Resid_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Perm_Resident_Alien_Resid_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Expire_Date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Perm_Resident_Alien_Expire_Date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_A_number</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Perm_Resident_Alien_A_number_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_USCIS_number</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Perm_Resident_Alien_USCIS_number_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Birth_Country</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Perm_Resident_Alien_Birth_Country_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Perm_Resident_Alien_Category</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Perm_Resident_Alien_Category_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Driver_State_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Driver_State_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Citizenship</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Citizenship_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Marital_Status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Marital_Status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Minor_Children</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Minor_Children_Delete_TextBox" runat="server"></asp:TextBox>
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

