<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testing.aspx.cs" Inherits="DMCS.Moduals.Missing_Pets.person_Insert_Update_Delete" %>
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

         <table width="100%" height="100%" bgcolor="Silver" border="3">
            <tr>
                <td style="padding: 0px 10px 0px 10px">
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="Pet_Record_ID" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" OnSelectedIndexChanged="Select_Record" AllowPaging="True" Font-Bold="False" Font-Italic="False" Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center">
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
                            <asp:BoundField DataField="Pet_Picture" HeaderText="Pet_Picture" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Picture" Visible="false" />
                            <asp:BoundField DataField="Pet_Sterilized" HeaderText="Pet_Sterilized" InsertVisible="False" ReadOnly="True" SortExpression="Pet_Sterilized" Visible="false" />
                            <asp:BoundField DataField="Date_Modified" HeaderText="Date_Modified" InsertVisible="False" ReadOnly="True" SortExpression="Date_Modified" Visible="false" />
                            <asp:BoundField DataField="Date_Created" HeaderText="Date_Created" InsertVisible="False" ReadOnly="True" SortExpression="Date_Created" Visible="false" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                        <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                        <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                        <RowStyle BackColor="#CCCCCC"></RowStyle>
                        <SelectedRowStyle BackColor="#EA4C4C" Font-Bold="True" ForeColor="#CCCCCC" ></SelectedRowStyle>
                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>
                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [Pet_Record_ID], [Pet_Location_Found_ID], [Pet_Type_ID], [Pet_Vet_ID], [Pet_License_Tag], [Pet_RFID], [Pet_Tatoo_No], [Pet_Name], [Pet_Gender], [Pet_Color], [Pet_Weight], [Pet_Description], [Pet_Condition], [Pet_Status], [Pet_Date_Of_Birth], [Pet_Picture], [Pet_Sterilized], [Date_Modified], [Date_Created] FROM [Pet]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table width="100%" height="auto" bgcolor="Silver" border="3">
            <tr>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Record_ID_lbl" runat="server" Text="Pet_Record_ID:"></asp:Label><br /><asp:TextBox ID="Pet_Record_ID_txt" runat="server" Text="Pet_Record_ID_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Location_Found_ID_lbl" runat="server" Text="Pet_Location_Found_ID:"></asp:Label><br /><asp:TextBox ID="Pet_Location_Found_ID_txt" runat="server" Text="Pet_Location_Found_ID_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Type_ID_lbl" runat="server" Text="Pet_Type_ID:"></asp:Label><br /><asp:TextBox ID="Pet_Type_ID_txt" runat="server" Text="Pet_Type_ID_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Vet_ID_lbl" runat="server" Text="Pet_Vet_ID:"></asp:Label><br /><asp:TextBox ID="Pet_Vet_ID_txt" runat="server" Text="Pet_Vet_ID_txt" Width="121px"></asp:TextBox><br />
</td>
            </tr>
            <tr>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_License_Tag_lbl" runat="server" Text="Pet_License_Tag:"></asp:Label><br /><asp:TextBox ID="Pet_License_Tag_txt" runat="server" Text="Pet_License_Tag_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_RFID_lbl" runat="server" Text="Pet_RFID:"></asp:Label><br /><asp:TextBox ID="Pet_RFID_txt" runat="server" Text="Pet_RFID_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Tatoo_No_lbl" runat="server" Text="Pet_Tatoo_No:"></asp:Label><br /><asp:TextBox ID="Pet_Tatoo_No_txt" runat="server" Text="Pet_Tatoo_No_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Name_lbl" runat="server" Text="Pet_Name:"></asp:Label><br /><asp:TextBox ID="Pet_Name_txt" runat="server" Text="Pet_Name_txt" Width="121px"></asp:TextBox><br />
</td>
            </tr>
            <tr>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Gender_lbl" runat="server" Text="Pet_Gender:"></asp:Label><br /><asp:TextBox ID="Pet_Gender_txt" runat="server" Text="Pet_Gender_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Color_lbl" runat="server" Text="Pet_Color:"></asp:Label><br /><asp:TextBox ID="Pet_Color_txt" runat="server" Text="Pet_Color_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Weight_lbl" runat="server" Text="Pet_Weight:"></asp:Label><br /><asp:TextBox ID="Pet_Weight_txt" runat="server" Text="Pet_Weight_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Description_lbl" runat="server" Text="Pet_Description:"></asp:Label><br /><asp:TextBox ID="Pet_Description_txt" runat="server" Text="Pet_Description_txt" Width="121px"></asp:TextBox><br />
</td>
            </tr>
            <tr>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Condition_lbl" runat="server" Text="Pet_Condition:"></asp:Label><br /><asp:TextBox ID="Pet_Condition_txt" runat="server" Text="Pet_Condition_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Status_lbl" runat="server" Text="Pet_Status:"></asp:Label><br /><asp:TextBox ID="Pet_Status_txt" runat="server" Text="Pet_Status_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Date_Of_Birth_lbl" runat="server" Text="Pet_Date_Of_Birth:"></asp:Label><br /><asp:TextBox ID="Pet_Date_Of_Birth_txt" runat="server" Text="Pet_Date_Of_Birth_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Picture_lbl" runat="server" Text="Pet_Picture:"></asp:Label><br /><asp:FileUpload ID="FileUpload1" runat="server" /><br />
</td>
            </tr>
            <tr>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Pet_Sterilized_lbl" runat="server" Text="Pet_Sterilized:"></asp:Label><br /><asp:TextBox ID="Pet_Sterilized_txt" runat="server" Text="Pet_Sterilized_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Date_Modified_lbl" runat="server" Text="Date_Modified:"></asp:Label><br /><asp:TextBox ID="Date_Modified_txt" runat="server" Text="Date_Modified_txt" Width="121px"></asp:TextBox><br />
</td>
                <td style="padding: 0px 10px 0px 10px">
            <asp:Label ID="Date_Created_lbl" runat="server" Text="Date_Created:"></asp:Label><br /><asp:TextBox ID="Date_Created_txt" runat="server" Text="Date_Created_txt" Width="121px"></asp:TextBox><br />
</td>
            </tr>
        </table>
        <table width="100%" height="auto" bgcolor="Silver" border="3">
            <tr>
                <td width="33%">
                    <asp:Button ID="Insert" runat="server" Text="Insert" BackColor="#CC0000" ForeColor="Silver" Width="100%" OnClick="INSERT" CausesValidation="False" style="margin-bottom: 0px" />
                </td>
                <td width="34%">
                    <asp:Button ID="Update" runat="server" Text="Update" BackColor="#CC0000" ForeColor="Silver" Width="100%" OnClick="UPDATE" CausesValidation="False" />
                </td>
                <td width="34%">
                    <asp:Button ID="Delete" runat="server" Text="Delete" BackColor="#CC0000" ForeColor="Silver" Width="100%" OnClick="DELETE" CausesValidation="False" style="margin-bottom: 0px" />
                </td>
            </tr>
        </table>





    </body>
    </html>
</asp:Content>