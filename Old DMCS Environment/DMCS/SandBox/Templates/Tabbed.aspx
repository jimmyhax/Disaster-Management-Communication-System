<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tabbed.aspx.cs" Inherits="DMCS.SandBox.Templates.Tabbed" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 87px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
    <script type="text/javascript" id="JavaScript">
        /////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////
        ///////////////////////JavaScript////////////////////////
        /////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////
    </script>
    <%--///////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////
    //////////////////////////HTML/////////////////////////
    ///////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////--%>
    <div style="width: 100%; height: 100%; margin-left: 0px;">
        <asp:TabContainer ID="TabContainer1" runat="server">
            <asp:TabPanel ID="Insert_Tab" runat="server" HeaderText="Insert" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>

                    <table id="Update_Table11" width="100%" cellspacing="10" bgcolor="#efeeef">
                        <tr>
                            <td colspan="5" style="padding-right: 10px; padding-left: 10px;">
                                <asp:Label ID="Insert_lbl_Error"
                                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="Silver"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" style="padding-right: 10px; padding-left: 10px;">
                                <asp:Label runat="server" Text="Choose Disaster" Font-Bold="True" ForeColor="Black" Font-Size="18pt"></asp:Label>
                            </td>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;" colspan="1" align="left">
                                <asp:Label ID="Update_dmcslabel1" Text="Call Center:" runat="server"></asp:Label>
                                <br />
                                <asp:DropDownList ID="Update_DDL_Call_Center" runat="server" Height="23px" Width="147px"
                                    DataSourceID="Update_CallCenters" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="1">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Update_CallCenters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>"
                                    SelectCommand="SP_DMCS_Get_Call_centers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </td>
                            <td style="font-weight: bold; padding-right: 10px; padding-left: 10px;" colspan="1" align="left">
                                <asp:Label ID="Update_Label134" Text="Disaster:" runat="server"></asp:Label>
                                <br />
                                <asp:DropDownList ID="Update_DDlDisasters" runat="server" Height="23px" Width="147px"
                                    DataSourceID="Update_sqldisasters" DataValueField="disaster_id" DataTextField="disaster_Name" TabIndex="2">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Update_sqldisasters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>"
                                    SelectCommand="SP_DMCS_Get_disasters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </td>
                            <td colspan="3"></td>
                            <tr>
                                <td colspan="2" align="left" style="padding-left: 10px">
                                    <asp:Label ID="Insert_sClient_L" runat="server" Text="Search For Client and Case" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%"></asp:Label>
                                </td>
                                <td></td>
                            </tr>
                        <tr>
                            <td style="font-weight: bold; padding-left: 10px;" colspan="1" align="left" class="auto-style2">
                                <asp:Label ID="Insert_firstName_L" Text="First Name:" runat="server"></asp:Label>
                                <br />
                                <asp:TextBox ID="Insert_txtFirstName" runat="server" Width="177px" TabIndex="3"></asp:TextBox>
                            </td>
                            <td style="font-weight: bold; padding-left: 10px;" colspan="2" align="left" class="auto-style2">
                                <asp:Label ID="Insert_lastName_L" Text="Last Name:" runat="server"></asp:Label>
                                <br />
                                <asp:TextBox ID="Insert_txtLastName" runat="server" Width="177px" TabIndex="4"></asp:TextBox>
                            </td>
                            <td colspan="1" align="left" class="auto-style2">
                                <asp:Button ID="Insert_btnNameSearch" Text="Search Client" runat="server"
                                    OnClick="Insert_BtnNameSearch_Click" TabIndex="5" />
                            </td>
                            <td colspan="2" class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="background-color: gray" height="10px" borderwidth="5px"></td>
                        </tr>
                </table>
                    <table id="Update_Table11" width="100%" cellspacing="10" bgcolor="#efeeef">
                        <tr>
                            <td align="left"  width="60%" style="padding-left: 10px">
                                <asp:GridView ID="Insert_gvClientSearchresult" runat="server"
                                    AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                    OnSelectedIndexChanged="Insert_Client_GV_SelectedIndexChanged"
                                    OnPageIndexChanging="Insert_Client_GV_PageIndexChanging"
                                    DataKeyNames="person_id" AllowPaging="True" EnableTheming="False" AllowSorting="True"  DataSourceID="SqlDataSource3">
                                    <Columns>
                                        <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                                        <asp:BoundField DataField="f_name" HeaderText="f_name" SortExpression="f_name" />
                                        <asp:BoundField DataField="m_initial" HeaderText="m_initial" SortExpression="m_initial" />
                                        <asp:BoundField DataField="l_name" HeaderText="l_name" SortExpression="l_name" />
                                        <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" SortExpression="phone_primary" />
                                        <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" SortExpression="phone_secondary" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                    </Columns>
                                    <EditRowStyle BorderStyle="Inset" />
                                    <RowStyle BorderColor="Black" BorderStyle="Inset" />
                                    <SelectedRowStyle BorderColor="Red" BorderStyle="Outset" />
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:localhost %>' SelectCommand="SELECT [person_id], [f_name], [m_initial], [l_name], [phone_primary], [phone_secondary], [email] FROM [person]"></asp:SqlDataSource>
                                <asp:Button ID="Insert_changeClient" runat="server" Text="Search Again" OnClick="Insert_changeClient_Click" Visible="False" />
                            </td>
                            <td align="right" width="40%">
                                <asp:GridView ID="Insert_GVcases" runat="server"
                                    AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                                    DataKeyNames="Case_id" AllowPaging="True"
                                    OnSelectedIndexChanged="Insert_Case_GV_SelectedIndexChanged"
                                    OnPageIndexChanging="Insert_Case_GV_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="Case_id" HeaderText="Case number" />
                                        <asp:BoundField DataField="applic_start_date_time" HeaderText="Case open Date" />
                                        <asp:BoundField DataField="applic_end_date_time" HeaderText="Case Close Date" />
                                    </Columns>
                                    <EditRowStyle BorderStyle="Inset" />
                                    <RowStyle BorderColor="Black" BorderStyle="Inset" />
                                    <SelectedRowStyle BorderColor="Red" BorderStyle="Outset" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <asp:GridView ID="Insert_Client_GV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="person_id" EnableTheming="False" OnPageIndexChanging="Insert_Client_GV_PageIndexChanging" OnSelectedIndexChanged="Insert_Client_GV_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="person_id" Visible="False" />
                                        <asp:BoundField DataField="f_name" HeaderText="First Name" SortExpression="First Name" />
                                        <asp:BoundField DataField="m_initial" HeaderText="Initial" SortExpression="Initial" />
                                        <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="Last Name" />
                                        <asp:BoundField DataField="phone_primary" HeaderText="Phone" SortExpression="Phone" />
                                        <asp:BoundField DataField="phone_secondary" HeaderText="Alt Phone" SortExpression="Alt Phone" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="ssn" HeaderText="Social Security #" SortExpression="Social Security #" />
                                        <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver/State ID" SortExpression="Driver/State ID" />
                                    </Columns>
                                    <EditRowStyle BorderStyle="Inset" />
                                    <RowStyle BorderColor="Black" BorderStyle="Inset" />
                                    <SelectedRowStyle BorderColor="Red" BorderStyle="Outset" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <asp:Panel ID="Insert_InfoHead" runat="server" CssClass="PanelHead" ForeColor="#E2E2E2" BackColor="#E75050">
                            <asp:Label ID="Insert_label106" runat="server" Text="TEXT" Font-Size="Large"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="Insert_InfoBody" runat="server">
                            <div>
                                <table id="Insert_tbl" width="100%" style="font-family: Tahoma" cellspacing="10">
                                    <div style="padding: 10px">
                                        <asp:Label ID="Label12" runat="server" Text="TEXT" Font-Bold="True" Font-Size="Large"></asp:Label>
                                    </div>

                                    <table id="Insert_typeTable" width="100%" cellspacing="10" bgcolor="#efeeef" border="3">
                                        <tr>
                                            <td align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT: 
                        <br />
                                                <asp:TextBox ID="Insert_1_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="11"></asp:TextBox>
                                            </td>
                                            <td align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:
                        <br />
                                                <asp:TextBox ID="Insert_2_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="12"></asp:TextBox>
                                            </td>
                                            <td align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:
                        <br />
                                                <asp:TextBox ID="Insert_3_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="13"></asp:TextBox>
                                            </td>
                                            <td align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:
                        <br />
                                                <asp:TextBox ID="Insert_5_txt0" runat="server" ClientIDMode="Static" TabIndex="15" Width="121px"></asp:TextBox>
                                            </td>
                                            <td align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:<br />
                                                <asp:TextBox ID="Insert_5_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="15"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table id="Insert_Table10" width="100%" cellspacing="10" bgcolor="Silver">
                                        <tr>
                                            <td align="center"
                                                style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Question? &nbsp;
                            <br />
                                                <asp:RadioButton ID="Insert_6_RadBtn" runat="server" Text="Yes" AutoPostBack="True" TabIndex="16" TextAlign="Left"></asp:RadioButton>
                                            </td>
                                            <td align="center"
                                                style="padding-left: 10px; padding-right: 10px; font-weight: bold;">Question?&nbsp;
                            <br />
                                                <asp:RadioButton ID="Insert_7_RadBtn" runat="server" Text="Yes" AutoPostBack="True" TabIndex="18" TextAlign="Left"></asp:RadioButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div style="padding: 10px">
                                        <asp:Label ID="Label11" runat="server" Text="TEXT 2" Font-Bold="True" Font-Size="Large"></asp:Label>
                                    </div>
                                    <table id="Insert_Table2" width="100%" cellspacing="10" bgcolor="#efeeef" border="3px">
                                        <tr>
                                            <td colspan="2" align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:
                            <br />
                                                <asp:TextBox ID="Insert_8_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="20"></asp:TextBox>
                                            </td>
                                            <td colspan="1" align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:
                            <br />
                                                <asp:TextBox ID="Insert_9_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="21"></asp:TextBox>
                                            <td colspan="1" align="left"
                                                style="width: 143px; height: 121px;" nowrap="nowrap">TEXT:
                                <br />
                                                <asp:DropDownList ID="Insert_10_DDL" runat="server" TabIndex="22" ClientIDMode="Static" Width="121px">
                                                    <asp:ListItem Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="y"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="n"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td colspan="2" align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:
                            <br />
                                                <asp:TextBox ID="Insert_11_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="23"></asp:TextBox>




                                            </td>
                                            <td colspan="2" align="left"
                                                style="padding-left: 10px; padding-right: 10px;">TEXT:
                            <br />
                                                <asp:TextBox ID="Insert_12_txt" runat="server" Width="121px" ClientIDMode="Static" TabIndex="24"></asp:TextBox>




                                            </td>
                                        </tr>
                                    </table>
                            </div>
                        </asp:Panel>
                        <asp:CollapsiblePanelExtender ID="Insert_CPE1" runat="server" CollapseControlID="Insert_InfoHead" CollapsedText="Collapsed TEXT" Enabled="True" ExpandControlID="Insert_InfoHead" ExpandedText="Hide TEXT Information" TargetControlID="Insert_InfoBody" TextLabelID="Insert_label106"></asp:CollapsiblePanelExtender>
                    </div>

                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="Update_Tab" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="Delete_Tab" runat="server" HeaderText="Delete" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                <ContentTemplate>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>

    </div>
</asp:Content>
