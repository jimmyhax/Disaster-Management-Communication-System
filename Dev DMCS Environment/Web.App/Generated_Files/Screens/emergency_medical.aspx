<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="emergency_medical.aspx.cs" Inherits="Web.App.emergency_medicalClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="emergency_medicalCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>emergency_medical CRUD Operations:</span></h1>
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
                                    DataKeyNames="em_id"
                                    DataSourceID="emergency_medical_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="ambulance_company_name" HeaderText="ambulance_company_name" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_company_name" />
                                        <asp:BoundField DataField="ambulance_identification" HeaderText="ambulance_identification" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_identification" Visible="false" />
                                        <asp:BoundField DataField="appointment_date" HeaderText="appointment_date" InsertVisible="False" ReadOnly="True" SortExpression="appointment_date" Visible="false" />
                                        <asp:BoundField DataField="area_of_specialty" HeaderText="area_of_specialty" InsertVisible="False" ReadOnly="True" SortExpression="area_of_specialty" Visible="false" />
                                        <asp:BoundField DataField="assistance_order" HeaderText="assistance_order" InsertVisible="False" ReadOnly="True" SortExpression="assistance_order" Visible="false" />
                                        <asp:BoundField DataField="date_of_service" HeaderText="date_of_service" InsertVisible="False" ReadOnly="True" SortExpression="date_of_service" Visible="false" />
                                        <asp:BoundField DataField="degree_certifications" HeaderText="degree_certifications" InsertVisible="False" ReadOnly="True" SortExpression="degree_certifications" Visible="false" />
                                        <asp:BoundField DataField="doctor_appointments" HeaderText="doctor_appointments" InsertVisible="False" ReadOnly="True" SortExpression="doctor_appointments" Visible="false" />
                                        <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="doctor_id" Visible="false" />
                                        <asp:BoundField DataField="doctor_start_date" HeaderText="doctor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="doctor_start_date" Visible="false" />
                                        <asp:BoundField DataField="driver_id" HeaderText="driver_id" InsertVisible="False" ReadOnly="True" SortExpression="driver_id" Visible="false" />
                                        <asp:BoundField DataField="educational_institution_name" HeaderText="educational_institution_name" InsertVisible="False" ReadOnly="True" SortExpression="educational_institution_name" Visible="false" />
                                        <asp:BoundField DataField="external_examination" HeaderText="external_examination" InsertVisible="False" ReadOnly="True" SortExpression="external_examination" Visible="false" />
                                        <asp:BoundField DataField="hospital_name" HeaderText="hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="hospital_name" Visible="false" />
                                        <asp:BoundField DataField="internal_examination" HeaderText="internal_examination" InsertVisible="False" ReadOnly="True" SortExpression="internal_examination" Visible="false" />
                                        <asp:BoundField DataField="lights_sirens_to_scene" HeaderText="lights_sirens_to_scene" InsertVisible="False" ReadOnly="True" SortExpression="lights_sirens_to_scene" Visible="false" />
                                        <asp:BoundField DataField="location_type" HeaderText="location_type" InsertVisible="False" ReadOnly="True" SortExpression="location_type" Visible="false" />
                                        <asp:BoundField DataField="number_of_days_admitted" HeaderText="number_of_days_admitted" InsertVisible="False" ReadOnly="True" SortExpression="number_of_days_admitted" Visible="false" />
                                        <asp:BoundField DataField="office_location" HeaderText="office_location" InsertVisible="False" ReadOnly="True" SortExpression="office_location" Visible="false" />
                                        <asp:BoundField DataField="other_remarks" HeaderText="other_remarks" InsertVisible="False" ReadOnly="True" SortExpression="other_remarks" Visible="false" />
                                        <asp:BoundField DataField="prescription_medicines" HeaderText="prescription_medicines" InsertVisible="False" ReadOnly="True" SortExpression="prescription_medicines" Visible="false" />
                                        <asp:BoundField DataField="time_of_service" HeaderText="time_of_service" InsertVisible="False" ReadOnly="True" SortExpression="time_of_service" Visible="false" />
                                        <asp:BoundField DataField="total_cost" HeaderText="total_cost" InsertVisible="False" ReadOnly="True" SortExpression="total_cost" Visible="false" />
                                        <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="emergency_medical_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [emergency_medical]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_id_Insert_TextBox" ID="client_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ambulance_company_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ambulance_company_name_Insert_TextBox" ID="ambulance_company_name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ambulance_company_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ambulance_identification</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ambulance_identification_Insert_TextBox" ID="ambulance_identification_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ambulance_identification_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">appointment_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="appointment_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">area_of_specialty</span>
                                <asp:TextBox class="pull-right form-control" ID="area_of_specialty_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">assistance_order</span>
                                <asp:TextBox class="pull-right form-control" ID="assistance_order_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_of_service</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="date_of_service_Insert_TextBox" ID="date_of_service_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="date_of_service_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">degree_certifications</span>
                                <asp:TextBox class="pull-right form-control" ID="degree_certifications_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_appointments</span>
                                <asp:TextBox class="pull-right form-control" ID="doctor_appointments_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_id</span>
                                <asp:TextBox class="pull-right form-control" ID="doctor_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_start_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="doctor_start_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">driver_id</span>
                                <asp:TextBox class="pull-right form-control" ID="driver_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">educational_institution_name</span>
                                <asp:TextBox class="pull-right form-control" ID="educational_institution_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">external_examination</span>
                                <asp:TextBox class="pull-right form-control" ID="external_examination_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">hospital_name</span>
                                <asp:TextBox class="pull-right form-control" ID="hospital_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">internal_examination</span>
                                <asp:TextBox class="pull-right form-control" ID="internal_examination_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lights_sirens_to_scene</span>
                                <asp:TextBox class="pull-right form-control" ID="lights_sirens_to_scene_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">location_type</span>
                                <asp:TextBox class="pull-right form-control" ID="location_type_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">number_of_days_admitted</span>
                                <asp:TextBox class="pull-right form-control" ID="number_of_days_admitted_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">office_location</span>
                                <asp:TextBox class="pull-right form-control" ID="office_location_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_remarks</span>
                                <asp:TextBox class="pull-right form-control" ID="other_remarks_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prescription_medicines</span>
                                <asp:TextBox class="pull-right form-control" ID="prescription_medicines_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">time_of_service</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="time_of_service_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">total_cost</span>
                                <asp:TextBox class="pull-right form-control" ID="total_cost_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">deceased_id</span>
                                <asp:TextBox class="pull-right form-control" ID="deceased_id_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="em_id"
                                    DataSourceID="emergency_medical_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="ambulance_company_name" HeaderText="ambulance_company_name" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_company_name" />
                                        <asp:BoundField DataField="ambulance_identification" HeaderText="ambulance_identification" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_identification" Visible="false" />
                                        <asp:BoundField DataField="appointment_date" HeaderText="appointment_date" InsertVisible="False" ReadOnly="True" SortExpression="appointment_date" Visible="false" />
                                        <asp:BoundField DataField="area_of_specialty" HeaderText="area_of_specialty" InsertVisible="False" ReadOnly="True" SortExpression="area_of_specialty" Visible="false" />
                                        <asp:BoundField DataField="assistance_order" HeaderText="assistance_order" InsertVisible="False" ReadOnly="True" SortExpression="assistance_order" Visible="false" />
                                        <asp:BoundField DataField="date_of_service" HeaderText="date_of_service" InsertVisible="False" ReadOnly="True" SortExpression="date_of_service" Visible="false" />
                                        <asp:BoundField DataField="degree_certifications" HeaderText="degree_certifications" InsertVisible="False" ReadOnly="True" SortExpression="degree_certifications" Visible="false" />
                                        <asp:BoundField DataField="doctor_appointments" HeaderText="doctor_appointments" InsertVisible="False" ReadOnly="True" SortExpression="doctor_appointments" Visible="false" />
                                        <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="doctor_id" Visible="false" />
                                        <asp:BoundField DataField="doctor_start_date" HeaderText="doctor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="doctor_start_date" Visible="false" />
                                        <asp:BoundField DataField="driver_id" HeaderText="driver_id" InsertVisible="False" ReadOnly="True" SortExpression="driver_id" Visible="false" />
                                        <asp:BoundField DataField="educational_institution_name" HeaderText="educational_institution_name" InsertVisible="False" ReadOnly="True" SortExpression="educational_institution_name" Visible="false" />
                                        <asp:BoundField DataField="external_examination" HeaderText="external_examination" InsertVisible="False" ReadOnly="True" SortExpression="external_examination" Visible="false" />
                                        <asp:BoundField DataField="hospital_name" HeaderText="hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="hospital_name" Visible="false" />
                                        <asp:BoundField DataField="internal_examination" HeaderText="internal_examination" InsertVisible="False" ReadOnly="True" SortExpression="internal_examination" Visible="false" />
                                        <asp:BoundField DataField="lights_sirens_to_scene" HeaderText="lights_sirens_to_scene" InsertVisible="False" ReadOnly="True" SortExpression="lights_sirens_to_scene" Visible="false" />
                                        <asp:BoundField DataField="location_type" HeaderText="location_type" InsertVisible="False" ReadOnly="True" SortExpression="location_type" Visible="false" />
                                        <asp:BoundField DataField="number_of_days_admitted" HeaderText="number_of_days_admitted" InsertVisible="False" ReadOnly="True" SortExpression="number_of_days_admitted" Visible="false" />
                                        <asp:BoundField DataField="office_location" HeaderText="office_location" InsertVisible="False" ReadOnly="True" SortExpression="office_location" Visible="false" />
                                        <asp:BoundField DataField="other_remarks" HeaderText="other_remarks" InsertVisible="False" ReadOnly="True" SortExpression="other_remarks" Visible="false" />
                                        <asp:BoundField DataField="prescription_medicines" HeaderText="prescription_medicines" InsertVisible="False" ReadOnly="True" SortExpression="prescription_medicines" Visible="false" />
                                        <asp:BoundField DataField="time_of_service" HeaderText="time_of_service" InsertVisible="False" ReadOnly="True" SortExpression="time_of_service" Visible="false" />
                                        <asp:BoundField DataField="total_cost" HeaderText="total_cost" InsertVisible="False" ReadOnly="True" SortExpression="total_cost" Visible="false" />
                                        <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="emergency_medical_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [emergency_medical]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">em_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="em_id_Update_TextBox" ID="em_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="em_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_id_Update_TextBox" ID="client_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ambulance_company_name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ambulance_company_name_Update_TextBox" ID="ambulance_company_name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ambulance_company_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ambulance_identification</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="ambulance_identification_Update_TextBox" ID="ambulance_identification_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="ambulance_identification_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">appointment_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="appointment_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">area_of_specialty</span>
                                <asp:TextBox class="pull-right form-control" ID="area_of_specialty_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">assistance_order</span>
                                <asp:TextBox class="pull-right form-control" ID="assistance_order_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_of_service</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="date_of_service_Update_TextBox" ID="date_of_service_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="date_of_service_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">degree_certifications</span>
                                <asp:TextBox class="pull-right form-control" ID="degree_certifications_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_appointments</span>
                                <asp:TextBox class="pull-right form-control" ID="doctor_appointments_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_id</span>
                                <asp:TextBox class="pull-right form-control" ID="doctor_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_start_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="doctor_start_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">driver_id</span>
                                <asp:TextBox class="pull-right form-control" ID="driver_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">educational_institution_name</span>
                                <asp:TextBox class="pull-right form-control" ID="educational_institution_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">external_examination</span>
                                <asp:TextBox class="pull-right form-control" ID="external_examination_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">hospital_name</span>
                                <asp:TextBox class="pull-right form-control" ID="hospital_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">internal_examination</span>
                                <asp:TextBox class="pull-right form-control" ID="internal_examination_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lights_sirens_to_scene</span>
                                <asp:TextBox class="pull-right form-control" ID="lights_sirens_to_scene_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">location_type</span>
                                <asp:TextBox class="pull-right form-control" ID="location_type_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">number_of_days_admitted</span>
                                <asp:TextBox class="pull-right form-control" ID="number_of_days_admitted_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">office_location</span>
                                <asp:TextBox class="pull-right form-control" ID="office_location_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_remarks</span>
                                <asp:TextBox class="pull-right form-control" ID="other_remarks_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prescription_medicines</span>
                                <asp:TextBox class="pull-right form-control" ID="prescription_medicines_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">time_of_service</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="time_of_service_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">total_cost</span>
                                <asp:TextBox class="pull-right form-control" ID="total_cost_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">deceased_id</span>
                                <asp:TextBox class="pull-right form-control" ID="deceased_id_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="em_id"
                                    DataSourceID="emergency_medical_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="ambulance_company_name" HeaderText="ambulance_company_name" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_company_name" />
                                        <asp:BoundField DataField="ambulance_identification" HeaderText="ambulance_identification" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_identification" Visible="false" />
                                        <asp:BoundField DataField="appointment_date" HeaderText="appointment_date" InsertVisible="False" ReadOnly="True" SortExpression="appointment_date" Visible="false" />
                                        <asp:BoundField DataField="area_of_specialty" HeaderText="area_of_specialty" InsertVisible="False" ReadOnly="True" SortExpression="area_of_specialty" Visible="false" />
                                        <asp:BoundField DataField="assistance_order" HeaderText="assistance_order" InsertVisible="False" ReadOnly="True" SortExpression="assistance_order" Visible="false" />
                                        <asp:BoundField DataField="date_of_service" HeaderText="date_of_service" InsertVisible="False" ReadOnly="True" SortExpression="date_of_service" Visible="false" />
                                        <asp:BoundField DataField="degree_certifications" HeaderText="degree_certifications" InsertVisible="False" ReadOnly="True" SortExpression="degree_certifications" Visible="false" />
                                        <asp:BoundField DataField="doctor_appointments" HeaderText="doctor_appointments" InsertVisible="False" ReadOnly="True" SortExpression="doctor_appointments" Visible="false" />
                                        <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="doctor_id" Visible="false" />
                                        <asp:BoundField DataField="doctor_start_date" HeaderText="doctor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="doctor_start_date" Visible="false" />
                                        <asp:BoundField DataField="driver_id" HeaderText="driver_id" InsertVisible="False" ReadOnly="True" SortExpression="driver_id" Visible="false" />
                                        <asp:BoundField DataField="educational_institution_name" HeaderText="educational_institution_name" InsertVisible="False" ReadOnly="True" SortExpression="educational_institution_name" Visible="false" />
                                        <asp:BoundField DataField="external_examination" HeaderText="external_examination" InsertVisible="False" ReadOnly="True" SortExpression="external_examination" Visible="false" />
                                        <asp:BoundField DataField="hospital_name" HeaderText="hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="hospital_name" Visible="false" />
                                        <asp:BoundField DataField="internal_examination" HeaderText="internal_examination" InsertVisible="False" ReadOnly="True" SortExpression="internal_examination" Visible="false" />
                                        <asp:BoundField DataField="lights_sirens_to_scene" HeaderText="lights_sirens_to_scene" InsertVisible="False" ReadOnly="True" SortExpression="lights_sirens_to_scene" Visible="false" />
                                        <asp:BoundField DataField="location_type" HeaderText="location_type" InsertVisible="False" ReadOnly="True" SortExpression="location_type" Visible="false" />
                                        <asp:BoundField DataField="number_of_days_admitted" HeaderText="number_of_days_admitted" InsertVisible="False" ReadOnly="True" SortExpression="number_of_days_admitted" Visible="false" />
                                        <asp:BoundField DataField="office_location" HeaderText="office_location" InsertVisible="False" ReadOnly="True" SortExpression="office_location" Visible="false" />
                                        <asp:BoundField DataField="other_remarks" HeaderText="other_remarks" InsertVisible="False" ReadOnly="True" SortExpression="other_remarks" Visible="false" />
                                        <asp:BoundField DataField="prescription_medicines" HeaderText="prescription_medicines" InsertVisible="False" ReadOnly="True" SortExpression="prescription_medicines" Visible="false" />
                                        <asp:BoundField DataField="time_of_service" HeaderText="time_of_service" InsertVisible="False" ReadOnly="True" SortExpression="time_of_service" Visible="false" />
                                        <asp:BoundField DataField="total_cost" HeaderText="total_cost" InsertVisible="False" ReadOnly="True" SortExpression="total_cost" Visible="false" />
                                        <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="emergency_medical_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [emergency_medical]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">em_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="em_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ambulance_company_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ambulance_company_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ambulance_identification</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ambulance_identification_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">appointment_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="appointment_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">area_of_specialty</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="area_of_specialty_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">assistance_order</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="assistance_order_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">date_of_service</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="date_of_service_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">degree_certifications</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="degree_certifications_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_appointments</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="doctor_appointments_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="doctor_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">doctor_start_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="doctor_start_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">driver_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="driver_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">educational_institution_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="educational_institution_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">external_examination</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="external_examination_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">hospital_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="hospital_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">internal_examination</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="internal_examination_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">lights_sirens_to_scene</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="lights_sirens_to_scene_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">location_type</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="location_type_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">number_of_days_admitted</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="number_of_days_admitted_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">office_location</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="office_location_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">other_remarks</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="other_remarks_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">prescription_medicines</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="prescription_medicines_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">time_of_service</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="time_of_service_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">total_cost</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="total_cost_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">deceased_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="deceased_id_Delete_TextBox" runat="server"></asp:TextBox>
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

