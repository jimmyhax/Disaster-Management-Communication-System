<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Download_All.aspx.cs" Inherits="DMCS.Download_All" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 54px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <link href="CSS/scriptGenerator.css" rel="stylesheet" />

    <table id="Table12" width="100%"  bgcolor="Silver">
        <tr>
            <td colspan="6">
                <asp:Label ID="ERROR"
                    runat="server" Font-Bold="True" ForeColor="#CC0000" BackColor="Silver"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%"  bgcolor="Silver" border="3" >
        <tr>
            <td align="center" style="padding: 10px; font-weight: bold;">Table Name:&nbsp;
                        <br />
                <asp:DropDownList runat="server" ID="The_Table_Name" AutoPostBack="True" DataSourceID="Localhost" DataTextField="TABLE_NAME" DataValueField="TABLE_NAME" OnSelectedIndexChanged="The_Table_Name_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Enabled="true">Select Table</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="Localhost" ConnectionString='<%$ ConnectionStrings:Localhost %>' SelectCommand="SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME != 'sysdiagrams'"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table width="100%"  bgcolor="#666666" border="3" style="color: #CCCCCC">
        <tr>

            <td width="16%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">



                <asp:CheckBox ID="Include_Create_Table" runat="server" Checked="True" Text="Create Table" />

            </td>
            <td width="16%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">

                <asp:CheckBox ID="Include_Select" runat="server" Checked="True" Text="Select SP" />
            </td>


            <td width="16%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">

                <asp:CheckBox ID="Include_Insert" runat="server" Checked="True" Text="Insert SP" />

            </td>
            <td width="16%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">

                <asp:CheckBox  ID="Include_Update" runat="server" Checked="True" Text="Update SP" />

            </td>
            <td width="16%" align="center"
                style="padding: 10px; font-weight: bold; height: 16px;">

                <asp:CheckBox ID="Include_Delete" runat="server" Checked="True" Text="Delete SP" />

            </td>
            <td width="16%" align="center"
                style="padding: 10px; font-weight: bold; height: 16px;">


                <asp:CheckBox ID="Include_WC" runat="server" Checked="True" Text="WC-SP" />

            </td>
        </tr>
    </table>
    <table  bgcolor="Silver" border="3" style="width: 100%">
        <tr>
            <td width="50%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">Each Column Name:&nbsp;
                        <br />
                <asp:TextBox ID="DB_Names" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11">Columns...</asp:TextBox>
                <br />
                NULL or NOT NULL:&nbsp;
                    <br />
                <asp:TextBox ID="Null_Names" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11">Nullable...</asp:TextBox>
                <br />

                (Comma deliminated)
            </td>

            <td width="50%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">Each Database Type:&nbsp;
                    <br />
                <asp:TextBox ID="DB_Types" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11">Table Types</asp:TextBox>
                <br />
                Each C# Type:
                    <br />
                <asp:TextBox ID="C_Types" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11">Respective C# types</asp:TextBox>
                <br />

                (Comma deliminated)
            </td>


        </tr>
    </table>



    <div><asp:Button ID="Download_All_Btn" runat="server" Text="Generate And Download All Code For Every Table In The Database" OnClick="Download_All_Click" BackColor="#EA5151" ForeColor="Silver" Width="100%" /></div>

</asp:Content>
