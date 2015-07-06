using System;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Web;

using System.Runtime.Serialization.Json;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Server_.API.Objects;
using System.Web.Routing;
using System.Web.Security;


namespace Server_.API.Utilities
{
    /// <summary>
    /// Type of the child site redirection.
    /// </summary>
    public enum SingleSignOnRedirectTo
    { 
        /// <summary>
        /// A member is going to sing in.
        /// </summary>
        SignIn = 1,
        
        /// <summary>
        /// A member is going to sing up.
        /// </summary>
        SignUp = 2,

        /// <summary>
        /// A member is going to sing out.
        /// </summary>
        SignOut = 3,
        
        /// <summary>
        /// A member is going to change password.
        /// </summary>
        ForgotPassword = 4,
        
        /// <summary>
        /// A member is going to change profile
        /// </summary>
        Profile = 5,
        
        /// <summary>
        /// A member avatar url.
        /// </summary>
        Avatar = 6,

         /// <summary>
        /// A member is going to social sing in.
        /// </summary>
        SignInWith = 7
    }

    /// <summary>
    /// Helps to make request, serialize and deserialize received objects during API call.
    /// </summary>
    public class Tools
    {
        /// <summary>
        /// Keeps information about current connection.
        /// </summary>
        public static Connection Connection { get; set; }


        /// <summary>
        /// The simple pings methods.
        /// </summary>
        /// <returns>Response of string type.</returns>
        public static Response<String> Ping()
        {
            using (StreamReader sr = new StreamReader(StreamGet("ping", Connection)))
             {
                 DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(Response<String>));
                 return (Response<String>)ser.ReadObject(sr.BaseStream);
             }
        }

        /// <summary>
        /// Encrypt string by machine key.
        /// </summary>
        /// <param name="plaintextValue">The string for encryption.</param>
        /// <returns>Encrypted string.</returns>
        public static string Encrypt(string plaintextValue)
        {
            byte[] plaintextBytes = Encoding.UTF8.GetBytes(plaintextValue);
            return Convert.ToBase64String(MachineKey.Protect(plaintextBytes, "MachineKeyProtection.All"));
        }

        /// <summary>
        /// Decrypt string by machine key.
        /// </summary>
        /// <param name="encryptedValue">The string for decryption.</param>
        /// <returns>Decrypted string.</returns>
        public static string Decrypt(string encryptedValue)
        {
            try
            {
                byte[] decryptedBytes = MachineKey.Unprotect(Convert.FromBase64String(encryptedValue), "MachineKeyProtection.All");
                return Encoding.UTF8.GetString(decryptedBytes);
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Gets response stream associated with the specified API method name and connection.
        /// </summary>
        /// <param name="Method">Method name.</param>
        /// <param name="Connection">Connection infomation.</param>
        /// <returns>Response stream.</returns>
        public static Stream StreamGet(String Method, Connection Connection)
        {
            WebRequest request = WebRequest.Create(Connection.Location.URL + "/" + Method);
            request.Headers.Add("X-API-MEMBER-EMAIL", Connection.Credentials.Email);
            request.Headers.Add("X-API-MEMBER-TOKEN", Connection.Credentials.Token);
            request.ContentType = request.ContentType = "application/json";
            request.Method = "GET";

            WebResponse response = request.GetResponse();
            return response.GetResponseStream();
        }

        /// <summary>
        /// Gets request stream associated with the specified API method name, connection and parameters.
        /// </summary>
        /// <param name="Method"></param>
        /// <param name="Connection"></param>
        /// <param name="Params"></param>
        /// <returns>Request stream.</returns>
        public static Stream StreamPost(String Method, Connection Connection, Object Params)
        {
            WebRequest request = WebRequest.Create(Connection.Location.URL + "/" + Method);
            request.Headers.Add("X-API-MEMBER-EMAIL", Connection.Credentials.Email);
            request.Headers.Add("X-API-MEMBER-TOKEN", Connection.Credentials.Token);
            request.ContentType = request.ContentType = "application/json";
            request.Method = "POST";

            string postData = Tools.ToJson(Params);
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);

            request.ContentLength = byteArray.Length;
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();

            WebResponse response = request.GetResponse();
            return response.GetResponseStream();
        }

        /// <summary>
        /// Deserializes the JSON string to specified object type.
        /// </summary>
        /// <typeparam name="T">Expected object type.</typeparam>
        /// <param name="input">JSON string.</param>
        /// <returns>The object with specified type.</returns>
        public static T FromJson<T>(string input)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Deserialize<T>(input);
        }

        /// <summary>
        /// Serializes an object to JSON string.
        /// </summary>
        /// <param name="input">The object's instance.</param>
        /// <returns>Object JSON string representation.</returns>
        public static string ToJson(object input)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(input);
        }

        /// <summary>
        /// Checks if a member account is blocked.
        /// </summary>
        /// <returns>True if a member account is blocked.</returns>
        public static bool IsAccountBlocked()
        {
            return Member.IsInRoleInAPI("blocked");
        }

        /// <summary>
        /// Perform crossdomain single sing in.
        /// </summary>
        /// <param name="hc">HttpContext object.</param>
        /// <returns></returns>
        public static string DoCrossDomainSingleSingOn(HttpContext hc)
        {
            try
            {
                string Token = Decrypt(hc.Request.QueryString["p1"]);
                string Email = Decrypt(hc.Request.QueryString["p2"]);
                string BackUrl = hc.Request.QueryString["BackUrl"];

                // Receive sign in ticket view API call.
                SingInAuthTicket singInAuthTicket = SingInAuthTickets.GetSignInTicket(Email, Token);

                // Redirect to sign in page? because the session doesn't not exist.
                if (singInAuthTicket.EncrytedTicket == "")
                    return SingleSignOnRedirectUrl(SingleSignOnRedirectTo.SignIn, BackUrl);

                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(singInAuthTicket.EncrytedTicket);

                // Finalaze sing in via API call.
                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, singInAuthTicket.EncrytedTicket);
                authCookie.Expires = authTicket.Expiration;
                authCookie.HttpOnly = true;
                hc.Response.Cookies.Add(authCookie);

                return hc.Request.QueryString["BackUrl"];
            }
            catch(Exception ex)
            {
               string message = ex.Message;
               
                return "";  //return HttpUtility.UrlEncode(System.Web.VirtualPathUtility.ToAbsolute("/"));
            }
        }

        /// <summary>
        /// Perform crossdomain single sing out.
        /// </summary>
        /// <param name="hc">HttpContext object.</param>
        public static void DoCrossDomainSingleSingOut(HttpContext hc)
        {
            FormsAuthentication.SignOut();

            HttpCookie cookie = hc.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1);
                hc.Response.Cookies.Add(cookie);
            }

            // Invalidate the Cache on the Client Side
            hc.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            hc.Response.Cache.SetNoStore();
            hc.Response.Cache.SetExpires(DateTime.Now.AddDays(-30));
        }

        /// <summary>
        /// Checks if authr ticket valid.
        /// </summary>
        public static void IsAuthTicketValid()
        {
            HttpContext hc = HttpContext.Current;
            HttpCookie authCookie = hc.Request.Cookies[FormsAuthentication.FormsCookieName];
            
            try
            {
                if (hc.User.Identity.IsAuthenticated && authCookie != null && hc.Request.QueryString["signedout"] != "1")
                {
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    FormsAuthenticationTicket _authTicket = FormsAuthentication.Decrypt(authCookie.Value);
                    AuthMemberToken _ticketMemberSession = serializer.Deserialize<AuthMemberToken>(_authTicket.UserData);

                    ActionValidationResult _result = ActionValidationResults.IsAuthTicketValid(_ticketMemberSession.MemberEmail, _ticketMemberSession.Token);

                    if (!_result.IsValid)
                    {
                        hc.Response.Redirect(Tools.SingleSignOnRedirectUrl(SingleSignOnRedirectTo.SignOut, hc.Request.Url.PathAndQuery));
                    }
                    else if(_authTicket.Expiration < _result.Expiration)
                    { 
                        // Renew auth cookie with ticket.
                        // FormsAuthentication.SlidingExpiration

                    }
                }
                else if (hc.User.Identity.IsAuthenticated && hc.Request.QueryString["signedout"] == "1")
                {
                    DoCrossDomainSingleSingOut(hc);
                    hc.Response.Redirect(Tools.SingleSignOnRedirectUrl(SingleSignOnRedirectTo.SignOut, hc.Request.Url.PathAndQuery));
                }
            }
            catch {
                hc.Response.Redirect(Tools.SingleSignOnRedirectUrl(SingleSignOnRedirectTo.SignOut, hc.Request.Url.PathAndQuery));
            }
        }

        /// <summary>
        /// Gest rediration URL to sso application.
        /// </summary>
        /// <param name="RedirectTo">Child site RedirectTo URL.</param>
        /// <param name="returnUrl">Child site return URL.</param>
        /// <returns>Redirection URL.</returns>
        public static String SingleSignOnRedirectUrl(SingleSignOnRedirectTo RedirectTo, string returnUrl)
        {
           
            HttpContext hc = HttpContext.Current;
            var requestUrl = hc.Request.Url;
            string HostName = hc.Request.Headers.Get("Host").ToString();
            string DomainName = HostName.Split(new string[] {":"}, StringSplitOptions.RemoveEmptyEntries)[0];

           if(hc != null)
           {
                String ConfigUrl = "";

                // Supporting cross domain single sign on.
                if (hc.Request.QueryString["p1"] != null && (RedirectTo == SingleSignOnRedirectTo.SignIn || RedirectTo == SingleSignOnRedirectTo.SignInWith))
                {
                    return DoCrossDomainSingleSingOn(hc);
                }
                
               // Supporting cross domain single sign out.
                if (RedirectTo == SingleSignOnRedirectTo.SignOut && hc.Request.QueryString["signedout"] == "1")
                {
                    DoCrossDomainSingleSingOut(hc);
                }

                switch (RedirectTo)
                {
                    case SingleSignOnRedirectTo.SignIn: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlSignIn"];break;
                    case SingleSignOnRedirectTo.SignUp: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlSignUp"];break;
                    case SingleSignOnRedirectTo.SignOut: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlSignOut"];break;
                    case SingleSignOnRedirectTo.ForgotPassword: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlForgotPassword"];break;
                    case SingleSignOnRedirectTo.Profile: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlProfile"];break;
                    case SingleSignOnRedirectTo.Avatar: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoAvatar"];break;
                    case SingleSignOnRedirectTo.SignInWith: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlSignInWith"]; break;
                    default: ConfigUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlSignIn"]; break;
                }

                String VirtualPathPath = "";
                String FullReturnUrl = "";

                if (returnUrl == null || returnUrl.Trim().Length == 0)
                {
                   if (hc.Request.UrlReferrer != null && hc.Request.UrlReferrer.AbsoluteUri.Length > 0)
                   {
                       String _pathAndQuery = "";
                       String [] _values = hc.Request.UrlReferrer.Query.Split(new string[] {"&"}, StringSplitOptions.RemoveEmptyEntries);
                       
                       foreach (String _value in _values) {
                       
                           if (_value.IndexOf("signedout") > 0)
                                continue;
                           
                           _pathAndQuery = (_pathAndQuery.Length > 0 ? "&" : "?") + _value;
                       }

                       FullReturnUrl = FullReturnUrl = HttpUtility.UrlEncode(String.Format("{0}://{1}{2}", (hc.Request.IsSecureConnection ? "https" : "http"), HostName, _pathAndQuery));
                   }
                   else
                   {
                       VirtualPathPath = HttpRuntime.AppDomainAppVirtualPath;
                       if (VirtualPathPath.Length == 1 && VirtualPathPath.IndexOf("/") == 0)
                           VirtualPathPath = "";
                   }
                }

               // http://stackoverflow.com/questions/2513216/test-multiple-domains-using-asp-net-development-server
               if (returnUrl != null && returnUrl.Trim().Length > 0)
               {
                   FullReturnUrl = HttpUtility.UrlEncode(string.Format("{0}://{1}{2}{3}", (hc.Request.IsSecureConnection ? "https" : "http"), HostName, VirtualPathPath, HttpUtility.UrlDecode(returnUrl)));
               }


               String RedirectToUrl = "";

               if( hc.Request.Url.ToString().IndexOf("/SignIn",StringComparison.CurrentCultureIgnoreCase) > 0)
                   RedirectToUrl = String.Format("{0}?returnUrl={1}{2}{3}", ConfigUrl, FullReturnUrl, "&provider=" + hc.Request.QueryString["provider"], "&domain=" + DomainName);
               else
                   RedirectToUrl = String.Format("{0}?returnUrl={1}", ConfigUrl, FullReturnUrl);


               if (hc.Request.QueryString["NoAuthReturnUrl"] != null)
               {
                   RedirectToUrl += (RedirectToUrl.IndexOf("?") >= 0 ? "&" : "?") + "NoAuthReturnUrl=" + HttpUtility.UrlEncode(string.Format("{0}://{1}{2}", (hc.Request.IsSecureConnection ? "https" : "http"), HostName, "/"));
               }


               if ((RedirectTo == SingleSignOnRedirectTo.SignIn || RedirectTo == SingleSignOnRedirectTo.SignInWith) && FormsAuthentication.LoginUrl.ToString() != "")
               {
                  RedirectToUrl += (RedirectToUrl.IndexOf("?") >= 0 ? "&" : "?") + "SignInUrl=" + HttpUtility.UrlEncode(FormsAuthentication.LoginUrl.ToString());
               }

               return RedirectToUrl;
           };

           return "";
        }

        /// <summary>
        /// Return random string by specific length.
        /// </summary>
        /// <param name="length">String length</param>
        /// <returns>String with specified length.</returns>
        public static string RandomString(int length)
        {
            string allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

            if (length < 0) throw new ArgumentOutOfRangeException("length", "length cannot be less than zero.");
            if (string.IsNullOrEmpty(allowedChars)) throw new ArgumentException("allowedChars may not be empty.");

            const int byteSize = 0x100;
            var allowedCharSet = allowedChars.ToCharArray();
            if (byteSize < allowedCharSet.Length) throw new ArgumentException(String.Format("allowedChars may contain no more than {0} characters.", byteSize));

            // Guid.NewGuid and System.Random are not particularly random. By using a
            // cryptographically-secure random number generator, the caller is always
            // protected, regardless of use.
            using (var rng = new System.Security.Cryptography.RNGCryptoServiceProvider())
            {
                var result = new StringBuilder();
                var buf = new byte[128];
                while (result.Length < length)
                {
                    rng.GetBytes(buf);
                    for (var i = 0; i < buf.Length && result.Length < length; ++i)
                    {
                        // Divide the byte into allowedCharSet-sized groups. If the
                        // random value falls into the last group and the last group is
                        // too small to choose from the entire allowedCharSet, ignore
                        // the value in order to avoid biasing the result.
                        var outOfRangeStart = byteSize - (byteSize % allowedCharSet.Length);
                        if (outOfRangeStart <= buf[i]) continue;
                        result.Append(allowedCharSet[buf[i] % allowedCharSet.Length]);
                    }
                }
                return result.ToString();
            }
        }

        
        /// <summary>
        /// Returns current member full avatar URL.
        /// </summary>
        /// <returns></returns>
        public static string GetAvatarURL()
        {
            Member _Member = null;
            string _Avatar = "";

            HttpContext hc = HttpContext.Current;
            
            HttpCookie authCookie = hc.Request.Cookies[FormsAuthentication.FormsCookieName];

            if (hc.User.Identity.IsAuthenticated && authCookie != null && hc.Request.QueryString["signedout"] != "1")
            {
                if (hc.User.Identity.IsAuthenticated)
                {
                    _Member = Member.GetMember("");
                    
                    if (!String.IsNullOrEmpty(_Member.Avatar))
                        _Avatar = String.Format("{0}/{1}.jpg", System.Configuration.ConfigurationManager.AppSettings["ssoAvatar"], _Member.Avatar);
                    else
                        _Avatar = String.Format("{0}/no-photo.png", System.Configuration.ConfigurationManager.AppSettings["ssoAvatar"]);
                }
            }
            else
            {
                _Avatar = String.Format("{0}/no-photo.png", System.Configuration.ConfigurationManager.AppSettings["ssoAvatar"]);
            }
        
            return _Avatar;
        }

    }

    /// <summary>
    /// Provides filter condition properies
    /// </summary>
    public class CollectionFilter
    {
        /// <summary>
        /// Item number oer page.
        /// </summary>
        public int ItemsPerPage { get; set; }
        /// <summary>
        /// Current page number.
        /// </summary>
        public int CurrentPage { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public CollectionFilter()
        { 
        
        }
    }

    /// <summary>
    ///  Provides security token information.
    /// </summary>
    public class AuthMemberToken
    {
        /// <summary>
        /// Member unique item identifier.
        /// </summary>
        public long MemberID { get; set; }
        /// <summary>
        /// Member name.
        /// </summary>
        public string MemberName { get; set; }
        /// <summary>
        /// Member e-mail
        /// </summary>
        public string MemberEmail { get; set; }
        /// <summary>
        /// Session unique item identifier.
        /// </summary>
        public string Token { get; set; }
        /// <summary>
        /// Application domain.
        /// </summary>
        public string Domain { get; set; }
    }

    /// <summary>
    /// Validation result class.
    /// </summary>
    public class ActionValidationResult
    {
        /// <summary>
        /// Validation result flag.
        /// </summary>
        public bool IsValid { get; set; }

        /// <summary>
        /// Expiration Date.
        /// </summary>
        public DateTime Expiration { get; set; }
    }

}
