using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

using Web.Admin.Models;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Logic.Utilities;
using System.Security.Principal;
using Web.Admin.Logic;
using System.Web.Script.Serialization;
using System.IO.Compression;


namespace Web.Admin.Controllers
{
    public class BaseController : Controller
    {
        public bool Authenticate(ref String Email, String Password)
        {
            bool LDAPAuthSuccess = false;
            bool IsClassicAuth = AppSession.Parameters.LDAPUseOnly.Value == "false"; 
            bool IsLDAPAuth = AppSession.Parameters.LDAPEnabled.Value == "true";

            //LDAP Auth
            if (AppSession.Parameters.LDAPEnabled.Value == "true" && Email.IndexOf("@"+AppSession.Parameters.LDAPDomain.Value) > 0)
            {
                
                LDAPTools ldapTools = new LDAPTools();
                ldapTools.UserName = Email;
                ldapTools.Password = Password;
                ldapTools.DirectoryPath = AppSession.Parameters.LDAPPath.Value;

                if (ldapTools.Authenticate())
                {
                    LDAPAuthSuccess = true;
                    string memberName = ldapTools.MemberInfo.DisplayName;
                    string memberAllGroups = ldapTools.GetGroups();

                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                    // The member email will be changed because the first part of e-mail can be different with user network id.
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Email = ldapTools.MemberInfo.Email;                    
                    Member memberNew = Members.GetByEmail(Email);
                    
                    if (memberNew.MemberID <= 0)
                    {
                        memberNew.Name = memberName;
                        memberNew.Email = Email;
                        memberNew.Password = StringTool.RandomString(80);
                        memberNew.IsBuiltIn = false;
                        memberNew.Created = DateTime.UtcNow;
                        memberNew.Save();

                        string Message = String.Format("LDAP member added: {0} {1}", memberName, Email);
                        AuditEvent.AppEventInfo(AppSession.Parameters.GeneralAdminEmail.Value, Message , null, true);

                        // Add signin/sign up domain.
                        Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                        if (_domain.DomainID > 0)
                        {
                            MemberDomain _memberDomain = new MemberDomain();
                            _memberDomain.DomainID = _domain.DomainID;
                            _memberDomain.MemberID = memberNew.MemberID;
                            _memberDomain.Save();
                        }

                        // Create LDAP settings roles
                        if (AppSession.Parameters.LDAPAddToRoles.Value != null && AppSession.Parameters.LDAPAddToRoles.Value.Length > 0)
                        {
                            string[] memberRoles = AppSession.Parameters.LDAPAddToRoles.Value.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                            foreach (string memberRole in memberRoles)
                            {
                                Web.Admin.Logic.Objects.Role _role = Web.Admin.Logic.Collections.Roles.GetBy(memberRole);
                                if (_role.RoleID > 0)
                                {
                                    MemberRole _memberRole = new MemberRole();
                                    _memberRole.MemberID = memberNew.MemberID;
                                    _memberRole.RoleID = _role.RoleID;
                                    _memberRole.Save();
                                }
                            }
                        }
                    }

                    // Create LDAP specific roles
                    if (memberAllGroups != null && memberAllGroups.Length > 0 && AppSession.Parameters.LDAPAddRoleGroup.Value == "true")
                    {
                        string[] memberGroups = memberAllGroups.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string memberGroup in memberGroups)
                        {
                            Web.Admin.Logic.Objects.Role _role = Web.Admin.Logic.Collections.Roles.GetBy(memberGroup);
                            if (_role.RoleID <= 0)
                            {
                                _role.Name = memberGroup;
                                _role.Settings = "LDAP role reflection. Keep key word: [LDAP-Auto-Role] to be synchronized.";
                                _role.BackColor = "6bbb54";
                                _role.ForeColor = "ffffff";
                                _role.Save();

                                string  Message = String.Format("LDAP role added: {0}", _role.Name);
                                AuditEvent.AppEventInfo(AppSession.Parameters.GeneralAdminEmail.Value, Message, null, true);
                            };

                            if (_role.RoleID > 0)
                            {
                                MemberRole _memberRole = new MemberRole();
                                _memberRole.MemberID = memberNew.MemberID;
                                _memberRole.RoleID = _role.RoleID;
                                _memberRole.Save();
                            }
                        }
                    }

                    // Synchronize members roles with LDAP [LDAP-Auto-Role] key words.                        
                    List<Role> _roles = Web.Admin.Logic.Collections.Roles.GetByMemberKeyWordInDescription(memberNew.MemberID, "[LDAP-Auto-Role]");
                    string[] _groups = memberAllGroups.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (Web.Admin.Logic.Objects.Role _role in _roles)
                    {
                        if (_groups != null && _groups.Length > 0)
                        {
                            if (_groups.Where(t => t.Trim().ToLower() == _role.Name.Trim().ToLower()).FirstOrDefault() == default(String))
                            {
                                Web.Admin.Logic.Objects.Role removeRoleFromUser = Web.Admin.Logic.Collections.Roles.GetBy(_role.Name);
                                MemberRole _memberRole = new MemberRole();
                                _memberRole.MemberID = memberNew.MemberID;
                                _memberRole.RoleID = removeRoleFromUser.RoleID;
                                _memberRole.Delete();
                            }
                        }
                        else
                        {
                            MemberRole _memberRole = new MemberRole();
                            _memberRole.MemberID = memberNew.MemberID;
                            _memberRole.RoleID = _role.RoleID;
                            _memberRole.Delete();

                        }
                    }
                }
            }


            //Classic Auth
            Member member = Members.GetByEmail(Email);
            if (member.MemberID > 0)
            {
                if ( (IsLDAPAuth && LDAPAuthSuccess) ||
                     (IsClassicAuth && Member.ComputePasswordHash(Password) == member.Password)
                   )                     
                {
                    MemberAttempt Attempt = MemberAttempts.GetTodayLoginPasswordFail(member.MemberID);
                    if (Attempt.AttemptID > 0)
                    {
                        Attempt.IsAttemptValid = 0;
                        Attempt.Save();
                    }

                    // Add signin/sign up domain.
                    Domain _domain = Domains.GetByName(AppSession.SignUpDomain);
                    if (_domain.DomainID > 0)
                    {
                        MemberDomain _memberDomain = new MemberDomain();
                        _memberDomain.DomainID = _domain.DomainID;
                        _memberDomain.MemberID = member.MemberID;
                        _memberDomain.Save();
                    }

                    member.UpdateLoginTime();
 
                    return true;
                }
                else
                {
                    MemberAttempt Attempt = MemberAttempts.GetTodayLoginPasswordFail(member.MemberID);

                    if (Attempt.MemberID <= 0)
                    {
                        Attempt.MemberID = member.MemberID;
                        Attempt.AttemptType = MemberAttemptTypes.LoginPasswordFailed;
                        Attempt.IsAttemptValid = 1;
                    }

                    if (Attempt.Attempts > 0)
                        Attempt.Attempts++;
                    else
                        Attempt.Attempts = 1;

                    Attempt.Save();

                    if (AppSession.Parameters.RulesPasswordFailedRoles.Value != null && AppSession.Parameters.RulesPasswordFailedRoles.Value.Length > 0 && !AppSession.IsMemberInAdminRole)
                    {
                        Parameter Param = AppSession.Parameters.RulesPasswordFailedAttempts;
                        
                        long value = -1;
                        bool result = long.TryParse(Param.Value, out value);

                        if (result && value > 0 && Attempt.Attempts >= value)
                        {
                            string[] RoleNames = AppSession.Parameters.RulesPasswordFailedRoles.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                            foreach (String RoleName in RoleNames)
                            {
                                Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleName);
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

                    return false;
                }
            }
            else
                return false;
        }

        public new MemberProfile Profile
        {
            get
            {
                return MemberProfile.CurrentProfile;
            }
        }

        public ApplicationParameters _AppParams;
        public ApplicationParameters AppParams { get { if (_AppParams == null) { _AppParams = new ApplicationParameters(); }; return _AppParams; } }

        public string GetLabel(String Name)
        {
            Dictionaries Dictionaries = (Dictionaries)HttpContext.Application["Dictionaries"];
            return Dictionaries.GetLabelByLanguage(Name, "eng");
        }

        public static string ToJson(object input)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(input);
        }

    }

    public static class Extensions
    {
        /// <summary>
        /// Takes a relative or absolute url and returns the fully-qualified url path.
        /// </summary>
        /// <param name="text">The url to make fully-qualified. Ex: Home/About</param>
        /// <returns>The absolute url plus protocol, server, & port. Ex: http://localhost:1234/Home/About</returns>
        public static string FullyQualified(this UrlHelper url, string text)
        {

            //### the VirtualPathUtility doesn"t handle querystrings, so we break the original url up
            var oldUrl = text;
            var oldUrlArray = (oldUrl.Contains("?") ? oldUrl.Split('?') : new[] { oldUrl, "" });

            //### we"ll use the Request.Url object to recreate the current server request"s base url
            //### requestUri.AbsoluteUri = "http://domain.com:1234/Home/Index?page=123"
            //### requestUri.LocalPath = "/Home/Index"
            //### requestUri.Query = "?page=123"
            //### subtract LocalPath and Query from AbsoluteUri and you get "http://domain.com:1234", which is urlBase
            var requestUri = GetRequestUri();
            var localPathAndQuery = requestUri.LocalPath + requestUri.Query;
            var urlBase = requestUri.AbsoluteUri.Substring(0, requestUri.AbsoluteUri.Length - localPathAndQuery.Length);

            //### convert the request url into an absolute path, then reappend the querystring, if one was specified
            var newUrl = VirtualPathUtility.ToAbsolute(oldUrlArray[0]);
            if (!string.IsNullOrEmpty(oldUrlArray[1]))
                newUrl += "?" + oldUrlArray[1];

            //### combine the old url base (protocol + server + port) with the new local path
            return urlBase + newUrl;
        }

        static Uri GetRequestUri()
        {
            return HttpContext.Current.Request.Url;
        }

        static Dictionary<string, string> codes = new Dictionary<string, string>(){ 
			{@"\*","<b>$2</b>"}, 
			{"_","<i>$2</i>"}, 
			{"-","<s>$2</s>"} 
		};
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class AuditEventExecutionAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (AppSession.Parameters.GeneralAuditEnabled.Value == "False")
            {
                filterContext.Result = new EmptyResult();
            }
            
            base.OnActionExecuting(filterContext);
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class CustomAuthorizeNonBlockedAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext == null)
            {
                throw new ArgumentNullException("httpContext");
            }

            IPrincipal user = httpContext.User;
            if (!user.Identity.IsAuthenticated)
            {
                return false;
            }

            List<Role> Roles = Web.Admin.Logic.Collections.Roles.GetByMember(MemberProfile.CurrentProfile.Member.MemberID);

            if (Roles.Where(t => t.Name.ToLower() == "blocked").FirstOrDefault() != default(Role) && !AppSession.IsMemberInAdminRole)
                return false;
            else
                return true;
        }

        protected override void HandleUnauthorizedRequest(System.Web.Mvc.AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                string[] acceptedTypes = filterContext.HttpContext.Request.AcceptTypes;
                foreach (string type in acceptedTypes)
                {
                    if (type.Contains("html"))
                    {
                        if (filterContext.HttpContext.Request.IsAjaxRequest())
                            filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedAjax.cshtml" };
                        else
                            filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedHtml.cshtml" };
                        break;
                    }
                    else if (type.Contains("javascript"))
                    {
                        filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedJavaScript.cshtml" };
                        break;
                    }
                    else if (type.Contains("xml"))
                    {
                        //this will redirect to login page with forms auth you could instead serialize a custom xml payload and return here.
                        filterContext.Result = new HttpUnauthorizedResult();
                    }
                }
            }
            else
            {
                base.HandleUnauthorizedRequest(filterContext);
            }
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method,Inherited = true, AllowMultiple = true)]
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext == null)
            {
                throw new ArgumentNullException("httpContext");
            }

            IPrincipal user = httpContext.User;
            if (!user.Identity.IsAuthenticated)
            {                
                return false;
            }

            List<Role> Roles = Web.Admin.Logic.Collections.Roles.GetByMember(MemberProfile.CurrentProfile.Member.MemberID);
            string[] _roles = this.Roles.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
            
            foreach(string role in _roles)
            {
                Role _Role = Roles.Where(t => t.Name.ToLower() == role.ToLower()).FirstOrDefault();

                if (_Role != default(Role))
                {
                    if (Roles.Where(t => t.Name.ToLower() == "blocked").FirstOrDefault() != default(Role) && !AppSession.IsMemberInAdminRole)
                        return false;
                    else
                        return true;
                }
            }
            
            return false;
        }

        protected override void HandleUnauthorizedRequest(System.Web.Mvc.AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                string[] acceptedTypes = filterContext.HttpContext.Request.AcceptTypes;
                foreach (string type in acceptedTypes)
                {
                    if (type.Contains("html"))
                    {
                        if (filterContext.HttpContext.Request.IsAjaxRequest())
                            filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedAjax.cshtml" };
                        else
                            filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedHtml.cshtml" };
                        break;
                    }
                    else if (type.Contains("javascript"))
                    {
                        filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedJavaScript.cshtml" };
                        break;
                    }
                    else if (type.Contains("xml"))
                    {
                        //this will redirect to login page with forms auth you could instead serialize a custom xml payload and return here.
                        filterContext.Result = new HttpUnauthorizedResult(); 
                    }
                }
            }
            else
            {
                base.HandleUnauthorizedRequest(filterContext);
            }
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class CustomAPIAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (!(AppSession.Parameters.AppApiEnabled.Value == "true"))
            {
                return false;
            }

            if (httpContext == null)
            {
                throw new ArgumentNullException("httpContext");
            }

            String Email = httpContext.Request.Headers["X-API-MEMBER-EMAIL"];
            String Token = httpContext.Request.Headers["X-API-MEMBER-TOKEN"];

            if (Email == null && Token == null)
            {
                return false;
            }

            Member Member = Web.Admin.Logic.Collections.Members.GetByEmail(Email);
            if (Member.MemberID > 0)
            {
                List<Role> Roles = Web.Admin.Logic.Collections.Roles.GetByMember(Member.MemberID);
                string[] _roles = this.Roles.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string role in _roles)
                {
                    Role _Role = Roles.Where(t => t.Name.ToLower() == role.ToLower()).FirstOrDefault();

                    if (_Role != default(Role))
                    {
                        MemberToken MemberToken = MemberTokens.GetByMember(Member.MemberID);
                        if (MemberToken.Token == Token)
                        {
                            return true;
                        }                    
                    }
                }
            }

            return false;
        }

        protected override void HandleUnauthorizedRequest(System.Web.Mvc.AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Request.AcceptTypes != null)
            {
                string[] acceptedTypes = filterContext.HttpContext.Request.AcceptTypes;
                foreach (string type in acceptedTypes)
                {
                    if (type.Contains("html"))
                    {
                        if (filterContext.HttpContext.Request.IsAjaxRequest())
                            filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedAjax.cshtml" };
                        else
                            filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedHtml.cshtml" };
                        break;
                    }
                    else if (type.Contains("javascript"))
                    {
                        filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedJavaScript.cshtml" };
                        break;
                    }
                    else if (type.Contains("xml"))
                    {
                        base.HandleUnauthorizedRequest(filterContext);
                    }
                }
            }
            else
            {
                filterContext.Result = new ViewResult { ViewName = "~/Views/Account/AccessDeniedAjax.cshtml" };
            }
        }
    }

    public class ReturnUrlFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            String ReturnUrl = filterContext.HttpContext.Request.QueryString["ReturnUrl"];
            String NoAuthReturnUrl = filterContext.HttpContext.Request.QueryString["NoAuthReturnUrl"];
            
            //String LocalHost = string.Format("http://{0}:{1}", filterContext.HttpContext.Request.Url.Host, filterContext.HttpContext.Request.Url.Port);
           
            if (ReturnUrl != null && /* ReturnUrl.IndexOf(LocalHost) < 0 && */
               (ReturnUrl.ToLower().IndexOf("http://") >= 0 || ReturnUrl.ToLower().IndexOf("https://") >= 0))
            {
                AppSession.ReturnUrl = ReturnUrl;
            }

            if (NoAuthReturnUrl != null && /* ReturnUrl.IndexOf(LocalHost) < 0 && */
               (NoAuthReturnUrl.ToLower().IndexOf("http://") >= 0 || NoAuthReturnUrl.ToLower().IndexOf("https://") >= 0))
            {
                AppSession.NoAuthReturnUrl = NoAuthReturnUrl;
            }
            
            base.OnActionExecuting(filterContext);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            base.OnActionExecuted(filterContext);
        }
    }
    
    public class CacheFilterAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// Gets or sets the cache duration in seconds. The default is 10 seconds.
        /// </summary>
        /// <value>The cache duration in seconds.</value>
        public int Duration
        {
            get;
            set;
        }

        public CacheFilterAttribute()
        {
            Duration = 10;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Duration <= 0) return;

            HttpCachePolicyBase cache = filterContext.HttpContext.Response.Cache;
            TimeSpan cacheDuration = TimeSpan.FromSeconds(Duration);

            cache.SetCacheability(HttpCacheability.Public);
            cache.SetExpires(DateTime.Now.Add(cacheDuration));
            cache.SetMaxAge(cacheDuration);
            cache.AppendCacheExtension("must-revalidate, proxy-revalidate");
        }
    }

    public class CompressFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpRequestBase request = filterContext.HttpContext.Request;

            string acceptEncoding = request.Headers["Accept-Encoding"];

            if (string.IsNullOrEmpty(acceptEncoding)) return;

            acceptEncoding = acceptEncoding.ToUpperInvariant();

            HttpResponseBase response = filterContext.HttpContext.Response;

            if (acceptEncoding.Contains("GZIP"))
            {
                response.AppendHeader("Content-encoding", "gzip");
                response.Filter = new GZipStream(response.Filter, CompressionMode.Compress);
            }
            else if (acceptEncoding.Contains("DEFLATE"))
            {
                response.AppendHeader("Content-encoding", "deflate");
                response.Filter = new DeflateStream(response.Filter, CompressionMode.Compress);
            }
        }
    }

    public class NoCacheAttribute : ActionFilterAttribute
    {
        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            var cache = filterContext.HttpContext.Response.Cache;
            cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            cache.SetValidUntilExpires(false);
            cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            cache.SetCacheability(HttpCacheability.NoCache);
            cache.SetNoStore();
            base.OnResultExecuting(filterContext);
        }
    }
}

