<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="job_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.job_Screen" %>
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
                                        <asp:GridView ID="Insert_job_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="job_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="job_id" HeaderText="job_id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="company_id" HeaderText="company_id" InsertVisible="False" ReadOnly="True" SortExpression="company_id" />
                            <asp:BoundField DataField="job_cat_id" HeaderText="job_cat_id" InsertVisible="False" ReadOnly="True" SortExpression="job_cat_id" Visible="false" />
                            <asp:BoundField DataField="job_posted_date" HeaderText="job_posted_date" InsertVisible="False" ReadOnly="True" SortExpression="job_posted_date" Visible="false" />
                            <asp:BoundField DataField="job_status" HeaderText="job_status" InsertVisible="False" ReadOnly="True" SortExpression="job_status" Visible="false" />
                            <asp:BoundField DataField="job_title" HeaderText="job_title" InsertVisible="False" ReadOnly="True" SortExpression="job_title" Visible="false" />
                            <asp:BoundField DataField="Work_Classification_Full_time" HeaderText="Work_Classification_Full_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Full_time" Visible="false" />
                            <asp:BoundField DataField="Work_Classification_Part_time" HeaderText="Work_Classification_Part_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Part_time" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Weekly" HeaderText="Work_Payment_Freq_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Weekly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Bi_Weekly" HeaderText="Work_Payment_Freq_Bi_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Weekly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Monthly" HeaderText="Work_Payment_Freq_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Monthly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Bi_Monthly" HeaderText="Work_Payment_Freq_Bi_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Monthly" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [job_id], [address_id], [company_id], [job_cat_id], [job_posted_date], [job_status], [job_title], [Work_Classification_Full_time], [Work_Classification_Part_time], [Work_Payment_Freq_Weekly], [Work_Payment_Freq_Bi_Weekly], [Work_Payment_Freq_Monthly], [Work_Payment_Freq_Bi_Monthly] FROM [job]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_job_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_job_InfoHead_label" Style="padding: 10px" runat="server" Text="job Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_job_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_company_id_lbl" runat="server" Font-Size="Large" Text="company_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_company_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_job_cat_id_lbl" runat="server" Font-Size="Large" Text="job_cat_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_job_cat_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_job_posted_date_lbl" runat="server" Font-Size="Large" Text="job_posted_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_job_posted_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_job_status_lbl" runat="server" Font-Size="Large" Text="job_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_job_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_job_title_lbl" runat="server" Font-Size="Large" Text="job_title:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_job_title_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Work_Classification_Full_time_lbl" runat="server" Font-Size="Large" Text="Work_Classification_Full_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Work_Classification_Full_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Work_Classification_Part_time_lbl" runat="server" Font-Size="Large" Text="Work_Classification_Part_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Work_Classification_Part_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Work_Payment_Freq_Weekly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Weekly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Work_Payment_Freq_Weekly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Work_Payment_Freq_Bi_Weekly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Bi_Weekly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Work_Payment_Freq_Bi_Weekly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Work_Payment_Freq_Monthly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Monthly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Work_Payment_Freq_Monthly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Work_Payment_Freq_Bi_Monthly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Bi_Monthly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Work_Payment_Freq_Bi_Monthly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpejobInfo" runat="server" CollapseControlID="Insert_job_InfoHead" CollapsedText="Show job Information" Enabled="True" ExpandControlID="Insert_job_InfoHead" ExpandedText="job Information" TargetControlID="Insert_job_InfoBody" TextLabelID="Insert_job_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_job_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="job_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="job_id" HeaderText="job_id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="company_id" HeaderText="company_id" InsertVisible="False" ReadOnly="True" SortExpression="company_id" />
                            <asp:BoundField DataField="job_cat_id" HeaderText="job_cat_id" InsertVisible="False" ReadOnly="True" SortExpression="job_cat_id" Visible="false" />
                            <asp:BoundField DataField="job_posted_date" HeaderText="job_posted_date" InsertVisible="False" ReadOnly="True" SortExpression="job_posted_date" Visible="false" />
                            <asp:BoundField DataField="job_status" HeaderText="job_status" InsertVisible="False" ReadOnly="True" SortExpression="job_status" Visible="false" />
                            <asp:BoundField DataField="job_title" HeaderText="job_title" InsertVisible="False" ReadOnly="True" SortExpression="job_title" Visible="false" />
                            <asp:BoundField DataField="Work_Classification_Full_time" HeaderText="Work_Classification_Full_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Full_time" Visible="false" />
                            <asp:BoundField DataField="Work_Classification_Part_time" HeaderText="Work_Classification_Part_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Part_time" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Weekly" HeaderText="Work_Payment_Freq_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Weekly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Bi_Weekly" HeaderText="Work_Payment_Freq_Bi_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Weekly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Monthly" HeaderText="Work_Payment_Freq_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Monthly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Bi_Monthly" HeaderText="Work_Payment_Freq_Bi_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Monthly" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [job_id], [address_id], [company_id], [job_cat_id], [job_posted_date], [job_status], [job_title], [Work_Classification_Full_time], [Work_Classification_Part_time], [Work_Payment_Freq_Weekly], [Work_Payment_Freq_Bi_Weekly], [Work_Payment_Freq_Monthly], [Work_Payment_Freq_Bi_Monthly] FROM [job]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_job_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_job_InfoHead_label" Style="padding: 10px" runat="server" Text="job Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_job_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_job_id_lbl" runat="server" Font-Size="Large" Text="job_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_job_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_company_id_lbl" runat="server" Font-Size="Large" Text="company_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_company_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_job_cat_id_lbl" runat="server" Font-Size="Large" Text="job_cat_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_job_cat_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_job_posted_date_lbl" runat="server" Font-Size="Large" Text="job_posted_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_job_posted_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_job_status_lbl" runat="server" Font-Size="Large" Text="job_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_job_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_job_title_lbl" runat="server" Font-Size="Large" Text="job_title:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_job_title_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Work_Classification_Full_time_lbl" runat="server" Font-Size="Large" Text="Work_Classification_Full_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Work_Classification_Full_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Work_Classification_Part_time_lbl" runat="server" Font-Size="Large" Text="Work_Classification_Part_time:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Work_Classification_Part_time_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Work_Payment_Freq_Weekly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Weekly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Work_Payment_Freq_Weekly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Work_Payment_Freq_Bi_Weekly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Bi_Weekly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Work_Payment_Freq_Bi_Weekly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Work_Payment_Freq_Monthly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Monthly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Work_Payment_Freq_Monthly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Work_Payment_Freq_Bi_Monthly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Bi_Monthly:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Work_Payment_Freq_Bi_Monthly_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpejobInfo" runat="server" CollapseControlID="Update_job_InfoHead" CollapsedText="Show job Information" Enabled="True" ExpandControlID="Update_job_InfoHead" ExpandedText="job Information" TargetControlID="Update_job_InfoBody" TextLabelID="Update_job_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_job_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="job_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="job_id" HeaderText="job_id" InsertVisible="False" ReadOnly="True" SortExpression="job_id" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="company_id" HeaderText="company_id" InsertVisible="False" ReadOnly="True" SortExpression="company_id" />
                            <asp:BoundField DataField="job_cat_id" HeaderText="job_cat_id" InsertVisible="False" ReadOnly="True" SortExpression="job_cat_id" Visible="false" />
                            <asp:BoundField DataField="job_posted_date" HeaderText="job_posted_date" InsertVisible="False" ReadOnly="True" SortExpression="job_posted_date" Visible="false" />
                            <asp:BoundField DataField="job_status" HeaderText="job_status" InsertVisible="False" ReadOnly="True" SortExpression="job_status" Visible="false" />
                            <asp:BoundField DataField="job_title" HeaderText="job_title" InsertVisible="False" ReadOnly="True" SortExpression="job_title" Visible="false" />
                            <asp:BoundField DataField="Work_Classification_Full_time" HeaderText="Work_Classification_Full_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Full_time" Visible="false" />
                            <asp:BoundField DataField="Work_Classification_Part_time" HeaderText="Work_Classification_Part_time" InsertVisible="False" ReadOnly="True" SortExpression="Work_Classification_Part_time" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Weekly" HeaderText="Work_Payment_Freq_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Weekly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Bi_Weekly" HeaderText="Work_Payment_Freq_Bi_Weekly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Weekly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Monthly" HeaderText="Work_Payment_Freq_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Monthly" Visible="false" />
                            <asp:BoundField DataField="Work_Payment_Freq_Bi_Monthly" HeaderText="Work_Payment_Freq_Bi_Monthly" InsertVisible="False" ReadOnly="True" SortExpression="Work_Payment_Freq_Bi_Monthly" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [job_id], [address_id], [company_id], [job_cat_id], [job_posted_date], [job_status], [job_title], [Work_Classification_Full_time], [Work_Classification_Part_time], [Work_Payment_Freq_Weekly], [Work_Payment_Freq_Bi_Weekly], [Work_Payment_Freq_Monthly], [Work_Payment_Freq_Bi_Monthly] FROM [job]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_job_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_job_InfoHead_label" Style="padding: 10px" runat="server" Text="job Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_job_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_job_id_lbl" runat="server" Font-Size="Large" Text="job_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_job_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_company_id_lbl" runat="server" Font-Size="Large" Text="company_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_company_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_job_cat_id_lbl" runat="server" Font-Size="Large" Text="job_cat_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_job_cat_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_job_posted_date_lbl" runat="server" Font-Size="Large" Text="job_posted_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_job_posted_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_job_status_lbl" runat="server" Font-Size="Large" Text="job_status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_job_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_job_title_lbl" runat="server" Font-Size="Large" Text="job_title:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_job_title_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Work_Classification_Full_time_lbl" runat="server" Font-Size="Large" Text="Work_Classification_Full_time:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Work_Classification_Full_time_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Work_Classification_Part_time_lbl" runat="server" Font-Size="Large" Text="Work_Classification_Part_time:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Work_Classification_Part_time_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Weekly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Weekly:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Weekly_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Bi_Weekly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Bi_Weekly:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Bi_Weekly_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Monthly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Monthly:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Monthly_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Bi_Monthly_lbl" runat="server" Font-Size="Large" Text="Work_Payment_Freq_Bi_Monthly:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Work_Payment_Freq_Bi_Monthly_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpejobInfo" runat="server" CollapseControlID="Delete_job_InfoHead" CollapsedText="Show job Information" Enabled="True" ExpandControlID="Delete_job_InfoHead" ExpandedText="job Information" TargetControlID="Delete_job_InfoBody" TextLabelID="Delete_job_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

