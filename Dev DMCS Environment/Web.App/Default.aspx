<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.App._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="jumbotron">
  <h1>DMCS<h1>
  <h2 style="color:#aaa !important">ASP.NET WebForm Application Using Angular JS</h2><br/>
  <p>This is an example of using the DMCS app's view-page permissions. It includes public and protected area. Use it as a starting point to create your pages.</p>
</div>
<div class="page-header">
<h2>Development Permissions<small>&nbsp;Simple Examples of using Member Role Management:</small></h2>
</div>    
<div class="row">
  <div class="col-md-4">
    <h2>Public</h2>
    <p>This is public area which is not protected. You can navigate this area without authentication.</p>
    <p><br/><a class="btn btn-info" href="About.aspx">View &raquo;</a></p>
  </div><!--/col-->
  <div class="col-md-4">
    <h2>Protected &nbsp;<span style="vertical-align:top;font-size:11px" class="label label-success">Viewer</span></h2>
    <p>This is protected area by role Viewer. You should have "Viewer" role in order to navigate this area.</p>
    <p>
        <table>
            <tr>
                <td style="text-align:right"><b>Login:</b></td>
                <td>&nbsp;&nbsp;viewer@demo.com</td>
            </tr>
            <tr>
                <td style="text-align:right"><b>Password:</b></td>
                <td>&nbsp;&nbsp;viewer</td>
            </tr>
        </table>
    </p>
    <p><br/><a class="btn btn-info" href="Management/Viewer.aspx">View &raquo;</a></p>
  </div><!--/col-->
  <div class="col-md-4">
    <h2>Protected &nbsp;<span style="vertical-align:top;font-size:11px" class="label label-success">Editor</span></h2>
    <p>This is protected area by role Editor. You should have "Editor" role in order to navigate this area.</p>        
    <p>
        <table>
            <tr>
                <td style="text-align:right"><b>Login:</b></td>
                <td>&nbsp;&nbsp;editor@demo.com</td>
            </tr>
            <tr>
                <td style="text-align:right"><b>Password:</b></td>
                <td>&nbsp;&nbsp;editor</td>
            </tr>
        </table>
    </p>
    <p><br/><a class="btn btn-info" href="Management/Editor.aspx">View &raquo;</a></p>
  </div><!--/col-->
</div><!--/row-->

 <%if (GetMemberSocialNetwork().MemberID > 0 && GetMemberSocialNetwork().SocialNetworkID == 1)
   { %>
     <h2>Your Facebook Wall</h2><br/>
     <div id="member-facebook-wall"></div>

     <script type="text/javascript">
         $(function () {
             $('#member-facebook-wall').fbWall({
                 id: '<%=GetMemberSocialNetwork().SocialNetworkUserID%>',
                 accessToken: '<%=GetMemberSocialNetwork().AccessToken%>',
                 showGuestEntries: true,
                 showComments: true,
                 max: 5,
                 timeConversion: 24
             });
         });
     </script>    
 <%}
   else if (GetMemberSocialNetwork().MemberID > 0 && GetMemberSocialNetwork().SocialNetworkID == 2)
 {%>
     <h2>Your Tweets</h2><br/>
     <div class='tweet query'></div>

 <script type="text/javascript">
     jQuery(function ($) {
         $(".tweet").tweet({
             join_text: "auto",
             username: "<%=GetMemberSocialNetwork().SocialNetworkUserName%>",
             avatar_size: 48,
             count: 10,
             auto_join_text_default: " we said, ",
             auto_join_text_ed: " we ",
             auto_join_text_ing: " we were ",
             auto_join_text_reply: " we replied ",
             auto_join_text_url: " we were checking out ",
             loading_text: "loading tweets..."
         });
     });
 </script>
 <%}%>

</asp:Content>
