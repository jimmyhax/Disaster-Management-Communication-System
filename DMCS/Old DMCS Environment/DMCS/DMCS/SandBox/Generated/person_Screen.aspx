<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="person_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.person_Screen" %>
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
                                        <asp:GridView ID="Insert_person_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="person_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="address_id2" HeaderText="address_id2" InsertVisible="False" ReadOnly="True" SortExpression="address_id2" Visible="false" />
                            <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                            <asp:BoundField DataField="certification_number" HeaderText="certification_number" InsertVisible="False" ReadOnly="True" SortExpression="certification_number" Visible="false" />
                            <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" Visible="false" />
                            <asp:BoundField DataField="m_initial" HeaderText="m_initial" InsertVisible="False" ReadOnly="True" SortExpression="m_initial" Visible="false" />
                            <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                            <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                            <asp:BoundField DataField="person_type" HeaderText="person_type" InsertVisible="False" ReadOnly="True" SortExpression="person_type" Visible="false" />
                            <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                            <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" InsertVisible="False" ReadOnly="True" SortExpression="phone_secondary" Visible="false" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="ssn" HeaderText="ssn" InsertVisible="False" ReadOnly="True" SortExpression="ssn" Visible="false" />
                            <asp:BoundField DataField="Maiden_Name" HeaderText="Maiden_Name" InsertVisible="False" ReadOnly="True" SortExpression="Maiden_Name" Visible="false" />
                            <asp:BoundField DataField="Visa_Issue_Date" HeaderText="Visa_Issue_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Issue_Date" Visible="false" />
                            <asp:BoundField DataField="Visa_Expire_Date" HeaderText="Visa_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Expire_Date" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B1" HeaderText="Visa_Selected_Value_B1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B2" HeaderText="Visa_Selected_Value_B2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_K1" HeaderText="Visa_Selected_Value_K1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_K3" HeaderText="Visa_Selected_Value_K3" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K3" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_L1" HeaderText="Visa_Selected_Value_L1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_L2" HeaderText="Visa_Selected_Value_L2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H4" HeaderText="Visa_Selected_Value_H4" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H4" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_F1" HeaderText="Visa_Selected_Value_F1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_F1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_J1" HeaderText="Visa_Selected_Value_J1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_J1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_M1" HeaderText="Visa_Selected_Value_M1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_M1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H_1B" HeaderText="Visa_Selected_Value_H_1B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_1B" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H_2B" HeaderText="Visa_Selected_Value_H_2B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_2B" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B_2" HeaderText="Visa_Selected_Value_B_2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B_2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_Schengen" HeaderText="Visa_Selected_Value_Schengen" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_Schengen" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Resid_Date" HeaderText="Perm_Resident_Alien_Resid_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Resid_Date" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Expire_Date" HeaderText="Perm_Resident_Alien_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Expire_Date" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_A_number" HeaderText="Perm_Resident_Alien_A_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_A_number" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_USCIS_number" HeaderText="Perm_Resident_Alien_USCIS_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_USCIS_number" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Birth_Country" HeaderText="Perm_Resident_Alien_Birth_Country" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Birth_Country" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Category" HeaderText="Perm_Resident_Alien_Category" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Category" Visible="false" />
                            <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver_State_ID" InsertVisible="False" ReadOnly="True" SortExpression="Driver_State_ID" Visible="false" />
                            <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" InsertVisible="False" ReadOnly="True" SortExpression="Citizenship" Visible="false" />
                            <asp:BoundField DataField="Marital_Status" HeaderText="Marital_Status" InsertVisible="False" ReadOnly="True" SortExpression="Marital_Status" Visible="false" />
                            <asp:BoundField DataField="Minor_Children" HeaderText="Minor_Children" InsertVisible="False" ReadOnly="True" SortExpression="Minor_Children" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [person_id], [Resource_ID], [address_id], [address_id2], [birthdate], [certification_number], [f_name], [m_initial], [l_name], [gender], [person_type], [phone_primary], [phone_secondary], [email], [ssn], [Maiden_Name], [Visa_Issue_Date], [Visa_Expire_Date], [Visa_Selected_Value_B1], [Visa_Selected_Value_B2], [Visa_Selected_Value_K1], [Visa_Selected_Value_K3], [Visa_Selected_Value_L1], [Visa_Selected_Value_L2], [Visa_Selected_Value_H4], [Visa_Selected_Value_F1], [Visa_Selected_Value_J1], [Visa_Selected_Value_M1], [Visa_Selected_Value_H_1B], [Visa_Selected_Value_H_2B], [Visa_Selected_Value_B_2], [Visa_Selected_Value_Schengen], [Perm_Resident_Alien_Resid_Date], [Perm_Resident_Alien_Expire_Date], [Perm_Resident_Alien_A_number], [Perm_Resident_Alien_USCIS_number], [Perm_Resident_Alien_Birth_Country], [Perm_Resident_Alien_Category], [Driver_State_ID], [Citizenship], [Marital_Status], [Minor_Children] FROM [person]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_person_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_person_InfoHead_label" Style="padding: 10px" runat="server" Text="person Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_person_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_id2_lbl" runat="server" Font-Size="Large" Text="address_id2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_id2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_birthdate_lbl" runat="server" Font-Size="Large" Text="birthdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_birthdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_certification_number_lbl" runat="server" Font-Size="Large" Text="certification_number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_certification_number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_f_name_lbl" runat="server" Font-Size="Large" Text="f_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_f_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_m_initial_lbl" runat="server" Font-Size="Large" Text="m_initial:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_m_initial_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_l_name_lbl" runat="server" Font-Size="Large" Text="l_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_l_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_gender_lbl" runat="server" Font-Size="Large" Text="gender:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_gender_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_person_type_lbl" runat="server" Font-Size="Large" Text="person_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_person_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_phone_primary_lbl" runat="server" Font-Size="Large" Text="phone_primary:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_phone_primary_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_phone_secondary_lbl" runat="server" Font-Size="Large" Text="phone_secondary:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_phone_secondary_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_email_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ssn_lbl" runat="server" Font-Size="Large" Text="ssn:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ssn_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Maiden_Name_lbl" runat="server" Font-Size="Large" Text="Maiden_Name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Maiden_Name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Issue_Date_lbl" runat="server" Font-Size="Large" Text="Visa_Issue_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Issue_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Expire_Date_lbl" runat="server" Font-Size="Large" Text="Visa_Expire_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Expire_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_B1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_B1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_B2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_B2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_K1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_K1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_K1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_K3_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_K3:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_K3_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_L1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_L1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_L1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_L2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_L2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_L2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_H4_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H4:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_H4_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_F1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_F1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_F1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_J1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_J1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_J1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_M1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_M1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_M1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_H_1B_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H_1B:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_H_1B_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_H_2B_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H_2B:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_H_2B_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_B_2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B_2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_B_2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Visa_Selected_Value_Schengen_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_Schengen:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Visa_Selected_Value_Schengen_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Perm_Resident_Alien_Resid_Date_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Resid_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Perm_Resident_Alien_Resid_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Perm_Resident_Alien_Expire_Date_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Expire_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Perm_Resident_Alien_Expire_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Perm_Resident_Alien_A_number_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_A_number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Perm_Resident_Alien_A_number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Perm_Resident_Alien_USCIS_number_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_USCIS_number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Perm_Resident_Alien_USCIS_number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Perm_Resident_Alien_Birth_Country_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Birth_Country:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Perm_Resident_Alien_Birth_Country_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Perm_Resident_Alien_Category_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Category:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Perm_Resident_Alien_Category_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Driver_State_ID_lbl" runat="server" Font-Size="Large" Text="Driver_State_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Driver_State_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Citizenship_lbl" runat="server" Font-Size="Large" Text="Citizenship:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Citizenship_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Marital_Status_lbl" runat="server" Font-Size="Large" Text="Marital_Status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Marital_Status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Minor_Children_lbl" runat="server" Font-Size="Large" Text="Minor_Children:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Minor_Children_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpepersonInfo" runat="server" CollapseControlID="Insert_person_InfoHead" CollapsedText="Show person Information" Enabled="True" ExpandControlID="Insert_person_InfoHead" ExpandedText="person Information" TargetControlID="Insert_person_InfoBody" TextLabelID="Insert_person_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_person_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="person_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="address_id2" HeaderText="address_id2" InsertVisible="False" ReadOnly="True" SortExpression="address_id2" Visible="false" />
                            <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                            <asp:BoundField DataField="certification_number" HeaderText="certification_number" InsertVisible="False" ReadOnly="True" SortExpression="certification_number" Visible="false" />
                            <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" Visible="false" />
                            <asp:BoundField DataField="m_initial" HeaderText="m_initial" InsertVisible="False" ReadOnly="True" SortExpression="m_initial" Visible="false" />
                            <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                            <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                            <asp:BoundField DataField="person_type" HeaderText="person_type" InsertVisible="False" ReadOnly="True" SortExpression="person_type" Visible="false" />
                            <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                            <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" InsertVisible="False" ReadOnly="True" SortExpression="phone_secondary" Visible="false" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="ssn" HeaderText="ssn" InsertVisible="False" ReadOnly="True" SortExpression="ssn" Visible="false" />
                            <asp:BoundField DataField="Maiden_Name" HeaderText="Maiden_Name" InsertVisible="False" ReadOnly="True" SortExpression="Maiden_Name" Visible="false" />
                            <asp:BoundField DataField="Visa_Issue_Date" HeaderText="Visa_Issue_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Issue_Date" Visible="false" />
                            <asp:BoundField DataField="Visa_Expire_Date" HeaderText="Visa_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Expire_Date" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B1" HeaderText="Visa_Selected_Value_B1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B2" HeaderText="Visa_Selected_Value_B2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_K1" HeaderText="Visa_Selected_Value_K1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_K3" HeaderText="Visa_Selected_Value_K3" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K3" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_L1" HeaderText="Visa_Selected_Value_L1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_L2" HeaderText="Visa_Selected_Value_L2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H4" HeaderText="Visa_Selected_Value_H4" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H4" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_F1" HeaderText="Visa_Selected_Value_F1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_F1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_J1" HeaderText="Visa_Selected_Value_J1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_J1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_M1" HeaderText="Visa_Selected_Value_M1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_M1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H_1B" HeaderText="Visa_Selected_Value_H_1B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_1B" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H_2B" HeaderText="Visa_Selected_Value_H_2B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_2B" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B_2" HeaderText="Visa_Selected_Value_B_2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B_2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_Schengen" HeaderText="Visa_Selected_Value_Schengen" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_Schengen" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Resid_Date" HeaderText="Perm_Resident_Alien_Resid_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Resid_Date" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Expire_Date" HeaderText="Perm_Resident_Alien_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Expire_Date" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_A_number" HeaderText="Perm_Resident_Alien_A_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_A_number" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_USCIS_number" HeaderText="Perm_Resident_Alien_USCIS_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_USCIS_number" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Birth_Country" HeaderText="Perm_Resident_Alien_Birth_Country" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Birth_Country" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Category" HeaderText="Perm_Resident_Alien_Category" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Category" Visible="false" />
                            <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver_State_ID" InsertVisible="False" ReadOnly="True" SortExpression="Driver_State_ID" Visible="false" />
                            <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" InsertVisible="False" ReadOnly="True" SortExpression="Citizenship" Visible="false" />
                            <asp:BoundField DataField="Marital_Status" HeaderText="Marital_Status" InsertVisible="False" ReadOnly="True" SortExpression="Marital_Status" Visible="false" />
                            <asp:BoundField DataField="Minor_Children" HeaderText="Minor_Children" InsertVisible="False" ReadOnly="True" SortExpression="Minor_Children" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [person_id], [Resource_ID], [address_id], [address_id2], [birthdate], [certification_number], [f_name], [m_initial], [l_name], [gender], [person_type], [phone_primary], [phone_secondary], [email], [ssn], [Maiden_Name], [Visa_Issue_Date], [Visa_Expire_Date], [Visa_Selected_Value_B1], [Visa_Selected_Value_B2], [Visa_Selected_Value_K1], [Visa_Selected_Value_K3], [Visa_Selected_Value_L1], [Visa_Selected_Value_L2], [Visa_Selected_Value_H4], [Visa_Selected_Value_F1], [Visa_Selected_Value_J1], [Visa_Selected_Value_M1], [Visa_Selected_Value_H_1B], [Visa_Selected_Value_H_2B], [Visa_Selected_Value_B_2], [Visa_Selected_Value_Schengen], [Perm_Resident_Alien_Resid_Date], [Perm_Resident_Alien_Expire_Date], [Perm_Resident_Alien_A_number], [Perm_Resident_Alien_USCIS_number], [Perm_Resident_Alien_Birth_Country], [Perm_Resident_Alien_Category], [Driver_State_ID], [Citizenship], [Marital_Status], [Minor_Children] FROM [person]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_person_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_person_InfoHead_label" Style="padding: 10px" runat="server" Text="person Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_person_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_person_id_lbl" runat="server" Font-Size="Large" Text="person_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_person_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Resource_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id2_lbl" runat="server" Font-Size="Large" Text="address_id2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_birthdate_lbl" runat="server" Font-Size="Large" Text="birthdate:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_birthdate_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_certification_number_lbl" runat="server" Font-Size="Large" Text="certification_number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_certification_number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_f_name_lbl" runat="server" Font-Size="Large" Text="f_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_f_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_m_initial_lbl" runat="server" Font-Size="Large" Text="m_initial:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_m_initial_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_l_name_lbl" runat="server" Font-Size="Large" Text="l_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_l_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_gender_lbl" runat="server" Font-Size="Large" Text="gender:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_gender_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_person_type_lbl" runat="server" Font-Size="Large" Text="person_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_person_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_phone_primary_lbl" runat="server" Font-Size="Large" Text="phone_primary:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_phone_primary_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_phone_secondary_lbl" runat="server" Font-Size="Large" Text="phone_secondary:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_phone_secondary_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_email_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ssn_lbl" runat="server" Font-Size="Large" Text="ssn:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ssn_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Maiden_Name_lbl" runat="server" Font-Size="Large" Text="Maiden_Name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Maiden_Name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Issue_Date_lbl" runat="server" Font-Size="Large" Text="Visa_Issue_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Issue_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Expire_Date_lbl" runat="server" Font-Size="Large" Text="Visa_Expire_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Expire_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_B1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_B1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_B2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_B2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_K1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_K1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_K1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_K3_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_K3:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_K3_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_L1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_L1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_L1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_L2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_L2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_L2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_H4_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H4:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_H4_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_F1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_F1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_F1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_J1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_J1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_J1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_M1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_M1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_M1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_H_1B_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H_1B:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_H_1B_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_H_2B_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H_2B:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_H_2B_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_B_2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B_2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_B_2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Visa_Selected_Value_Schengen_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_Schengen:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Visa_Selected_Value_Schengen_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Perm_Resident_Alien_Resid_Date_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Resid_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Perm_Resident_Alien_Resid_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Perm_Resident_Alien_Expire_Date_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Expire_Date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Perm_Resident_Alien_Expire_Date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Perm_Resident_Alien_A_number_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_A_number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Perm_Resident_Alien_A_number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Perm_Resident_Alien_USCIS_number_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_USCIS_number:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Perm_Resident_Alien_USCIS_number_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Perm_Resident_Alien_Birth_Country_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Birth_Country:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Perm_Resident_Alien_Birth_Country_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Perm_Resident_Alien_Category_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Category:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Perm_Resident_Alien_Category_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Driver_State_ID_lbl" runat="server" Font-Size="Large" Text="Driver_State_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Driver_State_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Citizenship_lbl" runat="server" Font-Size="Large" Text="Citizenship:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Citizenship_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Marital_Status_lbl" runat="server" Font-Size="Large" Text="Marital_Status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Marital_Status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Minor_Children_lbl" runat="server" Font-Size="Large" Text="Minor_Children:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Minor_Children_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpepersonInfo" runat="server" CollapseControlID="Update_person_InfoHead" CollapsedText="Show person Information" Enabled="True" ExpandControlID="Update_person_InfoHead" ExpandedText="person Information" TargetControlID="Update_person_InfoBody" TextLabelID="Update_person_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_person_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="person_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="person_id" HeaderText="person_id" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                            <asp:BoundField DataField="Resource_ID" HeaderText="Resource_ID" InsertVisible="False" ReadOnly="True" SortExpression="Resource_ID" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="address_id2" HeaderText="address_id2" InsertVisible="False" ReadOnly="True" SortExpression="address_id2" Visible="false" />
                            <asp:BoundField DataField="birthdate" HeaderText="birthdate" InsertVisible="False" ReadOnly="True" SortExpression="birthdate" Visible="false" />
                            <asp:BoundField DataField="certification_number" HeaderText="certification_number" InsertVisible="False" ReadOnly="True" SortExpression="certification_number" Visible="false" />
                            <asp:BoundField DataField="f_name" HeaderText="f_name" InsertVisible="False" ReadOnly="True" SortExpression="f_name" Visible="false" />
                            <asp:BoundField DataField="m_initial" HeaderText="m_initial" InsertVisible="False" ReadOnly="True" SortExpression="m_initial" Visible="false" />
                            <asp:BoundField DataField="l_name" HeaderText="l_name" InsertVisible="False" ReadOnly="True" SortExpression="l_name" Visible="false" />
                            <asp:BoundField DataField="gender" HeaderText="gender" InsertVisible="False" ReadOnly="True" SortExpression="gender" Visible="false" />
                            <asp:BoundField DataField="person_type" HeaderText="person_type" InsertVisible="False" ReadOnly="True" SortExpression="person_type" Visible="false" />
                            <asp:BoundField DataField="phone_primary" HeaderText="phone_primary" InsertVisible="False" ReadOnly="True" SortExpression="phone_primary" Visible="false" />
                            <asp:BoundField DataField="phone_secondary" HeaderText="phone_secondary" InsertVisible="False" ReadOnly="True" SortExpression="phone_secondary" Visible="false" />
                            <asp:BoundField DataField="email" HeaderText="email" InsertVisible="False" ReadOnly="True" SortExpression="email" Visible="false" />
                            <asp:BoundField DataField="ssn" HeaderText="ssn" InsertVisible="False" ReadOnly="True" SortExpression="ssn" Visible="false" />
                            <asp:BoundField DataField="Maiden_Name" HeaderText="Maiden_Name" InsertVisible="False" ReadOnly="True" SortExpression="Maiden_Name" Visible="false" />
                            <asp:BoundField DataField="Visa_Issue_Date" HeaderText="Visa_Issue_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Issue_Date" Visible="false" />
                            <asp:BoundField DataField="Visa_Expire_Date" HeaderText="Visa_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Expire_Date" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B1" HeaderText="Visa_Selected_Value_B1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B2" HeaderText="Visa_Selected_Value_B2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_K1" HeaderText="Visa_Selected_Value_K1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_K3" HeaderText="Visa_Selected_Value_K3" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_K3" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_L1" HeaderText="Visa_Selected_Value_L1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_L2" HeaderText="Visa_Selected_Value_L2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_L2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H4" HeaderText="Visa_Selected_Value_H4" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H4" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_F1" HeaderText="Visa_Selected_Value_F1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_F1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_J1" HeaderText="Visa_Selected_Value_J1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_J1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_M1" HeaderText="Visa_Selected_Value_M1" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_M1" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H_1B" HeaderText="Visa_Selected_Value_H_1B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_1B" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_H_2B" HeaderText="Visa_Selected_Value_H_2B" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_H_2B" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_B_2" HeaderText="Visa_Selected_Value_B_2" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_B_2" Visible="false" />
                            <asp:BoundField DataField="Visa_Selected_Value_Schengen" HeaderText="Visa_Selected_Value_Schengen" InsertVisible="False" ReadOnly="True" SortExpression="Visa_Selected_Value_Schengen" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Resid_Date" HeaderText="Perm_Resident_Alien_Resid_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Resid_Date" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Expire_Date" HeaderText="Perm_Resident_Alien_Expire_Date" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Expire_Date" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_A_number" HeaderText="Perm_Resident_Alien_A_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_A_number" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_USCIS_number" HeaderText="Perm_Resident_Alien_USCIS_number" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_USCIS_number" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Birth_Country" HeaderText="Perm_Resident_Alien_Birth_Country" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Birth_Country" Visible="false" />
                            <asp:BoundField DataField="Perm_Resident_Alien_Category" HeaderText="Perm_Resident_Alien_Category" InsertVisible="False" ReadOnly="True" SortExpression="Perm_Resident_Alien_Category" Visible="false" />
                            <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver_State_ID" InsertVisible="False" ReadOnly="True" SortExpression="Driver_State_ID" Visible="false" />
                            <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" InsertVisible="False" ReadOnly="True" SortExpression="Citizenship" Visible="false" />
                            <asp:BoundField DataField="Marital_Status" HeaderText="Marital_Status" InsertVisible="False" ReadOnly="True" SortExpression="Marital_Status" Visible="false" />
                            <asp:BoundField DataField="Minor_Children" HeaderText="Minor_Children" InsertVisible="False" ReadOnly="True" SortExpression="Minor_Children" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [person_id], [Resource_ID], [address_id], [address_id2], [birthdate], [certification_number], [f_name], [m_initial], [l_name], [gender], [person_type], [phone_primary], [phone_secondary], [email], [ssn], [Maiden_Name], [Visa_Issue_Date], [Visa_Expire_Date], [Visa_Selected_Value_B1], [Visa_Selected_Value_B2], [Visa_Selected_Value_K1], [Visa_Selected_Value_K3], [Visa_Selected_Value_L1], [Visa_Selected_Value_L2], [Visa_Selected_Value_H4], [Visa_Selected_Value_F1], [Visa_Selected_Value_J1], [Visa_Selected_Value_M1], [Visa_Selected_Value_H_1B], [Visa_Selected_Value_H_2B], [Visa_Selected_Value_B_2], [Visa_Selected_Value_Schengen], [Perm_Resident_Alien_Resid_Date], [Perm_Resident_Alien_Expire_Date], [Perm_Resident_Alien_A_number], [Perm_Resident_Alien_USCIS_number], [Perm_Resident_Alien_Birth_Country], [Perm_Resident_Alien_Category], [Driver_State_ID], [Citizenship], [Marital_Status], [Minor_Children] FROM [person]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_person_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_person_InfoHead_label" Style="padding: 10px" runat="server" Text="person Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_person_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_person_id_lbl" runat="server" Font-Size="Large" Text="person_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_person_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Resource_ID_lbl" runat="server" Font-Size="Large" Text="Resource_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Resource_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id2_lbl" runat="server" Font-Size="Large" Text="address_id2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_birthdate_lbl" runat="server" Font-Size="Large" Text="birthdate:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_birthdate_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_certification_number_lbl" runat="server" Font-Size="Large" Text="certification_number:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_certification_number_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_f_name_lbl" runat="server" Font-Size="Large" Text="f_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_f_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_m_initial_lbl" runat="server" Font-Size="Large" Text="m_initial:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_m_initial_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_l_name_lbl" runat="server" Font-Size="Large" Text="l_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_l_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_gender_lbl" runat="server" Font-Size="Large" Text="gender:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_gender_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_person_type_lbl" runat="server" Font-Size="Large" Text="person_type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_person_type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_phone_primary_lbl" runat="server" Font-Size="Large" Text="phone_primary:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_phone_primary_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_phone_secondary_lbl" runat="server" Font-Size="Large" Text="phone_secondary:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_phone_secondary_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_email_lbl" runat="server" Font-Size="Large" Text="email:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_email_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ssn_lbl" runat="server" Font-Size="Large" Text="ssn:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ssn_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Maiden_Name_lbl" runat="server" Font-Size="Large" Text="Maiden_Name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Maiden_Name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Issue_Date_lbl" runat="server" Font-Size="Large" Text="Visa_Issue_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Issue_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Expire_Date_lbl" runat="server" Font-Size="Large" Text="Visa_Expire_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Expire_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_B1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_B1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_B2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_B2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_K1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_K1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_K1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_K3_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_K3:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_K3_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_L1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_L1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_L1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_L2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_L2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_L2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_H4_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H4:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_H4_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_F1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_F1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_F1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_J1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_J1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_J1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_M1_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_M1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_M1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_H_1B_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H_1B:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_H_1B_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_H_2B_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_H_2B:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_H_2B_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_B_2_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_B_2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_B_2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Visa_Selected_Value_Schengen_lbl" runat="server" Font-Size="Large" Text="Visa_Selected_Value_Schengen:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Visa_Selected_Value_Schengen_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Resid_Date_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Resid_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Resid_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Expire_Date_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Expire_Date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Expire_Date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_A_number_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_A_number:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_A_number_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_USCIS_number_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_USCIS_number:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_USCIS_number_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Birth_Country_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Birth_Country:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Birth_Country_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Category_lbl" runat="server" Font-Size="Large" Text="Perm_Resident_Alien_Category:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Perm_Resident_Alien_Category_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Driver_State_ID_lbl" runat="server" Font-Size="Large" Text="Driver_State_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Driver_State_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Citizenship_lbl" runat="server" Font-Size="Large" Text="Citizenship:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Citizenship_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Marital_Status_lbl" runat="server" Font-Size="Large" Text="Marital_Status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Marital_Status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Minor_Children_lbl" runat="server" Font-Size="Large" Text="Minor_Children:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Minor_Children_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpepersonInfo" runat="server" CollapseControlID="Delete_person_InfoHead" CollapsedText="Show person Information" Enabled="True" ExpandControlID="Delete_person_InfoHead" ExpandedText="person Information" TargetControlID="Delete_person_InfoBody" TextLabelID="Delete_person_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

