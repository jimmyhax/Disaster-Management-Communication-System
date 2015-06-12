<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Client_Shelter_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.Client_Shelter_Screen" %>
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
                                        <asp:GridView ID="Insert_Client_Shelter_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Client_Shelter_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" />
                            <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" />
                            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
                            <asp:BoundField DataField="Current_address" HeaderText="Current_address" InsertVisible="False" ReadOnly="True" SortExpression="Current_address" Visible="false" />
                            <asp:BoundField DataField="Current_State" HeaderText="Current_State" InsertVisible="False" ReadOnly="True" SortExpression="Current_State" Visible="false" />
                            <asp:BoundField DataField="Current_City" HeaderText="Current_City" InsertVisible="False" ReadOnly="True" SortExpression="Current_City" Visible="false" />
                            <asp:BoundField DataField="Current_Zip" HeaderText="Current_Zip" InsertVisible="False" ReadOnly="True" SortExpression="Current_Zip" Visible="false" />
                            <asp:BoundField DataField="Client_registration_status" HeaderText="Client_registration_status" InsertVisible="False" ReadOnly="True" SortExpression="Client_registration_status" Visible="false" />
                            <asp:BoundField DataField="Household_size" HeaderText="Household_size" InsertVisible="False" ReadOnly="True" SortExpression="Household_size" Visible="false" />
                            <asp:BoundField DataField="Shelter_supplies" HeaderText="Shelter_supplies" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_supplies" Visible="false" />
                            <asp:BoundField DataField="Shelter_occupancy_current" HeaderText="Shelter_occupancy_current" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_occupancy_current" Visible="false" />
                            <asp:BoundField DataField="New_household_registered" HeaderText="New_household_registered" InsertVisible="False" ReadOnly="True" SortExpression="New_household_registered" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_address" HeaderText="New_Shelter_address" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_address" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_city" HeaderText="New_Shelter_city" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_city" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_State" HeaderText="New_Shelter_State" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_State" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_Zip" HeaderText="New_Shelter_Zip" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_Zip" Visible="false" />
                            <asp:BoundField DataField="New_Contact_Number" HeaderText="New_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="New_Contact_Number" Visible="false" />
                            <asp:BoundField DataField="Current_household_members_safe" HeaderText="Current_household_members_safe" InsertVisible="False" ReadOnly="True" SortExpression="Current_household_members_safe" Visible="false" />
                            <asp:BoundField DataField="CheckIn_Date" HeaderText="CheckIn_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckIn_Date" Visible="false" />
                            <asp:BoundField DataField="CheckOut_Date" HeaderText="CheckOut_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckOut_Date" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Client_Shelter_ID], [Shelter_ID], [Client_ID], [Current_address], [Current_State], [Current_City], [Current_Zip], [Client_registration_status], [Household_size], [Shelter_supplies], [Shelter_occupancy_current], [New_household_registered], [New_Shelter_address], [New_Shelter_city], [New_Shelter_State], [New_Shelter_Zip], [New_Contact_Number], [Current_household_members_safe], [CheckIn_Date], [CheckOut_Date] FROM [Client_Shelter]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Client_Shelter_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Client_Shelter_InfoHead_label" Style="padding: 10px" runat="server" Text="Client_Shelter Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Client_Shelter_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Shelter_ID_lbl" runat="server" Font-Size="Large" Text="Shelter_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Shelter_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Client_ID_lbl" runat="server" Font-Size="Large" Text="Client_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Client_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Current_address_lbl" runat="server" Font-Size="Large" Text="Current_address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Current_address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Current_State_lbl" runat="server" Font-Size="Large" Text="Current_State:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Current_State_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Current_City_lbl" runat="server" Font-Size="Large" Text="Current_City:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Current_City_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Current_Zip_lbl" runat="server" Font-Size="Large" Text="Current_Zip:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Current_Zip_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Client_registration_status_lbl" runat="server" Font-Size="Large" Text="Client_registration_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Client_registration_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Household_size_lbl" runat="server" Font-Size="Large" Text="Household_size:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Household_size_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Shelter_supplies_lbl" runat="server" Font-Size="Large" Text="Shelter_supplies:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Shelter_supplies_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Shelter_occupancy_current_lbl" runat="server" Font-Size="Large" Text="Shelter_occupancy_current:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Shelter_occupancy_current_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_New_household_registered_lbl" runat="server" Font-Size="Large" Text="New_household_registered:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_New_household_registered_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_New_Shelter_address_lbl" runat="server" Font-Size="Large" Text="New_Shelter_address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_New_Shelter_address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_New_Shelter_city_lbl" runat="server" Font-Size="Large" Text="New_Shelter_city:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_New_Shelter_city_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_New_Shelter_State_lbl" runat="server" Font-Size="Large" Text="New_Shelter_State:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_New_Shelter_State_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_New_Shelter_Zip_lbl" runat="server" Font-Size="Large" Text="New_Shelter_Zip:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_New_Shelter_Zip_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_New_Contact_Number_lbl" runat="server" Font-Size="Large" Text="New_Contact_Number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_New_Contact_Number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Current_household_members_safe_lbl" runat="server" Font-Size="Large" Text="Current_household_members_safe:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Current_household_members_safe_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_CheckIn_Date_lbl" runat="server" Font-Size="Large" Text="CheckIn_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_CheckIn_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_CheckOut_Date_lbl" runat="server" Font-Size="Large" Text="CheckOut_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_CheckOut_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeClient_ShelterInfo" runat="server" CollapseControlID="Insert_Client_Shelter_InfoHead" CollapsedText="Show Client_Shelter Information" Enabled="True" ExpandControlID="Insert_Client_Shelter_InfoHead" ExpandedText="Client_Shelter Information" TargetControlID="Insert_Client_Shelter_InfoBody" TextLabelID="Insert_Client_Shelter_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_Client_Shelter_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Client_Shelter_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" />
                            <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" />
                            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
                            <asp:BoundField DataField="Current_address" HeaderText="Current_address" InsertVisible="False" ReadOnly="True" SortExpression="Current_address" Visible="false" />
                            <asp:BoundField DataField="Current_State" HeaderText="Current_State" InsertVisible="False" ReadOnly="True" SortExpression="Current_State" Visible="false" />
                            <asp:BoundField DataField="Current_City" HeaderText="Current_City" InsertVisible="False" ReadOnly="True" SortExpression="Current_City" Visible="false" />
                            <asp:BoundField DataField="Current_Zip" HeaderText="Current_Zip" InsertVisible="False" ReadOnly="True" SortExpression="Current_Zip" Visible="false" />
                            <asp:BoundField DataField="Client_registration_status" HeaderText="Client_registration_status" InsertVisible="False" ReadOnly="True" SortExpression="Client_registration_status" Visible="false" />
                            <asp:BoundField DataField="Household_size" HeaderText="Household_size" InsertVisible="False" ReadOnly="True" SortExpression="Household_size" Visible="false" />
                            <asp:BoundField DataField="Shelter_supplies" HeaderText="Shelter_supplies" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_supplies" Visible="false" />
                            <asp:BoundField DataField="Shelter_occupancy_current" HeaderText="Shelter_occupancy_current" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_occupancy_current" Visible="false" />
                            <asp:BoundField DataField="New_household_registered" HeaderText="New_household_registered" InsertVisible="False" ReadOnly="True" SortExpression="New_household_registered" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_address" HeaderText="New_Shelter_address" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_address" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_city" HeaderText="New_Shelter_city" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_city" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_State" HeaderText="New_Shelter_State" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_State" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_Zip" HeaderText="New_Shelter_Zip" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_Zip" Visible="false" />
                            <asp:BoundField DataField="New_Contact_Number" HeaderText="New_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="New_Contact_Number" Visible="false" />
                            <asp:BoundField DataField="Current_household_members_safe" HeaderText="Current_household_members_safe" InsertVisible="False" ReadOnly="True" SortExpression="Current_household_members_safe" Visible="false" />
                            <asp:BoundField DataField="CheckIn_Date" HeaderText="CheckIn_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckIn_Date" Visible="false" />
                            <asp:BoundField DataField="CheckOut_Date" HeaderText="CheckOut_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckOut_Date" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Client_Shelter_ID], [Shelter_ID], [Client_ID], [Current_address], [Current_State], [Current_City], [Current_Zip], [Client_registration_status], [Household_size], [Shelter_supplies], [Shelter_occupancy_current], [New_household_registered], [New_Shelter_address], [New_Shelter_city], [New_Shelter_State], [New_Shelter_Zip], [New_Contact_Number], [Current_household_members_safe], [CheckIn_Date], [CheckOut_Date] FROM [Client_Shelter]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Client_Shelter_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Client_Shelter_InfoHead_label" Style="padding: 10px" runat="server" Text="Client_Shelter Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Client_Shelter_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Client_Shelter_ID_lbl" runat="server" Font-Size="Large" Text="Client_Shelter_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Client_Shelter_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Shelter_ID_lbl" runat="server" Font-Size="Large" Text="Shelter_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Shelter_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Client_ID_lbl" runat="server" Font-Size="Large" Text="Client_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Client_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Current_address_lbl" runat="server" Font-Size="Large" Text="Current_address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Current_address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Current_State_lbl" runat="server" Font-Size="Large" Text="Current_State:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Current_State_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Current_City_lbl" runat="server" Font-Size="Large" Text="Current_City:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Current_City_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Current_Zip_lbl" runat="server" Font-Size="Large" Text="Current_Zip:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Current_Zip_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Client_registration_status_lbl" runat="server" Font-Size="Large" Text="Client_registration_status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Client_registration_status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Household_size_lbl" runat="server" Font-Size="Large" Text="Household_size:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Household_size_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Shelter_supplies_lbl" runat="server" Font-Size="Large" Text="Shelter_supplies:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Shelter_supplies_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Shelter_occupancy_current_lbl" runat="server" Font-Size="Large" Text="Shelter_occupancy_current:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Shelter_occupancy_current_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_New_household_registered_lbl" runat="server" Font-Size="Large" Text="New_household_registered:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_New_household_registered_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_New_Shelter_address_lbl" runat="server" Font-Size="Large" Text="New_Shelter_address:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_New_Shelter_address_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_New_Shelter_city_lbl" runat="server" Font-Size="Large" Text="New_Shelter_city:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_New_Shelter_city_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_New_Shelter_State_lbl" runat="server" Font-Size="Large" Text="New_Shelter_State:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_New_Shelter_State_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_New_Shelter_Zip_lbl" runat="server" Font-Size="Large" Text="New_Shelter_Zip:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_New_Shelter_Zip_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_New_Contact_Number_lbl" runat="server" Font-Size="Large" Text="New_Contact_Number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_New_Contact_Number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Current_household_members_safe_lbl" runat="server" Font-Size="Large" Text="Current_household_members_safe:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Current_household_members_safe_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_CheckIn_Date_lbl" runat="server" Font-Size="Large" Text="CheckIn_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_CheckIn_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_CheckOut_Date_lbl" runat="server" Font-Size="Large" Text="CheckOut_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_CheckOut_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeClient_ShelterInfo" runat="server" CollapseControlID="Update_Client_Shelter_InfoHead" CollapsedText="Show Client_Shelter Information" Enabled="True" ExpandControlID="Update_Client_Shelter_InfoHead" ExpandedText="Client_Shelter Information" TargetControlID="Update_Client_Shelter_InfoBody" TextLabelID="Update_Client_Shelter_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_Client_Shelter_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Client_Shelter_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" />
                            <asp:BoundField DataField="Shelter_ID" HeaderText="Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_ID" />
                            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
                            <asp:BoundField DataField="Current_address" HeaderText="Current_address" InsertVisible="False" ReadOnly="True" SortExpression="Current_address" Visible="false" />
                            <asp:BoundField DataField="Current_State" HeaderText="Current_State" InsertVisible="False" ReadOnly="True" SortExpression="Current_State" Visible="false" />
                            <asp:BoundField DataField="Current_City" HeaderText="Current_City" InsertVisible="False" ReadOnly="True" SortExpression="Current_City" Visible="false" />
                            <asp:BoundField DataField="Current_Zip" HeaderText="Current_Zip" InsertVisible="False" ReadOnly="True" SortExpression="Current_Zip" Visible="false" />
                            <asp:BoundField DataField="Client_registration_status" HeaderText="Client_registration_status" InsertVisible="False" ReadOnly="True" SortExpression="Client_registration_status" Visible="false" />
                            <asp:BoundField DataField="Household_size" HeaderText="Household_size" InsertVisible="False" ReadOnly="True" SortExpression="Household_size" Visible="false" />
                            <asp:BoundField DataField="Shelter_supplies" HeaderText="Shelter_supplies" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_supplies" Visible="false" />
                            <asp:BoundField DataField="Shelter_occupancy_current" HeaderText="Shelter_occupancy_current" InsertVisible="False" ReadOnly="True" SortExpression="Shelter_occupancy_current" Visible="false" />
                            <asp:BoundField DataField="New_household_registered" HeaderText="New_household_registered" InsertVisible="False" ReadOnly="True" SortExpression="New_household_registered" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_address" HeaderText="New_Shelter_address" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_address" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_city" HeaderText="New_Shelter_city" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_city" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_State" HeaderText="New_Shelter_State" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_State" Visible="false" />
                            <asp:BoundField DataField="New_Shelter_Zip" HeaderText="New_Shelter_Zip" InsertVisible="False" ReadOnly="True" SortExpression="New_Shelter_Zip" Visible="false" />
                            <asp:BoundField DataField="New_Contact_Number" HeaderText="New_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="New_Contact_Number" Visible="false" />
                            <asp:BoundField DataField="Current_household_members_safe" HeaderText="Current_household_members_safe" InsertVisible="False" ReadOnly="True" SortExpression="Current_household_members_safe" Visible="false" />
                            <asp:BoundField DataField="CheckIn_Date" HeaderText="CheckIn_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckIn_Date" Visible="false" />
                            <asp:BoundField DataField="CheckOut_Date" HeaderText="CheckOut_Date" InsertVisible="False" ReadOnly="True" SortExpression="CheckOut_Date" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Client_Shelter_ID], [Shelter_ID], [Client_ID], [Current_address], [Current_State], [Current_City], [Current_Zip], [Client_registration_status], [Household_size], [Shelter_supplies], [Shelter_occupancy_current], [New_household_registered], [New_Shelter_address], [New_Shelter_city], [New_Shelter_State], [New_Shelter_Zip], [New_Contact_Number], [Current_household_members_safe], [CheckIn_Date], [CheckOut_Date] FROM [Client_Shelter]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Client_Shelter_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Client_Shelter_InfoHead_label" Style="padding: 10px" runat="server" Text="Client_Shelter Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_Client_Shelter_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Client_Shelter_ID_lbl" runat="server" Font-Size="Large" Text="Client_Shelter_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Client_Shelter_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Shelter_ID_lbl" runat="server" Font-Size="Large" Text="Shelter_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Shelter_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Client_ID_lbl" runat="server" Font-Size="Large" Text="Client_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Client_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Current_address_lbl" runat="server" Font-Size="Large" Text="Current_address:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Current_address_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Current_State_lbl" runat="server" Font-Size="Large" Text="Current_State:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Current_State_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Current_City_lbl" runat="server" Font-Size="Large" Text="Current_City:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Current_City_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Current_Zip_lbl" runat="server" Font-Size="Large" Text="Current_Zip:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Current_Zip_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Client_registration_status_lbl" runat="server" Font-Size="Large" Text="Client_registration_status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Client_registration_status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Household_size_lbl" runat="server" Font-Size="Large" Text="Household_size:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Household_size_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Shelter_supplies_lbl" runat="server" Font-Size="Large" Text="Shelter_supplies:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Shelter_supplies_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Shelter_occupancy_current_lbl" runat="server" Font-Size="Large" Text="Shelter_occupancy_current:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Shelter_occupancy_current_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_New_household_registered_lbl" runat="server" Font-Size="Large" Text="New_household_registered:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_New_household_registered_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_New_Shelter_address_lbl" runat="server" Font-Size="Large" Text="New_Shelter_address:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_New_Shelter_address_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_New_Shelter_city_lbl" runat="server" Font-Size="Large" Text="New_Shelter_city:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_New_Shelter_city_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_New_Shelter_State_lbl" runat="server" Font-Size="Large" Text="New_Shelter_State:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_New_Shelter_State_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_New_Shelter_Zip_lbl" runat="server" Font-Size="Large" Text="New_Shelter_Zip:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_New_Shelter_Zip_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_New_Contact_Number_lbl" runat="server" Font-Size="Large" Text="New_Contact_Number:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_New_Contact_Number_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Current_household_members_safe_lbl" runat="server" Font-Size="Large" Text="Current_household_members_safe:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Current_household_members_safe_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_CheckIn_Date_lbl" runat="server" Font-Size="Large" Text="CheckIn_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_CheckIn_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_CheckOut_Date_lbl" runat="server" Font-Size="Large" Text="CheckOut_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_CheckOut_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeClient_ShelterInfo" runat="server" CollapseControlID="Delete_Client_Shelter_InfoHead" CollapsedText="Show Client_Shelter Information" Enabled="True" ExpandControlID="Delete_Client_Shelter_InfoHead" ExpandedText="Client_Shelter Information" TargetControlID="Delete_Client_Shelter_InfoBody" TextLabelID="Delete_Client_Shelter_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

