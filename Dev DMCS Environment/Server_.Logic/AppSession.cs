using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;

using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Utilities;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Sockets;
using System.Net.Mail;
using Web.Admin.Logic;
using System.IO;
using System.Drawing;
using System.Reflection;

using DotNetOpenAuth.OAuth;
using DotNetOpenAuth.ApplicationBlock;
using DotNetOpenAuth.ApplicationBlock.Facebook;
using DotNetOpenAuth.OAuth2;


namespace Web.Admin.Logic.Collections
{
    /// <summary>
    /// Contains utility methods an properties whcih are used by admin appliaction.
    /// </summary>
    public class AppSession
    {
        /// <summary>
        /// Encryption key value
        /// </summary>
        public static string EncryptionKey { get { return System.Configuration.ConfigurationManager.AppSettings["EncryptionKey"]; } }
        
        /// <summary>
        /// Minimum password length.
        /// </summary>
        public static int PasswordMaxLength = 4;

        /// <summary>
        /// Avatart image size, for instance 100x100.
        /// </summary>
        public static int AvatarImageSize { get { return 100; } }

        /// <summary>
        /// Application virtual directory path.
        /// </summary>
        public static String AppDomainAppVirtualPath {
            get {
                    String Path = HttpRuntime.AppDomainAppVirtualPath;
                    if (Path.Length == 1 && Path.IndexOf("/") == 0)
                        Path = "";

                    return Path;
                }
        }

        /// <summary>
        /// Avatar temporary uploaded image. It keeps resized image of original. The maximum size is 640x480.
        /// </summary>
        public static Bitmap AvatarTempImage
        {
            get { return (Bitmap)HttpContext.Current.Session["AvatarTempImage"]; }
            set { HttpContext.Current.Session["AvatarTempImage"] = value; }        
        }
        
        /// <summary>
        /// Application version.
        /// </summary>
        /// <returns></returns>
        public static string GetAppVersion()
        {
            Version version = Assembly.GetExecutingAssembly().GetName().Version;
            var buildDateTime = new DateTime(2000, 1, 1)
                .AddDays(version.Build) // days since 1 January 2000
                .AddSeconds(2 * version.Revision);
            return string.Format("{0}.{1} from {2:yyyy/MM/dd HH:mm:ss}", version.Major, version.Minor, buildDateTime);
        }

        /// <summary>
        /// Return URL which are kept in the session object.
        /// </summary>
        public static string ReturnUrl {
            get
            {
                string Url = "";
                if (HttpContext.Current != null && HttpContext.Current.Session != null)
                    Url = (String)HttpContext.Current.Session["ReturnUrl"];
                else
                    Url = "";
                
                return Url;
            }

            set {
                if (HttpContext.Current.Session != null)
                   HttpContext.Current.Session["ReturnUrl"] = value;
            }
        
        }

        /// <summary>
        /// NoAuth ReturnUrl URL which are kept in the session object.
        /// </summary>
        public static string NoAuthReturnUrl
        {
            get
            {
                string Url = "";
                if (HttpContext.Current != null && HttpContext.Current.Session != null)
                    Url = (String)HttpContext.Current.Session["NoAuthReturnUrl"];
                else
                    Url = "";

                return Url;
            }

            set
            {
                if (HttpContext.Current.Session != null)
                    HttpContext.Current.Session["NoAuthReturnUrl"] = value;
            }

        }

        /// <summary>
        /// Returns current state of Web UI application.
        /// </summary>
        public static bool DemoMode {
            get { 
                
                var demoMode =  System.Configuration.ConfigurationManager.AppSettings["DemoMode"];

                if (String.IsNullOrEmpty(demoMode))
                    return false;
                else if (demoMode.ToLower() == "true")
                    return true;
                else
                    return false;
            }
        }

        /// <summary>
        /// Gets true if logged member is in the role.
        /// </summary>
        /// <param name="RoleName">Role name.</param>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns></returns>
        private static bool IsMemberInRole(String RoleName, long MemberID)
        {
            List<Role> _Roles = Web.Admin.Logic.Collections.Roles.GetByMember(MemberID);
            Role _Role = _Roles.Where(t => t.Name.ToLower() == RoleName.ToLower()).FirstOrDefault();
            return _Role == default(Role) ? false : true;
        }

        /// <summary>
        /// Reloads all label files in which are in Labels folder.
        /// </summary>
        /// <returns></returns>
        public static bool ReloadLabels()
        {
            String DefaultLanguage = "eng";
            Dictionaries Dictionaries = new Logic.Dictionaries();

            if (Parameters.LanguagePublicDefault != null && Parameters.LanguagePublicDefault.Value != null && Parameters.LanguagePublicDefault.Value.Length > 0)
                DefaultLanguage = Parameters.LanguagePublicDefault.Value.ToLower();

            Dictionaries.DefaultLanguage = DefaultLanguage;
            Dictionaries.Initialize(HttpContext.Current.Server.MapPath("~/Labels"));
            String[] FileNames = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/Labels"), "labels-*.txt", SearchOption.AllDirectories);

            foreach (String FileName in FileNames)
            {
                String FileNameOnly = Path.GetFileNameWithoutExtension(FileName);
                String LanguageID = FileNameOnly.ToLower().Replace("labels-", "");

                Dictionaries.AddFromFlatFile(LanguageID, "utf-8", FileName);            
            }

            HttpContext.Current.Application.Lock();
            HttpContext.Current.Application["Dictionaries"] = Dictionaries;
            HttpContext.Current.Application.UnLock();

            return true;
        }

        /// <summary>
        /// Return language key bu language code. 
        /// </summary>
        /// <param name="Code">Language code.</param>
        /// <returns>Language key.</returns>
        public static string  FindLanguage(String Code)
        {
            Dictionaries Dictionaries = (Dictionaries)HttpContext.Current.Application["Dictionaries"];
            List<String> _languageKeys = Dictionaries.GetAllKeys();
            String _key = _languageKeys.Where(t => t.ToLower() == AppSession.Parameters.LanguagePublicDefault.Value.ToLower()).FirstOrDefault();

            return _key;
        }

        /// <summary>
        /// Gets list of loaded Language object instances.
        /// </summary>
        /// <returns>List of loaded Language object instances.</returns>
        public static List<Language> GetLanguages()
        {
            Dictionaries _Dictionaries = (Dictionaries)HttpContext.Current.Application["Dictionaries"];
            List<String> _languageKeys = _Dictionaries.GetAllKeys();

            List<Language> _Languages = new List<Language>();
            
            foreach (Language language in Languages.Get())
            {
                String _key = _languageKeys.Where(t => t.ToLower() == language.Code.ToLower()).FirstOrDefault();

                if (_key != null)
                    _Languages.Add(language);
            }

            return _Languages;
        }

        /// <summary>
        /// Facebook application client
        /// </summary>
        public static FacebookClient AppFacebookClient
        {
            get {

                var _client = (FacebookClient)HttpContext.Current.Application["AppFacebookClient"];

                if (_client == null || _client.ClientIdentifier != AppSession.Parameters.SocialFacebookAppID.Value)
                {
                    _client  = new FacebookClient
                    {
                        ClientIdentifier = AppSession.Parameters.SocialFacebookAppID.Value,
                        ClientCredentialApplicator = ClientCredentialApplicator.PostParameter(AppSession.Parameters.SocialFacebookAppSecret.Value),
                    };

                    HttpContext.Current.Application["AppFacebookClient"] = _client;
                    
                }

                return _client;
            }
        } 

        /// <summary>
        /// Member profile which is kept in the session object.
        /// </summary>
        public static MemberProfile Profile
        {
            get {

                if (HttpContext.Current != null && HttpContext.Current.Session != null)
                {
                    if (HttpContext.Current.User != null && HttpContext.Current.User.Identity != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    {
                        MemberProfile _Profile = (MemberProfile)HttpContext.Current.Session["MemberProfile"];
                        if (_Profile != null)
                            return _Profile;
                        else
                        {
                            Member Member = Members.GetByEmail(HttpContext.Current.User.Identity.Name);
                            MemberProfile _MemberProfile = new MemberProfile(Member);
                            HttpContext.Current.Session["MemberProfile"] = _MemberProfile;
                            return _MemberProfile;
                        }
                    }
                    else
                        return null;
                }
                else
                    return null;
            }
        }

        /// <summary>
        /// Gets true if logged member is in the Amin role.
        /// </summary>
        public static bool IsMemberInAdminRole
        {
            get
            {
                if (Profile != null)
                    return IsMemberInRole("admins", Profile.Member.MemberID);
                else
                    return false;
            }
        }

        /// <summary>
        /// Gets true if input email has correct format.
        /// </summary>
        /// <param name="inputEmail">Email address.</param>
        /// <returns>True if input email has correct format.</returns>
        public static bool IsEmail(string inputEmail)
        {
            Regex re = new Regex(@"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$",
                          RegexOptions.IgnoreCase);
            return re.IsMatch(inputEmail);
        }

        /// <summary>
        /// Gets true if input string has correct color format.
        /// </summary>
        /// <param name="Color">String representation of color, for instance aaffdd without # symbol.</param>
        /// <returns></returns>
        public static bool IsColor(string Color)
        {
            //create Regular Expression Match pattern object
            Regex myRegex = new Regex(@"^\#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$");

            //boolean variable to hold the status
            bool isValid = false;

            if (string.IsNullOrEmpty(Color))
                isValid = false;
            else
                isValid = myRegex.IsMatch(Color);

            //return the results
            return isValid;
        }

        /// <summary>
        /// Gets true if mal domain exists.
        /// </summary>
        /// <param name="inputEmail">Email address.</param>
        /// <returns>True if mal domain exists</returns>
        public static bool isRealDomain(string inputEmail)
        {
            bool isReal = false;
            try
            {
                string[] host = (inputEmail.Split('@'));
                string hostname = host[1];

                IPHostEntry IPhst = Dns.GetHostEntry(hostname);
                IPEndPoint endPt = new IPEndPoint(IPhst.AddressList[0], 25);
                Socket s = new Socket(endPt.AddressFamily,
                        SocketType.Stream, ProtocolType.Tcp);
                s.Connect(endPt);
                s.Close();
                isReal = true;
            }
            catch
            {

            }

            return isReal;
        }

        /// <summary>
        /// Gets true if email domain is allowed for sing-up. You can change the list of allowed mail domain via admin UI.
        /// </summary>
        /// <param name="Email">E-mail address.</param>
        /// <returns>True if email domain is allowed for sing-up.</returns>
        public static bool IsMailDomainAllowed(string Email)
        {
            string[] host = (Email.Split('@'));
            string hostname = host[1];

            ApplicationParameters _params = new ApplicationParameters();
            string[] _excludes = _params.RegistrationMailDomainRestrictionList.Value.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

            // Allow All
            if (_params.RegistrationMailDomainRestriction.Value == "1")
            {
                foreach (String _exclude in _excludes)
                {
                    if (_exclude.Trim().ToLower() == hostname.Trim())
                        return false;
                }

                return true;
            }
            // Deny All
            else if (_params.RegistrationMailDomainRestriction.Value == "2")
            {
                foreach (String _exclude in _excludes)
                {
                    if (_exclude.Trim().ToLower() == hostname.Trim())
                        return true;
                }

                return false;
            }

            return false;
        }

        /// <summary>
        /// Send email to a recipient and BCC members.
        /// </summary>
        /// <param name="FromName">Sender name.</param>
        /// <param name="FromEmail">Sender email.</param>
        /// <param name="ToName">Recipient name.</param>
        /// <param name="ToEmail">Recipient email.</param>
        /// <param name="Bcc">BCC recipient emails.</param>
        /// <param name="Subject">Mail subject.</param>
        /// <param name="Body">Mail body.</param>
        /// <returns>True if an email has been sent succesfully.</returns>
        public static bool SendMail(string FromName, string FromEmail, string ToName, string ToEmail, string Bcc, string Subject, string Body)
        {
            ApplicationParameters AppParams = Parameters;
            var fromAddress = new MailAddress(FromEmail, FromName);
            var toAddress = new MailAddress(ToEmail, ToName);
            string fromPassword = AppParams.MailServerSmtpPassword.Value;
            string subject = Subject;
            string body = Body;

            var smtp = new SmtpClient
            {
                Host = Parameters.MailServerSmtpHost.Value,
                Port = int.Parse(AppParams.MailServerSmtpPort.Value),
                EnableSsl = bool.Parse(AppParams.MailServerSmtpSSLEnabled.Value),
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                Timeout = 20000
            };

            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })

                try
                {
                    if (Bcc != null && Bcc.Length > 0)
                        message.Bcc.Add(Bcc);
                    else
                        Bcc = "";

                    string Title = String.Format(AuditEvent.TheEmailhasBeenSent, FromName, FromEmail, ToName, ToEmail, Bcc, Subject);
                    smtp.Send(message);
                    AuditEvent.AppEventSuccess(FromEmail, Title, "##Details%%" + Title + "\r\n\r\nE-mail message:\r\n" + Body + "%%");
                    return true;
                }
                catch (Exception ex)
                {
                    AuditEvent.AddAppEvent(
                       new AuditEventItem
                       {
                           EventType = AuditEventType.Error,
                           IPAddress = HttpContext.Current.Request.UserHostAddress,
                           MemberEmail = AppParams.GeneralAdminEmail.Value,
                           Description = ex.Message,
                           Details = AuditEvent.GetSessionDetails("E-mail message:\r\n" + body + "\r\nStackTrace:\r\n" + ex.StackTrace)
                       }
                   );

                    return false;
                }
        }

        /// <summary>
        /// Gets label content by name using system language setting.  
        /// </summary>
        /// <param name="Name">Label name.</param>
        /// <returns></returns>
        public static string GetLabel(String Name)
        {
            String DefaultLanguage = "eng";
            
            Dictionaries Dictionaries = (Dictionaries)HttpContext.Current.Application["Dictionaries"];
            
            if (Parameters.LanguagePublicDefault != null && Parameters.LanguagePublicDefault.Value != null && Parameters.LanguagePublicDefault.Value.Length > 0)
                DefaultLanguage = Parameters.LanguagePublicDefault.Value.ToLower();

            return Dictionaries.GetLabelByLanguage(Name, DefaultLanguage);
        }

        /// <summary>
        /// Gets list of application parameters. 
        /// </summary>
        public static ApplicationParameters Parameters
        {
            get { return new ApplicationParameters(); }
        }

        /// <summary>
        ///  Invisible captcha fro public forms.
        /// </summary>
        public static string InvisibleCaptcha
        {
            get
            {
                if (HttpContext.Current != null && HttpContext.Current.Session != null)
                {
                    if (HttpContext.Current.Session["InvisibleCaptcha"] == null)
                        HttpContext.Current.Session["InvisibleCaptcha"]  = StringTool.RandomString(10, true);

                    return (string) HttpContext.Current.Session["InvisibleCaptcha"];
                }
                else
                    return StringTool.RandomString(10, true);
            }
        }


        /// <summary>
        /// Updates invisible captcha.
        /// </summary>
        public static void RefreshInvisibleCaptcha()
        {
            if (HttpContext.Current.Session["InvisibleCaptcha"] != null)
                  HttpContext.Current.Session["InvisibleCaptcha"]  = StringTool.RandomString(10, true);
        }

        /// <summary>
        /// Validates invisible captcha.
        /// </summary>
        /// <param name="RequestID">Request calculated number.</param>
        /// <param name="SessionID">Session calculated number.</param>
        /// <returns></returns>
        public static bool ValidateInvisibleCaptcha(string RequestID, string SessionID)
        { 
            bool result = false;
            
            // 0 1 2 3 4 5 6 7 8 9 - Initial order 
            // 3 9 4 6 2 1 5 8 0 7 - correct order
            // Repair initial order and check sum

            string InitialNumber = SessionID[8].ToString() + SessionID[5].ToString() + SessionID[4].ToString() + SessionID[0].ToString() + SessionID[2].ToString() + SessionID[6].ToString() + SessionID[3].ToString() + SessionID[9].ToString() + SessionID[7].ToString() + SessionID[1].ToString();
            string Sum = (int.Parse(InitialNumber.Substring(3, 3)) + int.Parse(InitialNumber.Substring(2, 7))).ToString();

            result = (RequestID == Sum);
            return result;
        }

        /// <summary>
        /// Converts UTC time to member's local time.
        /// </summary>
        /// <param name="Date">Member's UTC time.</param>
        /// <returns></returns>
        public static DateTime ToLocalTime(DateTime Date)
        {
            if (Date != DateTime.MinValue)
            {
                if (AppSession.Profile != null && AppSession.Profile.Member != null && AppSession.Profile.Member.TimeZoneID != null && AppSession.Profile.Member.TimeZoneID.Length > 0)
                {
                    try
                    {
                        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(AppSession.Profile.Member.TimeZoneID);
                        return TimeZoneInfo.ConvertTimeFromUtc(Date, timeZoneInfo);
                    }
                    catch (Exception ex)
                    {
                        AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value,String.Format("Wrong member time zone name:{0}",AppSession.Profile.Member.TimeZoneID),String.Format("Wrong member time zone name: {0} Message:{1} ", AppSession.Profile.Member.TimeZoneID,ex.Message),true);
                        return TimeZone.CurrentTimeZone.ToLocalTime(Date);
                    }
                }
                else
                {
                    return TimeZone.CurrentTimeZone.ToLocalTime(Date);
                }
            }
            else
                return Date;

        }

        /// <summary>
        /// Keeps meaasge about SocialSignIn Issue
        /// </summary>
        public static String SocialSignInIssueMessage {
            get { return (String)HttpContext.Current.Session["SocialSignInIssueMessage"]; } 
            set {HttpContext.Current.Session["SocialSignInIssueMessage"] = value;}
        }

        /// <summary>
        /// Keeps new member SignUp domain.
        /// </summary>
        public static string SignUpDomain { get; set; }

        /// <summary>
        /// Keeps new member client site SignIn Url.
        /// </summary>
        public static string SignInUrl { get; set; }

        /// <summary>
        /// Keeps new member SignOut.
        /// </summary>
        public static string SignOut { get; set; }
        
    }
}
