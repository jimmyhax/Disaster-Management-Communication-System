<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ScriptGenerator_Template.aspx.cs" Inherits="Web.App.ScriptGenerator_Template" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="body-content col-lg-12">
            <div class="gridview-container">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="address_id" DataSourceID="Address_DS">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                    <asp:BoundField DataField="address_type_id" HeaderText="address_type_id" SortExpression="address_type_id" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                    <asp:BoundField DataField="County_Township" HeaderText="County_Township" SortExpression="County_Township" />
                    <asp:BoundField DataField="longitude" HeaderText="longitude" SortExpression="longitude" />
                    <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
                    <%--<asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                    <asp:BoundField DataField="str_add" HeaderText="str_add" SortExpression="str_add" />
                    <asp:BoundField DataField="str_add2" HeaderText="str_add2" SortExpression="str_add2" />
                    <asp:BoundField DataField="zip_plus_four" HeaderText="zip_plus_four" SortExpression="zip_plus_four" />--%>
                </Columns>
            </asp:GridView>
                <asp:SqlDataSource ID="Address_DS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [address]"></asp:SqlDataSource>
            </div> 
            <div class="panel">
                <div class="panel-body">
                    <div class="col-lg-offset-1 col-lg-4 text-center form-group">
                        <span class="pull-left">address_id</span>
                        <asp:TextBox class="pull-right" ID="address_id_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-2 col-lg-4 col-lg-push-1 text-center form-group">
                        <span class="pull-left">address_type_id</span>
                        <asp:TextBox class="pull-right" ID="address_type_id_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-1 col-lg-4 text-center form-group">
                        <span class="pull-left">city</span>
                        <asp:TextBox class="pull-right" ID="city_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-2 col-lg-4 col-lg-push-1 text-center form-group">
                        <span class="pull-left">country</span>
                        <asp:TextBox class="pull-right" ID="country_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-1 col-lg-4 text-center form-group">
                        <span class="pull-left">County_Township</span>
                        <asp:TextBox class="pull-right" ID="County_Township_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-2 col-lg-4 col-lg-push-1 text-center form-group">
                        <span class="pull-left">longitude</span>
                        <asp:TextBox class="pull-right" ID="longitude_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-1 col-lg-4 text-center form-group">
                        <span class="pull-left">latitude</span>
                        <asp:TextBox class="pull-right" ID="latitude_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-2 col-lg-4 col-lg-push-1 text-center form-group">
                        <span class="pull-left">state</span>
                        <asp:TextBox class="pull-right" ID="state_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-1 col-lg-4 text-center form-group">
                        <span class="pull-left">str_add</span>
                        <asp:TextBox class="pull-right" ID="str_add_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-2 col-lg-4 col-lg-push-1 text-center form-group">
                        <span class="pull-left">str_add2</span>
                        <asp:TextBox class="pull-right" ID="str_add2_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-1 col-lg-4 text-center form-group">
                        <span class="pull-left">zip_plus_four</span>
                        <asp:TextBox class="pull-right" ID="zip_plus_four_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-offset-2 col-lg-4 col-lg-push-1 text-center form-group">
                        <%--FREE SPACE--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
