<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register_Client.aspx.cs" Inherits="Web.App.Register_Client" EnableEventValidation="True" ValidateRequest="True" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="ScriptGeneratorTemplateCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
            <h1><span>Register A New Client</span></h1>
        </div>
        <div class="body-contents col-lg-12">
            <ajaxToolkit:TabContainer ID="TabContainer" runat="server" ActiveTabIndex="0" Height="100%" UseVerticalStripPlacement="True">
                <ajaxToolkit:TabPanel runat="server" HeaderText="General Info" ID="General_Tab">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="input-group-header"><h3>Identity Information</h3>
                                <div class="faded_devider"></div>
                            </div>
                            <div class="input-group text-center form-group">
                                <span class="pull-left">First Name</span>
                                <div class="required-container">
                                    <asp:RequiredFieldValidator CssClass="required" ControlToValidate="fname_TextBox" ID="fname_TextBox_RequiredFieldValidator" runat="server" Text="* Required Field" ErrorMessage="Required Field" ValidationGroup="General_Group"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox class="pull-right form-control" ID="fname_TextBox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Vehicles" ID="Vehicle_Tab">
                    <ContentTemplate>

                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" HeaderText="Pets" ID="Pet_Tab">
                    <ContentTemplate>

                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>

        </div>
    </div>


</asp:Content>