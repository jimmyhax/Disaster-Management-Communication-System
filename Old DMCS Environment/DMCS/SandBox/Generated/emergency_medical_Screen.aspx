<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="emergency_medical_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.emergency_medical_Screen" %>
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
                                        <asp:GridView ID="Insert_emergency_medical_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="em_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="ambulance_company_name" HeaderText="ambulance_company_name" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_company_name" />
                            <asp:BoundField DataField="ambulance_identification" HeaderText="ambulance_identification" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_identification" Visible="false" />
                            <asp:BoundField DataField="appointment_date" HeaderText="appointment_date" InsertVisible="False" ReadOnly="True" SortExpression="appointment_date" Visible="false" />
                            <asp:BoundField DataField="area_of_specialty" HeaderText="area_of_specialty" InsertVisible="False" ReadOnly="True" SortExpression="area_of_specialty" Visible="false" />
                            <asp:BoundField DataField="assistance_order" HeaderText="assistance_order" InsertVisible="False" ReadOnly="True" SortExpression="assistance_order" Visible="false" />
                            <asp:BoundField DataField="date_of_service" HeaderText="date_of_service" InsertVisible="False" ReadOnly="True" SortExpression="date_of_service" Visible="false" />
                            <asp:BoundField DataField="degree_certifications" HeaderText="degree_certifications" InsertVisible="False" ReadOnly="True" SortExpression="degree_certifications" Visible="false" />
                            <asp:BoundField DataField="doctor_appointments" HeaderText="doctor_appointments" InsertVisible="False" ReadOnly="True" SortExpression="doctor_appointments" Visible="false" />
                            <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="doctor_id" Visible="false" />
                            <asp:BoundField DataField="doctor_start_date" HeaderText="doctor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="doctor_start_date" Visible="false" />
                            <asp:BoundField DataField="driver_id" HeaderText="driver_id" InsertVisible="False" ReadOnly="True" SortExpression="driver_id" Visible="false" />
                            <asp:BoundField DataField="educational_institution_name" HeaderText="educational_institution_name" InsertVisible="False" ReadOnly="True" SortExpression="educational_institution_name" Visible="false" />
                            <asp:BoundField DataField="external_examination" HeaderText="external_examination" InsertVisible="False" ReadOnly="True" SortExpression="external_examination" Visible="false" />
                            <asp:BoundField DataField="hospital_name" HeaderText="hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="hospital_name" Visible="false" />
                            <asp:BoundField DataField="internal_examination" HeaderText="internal_examination" InsertVisible="False" ReadOnly="True" SortExpression="internal_examination" Visible="false" />
                            <asp:BoundField DataField="lights_sirens_to_scene" HeaderText="lights_sirens_to_scene" InsertVisible="False" ReadOnly="True" SortExpression="lights_sirens_to_scene" Visible="false" />
                            <asp:BoundField DataField="location_type" HeaderText="location_type" InsertVisible="False" ReadOnly="True" SortExpression="location_type" Visible="false" />
                            <asp:BoundField DataField="number_of_days_admitted" HeaderText="number_of_days_admitted" InsertVisible="False" ReadOnly="True" SortExpression="number_of_days_admitted" Visible="false" />
                            <asp:BoundField DataField="office_location" HeaderText="office_location" InsertVisible="False" ReadOnly="True" SortExpression="office_location" Visible="false" />
                            <asp:BoundField DataField="other_remarks" HeaderText="other_remarks" InsertVisible="False" ReadOnly="True" SortExpression="other_remarks" Visible="false" />
                            <asp:BoundField DataField="prescription_medicines" HeaderText="prescription_medicines" InsertVisible="False" ReadOnly="True" SortExpression="prescription_medicines" Visible="false" />
                            <asp:BoundField DataField="time_of_service" HeaderText="time_of_service" InsertVisible="False" ReadOnly="True" SortExpression="time_of_service" Visible="false" />
                            <asp:BoundField DataField="total_cost" HeaderText="total_cost" InsertVisible="False" ReadOnly="True" SortExpression="total_cost" Visible="false" />
                            <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [em_id], [client_id], [ambulance_company_name], [ambulance_identification], [appointment_date], [area_of_specialty], [assistance_order], [date_of_service], [degree_certifications], [doctor_appointments], [doctor_id], [doctor_start_date], [driver_id], [educational_institution_name], [external_examination], [hospital_name], [internal_examination], [lights_sirens_to_scene], [location_type], [number_of_days_admitted], [office_location], [other_remarks], [prescription_medicines], [time_of_service], [total_cost], [deceased_id] FROM [emergency_medical]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_emergency_medical_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_emergency_medical_InfoHead_label" Style="padding: 10px" runat="server" Text="emergency_medical Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_emergency_medical_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ambulance_company_name_lbl" runat="server" Font-Size="Large" Text="ambulance_company_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ambulance_company_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ambulance_identification_lbl" runat="server" Font-Size="Large" Text="ambulance_identification:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ambulance_identification_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_appointment_date_lbl" runat="server" Font-Size="Large" Text="appointment_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_appointment_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_area_of_specialty_lbl" runat="server" Font-Size="Large" Text="area_of_specialty:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_area_of_specialty_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_assistance_order_lbl" runat="server" Font-Size="Large" Text="assistance_order:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_assistance_order_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_of_service_lbl" runat="server" Font-Size="Large" Text="date_of_service:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_of_service_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_degree_certifications_lbl" runat="server" Font-Size="Large" Text="degree_certifications:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_degree_certifications_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_doctor_appointments_lbl" runat="server" Font-Size="Large" Text="doctor_appointments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_doctor_appointments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_doctor_id_lbl" runat="server" Font-Size="Large" Text="doctor_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_doctor_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_doctor_start_date_lbl" runat="server" Font-Size="Large" Text="doctor_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_doctor_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_driver_id_lbl" runat="server" Font-Size="Large" Text="driver_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_driver_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_educational_institution_name_lbl" runat="server" Font-Size="Large" Text="educational_institution_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_educational_institution_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_external_examination_lbl" runat="server" Font-Size="Large" Text="external_examination:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_external_examination_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_hospital_name_lbl" runat="server" Font-Size="Large" Text="hospital_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_hospital_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_internal_examination_lbl" runat="server" Font-Size="Large" Text="internal_examination:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_internal_examination_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_lights_sirens_to_scene_lbl" runat="server" Font-Size="Large" Text="lights_sirens_to_scene:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_lights_sirens_to_scene_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_location_type_lbl" runat="server" Font-Size="Large" Text="location_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_location_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_number_of_days_admitted_lbl" runat="server" Font-Size="Large" Text="number_of_days_admitted:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_number_of_days_admitted_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_office_location_lbl" runat="server" Font-Size="Large" Text="office_location:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_office_location_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_other_remarks_lbl" runat="server" Font-Size="Large" Text="other_remarks:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_other_remarks_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_prescription_medicines_lbl" runat="server" Font-Size="Large" Text="prescription_medicines:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_prescription_medicines_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_time_of_service_lbl" runat="server" Font-Size="Large" Text="time_of_service:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_time_of_service_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_total_cost_lbl" runat="server" Font-Size="Large" Text="total_cost:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_total_cost_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_deceased_id_lbl" runat="server" Font-Size="Large" Text="deceased_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_deceased_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeemergency_medicalInfo" runat="server" CollapseControlID="Insert_emergency_medical_InfoHead" CollapsedText="Show emergency_medical Information" Enabled="True" ExpandControlID="Insert_emergency_medical_InfoHead" ExpandedText="emergency_medical Information" TargetControlID="Insert_emergency_medical_InfoBody" TextLabelID="Insert_emergency_medical_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_emergency_medical_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="em_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="ambulance_company_name" HeaderText="ambulance_company_name" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_company_name" />
                            <asp:BoundField DataField="ambulance_identification" HeaderText="ambulance_identification" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_identification" Visible="false" />
                            <asp:BoundField DataField="appointment_date" HeaderText="appointment_date" InsertVisible="False" ReadOnly="True" SortExpression="appointment_date" Visible="false" />
                            <asp:BoundField DataField="area_of_specialty" HeaderText="area_of_specialty" InsertVisible="False" ReadOnly="True" SortExpression="area_of_specialty" Visible="false" />
                            <asp:BoundField DataField="assistance_order" HeaderText="assistance_order" InsertVisible="False" ReadOnly="True" SortExpression="assistance_order" Visible="false" />
                            <asp:BoundField DataField="date_of_service" HeaderText="date_of_service" InsertVisible="False" ReadOnly="True" SortExpression="date_of_service" Visible="false" />
                            <asp:BoundField DataField="degree_certifications" HeaderText="degree_certifications" InsertVisible="False" ReadOnly="True" SortExpression="degree_certifications" Visible="false" />
                            <asp:BoundField DataField="doctor_appointments" HeaderText="doctor_appointments" InsertVisible="False" ReadOnly="True" SortExpression="doctor_appointments" Visible="false" />
                            <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="doctor_id" Visible="false" />
                            <asp:BoundField DataField="doctor_start_date" HeaderText="doctor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="doctor_start_date" Visible="false" />
                            <asp:BoundField DataField="driver_id" HeaderText="driver_id" InsertVisible="False" ReadOnly="True" SortExpression="driver_id" Visible="false" />
                            <asp:BoundField DataField="educational_institution_name" HeaderText="educational_institution_name" InsertVisible="False" ReadOnly="True" SortExpression="educational_institution_name" Visible="false" />
                            <asp:BoundField DataField="external_examination" HeaderText="external_examination" InsertVisible="False" ReadOnly="True" SortExpression="external_examination" Visible="false" />
                            <asp:BoundField DataField="hospital_name" HeaderText="hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="hospital_name" Visible="false" />
                            <asp:BoundField DataField="internal_examination" HeaderText="internal_examination" InsertVisible="False" ReadOnly="True" SortExpression="internal_examination" Visible="false" />
                            <asp:BoundField DataField="lights_sirens_to_scene" HeaderText="lights_sirens_to_scene" InsertVisible="False" ReadOnly="True" SortExpression="lights_sirens_to_scene" Visible="false" />
                            <asp:BoundField DataField="location_type" HeaderText="location_type" InsertVisible="False" ReadOnly="True" SortExpression="location_type" Visible="false" />
                            <asp:BoundField DataField="number_of_days_admitted" HeaderText="number_of_days_admitted" InsertVisible="False" ReadOnly="True" SortExpression="number_of_days_admitted" Visible="false" />
                            <asp:BoundField DataField="office_location" HeaderText="office_location" InsertVisible="False" ReadOnly="True" SortExpression="office_location" Visible="false" />
                            <asp:BoundField DataField="other_remarks" HeaderText="other_remarks" InsertVisible="False" ReadOnly="True" SortExpression="other_remarks" Visible="false" />
                            <asp:BoundField DataField="prescription_medicines" HeaderText="prescription_medicines" InsertVisible="False" ReadOnly="True" SortExpression="prescription_medicines" Visible="false" />
                            <asp:BoundField DataField="time_of_service" HeaderText="time_of_service" InsertVisible="False" ReadOnly="True" SortExpression="time_of_service" Visible="false" />
                            <asp:BoundField DataField="total_cost" HeaderText="total_cost" InsertVisible="False" ReadOnly="True" SortExpression="total_cost" Visible="false" />
                            <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [em_id], [client_id], [ambulance_company_name], [ambulance_identification], [appointment_date], [area_of_specialty], [assistance_order], [date_of_service], [degree_certifications], [doctor_appointments], [doctor_id], [doctor_start_date], [driver_id], [educational_institution_name], [external_examination], [hospital_name], [internal_examination], [lights_sirens_to_scene], [location_type], [number_of_days_admitted], [office_location], [other_remarks], [prescription_medicines], [time_of_service], [total_cost], [deceased_id] FROM [emergency_medical]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_emergency_medical_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_emergency_medical_InfoHead_label" Style="padding: 10px" runat="server" Text="emergency_medical Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_emergency_medical_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_em_id_lbl" runat="server" Font-Size="Large" Text="em_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_em_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ambulance_company_name_lbl" runat="server" Font-Size="Large" Text="ambulance_company_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ambulance_company_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ambulance_identification_lbl" runat="server" Font-Size="Large" Text="ambulance_identification:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ambulance_identification_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_appointment_date_lbl" runat="server" Font-Size="Large" Text="appointment_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_appointment_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_area_of_specialty_lbl" runat="server" Font-Size="Large" Text="area_of_specialty:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_area_of_specialty_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_assistance_order_lbl" runat="server" Font-Size="Large" Text="assistance_order:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_assistance_order_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_of_service_lbl" runat="server" Font-Size="Large" Text="date_of_service:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_of_service_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_degree_certifications_lbl" runat="server" Font-Size="Large" Text="degree_certifications:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_degree_certifications_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_doctor_appointments_lbl" runat="server" Font-Size="Large" Text="doctor_appointments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_doctor_appointments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_doctor_id_lbl" runat="server" Font-Size="Large" Text="doctor_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_doctor_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_doctor_start_date_lbl" runat="server" Font-Size="Large" Text="doctor_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_doctor_start_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_driver_id_lbl" runat="server" Font-Size="Large" Text="driver_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_driver_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_educational_institution_name_lbl" runat="server" Font-Size="Large" Text="educational_institution_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_educational_institution_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_external_examination_lbl" runat="server" Font-Size="Large" Text="external_examination:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_external_examination_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_hospital_name_lbl" runat="server" Font-Size="Large" Text="hospital_name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_hospital_name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_internal_examination_lbl" runat="server" Font-Size="Large" Text="internal_examination:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_internal_examination_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_lights_sirens_to_scene_lbl" runat="server" Font-Size="Large" Text="lights_sirens_to_scene:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_lights_sirens_to_scene_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_location_type_lbl" runat="server" Font-Size="Large" Text="location_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_location_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_number_of_days_admitted_lbl" runat="server" Font-Size="Large" Text="number_of_days_admitted:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_number_of_days_admitted_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_office_location_lbl" runat="server" Font-Size="Large" Text="office_location:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_office_location_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_other_remarks_lbl" runat="server" Font-Size="Large" Text="other_remarks:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_other_remarks_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_prescription_medicines_lbl" runat="server" Font-Size="Large" Text="prescription_medicines:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_prescription_medicines_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_time_of_service_lbl" runat="server" Font-Size="Large" Text="time_of_service:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_time_of_service_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_total_cost_lbl" runat="server" Font-Size="Large" Text="total_cost:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_total_cost_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_deceased_id_lbl" runat="server" Font-Size="Large" Text="deceased_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_deceased_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpeemergency_medicalInfo" runat="server" CollapseControlID="Update_emergency_medical_InfoHead" CollapsedText="Show emergency_medical Information" Enabled="True" ExpandControlID="Update_emergency_medical_InfoHead" ExpandedText="emergency_medical Information" TargetControlID="Update_emergency_medical_InfoBody" TextLabelID="Update_emergency_medical_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_emergency_medical_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="em_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="em_id" HeaderText="em_id" InsertVisible="False" ReadOnly="True" SortExpression="em_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="ambulance_company_name" HeaderText="ambulance_company_name" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_company_name" />
                            <asp:BoundField DataField="ambulance_identification" HeaderText="ambulance_identification" InsertVisible="False" ReadOnly="True" SortExpression="ambulance_identification" Visible="false" />
                            <asp:BoundField DataField="appointment_date" HeaderText="appointment_date" InsertVisible="False" ReadOnly="True" SortExpression="appointment_date" Visible="false" />
                            <asp:BoundField DataField="area_of_specialty" HeaderText="area_of_specialty" InsertVisible="False" ReadOnly="True" SortExpression="area_of_specialty" Visible="false" />
                            <asp:BoundField DataField="assistance_order" HeaderText="assistance_order" InsertVisible="False" ReadOnly="True" SortExpression="assistance_order" Visible="false" />
                            <asp:BoundField DataField="date_of_service" HeaderText="date_of_service" InsertVisible="False" ReadOnly="True" SortExpression="date_of_service" Visible="false" />
                            <asp:BoundField DataField="degree_certifications" HeaderText="degree_certifications" InsertVisible="False" ReadOnly="True" SortExpression="degree_certifications" Visible="false" />
                            <asp:BoundField DataField="doctor_appointments" HeaderText="doctor_appointments" InsertVisible="False" ReadOnly="True" SortExpression="doctor_appointments" Visible="false" />
                            <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="doctor_id" Visible="false" />
                            <asp:BoundField DataField="doctor_start_date" HeaderText="doctor_start_date" InsertVisible="False" ReadOnly="True" SortExpression="doctor_start_date" Visible="false" />
                            <asp:BoundField DataField="driver_id" HeaderText="driver_id" InsertVisible="False" ReadOnly="True" SortExpression="driver_id" Visible="false" />
                            <asp:BoundField DataField="educational_institution_name" HeaderText="educational_institution_name" InsertVisible="False" ReadOnly="True" SortExpression="educational_institution_name" Visible="false" />
                            <asp:BoundField DataField="external_examination" HeaderText="external_examination" InsertVisible="False" ReadOnly="True" SortExpression="external_examination" Visible="false" />
                            <asp:BoundField DataField="hospital_name" HeaderText="hospital_name" InsertVisible="False" ReadOnly="True" SortExpression="hospital_name" Visible="false" />
                            <asp:BoundField DataField="internal_examination" HeaderText="internal_examination" InsertVisible="False" ReadOnly="True" SortExpression="internal_examination" Visible="false" />
                            <asp:BoundField DataField="lights_sirens_to_scene" HeaderText="lights_sirens_to_scene" InsertVisible="False" ReadOnly="True" SortExpression="lights_sirens_to_scene" Visible="false" />
                            <asp:BoundField DataField="location_type" HeaderText="location_type" InsertVisible="False" ReadOnly="True" SortExpression="location_type" Visible="false" />
                            <asp:BoundField DataField="number_of_days_admitted" HeaderText="number_of_days_admitted" InsertVisible="False" ReadOnly="True" SortExpression="number_of_days_admitted" Visible="false" />
                            <asp:BoundField DataField="office_location" HeaderText="office_location" InsertVisible="False" ReadOnly="True" SortExpression="office_location" Visible="false" />
                            <asp:BoundField DataField="other_remarks" HeaderText="other_remarks" InsertVisible="False" ReadOnly="True" SortExpression="other_remarks" Visible="false" />
                            <asp:BoundField DataField="prescription_medicines" HeaderText="prescription_medicines" InsertVisible="False" ReadOnly="True" SortExpression="prescription_medicines" Visible="false" />
                            <asp:BoundField DataField="time_of_service" HeaderText="time_of_service" InsertVisible="False" ReadOnly="True" SortExpression="time_of_service" Visible="false" />
                            <asp:BoundField DataField="total_cost" HeaderText="total_cost" InsertVisible="False" ReadOnly="True" SortExpression="total_cost" Visible="false" />
                            <asp:BoundField DataField="deceased_id" HeaderText="deceased_id" InsertVisible="False" ReadOnly="True" SortExpression="deceased_id" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [em_id], [client_id], [ambulance_company_name], [ambulance_identification], [appointment_date], [area_of_specialty], [assistance_order], [date_of_service], [degree_certifications], [doctor_appointments], [doctor_id], [doctor_start_date], [driver_id], [educational_institution_name], [external_examination], [hospital_name], [internal_examination], [lights_sirens_to_scene], [location_type], [number_of_days_admitted], [office_location], [other_remarks], [prescription_medicines], [time_of_service], [total_cost], [deceased_id] FROM [emergency_medical]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_emergency_medical_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_emergency_medical_InfoHead_label" Style="padding: 10px" runat="server" Text="emergency_medical Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_emergency_medical_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_em_id_lbl" runat="server" Font-Size="Large" Text="em_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_em_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_client_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ambulance_company_name_lbl" runat="server" Font-Size="Large" Text="ambulance_company_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ambulance_company_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ambulance_identification_lbl" runat="server" Font-Size="Large" Text="ambulance_identification:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ambulance_identification_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_appointment_date_lbl" runat="server" Font-Size="Large" Text="appointment_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_appointment_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_area_of_specialty_lbl" runat="server" Font-Size="Large" Text="area_of_specialty:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_area_of_specialty_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_assistance_order_lbl" runat="server" Font-Size="Large" Text="assistance_order:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_assistance_order_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_of_service_lbl" runat="server" Font-Size="Large" Text="date_of_service:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_of_service_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_degree_certifications_lbl" runat="server" Font-Size="Large" Text="degree_certifications:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_degree_certifications_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_doctor_appointments_lbl" runat="server" Font-Size="Large" Text="doctor_appointments:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_doctor_appointments_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_doctor_id_lbl" runat="server" Font-Size="Large" Text="doctor_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_doctor_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_doctor_start_date_lbl" runat="server" Font-Size="Large" Text="doctor_start_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_doctor_start_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_driver_id_lbl" runat="server" Font-Size="Large" Text="driver_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_driver_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_educational_institution_name_lbl" runat="server" Font-Size="Large" Text="educational_institution_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_educational_institution_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_external_examination_lbl" runat="server" Font-Size="Large" Text="external_examination:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_external_examination_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_hospital_name_lbl" runat="server" Font-Size="Large" Text="hospital_name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_hospital_name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_internal_examination_lbl" runat="server" Font-Size="Large" Text="internal_examination:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_internal_examination_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_lights_sirens_to_scene_lbl" runat="server" Font-Size="Large" Text="lights_sirens_to_scene:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_lights_sirens_to_scene_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_location_type_lbl" runat="server" Font-Size="Large" Text="location_type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_location_type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_number_of_days_admitted_lbl" runat="server" Font-Size="Large" Text="number_of_days_admitted:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_number_of_days_admitted_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_office_location_lbl" runat="server" Font-Size="Large" Text="office_location:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_office_location_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_other_remarks_lbl" runat="server" Font-Size="Large" Text="other_remarks:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_other_remarks_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_prescription_medicines_lbl" runat="server" Font-Size="Large" Text="prescription_medicines:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_prescription_medicines_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_time_of_service_lbl" runat="server" Font-Size="Large" Text="time_of_service:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_time_of_service_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_total_cost_lbl" runat="server" Font-Size="Large" Text="total_cost:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_total_cost_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_deceased_id_lbl" runat="server" Font-Size="Large" Text="deceased_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_deceased_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpeemergency_medicalInfo" runat="server" CollapseControlID="Delete_emergency_medical_InfoHead" CollapsedText="Show emergency_medical Information" Enabled="True" ExpandControlID="Delete_emergency_medical_InfoHead" ExpandedText="emergency_medical Information" TargetControlID="Delete_emergency_medical_InfoBody" TextLabelID="Delete_emergency_medical_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

