<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Pet_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.Pet_Screen" %>
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
                                        <asp:GridView ID="Insert_Pet_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Pet_Record_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                            <asp:BoundField DataField="Pet_Location_Found_ID" HeaderText="Pet_Location_Found_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Location_Found_ID" />
                            <asp:BoundField DataField="Pet_Type_ID" HeaderText="Pet_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Type_ID" />
                            <asp:BoundField DataField="Pet_Vet_ID" HeaderText="Pet_Vet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vet_ID" Visible="false" />
                            <asp:BoundField DataField="Pet_License_Tag" HeaderText="Pet_License_Tag" InsertVisible="False" ReadOnly="True" SortExpression="Pet_License_Tag" Visible="false" />
                            <asp:BoundField DataField="Pet_RFID" HeaderText="Pet_RFID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_RFID" Visible="false" />
                            <asp:BoundField DataField="Pet_Tatoo_No" HeaderText="Pet_Tatoo_No" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Tatoo_No" Visible="false" />
                            <asp:BoundField DataField="Pet_Name" HeaderText="Pet_Name" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Name" Visible="false" />
                            <asp:BoundField DataField="Pet_Gender" HeaderText="Pet_Gender" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Gender" Visible="false" />
                            <asp:BoundField DataField="Pet_Color" HeaderText="Pet_Color" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Color" Visible="false" />
                            <asp:BoundField DataField="Pet_Weight" HeaderText="Pet_Weight" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Weight" Visible="false" />
                            <asp:BoundField DataField="Pet_Description" HeaderText="Pet_Description" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Description" Visible="false" />
                            <asp:BoundField DataField="Pet_Condition" HeaderText="Pet_Condition" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Condition" Visible="false" />
                            <asp:BoundField DataField="Pet_Status" HeaderText="Pet_Status" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Status" Visible="false" />
                            <asp:BoundField DataField="Pet_Date_Of_Birth" HeaderText="Pet_Date_Of_Birth" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Date_Of_Birth" Visible="false" />
                            <asp:ImageField DataImageUrlField = "Pet_Record_ID" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:BoundField DataField="Pet_Sterilized" HeaderText="Pet_Sterilized" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Sterilized" Visible="false" />
                            <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                            <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Pet_Record_ID], [Pet_Location_Found_ID], [Pet_Type_ID], [Pet_Vet_ID], [Pet_License_Tag], [Pet_RFID], [Pet_Tatoo_No], [Pet_Name], [Pet_Gender], [Pet_Color], [Pet_Weight], [Pet_Description], [Pet_Condition], [Pet_Status], [Pet_Date_Of_Birth], [Pet_Picture], [Pet_Sterilized], [Date_Modified], [Date_Created] FROM [Pet]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Pet_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Pet_InfoHead_label" Style="padding: 10px" runat="server" Text="Pet Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Pet_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Location_Found_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Location_Found_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Location_Found_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Type_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Type_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Type_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Vet_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Vet_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Vet_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_License_Tag_lbl" runat="server" Font-Size="Large" Text="Pet_License_Tag:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_License_Tag_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_RFID_lbl" runat="server" Font-Size="Large" Text="Pet_RFID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_RFID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Tatoo_No_lbl" runat="server" Font-Size="Large" Text="Pet_Tatoo_No:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Tatoo_No_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Name_lbl" runat="server" Font-Size="Large" Text="Pet_Name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Gender_lbl" runat="server" Font-Size="Large" Text="Pet_Gender:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Gender_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Color_lbl" runat="server" Font-Size="Large" Text="Pet_Color:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Color_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Weight_lbl" runat="server" Font-Size="Large" Text="Pet_Weight:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Weight_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Description_lbl" runat="server" Font-Size="Large" Text="Pet_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Condition_lbl" runat="server" Font-Size="Large" Text="Pet_Condition:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Condition_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Status_lbl" runat="server" Font-Size="Large" Text="Pet_Status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Date_Of_Birth_lbl" runat="server" Font-Size="Large" Text="Pet_Date_Of_Birth:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Date_Of_Birth_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Picture_lbl" runat="server" Font-Size="Large" Text="Pet_Picture:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Insert_Pet_Picture_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                     <asp:FileUpload ID="Insert_Pet_Picture_FileUpload" runat="server" />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Pet_Sterilized_lbl" runat="server" Font-Size="Large" Text="Pet_Sterilized:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Pet_Sterilized_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Date_Modified_lbl" runat="server" Font-Size="Large" Text="Date_Modified:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Date_Modified_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Date_Created_lbl" runat="server" Font-Size="Large" Text="Date_Created:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Date_Created_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpePetInfo" runat="server" CollapseControlID="Insert_Pet_InfoHead" CollapsedText="Show Pet Information" Enabled="True" ExpandControlID="Insert_Pet_InfoHead" ExpandedText="Pet Information" TargetControlID="Insert_Pet_InfoBody" TextLabelID="Insert_Pet_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_Pet_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Pet_Record_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                            <asp:BoundField DataField="Pet_Location_Found_ID" HeaderText="Pet_Location_Found_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Location_Found_ID" />
                            <asp:BoundField DataField="Pet_Type_ID" HeaderText="Pet_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Type_ID" />
                            <asp:BoundField DataField="Pet_Vet_ID" HeaderText="Pet_Vet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vet_ID" Visible="false" />
                            <asp:BoundField DataField="Pet_License_Tag" HeaderText="Pet_License_Tag" InsertVisible="False" ReadOnly="True" SortExpression="Pet_License_Tag" Visible="false" />
                            <asp:BoundField DataField="Pet_RFID" HeaderText="Pet_RFID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_RFID" Visible="false" />
                            <asp:BoundField DataField="Pet_Tatoo_No" HeaderText="Pet_Tatoo_No" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Tatoo_No" Visible="false" />
                            <asp:BoundField DataField="Pet_Name" HeaderText="Pet_Name" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Name" Visible="false" />
                            <asp:BoundField DataField="Pet_Gender" HeaderText="Pet_Gender" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Gender" Visible="false" />
                            <asp:BoundField DataField="Pet_Color" HeaderText="Pet_Color" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Color" Visible="false" />
                            <asp:BoundField DataField="Pet_Weight" HeaderText="Pet_Weight" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Weight" Visible="false" />
                            <asp:BoundField DataField="Pet_Description" HeaderText="Pet_Description" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Description" Visible="false" />
                            <asp:BoundField DataField="Pet_Condition" HeaderText="Pet_Condition" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Condition" Visible="false" />
                            <asp:BoundField DataField="Pet_Status" HeaderText="Pet_Status" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Status" Visible="false" />
                            <asp:BoundField DataField="Pet_Date_Of_Birth" HeaderText="Pet_Date_Of_Birth" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Date_Of_Birth" Visible="false" />
                            <asp:ImageField DataImageUrlField = "Pet_Record_ID" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:BoundField DataField="Pet_Sterilized" HeaderText="Pet_Sterilized" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Sterilized" Visible="false" />
                            <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                            <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Pet_Record_ID], [Pet_Location_Found_ID], [Pet_Type_ID], [Pet_Vet_ID], [Pet_License_Tag], [Pet_RFID], [Pet_Tatoo_No], [Pet_Name], [Pet_Gender], [Pet_Color], [Pet_Weight], [Pet_Description], [Pet_Condition], [Pet_Status], [Pet_Date_Of_Birth], [Pet_Picture], [Pet_Sterilized], [Date_Modified], [Date_Created] FROM [Pet]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Pet_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Pet_InfoHead_label" Style="padding: 10px" runat="server" Text="Pet Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Pet_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Record_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Record_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Record_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Location_Found_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Location_Found_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Location_Found_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Type_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Type_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Type_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Vet_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Vet_ID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Vet_ID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_License_Tag_lbl" runat="server" Font-Size="Large" Text="Pet_License_Tag:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_License_Tag_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_RFID_lbl" runat="server" Font-Size="Large" Text="Pet_RFID:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_RFID_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Tatoo_No_lbl" runat="server" Font-Size="Large" Text="Pet_Tatoo_No:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Tatoo_No_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Name_lbl" runat="server" Font-Size="Large" Text="Pet_Name:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Name_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Gender_lbl" runat="server" Font-Size="Large" Text="Pet_Gender:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Gender_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Color_lbl" runat="server" Font-Size="Large" Text="Pet_Color:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Color_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Weight_lbl" runat="server" Font-Size="Large" Text="Pet_Weight:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Weight_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Description_lbl" runat="server" Font-Size="Large" Text="Pet_Description:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Description_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Condition_lbl" runat="server" Font-Size="Large" Text="Pet_Condition:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Condition_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Status_lbl" runat="server" Font-Size="Large" Text="Pet_Status:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Status_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Date_Of_Birth_lbl" runat="server" Font-Size="Large" Text="Pet_Date_Of_Birth:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Date_Of_Birth_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Picture_lbl" runat="server" Font-Size="Large" Text="Pet_Picture:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Update_Pet_Picture_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                     <asp:FileUpload ID="Update_Pet_Picture_FileUpload" runat="server" />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Pet_Sterilized_lbl" runat="server" Font-Size="Large" Text="Pet_Sterilized:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Pet_Sterilized_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Date_Modified_lbl" runat="server" Font-Size="Large" Text="Date_Modified:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Date_Modified_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Date_Created_lbl" runat="server" Font-Size="Large" Text="Date_Created:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Date_Created_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpePetInfo" runat="server" CollapseControlID="Update_Pet_InfoHead" CollapsedText="Show Pet Information" Enabled="True" ExpandControlID="Update_Pet_InfoHead" ExpandedText="Pet Information" TargetControlID="Update_Pet_InfoBody" TextLabelID="Update_Pet_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_Pet_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="Pet_Record_ID" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="Pet_Record_ID" HeaderText="Pet_Record_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Record_ID" />
                            <asp:BoundField DataField="Pet_Location_Found_ID" HeaderText="Pet_Location_Found_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Location_Found_ID" />
                            <asp:BoundField DataField="Pet_Type_ID" HeaderText="Pet_Type_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Type_ID" />
                            <asp:BoundField DataField="Pet_Vet_ID" HeaderText="Pet_Vet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Vet_ID" Visible="false" />
                            <asp:BoundField DataField="Pet_License_Tag" HeaderText="Pet_License_Tag" InsertVisible="False" ReadOnly="True" SortExpression="Pet_License_Tag" Visible="false" />
                            <asp:BoundField DataField="Pet_RFID" HeaderText="Pet_RFID" InsertVisible="False" ReadOnly="True" SortExpression="Pet_RFID" Visible="false" />
                            <asp:BoundField DataField="Pet_Tatoo_No" HeaderText="Pet_Tatoo_No" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Tatoo_No" Visible="false" />
                            <asp:BoundField DataField="Pet_Name" HeaderText="Pet_Name" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Name" Visible="false" />
                            <asp:BoundField DataField="Pet_Gender" HeaderText="Pet_Gender" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Gender" Visible="false" />
                            <asp:BoundField DataField="Pet_Color" HeaderText="Pet_Color" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Color" Visible="false" />
                            <asp:BoundField DataField="Pet_Weight" HeaderText="Pet_Weight" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Weight" Visible="false" />
                            <asp:BoundField DataField="Pet_Description" HeaderText="Pet_Description" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Description" Visible="false" />
                            <asp:BoundField DataField="Pet_Condition" HeaderText="Pet_Condition" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Condition" Visible="false" />
                            <asp:BoundField DataField="Pet_Status" HeaderText="Pet_Status" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Status" Visible="false" />
                            <asp:BoundField DataField="Pet_Date_Of_Birth" HeaderText="Pet_Date_Of_Birth" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Date_Of_Birth" Visible="false" />
                            <asp:ImageField DataImageUrlField = "Pet_Record_ID" DataImageUrlFormatString = "~/Images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID={0}" ControlStyle-Width = "150" ControlStyle-Height = "100" HeaderText = "Preview Image" Visible="false" />
                            <asp:BoundField DataField="Pet_Sterilized" HeaderText="Pet_Sterilized" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Sterilized" Visible="false" />
                            <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                            <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Pet_Record_ID], [Pet_Location_Found_ID], [Pet_Type_ID], [Pet_Vet_ID], [Pet_License_Tag], [Pet_RFID], [Pet_Tatoo_No], [Pet_Name], [Pet_Gender], [Pet_Color], [Pet_Weight], [Pet_Description], [Pet_Condition], [Pet_Status], [Pet_Date_Of_Birth], [Pet_Picture], [Pet_Sterilized], [Date_Modified], [Date_Created] FROM [Pet]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Pet_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Pet_InfoHead_label" Style="padding: 10px" runat="server" Text="Pet Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_Pet_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Record_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Record_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Record_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Location_Found_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Location_Found_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Location_Found_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Type_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Type_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Type_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Vet_ID_lbl" runat="server" Font-Size="Large" Text="Pet_Vet_ID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Vet_ID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_License_Tag_lbl" runat="server" Font-Size="Large" Text="Pet_License_Tag:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_License_Tag_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_RFID_lbl" runat="server" Font-Size="Large" Text="Pet_RFID:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_RFID_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Tatoo_No_lbl" runat="server" Font-Size="Large" Text="Pet_Tatoo_No:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Tatoo_No_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Name_lbl" runat="server" Font-Size="Large" Text="Pet_Name:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Name_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Gender_lbl" runat="server" Font-Size="Large" Text="Pet_Gender:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Gender_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Color_lbl" runat="server" Font-Size="Large" Text="Pet_Color:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Color_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Weight_lbl" runat="server" Font-Size="Large" Text="Pet_Weight:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Weight_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Description_lbl" runat="server" Font-Size="Large" Text="Pet_Description:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Description_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Condition_lbl" runat="server" Font-Size="Large" Text="Pet_Condition:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Condition_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Status_lbl" runat="server" Font-Size="Large" Text="Pet_Status:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Status_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Date_Of_Birth_lbl" runat="server" Font-Size="Large" Text="Pet_Date_Of_Birth:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Date_Of_Birth_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Picture_lbl" runat="server" Font-Size="Large" Text="Pet_Picture:"></asp:Label>
                                                     <br />
                                                     <asp:Image ID="Delete_Pet_Picture_Image" runat="server" ImageUrl="~/Images/Default_Person.jpg" />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Pet_Sterilized_lbl" runat="server" Font-Size="Large" Text="Pet_Sterilized:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Pet_Sterilized_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Date_Modified_lbl" runat="server" Font-Size="Large" Text="Date_Modified:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Date_Modified_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Date_Created_lbl" runat="server" Font-Size="Large" Text="Date_Created:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Date_Created_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpePetInfo" runat="server" CollapseControlID="Delete_Pet_InfoHead" CollapsedText="Show Pet Information" Enabled="True" ExpandControlID="Delete_Pet_InfoHead" ExpandedText="Pet Information" TargetControlID="Delete_Pet_InfoBody" TextLabelID="Delete_Pet_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

