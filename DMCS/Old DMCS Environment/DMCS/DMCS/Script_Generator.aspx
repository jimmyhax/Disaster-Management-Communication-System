<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Script_Generator.aspx.cs" Inherits="DMCS.Script_Generator" ValidateRequest="False" %>


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
<!-- 
<script type="text/javascript" language="javascript">
    function initialize() { }
    function AskToDownload() {

            alert('here');


    }
</script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> -->
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
            <td align="center" style="padding: 10px; width:50%; font-weight: bold;">If generating from database-<br />Table Name:&nbsp;
                        <br />
                <asp:DropDownList runat="server" ID="The_Table_Name" AutoPostBack="True" DataSourceID="Localhost" DataTextField="TABLE_NAME" DataValueField="TABLE_NAME" OnSelectedIndexChanged="The_Table_Name_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Enabled="true">Select Table</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="Localhost" ConnectionString='<%$ ConnectionStrings:Localhost %>' SelectCommand="SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME != 'sysdiagrams'"></asp:SqlDataSource>
            </td>
            <td align="center" style="display: none; padding: 10px; width:50%; font-weight: bold;">If manually generating - <br />Table Name:&nbsp;
                        <br />
                <asp:TextBox ID="Manual_Table_Name" runat="server"></asp:TextBox>
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
    <table  bgcolor="Silver" border="3" style="display:none; width: 100%">
        <tr>
            <td width="50%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">Each Column Name:&nbsp;
                        <br />
                <asp:TextBox ID="DB_Names" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11"></asp:TextBox>
                <br />
                NULL or NOT NULL:&nbsp;
                    <br />
                <asp:TextBox ID="Null_Names" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11"></asp:TextBox>
                <br />

                (Comma deliminated)
            </td>

            <td width="50%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">Each Database Type:&nbsp;
                    <br />
                <asp:TextBox ID="DB_Types" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11"></asp:TextBox>
                <br />
                Each C# Type:
                    <br />
                <asp:TextBox ID="C_Types" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11"></asp:TextBox>
                <br />

                (Comma deliminated)
            </td>


        </tr>
    </table>
<%--    <div id="myDiv" runat="server" style="width:100%; display: none;">
                <asp:Button ID="DOWNLOAD_CODE" runat="server" width="100%" Text="DOWNLOAD CODE BELOW" OnClick="DOWNLOAD_Click1" BackColor="#EA5151" ForeColor="#E2E2E2" />
    </div>--%>
    <table width="100%"  bgcolor="Silver" border="3">
        <tr>
            <td align="center" style="width: 50%; padding: 10px; font-weight: bold; ">Database Script Output:&nbsp;
                        <br />
                <asp:TextBox ID="Database_Script_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
            <td align="center" style=" width: 50%;padding: 10px; font-weight: bold; ">Object Output:&nbsp;
                        <br />
                <asp:TextBox ID="Object_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
        </tr>
    </table>
    <table width="100%"  bgcolor="Silver">
        <tr>
            <td align="center" style="padding: 10px; font-weight: bold; width: 100%;">
                <section>                
                <%--<div id="one_center"><asp:Button ID="Create" runat="server" Text="Create Manually" BackColor="#EA5151" ForeColor="Silver" Width="100%" OnClick="Create_Click" CausesValidation="False" ClientIDMode="Static" /></div>--%>
                <%--<div id="two_left"><asp:Button ID="Download" runat="server" Text="Download All Code Displayed" BackColor="#EA5151" ForeColor="Silver" Width="100%" OnClick="Download_Click" CausesValidation="False"  Visible="False" ClientIDMode="Static" /></div>
                <div id="two_right">--%><asp:Button ID="Restart" runat="server" Text="Clear All And Restart" BackColor="#333333" ForeColor="Silver" Width="100%" OnClick="Restart_Click" CausesValidation="False" Visible="False" ClientIDMode="Static" /></div>
                </section>
            </td>
        </tr>
    </table>
    <table width="100%"  bgcolor="Silver" border="3">
        <tr>
            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px; padding-left: 10px;">Select Screen Output:&nbsp;
                        <br />
                <asp:TextBox ID="Select_Screen_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">Insert Screen Output:&nbsp;
                        <br />
                <asp:TextBox ID="Insert_Screen_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>

            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">Update Screen Output:&nbsp;
                        <br />
                <asp:TextBox ID="Update_Screen_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">Delete Screen Output:&nbsp;
                        <br />
                <asp:TextBox ID="Delete_Screen_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; height: 53px;">All-In-One Output:&nbsp;
                        <br />
                <asp:TextBox ID="Insert_Update_Delete_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
        </tr>
        </table>
        <table width="100%"  bgcolor="Silver" border="3">
        <tr>
            <td width="20%" align="center"
                style="padding-left: 10px;font-weight: bold; " class="auto-style1">Select Screen C# Output:
                        <br />
                <asp:TextBox ID="Select_Screen_C_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; " class="auto-style1">Insert Screen C# Output:&nbsp;
                        <br />
                <asp:TextBox ID="Insert_Screen_C_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>

            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; " class="auto-style1">Update C# Output:&nbsp;
                        <br />
                <asp:TextBox ID="Update_Screen_C_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; " class="auto-style1">Delete C# Output:&nbsp;
                        <br />
                <asp:TextBox ID="Delete_Screen_C_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
            <td width="20%" align="center"
                style="padding: 10px; font-weight: bold; " class="auto-style1">All-In-One C# Output:&nbsp;
                        <br />
                <asp:TextBox ID="Insert_Update_Delete_C_Output" runat="server" Width="100%" ClientIDMode="Static" TabIndex="11" TextMode="MultiLine" Height="250px"></asp:TextBox>

            </td>
        </tr>
    </table>

</asp:Content>
