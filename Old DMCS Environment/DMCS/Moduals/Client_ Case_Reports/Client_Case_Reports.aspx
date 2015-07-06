<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Client_Case_Reports.aspx.cs" Inherits="DMCS.Moduals.Client__Case_Reports.Client_Case_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <table width="100%" cellspacing="10" bgcolor="#efeeef">
        <tr>
            <td style="padding-left: 10px">
                <br />
                <br />
                <asp:Label ID="lbl_Client_Error"
                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="#AAAAAA"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="left" style="padding-right: 10px; padding-left: 10px;">
                <asp:Label ID="SearchSelected_L" runat="server" Text="Search for the client" Font-Bold="True" ForeColor="Black" Font-Size="18pt" Width="100%" Font-Overline="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                <asp:Label ID="firstName_L" Text="First Name:" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="firstName_txt" runat="server" Width="121px" TabIndex="1"></asp:TextBox>
            </td>

            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                <asp:Label ID="lastName_L" Text="Last Name:" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="lastName_txt" runat="server" Width="121px" TabIndex="2"></asp:TextBox>
            </td>

            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                <asp:Label ID="Label1" Text="Date Of Birth:" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="dateOfBirth_txt" runat="server" Width="121px" TabIndex="3"></asp:TextBox>
                <asp:CompareValidator id="CompareValidator1" ValidationGroup="valGroup_Client_Search" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="dateofbirth_txt" ErrorMessage="(mm/dd/yyyy)" ForeColor="#E84F51"></asp:CompareValidator>                                                
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="dateofbirth_txt"></asp:CalendarExtender>
                                                
            </td>

            <td style="padding-right: 10px; padding-left: 10px;" align="left">
                <asp:Label ID="Label2" Text="Address:" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="address_txt" runat="server" Width="263px" TabIndex="4"></asp:TextBox>
            </td>

            <td colspan="1" align="left" style="padding-right: 10px; padding-left: 10px;">
                <asp:Button ID="clientSearch_btn" Text="Search" runat="server" OnClick="clientSearch_btn_Click" TabIndex="5" Width="300px" Style="margin: 0px" BackColor="#EA5151" ForeColor="#CCCCCC" ValidationGroup="valGroup_Client_Search" />
            </td>
        </tr>
    </table>

    <table id="Table12" width="100%" bgcolor="#efeeef">
        <tr>
            <td align="center" width="100%" style="padding-left: 10px">
                <asp:GridView ID="gvClientSearchresult" runat="server"
                    AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                    OnSelectedIndexChanged="gvClientSearchresult_SelectedIndexChanged"
                    AllowPaging="True" EnableTheming="False" AllowSorting="True"
                    BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid"
                    BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A"
                    Font-Names="Calibri Light" GridLines="Horizontal" HorizontalAlign="Center"
                    DataKeyNames="person_id" OnRowDataBound="RowDataBound">
                    <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />

                    <Columns>
                        <asp:BoundField DataField="f_name" HeaderText="Fisrt Name" />
                        <asp:BoundField DataField="m_initial" HeaderText="Middle In." SortExpression="m_initial" />
                        <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="l_name" />
                        <asp:BoundField DataField="client_status" HeaderText="clients Status" SortExpression="client_status" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                        <asp:ImageField DataImageUrlField="client_id" DataImageUrlFormatString="~/Images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id={0}" HeaderText="Preview Image">
                            <ControlStyle Height="100px" Width="150px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="birthdate" HeaderText="Birthday" SortExpression="birthdate" />
                        <asp:BoundField DataField="phone_primary" HeaderText="Phone Number" SortExpression="phone_primary" />
                        <asp:BoundField DataField="ssn" HeaderText="SSN" SortExpression="ssn" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="picture" HeaderText="Picture" SortExpression="picture" Visible="false" />
                        <asp:BoundField DataField="str_add" HeaderText="Street Address" SortExpression="str_add" />
                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                        <asp:BoundField DataField="person_id" HeaderText="person_id" SortExpression="person_id" Visible="False" />
                        <asp:BoundField DataField="client_id" HeaderText="client_id" SortExpression="client_id" Visible="False" />
                        <asp:BoundField DataField="address_id" HeaderText="address_id" SortExpression="address_id" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                    <HeaderStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                    <RowStyle BackColor="#CCCCCC"></RowStyle>
                    <SelectedRowStyle BackColor="#EA4C4C" Font-Bold="True" ForeColor="#CCCCCC"></SelectedRowStyle>
                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
