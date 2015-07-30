<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register_Client.aspx.cs" Inherits="Web.App.Register_Client" EnableEventValidation="True" ValidateRequest="True" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" ng-controller="ScriptGeneratorTemplateCtrl">
        <div class="body-header">
            <a class="back-link"><span class="glyphicon glyphicon-menu-left back-arrow"></span><span> Home</span></a>
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
                            <div class="input-group text-center form-group">
                                <span class="pull-left">First Name</span>
                                <asp:TextBox class="pull-right form-control" ID="fname_TextBox" runat="server"></asp:TextBox>
                            </div>
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