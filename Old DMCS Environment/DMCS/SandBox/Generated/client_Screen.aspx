<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="client_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.client_Screen" %>

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
                                        <asp:DropDownList ID="Insert_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Insert_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Insert_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True">
                                        </asp:DropDownList>
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
                                        <asp:GridView ID="Insert_Client_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="client_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                                <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                                <asp:BoundField DataField="client_status" HeaderText="client_status" InsertVisible="False" ReadOnly="True" SortExpression="client_status" />
                                                <asp:BoundField DataField="ethnicity" HeaderText="ethnicity" InsertVisible="False" ReadOnly="True" SortExpression="ethnicity" />
                                                <asp:BoundField DataField="eye_color" HeaderText="eye_color" InsertVisible="False" ReadOnly="True" SortExpression="eye_color" Visible="False" />
                                                <asp:BoundField DataField="hair_color" HeaderText="hair_color" InsertVisible="False" ReadOnly="True" SortExpression="hair_color" Visible="False" />
                                                <asp:BoundField DataField="height" HeaderText="height" InsertVisible="False" ReadOnly="True" SortExpression="height" Visible="False" />
                                                <asp:ImageField DataImageUrlField="client_id" DataImageUrlFormatString="~/Images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" HeaderText="Preview Image" >
                                                    <ControlStyle Height="100px" Width="150px" />
                                                </asp:ImageField>
                                                <asp:BoundField DataField="weight" HeaderText="weight" InsertVisible="False" ReadOnly="True" SortExpression="weight" Visible="False" />
                                                <asp:BoundField DataField="skin_color" HeaderText="skin_color" InsertVisible="False" ReadOnly="True" SortExpression="skin_color" Visible="False" />
                                                <asp:BoundField DataField="Info_Field" HeaderText="Info_Field" InsertVisible="False" ReadOnly="True" SortExpression="Info_Field" Visible="False" />
                                                <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" Visible="False" />
                                                <asp:BoundField DataField="Emergency_Contact_Name" HeaderText="Emergency_Contact_Name" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Name" Visible="False" />
                                                <asp:BoundField DataField="Emergency_Contact_Number" HeaderText="Emergency_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Number" Visible="False" />
                                                <asp:BoundField DataField="Subscribed_Alerts" HeaderText="Subscribed_Alerts" InsertVisible="False" ReadOnly="True" SortExpression="Subscribed_Alerts" Visible="False" />
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
                                        <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [client_id], [client_status], [ethnicity], [eye_color], [hair_color], [height], [picture], [weight], [skin_color], [Info_Field], [Client_Shelter_ID], [Emergency_Contact_Name], [Emergency_Contact_Number], [Subscribed_Alerts] FROM [client]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_Client_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_Client_InfoHead_label" Style="padding: 10px" runat="server" Text="Client Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_Client_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                            <tr>
                                                <td style="padding: 20px 10px 10px 10px">
                                                    <asp:Label ID="Insert_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                    <br />
                                                    <asp:TextBox ID="Insert_client_id_txt" runat="server" Text="client_id_txt" Width="121px"></asp:TextBox>
                                                    <br />
                                                </td>
                                                <td style="padding: 20px 10px 10px 10px">
                                                    <asp:Label ID="Insert_client_status_lbl" runat="server" Font-Size="Large" Text="client_status:"></asp:Label>
                                                    <br />
                                                    <asp:TextBox ID="Insert_client_status_txt" runat="server" Text="client_status_txt" Width="121px"></asp:TextBox>
                                                    <br />
                                                </td>
                                                <td style="padding: 20px 10px 10px 10px">
                                                    <asp:Label ID="Insert_ethnicity_lbl" runat="server" Font-Size="Large" Text="ethnicity:"></asp:Label>
                                                    <br />
                                                    <asp:TextBox ID="Insert_ethnicity_txt" runat="server" Text="ethnicity_txt" Width="121px"></asp:TextBox>
                                                    <br />
                                                </td>
                                                <td style="padding: 20px 10px 10px 10px">
                                                    <asp:Label ID="Insert_eye_color_lbl" runat="server" Font-Size="Large" Text="eye_color:"></asp:Label>
                                                    <br />
                                                    <asp:TextBox ID="Insert_eye_color_txt" runat="server" Text="eye_color_txt" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpeClientInfo" runat="server" CollapseControlID="Insert_Client_InfoHead" CollapsedText="Show Client Information" Enabled="True" ExpandControlID="Insert_Client_InfoHead" ExpandedText="Client Information" TargetControlID="Insert_Client_InfoBody" TextLabelID="Insert_Client_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>

                </asp:TabPanel>
                <asp:TabPanel ID="Update_Tab_Panel" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Update_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large"></asp:Label>
                                        <asp:DropDownList ID="Update_ddlDisaster" runat="server"
                                            Height="24px" Width="240px"
                                            OnSelectedIndexChanged="Update_ddlDisaster_SelectedIndexChanged"
                                            AutoPostBack="True" DataSourceID="Update_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True">
                                        </asp:DropDownList>
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
                                        <asp:GridView ID="Update_Client_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" 
                                            AutoGenerateColumns="False" DataKeyNames="client_id" BackColor="#CCCCCC" 
                                            BorderColor="#666666" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                                            CellSpacing="2" ForeColor="#1A1A1A" Width="100%" OnRowDataBound="RowDataBound"
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" 
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                                <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                                <asp:BoundField DataField="client_status" HeaderText="client_status" InsertVisible="False" ReadOnly="True" SortExpression="client_status" />
                                                <asp:BoundField DataField="ethnicity" HeaderText="ethnicity" InsertVisible="False" ReadOnly="True" SortExpression="ethnicity" />
                                                <asp:BoundField DataField="eye_color" HeaderText="eye_color" InsertVisible="False" ReadOnly="True" SortExpression="eye_color" Visible="false" />
                                                <asp:BoundField DataField="hair_color" HeaderText="hair_color" InsertVisible="False" ReadOnly="True" SortExpression="hair_color" Visible="false" />
                                                <asp:BoundField DataField="height" HeaderText="height" InsertVisible="False" ReadOnly="True" SortExpression="height" Visible="false" />
                                                <asp:ImageField DataImageUrlField="client_id" DataImageUrlFormatString="~/Images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" ControlStyle-Width="150" ControlStyle-Height="100" HeaderText="Preview Image" Visible="true" />
                                                <asp:BoundField DataField="weight" HeaderText="weight" InsertVisible="False" ReadOnly="True" SortExpression="weight" Visible="false" />
                                                <asp:BoundField DataField="skin_color" HeaderText="skin_color" InsertVisible="False" ReadOnly="True" SortExpression="skin_color" Visible="false" />
                                                <asp:BoundField DataField="Info_Field" HeaderText="Info_Field" InsertVisible="False" ReadOnly="True" SortExpression="Info_Field" Visible="false" />
                                                <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" Visible="false" />
                                                <asp:BoundField DataField="Emergency_Contact_Name" HeaderText="Emergency_Contact_Name" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Name" Visible="false" />
                                                <asp:BoundField DataField="Emergency_Contact_Number" HeaderText="Emergency_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Number" Visible="false" />
                                                <asp:BoundField DataField="Subscribed_Alerts" HeaderText="Subscribed_Alerts" InsertVisible="False" ReadOnly="True" SortExpression="Subscribed_Alerts" Visible="false" />
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
                                        <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [client_id], [client_status], [ethnicity], [eye_color], [hair_color], [height], [picture], [weight], [skin_color], [Info_Field], [Client_Shelter_ID], [Emergency_Contact_Name], [Emergency_Contact_Number], [Subscribed_Alerts] FROM [client]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_Client_InfoHead" runat="server" CssClass="PanelHead" ForeColor="#EFEEEF" Width="100%" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_Client_InfoHead_label" Style="padding: 10px" runat="server" Text="Client Information"  Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_Client_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                            <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="333333" Text="SECTION HEADER"></asp:Label>
                                        </th>
                                        <tr>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Update_client_id_lbl" runat="server" Text="client_id:" Font-Size="Large"></asp:Label><br />
                                                <asp:TextBox ID="Update_client_id_txt" runat="server" Text="client_id_txt" Width="121px"></asp:TextBox><br />
                                            </td>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Update_client_status_lbl" runat="server" Text="client_status:" Font-Size="Large"></asp:Label><br />
                                                <asp:TextBox ID="Update_client_status_txt" runat="server" Text="client_status_txt" Width="121px"></asp:TextBox><br />
                                            </td>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Update_ethnicity_lbl" runat="server" Text="ethnicity:" Font-Size="Large"></asp:Label><br />
                                                <asp:TextBox ID="Update_ethnicity_txt" runat="server" Text="ethnicity_txt" Width="121px"></asp:TextBox><br />
                                            </td>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Update_eye_color_lbl" runat="server" Text="eye_color:" Font-Size="Large"></asp:Label><br />
                                                <asp:TextBox ID="Update_eye_color_txt" runat="server" Text="eye_color_txt" Width="121px"></asp:TextBox><br />
                                            </td>
                                        </tr>

                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Update_btn" runat="server" Font-Size="Large" Text="Update" BackColor="#EA5151" ForeColor="#e2e2e2" Width="100%" OnClick="UPDATE" CausesValidation="False" Style="margin-bottom: 0px;  margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Update_cpeClientInfo" runat="server" CollapseControlID="Update_Client_InfoHead" CollapsedText="Show Client Information" Enabled="True" ExpandControlID="Update_Client_InfoHead" ExpandedText="Client Information" TargetControlID="Update_Client_InfoBody" TextLabelID="Update_Client_InfoHead_label"></asp:CollapsiblePanelExtender>
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

                                        <asp:DropDownList ID="Delete_ddlDisaster" runat="server"
                                            Height="24px" Width="240px"
                                            OnSelectedIndexChanged="Delete_ddlDisaster_SelectedIndexChanged"
                                            AutoPostBack="True" DataSourceID="Delete_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True">
                                        </asp:DropDownList>

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
                                        <asp:GridView ID="Delete_Client_GridView" Style="border-style: solid none none none;" runat="server" 
                                            DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="client_id" 
                                            BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                                            CellSpacing="2" ForeColor="#1A1A1A" Width="100%" OnSelectedIndexChanged="Delete_Select_Record" 
                                            AllowPaging="True" Font-Bold="False" Font-Italic="False" Font-Names="Calibri Light" OnRowDataBound="RowDataBound"
                                            Font-Overline="False" Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                                <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" />
                                                <asp:BoundField DataField="client_status" HeaderText="client_status" InsertVisible="False" ReadOnly="True" SortExpression="client_status" />
                                                <asp:BoundField DataField="ethnicity" HeaderText="ethnicity" InsertVisible="False" ReadOnly="True" SortExpression="ethnicity" />
                                                <asp:BoundField DataField="eye_color" HeaderText="eye_color" InsertVisible="False" ReadOnly="True" SortExpression="eye_color" Visible="False" />
                                                <asp:BoundField DataField="hair_color" HeaderText="hair_color" InsertVisible="False" ReadOnly="True" SortExpression="hair_color" Visible="False" />
                                                <asp:BoundField DataField="height" HeaderText="height" InsertVisible="False" ReadOnly="True" SortExpression="height" Visible="False" />
                                                <asp:ImageField DataImageUrlField="client_id" DataImageUrlFormatString="~/Images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" HeaderText="Preview Image">
                                                    <ControlStyle Height="100px" Width="150px" />
                                                </asp:ImageField>
                                                <asp:BoundField DataField="weight" HeaderText="weight" InsertVisible="False" ReadOnly="True" SortExpression="weight" Visible="False" />
                                                <asp:BoundField DataField="skin_color" HeaderText="skin_color" InsertVisible="False" ReadOnly="True" SortExpression="skin_color" Visible="False" />
                                                <asp:BoundField DataField="Info_Field" HeaderText="Info_Field" InsertVisible="False" ReadOnly="True" SortExpression="Info_Field" Visible="False" />
                                                <asp:BoundField DataField="Client_Shelter_ID" HeaderText="Client_Shelter_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_Shelter_ID" Visible="False" />
                                                <asp:BoundField DataField="Emergency_Contact_Name" HeaderText="Emergency_Contact_Name" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Name" Visible="False" />
                                                <asp:BoundField DataField="Emergency_Contact_Number" HeaderText="Emergency_Contact_Number" InsertVisible="False" ReadOnly="True" SortExpression="Emergency_Contact_Number" Visible="False" />
                                                <asp:BoundField DataField="Subscribed_Alerts" HeaderText="Subscribed_Alerts" InsertVisible="False" ReadOnly="True" SortExpression="Subscribed_Alerts" Visible="False" />
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

                                        <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [client_id], [client_status], [ethnicity], [eye_color], [hair_color], [height], [picture], [weight], [skin_color], [Info_Field], [Client_Shelter_ID], [Emergency_Contact_Name], [Emergency_Contact_Number], [Subscribed_Alerts] FROM [client]"></asp:SqlDataSource>

                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_Client_InfoHead" runat="server" CssClass="PanelHead" ForeColor="#EFEEEF" Width="100%" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_Client_InfoHead_label" Style="padding: 10px" runat="server" Text="Client Information" Font-Size="Large"></asp:Label>

                            </asp:Panel>
                            <asp:Panel ID="Delete_Client_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                            <asp:Label ID="Label8" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                        </th>
                                        <tr>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Delete_client_id_lbl" runat="server" Text="client_id:" Font-Size="Large"></asp:Label>
                                                <br />
                                                <asp:Label ID="Delete_client_id_txt_lbl" runat="server" Text="client_id_txt" Width="121px"></asp:Label>
                                                <br />
                                            </td>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Delete_client_status_lbl" runat="server" Text="client_status:" Font-Size="Large"></asp:Label>
                                                <br />
                                                <asp:Label ID="Delete_client_status_txt_lbl" runat="server" Text="client_status_txt" Width="121px"></asp:Label>
                                                <br />
                                            </td>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Delete_ethnicity_lbl" runat="server" Text="ethnicity:" Font-Size="Large"></asp:Label>
                                                <br />
                                                <asp:Label ID="Delete_ethnicity_txt_lbl" runat="server"  Text="ethnicity_txt" Width="121px"></asp:Label>
                                                <br />
                                            </td>
                                            <td style="padding: 20px 10px 10px 10px">
                                                <asp:Label ID="Delete_eye_color_lbl" runat="server" Text="eye_color:" Font-Size="Large"></asp:Label>
                                                <br />
                                                <asp:Label ID="Delete_eye_color_txt_lbl" runat="server" Text="eye_color_txt" Width="121px"></asp:Label>
                                                <br />
                                            </td>
                                        </tr>

                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light';">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px;" width="100%">
                                                <asp:Button ID="Delete_btn" runat="server" Text="Delete" BackColor="#EA5151" Font-Size="Large" ForeColor="#E2E2E2" Width="100%" OnClick="DELETE" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Delete_cpeClientInfo" runat="server" CollapseControlID="Delete_Client_InfoHead" CollapsedText="Show Client Information" Enabled="True" ExpandControlID="Delete_Client_InfoHead" ExpandedText="Client Information" TargetControlID="Delete_Client_InfoBody" TextLabelID="Delete_Client_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

