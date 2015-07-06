using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Net;
using System.Net.Mail;

using Web.Admin.Models;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using System.Text.RegularExpressions;
using Web.Admin.Logic.Utilities;

using Web.Admin.Helpers;
using Web.Admin.Logic;
using System.Runtime.Serialization;
using DotNetOpenAuth.OpenId;
using DotNetOpenAuth.OpenId.RelyingParty;
using DotNetOpenAuth.Messaging;
using DotNetOpenAuth.OpenId.Extensions.AttributeExchange;

using DotNetOpenAuth.OAuth;
using DotNetOpenAuth.ApplicationBlock;
using DotNetOpenAuth.ApplicationBlock.Facebook;
using DotNetOpenAuth.OAuth2;
using System.IO;
using System.Web.Script.Serialization;


// http://stackoverflow.com/questions/19013429/dotnetopenauth-not-working-with-mvc-5-rc

namespace Web.Admin.Controllers
{
    public class ProfileFieldInfo
    {
        [DataMember]
        public string ID { get;  set; }
        [DataMember]
        public string Value { get; set; }
    }

    [ReturnUrlFilter]
    [CompressFilter]
    public class AccountController : BaseController
    {
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
        }

        private string RedirectToAfterLogin(string ReturnUrl)
        {
            String RedirectTo = "";

            if (ReturnUrl != null && ReturnUrl.Length > 1)
            {
                if (ReturnUrl.ToLower().IndexOf("http") < 0 && MemberProfile.IsInRoleAdmin)
                    RedirectTo = ReturnUrl;
                else if (ReturnUrl.ToLower().IndexOf("http") >= 0)
                    RedirectTo = ReturnUrl;
                else if (AppSession.Parameters.RulesRedirectAfterLogin != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0)
                    RedirectTo = AppSession.Parameters.RulesRedirectAfterLogin.Value;
            }
            else if (AppSession.Parameters.RulesRedirectAfterLogin != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0)
                RedirectTo = AppSession.Parameters.RulesRedirectAfterLogin.Value;
            else
            {
                RedirectTo = ReturnUrl;
            }

            if (RedirectTo == "")
                RedirectTo = "/Profile";

            return RedirectTo;
        }

        [HttpGet]
        public ActionResult SignIn()
        {
            AppSession.SignUpDomain = Request.QueryString["domain"];
            AppSession.SignUpDomain = AppSession.SignUpDomain == null ? "" : AppSession.SignUpDomain;

            AppSession.SignInUrl = Request.QueryString["SignInUrl"];
            AppSession.SignInUrl =  AppSession.SignInUrl == null ? "" : AppSession.SignInUrl;

            if (User.Identity.IsAuthenticated)
            {
                String ReturnUrl = Request.QueryString["ReturnUrl"];
                String RedirectAfterLogin = RedirectToAfterLogin(ReturnUrl);

                if (AppSession.SignUpDomain != null && AppSession.SignUpDomain.Length > 0)
                {
                    Uri signInDomain = new Uri(AppSession.ReturnUrl);

                    // Other domains or children subdomains.
                    if (signInDomain.Host.ToLower() != AppSession.Parameters.GeneralDomainName.Value.Trim().ToLower())
                    {
                        Member Member = Members.GetByEmail(User.Identity.Name);
                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        
                        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);

                        AuthMemberToken _ticketMemberSession = serializer.Deserialize<AuthMemberToken>(authTicket.UserData);
                        RedirectAfterLogin = PrepareCrossDomainAuthToken(Member, false, ReturnUrl, signInDomain.DnsSafeHost, signInDomain.Port, AppSession.SignInUrl, _ticketMemberSession);
                    }
                }


                return new RedirectResult(RedirectAfterLogin);
            }

            AppSession.RefreshInvisibleCaptcha();
            return View("SignIn");
        }
        
        [HttpPost]
        public ActionResult SignIn(string Name, string Password, bool RememberMe, string ReturnUrl, string RequestID, string SessionID)
        {
            if (AppSession.Parameters.LDAPEnabled.Value == "true" && Name.IndexOf("@") <= 0)
            {
                Name = String.Format("{0}@{1}", Name, AppSession.Parameters.LDAPDomain.Value);
            }

            RequestResultModel _model = new RequestResultModel();
            Member Member = Members.GetByEmailOrName(Name, Name);
  
            if (AppSession.ReturnUrl == null || AppSession.ReturnUrl.Length > 0)
            { 
            

            }
            else if (ReturnUrl == null || ReturnUrl.Trim().Length == 0 || ReturnUrl.Trim().Replace("/", "").Replace("\\", "").Length == 0)
            {
                _model.Title = GetLabel("Account.Controller.Warning");
                _model.Message = GetLabel("Account.Controller.WrongUser");
                _model.InfoType = RequestResultInfoType.Information;
                AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongUser, Name, Name), AuditEvent.GetSessionDetails("The return URL is empty. This is not allowed. Please add ReturnUrl to the link or set Redirect After SingIn parameter under Settings->Rules."));

                Session["MemberProfile"] = null;

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }


            if (Member.MemberID > 0)
            {
                List<Role> rolesByMember = Web.Admin.Logic.Collections.Roles.GetByMember(Member.MemberID);

                // Check if account is not activated.
                Role _searchRole = rolesByMember.Where(t => t.Name.ToLower() == "Not Activated".ToLower()).FirstOrDefault();
                if (_searchRole != default(Role))
                {
                    _model.Title = GetLabel("Account.Controller.Warning");
                    _model.Message = GetLabel("Account.Controller.NotActivated");
                    _model.InfoType = RequestResultInfoType.Information;
                    AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountNotActivated, Member.Name, Member.Email));

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                // Check if account was blocked.
                MemberProfile profile = new MemberProfile(Member);
                _searchRole = rolesByMember.Where(t => t.Name.ToLower() == "Blocked".ToLower()).FirstOrDefault();
                Role _searchRoleIsAdmin = profile.Roles.Where(t => t.Name.ToLower() == "Admins".ToLower()).FirstOrDefault();
                
                if (_searchRole != default(Role) && _searchRoleIsAdmin == default(Role))
                {
                    _model.Title = GetLabel("Account.Controller.Warning");
                    _model.Message = GetLabel("Account.Controller.AccountBlocked");
                    _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                    AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountAccountBlocked, Member.Name, Member.Email));

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model),
                        RedirectTo = (AppSession.Parameters.RulesPasswordFailedRedirect != null & AppSession.Parameters.RulesPasswordFailedRedirect.Value.Length  > 0) ? AppSession.Parameters.RulesPasswordFailedRedirect.Value : ""

                    }, JsonRequestBehavior.AllowGet);
                }
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // The member email can be changed by LDAP auth because the first part of e-mail can be different with user network id. //
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            bool IsAuthenticate = Authenticate(ref Name, Password);
            
            // LDAP auth was fine but a member has been just created. Try to load the member.
            if (IsAuthenticate && Member.MemberID <= 0)
            {
                Member = Members.GetByEmailOrName(Name, Name);
            }

            if (Member.MemberID > 0 && IsAuthenticate)
            {                
                String RedirectTo = "";
                RedirectTo = SignInMember(Name, Member, RememberMe, ReturnUrl);

                return Json(new
                {
                    IsLocalUrl = Url.IsLocalUrl(ReturnUrl),
                    RedirectTo = RedirectTo

                }, JsonRequestBehavior.AllowGet);

            }
            else if (Member.MemberID > 0)
                AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.MemberWrongPassword, Member.Name, Member.Email));                
            else if (Member.MemberID <= 0)
                AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.MemberWrongEmail, Name));

            _model.Title = GetLabel("Account.Controller.Warning");
            _model.Message = GetLabel("Account.Controller.WrongUser");
            _model.InfoType = RequestResultInfoType.ErrorOrDanger;
            // AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongUser, Member.Name, Member.Email), AuditEvent.GetSessionDetails());

            return Json(new
            {
                NotifyType = NotifyType.DialogInline,
                Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

            }, JsonRequestBehavior.AllowGet);
        }

        private string SignInMember(String Name, Member Member, bool RememberMe, String ReturnUrl, string SocialComment = "")
        {
            Session["MemberProfile"] = new MemberProfile(Member);

            string CookieName = FormsAuthentication.FormsCookieName;
            string CookiePath = FormsAuthentication.FormsCookiePath;

            if (AppSession.Parameters.GeneralCookieName.Value.Length > 0)
                CookieName = AppSession.Parameters.GeneralCookieName.Value;

            bool isCookiePersistent = RememberMe;
            FormsAuthentication.Initialize();


            AuthMemberTicket _authMemberTicket = AuthMemberTickets.GetLastByMember(Member.MemberID);
            if (_authMemberTicket.Expiration <= DateTime.Now)
            {
                _authMemberTicket.Delete();
                _authMemberTicket.AuthMemberTicketID = 0;
            }

            AuthMemberToken _ticketMemberSession = new AuthMemberToken()
            {
                MemberID = Member.MemberID,
                MemberEmail = Member.Email,
                MemberName = Member.Name,
                Token = _authMemberTicket.AuthMemberTicketID > 0 ? _authMemberTicket.Token : StringTool.RandomString(64)
            };

            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1,
                Member.Email,
                DateTime.Now,
                DateTime.Now + FormsAuthentication.Timeout,
                isCookiePersistent,
                ToJson(_ticketMemberSession),
                CookiePath);

            string cookieEncrypted = FormsAuthentication.Encrypt(authTicket);
            HttpCookie authCookie = new HttpCookie(CookieName, cookieEncrypted);

            if (isCookiePersistent)
                authCookie.Expires = authTicket.Expiration;

            // In order to keep not empty UserData for auth ticket.
            // http://stackoverflow.com/questions/12642516/formsauthenticationticket-isnt-storing-userdata
            
            if (AppSession.Parameters.GeneralDomainName.Value.Length > 0 && AppSession.Parameters.GeneralDomainName.Value != "localhost")
                 authCookie.Domain = AppSession.Parameters.GeneralDomainName.Value;

            authCookie.HttpOnly = true;
            authCookie.Path = CookiePath;
            Response.Cookies.Add(authCookie);

            AuditEvent.AppEventSuccess(Profile.Member.Email, SocialComment + " " + String.Format(AuditEvent.MemberLoggedIn, Member.Name, Member.Email));
            Member.UpdateLoginTime();

            String RedirectTo = "";
            if (AppSession.ReturnUrl != null && AppSession.ReturnUrl.Length > 0)
                RedirectTo = AppSession.ReturnUrl;
            else
                RedirectTo = RedirectToAfterLogin(ReturnUrl);


            if (AppSession.ReturnUrl != null && AppSession.ReturnUrl.Length > 0)
            {
                //////////////////////////////////////////////////////////////////////////
                // Needs to create session for cross domain auth. 
                //////////////////////////////////////////////////////////////////////////
                if (AppSession.SignUpDomain != null && AppSession.SignUpDomain.Length > 0)
                {
                    Uri signInDomain = new Uri(AppSession.ReturnUrl);
                    signInDomain = new Uri(AppSession.ReturnUrl);

                    if (signInDomain.Host.Trim().ToLower().IndexOf(AppSession.Parameters.GeneralDomainName.Value.Trim().ToLower())  == -1)
                        RedirectTo = PrepareCrossDomainAuthToken(Member, RememberMe, ReturnUrl, signInDomain.DnsSafeHost, signInDomain.Port, AppSession.SignInUrl, _ticketMemberSession);
                }
            }

            if (_authMemberTicket.AuthMemberTicketID <= 0)
            {
                _authMemberTicket = new AuthMemberTicket()
                {
                    Token = _ticketMemberSession.Token,
                    MemberID = Member.MemberID,
                    IssueDate = authTicket.IssueDate,
                    Expiration = authTicket.Expiration,
                    IsPersistent = (authTicket.IsPersistent == true ? 1 : 0)
                };

                _authMemberTicket.Save();
            }
            
            return RedirectTo;
        }

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // http://stackoverflow.com/questions/342378/cross-domain-login-how-to-login-a-user-automatically-when-transferred-from-one
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
        private string PrepareCrossDomainAuthToken(Member Member, bool RememberMe, String ReturnUrl, string Host, int Port, string SignInUrl,  AuthMemberToken AuthMemberToken,  string SocialComment = "")
        {
            String RedirectTo = "";
            if (AppSession.ReturnUrl != null && AppSession.ReturnUrl.Length > 0)
                RedirectTo = AppSession.ReturnUrl;
            else
                RedirectTo = RedirectToAfterLogin(ReturnUrl);

            String returnUrl = RedirectTo;
            
            RedirectTo = String.Format("http://{0}:{1}{2}", Host, Port, SignInUrl);
            RedirectTo += (RedirectTo.IndexOf("?") > 0 ? "&" : "?") + "BackUrl=" + HttpUtility.UrlEncode(returnUrl);
            RedirectTo += (RedirectTo.IndexOf("?") > 0 ? "&" : "?") + "p1=" + HttpUtility.UrlEncode(StringTool.Encrypt(AuthMemberToken.Token)) + "&p2=" + HttpUtility.UrlEncode(StringTool.Encrypt(Member.Email));

            return RedirectTo;        
        }

        public ActionResult SignOut()
        {
            Member Member = Members.GetByEmail(User.Identity.Name);
            HttpCookie authCookie = HttpContext.Request.Cookies[FormsAuthentication.FormsCookieName];            

            if (authCookie != null)
            {
                authCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(authCookie);

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);
                AuthMemberToken _ticketMemberSession = serializer.Deserialize<AuthMemberToken>(authTicket.UserData);

                AuthMemberTickets.DeleteMemberToken(_ticketMemberSession.MemberID, _ticketMemberSession.Token);
            }
            
            // Invalidate the Cache on the Client Side
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-30));
            Response.Cache.SetNoStore();
            FormsAuthentication.SignOut();
            HttpContext.Session.Abandon();


            String ReturnUrl = Request.QueryString["returnUrl"];
            String RedirectTo = "";
            
            if (ReturnUrl == null || ReturnUrl.Length == 0)
                ReturnUrl = AppSession.ReturnUrl;

            if (ReturnUrl != null && ReturnUrl.Length > 0)
            {
                RedirectTo = ReturnUrl;
            }
            else if (AppSession.Parameters.RulesRedirectAfterLogout != null && AppSession.Parameters.RulesRedirectAfterLogout.Value.Length > 0)
            {                
                if (AppSession.Parameters.GeneralMaintenanceEnabled.Value != "true")
                    RedirectTo = AppSession.Parameters.RulesRedirectAfterLogout.Value;
                else
                    return View("SignOut");
            }
            else
            {
                return View("SignOut");
            }

            if (RedirectTo.IndexOf("signedout") < 0)
                RedirectTo = RedirectTo + ((RedirectTo.IndexOf("?") >= 0 ? "&" : "?") + "signedout=1");


            return new RedirectResult(RedirectTo);
        }

        private void RevokeAccess(string userId, string accessToken)
        {

            string url = String.Format("https://graph.facebook.com/{0}/permissions?access_token={1}", userId, accessToken);
            var request = WebRequest.CreateDefault(new Uri(url));
            request.Method = "DELETE";

            try
            {

                var response = request.GetResponse();
            }
            catch (WebException wex)
            {
                if (wex.Response != null)
                {
                    using(StreamReader sr = new StreamReader(wex.Response.GetResponseStream()))
                    {
                        var errBody = sr.ReadToEnd();
                    }
                }
            }
        }

        public ActionResult CreateAccount()
        {
            if (AppSession.Parameters.RegistrationSelfRegistration.Value == "true" || AppSession.IsMemberInAdminRole)
            {
                AppSession.RefreshInvisibleCaptcha();
                return View("CreateAccount");
            }
            else
            {
                string ReturnUrl = AppSession.ReturnUrl;
                ReturnUrl = (ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : ((AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0) ? AppSession.Parameters.RulesRedirectAfterLogin.Value : Url.Content("~/"));

                AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to create an account but it was switched off. ", AuditEvent.GetSessionDetails());
                return new RedirectResult(ReturnUrl);
            }
        }

        public ActionResult ForgotPassword()
        {
            if (AppSession.Parameters.RegistrationResetPassword.Value == "true" || AppSession.IsMemberInAdminRole)
            {
                AppSession.RefreshInvisibleCaptcha();
                return View("ForgotPassword");
            }
            else
            {
                string ReturnUrl = AppSession.ReturnUrl;
                ReturnUrl = (ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : ((AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0) ? AppSession.Parameters.RulesRedirectAfterLogin.Value : Url.Content("~/"));

                AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to send change password notification but it was switched off. ", AuditEvent.GetSessionDetails());
                return new RedirectResult(ReturnUrl);
            }
        }

        public ActionResult Register(string Name, string Email, string Password, string Confirmation, string ReturnUrl, List<ProfileFieldInfo> FieldInfo, string RequestID, string SessionID, int TimeZoneOffset)
        {
            AppParams.RefreshAppParameters();
            string AfterSingUpRedirectUrl = "";

            if (AppSession.Parameters.RegistrationSelfRegistration.Value == "false")
            {
                if (AppSession.IsMemberInAdminRole)
                {


                }
                else
                {

                    if (ReturnUrl == null || ReturnUrl.Trim().Length == 0)
                        ReturnUrl = (ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : ((AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0) ? AppSession.Parameters.RulesRedirectAfterLogin.Value : Url.Content("~/"));

                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to Register notification but it was switched off. ", AuditEvent.GetSessionDetails());
                    return new RedirectResult(ReturnUrl);
                }
            }
            
            RequestResultModel _model = new RequestResultModel();

            if (AppSession.IsEmail(Name))
            {
                _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.NameLooksLikeEmail"));
            }

            if (Name == null || Name.Trim().Length == 0 ||
               ((Password == null || Password.Trim().Length == 0)) ||
               Email == null || Email.Trim().Length == 0 ||
               Password != Confirmation ||
               !AppSession.IsEmail(Email) ||
               (Password != null && Password.Length > 0 && Password.Length <=3) ||
               (Confirmation != null && Confirmation.Length > 0 && Confirmation.Length <=3))
            {
                if (Name == null || Name.Trim().Length == 0)
                    _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.NameIsEmpty"));

                if ((Password == null || Password.Trim().Length == 0))
                    _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.PasswordIsEmty"));

                if (Email == null || Email.Trim().Length == 0)
                    _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.EmailIsEmpty"));

                if (Email != null && !AppSession.IsEmail(Email))
                    _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.EmailWrongFromat"));

                if (Password != Confirmation)
                    _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.PasswordNoMatch"));

                if ((Password != null && Password.Length > 0 && Password.Length < AppSession.PasswordMaxLength) ||
                (Confirmation != null && Confirmation.Length > 0 && Confirmation.Length < AppSession.PasswordMaxLength))
                {
                    _model.Message += String.Format("<li>{0}</<li>", String.Format(GetLabel("Account.CreateAccount.PasswordLength"), AppSession.PasswordMaxLength));
                }
            }


            // Check mandatory fields
            if (FieldInfo != null)
            {
                foreach (ProfileFieldInfo Field in FieldInfo)
                {
                    ProfileField profileField = ProfileFields.GetBy(int.Parse(Field.ID));
                    if (profileField.IsMandatory == 1 && (Field.Value == null || Field.Value.Trim().Length == 0))
                    {
                        _model.Message += String.Format("<li>{0}</li>", String.Format(GetLabel("Account.CreateAccount.Mandatory"), profileField.FieldName));
                    }

                    if (profileField.IsMandatory == 1 && profileField.FieldTypeID == ProfileFieldTypeEnum.CheckBox && Field.Value != null && Field.Value.ToLower() == "false")
                    {
                        _model.Message += String.Format("<li>{0}</li>", String.Format(GetLabel("Account.CreateAccount.Mandatory"), profileField.FieldName));
                    }
                }
            }

            bool nonAlphaNumeric = Name.Replace(" ", "").All(c => char.IsLetterOrDigit(c));
            if (!nonAlphaNumeric)
            {
                _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.NameNonAlfaNum"));
            }


            if (_model.Message.Length > 0)
            {
                _model.Message = String.Format("<ul class=\"error-message-list\">{0}</ul>", _model.Message);
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                
                return Json(new
                {
                    Status = RequestResultInfoType.ErrorOrDanger,
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }

            // Check email format
            if (!AppSession.IsEmail(Email))
            {
                _model.Title = GetLabel("Account.Controller.Warning");
                _model.Message = GetLabel("Account.Controller.WrongEmail");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                AuditEvent.AppEventError(AppParams.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongEmail, Name, Email));
            }
            else
            {
                if (!AppSession.IsMailDomainAllowed(Email))
                {
                    _model.Title = GetLabel("Account.Controller.Warning");
                    _model.Message = GetLabel("Account.Controller.DomainNotAllowed");
                    _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                    AuditEvent.AppEventError(AppParams.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountDomainNotAllowed, Name, Email));
                }
                else
                {
                    Member Member = Members.GetByEmailOrName(Email, Name);

                    if (Member.MemberID > 0)
                    {
                        _model.Title = GetLabel("Account.Controller.Warning");
                        _model.Message = GetLabel("Account.Controller.AccountExists");
                        _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                        AuditEvent.AppEventError(AppParams.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountAccountExists, Name, Email));
                    }
                    else
                    {
                        // Was account activated ?
                        // Was account blocked ?

                        Member member = new Logic.Objects.Member();
                        member.Name = Name;
                        member.Email = Email;
                        member.Password = Password;
                        member.IsBuiltIn = false;
                        member.Created = DateTime.UtcNow;

                        member.Save();

                        try
                        {
                            string ActivateToken = Web.Admin.Logic.StringTool.RandomString(20);

                            if (!SendActivationEmail(Name, Email, ActivateToken)){
                                throw new Exception("Creating an account notification e-mail has not been send!");
                            }

                            ActionToken actionToken = new ActionToken();
                            actionToken.Email = Email;
                            actionToken.Token = HttpUtility.UrlDecode(ActivateToken);
                            actionToken.ActionType = ActionTokenTypes.SelfActivation;
                            actionToken.ReturnURL = AppSession.ReturnUrl != null ? AppSession.ReturnUrl : ( AppSession.Parameters.RulesRedirectAfterLogout.Value != "" ? AppSession.Parameters.RulesRedirectAfterLogout.Value : "") ;
                            actionToken.Save();

                            if (member.MemberID > 0)
                            {
                                string[] RoleNames = AppParams.RegistrationMemberRegistrationToRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                                foreach (String RoleName in RoleNames)
                                {
                                    Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                                    if (role.RoleID > 0)
                                    {
                                        MemberRole memberrole = new MemberRole();
                                        memberrole.MemberID = member.MemberID;
                                        memberrole.RoleID = role.RoleID;
                                        memberrole.Save();
                                    }
                                }
                            }

                            if (FieldInfo != null)
                            {
                                foreach (ProfileFieldInfo Field in FieldInfo)
                                {
                                    ProfileField profileField = ProfileFields.GetBy(int.Parse(Field.ID));

                                    MemberProfileField memberProfileField = new MemberProfileField();
                                    memberProfileField.MemberID = member.MemberID;
                                    memberProfileField.FieldID = int.Parse(Field.ID);
                                    memberProfileField.FieldValue = Field.Value;

                                    if (Field.Value == null || Field.Value.Trim().Length == 0)
                                        memberProfileField.Delete();
                                    else
                                        memberProfileField.Save();
                                }
                            }

                             Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                              
                             if (_domain.DomainID > 0)
                              {
                                  MemberDomain _memberDomain = new MemberDomain();
                                  _memberDomain.DomainID = _domain.DomainID;
                                  _memberDomain.MemberID = member.MemberID;
                                  _memberDomain.Save();
                              }

                            if (AppSession.Parameters.RulesRedirectAfterSignUp.Value != null && AppSession.Parameters.RulesRedirectAfterSignUp.Value.Length > 0)
                                AfterSingUpRedirectUrl = AppSession.Parameters.RulesRedirectAfterSignUp.Value;
                            
                            _model.Title = GetLabel("Account.Controller.Congrat");
                            _model.Message = GetLabel("Account.Controller.ActivationMailSent");
                            _model.InfoType = RequestResultInfoType.Success;
                            AuditEvent.AppEventSuccess(AppParams.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountActivationMailSent, Name, Email));

                        }
                        catch (Exception ex) {                            
                            try
                            {
                                // Try to delete member if notification was failed.                            
                                member.Delete();
                            }
                            catch { }
                            
                            _model.Title = GetLabel("Account.Controller.Warning");
                            _model.Message = GetLabel("Account.Controller.CantSendNotification");
                            _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                            AuditEvent.AppEventError(Email ,"Registration: Something went wrong with e-mail notification: " + ex.Message, AuditEvent.GetSessionDetails(ex.StackTrace),true);
                        }
                    }
                }
            }
           
            return Json(new
           {
               Status = _model.InfoType,
               RedirectTo = AfterSingUpRedirectUrl,
               NotifyType = NotifyType.DialogInline,
               Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

           }, JsonRequestBehavior.AllowGet);

        }

        public ActionResult Activate()
        {
            if (AppSession.Parameters.RegistrationSelfActivation.Value == "false")
            {
                if (AppSession.IsMemberInAdminRole)
                {


                }
                else
                {
                    string ReturnUrl = AppSession.ReturnUrl;
                    ReturnUrl = (ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : ((AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0) ? AppSession.Parameters.RulesRedirectAfterLogin.Value : Url.Content("~/"));

                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to activate an account but it was switched off. ", AuditEvent.GetSessionDetails());
                    return new RedirectResult(ReturnUrl);
                }
            }
                
            string Token = Request.QueryString["t"];
            RequestResultModel model = new RequestResultModel();

            model.Title = GetLabel("Account.Controller.Warning");
            model.Message = GetLabel("Account.Controller.WrongActiveLink");
            model.InfoType = RequestResultInfoType.Information;

            if (Token != null && Token.Length > 0)
            {
                try
                {
                    // Review activation token
                    ActionToken actionToken = ActionTokens.GetBy(Token, ActionTokenTypes.SelfActivation);
                    if (actionToken.ActionID <= 0)
                    {
                        string ReturnUrl = AppSession.ReturnUrl;
                        ReturnUrl = (ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : ((AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0) ? AppSession.Parameters.RulesRedirectAfterLogin.Value : Url.Content("~/"));
                        
                        AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to activate an account but token doesn't exist.", AuditEvent.GetSessionDetails());
                        return new RedirectResult(ReturnUrl);
                    }

                    if (actionToken.ReturnURL != null && actionToken.ReturnURL.Length > 0)
                        AppSession.ReturnUrl = actionToken.ReturnURL;

                    Member Member = Members.GetByEmail(actionToken.Email);
                    if (Member.MemberID > 0)
                    {
                        // Remove registration roles
                        string[] RoleNames = AppParams.RegistrationMemberRegistrationToRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (String RoleName in RoleNames)
                        {
                            Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                            if (role.RoleID > 0)
                            {
                                MemberRole memberrole = new MemberRole();
                                memberrole.MemberID = Member.MemberID;
                                memberrole.RoleID = role.RoleID;
                                memberrole.Delete();
                            }
                        }

                        // Add activation roles
                        RoleNames = AppParams.RegistrationMemberActivationToRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (String RoleName in RoleNames)
                        {
                            Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                            if (role.RoleID > 0)
                            {
                                MemberRole memberrole = new MemberRole();
                                memberrole.MemberID = Member.MemberID;
                                memberrole.RoleID = role.RoleID;
                                memberrole.Save();
                            }
                        }

                        string ReturnURL = actionToken.ReturnURL;
                        // AuditEvent.AppEventInfo(Member.Email, "ActionToken.ReturnURL = " + actionToken.ReturnURL + " Session back URL: " + AppSession.ReturnUrl);
                        actionToken.Delete();

                        try
                        {
                            if (!SendActivationDoneEmail(Member.Name, Member.Email, ReturnURL))
                            {
                                AuditEvent.AppEventError(Member.Email, "Activation notification e-mail has not been send!", AuditEvent.GetSessionDetails());
                            }
                        }
                        catch (Exception ex)
                        {
                            AuditEvent.AppEventError(Member.Email, "Activation: Something went wrong with e-mail notification: " + ex.Message, AuditEvent.GetSessionDetails(ex.StackTrace), true);
                        }

                        model.Title = GetLabel("Account.Controller.Congrat");
                        model.Message = GetLabel("Account.Controller.Activated").Replace("{{name}}", actionToken.Email);
                        model.InfoType = RequestResultInfoType.Success;
                        AuditEvent.AppEventSuccess(Member.Email, String.Format(AuditEvent.AccountActivated, Member.Name, Member.Email));
                    }

                }
                catch (Exception ex)
                {
                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Something wrong with activation: " + ex.Message, AuditEvent.GetSessionDetails(ex.StackTrace),true);                
                }
            }
            else
            {
                  AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongActiveLink, Token));                
            }

            return View("ActivateAccount", model);
        }

        public ActionResult SendChangePasswordLink(string Name, string Email, string RequestID, string SessionID)
        {
            if (AppSession.Parameters.RegistrationResetPassword.Value == "false")
            {
                if (AppSession.IsMemberInAdminRole)
                {


                }
                else
                {
                    string ReturnUrl = AppSession.ReturnUrl;
                    ReturnUrl = (ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : ((AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0) ? AppSession.Parameters.RulesRedirectAfterLogin.Value : Url.Content("~/"));

                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to request changing password but it was switched off. ", AuditEvent.GetSessionDetails());
                    return new RedirectResult(ReturnUrl);
                }
            }

            RequestResultModel _model = new RequestResultModel();
            
            if (Name == null || Name.Trim().Length == 0 ||
               Email == null || Email.Trim().Length == 0 ||
               !AppSession.IsEmail(Email))
            {
                _model = new RequestResultModel();
                _model.Title = "Warning";
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;

                if (Name == null || Name.Trim().Length == 0)
                    _model.Message = String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.NameIsEmpty"));

                if (Email == null || Email.Trim().Length == 0)
                    _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.EmailIsEmpty"));

                if (Email != null && !AppSession.IsEmail(Email))
                    _model.Message += String.Format("<li>{0}</<li>", GetLabel("Account.CreateAccount.EmailWrongFromat"));

                _model.Message = String.Format("<ul>{0}</ul>", _model.Message);

                return Json(new
                {
                    Status = RequestResultInfoType.ErrorOrDanger,
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);

            }

           Member Member = Members.GetByEmailName(Email, Name);
           
           if (!AppSession.IsEmail(Email))
           {
               _model.Title = GetLabel("Account.Controller.Warning");
               _model.Message = GetLabel("Account.Controller.WrongEmail");
               _model.InfoType = RequestResultInfoType.ErrorOrDanger;
               AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongEmail, Member.Name, Member.Email));
           }
           else
           {
               if (Member.MemberID <= 0)
               {
                   _model.Title = GetLabel("Account.Controller.Warning");
                   _model.Message = GetLabel("Account.Controller.AccountDoesntExist");
                   _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                   AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountAccountDoesntExist, Name, Email));
               }
               else
               {
                   try
                   {
                       string ResetToken = Web.Admin.Logic.StringTool.RandomString(20);

                       if (!SendChangePasswordEmail(Name, Email, ResetToken))
                       {
                           throw new Exception("Changing password link notification e-mail has not been send!");
                       };

                       _model.Title = GetLabel("Account.Controller.Congrat");
                       _model.Message = GetLabel("Account.Controller.ResetPassMail");
                       _model.InfoType = RequestResultInfoType.Success;

                       ActionToken actionToken = new ActionToken();
                       actionToken.Email = Email;
                       actionToken.Token = HttpUtility.UrlDecode(ResetToken);
                       actionToken.ActionType = ActionTokenTypes.PasswordReset;
                       actionToken.ReturnURL = AppSession.ReturnUrl != null ? AppSession.ReturnUrl : (AppSession.Parameters.RulesRedirectAfterLogout.Value != "" ? AppSession.Parameters.RulesRedirectAfterLogout.Value : "");
                       actionToken.Save();

                       AuditEvent.AppEventSuccess(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountResetPassMail, Member.Name, Member.Email));

                   }
                   catch (Exception ex) {
                       _model.Title = GetLabel("Account.Controller.Warning");
                       _model.Message = GetLabel("Account.Controller.CantSendNotification");
                       _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                       AuditEvent.AppEventError(Email ,"Send change password link: Something went wrong with e-mail notification: " + ex.Message, AuditEvent.GetSessionDetails(ex.StackTrace),true);
                    }
               }
           }
           
           return Json(new
           {
               Status = _model.InfoType,
               NotifyType = NotifyType.DialogInline,
               Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

           }, JsonRequestBehavior.AllowGet);

        }

        public ActionResult ChangePassword()
        {
            string ReturnUrl = Request.QueryString["ReturnUrl"];
            ReturnUrl = (ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : ((AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0) ? AppSession.Parameters.RulesRedirectAfterLogin.Value : Url.Content("~/"));

            if (AppSession.Parameters.RegistrationResetPassword.Value == "false")
            {
                if (AppSession.IsMemberInAdminRole)
                {


                }
                else
                {
                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to do change password but it was switched off. ", AuditEvent.GetSessionDetails());
                    return new RedirectResult(ReturnUrl);
                }
            }

            string Token = Request.QueryString["t"];
            RequestResultModel model = new RequestResultModel();

            model.Title = GetLabel("Account.Controller.Warning");
            model.Message = GetLabel("Account.Controller.WrongResetPassLink");
            model.InfoType = RequestResultInfoType.Warning;

            if (Token != null && Token.Length > 0)
            {
                try
                {
                    ActionToken actionToken = ActionTokens.GetBy(Token, ActionTokenTypes.PasswordReset);
                    if (actionToken.ActionID <= 0)
                    {
                        AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, Token) + " Member redirected to: " + ReturnUrl,AuditEvent.GetSessionDetails());
                        return new RedirectResult(ReturnUrl);
                    }

                    Member Member = Members.GetByEmail(actionToken.Email);
                    if (Member.MemberID > 0)
                    {
                        ChangePasswordModel _model = new ChangePasswordModel();
                        _model.Name = Member.Name;
                        _model.Email = Member.Email;
                        _model.Token = Token;
                        return View("ChangePassword", _model);
                    }
                    else
                    {
                        AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, Token) + " Member redirected to: " + ReturnUrl, AuditEvent.GetSessionDetails());
                        return new RedirectResult(ReturnUrl);
                    }
                }
                catch
                {
                    // Log - wrong activation token
                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, Token));
                }
            }

            AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, (Token != null ? Token : "[IsEmpty]")) + " Member redirected to: " + ReturnUrl, AuditEvent.GetSessionDetails());
           return new RedirectResult(ReturnUrl);
            
        }

        public ActionResult ChangePasswordAccount(string Password, string Confirmation, string Token, String ReturnUrl)
        {
            if (Token != null && Token.Length > 0)
            { 
               ActionToken actionToken = ActionTokens.GetBy(Token, ActionTokenTypes.PasswordReset);
               if (actionToken.ActionID <= 0)
               {
                   AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, Token) + " Member redirected to: " + (ReturnUrl != null ? ReturnUrl : ""));                   
                   
                   return Json(new
                   {
                       RedirectTo = ((ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : Url.Content("~/")),
                   }, JsonRequestBehavior.AllowGet);               
               }
            }
            
            if (AppSession.Parameters.RegistrationResetPassword.Value == "false")
            {
                if (AppSession.IsMemberInAdminRole)
                {


                }
                else
                {
                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Somebody tries to do activation but the activation was switched off. ", AuditEvent.GetSessionDetails());
                    return Json(new
                    {
                        RedirectTo = ((ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : Url.Content("~/")),
                    }, JsonRequestBehavior.AllowGet);
                }
            }

            RequestResultModel model = new RequestResultModel();

            model.Title = GetLabel("Account.Controller.Warning");
            model.Message = GetLabel("Account.Controller.WrongResetPassLink");
            model.InfoType = RequestResultInfoType.Warning;

            if ((Password != null && Password.Length > 0 && Password.Length < AppSession.PasswordMaxLength) ||
                (Confirmation != null && Confirmation.Length > 0 && Confirmation.Length < AppSession.PasswordMaxLength))
            {
                model.Message = String.Format("{0}", String.Format(GetLabel("Account.CreateAccount.PasswordLength"), AppSession.PasswordMaxLength));
                model.InfoType = RequestResultInfoType.ErrorOrDanger;
            }
            else if (Password.Trim() != Confirmation.Trim())
            {
                model.Message = String.Format("{0}", GetLabel("Account.CreateAccount.PasswordNoMatch"));
                model.InfoType = RequestResultInfoType.ErrorOrDanger;
            }
            else if (Token != null && Token.Length > 0)
            {
                try
                {
                    ActionToken actionToken = ActionTokens.GetBy(Token, ActionTokenTypes.PasswordReset);
                    if (actionToken.ActionID <= 0)
                    {
                        AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, Token));
                        
                        return Json(new
                        {
                            RedirectTo = (actionToken.ReturnURL != null && actionToken.ReturnURL.Length > 0) ? actionToken.ReturnURL : ((ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl :  @Url.Content("~/")),
                        }, JsonRequestBehavior.AllowGet);
                    }

                    Member Member = Members.GetByEmail(actionToken.Email);
                    if (Member.MemberID > 0)
                    {
                        Member.Password = Password;
                        Member.SavePassword();
                        actionToken.Delete();
                        
                        try
                        {
                            if (!SendChangePasswordDoneEmail(Member.Name, Member.Email, Password))
                            {
                                AuditEvent.AppEventError(Member.Email, "Password changed notification e-mail has not been send!");
                            }
                        }
                        catch (Exception ex)
                        {
                            AuditEvent.AppEventError(Member.Email, "Send password changed notification: Something went wrong with e-mail notification: " + ex.Message, AuditEvent.GetSessionDetails(ex.StackTrace), true);
                        }

                        model.Title = GetLabel("Account.Controller.Congrat");
                        model.Message = GetLabel("Account.Controller.PassChanged");
                        model.InfoType = RequestResultInfoType.Success;
                        AuditEvent.AppEventSuccess(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountPassChanged, Member.Name, Member.Email));
                    }
                    else
                    {
                        AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, Token));

                        return Json(new
                        {
                            RedirectTo = (actionToken.ReturnURL != null && actionToken.ReturnURL.Length > 0) ? actionToken.ReturnURL : ((ReturnUrl != null && ReturnUrl.Length > 0) ? ReturnUrl : Url.Content("~/")),
                        }, JsonRequestBehavior.AllowGet);

                    }
                }
                catch
                {
                    // Log - wrong activation token
                    AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, String.Format(AuditEvent.AccountWrongResetPassLink, Token));
                }
            }

            return Json(new
            {
                Status = model.InfoType,
                NotifyType = NotifyType.DialogInline,
                Html = this.RenderPartialView(@"_RequestResultDialogInLine", model)

            }, JsonRequestBehavior.AllowGet);
            
        }

        ////////////////////////////////////
        // Member emal notification block
        ////////////////////////////////////

        private bool SendActivationEmail(string Name, string Email, string ActivateToken)
        {
            string template = this.RenderPartialView(@"Templates/Mails/_ActivationRequest", null);

            if (AppSession.ReturnUrl != null && AppSession.ReturnUrl.Length > 0)
                ActivateToken += "&ReturnUrl=" + HttpUtility.UrlEncode(AppSession.ReturnUrl);
            else if (AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0)
                ActivateToken += "&ReturnUrl=" + HttpUtility.UrlEncode(AppSession.Parameters.RulesRedirectAfterLogin.Value);

            template = template.Replace("{{name}}",Name);
            template = template.Replace("{{email}}",Email);
            template = template.Replace("{{link}}", AppParams.GeneralAppPath.Value + "/Activate"); //Url.Action("activate", "account"));
            template = template.Replace("{{token}}", ActivateToken);

            string body = StringTool.DeleteLines(template, 1);
            string subject = template.Replace(body,"").Replace("\r\n","");

            return AppSession.SendMail
            (
                AppParams.MailServerSmtpUser.Value, AppParams.MailServerSmtpEmail.Value,
                Name, Email,
                AppParams.RulesMailBccRegistration.Value == "true" ? AppSession.Parameters.RulesMailBcc.Value : null,
                subject,
                body
            ); 
        }
        
        private bool SendActivationDoneEmail(string Name, string Email, string ReturnURL)
        {
            string template = this.RenderPartialView(@"Templates/Mails/_ActivationConfirmation", null);
            template = template.Replace("{{name}}", Name);
            template = template.Replace("{{email}}", Email);
            template = template.Replace("{{returnurl}}", (ReturnURL != null ? ReturnURL : "."));

            string body = StringTool.DeleteLines(template, 1);
            string subject = template.Replace(body, "").Replace("\r\n", "");

            return AppSession.SendMail
            (
                AppParams.MailServerSmtpUser.Value, AppParams.MailServerSmtpEmail.Value,
                Name, Email,
                AppParams.RulesMailBccActivation.Value == "true" ? AppSession.Parameters.RulesMailBcc.Value : null,
                subject,
                body
            );
        }

        private bool SendChangePasswordEmail(string Name, string Email, string ResetToken)
        {
            string template = this.RenderPartialView(@"Templates/Mails/_ChangePasswordRequest", null);

            if (AppSession.ReturnUrl != null && AppSession.ReturnUrl.Length > 0)
                ResetToken += "&ReturnUrl=" + HttpUtility.UrlEncode(AppSession.ReturnUrl);
            else if (AppSession.Parameters.RulesRedirectAfterLogin.Value != null && AppSession.Parameters.RulesRedirectAfterLogin.Value.Length > 0)
                ResetToken += "&ReturnUrl=" + HttpUtility.UrlEncode(AppSession.Parameters.RulesRedirectAfterLogin.Value);
            
            template = template.Replace("{{name}}", Name);
            template = template.Replace("{{email}}", Email);
            template = template.Replace("{{link}}", AppParams.GeneralAppPath.Value + "/ChangePassword"); // Url.Action("changepassword", "account"));
            template = template.Replace("{{token}}", ResetToken);

            string body = StringTool.DeleteLines(template, 1);
            string subject = template.Replace(body, "").Replace("\r\n", "");

            return AppSession.SendMail
            (
                AppParams.MailServerSmtpUser.Value, AppParams.MailServerSmtpEmail.Value,
                Name, Email,
                AppParams.RulesMailBccPasswordChange.Value == "true" ? AppSession.Parameters.RulesMailBcc.Value : null,
                subject,
                body
            );
        }

        private bool SendChangePasswordDoneEmail(string Name, string Email, string Password)
        {
            string template = this.RenderPartialView(@"Templates/Mails/_ChangePasswordConfirmation", null);

            template = template.Replace("{{name}}", Name);
            template = template.Replace("{{email}}", Email);
            template = template.Replace("{{password}}",Password);

            string body = StringTool.DeleteLines(template, 1);
            string subject = template.Replace(body, "").Replace("\r\n", "");

            return AppSession.SendMail
            (
                AppParams.MailServerSmtpUser.Value, AppParams.MailServerSmtpEmail.Value,
                Name, Email,
                AppParams.RulesMailBccPasswordChange.Value == "true" ? AppSession.Parameters.RulesMailBcc.Value : null,
                subject,
                body
            );

        }

        private bool IsMaintenanceTime()
        {
            
            return false;
        }

        private bool IsSecretAdminURLNow()
        {

            return false;
        }

        public ActionResult SignInWith(String Provider, String Name)
        {
            AppSession.SignUpDomain = Request.QueryString["domain"];
            AppSession.SignUpDomain = String.IsNullOrEmpty(AppSession.SignUpDomain)  ? "" : AppSession.SignUpDomain;

            if (User.Identity.IsAuthenticated)
            {
                AppSession.SignInUrl = Request.QueryString["SignInUrl"];
                AppSession.SignInUrl = AppSession.SignInUrl == null ? "" : AppSession.SignInUrl;

                return SignIn();                
            }

            try
            {
                if (Provider == "google" && AppSession.Parameters.SocialGooleEnabled.Value == "true")
                    //return AuthGoogleOAuth2();
                    return AuthGoogle();
                else if (Provider == "yahoo" && AppSession.Parameters.SocialYahooEnabled.Value == "true")
                    return AuthYahoo();
                else if (Provider == "twitter" && AppSession.Parameters.SocialTwitterEnabled.Value == "true")
                    return AuthTwitter();
                else if (Provider == "facebook" && AppSession.Parameters.SocialFacebookEnabled.Value == "true")
                    return AuthFacebook();
                else if (Provider == "livejournal" && AppSession.Parameters.SocialLiveJournalEnabled.Value == "true")
                    return AuthOpenIDService(Name, "http://{0}.livejournal.com", "Live Journal", "livejournal", "livejournal.com", AppSession.Parameters.SocialLiveJournalRoles.Value);
                else if (Provider == "blogger" && AppSession.Parameters.SocialBloggerEnabled.Value == "true")
                    return AuthOpenIDService(Name, "http://{0}.blogspot.com/", "Blogger", "blogspot", "blogspot.com", AppSession.Parameters.SocialBloggerRoles.Value);
                else if (Provider == "openid" && AppSession.Parameters.SocialOpenIDEnabled.Value == "true")
                    return AuthOpenIDService(Name, "{0}", "OpenID", "openid", "openid.com", AppSession.Parameters.SocialOpenIDRoles.Value);
                else if (Provider == "myopenid" && AppSession.Parameters.SocialOpenIDEnabled.Value == "true")
                    return AuthOpenIDService(Name, "http://{0}.myopenid.com/'", "myOpenID", "myopenid", "myopenid.com", AppSession.Parameters.SocialMyOpenIDRoles.Value);
                else
                    return new RedirectResult("~/SignIn");
            }
            catch (Exception ex)
            {
                String Message = ex.Message;

                if (ex.InnerException != null)
                    Message += ex.InnerException.Message;

                AppSession.SocialSignInIssueMessage = Message;
                AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, String.Format("SSI with {0} provider was failed: {1}", Provider, Message), AuditEvent.GetSessionDetails());
                return new RedirectResult("~/SignIn");
            }
        }

        public ActionResult AuthTwitter()
        {
            // http://stackoverflow.com/questions/3599621/is-there-a-way-to-get-an-users-email-id-after-verifying-her-twitter-identity-us            
            TwitterConsumer.TwitterConsumerKey = AppSession.Parameters.SocialTwitterConsumerKey.Value;
            TwitterConsumer.TwitterConsumerSecret = AppSession.Parameters.SocialTwitterConsumerSecret.Value;
            
            String RedirectTo = "";            
            
            if (TwitterConsumer.IsTwitterConsumerConfigured)
            {
                string screenName;
                int userId;
                string AccessToken;
                if (TwitterConsumer.TryFinishSignInWithTwitter(out screenName, out userId, out AccessToken))
                {
                    // In a real app, the Twitter username would likely be used
                    // to log the user into the application.
                    String memberName = String.Format("{0}@twitter.com",screenName);
                    Member member = Members.GetByEmail(memberName);
                    
                    if (member.MemberID <= 0)
                    {
                        member.Name = screenName;
                        member.Email = memberName;
                        member.Password = StringTool.RandomString(24);
                        member.TimeZoneID = "";
                        member.Save();

                        MemberSocialNetwork memberNetwork = new MemberSocialNetwork();
                        memberNetwork.MemberID = member.MemberID;
                        memberNetwork.SocialNetworkID = 2;
                        memberNetwork.SocialNetworkUserID = userId.ToString();
                        memberNetwork.SocialNetworkUserEmail = "";
                        memberNetwork.SocialNetworkUserName = screenName;
                        memberNetwork.AccessToken = AccessToken;
                        memberNetwork.Save();

                        if (member.MemberID > 0)
                        {
                            string[] RoleNames = AppParams.SocialTwitterRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                            foreach (String RoleName in RoleNames)
                            {
                                Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                                if (role.RoleID > 0)
                                {
                                    MemberRole memberrole = new MemberRole();
                                    memberrole.MemberID = member.MemberID;
                                    memberrole.RoleID = role.RoleID;
                                    memberrole.Save();
                                }
                            }

                        }
                    }
                    else
                    {
                        member.UpdateLoginTime();

                        MemberSocialNetwork memberNetwork = MemberSocialNetworks.GetByMemberID(member.MemberID, 2, userId.ToString());

                        memberNetwork.SocialNetworkID = 2;
                        memberNetwork.SocialNetworkUserID = userId.ToString();
                        memberNetwork.SocialNetworkUserEmail = "";
                        memberNetwork.SocialNetworkUserName = screenName;
                        memberNetwork.AccessToken = AccessToken;

                        if (memberNetwork.MemberID <= 0)
                        {
                            memberNetwork.MemberID = member.MemberID;
                            memberNetwork.Save();
                        }
                        else
                            memberNetwork.UpdateAccessToken();
                    }

                    Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                    if (_domain.DomainID > 0)
                    {
                        MemberDomain _memberDomain = new MemberDomain();
                        _memberDomain.DomainID = _domain.DomainID;
                        _memberDomain.MemberID = member.MemberID;
                        _memberDomain.Save();
                    }

                    RedirectTo = SignInMember(memberName, member, false, "", "SSI via Twitter.");
                }
                else
                {
                    return TwitterConsumer.StartSignInWithTwitter(true).AsActionResultMvc5();
                }
            }

            return new RedirectResult(RedirectTo);
        }

        private ActionResult AuthFacebook()
        {
            // http://developers.facebook.com/docs/reference/api/user/
            // https://developers.facebook.com/docs/howtos/login/server-side-re-auth/
            String RedirectTo = "";

            IAuthorizationState authorization = AppSession.AppFacebookClient.ProcessUserAuthorization(Request);

            if (authorization == null)
            {
                // https://developers.facebook.com/docs/reference/login/#permissions
                var scope = new List<string>();
                scope.Add("email"); 
                scope.Add("user_likes"); 
                scope.Add("read_stream");
                scope.Add("user_online_presence");
                scope.Add("read_stream");

                // Kick off authorization request
                return AppSession.AppFacebookClient.PrepareRequestUserAuthorization().AsActionResultMvc5();
            }
            else
            {
                var request = WebRequest.Create("https://graph.facebook.com/me?access_token=" + Uri.EscapeDataString(authorization.AccessToken) + "&fields=id,name,first_name,last_name,username,email,gender,locale,middle_name,timezone");
                using (var response = request.GetResponse())
                {
                    using (var responseStream = response.GetResponseStream())
                    {

                        var graph = FacebookGraph.Deserialize(responseStream);
                        var name = HttpUtility.HtmlEncode(graph.Name);
                        var firstName = HttpUtility.HtmlEncode(graph.FirstName);
                        var lastName = HttpUtility.HtmlEncode(graph.LastName);

                        // to log the user into the application.
                        String memberName = String.Format("{0}.{1}@facebook.com", firstName, lastName);
                        Member member = Members.GetByEmail(memberName);
                        if (member.MemberID <= 0)
                        {
                            member.Name = String.Format("{0} {1}", firstName, lastName);
                            member.Email = memberName;
                            member.Password = StringTool.RandomString(24);
                            member.TimeZoneID = "";
                            member.Save();

                            MemberSocialNetwork memberNetwork = new MemberSocialNetwork();
                            memberNetwork.MemberID = member.MemberID;
                            memberNetwork.SocialNetworkID = 1;
                            memberNetwork.SocialNetworkUserID = graph.Id.ToString();
                            //memberNetwork.SocialNetworkUserEmail = graph.Email;
                            memberNetwork.SocialNetworkUserName = member.Name;
                            memberNetwork.AccessToken = authorization.AccessToken;
                            memberNetwork.Save();

                            if (member.MemberID > 0)
                            {
                                string[] RoleNames = AppParams.SocialFacebookRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                                foreach (String RoleName in RoleNames)
                                {
                                    Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                                    if (role.RoleID > 0)
                                    {
                                        MemberRole memberrole = new MemberRole();
                                        memberrole.MemberID = member.MemberID;
                                        memberrole.RoleID = role.RoleID;
                                        memberrole.Save();
                                    }
                                }

                            }
                        }
                        else
                        {
                            member.UpdateLoginTime();

                            MemberSocialNetwork memberNetwork = MemberSocialNetworks.GetByMemberID(member.MemberID, 1, graph.Id.ToString());

                            memberNetwork.SocialNetworkID = 1;
                            memberNetwork.SocialNetworkUserID = graph.Id.ToString();
                            //memberNetwork.SocialNetworkUserEmail = graph.Email;
                            memberNetwork.SocialNetworkUserName = member.Name;
                            memberNetwork.AccessToken = authorization.AccessToken;

                            if (memberNetwork.MemberID <= 0)
                            {
                                memberNetwork.MemberID = member.MemberID;
                                memberNetwork.Save();
                            }
                            else
                                memberNetwork.UpdateAccessToken();
                        }

                        Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                        if (_domain.DomainID > 0)
                        {
                            MemberDomain _memberDomain = new MemberDomain();
                            _memberDomain.DomainID = _domain.DomainID;
                            _memberDomain.MemberID = member.MemberID;
                            _memberDomain.Save();
                        }

                        RedirectTo = SignInMember(memberName, member, false, "", "SSI via Facebook.");
                        return new RedirectResult(RedirectTo);
                    }
                }
            }

            // return new EmptyResult();
        }


        private ActionResult OAuth2Callback()
        {
            /*
            var result = OAuthWebSecurity.VerifyAuthentication();
            if (result.IsSuccessful)
            {
                // name of the provider we just used
                var provider = result.Provider;
                // provider's unique ID for the user
                var uniqueUserID = result.ProviderUserId;
                // since we might use multiple identity providers, then 
                // our app uniquely identifies the user by combination of 
                // provider name and provider user id
                var uniqueID = provider + "/" + uniqueUserID;

                // we then log the user into our application
                // we could have done a database lookup for a 
                // more user-friendly username for our app
                FormsAuthentication.SetAuthCookie(uniqueID, false);

                // dictionary of values from identity provider
                var userDataFromProvider = result.ExtraData;
                var email = userDataFromProvider["email"];
                var gender = userDataFromProvider["gender"];

                //return View("LoggedIn", result);
                return new EmptyResult(); 
            }
            //return View("Error", result.Error);
             */
            return new EmptyResult(); 
        }

        
        private ActionResult AuthGoogleOAuth2()
        {
            //http://brockallen.com/2012/09/04/using-oauthwebsecurity-without-simplemembership/
            //http://stackoverflow.com/questions/21420019/dotnetopenauth-4-3-and-google-openid-2-0-oauth-1-0-deprecated
            // http://www.dotnetcurry.com/showarticle.aspx?ID=907
            /*
            var client = new GoogleOAuth2Client("146915087554-6vbmbjqu3rrft5cp5jehaji2peiq1rjn.apps.googleusercontent.com", "QYKtRN659OdqUYRhb1_A6dt0");
            var extraData = new Dictionary<string, object>();
            
            OAuthWebSecurity.RegisterClient(client, "Google", extraData);
            OAuthWebSecurity.RequestAuthentication("Google", Url.Action("OAuth2Callback"));
            */
            return new EmptyResult(); 
        }

        private ActionResult AuthGoogle()
        {
            String RedirectTo = "";
            OpenIdRelyingParty OpenID = new OpenIdRelyingParty();
            var response = OpenID.GetResponse();

            if (response == null)
            {
                //Let us submit the request to OpenID provider
                string OpenidIdentifier = "https://www.google.com/accounts/o8/id";

                Identifier ID;
                if (Identifier.TryParse(OpenidIdentifier, out ID))
                {
                    var request = OpenID.CreateRequest(OpenidIdentifier);
                    var fetch = new FetchRequest();

                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Contact.Email, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.First, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.Middle, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.Last, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.FullName, true));
                    request.AddExtension(fetch);

                    return request.RedirectingResponse.AsActionResultMvc5();  
                }

                throw new Exception(GetLabel("Account.SignIn.InvalidID"));
            }
            else
            {
                //Let us check the response
                switch (response.Status)
                {
                    case AuthenticationStatus.Authenticated:
                    {
                        String MyOpenID = response.ClaimedIdentifier;
                        //check if user exist

                        var fetch = response.GetExtension<FetchResponse>();
                        string email = String.Empty;
                        string firstName = String.Empty;
                        string lastName  = String.Empty;
                        
                        if (fetch != null)
                        {
                            email = fetch.GetAttributeValue(WellKnownAttributes.Contact.Email);
                            firstName = fetch.GetAttributeValue(WellKnownAttributes.Name.First);
                            lastName = fetch.GetAttributeValue(WellKnownAttributes.Name.Last);
                        }

                        // to log the user into the application.
                        String memberName = String.Format(email);
                        Member member = Members.GetByEmail(memberName);
                        if (member.MemberID <= 0)
                        {
                            member.Name = String.Format("{0} {1}", firstName, lastName);
                            member.Email = memberName;
                            member.Password = StringTool.RandomString(24);
                            member.TimeZoneID = "";
                            member.Save();


                            if (member.MemberID > 0)
                            {
                                string[] RoleNames = AppParams.SocialGoogleRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                                foreach (String RoleName in RoleNames)
                                {
                                    Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                                    if (role.RoleID > 0)
                                    {
                                        MemberRole memberrole = new MemberRole();
                                        memberrole.MemberID = member.MemberID;
                                        memberrole.RoleID = role.RoleID;
                                        memberrole.Save();
                                    }
                                }
                            }
                        }
                        else
                        {
                            member.UpdateLoginTime();
                        }

                        Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                        if (_domain.DomainID > 0)
                        {
                            MemberDomain _memberDomain = new MemberDomain();
                            _memberDomain.DomainID = _domain.DomainID;
                            _memberDomain.MemberID = member.MemberID;
                            _memberDomain.Save();
                        }

                        RedirectTo = SignInMember(memberName, member, false, "", "SSI via Google.");
                        return new RedirectResult(RedirectTo);
                    }
                    case AuthenticationStatus.Canceled:
                    {
                        throw new Exception(GetLabel("Account.SignIn.CanceledProvider"));
                    }
                    case AuthenticationStatus.Failed:
                    {
                        throw new Exception(response.Exception.Message);
                    }
                }
            }

            return new EmptyResult();
        }

        private ActionResult AuthYahoo()
        {
            String RedirectTo = "";
            OpenIdRelyingParty OpenID = new OpenIdRelyingParty();
            var response = OpenID.GetResponse();

            if (response == null)
            {
                //Let us submit the request to OpenID provider
                string OpenidIdentifier = "http://me.yahoo.com/";

                Identifier ID;
                if (Identifier.TryParse(OpenidIdentifier, out ID))
                {
                    var request = OpenID.CreateRequest(OpenidIdentifier);
                    var fetch = new FetchRequest();

                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Contact.Email, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.First, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.Middle, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.Last, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.FullName, true));
                    request.AddExtension(fetch);

                    return request.RedirectingResponse.AsActionResultMvc5(); 
                }

                throw new Exception(GetLabel("Account.SignIn.InvalidID"));
            }
            else
            {
                //Let us check the response
                switch (response.Status)
                {
                    case AuthenticationStatus.Authenticated:
                        {
                            String MyOpenID = response.ClaimedIdentifier;
                            //check if user exist

                            var fetch = response.GetExtension<FetchResponse>();
                            string email = String.Empty;
                            string firstName = String.Empty;
                            string lastName = String.Empty;
                            string fullName = String.Empty;

                            if (fetch != null)
                            {
                                email = fetch.GetAttributeValue(WellKnownAttributes.Contact.Email);
                                firstName = fetch.GetAttributeValue(WellKnownAttributes.Name.First);
                                lastName = fetch.GetAttributeValue(WellKnownAttributes.Name.Last);
                                fullName = fetch.GetAttributeValue(WellKnownAttributes.Name.FullName);
                            }

                            // to log the user into the application.
                            String memberName = String.Format(email);
                            Member member = Members.GetByEmail(memberName);
                            if (member.MemberID <= 0)
                            {
                                string Name = String.Format("{0} {1}", firstName, lastName);
                                member.Name = Name != null && Name.Trim().Length > 0 ? Name : fullName;
                                member.Email = memberName;
                                member.Password = StringTool.RandomString(24);
                                member.TimeZoneID = "";
                                member.Save();

                                if (member.MemberID > 0)
                                {
                                    string[] RoleNames = AppParams.SocialYahooRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                                    foreach (String RoleName in RoleNames)
                                    {
                                        Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                                        if (role.RoleID > 0)
                                        {
                                            MemberRole memberrole = new MemberRole();
                                            memberrole.MemberID = member.MemberID;
                                            memberrole.RoleID = role.RoleID;
                                            memberrole.Save();
                                        }
                                    }
                                }
                            }
                            else
                            {
                                member.UpdateLoginTime();
                            }

                            Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                            if (_domain.DomainID > 0)
                            {
                                MemberDomain _memberDomain = new MemberDomain();
                                _memberDomain.DomainID = _domain.DomainID;
                                _memberDomain.MemberID = member.MemberID;
                                _memberDomain.Save();
                            }

                            RedirectTo = SignInMember(memberName, member, false, "", "SSI via Yahoo.");
                            return new RedirectResult(RedirectTo);
                        }
                    case AuthenticationStatus.Canceled:
                        {
                            throw new Exception(GetLabel("Account.SignIn.CanceledProvider"));
                        }
                    case AuthenticationStatus.Failed:
                        {
                            throw new Exception(response.Exception.Message);
                        }
                }


            }

            return new EmptyResult(); 

        }

        private ActionResult AuthOpenIDService(String UserName, String ProviderUrl, String FrendlyName, String NameSuffix, String Site, String Roles)
        {
            String RedirectTo = "";
            OpenIdRelyingParty OpenID = new OpenIdRelyingParty();
            var response = OpenID.GetResponse();

            if (response == null)
            {
                //Let us submit the request to OpenID provider
                string OpenidIdentifier = String.Format(ProviderUrl, UserName);

                Identifier ID;
                if (Identifier.TryParse(OpenidIdentifier, out ID))
                {
                    var request = OpenID.CreateRequest(OpenidIdentifier);
                    var fetch = new FetchRequest();

                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Contact.Email, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.First, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.Middle, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.Last, true));
                    fetch.Attributes.Add(new AttributeRequest(WellKnownAttributes.Name.FullName, true));
                    request.AddExtension(fetch);

                    return request.RedirectingResponse.AsActionResultMvc5();              
                }

                throw new Exception(GetLabel("Account.SignIn.InvalidID"));
            }
            else
            {
                //Let us check the response
                switch (response.Status)
                {
                    case AuthenticationStatus.Authenticated:
                        {
                            String MyOpenID = response.ClaimedIdentifier;
                            //check if user exist

                            var fetch = response.GetExtension<FetchResponse>();
                            string email = String.Empty;
                            string firstName = String.Empty;
                            string lastName = String.Empty;
                            string fullName = String.Empty;

                            if (fetch != null)
                            {
                                email = fetch.GetAttributeValue(WellKnownAttributes.Contact.Email);
                                firstName = fetch.GetAttributeValue(WellKnownAttributes.Name.First);
                                lastName = fetch.GetAttributeValue(WellKnownAttributes.Name.Last);
                                fullName = fetch.GetAttributeValue(WellKnownAttributes.Name.FullName);
                            }

                            if (email == null || email.Trim().Length == 0)
                                email = String.Format("{0}@{1}",UserName,Site);

                            if (firstName == null || firstName.Trim().Length == 0)
                                firstName = String.Format("{0}.{1}", UserName,NameSuffix);

                            // to log the user into the application.
                            String memberName = String.Format(email);
                            Member member = Members.GetByEmail(memberName);
                            if (member.MemberID <= 0)
                            {
                                string Name = String.Format("{0} {1}", firstName, lastName);
                                member.Name = Name != null && Name.Trim().Length > 0 ? Name : fullName;
                                member.Email = memberName;
                                member.Password = StringTool.RandomString(24);
                                member.TimeZoneID = "";
                                member.Save();

                                if (member.MemberID > 0 && Roles != null)
                                {
                                    string[] RoleNames = Roles.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                                    foreach (String RoleName in RoleNames)
                                    {
                                        Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName.Trim());
                                        if (role.RoleID > 0)
                                        {
                                            MemberRole memberrole = new MemberRole();
                                            memberrole.MemberID = member.MemberID;
                                            memberrole.RoleID = role.RoleID;
                                            memberrole.Save();
                                        }
                                    }
                                }
                            }
                            else
                            {
                                member.UpdateLoginTime();
                            }

                            Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                            if (_domain.DomainID > 0)
                            {
                                MemberDomain _memberDomain = new MemberDomain();
                                _memberDomain.DomainID = _domain.DomainID;
                                _memberDomain.MemberID = member.MemberID;
                                _memberDomain.Save();
                            }


                            RedirectTo = SignInMember(memberName, member, false, "", "SSI via " + FrendlyName);
                            return new RedirectResult(RedirectTo);
                        }
                    case AuthenticationStatus.Canceled:
                        {
                            throw new Exception(GetLabel("Account.SignIn.CanceledProvider"));
                        }
                    case AuthenticationStatus.Failed:
                        {
                            throw new Exception(response.Exception.Message);
                        }
                }


            }

            return new EmptyResult();

        }

    }
}
