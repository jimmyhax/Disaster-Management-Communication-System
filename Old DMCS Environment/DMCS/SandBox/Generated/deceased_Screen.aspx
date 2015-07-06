<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="deceased_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.deceased_Screen" %>
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
                                        <asp:GridView ID="Insert_deceased_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="deceased_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" />
                            <asp:BoundField DataField="date_of_autopsy" HeaderText="date_of_autopsy" InsertVisible="False" ReadOnly="True" SortExpression="date_of_autopsy" />
                            <asp:BoundField DataField="external_exam" HeaderText="external_exam" InsertVisible="False" ReadOnly="True" SortExpression="external_exam" />
                            <asp:BoundField DataField="identifying_marks" HeaderText="identifying_marks" InsertVisible="False" ReadOnly="True" SortExpression="identifying_marks" Visible="false" />
                            <asp:BoundField DataField="internal_exam" HeaderText="internal_exam" InsertVisible="False" ReadOnly="True" SortExpression="internal_exam" Visible="false" />
                            <asp:BoundField DataField="reason_of_death" HeaderText="reason_of_death" InsertVisible="False" ReadOnly="True" SortExpression="reason_of_death" Visible="false" />
                            <asp:BoundField DataField="time_of_death" HeaderText="time_of_death" InsertVisible="False" ReadOnly="True" SortExpression="time_of_death" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [deceased_id], [date_of_autopsy], [external_exam], [identifying_marks], [internal_exam], [reason_of_death], [time_of_death] FROM [deceased]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_deceased_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_deceased_InfoHead_label" Style="padding: 10px" runat="server" Text="deceased Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_deceased_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_of_autopsy_lbl" runat="server" Font-Size="Large" Text="date_of_autopsy:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_of_autopsy_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_external_exam_lbl" runat="server" Font-Size="Large" Text="external_exam:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_external_exam_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_identifying_marks_lbl" runat="server" Font-Size="Large" Text="identifying_marks:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_identifying_marks_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_internal_exam_lbl" runat="server" Font-Size="Large" Text="internal_exam:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_internal_exam_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_reason_of_death_lbl" runat="server" Font-Size="Large" Text="reason_of_death:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_reason_of_death_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_time_of_death_lbl" runat="server" Font-Size="Large" Text="time_of_death:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_time_of_death_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpedeceasedInfo" runat="server" CollapseControlID="Insert_deceased_InfoHead" CollapsedText="Show deceased Information" Enabled="True" ExpandControlID="Insert_deceased_InfoHead" ExpandedText="deceased Information" TargetControlID="Insert_deceased_InfoBody" TextLabelID="Insert_deceased_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_deceased_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="deceased_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" />
                            <asp:BoundField DataField="date_of_autopsy" HeaderText="date_of_autopsy" InsertVisible="False" ReadOnly="True" SortExpression="date_of_autopsy" />
                            <asp:BoundField DataField="external_exam" HeaderText="external_exam" InsertVisible="False" ReadOnly="True" SortExpression="external_exam" />
                            <asp:BoundField DataField="identifying_marks" HeaderText="identifying_marks" InsertVisible="False" ReadOnly="True" SortExpression="identifying_marks" Visible="false" />
                            <asp:BoundField DataField="internal_exam" HeaderText="internal_exam" InsertVisible="False" ReadOnly="True" SortExpression="internal_exam" Visible="false" />
                            <asp:BoundField DataField="reason_of_death" HeaderText="reason_of_death" InsertVisible="False" ReadOnly="True" SortExpression="reason_of_death" Visible="false" />
                            <asp:BoundField DataField="time_of_death" HeaderText="time_of_death" InsertVisible="False" ReadOnly="True" SortExpression="time_of_death" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [deceased_id], [date_of_autopsy], [external_exam], [identifying_marks], [internal_exam], [reason_of_death], [time_of_death] FROM [deceased]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_deceased_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_deceased_InfoHead_label" Style="padding: 10px" runat="server" Text="deceased Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_deceased_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_deceased_id_lbl" runat="server" Font-Size="Large" Text="deceased_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_deceased_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_of_autopsy_lbl" runat="server" Font-Size="Large" Text="date_of_autopsy:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_of_autopsy_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_external_exam_lbl" runat="server" Font-Size="Large" Text="external_exam:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_external_exam_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_identifying_marks_lbl" runat="server" Font-Size="Large" Text="identifying_marks:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_identifying_marks_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_internal_exam_lbl" runat="server" Font-Size="Large" Text="internal_exam:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_internal_exam_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_reason_of_death_lbl" runat="server" Font-Size="Large" Text="reason_of_death:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_reason_of_death_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_time_of_death_lbl" runat="server" Font-Size="Large" Text="time_of_death:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_time_of_death_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpedeceasedInfo" runat="server" CollapseControlID="Update_deceased_InfoHead" CollapsedText="Show deceased Information" Enabled="True" ExpandControlID="Update_deceased_InfoHead" ExpandedText="deceased Information" TargetControlID="Update_deceased_InfoBody" TextLabelID="Update_deceased_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_deceased_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="deceased_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" />
                            <asp:BoundField DataField="date_of_autopsy" HeaderText="date_of_autopsy" InsertVisible="False" ReadOnly="True" SortExpression="date_of_autopsy" />
                            <asp:BoundField DataField="external_exam" HeaderText="external_exam" InsertVisible="False" ReadOnly="True" SortExpression="external_exam" />
                            <asp:BoundField DataField="identifying_marks" HeaderText="identifying_marks" InsertVisible="False" ReadOnly="True" SortExpression="identifying_marks" Visible="false" />
                            <asp:BoundField DataField="internal_exam" HeaderText="internal_exam" InsertVisible="False" ReadOnly="True" SortExpression="internal_exam" Visible="false" />
                            <asp:BoundField DataField="reason_of_death" HeaderText="reason_of_death" InsertVisible="False" ReadOnly="True" SortExpression="reason_of_death" Visible="false" />
                            <asp:BoundField DataField="time_of_death" HeaderText="time_of_death" InsertVisible="False" ReadOnly="True" SortExpression="time_of_death" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [deceased_id], [date_of_autopsy], [external_exam], [identifying_marks], [internal_exam], [reason_of_death], [time_of_death] FROM [deceased]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_deceased_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_deceased_InfoHead_label" Style="padding: 10px" runat="server" Text="deceased Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_deceased_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_deceased_id_lbl" runat="server" Font-Size="Large" Text="deceased_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_deceased_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_of_autopsy_lbl" runat="server" Font-Size="Large" Text="date_of_autopsy:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_of_autopsy_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_external_exam_lbl" runat="server" Font-Size="Large" Text="external_exam:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_external_exam_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_identifying_marks_lbl" runat="server" Font-Size="Large" Text="identifying_marks:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_identifying_marks_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_internal_exam_lbl" runat="server" Font-Size="Large" Text="internal_exam:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_internal_exam_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_reason_of_death_lbl" runat="server" Font-Size="Large" Text="reason_of_death:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_reason_of_death_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_time_of_death_lbl" runat="server" Font-Size="Large" Text="time_of_death:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_time_of_death_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpedeceasedInfo" runat="server" CollapseControlID="Delete_deceased_InfoHead" CollapsedText="Show deceased Information" Enabled="True" ExpandControlID="Delete_deceased_InfoHead" ExpandedText="deceased Information" TargetControlID="Delete_deceased_InfoBody" TextLabelID="Delete_deceased_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

