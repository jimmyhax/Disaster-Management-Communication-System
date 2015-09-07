<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="UsersControl_UserAccountUC" Codebehind="UserAccountUC.ascx.cs" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<style type="text/css">
    .auto-style1 {
        width: 1328px;
    }
</style>
<table frame="box" width="100%">
    <tr>
        <td width="2%">
        </td>
        <td class="auto-style1">
            <h1>
                <asp:Label ID="lblAccountPanel" runat="server" Font-Size="Medium" ForeColor="Black"
                    Text="Pet Picture"></asp:Label>
            </h1>
        </td>
        <td align="right">
            <asp:ImageButton ID="btnClose" runat="server" CausesValidation="false" Visible="true" ImageUrl="~/Images/close.gif"
                OnClick="btnClose_Click" Height="18px" Width="31px" />
        </td>
        <td width="2%">
        </td>
    </tr>
</table>
<table frame="box" width="100%">
    <tr>
        <td width="2%">
        </td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
        <td width="2%">
        </td>
    </tr>
</table>
<table frame="box" width="100%">
    <tr>
        <td width="2%">
        </td>
        <td><center>
            <div style=" width: 100px; height: 100px; border: 1px solid #ccc;">
                <asp:UpdatePanel ID="upImg" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageAlign="Middle" Visible="true"
                            Width="100px" OnError="src='Images/spicture.jpg'" ImageUrl="Images/petPlaceHolder.png" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button ID="btnUpLoad" runat="server" Text="Upload Img." OnClick="btnUpload_Click" />
            </div>
            <br /></center>
        </td>
        <td width="2%">
        </td>
    </tr>
</table>
<table frame="box" width="100%">
    <tr>
        <td width="2%">
        </td>
        <td>
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
        </td>
        <td width="2%">
        </td>
    </tr>
</table>
<table frame="box" width="100%">
    <tr align="center">
        <td width="2%">
        </td>
        <td>
            <asp:Button ID="btnSave" runat="server" CssClass="button-primary" OnClick="btnSave_Click"
                TabIndex="100" Text="Save" />
            <asp:Button ID="btnClear" runat="server" CssClass="button-primary" OnClick="btnClear_Click"
                TabIndex="100" Text="Clear" />
        </td>
        <td width="2%">
        </td>
    </tr>
</table>
<br />
<asp:HiddenField ID="hidUserID" runat="server" />
<asp:HiddenField ID="hfFileToUpload" runat="server" />
<asp:HiddenField ID="hfUrl" runat="server" />
