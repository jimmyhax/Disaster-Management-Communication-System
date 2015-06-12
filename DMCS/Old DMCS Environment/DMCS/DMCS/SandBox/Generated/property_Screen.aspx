<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="property_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.property_Screen" %>
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
                                        <asp:GridView ID="Insert_property_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="property_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="property_id" HeaderText="property_id" InsertVisible="False" ReadOnly="True" SortExpression="property_id" />
                            <asp:BoundField DataField="approx_mrkt_value" HeaderText="approx_mrkt_value" InsertVisible="False" ReadOnly="True" SortExpression="approx_mrkt_value" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" Visible="false" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                            <asp:BoundField DataField="Homeowners_Insurance_Payment" HeaderText="Homeowners_Insurance_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Homeowners_Insurance_Payment" Visible="false" />
                            <asp:BoundField DataField="monthly_property_payment" HeaderText="monthly_property_payment" InsertVisible="False" ReadOnly="True" SortExpression="monthly_property_payment" Visible="false" />
                            <asp:BoundField DataField="mortg_comp" HeaderText="mortg_comp" InsertVisible="False" ReadOnly="True" SortExpression="mortg_comp" Visible="false" />
                            <asp:BoundField DataField="Property_Tax_Payment" HeaderText="Property_Tax_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Property_Tax_Payment" Visible="false" />
                            <asp:BoundField DataField="own_prop" HeaderText="own_prop" InsertVisible="False" ReadOnly="True" SortExpression="own_prop" Visible="false" />
                            <asp:BoundField DataField="rent_prop" HeaderText="rent_prop" InsertVisible="False" ReadOnly="True" SortExpression="rent_prop" Visible="false" />
                            <asp:BoundField DataField="date_purchased" HeaderText="date_purchased" InsertVisible="False" ReadOnly="True" SortExpression="date_purchased" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [property_id], [approx_mrkt_value], [address_id], [case_id], [client_id], [Homeowners_Insurance_Payment], [monthly_property_payment], [mortg_comp], [Property_Tax_Payment], [own_prop], [rent_prop], [date_purchased] FROM [property]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_property_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_property_InfoHead_label" Style="padding: 10px" runat="server" Text="property Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_property_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_approx_mrkt_value_lbl" runat="server" Font-Size="Large" Text="approx_mrkt_value:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_approx_mrkt_value_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
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
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Homeowners_Insurance_Payment_lbl" runat="server" Font-Size="Large" Text="Homeowners_Insurance_Payment:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Homeowners_Insurance_Payment_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_monthly_property_payment_lbl" runat="server" Font-Size="Large" Text="monthly_property_payment:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_monthly_property_payment_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_mortg_comp_lbl" runat="server" Font-Size="Large" Text="mortg_comp:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_mortg_comp_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_Property_Tax_Payment_lbl" runat="server" Font-Size="Large" Text="Property_Tax_Payment:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_Property_Tax_Payment_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_own_prop_lbl" runat="server" Font-Size="Large" Text="own_prop:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_own_prop_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_rent_prop_lbl" runat="server" Font-Size="Large" Text="rent_prop:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_rent_prop_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_date_purchased_lbl" runat="server" Font-Size="Large" Text="date_purchased:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_date_purchased_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Insert_cpepropertyInfo" runat="server" CollapseControlID="Insert_property_InfoHead" CollapsedText="Show property Information" Enabled="True" ExpandControlID="Insert_property_InfoHead" ExpandedText="property Information" TargetControlID="Insert_property_InfoBody" TextLabelID="Insert_property_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Update_property_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="property_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="property_id" HeaderText="property_id" InsertVisible="False" ReadOnly="True" SortExpression="property_id" />
                            <asp:BoundField DataField="approx_mrkt_value" HeaderText="approx_mrkt_value" InsertVisible="False" ReadOnly="True" SortExpression="approx_mrkt_value" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" Visible="false" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                            <asp:BoundField DataField="Homeowners_Insurance_Payment" HeaderText="Homeowners_Insurance_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Homeowners_Insurance_Payment" Visible="false" />
                            <asp:BoundField DataField="monthly_property_payment" HeaderText="monthly_property_payment" InsertVisible="False" ReadOnly="True" SortExpression="monthly_property_payment" Visible="false" />
                            <asp:BoundField DataField="mortg_comp" HeaderText="mortg_comp" InsertVisible="False" ReadOnly="True" SortExpression="mortg_comp" Visible="false" />
                            <asp:BoundField DataField="Property_Tax_Payment" HeaderText="Property_Tax_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Property_Tax_Payment" Visible="false" />
                            <asp:BoundField DataField="own_prop" HeaderText="own_prop" InsertVisible="False" ReadOnly="True" SortExpression="own_prop" Visible="false" />
                            <asp:BoundField DataField="rent_prop" HeaderText="rent_prop" InsertVisible="False" ReadOnly="True" SortExpression="rent_prop" Visible="false" />
                            <asp:BoundField DataField="date_purchased" HeaderText="date_purchased" InsertVisible="False" ReadOnly="True" SortExpression="date_purchased" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [property_id], [approx_mrkt_value], [address_id], [case_id], [client_id], [Homeowners_Insurance_Payment], [monthly_property_payment], [mortg_comp], [Property_Tax_Payment], [own_prop], [rent_prop], [date_purchased] FROM [property]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_property_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_property_InfoHead_label" Style="padding: 10px" runat="server" Text="property Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_property_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_property_id_lbl" runat="server" Font-Size="Large" Text="property_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_property_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_approx_mrkt_value_lbl" runat="server" Font-Size="Large" Text="approx_mrkt_value:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_approx_mrkt_value_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_address_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_case_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Homeowners_Insurance_Payment_lbl" runat="server" Font-Size="Large" Text="Homeowners_Insurance_Payment:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Homeowners_Insurance_Payment_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_monthly_property_payment_lbl" runat="server" Font-Size="Large" Text="monthly_property_payment:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_monthly_property_payment_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_mortg_comp_lbl" runat="server" Font-Size="Large" Text="mortg_comp:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_mortg_comp_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_Property_Tax_Payment_lbl" runat="server" Font-Size="Large" Text="Property_Tax_Payment:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_Property_Tax_Payment_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_own_prop_lbl" runat="server" Font-Size="Large" Text="own_prop:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_own_prop_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_rent_prop_lbl" runat="server" Font-Size="Large" Text="rent_prop:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_rent_prop_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_date_purchased_lbl" runat="server" Font-Size="Large" Text="date_purchased:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_date_purchased_txt" runat="server" Text="" Width="121px"></asp:TextBox>
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
                            <asp:CollapsiblePanelExtender ID="Update_cpepropertyInfo" runat="server" CollapseControlID="Update_property_InfoHead" CollapsedText="Show property Information" Enabled="True" ExpandControlID="Update_property_InfoHead" ExpandedText="property Information" TargetControlID="Update_property_InfoBody" TextLabelID="Update_property_InfoHead_label"></asp:CollapsiblePanelExtender>
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
                                        <asp:GridView ID="Delete_property_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="property_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="property_id" HeaderText="property_id" InsertVisible="False" ReadOnly="True" SortExpression="property_id" />
                            <asp:BoundField DataField="approx_mrkt_value" HeaderText="approx_mrkt_value" InsertVisible="False" ReadOnly="True" SortExpression="approx_mrkt_value" />
                            <asp:BoundField DataField="address_id" HeaderText="address_id" InsertVisible="False" ReadOnly="True" SortExpression="address_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" Visible="false" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                            <asp:BoundField DataField="Homeowners_Insurance_Payment" HeaderText="Homeowners_Insurance_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Homeowners_Insurance_Payment" Visible="false" />
                            <asp:BoundField DataField="monthly_property_payment" HeaderText="monthly_property_payment" InsertVisible="False" ReadOnly="True" SortExpression="monthly_property_payment" Visible="false" />
                            <asp:BoundField DataField="mortg_comp" HeaderText="mortg_comp" InsertVisible="False" ReadOnly="True" SortExpression="mortg_comp" Visible="false" />
                            <asp:BoundField DataField="Property_Tax_Payment" HeaderText="Property_Tax_Payment" InsertVisible="False" ReadOnly="True" SortExpression="Property_Tax_Payment" Visible="false" />
                            <asp:BoundField DataField="own_prop" HeaderText="own_prop" InsertVisible="False" ReadOnly="True" SortExpression="own_prop" Visible="false" />
                            <asp:BoundField DataField="rent_prop" HeaderText="rent_prop" InsertVisible="False" ReadOnly="True" SortExpression="rent_prop" Visible="false" />
                            <asp:BoundField DataField="date_purchased" HeaderText="date_purchased" InsertVisible="False" ReadOnly="True" SortExpression="date_purchased" Visible="false" />
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
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [property_id], [approx_mrkt_value], [address_id], [case_id], [client_id], [Homeowners_Insurance_Payment], [monthly_property_payment], [mortg_comp], [Property_Tax_Payment], [own_prop], [rent_prop], [date_purchased] FROM [property]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_property_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_property_InfoHead_label" Style="padding: 10px" runat="server" Text="property Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_property_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_property_id_lbl" runat="server" Font-Size="Large" Text="property_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_property_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_approx_mrkt_value_lbl" runat="server" Font-Size="Large" Text="approx_mrkt_value:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_approx_mrkt_value_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_address_id_lbl" runat="server" Font-Size="Large" Text="address_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_address_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_case_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_client_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Homeowners_Insurance_Payment_lbl" runat="server" Font-Size="Large" Text="Homeowners_Insurance_Payment:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Homeowners_Insurance_Payment_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_monthly_property_payment_lbl" runat="server" Font-Size="Large" Text="monthly_property_payment:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_monthly_property_payment_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_mortg_comp_lbl" runat="server" Font-Size="Large" Text="mortg_comp:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_mortg_comp_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_Property_Tax_Payment_lbl" runat="server" Font-Size="Large" Text="Property_Tax_Payment:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_Property_Tax_Payment_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_own_prop_lbl" runat="server" Font-Size="Large" Text="own_prop:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_own_prop_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_rent_prop_lbl" runat="server" Font-Size="Large" Text="rent_prop:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_rent_prop_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_date_purchased_lbl" runat="server" Font-Size="Large" Text="date_purchased:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_date_purchased_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
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
                            <asp:CollapsiblePanelExtender ID="Delete_cpepropertyInfo" runat="server" CollapseControlID="Delete_property_InfoHead" CollapsedText="Show property Information" Enabled="True" ExpandControlID="Delete_property_InfoHead" ExpandedText="property Information" TargetControlID="Delete_property_InfoBody" TextLabelID="Delete_property_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

