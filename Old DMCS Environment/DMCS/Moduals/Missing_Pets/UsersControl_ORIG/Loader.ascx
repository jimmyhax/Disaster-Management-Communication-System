<%@ Control Language="C#" AutoEventWireup="true" Inherits="UsersControl_Loader"
    EnableTheming="true" Codebehind="Loader.ascx.cs" %>
<link href="../css/Controlstyle.css" rel="stylesheet" type="text/css" />
<link href="../Css/Superstyle.css" rel="stylesheet" type="text/css" />
<div align="center" style="margin-top: 13px;">
    <table cellspacing="4" cellpadding="4" style="border: solid 1px White;">
        <tr align="center">
            <td>
                <span class="updateProgressMessage" style="color: White;">
                    <asp:UpdatePanel ID="upMessage" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="lblMessage" runat="server" EnableTheming="false">Please wait...</asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </span>
            </td>
        </tr>
        <tr>
            <td>
                <img src="../Images/BlackLoadingBar.gif" alt="Loading..." />
            </td>
        </tr>
    </table>
</div>
