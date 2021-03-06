<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Pet_Missing_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.Pet_Missing_Screen" %>
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
                                        <asp:GridView ID="Insert_Pet_Missing_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Pet_Missing_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Pet_Missing_ID" HeaderText="Pet_Missing_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Missing_ID" />
                            <asp:BoundField DataField="Last_Known_Location_ID" HeaderText="Last_Known_Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Last_Known_Location_ID" />
                            <asp:BoundField DataField="Date_Missing" HeaderText="Date_Missing" InsertVisible="False" ReadOnly="True" SortExpression="Date_Missing" />
                            <asp:BoundField DataField="Date_Reported" HeaderText="Date_Reported" InsertVisible="False" ReadOnly="True" SortExpression="Date_Reported" Visible="false" />
                            <asp:BoundField DataField="Collar_Description" HeaderText="Collar_Description" InsertVisible="False" ReadOnly="True" SortExpression="Collar_Description" Visible="false" />
                            <asp:BoundField DataField="Time_Lost" HeaderText="Time_Lost" InsertVisible="False" ReadOnly="True" SortExpression="Time_Lost" Visible="false" />
                            <asp:BoundField DataField="Lost_Explanation" HeaderText="Lost_Explanation" InsertVisible="False" ReadOnly="True" SortExpression="Lost_Explanation" Visible="false" />
                            <asp:BoundField DataField="Length_Owned" HeaderText="Length_Owned" InsertVisible="False" ReadOnly="True" SortExpression="Length_Owned" Visible="false" />
                            <asp:BoundField DataField="Reward_Amt" HeaderText="Reward_Amt" InsertVisible="False" ReadOnly="True" SortExpression="Reward_Amt" Visible="false" />
                            <asp:BoundField DataField="Breeder" HeaderText="Breeder" InsertVisible="False" ReadOnly="True" SortExpression="Breeder" Visible="false" />
                            <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                            <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Pet_Missing_ID], [Last_Known_Location_ID], [Date_Missing], [Date_Reported], [Collar_Description], [Time_Lost], [Lost_Explanation], [Length_Owned], [Reward_Amt], [Breeder], [Date_Created], [Date_Modified] FROM [Pet_Missing]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Pet_Missing_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Pet_Missing_InfoHead_label" Style="padding: 10px" runat="server" Text="Pet_Missing Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Pet_Missing_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Last_Known_Location_ID_lbl" runat="server" Font-Size="Large" Text="Last_Known_Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Last_Known_Location_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Date_Missing_lbl" runat="server" Font-Size="Large" Text="Date_Missing:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Date_Missing_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Date_Reported_lbl" runat="server" Font-Size="Large" Text="Date_Reported:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Date_Reported_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Collar_Description_lbl" runat="server" Font-Size="Large" Text="Collar_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Collar_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Time_Lost_lbl" runat="server" Font-Size="Large" Text="Time_Lost:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Time_Lost_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Lost_Explanation_lbl" runat="server" Font-Size="Large" Text="Lost_Explanation:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Lost_Explanation_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Length_Owned_lbl" runat="server" Font-Size="Large" Text="Length_Owned:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Length_Owned_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Reward_Amt_lbl" runat="server" Font-Size="Large" Text="Reward_Amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Reward_Amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Breeder_lbl" runat="server" Font-Size="Large" Text="Breeder:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Breeder_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Date_Created_lbl" runat="server" Font-Size="Large" Text="Date_Created:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Date_Created_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Date_Modified_lbl" runat="server" Font-Size="Large" Text="Date_Modified:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Date_Modified_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpePet_MissingInfo" runat="server" CollapseControlID="Insert_Pet_Missing_InfoHead" CollapsedText="Show Pet_Missing Information" Enabled="True" ExpandControlID="Insert_Pet_Missing_InfoHead" ExpandedText="Pet_Missing Information" TargetControlID="Insert_Pet_Missing_InfoBody" TextLabelID="Insert_Pet_Missing_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_Pet_Missing_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Pet_Missing_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Pet_Missing_ID" HeaderText="Pet_Missing_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Missing_ID" />
                            <asp:BoundField DataField="Last_Known_Location_ID" HeaderText="Last_Known_Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Last_Known_Location_ID" />
                            <asp:BoundField DataField="Date_Missing" HeaderText="Date_Missing" InsertVisible="False" ReadOnly="True" SortExpression="Date_Missing" />
                            <asp:BoundField DataField="Date_Reported" HeaderText="Date_Reported" InsertVisible="False" ReadOnly="True" SortExpression="Date_Reported" Visible="false" />
                            <asp:BoundField DataField="Collar_Description" HeaderText="Collar_Description" InsertVisible="False" ReadOnly="True" SortExpression="Collar_Description" Visible="false" />
                            <asp:BoundField DataField="Time_Lost" HeaderText="Time_Lost" InsertVisible="False" ReadOnly="True" SortExpression="Time_Lost" Visible="false" />
                            <asp:BoundField DataField="Lost_Explanation" HeaderText="Lost_Explanation" InsertVisible="False" ReadOnly="True" SortExpression="Lost_Explanation" Visible="false" />
                            <asp:BoundField DataField="Length_Owned" HeaderText="Length_Owned" InsertVisible="False" ReadOnly="True" SortExpression="Length_Owned" Visible="false" />
                            <asp:BoundField DataField="Reward_Amt" HeaderText="Reward_Amt" InsertVisible="False" ReadOnly="True" SortExpression="Reward_Amt" Visible="false" />
                            <asp:BoundField DataField="Breeder" HeaderText="Breeder" InsertVisible="False" ReadOnly="True" SortExpression="Breeder" Visible="false" />
                            <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                            <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Pet_Missing_ID], [Last_Known_Location_ID], [Date_Missing], [Date_Reported], [Collar_Description], [Time_Lost], [Lost_Explanation], [Length_Owned], [Reward_Amt], [Breeder], [Date_Created], [Date_Modified] FROM [Pet_Missing]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Pet_Missing_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Pet_Missing_InfoHead_label" Style="padding: 10px" runat="server" Text="Pet_Missing Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Pet_Missing_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Missing_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Missing_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Missing_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Last_Known_Location_ID_lbl" runat="server" Font-Size="Large" Text="Last_Known_Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Last_Known_Location_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Date_Missing_lbl" runat="server" Font-Size="Large" Text="Date_Missing:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Date_Missing_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Date_Reported_lbl" runat="server" Font-Size="Large" Text="Date_Reported:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Date_Reported_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Collar_Description_lbl" runat="server" Font-Size="Large" Text="Collar_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Collar_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Time_Lost_lbl" runat="server" Font-Size="Large" Text="Time_Lost:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Time_Lost_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Lost_Explanation_lbl" runat="server" Font-Size="Large" Text="Lost_Explanation:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Lost_Explanation_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Length_Owned_lbl" runat="server" Font-Size="Large" Text="Length_Owned:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Length_Owned_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Reward_Amt_lbl" runat="server" Font-Size="Large" Text="Reward_Amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Reward_Amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Breeder_lbl" runat="server" Font-Size="Large" Text="Breeder:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Breeder_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Date_Created_lbl" runat="server" Font-Size="Large" Text="Date_Created:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Date_Created_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Date_Modified_lbl" runat="server" Font-Size="Large" Text="Date_Modified:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Date_Modified_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpePet_MissingInfo" runat="server" CollapseControlID="Update_Pet_Missing_InfoHead" CollapsedText="Show Pet_Missing Information" Enabled="True" ExpandControlID="Update_Pet_Missing_InfoHead" ExpandedText="Pet_Missing Information" TargetControlID="Update_Pet_Missing_InfoBody" TextLabelID="Update_Pet_Missing_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_Pet_Missing_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Pet_Missing_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Pet_Missing_ID" HeaderText="Pet_Missing_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Missing_ID" />
                            <asp:BoundField DataField="Last_Known_Location_ID" HeaderText="Last_Known_Location_ID" InsertVisible="False" ReadOnly="True" SortExpression="Last_Known_Location_ID" />
                            <asp:BoundField DataField="Date_Missing" HeaderText="Date_Missing" InsertVisible="False" ReadOnly="True" SortExpression="Date_Missing" />
                            <asp:BoundField DataField="Date_Reported" HeaderText="Date_Reported" InsertVisible="False" ReadOnly="True" SortExpression="Date_Reported" Visible="false" />
                            <asp:BoundField DataField="Collar_Description" HeaderText="Collar_Description" InsertVisible="False" ReadOnly="True" SortExpression="Collar_Description" Visible="false" />
                            <asp:BoundField DataField="Time_Lost" HeaderText="Time_Lost" InsertVisible="False" ReadOnly="True" SortExpression="Time_Lost" Visible="false" />
                            <asp:BoundField DataField="Lost_Explanation" HeaderText="Lost_Explanation" InsertVisible="False" ReadOnly="True" SortExpression="Lost_Explanation" Visible="false" />
                            <asp:BoundField DataField="Length_Owned" HeaderText="Length_Owned" InsertVisible="False" ReadOnly="True" SortExpression="Length_Owned" Visible="false" />
                            <asp:BoundField DataField="Reward_Amt" HeaderText="Reward_Amt" InsertVisible="False" ReadOnly="True" SortExpression="Reward_Amt" Visible="false" />
                            <asp:BoundField DataField="Breeder" HeaderText="Breeder" InsertVisible="False" ReadOnly="True" SortExpression="Breeder" Visible="false" />
                            <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                            <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Pet_Missing_ID], [Last_Known_Location_ID], [Date_Missing], [Date_Reported], [Collar_Description], [Time_Lost], [Lost_Explanation], [Length_Owned], [Reward_Amt], [Breeder], [Date_Created], [Date_Modified] FROM [Pet_Missing]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Pet_Missing_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Pet_Missing_InfoHead_label" Style="padding: 10px" runat="server" Text="Pet_Missing Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_Pet_Missing_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Missing_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Missing_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Missing_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Last_Known_Location_ID_lbl" runat="server" Font-Size="Large" Text="Last_Known_Location_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Last_Known_Location_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Date_Missing_lbl" runat="server" Font-Size="Large" Text="Date_Missing:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Date_Missing_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Date_Reported_lbl" runat="server" Font-Size="Large" Text="Date_Reported:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Date_Reported_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Collar_Description_lbl" runat="server" Font-Size="Large" Text="Collar_Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Collar_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Time_Lost_lbl" runat="server" Font-Size="Large" Text="Time_Lost:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Time_Lost_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Lost_Explanation_lbl" runat="server" Font-Size="Large" Text="Lost_Explanation:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Lost_Explanation_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Length_Owned_lbl" runat="server" Font-Size="Large" Text="Length_Owned:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Length_Owned_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Reward_Amt_lbl" runat="server" Font-Size="Large" Text="Reward_Amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Reward_Amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Breeder_lbl" runat="server" Font-Size="Large" Text="Breeder:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Breeder_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Date_Created_lbl" runat="server" Font-Size="Large" Text="Date_Created:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Date_Created_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Date_Modified_lbl" runat="server" Font-Size="Large" Text="Date_Modified:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Date_Modified_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpePet_MissingInfo" runat="server" CollapseControlID="Delete_Pet_Missing_InfoHead" CollapsedText="Show Pet_Missing Information" Enabled="True" ExpandControlID="Delete_Pet_Missing_InfoHead" ExpandedText="Pet_Missing Information" TargetControlID="Delete_Pet_Missing_InfoBody" TextLabelID="Delete_Pet_Missing_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

