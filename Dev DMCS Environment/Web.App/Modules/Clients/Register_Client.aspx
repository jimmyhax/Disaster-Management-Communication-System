<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register_Client.aspx.cs" Inherits="Web.App.Modules.Clients.Register_Client" EnableEventValidation="True" ValidateRequest="True" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="ScriptGeneratorTemplateCtrl">
        <div class="body-header">
            <a class="back-link" href="<asp:Literal runat="server" Text="<%$RouteUrl:RouteName=Home%>" />"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Register A New Client</span></h1>
        </div>
        <div class="body-contents col-lg-12">
            <ajaxToolkit:TabContainer ID="TabContainer" runat="server" ActiveTabIndex="0" Height="100%" UseVerticalStripPlacement="True">
                <ajaxToolkit:TabPanel runat="server" HeaderText="General" ID="General_Tab">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="input-group-header"><h3>Identity Information</h3>
                                <div class="faded_devider"></div>
                            </div>

                            <ajaxToolkit:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="0" Height="100%">

                                <!-- Person -->
                                <ajaxToolkit:TabPanel runat="server" HeaderText="Person" ID="Insert_Person_Tab">
                                    <ContentTemplate>
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
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>

                                <!-- Client -->
                                <ajaxToolkit:TabPanel runat="server" HeaderText="Client" ID="Insert_Client_Tab">
                                    <ContentTemplate>
                                        <div class="col-lg-12">
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">client_status</span>
                                          <div class="required-container">
                                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_status_Insert_TextBox" ID="client_status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                          </div>
                                                <asp:TextBox class="pull-right form-control" ID="client_status_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">ethnicity</span>
                                                <asp:TextBox class="pull-right form-control" ID="ethnicity_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">eye_color</span>
                                                <asp:TextBox class="pull-right form-control" ID="eye_color_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">hair_color</span>
                                                <asp:TextBox class="pull-right form-control" ID="hair_color_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">height</span>
                                                <asp:TextBox class="pull-right form-control" ID="height_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">picture</span>
                                                 <asp:Image ID="picture_Insert_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                                 <asp:FileUpload ID="picture_Insert_FileUpload" runat="server" />
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">weight</span>
                                                <asp:TextBox class="pull-right form-control" ID="weight_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">skin_color</span>
                                                <asp:TextBox class="pull-right form-control" ID="skin_color_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">Info_Field</span>
                                                <asp:TextBox class="pull-right form-control" ID="Info_Field_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">Client_Shelter_ID</span>
                                                <asp:TextBox class="pull-right form-control" ID="Client_Shelter_ID_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">Emergency_Contact_Name</span>
                                                <asp:TextBox class="pull-right form-control" ID="Emergency_Contact_Name_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">Emergency_Contact_Number</span>
                                                <asp:TextBox class="pull-right form-control" ID="Emergency_Contact_Number_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">Subscribed_Alerts</span>
                                          <div class="required-container">
                                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Subscribed_Alerts_Insert_TextBox" ID="Subscribed_Alerts_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                          </div>
                                                <asp:TextBox class="pull-right form-control" ID="Subscribed_Alerts_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="bottom-btn-container col-lg-12">
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                                
                                <!-- Address -->
                                <ajaxToolkit:TabPanel runat="server" HeaderText="Address" ID="Insert_address_Tab">
                                    <ContentTemplate>
                                        <div class="col-lg-12">
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">address_type_id</span>
                                          <div class="required-container">
                                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="address_type_id_Insert_TextBox" ID="address_type_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                          </div>
                                                <asp:TextBox class="pull-right form-control" ID="address_type_id_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">city</span>
                                          <div class="required-container">
                                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="city_Insert_TextBox" ID="city_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                          </div>
                                                <asp:TextBox class="pull-right form-control" ID="city_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">country</span>
                                          <div class="required-container">
                                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="country_Insert_TextBox" ID="country_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
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
                                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="state_Insert_TextBox" ID="state_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                                          </div>
                                                <asp:TextBox class="pull-right form-control" ID="state_Insert_TextBox" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group text-center form-group">
                                                <span class="pull-left">str_add</span>
                                          <div class="required-container">
                                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="str_add_Insert_TextBox" ID="str_add_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
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
                                        </div>
                                        <hr />
                                        <div class="bottom-btn-container col-lg-12">
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                            </ajaxToolkit:TabContainer>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Case History" ID="CaseHistory_Tab">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="input-group-header"><h3>Case History</h3>
                                <div class="faded_devider"></div>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">First Name</span>
                                <asp:TextBox class="pull-right form-control" ID="TextBox1" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Pets" ID="Pets_Tab">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="input-group-header"><h3>Pet Information</h3>
                                <div class="faded_devider"></div>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">First Name</span>
                                <asp:TextBox class="pull-right form-control" ID="TextBox5" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Vehicles" ID="Vehicles_Tab">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="input-group-header"><h3>Vehicle Information</h3>
                                <div class="faded_devider"></div>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">First Name</span>
                                <asp:TextBox class="pull-right form-control" ID="TextBox2" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Income" ID="Income_Tab">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="input-group-header"><h3>Income Information</h3>
                                <div class="faded_devider"></div>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">First Name</span>
                                <asp:TextBox class="pull-right form-control" ID="TextBox3" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Military" ID="Military_Tab">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="input-group-header"><h3>Military Information</h3>
                                <div class="faded_devider"></div>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">First Name</span>
                                <asp:TextBox class="pull-right form-control" ID="TextBox4" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>

        </div>
    </div>


</asp:Content>