<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="encounter_client_vaccine.aspx.cs" Inherits="Web.App.encounter_client_vaccineClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="encounter_client_vaccineCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>encounter_client_vaccine CRUD Operations:</span></h1>
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
                                    DataKeyNames="encounter_id"
                                    DataSourceID="encounter_client_vaccine_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="vaccine_id" HeaderText="vaccine_id" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_id" />
                                        <asp:BoundField DataField="current_client_medicine" HeaderText="current_client_medicine" InsertVisible="False" ReadOnly="True" SortExpression="current_client_medicine" />
                                        <asp:BoundField DataField="assistance" HeaderText="assistance" InsertVisible="False" ReadOnly="True" SortExpression="assistance" Visible="false" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="Under_six_months_old" HeaderText="Under_six_months_old" InsertVisible="False" ReadOnly="True" SortExpression="Under_six_months_old" Visible="false" />
                                        <asp:BoundField DataField="pregnant" HeaderText="pregnant" InsertVisible="False" ReadOnly="True" SortExpression="pregnant" Visible="false" />
                                        <asp:BoundField DataField="children" HeaderText="children" InsertVisible="False" ReadOnly="True" SortExpression="children" Visible="false" />
                                        <asp:BoundField DataField="occupation" HeaderText="occupation" InsertVisible="False" ReadOnly="True" SortExpression="occupation" Visible="false" />
                                        <asp:BoundField DataField="chronic_disease" HeaderText="chronic_disease" InsertVisible="False" ReadOnly="True" SortExpression="chronic_disease" Visible="false" />
                                        <asp:BoundField DataField="qualify" HeaderText="qualify" InsertVisible="False" ReadOnly="True" SortExpression="qualify" Visible="false" />
                                        <asp:BoundField DataField="dose_date1" HeaderText="dose_date1" InsertVisible="False" ReadOnly="True" SortExpression="dose_date1" Visible="false" />
                                        <asp:BoundField DataField="dose_date2" HeaderText="dose_date2" InsertVisible="False" ReadOnly="True" SortExpression="dose_date2" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="vaccine_admin" HeaderText="vaccine_admin" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_admin" Visible="false" />
                                        <asp:BoundField DataField="guardian_f_name" HeaderText="guardian_f_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_f_name" Visible="false" />
                                        <asp:BoundField DataField="guardian_l_name" HeaderText="guardian_l_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_l_name" Visible="false" />
                                        <asp:BoundField DataField="guardian_mi" HeaderText="guardian_mi" InsertVisible="False" ReadOnly="True" SortExpression="guardian_mi" Visible="false" />
                                        <asp:BoundField DataField="guardian_phone" HeaderText="guardian_phone" InsertVisible="False" ReadOnly="True" SortExpression="guardian_phone" Visible="false" />
                                        <asp:BoundField DataField="adult_consent_date" HeaderText="adult_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="adult_consent_date" Visible="false" />
                                        <asp:BoundField DataField="guard_consent_date" HeaderText="guard_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="guard_consent_date" Visible="false" />
                                        <asp:BoundField DataField="dose_form1" HeaderText="dose_form1" InsertVisible="False" ReadOnly="True" SortExpression="dose_form1" Visible="false" />
                                        <asp:BoundField DataField="dose_form2" HeaderText="dose_form2" InsertVisible="False" ReadOnly="True" SortExpression="dose_form2" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_client_vaccine_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter_client_vaccine]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vaccine_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vaccine_id_Insert_TextBox" ID="vaccine_id_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vaccine_id_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">current_client_medicine</span>
                                <asp:TextBox class="pull-right form-control" ID="current_client_medicine_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">assistance</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="assistance_Insert_TextBox" ID="assistance_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="assistance_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="quantity_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Under_six_months_old</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Under_six_months_old_Insert_TextBox" ID="Under_six_months_old_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Under_six_months_old_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pregnant</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="pregnant_Insert_TextBox" ID="pregnant_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="pregnant_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">children</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="children_Insert_TextBox" ID="children_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="children_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">occupation</span>
                                <asp:TextBox class="pull-right form-control" ID="occupation_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">chronic_disease</span>
                                <asp:TextBox class="pull-right form-control" ID="chronic_disease_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qualify</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qualify_Insert_TextBox" ID="qualify_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qualify_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_date1</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="dose_date1_Insert_TextBox" ID="dose_date1_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="dose_date1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_date2</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="dose_date2_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">adult_consent</span>
                                 <asp:Image ID="adult_consent_Insert_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload ID="adult_consent_Insert_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_consent</span>
                                 <asp:Image ID="guardian_consent_Insert_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload ID="guardian_consent_Insert_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vaccine_admin</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vaccine_admin_Insert_TextBox" ID="vaccine_admin_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="vaccine_admin_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_f_name</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_f_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_l_name</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_l_name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_mi</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_mi_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_phone_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">adult_consent_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="adult_consent_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guard_consent_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="guard_consent_date_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_form1</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="dose_form1_Insert_TextBox" ID="dose_form1_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="dose_form1_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_form2</span>
                                <asp:TextBox class="pull-right form-control" ID="dose_form2_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="encounter_id"
                                    DataSourceID="encounter_client_vaccine_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="vaccine_id" HeaderText="vaccine_id" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_id" />
                                        <asp:BoundField DataField="current_client_medicine" HeaderText="current_client_medicine" InsertVisible="False" ReadOnly="True" SortExpression="current_client_medicine" />
                                        <asp:BoundField DataField="assistance" HeaderText="assistance" InsertVisible="False" ReadOnly="True" SortExpression="assistance" Visible="false" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="Under_six_months_old" HeaderText="Under_six_months_old" InsertVisible="False" ReadOnly="True" SortExpression="Under_six_months_old" Visible="false" />
                                        <asp:BoundField DataField="pregnant" HeaderText="pregnant" InsertVisible="False" ReadOnly="True" SortExpression="pregnant" Visible="false" />
                                        <asp:BoundField DataField="children" HeaderText="children" InsertVisible="False" ReadOnly="True" SortExpression="children" Visible="false" />
                                        <asp:BoundField DataField="occupation" HeaderText="occupation" InsertVisible="False" ReadOnly="True" SortExpression="occupation" Visible="false" />
                                        <asp:BoundField DataField="chronic_disease" HeaderText="chronic_disease" InsertVisible="False" ReadOnly="True" SortExpression="chronic_disease" Visible="false" />
                                        <asp:BoundField DataField="qualify" HeaderText="qualify" InsertVisible="False" ReadOnly="True" SortExpression="qualify" Visible="false" />
                                        <asp:BoundField DataField="dose_date1" HeaderText="dose_date1" InsertVisible="False" ReadOnly="True" SortExpression="dose_date1" Visible="false" />
                                        <asp:BoundField DataField="dose_date2" HeaderText="dose_date2" InsertVisible="False" ReadOnly="True" SortExpression="dose_date2" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="vaccine_admin" HeaderText="vaccine_admin" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_admin" Visible="false" />
                                        <asp:BoundField DataField="guardian_f_name" HeaderText="guardian_f_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_f_name" Visible="false" />
                                        <asp:BoundField DataField="guardian_l_name" HeaderText="guardian_l_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_l_name" Visible="false" />
                                        <asp:BoundField DataField="guardian_mi" HeaderText="guardian_mi" InsertVisible="False" ReadOnly="True" SortExpression="guardian_mi" Visible="false" />
                                        <asp:BoundField DataField="guardian_phone" HeaderText="guardian_phone" InsertVisible="False" ReadOnly="True" SortExpression="guardian_phone" Visible="false" />
                                        <asp:BoundField DataField="adult_consent_date" HeaderText="adult_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="adult_consent_date" Visible="false" />
                                        <asp:BoundField DataField="guard_consent_date" HeaderText="guard_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="guard_consent_date" Visible="false" />
                                        <asp:BoundField DataField="dose_form1" HeaderText="dose_form1" InsertVisible="False" ReadOnly="True" SortExpression="dose_form1" Visible="false" />
                                        <asp:BoundField DataField="dose_form2" HeaderText="dose_form2" InsertVisible="False" ReadOnly="True" SortExpression="dose_form2" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_client_vaccine_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter_client_vaccine]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="encounter_id_Update_TextBox" ID="encounter_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="encounter_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vaccine_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vaccine_id_Update_TextBox" ID="vaccine_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="vaccine_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">current_client_medicine</span>
                                <asp:TextBox class="pull-right form-control" ID="current_client_medicine_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">assistance</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="assistance_Update_TextBox" ID="assistance_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="assistance_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                                <asp:TextBox class="pull-right form-control" ID="quantity_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Under_six_months_old</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Under_six_months_old_Update_TextBox" ID="Under_six_months_old_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Under_six_months_old_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pregnant</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="pregnant_Update_TextBox" ID="pregnant_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="pregnant_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">children</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="children_Update_TextBox" ID="children_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="children_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">occupation</span>
                                <asp:TextBox class="pull-right form-control" ID="occupation_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">chronic_disease</span>
                                <asp:TextBox class="pull-right form-control" ID="chronic_disease_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qualify</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="qualify_Update_TextBox" ID="qualify_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="qualify_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_date1</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="dose_date1_Update_TextBox" ID="dose_date1_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="dose_date1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_date2</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="dose_date2_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">adult_consent</span>
                                 <asp:Image ID="adult_consent_Update_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload ID="adult_consent_Update_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_consent</span>
                                 <asp:Image ID="guardian_consent_Update_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload ID="guardian_consent_Update_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vaccine_admin</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="vaccine_admin_Update_TextBox" ID="vaccine_admin_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="vaccine_admin_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_f_name</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_f_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_l_name</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_l_name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_mi</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_mi_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_phone</span>
                                <asp:TextBox class="pull-right form-control" ID="guardian_phone_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">adult_consent_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="adult_consent_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guard_consent_date</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="guard_consent_date_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_form1</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="dose_form1_Update_TextBox" ID="dose_form1_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="dose_form1_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_form2</span>
                                <asp:TextBox class="pull-right form-control" ID="dose_form2_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="encounter_id"
                                    DataSourceID="encounter_client_vaccine_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                                        <asp:BoundField DataField="vaccine_id" HeaderText="vaccine_id" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_id" />
                                        <asp:BoundField DataField="current_client_medicine" HeaderText="current_client_medicine" InsertVisible="False" ReadOnly="True" SortExpression="current_client_medicine" />
                                        <asp:BoundField DataField="assistance" HeaderText="assistance" InsertVisible="False" ReadOnly="True" SortExpression="assistance" Visible="false" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                                        <asp:BoundField DataField="Under_six_months_old" HeaderText="Under_six_months_old" InsertVisible="False" ReadOnly="True" SortExpression="Under_six_months_old" Visible="false" />
                                        <asp:BoundField DataField="pregnant" HeaderText="pregnant" InsertVisible="False" ReadOnly="True" SortExpression="pregnant" Visible="false" />
                                        <asp:BoundField DataField="children" HeaderText="children" InsertVisible="False" ReadOnly="True" SortExpression="children" Visible="false" />
                                        <asp:BoundField DataField="occupation" HeaderText="occupation" InsertVisible="False" ReadOnly="True" SortExpression="occupation" Visible="false" />
                                        <asp:BoundField DataField="chronic_disease" HeaderText="chronic_disease" InsertVisible="False" ReadOnly="True" SortExpression="chronic_disease" Visible="false" />
                                        <asp:BoundField DataField="qualify" HeaderText="qualify" InsertVisible="False" ReadOnly="True" SortExpression="qualify" Visible="false" />
                                        <asp:BoundField DataField="dose_date1" HeaderText="dose_date1" InsertVisible="False" ReadOnly="True" SortExpression="dose_date1" Visible="false" />
                                        <asp:BoundField DataField="dose_date2" HeaderText="dose_date2" InsertVisible="False" ReadOnly="True" SortExpression="dose_date2" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="vaccine_admin" HeaderText="vaccine_admin" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_admin" Visible="false" />
                                        <asp:BoundField DataField="guardian_f_name" HeaderText="guardian_f_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_f_name" Visible="false" />
                                        <asp:BoundField DataField="guardian_l_name" HeaderText="guardian_l_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_l_name" Visible="false" />
                                        <asp:BoundField DataField="guardian_mi" HeaderText="guardian_mi" InsertVisible="False" ReadOnly="True" SortExpression="guardian_mi" Visible="false" />
                                        <asp:BoundField DataField="guardian_phone" HeaderText="guardian_phone" InsertVisible="False" ReadOnly="True" SortExpression="guardian_phone" Visible="false" />
                                        <asp:BoundField DataField="adult_consent_date" HeaderText="adult_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="adult_consent_date" Visible="false" />
                                        <asp:BoundField DataField="guard_consent_date" HeaderText="guard_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="guard_consent_date" Visible="false" />
                                        <asp:BoundField DataField="dose_form1" HeaderText="dose_form1" InsertVisible="False" ReadOnly="True" SortExpression="dose_form1" Visible="false" />
                                        <asp:BoundField DataField="dose_form2" HeaderText="dose_form2" InsertVisible="False" ReadOnly="True" SortExpression="dose_form2" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="encounter_client_vaccine_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [encounter_client_vaccine]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">encounter_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="encounter_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vaccine_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="vaccine_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">current_client_medicine</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="current_client_medicine_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">assistance</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="assistance_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">quantity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="quantity_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Under_six_months_old</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Under_six_months_old_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">pregnant</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="pregnant_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">children</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="children_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">occupation</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="occupation_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">chronic_disease</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="chronic_disease_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">qualify</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="qualify_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_date1</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="dose_date1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_date2</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="dose_date2_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">adult_consent</span>
                                 <asp:Image ID="adult_consent_Delete_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload disabled ID="adult_consent_Delete_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_consent</span>
                                 <asp:Image ID="guardian_consent_Delete_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload disabled ID="guardian_consent_Delete_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">vaccine_admin</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="vaccine_admin_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_f_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="guardian_f_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_l_name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="guardian_l_name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_mi</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="guardian_mi_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guardian_phone</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="guardian_phone_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">adult_consent_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="adult_consent_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">guard_consent_date</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="guard_consent_date_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_form1</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="dose_form1_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">dose_form2</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="dose_form2_Delete_TextBox" runat="server"></asp:TextBox>
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

