<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LayoutSignInControl.ascx.cs" Inherits="Web.App.Controls.LayoutSignInControl" %>
<%if (HttpContext.Current.User.Identity.IsAuthenticated){ %>
   <div class="btn-group pull-right" style="margin-top:8px">       
       <a class="btn dropdown-toggle btn-default" data-toggle="dropdown" href="#" title="&lt;<% =CurrentUserName %>;" style="padding: 1px 4px 1px 1px !important"><img src="<%=AvatarUrl%>" style="width:30px;height:30px" class="img-circle" /> <%=CurrentMemberName %> <span class="caret"></span></a>
       <ul class="dropdown-menu">
           <li><a href="/Account/Profile.aspx">Profile</a></li>
           <li class="divider"></li>
           <li><a href="/Account/SignOut.aspx">Sign Out</a></li>
       </ul>
   </div>
 <%}else{%>           

         <%if(SocialSignIn.Twitter || SocialSignIn.Facebook || SocialSignIn.Google || SocialSignIn.Yahoo ) {%>
         <div class="pull-right" style="margin-top:15px;padding-left:20px;color:white">
             Sign in with:
             <%if(SocialSignIn.Twitter){%><a style="vertical-align:text-bottom !important"  href="/Account/SignInWith.aspx?provider=twitter"><img src="content/images/social/24x24/twitter.png" title="Twitter"/></a><%}%>
             <%if(SocialSignIn.Facebook){%><a style="vertical-align:text-bottom !important"  href="/Account/SignInWith.aspx?provider=facebook"><img src="content/images/social/24x24/facebook.png" title="Facebook"/></a><%}%>
             <%if(SocialSignIn.Google){%><a style="vertical-align:text-bottom !important"  href="/Account/SignInWith.aspx?provider=google"><img src="content/images/social/24x24/google.png" title="Google"/></a><%}%>
             <%if(SocialSignIn.Yahoo){%><a style="vertical-align:text-bottom !important"  href="/Account/SignInWith.aspx?provider=yahoo""><img src="content/images/social/24x24/yahoo.png" title="Yahoo"/></a><%}%>
         </div>
         <%} %>
     <a class="btn pull-right btn-info btn-sm" style="margin-left:5px;margin-top:10px"  href="/Account/SignIn.aspx">Sign In</a>
     <a class="btn pull-right btn-info btn-sm" style="margin-left:5px;margin-top:10px"  href="/Account/SignUp.aspx">Sign Up</a> 
     <!-- a class="btn pull-right" style="margin-left:5px;color:white;margin-top:10px"  href="/Account/ForgotPassword.aspx">Forgot your password?</!-->          
 <%}%>