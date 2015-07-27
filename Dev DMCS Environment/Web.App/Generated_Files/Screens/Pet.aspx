<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Pet.aspx.cs" Inherits="Web.App.PetClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="PetCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Pet CRUD Operations:</span></h1>
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
                                    DataKeyNames="Pet_Record_ID"
                                    DataSourceID="Pet_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                                        <asp:BoundField DataField="Pet_Location_Found_ID" HeaderText="Pet_Location_Found_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Location_Found_ID" />
                                        <asp:BoundField DataField="Pet_Type_ID" HeaderText="Pet_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Type_ID" />
                                        <asp:BoundField DataField="Pet_Vet_ID" HeaderText="Pet_Vet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vet_ID" Visible="false" />
                                        <asp:BoundField DataField="Pet_License_Tag" HeaderText="Pet_License_Tag" InsertVisible="False" ReadOnly="True" SortExpression="Pet_License_Tag" Visible="false" />
                                        <asp:BoundField DataField="Pet_RFID" HeaderText="Pet_RFID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_RFID" Visible="false" />
                                        <asp:BoundField DataField="Pet_Tatoo_No" HeaderText="Pet_Tatoo_No" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Tatoo_No" Visible="false" />
                                        <asp:BoundField DataField="Pet_Name" HeaderText="Pet_Name" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Name" Visible="false" />
                                        <asp:BoundField DataField="Pet_Gender" HeaderText="Pet_Gender" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Gender" Visible="false" />
                                        <asp:BoundField DataField="Pet_Color" HeaderText="Pet_Color" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Color" Visible="false" />
                                        <asp:BoundField DataField="Pet_Weight" HeaderText="Pet_Weight" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Weight" Visible="false" />
                                        <asp:BoundField DataField="Pet_Description" HeaderText="Pet_Description" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Description" Visible="false" />
                                        <asp:BoundField DataField="Pet_Condition" HeaderText="Pet_Condition" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Condition" Visible="false" />
                                        <asp:BoundField DataField="Pet_Status" HeaderText="Pet_Status" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Status" Visible="false" />
                                        <asp:BoundField DataField="Pet_Date_Of_Birth" HeaderText="Pet_Date_Of_Birth" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Date_Of_Birth" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "Pet_Record_ID" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Pet_Sterilized" HeaderText="Pet_Sterilized" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Sterilized" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Location_Found_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Location_Found_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Type_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Type_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Vet_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Vet_ID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_License_Tag</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_License_Tag_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_RFID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_RFID_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Tatoo_No</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Tatoo_No_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Name_Insert_TextBox" ID="Pet_Name_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Name_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Gender</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Gender_Insert_TextBox" ID="Pet_Gender_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Gender_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Color</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Color_Insert_TextBox" ID="Pet_Color_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Color_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Weight</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Weight_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Description</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Description_Insert_TextBox" ID="Pet_Description_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Description_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Condition</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Condition_Insert_TextBox" ID="Pet_Condition_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Condition_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Status_Insert_TextBox" ID="Pet_Status_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Status_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Date_Of_Birth</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Pet_Date_Of_Birth_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Picture</span>
                                 <asp:Image ID="Pet_Picture_Insert_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload ID="Pet_Picture_Insert_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Sterilized</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Sterilized_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Modified_Insert_TextBox" ID="Date_Modified_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Modified_Insert_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Created_Insert_TextBox" ID="Date_Created_Insert_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Insert_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Created_Insert_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Record_ID"
                                    DataSourceID="Pet_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                                        <asp:BoundField DataField="Pet_Location_Found_ID" HeaderText="Pet_Location_Found_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Location_Found_ID" />
                                        <asp:BoundField DataField="Pet_Type_ID" HeaderText="Pet_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Type_ID" />
                                        <asp:BoundField DataField="Pet_Vet_ID" HeaderText="Pet_Vet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vet_ID" Visible="false" />
                                        <asp:BoundField DataField="Pet_License_Tag" HeaderText="Pet_License_Tag" InsertVisible="False" ReadOnly="True" SortExpression="Pet_License_Tag" Visible="false" />
                                        <asp:BoundField DataField="Pet_RFID" HeaderText="Pet_RFID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_RFID" Visible="false" />
                                        <asp:BoundField DataField="Pet_Tatoo_No" HeaderText="Pet_Tatoo_No" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Tatoo_No" Visible="false" />
                                        <asp:BoundField DataField="Pet_Name" HeaderText="Pet_Name" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Name" Visible="false" />
                                        <asp:BoundField DataField="Pet_Gender" HeaderText="Pet_Gender" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Gender" Visible="false" />
                                        <asp:BoundField DataField="Pet_Color" HeaderText="Pet_Color" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Color" Visible="false" />
                                        <asp:BoundField DataField="Pet_Weight" HeaderText="Pet_Weight" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Weight" Visible="false" />
                                        <asp:BoundField DataField="Pet_Description" HeaderText="Pet_Description" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Description" Visible="false" />
                                        <asp:BoundField DataField="Pet_Condition" HeaderText="Pet_Condition" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Condition" Visible="false" />
                                        <asp:BoundField DataField="Pet_Status" HeaderText="Pet_Status" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Status" Visible="false" />
                                        <asp:BoundField DataField="Pet_Date_Of_Birth" HeaderText="Pet_Date_Of_Birth" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Date_Of_Birth" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "Pet_Record_ID" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Pet_Sterilized" HeaderText="Pet_Sterilized" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Sterilized" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Record_ID_Update_TextBox" ID="Pet_Record_ID_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Record_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Location_Found_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Location_Found_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Type_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Type_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Vet_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Vet_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_License_Tag</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_License_Tag_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_RFID</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_RFID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Tatoo_No</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Tatoo_No_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Name</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Name_Update_TextBox" ID="Pet_Name_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Gender</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Gender_Update_TextBox" ID="Pet_Gender_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Gender_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Color</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Color_Update_TextBox" ID="Pet_Color_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Color_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Weight</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Weight_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Description</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Description_Update_TextBox" ID="Pet_Description_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Description_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Condition</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Condition_Update_TextBox" ID="Pet_Condition_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Condition_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Pet_Status_Update_TextBox" ID="Pet_Status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Date_Of_Birth</span>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Pet_Date_Of_Birth_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Picture</span>
                                 <asp:Image ID="Pet_Picture_Update_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload ID="Pet_Picture_Update_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Sterilized</span>
                                <asp:TextBox class="pull-right form-control" ID="Pet_Sterilized_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Modified_Update_TextBox" ID="Date_Modified_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Modified_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Date_Created_Update_TextBox" ID="Date_Created_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control date-picker" ID="Date_Created_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="Pet_Record_ID"
                                    DataSourceID="Pet_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                                        <asp:BoundField DataField="Pet_Location_Found_ID" HeaderText="Pet_Location_Found_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Location_Found_ID" />
                                        <asp:BoundField DataField="Pet_Type_ID" HeaderText="Pet_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Type_ID" />
                                        <asp:BoundField DataField="Pet_Vet_ID" HeaderText="Pet_Vet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vet_ID" Visible="false" />
                                        <asp:BoundField DataField="Pet_License_Tag" HeaderText="Pet_License_Tag" InsertVisible="False" ReadOnly="True" SortExpression="Pet_License_Tag" Visible="false" />
                                        <asp:BoundField DataField="Pet_RFID" HeaderText="Pet_RFID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_RFID" Visible="false" />
                                        <asp:BoundField DataField="Pet_Tatoo_No" HeaderText="Pet_Tatoo_No" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Tatoo_No" Visible="false" />
                                        <asp:BoundField DataField="Pet_Name" HeaderText="Pet_Name" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Name" Visible="false" />
                                        <asp:BoundField DataField="Pet_Gender" HeaderText="Pet_Gender" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Gender" Visible="false" />
                                        <asp:BoundField DataField="Pet_Color" HeaderText="Pet_Color" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Color" Visible="false" />
                                        <asp:BoundField DataField="Pet_Weight" HeaderText="Pet_Weight" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Weight" Visible="false" />
                                        <asp:BoundField DataField="Pet_Description" HeaderText="Pet_Description" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Description" Visible="false" />
                                        <asp:BoundField DataField="Pet_Condition" HeaderText="Pet_Condition" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Condition" Visible="false" />
                                        <asp:BoundField DataField="Pet_Status" HeaderText="Pet_Status" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Status" Visible="false" />
                                        <asp:BoundField DataField="Pet_Date_Of_Birth" HeaderText="Pet_Date_Of_Birth" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Date_Of_Birth" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "Pet_Record_ID" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Pet_Sterilized" HeaderText="Pet_Sterilized" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Sterilized" Visible="false" />
                                        <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                                        <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Pet_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Pet]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Record_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Record_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Location_Found_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Location_Found_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Type_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Type_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Vet_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Vet_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_License_Tag</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_License_Tag_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_RFID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_RFID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Tatoo_No</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Tatoo_No_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Gender</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Gender_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Color</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Color_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Weight</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Weight_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Description</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Description_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Condition</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Condition_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Date_Of_Birth</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Pet_Date_Of_Birth_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Picture</span>
                                 <asp:Image ID="Pet_Picture_Delete_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload disabled ID="Pet_Picture_Delete_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Pet_Sterilized</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Pet_Sterilized_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Modified</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Modified_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Date_Created</span>
                                <asp:TextBox disabled class="pull-right form-control date-picker" ID="Date_Created_Delete_TextBox" runat="server"></asp:TextBox>
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

