<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="vehicle_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.vehicle_Screen" %>
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
                                        <asp:GridView ID="Insert_vehicle_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="vehicle_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="vehicle_id" HeaderText="vehicle_id" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="vehicle_make" HeaderText="vehicle_make" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_make" Visible="false" />
                            <asp:BoundField DataField="vehicle_model" HeaderText="vehicle_model" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_model" Visible="false" />
                            <asp:BoundField DataField="vehicle_type" HeaderText="vehicle_type" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_type" Visible="false" />
                            <asp:BoundField DataField="vehicle_year" HeaderText="vehicle_year" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_year" Visible="false" />
                            <asp:BoundField DataField="vehicle_desc" HeaderText="vehicle_desc" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_desc" Visible="false" />
                            <asp:BoundField DataField="vin" HeaderText="vin" InsertVisible="False" ReadOnly="True" SortExpression="vin" Visible="false" />
                            <asp:BoundField DataField="start_mileage" HeaderText="start_mileage" InsertVisible="False" ReadOnly="True" SortExpression="start_mileage" Visible="false" />
                            <asp:BoundField DataField="first_service_date" HeaderText="first_service_date" InsertVisible="False" ReadOnly="True" SortExpression="first_service_date" Visible="false" />
                            <asp:BoundField DataField="last_service_date" HeaderText="last_service_date" InsertVisible="False" ReadOnly="True" SortExpression="last_service_date" Visible="false" />
                            <asp:BoundField DataField="PLATENUMBER" HeaderText="PLATENUMBER" InsertVisible="False" ReadOnly="True" SortExpression="PLATENUMBER" Visible="false" />
                            <asp:BoundField DataField="FUELTYPE" HeaderText="FUELTYPE" InsertVisible="False" ReadOnly="True" SortExpression="FUELTYPE" Visible="false" />
                            <asp:BoundField DataField="MPH" HeaderText="MPH" InsertVisible="False" ReadOnly="True" SortExpression="MPH" Visible="false" />
                            <asp:BoundField DataField="INSURED" HeaderText="INSURED" InsertVisible="False" ReadOnly="True" SortExpression="INSURED" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [vehicle_id], [case_id], [client_id], [vehicle_make], [vehicle_model], [vehicle_type], [vehicle_year], [vehicle_desc], [vin], [start_mileage], [first_service_date], [last_service_date], [PLATENUMBER], [FUELTYPE], [MPH], [INSURED] FROM [vehicle]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_vehicle_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_vehicle_InfoHead_label" Style="padding: 10px" runat="server" Text="vehicle Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_vehicle_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_case_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vehicle_make_lbl" runat="server" Font-Size="Large" Text="vehicle_make:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vehicle_make_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vehicle_model_lbl" runat="server" Font-Size="Large" Text="vehicle_model:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vehicle_model_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vehicle_type_lbl" runat="server" Font-Size="Large" Text="vehicle_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vehicle_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vehicle_year_lbl" runat="server" Font-Size="Large" Text="vehicle_year:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vehicle_year_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vehicle_desc_lbl" runat="server" Font-Size="Large" Text="vehicle_desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vehicle_desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_vin_lbl" runat="server" Font-Size="Large" Text="vin:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_vin_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_start_mileage_lbl" runat="server" Font-Size="Large" Text="start_mileage:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_start_mileage_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_first_service_date_lbl" runat="server" Font-Size="Large" Text="first_service_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_first_service_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_last_service_date_lbl" runat="server" Font-Size="Large" Text="last_service_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_last_service_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_PLATENUMBER_lbl" runat="server" Font-Size="Large" Text="PLATENUMBER:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_PLATENUMBER_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_FUELTYPE_lbl" runat="server" Font-Size="Large" Text="FUELTYPE:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_FUELTYPE_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_MPH_lbl" runat="server" Font-Size="Large" Text="MPH:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_MPH_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_INSURED_lbl" runat="server" Font-Size="Large" Text="INSURED:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_INSURED_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpevehicleInfo" runat="server" CollapseControlID="Insert_vehicle_InfoHead" CollapsedText="Show vehicle Information" Enabled="True" ExpandControlID="Insert_vehicle_InfoHead" ExpandedText="vehicle Information" TargetControlID="Insert_vehicle_InfoBody" TextLabelID="Insert_vehicle_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_vehicle_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="vehicle_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="vehicle_id" HeaderText="vehicle_id" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="vehicle_make" HeaderText="vehicle_make" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_make" Visible="false" />
                            <asp:BoundField DataField="vehicle_model" HeaderText="vehicle_model" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_model" Visible="false" />
                            <asp:BoundField DataField="vehicle_type" HeaderText="vehicle_type" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_type" Visible="false" />
                            <asp:BoundField DataField="vehicle_year" HeaderText="vehicle_year" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_year" Visible="false" />
                            <asp:BoundField DataField="vehicle_desc" HeaderText="vehicle_desc" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_desc" Visible="false" />
                            <asp:BoundField DataField="vin" HeaderText="vin" InsertVisible="False" ReadOnly="True" SortExpression="vin" Visible="false" />
                            <asp:BoundField DataField="start_mileage" HeaderText="start_mileage" InsertVisible="False" ReadOnly="True" SortExpression="start_mileage" Visible="false" />
                            <asp:BoundField DataField="first_service_date" HeaderText="first_service_date" InsertVisible="False" ReadOnly="True" SortExpression="first_service_date" Visible="false" />
                            <asp:BoundField DataField="last_service_date" HeaderText="last_service_date" InsertVisible="False" ReadOnly="True" SortExpression="last_service_date" Visible="false" />
                            <asp:BoundField DataField="PLATENUMBER" HeaderText="PLATENUMBER" InsertVisible="False" ReadOnly="True" SortExpression="PLATENUMBER" Visible="false" />
                            <asp:BoundField DataField="FUELTYPE" HeaderText="FUELTYPE" InsertVisible="False" ReadOnly="True" SortExpression="FUELTYPE" Visible="false" />
                            <asp:BoundField DataField="MPH" HeaderText="MPH" InsertVisible="False" ReadOnly="True" SortExpression="MPH" Visible="false" />
                            <asp:BoundField DataField="INSURED" HeaderText="INSURED" InsertVisible="False" ReadOnly="True" SortExpression="INSURED" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [vehicle_id], [case_id], [client_id], [vehicle_make], [vehicle_model], [vehicle_type], [vehicle_year], [vehicle_desc], [vin], [start_mileage], [first_service_date], [last_service_date], [PLATENUMBER], [FUELTYPE], [MPH], [INSURED] FROM [vehicle]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_vehicle_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_vehicle_InfoHead_label" Style="padding: 10px" runat="server" Text="vehicle Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_vehicle_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vehicle_id_lbl" runat="server" Font-Size="Large" Text="vehicle_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vehicle_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_case_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vehicle_make_lbl" runat="server" Font-Size="Large" Text="vehicle_make:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vehicle_make_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vehicle_model_lbl" runat="server" Font-Size="Large" Text="vehicle_model:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vehicle_model_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vehicle_type_lbl" runat="server" Font-Size="Large" Text="vehicle_type:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vehicle_type_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vehicle_year_lbl" runat="server" Font-Size="Large" Text="vehicle_year:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vehicle_year_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vehicle_desc_lbl" runat="server" Font-Size="Large" Text="vehicle_desc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vehicle_desc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_vin_lbl" runat="server" Font-Size="Large" Text="vin:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_vin_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_start_mileage_lbl" runat="server" Font-Size="Large" Text="start_mileage:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_start_mileage_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_first_service_date_lbl" runat="server" Font-Size="Large" Text="first_service_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_first_service_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_last_service_date_lbl" runat="server" Font-Size="Large" Text="last_service_date:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_last_service_date_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_PLATENUMBER_lbl" runat="server" Font-Size="Large" Text="PLATENUMBER:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_PLATENUMBER_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_FUELTYPE_lbl" runat="server" Font-Size="Large" Text="FUELTYPE:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_FUELTYPE_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_MPH_lbl" runat="server" Font-Size="Large" Text="MPH:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_MPH_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_INSURED_lbl" runat="server" Font-Size="Large" Text="INSURED:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_INSURED_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpevehicleInfo" runat="server" CollapseControlID="Update_vehicle_InfoHead" CollapsedText="Show vehicle Information" Enabled="True" ExpandControlID="Update_vehicle_InfoHead" ExpandedText="vehicle Information" TargetControlID="Update_vehicle_InfoBody" TextLabelID="Update_vehicle_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_vehicle_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="vehicle_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="vehicle_id" HeaderText="vehicle_id" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                            <asp:BoundField DataField="vehicle_make" HeaderText="vehicle_make" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_make" Visible="false" />
                            <asp:BoundField DataField="vehicle_model" HeaderText="vehicle_model" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_model" Visible="false" />
                            <asp:BoundField DataField="vehicle_type" HeaderText="vehicle_type" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_type" Visible="false" />
                            <asp:BoundField DataField="vehicle_year" HeaderText="vehicle_year" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_year" Visible="false" />
                            <asp:BoundField DataField="vehicle_desc" HeaderText="vehicle_desc" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_desc" Visible="false" />
                            <asp:BoundField DataField="vin" HeaderText="vin" InsertVisible="False" ReadOnly="True" SortExpression="vin" Visible="false" />
                            <asp:BoundField DataField="start_mileage" HeaderText="start_mileage" InsertVisible="False" ReadOnly="True" SortExpression="start_mileage" Visible="false" />
                            <asp:BoundField DataField="first_service_date" HeaderText="first_service_date" InsertVisible="False" ReadOnly="True" SortExpression="first_service_date" Visible="false" />
                            <asp:BoundField DataField="last_service_date" HeaderText="last_service_date" InsertVisible="False" ReadOnly="True" SortExpression="last_service_date" Visible="false" />
                            <asp:BoundField DataField="PLATENUMBER" HeaderText="PLATENUMBER" InsertVisible="False" ReadOnly="True" SortExpression="PLATENUMBER" Visible="false" />
                            <asp:BoundField DataField="FUELTYPE" HeaderText="FUELTYPE" InsertVisible="False" ReadOnly="True" SortExpression="FUELTYPE" Visible="false" />
                            <asp:BoundField DataField="MPH" HeaderText="MPH" InsertVisible="False" ReadOnly="True" SortExpression="MPH" Visible="false" />
                            <asp:BoundField DataField="INSURED" HeaderText="INSURED" InsertVisible="False" ReadOnly="True" SortExpression="INSURED" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [vehicle_id], [case_id], [client_id], [vehicle_make], [vehicle_model], [vehicle_type], [vehicle_year], [vehicle_desc], [vin], [start_mileage], [first_service_date], [last_service_date], [PLATENUMBER], [FUELTYPE], [MPH], [INSURED] FROM [vehicle]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_vehicle_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_vehicle_InfoHead_label" Style="padding: 10px" runat="server" Text="vehicle Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_vehicle_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vehicle_id_lbl" runat="server" Font-Size="Large" Text="vehicle_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vehicle_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_case_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_client_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vehicle_make_lbl" runat="server" Font-Size="Large" Text="vehicle_make:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vehicle_make_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vehicle_model_lbl" runat="server" Font-Size="Large" Text="vehicle_model:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vehicle_model_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vehicle_type_lbl" runat="server" Font-Size="Large" Text="vehicle_type:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vehicle_type_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vehicle_year_lbl" runat="server" Font-Size="Large" Text="vehicle_year:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vehicle_year_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vehicle_desc_lbl" runat="server" Font-Size="Large" Text="vehicle_desc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vehicle_desc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_vin_lbl" runat="server" Font-Size="Large" Text="vin:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_vin_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_start_mileage_lbl" runat="server" Font-Size="Large" Text="start_mileage:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_start_mileage_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_first_service_date_lbl" runat="server" Font-Size="Large" Text="first_service_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_first_service_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_last_service_date_lbl" runat="server" Font-Size="Large" Text="last_service_date:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_last_service_date_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_PLATENUMBER_lbl" runat="server" Font-Size="Large" Text="PLATENUMBER:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_PLATENUMBER_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_FUELTYPE_lbl" runat="server" Font-Size="Large" Text="FUELTYPE:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_FUELTYPE_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_MPH_lbl" runat="server" Font-Size="Large" Text="MPH:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_MPH_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_INSURED_lbl" runat="server" Font-Size="Large" Text="INSURED:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_INSURED_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpevehicleInfo" runat="server" CollapseControlID="Delete_vehicle_InfoHead" CollapsedText="Show vehicle Information" Enabled="True" ExpandControlID="Delete_vehicle_InfoHead" ExpandedText="vehicle Information" TargetControlID="Delete_vehicle_InfoBody" TextLabelID="Delete_vehicle_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

