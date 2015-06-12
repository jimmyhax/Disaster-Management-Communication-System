<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="encounter_client_vaccine_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.encounter_client_vaccine_Screen" %>
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
                                        <asp:GridView ID="Insert_encounter_client_vaccine_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="encounter_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                            <asp:BoundField DataField="vaccine_id" HeaderText="vaccine_id" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_id" />
                            <asp:BoundField DataField="current_client_medicine" HeaderText="current_client_medicine" InsertVisible="False" ReadOnly="True" SortExpression="current_client_medicine" />
                            <asp:BoundField DataField="assistance" HeaderText="assistance" InsertVisible="False" ReadOnly="True" SortExpression="assistance" Visible="false" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="Under_six_months_old" HeaderText="Under_six_months_old" InsertVisible="False" ReadOnly="True" SortExpression="Under_six_months_old" Visible="false" />
                            <asp:BoundField DataField="pregnant" HeaderText="pregnant" InsertVisible="False" ReadOnly="True" SortExpression="pregnant" Visible="false" />
                            <asp:BoundField DataField="children" HeaderText="children" InsertVisible="False" ReadOnly="True" SortExpression="children" Visible="false" />
                            <asp:BoundField DataField="occupation" HeaderText="occupation" InsertVisible="False" ReadOnly="True" SortExpression="occupation" Visible="false" />
                            <asp:BoundField DataField="chronic_disease" HeaderText="chronic_disease" InsertVisible="False" ReadOnly="True" SortExpression="chronic_disease" Visible="false" />
                            <asp:BoundField DataField="qualify" HeaderText="qualify" InsertVisible="False" ReadOnly="True" SortExpression="qualify" Visible="false" />
                            <asp:BoundField DataField="dose_date1" HeaderText="dose_date1" InsertVisible="False" ReadOnly="True" SortExpression="dose_date1" Visible="false" />
                            <asp:BoundField DataField="dose_date2" HeaderText="dose_date2" InsertVisible="False" ReadOnly="True" SortExpression="dose_date2" Visible="false" />
                            <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:BoundField DataField="vaccine_admin" HeaderText="vaccine_admin" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_admin" Visible="false" />
                            <asp:BoundField DataField="guardian_f_name" HeaderText="guardian_f_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_f_name" Visible="false" />
                            <asp:BoundField DataField="guardian_l_name" HeaderText="guardian_l_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_l_name" Visible="false" />
                            <asp:BoundField DataField="guardian_mi" HeaderText="guardian_mi" InsertVisible="False" ReadOnly="True" SortExpression="guardian_mi" Visible="false" />
                            <asp:BoundField DataField="guardian_phone" HeaderText="guardian_phone" InsertVisible="False" ReadOnly="True" SortExpression="guardian_phone" Visible="false" />
                            <asp:BoundField DataField="adult_consent_date" HeaderText="adult_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="adult_consent_date" Visible="false" />
                            <asp:BoundField DataField="guard_consent_date" HeaderText="guard_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="guard_consent_date" Visible="false" />
                            <asp:BoundField DataField="dose_form1" HeaderText="dose_form1" InsertVisible="False" ReadOnly="True" SortExpression="dose_form1" Visible="false" />
                            <asp:BoundField DataField="dose_form2" HeaderText="dose_form2" InsertVisible="False" ReadOnly="True" SortExpression="dose_form2" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [encounter_id], [vaccine_id], [current_client_medicine], [assistance], [quantity], [Under_six_months_old], [pregnant], [children], [occupation], [chronic_disease], [qualify], [dose_date1], [dose_date2], [adult_consent], [guardian_consent], [vaccine_admin], [guardian_f_name], [guardian_l_name], [guardian_mi], [guardian_phone], [adult_consent_date], [guard_consent_date], [dose_form1], [dose_form2] FROM [encounter_client_vaccine]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_encounter_client_vaccine_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_encounter_client_vaccine_InfoHead_label" Style="padding: 10px" runat="server" Text="encounter_client_vaccine Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_encounter_client_vaccine_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vaccine_id_lbl" runat="server" Font-Size="Large" Text="vaccine_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vaccine_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_current_client_medicine_lbl" runat="server" Font-Size="Large" Text="current_client_medicine:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_current_client_medicine_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_assistance_lbl" runat="server" Font-Size="Large" Text="assistance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_assistance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_quantity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Under_six_months_old_lbl" runat="server" Font-Size="Large" Text="Under_six_months_old:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Under_six_months_old_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_pregnant_lbl" runat="server" Font-Size="Large" Text="pregnant:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_pregnant_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_children_lbl" runat="server" Font-Size="Large" Text="children:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_children_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_occupation_lbl" runat="server" Font-Size="Large" Text="occupation:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_occupation_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_chronic_disease_lbl" runat="server" Font-Size="Large" Text="chronic_disease:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_chronic_disease_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_qualify_lbl" runat="server" Font-Size="Large" Text="qualify:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_qualify_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_dose_date1_lbl" runat="server" Font-Size="Large" Text="dose_date1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_dose_date1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_dose_date2_lbl" runat="server" Font-Size="Large" Text="dose_date2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_dose_date2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_adult_consent_lbl" runat="server" Font-Size="Large" Text="adult_consent:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Insert_adult_consent_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                     <asp:FileUpload ID="Insert_adult_consent_FileUpload" runat="server" />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_guardian_consent_lbl" runat="server" Font-Size="Large" Text="guardian_consent:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Insert_guardian_consent_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                     <asp:FileUpload ID="Insert_guardian_consent_FileUpload" runat="server" />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vaccine_admin_lbl" runat="server" Font-Size="Large" Text="vaccine_admin:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vaccine_admin_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_guardian_f_name_lbl" runat="server" Font-Size="Large" Text="guardian_f_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_guardian_f_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_guardian_l_name_lbl" runat="server" Font-Size="Large" Text="guardian_l_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_guardian_l_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_guardian_mi_lbl" runat="server" Font-Size="Large" Text="guardian_mi:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_guardian_mi_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_guardian_phone_lbl" runat="server" Font-Size="Large" Text="guardian_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_guardian_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_adult_consent_date_lbl" runat="server" Font-Size="Large" Text="adult_consent_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_adult_consent_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_guard_consent_date_lbl" runat="server" Font-Size="Large" Text="guard_consent_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_guard_consent_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_dose_form1_lbl" runat="server" Font-Size="Large" Text="dose_form1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_dose_form1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_dose_form2_lbl" runat="server" Font-Size="Large" Text="dose_form2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_dose_form2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeencounter_client_vaccineInfo" runat="server" CollapseControlID="Insert_encounter_client_vaccine_InfoHead" CollapsedText="Show encounter_client_vaccine Information" Enabled="True" ExpandControlID="Insert_encounter_client_vaccine_InfoHead" ExpandedText="encounter_client_vaccine Information" TargetControlID="Insert_encounter_client_vaccine_InfoBody" TextLabelID="Insert_encounter_client_vaccine_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_encounter_client_vaccine_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="encounter_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                            <asp:BoundField DataField="vaccine_id" HeaderText="vaccine_id" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_id" />
                            <asp:BoundField DataField="current_client_medicine" HeaderText="current_client_medicine" InsertVisible="False" ReadOnly="True" SortExpression="current_client_medicine" />
                            <asp:BoundField DataField="assistance" HeaderText="assistance" InsertVisible="False" ReadOnly="True" SortExpression="assistance" Visible="false" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="Under_six_months_old" HeaderText="Under_six_months_old" InsertVisible="False" ReadOnly="True" SortExpression="Under_six_months_old" Visible="false" />
                            <asp:BoundField DataField="pregnant" HeaderText="pregnant" InsertVisible="False" ReadOnly="True" SortExpression="pregnant" Visible="false" />
                            <asp:BoundField DataField="children" HeaderText="children" InsertVisible="False" ReadOnly="True" SortExpression="children" Visible="false" />
                            <asp:BoundField DataField="occupation" HeaderText="occupation" InsertVisible="False" ReadOnly="True" SortExpression="occupation" Visible="false" />
                            <asp:BoundField DataField="chronic_disease" HeaderText="chronic_disease" InsertVisible="False" ReadOnly="True" SortExpression="chronic_disease" Visible="false" />
                            <asp:BoundField DataField="qualify" HeaderText="qualify" InsertVisible="False" ReadOnly="True" SortExpression="qualify" Visible="false" />
                            <asp:BoundField DataField="dose_date1" HeaderText="dose_date1" InsertVisible="False" ReadOnly="True" SortExpression="dose_date1" Visible="false" />
                            <asp:BoundField DataField="dose_date2" HeaderText="dose_date2" InsertVisible="False" ReadOnly="True" SortExpression="dose_date2" Visible="false" />
                            <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:BoundField DataField="vaccine_admin" HeaderText="vaccine_admin" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_admin" Visible="false" />
                            <asp:BoundField DataField="guardian_f_name" HeaderText="guardian_f_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_f_name" Visible="false" />
                            <asp:BoundField DataField="guardian_l_name" HeaderText="guardian_l_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_l_name" Visible="false" />
                            <asp:BoundField DataField="guardian_mi" HeaderText="guardian_mi" InsertVisible="False" ReadOnly="True" SortExpression="guardian_mi" Visible="false" />
                            <asp:BoundField DataField="guardian_phone" HeaderText="guardian_phone" InsertVisible="False" ReadOnly="True" SortExpression="guardian_phone" Visible="false" />
                            <asp:BoundField DataField="adult_consent_date" HeaderText="adult_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="adult_consent_date" Visible="false" />
                            <asp:BoundField DataField="guard_consent_date" HeaderText="guard_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="guard_consent_date" Visible="false" />
                            <asp:BoundField DataField="dose_form1" HeaderText="dose_form1" InsertVisible="False" ReadOnly="True" SortExpression="dose_form1" Visible="false" />
                            <asp:BoundField DataField="dose_form2" HeaderText="dose_form2" InsertVisible="False" ReadOnly="True" SortExpression="dose_form2" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [encounter_id], [vaccine_id], [current_client_medicine], [assistance], [quantity], [Under_six_months_old], [pregnant], [children], [occupation], [chronic_disease], [qualify], [dose_date1], [dose_date2], [adult_consent], [guardian_consent], [vaccine_admin], [guardian_f_name], [guardian_l_name], [guardian_mi], [guardian_phone], [adult_consent_date], [guard_consent_date], [dose_form1], [dose_form2] FROM [encounter_client_vaccine]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_encounter_client_vaccine_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_encounter_client_vaccine_InfoHead_label" Style="padding: 10px" runat="server" Text="encounter_client_vaccine Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_encounter_client_vaccine_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_encounter_id_lbl" runat="server" Font-Size="Large" Text="encounter_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_encounter_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vaccine_id_lbl" runat="server" Font-Size="Large" Text="vaccine_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vaccine_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_current_client_medicine_lbl" runat="server" Font-Size="Large" Text="current_client_medicine:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_current_client_medicine_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_assistance_lbl" runat="server" Font-Size="Large" Text="assistance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_assistance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_quantity_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Under_six_months_old_lbl" runat="server" Font-Size="Large" Text="Under_six_months_old:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Under_six_months_old_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_pregnant_lbl" runat="server" Font-Size="Large" Text="pregnant:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_pregnant_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_children_lbl" runat="server" Font-Size="Large" Text="children:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_children_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_occupation_lbl" runat="server" Font-Size="Large" Text="occupation:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_occupation_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_chronic_disease_lbl" runat="server" Font-Size="Large" Text="chronic_disease:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_chronic_disease_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_qualify_lbl" runat="server" Font-Size="Large" Text="qualify:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_qualify_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_dose_date1_lbl" runat="server" Font-Size="Large" Text="dose_date1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_dose_date1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_dose_date2_lbl" runat="server" Font-Size="Large" Text="dose_date2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_dose_date2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_adult_consent_lbl" runat="server" Font-Size="Large" Text="adult_consent:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Update_adult_consent_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                     <asp:FileUpload ID="Update_adult_consent_FileUpload" runat="server" />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_guardian_consent_lbl" runat="server" Font-Size="Large" Text="guardian_consent:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Update_guardian_consent_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                     <asp:FileUpload ID="Update_guardian_consent_FileUpload" runat="server" />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vaccine_admin_lbl" runat="server" Font-Size="Large" Text="vaccine_admin:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vaccine_admin_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_guardian_f_name_lbl" runat="server" Font-Size="Large" Text="guardian_f_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_guardian_f_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_guardian_l_name_lbl" runat="server" Font-Size="Large" Text="guardian_l_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_guardian_l_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_guardian_mi_lbl" runat="server" Font-Size="Large" Text="guardian_mi:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_guardian_mi_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_guardian_phone_lbl" runat="server" Font-Size="Large" Text="guardian_phone:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_guardian_phone_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_adult_consent_date_lbl" runat="server" Font-Size="Large" Text="adult_consent_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_adult_consent_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_guard_consent_date_lbl" runat="server" Font-Size="Large" Text="guard_consent_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_guard_consent_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_dose_form1_lbl" runat="server" Font-Size="Large" Text="dose_form1:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_dose_form1_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_dose_form2_lbl" runat="server" Font-Size="Large" Text="dose_form2:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_dose_form2_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeencounter_client_vaccineInfo" runat="server" CollapseControlID="Update_encounter_client_vaccine_InfoHead" CollapsedText="Show encounter_client_vaccine Information" Enabled="True" ExpandControlID="Update_encounter_client_vaccine_InfoHead" ExpandedText="encounter_client_vaccine Information" TargetControlID="Update_encounter_client_vaccine_InfoBody" TextLabelID="Update_encounter_client_vaccine_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_encounter_client_vaccine_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="encounter_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="encounter_id" HeaderText="encounter_id" InsertVisible="False" ReadOnly="True" SortExpression="encounter_id" />
                            <asp:BoundField DataField="vaccine_id" HeaderText="vaccine_id" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_id" />
                            <asp:BoundField DataField="current_client_medicine" HeaderText="current_client_medicine" InsertVisible="False" ReadOnly="True" SortExpression="current_client_medicine" />
                            <asp:BoundField DataField="assistance" HeaderText="assistance" InsertVisible="False" ReadOnly="True" SortExpression="assistance" Visible="false" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" InsertVisible="False" ReadOnly="True" SortExpression="quantity" Visible="false" />
                            <asp:BoundField DataField="Under_six_months_old" HeaderText="Under_six_months_old" InsertVisible="False" ReadOnly="True" SortExpression="Under_six_months_old" Visible="false" />
                            <asp:BoundField DataField="pregnant" HeaderText="pregnant" InsertVisible="False" ReadOnly="True" SortExpression="pregnant" Visible="false" />
                            <asp:BoundField DataField="children" HeaderText="children" InsertVisible="False" ReadOnly="True" SortExpression="children" Visible="false" />
                            <asp:BoundField DataField="occupation" HeaderText="occupation" InsertVisible="False" ReadOnly="True" SortExpression="occupation" Visible="false" />
                            <asp:BoundField DataField="chronic_disease" HeaderText="chronic_disease" InsertVisible="False" ReadOnly="True" SortExpression="chronic_disease" Visible="false" />
                            <asp:BoundField DataField="qualify" HeaderText="qualify" InsertVisible="False" ReadOnly="True" SortExpression="qualify" Visible="false" />
                            <asp:BoundField DataField="dose_date1" HeaderText="dose_date1" InsertVisible="False" ReadOnly="True" SortExpression="dose_date1" Visible="false" />
                            <asp:BoundField DataField="dose_date2" HeaderText="dose_date2" InsertVisible="False" ReadOnly="True" SortExpression="dose_date2" Visible="false" />
                            <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:ImageField DataImageUrlField = "encounter_id" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:BoundField DataField="vaccine_admin" HeaderText="vaccine_admin" InsertVisible="False" ReadOnly="True" SortExpression="vaccine_admin" Visible="false" />
                            <asp:BoundField DataField="guardian_f_name" HeaderText="guardian_f_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_f_name" Visible="false" />
                            <asp:BoundField DataField="guardian_l_name" HeaderText="guardian_l_name" InsertVisible="False" ReadOnly="True" SortExpression="guardian_l_name" Visible="false" />
                            <asp:BoundField DataField="guardian_mi" HeaderText="guardian_mi" InsertVisible="False" ReadOnly="True" SortExpression="guardian_mi" Visible="false" />
                            <asp:BoundField DataField="guardian_phone" HeaderText="guardian_phone" InsertVisible="False" ReadOnly="True" SortExpression="guardian_phone" Visible="false" />
                            <asp:BoundField DataField="adult_consent_date" HeaderText="adult_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="adult_consent_date" Visible="false" />
                            <asp:BoundField DataField="guard_consent_date" HeaderText="guard_consent_date" InsertVisible="False" ReadOnly="True" SortExpression="guard_consent_date" Visible="false" />
                            <asp:BoundField DataField="dose_form1" HeaderText="dose_form1" InsertVisible="False" ReadOnly="True" SortExpression="dose_form1" Visible="false" />
                            <asp:BoundField DataField="dose_form2" HeaderText="dose_form2" InsertVisible="False" ReadOnly="True" SortExpression="dose_form2" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [encounter_id], [vaccine_id], [current_client_medicine], [assistance], [quantity], [Under_six_months_old], [pregnant], [children], [occupation], [chronic_disease], [qualify], [dose_date1], [dose_date2], [adult_consent], [guardian_consent], [vaccine_admin], [guardian_f_name], [guardian_l_name], [guardian_mi], [guardian_phone], [adult_consent_date], [guard_consent_date], [dose_form1], [dose_form2] FROM [encounter_client_vaccine]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_encounter_client_vaccine_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_encounter_client_vaccine_InfoHead_label" Style="padding: 10px" runat="server" Text="encounter_client_vaccine Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_encounter_client_vaccine_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_encounter_id_lbl" runat="server" Font-Size="Large" Text="encounter_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_encounter_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vaccine_id_lbl" runat="server" Font-Size="Large" Text="vaccine_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vaccine_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_current_client_medicine_lbl" runat="server" Font-Size="Large" Text="current_client_medicine:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_current_client_medicine_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_assistance_lbl" runat="server" Font-Size="Large" Text="assistance:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_assistance_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_quantity_lbl" runat="server" Font-Size="Large" Text="quantity:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_quantity_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Under_six_months_old_lbl" runat="server" Font-Size="Large" Text="Under_six_months_old:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Under_six_months_old_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_pregnant_lbl" runat="server" Font-Size="Large" Text="pregnant:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_pregnant_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_children_lbl" runat="server" Font-Size="Large" Text="children:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_children_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_occupation_lbl" runat="server" Font-Size="Large" Text="occupation:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_occupation_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_chronic_disease_lbl" runat="server" Font-Size="Large" Text="chronic_disease:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_chronic_disease_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_qualify_lbl" runat="server" Font-Size="Large" Text="qualify:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_qualify_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_dose_date1_lbl" runat="server" Font-Size="Large" Text="dose_date1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_dose_date1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_dose_date2_lbl" runat="server" Font-Size="Large" Text="dose_date2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_dose_date2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_adult_consent_lbl" runat="server" Font-Size="Large" Text="adult_consent:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Delete_adult_consent_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_guardian_consent_lbl" runat="server" Font-Size="Large" Text="guardian_consent:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Delete_guardian_consent_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vaccine_admin_lbl" runat="server" Font-Size="Large" Text="vaccine_admin:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vaccine_admin_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_guardian_f_name_lbl" runat="server" Font-Size="Large" Text="guardian_f_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_guardian_f_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_guardian_l_name_lbl" runat="server" Font-Size="Large" Text="guardian_l_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_guardian_l_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_guardian_mi_lbl" runat="server" Font-Size="Large" Text="guardian_mi:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_guardian_mi_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_guardian_phone_lbl" runat="server" Font-Size="Large" Text="guardian_phone:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_guardian_phone_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_adult_consent_date_lbl" runat="server" Font-Size="Large" Text="adult_consent_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_adult_consent_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_guard_consent_date_lbl" runat="server" Font-Size="Large" Text="guard_consent_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_guard_consent_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_dose_form1_lbl" runat="server" Font-Size="Large" Text="dose_form1:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_dose_form1_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_dose_form2_lbl" runat="server" Font-Size="Large" Text="dose_form2:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_dose_form2_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeencounter_client_vaccineInfo" runat="server" CollapseControlID="Delete_encounter_client_vaccine_InfoHead" CollapsedText="Show encounter_client_vaccine Information" Enabled="True" ExpandControlID="Delete_encounter_client_vaccine_InfoHead" ExpandedText="encounter_client_vaccine Information" TargetControlID="Delete_encounter_client_vaccine_InfoBody" TextLabelID="Delete_encounter_client_vaccine_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

