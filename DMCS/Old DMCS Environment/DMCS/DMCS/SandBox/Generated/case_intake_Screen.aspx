<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="case_intake_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.case_intake_Screen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>TITLE NAME</title>
    </head>
    <body>
        <div style="width: 100%; height: 100%; font-family: 'Calibri Light';">
        <asp:TabContainer ID="MyAjaxTabContainer" runat="server" UseVerticalStripPlacement="false" ActiveTabIndex="2" Visible="True" BackColor="#e75050" ForeColor="#333333" BorderColor="#E75050" BorderStyle="Double" BorderWidth="10px">
                <asp:TabPanel ID="Insert_Tab_Panel" runat="server" HeaderText="Insert" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Insert_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Insert_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Insert_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Insert_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Insert_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Insert_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Insert_case_intake_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="case_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="applic_end_date_time" HeaderText="applic_end_date_time" InsertVisible="False" ReadOnly="True" SortExpression="applic_end_date_time" />
                            <asp:BoundField DataField="applic_start_date_time" HeaderText="applic_start_date_time" InsertVisible="False" ReadOnly="True" SortExpression="applic_start_date_time" />
                            <asp:BoundField DataField="circum_emergency_event" HeaderText="circum_emergency_event" InsertVisible="False" ReadOnly="True" SortExpression="circum_emergency_event" Visible="false" />
                            <asp:BoundField DataField="circum_help_request_memo" HeaderText="circum_help_request_memo" InsertVisible="False" ReadOnly="True" SortExpression="circum_help_request_memo" Visible="false" />
                            <asp:BoundField DataField="circum_income_stolen" HeaderText="circum_income_stolen" InsertVisible="False" ReadOnly="True" SortExpression="circum_income_stolen" Visible="false" />
                            <asp:BoundField DataField="circum_memo" HeaderText="circum_memo" InsertVisible="False" ReadOnly="True" SortExpression="circum_memo" Visible="false" />
                            <asp:BoundField DataField="circum_no_income" HeaderText="circum_no_income" InsertVisible="False" ReadOnly="True" SortExpression="circum_no_income" Visible="false" />
                            <asp:BoundField DataField="circum_not_enough_income" HeaderText="circum_not_enough_income" InsertVisible="False" ReadOnly="True" SortExpression="circum_not_enough_income" Visible="false" />
                            <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" Visible="false" />
                            <asp:BoundField DataField="call_center_id" HeaderText="call_center_id" InsertVisible="False" ReadOnly="True" SortExpression="call_center_id" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [case_id], [applic_end_date_time], [applic_start_date_time], [circum_emergency_event], [circum_help_request_memo], [circum_income_stolen], [circum_memo], [circum_no_income], [circum_not_enough_income], [agency_id], [call_center_id] FROM [case_intake]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_case_intake_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_case_intake_InfoHead_label" Style="padding: 10px" runat="server" Text="case_intake Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_case_intake_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_applic_end_date_time_lbl" runat="server" Font-Size="Large" Text="applic_end_date_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_applic_end_date_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_applic_start_date_time_lbl" runat="server" Font-Size="Large" Text="applic_start_date_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_applic_start_date_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_circum_emergency_event_lbl" runat="server" Font-Size="Large" Text="circum_emergency_event:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_circum_emergency_event_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_circum_help_request_memo_lbl" runat="server" Font-Size="Large" Text="circum_help_request_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_circum_help_request_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_circum_income_stolen_lbl" runat="server" Font-Size="Large" Text="circum_income_stolen:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_circum_income_stolen_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_circum_memo_lbl" runat="server" Font-Size="Large" Text="circum_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_circum_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_circum_no_income_lbl" runat="server" Font-Size="Large" Text="circum_no_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_circum_no_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_circum_not_enough_income_lbl" runat="server" Font-Size="Large" Text="circum_not_enough_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_circum_not_enough_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_agency_id_lbl" runat="server" Font-Size="Large" Text="agency_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_agency_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_call_center_id_lbl" runat="server" Font-Size="Large" Text="call_center_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_call_center_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Insert_btn" runat="server" Font-Size="Large" Text="Insert" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="INSERT" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Insert_cpecase_intakeInfo" runat="server" CollapseControlID="Insert_case_intake_InfoHead" CollapsedText="Show case_intake Information" Enabled="True" ExpandControlID="Insert_case_intake_InfoHead" ExpandedText="case_intake Information" TargetControlID="Insert_case_intake_InfoBody" TextLabelID="Insert_case_intake_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Update_Tab_Panel" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Update_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Update_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Update_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Update_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Update_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Update_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Update_case_intake_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="case_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="applic_end_date_time" HeaderText="applic_end_date_time" InsertVisible="False" ReadOnly="True" SortExpression="applic_end_date_time" />
                            <asp:BoundField DataField="applic_start_date_time" HeaderText="applic_start_date_time" InsertVisible="False" ReadOnly="True" SortExpression="applic_start_date_time" />
                            <asp:BoundField DataField="circum_emergency_event" HeaderText="circum_emergency_event" InsertVisible="False" ReadOnly="True" SortExpression="circum_emergency_event" Visible="false" />
                            <asp:BoundField DataField="circum_help_request_memo" HeaderText="circum_help_request_memo" InsertVisible="False" ReadOnly="True" SortExpression="circum_help_request_memo" Visible="false" />
                            <asp:BoundField DataField="circum_income_stolen" HeaderText="circum_income_stolen" InsertVisible="False" ReadOnly="True" SortExpression="circum_income_stolen" Visible="false" />
                            <asp:BoundField DataField="circum_memo" HeaderText="circum_memo" InsertVisible="False" ReadOnly="True" SortExpression="circum_memo" Visible="false" />
                            <asp:BoundField DataField="circum_no_income" HeaderText="circum_no_income" InsertVisible="False" ReadOnly="True" SortExpression="circum_no_income" Visible="false" />
                            <asp:BoundField DataField="circum_not_enough_income" HeaderText="circum_not_enough_income" InsertVisible="False" ReadOnly="True" SortExpression="circum_not_enough_income" Visible="false" />
                            <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" Visible="false" />
                            <asp:BoundField DataField="call_center_id" HeaderText="call_center_id" InsertVisible="False" ReadOnly="True" SortExpression="call_center_id" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [case_id], [applic_end_date_time], [applic_start_date_time], [circum_emergency_event], [circum_help_request_memo], [circum_income_stolen], [circum_memo], [circum_no_income], [circum_not_enough_income], [agency_id], [call_center_id] FROM [case_intake]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_case_intake_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_case_intake_InfoHead_label" Style="padding: 10px" runat="server" Text="case_intake Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_case_intake_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_case_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_applic_end_date_time_lbl" runat="server" Font-Size="Large" Text="applic_end_date_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_applic_end_date_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_applic_start_date_time_lbl" runat="server" Font-Size="Large" Text="applic_start_date_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_applic_start_date_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_circum_emergency_event_lbl" runat="server" Font-Size="Large" Text="circum_emergency_event:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_circum_emergency_event_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_circum_help_request_memo_lbl" runat="server" Font-Size="Large" Text="circum_help_request_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_circum_help_request_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_circum_income_stolen_lbl" runat="server" Font-Size="Large" Text="circum_income_stolen:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_circum_income_stolen_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_circum_memo_lbl" runat="server" Font-Size="Large" Text="circum_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_circum_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_circum_no_income_lbl" runat="server" Font-Size="Large" Text="circum_no_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_circum_no_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_circum_not_enough_income_lbl" runat="server" Font-Size="Large" Text="circum_not_enough_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_circum_not_enough_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_agency_id_lbl" runat="server" Font-Size="Large" Text="agency_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_agency_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_call_center_id_lbl" runat="server" Font-Size="Large" Text="call_center_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_call_center_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Update_btn" runat="server" Font-Size="Large" Text="Update" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="UPDATE" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Update_cpecase_intakeInfo" runat="server" CollapseControlID="Update_case_intake_InfoHead" CollapsedText="Show case_intake Information" Enabled="True" ExpandControlID="Update_case_intake_InfoHead" ExpandedText="case_intake Information" TargetControlID="Update_case_intake_InfoBody" TextLabelID="Update_case_intake_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Delete_Tab_Panel" runat="server" HeaderText="Delete" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Delete_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Delete_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Delete_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Delete_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Delete_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Delete_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Delete_case_intake_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="case_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="applic_end_date_time" HeaderText="applic_end_date_time" InsertVisible="False" ReadOnly="True" SortExpression="applic_end_date_time" />
                            <asp:BoundField DataField="applic_start_date_time" HeaderText="applic_start_date_time" InsertVisible="False" ReadOnly="True" SortExpression="applic_start_date_time" />
                            <asp:BoundField DataField="circum_emergency_event" HeaderText="circum_emergency_event" InsertVisible="False" ReadOnly="True" SortExpression="circum_emergency_event" Visible="false" />
                            <asp:BoundField DataField="circum_help_request_memo" HeaderText="circum_help_request_memo" InsertVisible="False" ReadOnly="True" SortExpression="circum_help_request_memo" Visible="false" />
                            <asp:BoundField DataField="circum_income_stolen" HeaderText="circum_income_stolen" InsertVisible="False" ReadOnly="True" SortExpression="circum_income_stolen" Visible="false" />
                            <asp:BoundField DataField="circum_memo" HeaderText="circum_memo" InsertVisible="False" ReadOnly="True" SortExpression="circum_memo" Visible="false" />
                            <asp:BoundField DataField="circum_no_income" HeaderText="circum_no_income" InsertVisible="False" ReadOnly="True" SortExpression="circum_no_income" Visible="false" />
                            <asp:BoundField DataField="circum_not_enough_income" HeaderText="circum_not_enough_income" InsertVisible="False" ReadOnly="True" SortExpression="circum_not_enough_income" Visible="false" />
                            <asp:BoundField DataField="agency_id" HeaderText="agency_id" InsertVisible="False" ReadOnly="True" SortExpression="agency_id" Visible="false" />
                            <asp:BoundField DataField="call_center_id" HeaderText="call_center_id" InsertVisible="False" ReadOnly="True" SortExpression="call_center_id" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [case_id], [applic_end_date_time], [applic_start_date_time], [circum_emergency_event], [circum_help_request_memo], [circum_income_stolen], [circum_memo], [circum_no_income], [circum_not_enough_income], [agency_id], [call_center_id] FROM [case_intake]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_case_intake_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_case_intake_InfoHead_label" Style="padding: 10px" runat="server" Text="case_intake Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_case_intake_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_case_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_applic_end_date_time_lbl" runat="server" Font-Size="Large" Text="applic_end_date_time:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_applic_end_date_time_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_applic_start_date_time_lbl" runat="server" Font-Size="Large" Text="applic_start_date_time:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_applic_start_date_time_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_circum_emergency_event_lbl" runat="server" Font-Size="Large" Text="circum_emergency_event:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_circum_emergency_event_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_circum_help_request_memo_lbl" runat="server" Font-Size="Large" Text="circum_help_request_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_circum_help_request_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_circum_income_stolen_lbl" runat="server" Font-Size="Large" Text="circum_income_stolen:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_circum_income_stolen_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_circum_memo_lbl" runat="server" Font-Size="Large" Text="circum_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_circum_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_circum_no_income_lbl" runat="server" Font-Size="Large" Text="circum_no_income:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_circum_no_income_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_circum_not_enough_income_lbl" runat="server" Font-Size="Large" Text="circum_not_enough_income:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_circum_not_enough_income_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_agency_id_lbl" runat="server" Font-Size="Large" Text="agency_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_agency_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_call_center_id_lbl" runat="server" Font-Size="Large" Text="call_center_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_call_center_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Delete_btn" runat="server" Font-Size="Large" Text="Delete" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="DELETE" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Delete_cpecase_intakeInfo" runat="server" CollapseControlID="Delete_case_intake_InfoHead" CollapsedText="Show case_intake Information" Enabled="True" ExpandControlID="Delete_case_intake_InfoHead" ExpandedText="case_intake Information" TargetControlID="Delete_case_intake_InfoBody" TextLabelID="Delete_case_intake_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

