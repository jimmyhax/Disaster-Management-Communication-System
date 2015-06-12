<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="Pro_Require_Task_Res.aspx.cs" Inherits="DMCS.Pro_Require_Task_Res_" %>
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
                                    <td width="100%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Insert_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Insert_Pro_Require_Task_Res_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Proj_Require_Task_Res_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Proj_Require_Task_Res_ID" HeaderText="Proj_Require_Task_Res_ID" InsertVisible="False" ReadOnly="True" SortExpression="Proj_Require_Task_Res_ID" />
                            <asp:BoundField DataField="project_id" HeaderText="project_id" InsertVisible="False" ReadOnly="True" SortExpression="project_id" />
                            <asp:BoundField DataField="Requirement_ID" HeaderText="Requirement_ID" InsertVisible="False" ReadOnly="True" SortExpression="Requirement_ID" />
                            <asp:BoundField DataField="task_id" HeaderText="task_id" InsertVisible="False" ReadOnly="True" SortExpression="task_id" Visible="false" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" Visible="false" />
                            <asp:BoundField DataField="Project_Catagory" HeaderText="Project_Catagory" InsertVisible="False" ReadOnly="True" SortExpression="Project_Catagory" Visible="false" />
                            <asp:BoundField DataField="Proj_Require_Description" HeaderText="Proj_Require_Description" InsertVisible="False" ReadOnly="True" SortExpression="Proj_Require_Description" Visible="false" />
                            <asp:BoundField DataField="Project_Task_Description" HeaderText="Project_Task_Description" InsertVisible="False" ReadOnly="True" SortExpression="Project_Task_Description" Visible="false" />
                            <asp:BoundField DataField="Applicant_Name" HeaderText="Applicant_Name" InsertVisible="False" ReadOnly="True" SortExpression="Applicant_Name" Visible="false" />
                            <asp:BoundField DataField="Equipment_Description" HeaderText="Equipment_Description" InsertVisible="False" ReadOnly="True" SortExpression="Equipment_Description" Visible="false" />
                            <asp:BoundField DataField="Vehicle" HeaderText="Vehicle" InsertVisible="False" ReadOnly="True" SortExpression="Vehicle" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Proj_Require_Task_Res_ID], [project_id], [Requirement_ID], [task_id], [Resource_ID], [Project_Catagory], [Proj_Require_Description], [Project_Task_Description], [Applicant_Name], [Equipment_Description], [Vehicle] FROM [Pro_Require_Task_Res]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Pro_Require_Task_Res_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Pro_Require_Task_Res_InfoHead_label" Style="padding: 10px" runat="server" Text="Pro_Require_Task_Res Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Pro_Require_Task_Res_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_project_id_lbl" runat="server" Font-Size="Large" Text="project_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_project_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Requirement_ID_lbl" runat="server" Font-Size="Large" Text="Requirement_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Requirement_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_task_id_lbl" runat="server" Font-Size="Large" Text="task_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_task_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Project_Catagory_lbl" runat="server" Font-Size="Large" Text="Project_Catagory:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Project_Catagory_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Proj_Require_Description_lbl" runat="server" Font-Size="Large" Text="Proj_Require_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Proj_Require_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Project_Task_Description_lbl" runat="server" Font-Size="Large" Text="Project_Task_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Project_Task_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Applicant_Name_lbl" runat="server" Font-Size="Large" Text="Applicant_Name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Applicant_Name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Equipment_Description_lbl" runat="server" Font-Size="Large" Text="Equipment_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Equipment_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Vehicle_lbl" runat="server" Font-Size="Large" Text="Vehicle:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Vehicle_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpePro_Require_Task_ResInfo" runat="server" CollapseControlID="Insert_Pro_Require_Task_Res_InfoHead" CollapsedText="Show Pro_Require_Task_Res Information" Enabled="True" ExpandControlID="Insert_Pro_Require_Task_Res_InfoHead" ExpandedText="Pro_Require_Task_Res Information" TargetControlID="Insert_Pro_Require_Task_Res_InfoBody" TextLabelID="Insert_Pro_Require_Task_Res_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Update_Tab_Panel" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="100%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Update_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Update_Pro_Require_Task_Res_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Proj_Require_Task_Res_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Proj_Require_Task_Res_ID" HeaderText="Proj_Require_Task_Res_ID" InsertVisible="False" ReadOnly="True" SortExpression="Proj_Require_Task_Res_ID" />
                            <asp:BoundField DataField="project_id" HeaderText="project_id" InsertVisible="False" ReadOnly="True" SortExpression="project_id" />
                            <asp:BoundField DataField="Requirement_ID" HeaderText="Requirement_ID" InsertVisible="False" ReadOnly="True" SortExpression="Requirement_ID" />
                            <asp:BoundField DataField="task_id" HeaderText="task_id" InsertVisible="False" ReadOnly="True" SortExpression="task_id" Visible="false" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" Visible="false" />
                            <asp:BoundField DataField="Project_Catagory" HeaderText="Project_Catagory" InsertVisible="False" ReadOnly="True" SortExpression="Project_Catagory" Visible="false" />
                            <asp:BoundField DataField="Proj_Require_Description" HeaderText="Proj_Require_Description" InsertVisible="False" ReadOnly="True" SortExpression="Proj_Require_Description" Visible="false" />
                            <asp:BoundField DataField="Project_Task_Description" HeaderText="Project_Task_Description" InsertVisible="False" ReadOnly="True" SortExpression="Project_Task_Description" Visible="false" />
                            <asp:BoundField DataField="Applicant_Name" HeaderText="Applicant_Name" InsertVisible="False" ReadOnly="True" SortExpression="Applicant_Name" Visible="false" />
                            <asp:BoundField DataField="Equipment_Description" HeaderText="Equipment_Description" InsertVisible="False" ReadOnly="True" SortExpression="Equipment_Description" Visible="false" />
                            <asp:BoundField DataField="Vehicle" HeaderText="Vehicle" InsertVisible="False" ReadOnly="True" SortExpression="Vehicle" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Proj_Require_Task_Res_ID], [project_id], [Requirement_ID], [task_id], [Resource_ID], [Project_Catagory], [Proj_Require_Description], [Project_Task_Description], [Applicant_Name], [Equipment_Description], [Vehicle] FROM [Pro_Require_Task_Res]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Pro_Require_Task_Res_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Pro_Require_Task_Res_InfoHead_label" Style="padding: 10px" runat="server" Text="Pro_Require_Task_Res Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Pro_Require_Task_Res_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Proj_Require_Task_Res_ID_lbl" runat="server" Font-Size="Large" Text="Proj_Require_Task_Res_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Proj_Require_Task_Res_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_project_id_lbl" runat="server" Font-Size="Large" Text="project_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_project_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Requirement_ID_lbl" runat="server" Font-Size="Large" Text="Requirement_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Requirement_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_task_id_lbl" runat="server" Font-Size="Large" Text="task_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_task_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Project_Catagory_lbl" runat="server" Font-Size="Large" Text="Project_Catagory:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Project_Catagory_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Proj_Require_Description_lbl" runat="server" Font-Size="Large" Text="Proj_Require_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Proj_Require_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Project_Task_Description_lbl" runat="server" Font-Size="Large" Text="Project_Task_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Project_Task_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Applicant_Name_lbl" runat="server" Font-Size="Large" Text="Applicant_Name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Applicant_Name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Equipment_Description_lbl" runat="server" Font-Size="Large" Text="Equipment_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Equipment_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Vehicle_lbl" runat="server" Font-Size="Large" Text="Vehicle:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Vehicle_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpePro_Require_Task_ResInfo" runat="server" CollapseControlID="Update_Pro_Require_Task_Res_InfoHead" CollapsedText="Show Pro_Require_Task_Res Information" Enabled="True" ExpandControlID="Update_Pro_Require_Task_Res_InfoHead" ExpandedText="Pro_Require_Task_Res Information" TargetControlID="Update_Pro_Require_Task_Res_InfoBody" TextLabelID="Update_Pro_Require_Task_Res_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Delete_Tab_Panel" runat="server" HeaderText="Delete" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="100%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Delete_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Delete_Pro_Require_Task_Res_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Proj_Require_Task_Res_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Proj_Require_Task_Res_ID" HeaderText="Proj_Require_Task_Res_ID" InsertVisible="False" ReadOnly="True" SortExpression="Proj_Require_Task_Res_ID" />
                            <asp:BoundField DataField="project_id" HeaderText="project_id" InsertVisible="False" ReadOnly="True" SortExpression="project_id" />
                            <asp:BoundField DataField="Requirement_ID" HeaderText="Requirement_ID" InsertVisible="False" ReadOnly="True" SortExpression="Requirement_ID" />
                            <asp:BoundField DataField="task_id" HeaderText="task_id" InsertVisible="False" ReadOnly="True" SortExpression="task_id" Visible="false" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" Visible="false" />
                            <asp:BoundField DataField="Project_Catagory" HeaderText="Project_Catagory" InsertVisible="False" ReadOnly="True" SortExpression="Project_Catagory" Visible="false" />
                            <asp:BoundField DataField="Proj_Require_Description" HeaderText="Proj_Require_Description" InsertVisible="False" ReadOnly="True" SortExpression="Proj_Require_Description" Visible="false" />
                            <asp:BoundField DataField="Project_Task_Description" HeaderText="Project_Task_Description" InsertVisible="False" ReadOnly="True" SortExpression="Project_Task_Description" Visible="false" />
                            <asp:BoundField DataField="Applicant_Name" HeaderText="Applicant_Name" InsertVisible="False" ReadOnly="True" SortExpression="Applicant_Name" Visible="false" />
                            <asp:BoundField DataField="Equipment_Description" HeaderText="Equipment_Description" InsertVisible="False" ReadOnly="True" SortExpression="Equipment_Description" Visible="false" />
                            <asp:BoundField DataField="Vehicle" HeaderText="Vehicle" InsertVisible="False" ReadOnly="True" SortExpression="Vehicle" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Proj_Require_Task_Res_ID], [project_id], [Requirement_ID], [task_id], [Resource_ID], [Project_Catagory], [Proj_Require_Description], [Project_Task_Description], [Applicant_Name], [Equipment_Description], [Vehicle] FROM [Pro_Require_Task_Res]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Pro_Require_Task_Res_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Pro_Require_Task_Res_InfoHead_label" Style="padding: 10px" runat="server" Text="Pro_Require_Task_Res Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_Pro_Require_Task_Res_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Proj_Require_Task_Res_ID_lbl" runat="server" Font-Size="Large" Text="Proj_Require_Task_Res_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Proj_Require_Task_Res_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_project_id_lbl" runat="server" Font-Size="Large" Text="project_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_project_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Requirement_ID_lbl" runat="server" Font-Size="Large" Text="Requirement_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Requirement_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_task_id_lbl" runat="server" Font-Size="Large" Text="task_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_task_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Resource_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Project_Catagory_lbl" runat="server" Font-Size="Large" Text="Project_Catagory:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Project_Catagory_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Proj_Require_Description_lbl" runat="server" Font-Size="Large" Text="Proj_Require_Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Proj_Require_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Project_Task_Description_lbl" runat="server" Font-Size="Large" Text="Project_Task_Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Project_Task_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Applicant_Name_lbl" runat="server" Font-Size="Large" Text="Applicant_Name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Applicant_Name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Equipment_Description_lbl" runat="server" Font-Size="Large" Text="Equipment_Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Equipment_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Vehicle_lbl" runat="server" Font-Size="Large" Text="Vehicle:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Vehicle_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpePro_Require_Task_ResInfo" runat="server" CollapseControlID="Delete_Pro_Require_Task_Res_InfoHead" CollapsedText="Show Pro_Require_Task_Res Information" Enabled="True" ExpandControlID="Delete_Pro_Require_Task_Res_InfoHead" ExpandedText="Pro_Require_Task_Res Information" TargetControlID="Delete_Pro_Require_Task_Res_InfoBody" TextLabelID="Delete_Pro_Require_Task_Res_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

