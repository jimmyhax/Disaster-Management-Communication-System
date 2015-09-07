<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="client.aspx.cs" Inherits="Web.App.clientClass" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="clientCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>client CRUD Operations:</span></h1>
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
                                    DataKeyNames="client_id"
                                    DataSourceID="client_Insert_DS"
                                    OnSelectedIndexChanged="Insert_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="client_status" HeaderText="client_status" InsertVisible="False" ReadOnly="True" SortExpression="client_status" />
                                        <asp:BoundField DataField="ethnicity" HeaderText="ethnicity" InsertVisible="False" ReadOnly="True" SortExpression="ethnicity" />
                                        <asp:BoundField DataField="eye_color" HeaderText="eye_color" InsertVisible="False" ReadOnly="True" SortExpression="eye_color" Visible="false" />
                                        <asp:BoundField DataField="hair_color" HeaderText="hair_color" InsertVisible="False" ReadOnly="True" SortExpression="hair_color" Visible="false" />
                                        <asp:BoundField DataField="height" HeaderText="height" InsertVisible="False" ReadOnly="True" SortExpression="height" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "client_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="weight" HeaderText="weight" InsertVisible="False" ReadOnly="True" SortExpression="weight" Visible="false" />
                                        <asp:BoundField DataField="skin_color" HeaderText="skin_color" InsertVisible="False" ReadOnly="True" SortExpression="skin_color" Visible="false" />
                                        <asp:BoundField DataField="Info_Field" HeaderText="Info_Field" InsertVisible="False" ReadOnly="True" SortExpression="Info_Field" Visible="false" />
                                        <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" Visible="false" />
                                        <asp:BoundField DataField="Emergency_Contact_Name" HeaderText="Emergency_Contact_Name" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Name" Visible="false" />
                                        <asp:BoundField DataField="Emergency_Contact_Number" HeaderText="Emergency_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Number" Visible="false" />
                                        <asp:BoundField DataField="Subscribed_Alerts" HeaderText="Subscribed_Alerts" InsertVisible="False" ReadOnly="True" SortExpression="Subscribed_Alerts" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="client_Insert_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [client]"></asp:SqlDataSource>
                            </div>
                        </div>
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
                                    DataKeyNames="client_id"
                                    DataSourceID="client_Update_DS"
                                    OnSelectedIndexChanged="Update_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="client_status" HeaderText="client_status" InsertVisible="False" ReadOnly="True" SortExpression="client_status" />
                                        <asp:BoundField DataField="ethnicity" HeaderText="ethnicity" InsertVisible="False" ReadOnly="True" SortExpression="ethnicity" />
                                        <asp:BoundField DataField="eye_color" HeaderText="eye_color" InsertVisible="False" ReadOnly="True" SortExpression="eye_color" Visible="false" />
                                        <asp:BoundField DataField="hair_color" HeaderText="hair_color" InsertVisible="False" ReadOnly="True" SortExpression="hair_color" Visible="false" />
                                        <asp:BoundField DataField="height" HeaderText="height" InsertVisible="False" ReadOnly="True" SortExpression="height" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "client_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="weight" HeaderText="weight" InsertVisible="False" ReadOnly="True" SortExpression="weight" Visible="false" />
                                        <asp:BoundField DataField="skin_color" HeaderText="skin_color" InsertVisible="False" ReadOnly="True" SortExpression="skin_color" Visible="false" />
                                        <asp:BoundField DataField="Info_Field" HeaderText="Info_Field" InsertVisible="False" ReadOnly="True" SortExpression="Info_Field" Visible="false" />
                                        <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" Visible="false" />
                                        <asp:BoundField DataField="Emergency_Contact_Name" HeaderText="Emergency_Contact_Name" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Name" Visible="false" />
                                        <asp:BoundField DataField="Emergency_Contact_Number" HeaderText="Emergency_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Number" Visible="false" />
                                        <asp:BoundField DataField="Subscribed_Alerts" HeaderText="Subscribed_Alerts" InsertVisible="False" ReadOnly="True" SortExpression="Subscribed_Alerts" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="client_Update_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_id_Update_TextBox" ID="client_id_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_id_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_status</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="client_status_Update_TextBox" ID="client_status_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="client_status_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ethnicity</span>
                                <asp:TextBox class="pull-right form-control" ID="ethnicity_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eye_color</span>
                                <asp:TextBox class="pull-right form-control" ID="eye_color_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">hair_color</span>
                                <asp:TextBox class="pull-right form-control" ID="hair_color_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">height</span>
                                <asp:TextBox class="pull-right form-control" ID="height_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">picture</span>
                                 <asp:Image ID="picture_Update_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload ID="picture_Update_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">weight</span>
                                <asp:TextBox class="pull-right form-control" ID="weight_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">skin_color</span>
                                <asp:TextBox class="pull-right form-control" ID="skin_color_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Info_Field</span>
                                <asp:TextBox class="pull-right form-control" ID="Info_Field_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Shelter_ID</span>
                                <asp:TextBox class="pull-right form-control" ID="Client_Shelter_ID_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Emergency_Contact_Name</span>
                                <asp:TextBox class="pull-right form-control" ID="Emergency_Contact_Name_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Emergency_Contact_Number</span>
                                <asp:TextBox class="pull-right form-control" ID="Emergency_Contact_Number_Update_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Subscribed_Alerts</span>
                          <div class="required-container">
                              <asp:RequiredFieldValidator CssClass="required" ControlToValidate="Subscribed_Alerts_Update_TextBox" ID="Subscribed_Alerts_Update_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="Update_Group"></asp:RequiredFieldValidator>
                          </div>
                                <asp:TextBox class="pull-right form-control" ID="Subscribed_Alerts_Update_TextBox" runat="server"></asp:TextBox>
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
                                    DataKeyNames="client_id"
                                    DataSourceID="client_Delete_DS"
                                    OnSelectedIndexChanged="Delete_GridView_OnSelectedIndexChanged"
                                    GridLines="None"
                                    CssClass="mGrid"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    SelectedRowStyle-CssClass="selected-row">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                        <asp:BoundField DataField="client_status" HeaderText="client_status" InsertVisible="False" ReadOnly="True" SortExpression="client_status" />
                                        <asp:BoundField DataField="ethnicity" HeaderText="ethnicity" InsertVisible="False" ReadOnly="True" SortExpression="ethnicity" />
                                        <asp:BoundField DataField="eye_color" HeaderText="eye_color" InsertVisible="False" ReadOnly="True" SortExpression="eye_color" Visible="false" />
                                        <asp:BoundField DataField="hair_color" HeaderText="hair_color" InsertVisible="False" ReadOnly="True" SortExpression="hair_color" Visible="false" />
                                        <asp:BoundField DataField="height" HeaderText="height" InsertVisible="False" ReadOnly="True" SortExpression="height" Visible="false" />
                                        <asp:ImageField DataImageUrlField = "client_id" DataImageUrlFormatString = "~/Content/images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" HeaderText = "Preview Image" ControlStyle-Height = "50" ControlStyle-Width="50" HeaderStyle-ForeColor="#F5F5F5" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="weight" HeaderText="weight" InsertVisible="False" ReadOnly="True" SortExpression="weight" Visible="false" />
                                        <asp:BoundField DataField="skin_color" HeaderText="skin_color" InsertVisible="False" ReadOnly="True" SortExpression="skin_color" Visible="false" />
                                        <asp:BoundField DataField="Info_Field" HeaderText="Info_Field" InsertVisible="False" ReadOnly="True" SortExpression="Info_Field" Visible="false" />
                                        <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" Visible="false" />
                                        <asp:BoundField DataField="Emergency_Contact_Name" HeaderText="Emergency_Contact_Name" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Name" Visible="false" />
                                        <asp:BoundField DataField="Emergency_Contact_Number" HeaderText="Emergency_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Number" Visible="false" />
                                        <asp:BoundField DataField="Subscribed_Alerts" HeaderText="Subscribed_Alerts" InsertVisible="False" ReadOnly="True" SortExpression="Subscribed_Alerts" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="client_Delete_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [client]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_id</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_id_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">client_status</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="client_status_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">ethnicity</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="ethnicity_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">eye_color</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="eye_color_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">hair_color</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="hair_color_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">height</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="height_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">picture</span>
                                 <asp:Image ID="picture_Delete_Image" CssClass="image-preview" runat="server" ImageUrl="~/Content/images/placeholders/Default_Person.jpg" />
                                 <asp:FileUpload disabled ID="picture_Delete_FileUpload" runat="server" />
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">weight</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="weight_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">skin_color</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="skin_color_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Info_Field</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Info_Field_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Client_Shelter_ID</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Client_Shelter_ID_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Emergency_Contact_Name</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Emergency_Contact_Name_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Emergency_Contact_Number</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Emergency_Contact_Number_Delete_TextBox" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">Subscribed_Alerts</span>
                                <asp:TextBox disabled class="pull-right form-control" ID="Subscribed_Alerts_Delete_TextBox" runat="server"></asp:TextBox>
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

