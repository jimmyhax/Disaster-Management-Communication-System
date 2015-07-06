using System;
using System.Data;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Web;
using Web.Admin.Logic.Utilities;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Runtime.Serialization;
using MySql.Data.MySqlClient;

namespace Web.Admin.Logic.Objects
{
    /// <summary>
    /// Audit event type possible values:
    /// Default - the type of action can't be defined;
    /// Info - if something not realy important happened;
    /// Success - if an acction finished succesfylly;
    /// Warning - needs to pay attantion to an action;
    /// Error - an error occurred during an action.
    /// </summary>
    public enum AuditEventType
    { 
        /// <summary>
        /// General type of audit item.
        /// </summary>
        Default = 1,
        /// <summary>
        /// Information type of audit item.
        /// </summary>
        Info = 2,
        /// <summary>
        /// An ction was finished fine type.
        /// </summary>
        Success = 3,
        /// <summary>
        /// An action was finished with warnings.
        /// </summary>
        Warning = 4,
        /// <summary>
        /// An action was failed.
        /// </summary>
        Error = 5
    }

    /// <summary>
    /// App - an action is connected with application activity;
    ///	System - an action is connected with system activity;
    ///	API - an action is connected with API call;
    /// </summary>
    public enum AuditEventSource
    {
        /// <summary>
        /// The event source is admin application.
        /// </summary>
        App = 1,
    	/// <summary>
    	/// The source is process in a library.
    	/// </summary>
        System = 2 ,
    	/// <summary>
    	/// The source is application API.
    	/// </summary>
        API = 3,
    }

    /// <summary>
    /// Provides a wrapper on single row in the AuditEventItems database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using AuditEventItems class which returns collection of AuditEventItem objects by different condition.    
    /// Keeps information about single action details: session cookies, server variables, client IP address etc.
    /// </summary>
    public class AuditEventItem
    {
        /// <summary>
        /// Event type, can be:
        /// Default - the type of action can't be defined;
        /// Info - if something not realy important happened;
        /// Success - if an acction finished succesfylly;
        /// Warning - needs to pay attantion to an action;
        /// Error - an error occurred during an action.
        /// </summary>
        public AuditEventType EventType {get;set;}

        /// <summary>
        /// Email of executor.
        /// </summary>
        public String MemberEmail {get;set;}
        
        /// <summary>
        /// IP address of executor.
        /// </summary>
        public String IPAddress { get; set; }
        
        /// <summary>
        /// An acction short description.
        /// </summary>
        public String Details {get;set;}
        
        /// <summary>
        /// An action long description.
        /// </summary>
        public String Description {get;set;}
    }

    /// <summary>
    ///Provides information about single action in details which happens during application activity. 
    /// </summary>
    [DataContract]
    public class AuditEventItemDetail : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// An action short description.
        /// </summary>
        [DataMember]
        public string Title { get; set; }
        
        /// <summary>
        /// An action long description.
        /// </summary>
        [DataMember]
        public string Description { get; set; }

        /// <summary>
        /// Needs to be implemented in order to use application collection methods. 
        /// </summary>
        /// <param name="dr">DataReader object.</param>
        /// <returns>False</returns>
        public bool Load(IDataReader dr) { return false; }
    }

    /// Provides a wrapper on single row in the AuditEventItems database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using AuditEventItems class which returns collection of AuditEventItem objects by different condition.    
    /// Keeps information about single action in details which happens during application activity.
    public class AuditEventItemDetails : ApplicationCollection<AuditEventItemDetail, DbRoleAdmin, SpRoleAdmin>
    { 
    
    }

    /// <summary>
    /// Provides a wrapper on single row in the AuditEventItems database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using AuditEventItems class which returns collection of AuditEventItem objects by different condition.    
    /// Keeps information about single action which happens during application activity. There are the types of event: system, application, API.
    /// </summary>
    public partial class AuditEvent : ApplicationObject, IApplicationObject
    {
        /// <summary></summary>
        public static String MemberLoggedIn                 { get { return "Member \"{0}\"<{1}> has logged in successfully.";}}
        /// <summary></summary>
        public static String MemberWrongEmail               { get { return "Member <{0}>  has didn't log in. Wrong e-mail.";}}
        /// <summary></summary>
        public static String MemberWrongPassword            { get { return "Member \"{0}\"<{1}>  has didn't log in. Wrong password.";}}
        /// <summary></summary>
        public static String SavingMemberInfo               { get { return "Wrong properties \"{0}\"<{1}>: \"{0}\""; } }

        /// <summary></summary>
        public static String MemberAssigToRole              { get { return "Member \"{0}\"<{1}> has been assign to role \"{2}\""; } }
        /// <summary></summary>
        public static String MemberRemovedFromRole          { get { return "Member \"{0}\"<{1}> has been removed from role \"{2}\""; } }
        /// <summary></summary>
        public static String MemberRemovedFromAllRole       { get { return "Member \"{0}\"<{1}> has been removed from all roles"; } }
        /// <summary></summary>
        public static String MemberNoRemovedAdminFromRole   { get { return "The member \"{0}\"<{1}> is admin and can't be deleted from role \"{2}\""; } }
        /// <summary></summary>
        public static String MemberDounloaded               { get { return "Members' CSV file has been requested, Member count:{0}"; } }
        /// <summary></summary>
        public static String MemberUploaded                 { get { return "Members' CSV file has been uploaded, Member count:{0}"; } }

        /// <summary></summary>
        public static String MemberUploadHasStarted         { get { return "Member upload has started. Total Lines:{0}"; } }
        /// <summary></summary>
        public static String MemberUploadedItemAdded        { get { return "Member added: \"{0}\"<{1}>"; } }
        /// <summary></summary>
        public static String MemberUploadMemberExists       { get { return "Member exists: \"{0}\"<{1}>"; } }
        /// <summary></summary>
        public static String MemberUploadWrongLineFormat    { get { return "Wrong line format. Line# {0}  Number of columns:{1}"; } }
        /// <summary></summary>
        public static String MemberUploadHasFineshed        { get { return "Member upload has finished. Total:{0} Added:{1} Exist:{2} Failed:{3}"; } }

        /// <summary></summary>
        public static String SentRandomPasswordBadFormat    { get { return "Send random pasword: <{0}>"; } }
        /// <summary></summary>
        public static String SentRandomPasswordNotExist     { get { return "Member upload has started. \"{0}\"<{1}>"; } }
        /// <summary></summary>
        public static String SentRandomPasswordSent         { get { return "Random password has been generated and sent. \"{0}\"<{1}>"; } }

        /// <summary></summary>
        public static String RoleContainsMembers            { get { return "The role \"{0}\" contains members."; } }
        /// <summary></summary>
        public static String RoleIsBuiltIn                  { get { return "The role \"{0}\" is built in and can't be deleted."; } }
        /// <summary></summary>
        public static String RoleDeleted                    { get { return "The role \"{0}\" has been deleted."; } }

        /// <summary></summary>
        public static String RoleDounloaded                 { get { return "Roles' CSV file has been requested, Member count:{0}"; } }
        /// <summary></summary>
        public static String RoleUploaded                   { get { return "Roles' CSV file has been uploaded, Member count:{0}"; } }

        /// <summary></summary>
        public static String RoleUploadHasStarted           { get { return "Role upload has started. Total Lines:{0}"; } }
        /// <summary></summary>
        public static String RoleUploadedItemAdded          { get { return "Role added: \"{0}\""; } }
        /// <summary></summary>
        public static String RoleUploadMemberExists         { get { return "Role exists: \"{0}\""; } }
        /// <summary></summary>
        public static String RoleUploadWrongLineFormat      { get { return "Wrong line format. Line# {0}  Number of columns:{1}"; } }
        /// <summary></summary>
        public static String RoleUploadHasFineshed          { get { return "Role upload has finished. Total:{0} Added:{1} Exist:{2} Failed:{3}"; } }

        /// <summary></summary>
        public static String AccountNotActivated            { get { return "Your account \"{0}\"<{1}> was not activated."; } }
        /// <summary></summary>
        public static String AccountAccountBlocked          { get { return "Your account \"{0}\"<{1}> was blocked."; } }
        /// <summary></summary>
        public static String AccountWrongUser               { get { return "Wrong user name or password for \"{0}\"<{1}>."; } }
        /// <summary></summary>
        public static String AccountWronAdmingUserLink      { get { return "Admin \"{0}\"<{1}>  tries to login by wrong url: {2} "; } }
        /// <summary></summary>
        public static String AccountWrongEmail              { get { return "Wrong e-mail address format: \"{0}\"<{1}> "; } }
        /// <summary></summary>
        public static String AccountDomainNotAllowed        { get { return "The mail domain is not allowed for \"{0}\"<{1}> ."; } }
        /// <summary></summary>
        public static String AccountAccountExists           { get { return "The account \"{0}\"<{1}>  already exists."; } }
        /// <summary></summary>
        public static String AccountActivationMailSent      { get { return "Activation email has been send to \"{0}\"<{1}>."; } }
        /// <summary></summary>
        public static String AccountWrongActiveLink         { get { return "Wrong activation link or activation has been expared. The token is: {0}"; } }
        /// <summary></summary>
        public static String AccountActivated               { get { return "Your account \"{0}\"<{1}>  has been activated successfuly."; } }
        /// <summary></summary>
        public static String AccountAccountDoesntExist      { get { return "The account \"{0}\"<{1}>  doesn't exist."; } }
        /// <summary></summary>
        public static String AccountResetPassMail           { get { return "Reset password email has been send to \"{0}\"<{1}>."; } }
        /// <summary></summary>
        public static String AccountWrongResetPassLink      { get { return "Wrong reset passowrd link or the link has been expared. The token is: {0}"; } }
        /// <summary></summary>
        public static String AccountPassChanged             { get { return "\"{0}\"<{1}> account password has been changed."; } }

        /// <summary></summary>
        public static String TheEmailhasBeenSent            { get { return "A mail has been sent. From: \"{0}\" {1} to: \"{2}\" {3}  bcc:{4} with subject:{5} "; } }

     

        /// <summary>
        /// Gets user host address. 
        /// </summary>
        /// <returns></returns>
        private static string GetIPAddress()
        {
           HttpContext hc = System.Web.HttpContext.Current;
           return hc != null ? hc.Request.UserHostAddress : "";
        }
        
        /// <summary>
        /// Gets audit feature state: on or off.
        /// </summary>
        /// <returns>True if the aduit feature is enabled. </returns>
        private static bool IsAduitEnabled()
        {
            string Name = "general-audit-enabled";
            HttpContext hc = HttpContext.Current;
            List<Parameter> _Parameters = (List<Parameter>) hc.Application["Parameters"];
            string Value = _Parameters.FirstOrDefault(t => t.Name.ToLower() == Name.ToLower()).Value;
            return (Value == "true");
        }
        
        /// <summary>
        /// Adds audit event item with type Info. 
        /// </summary>
        /// <param name="MemberEmail">Email of executor.</param>
        /// <param name="Description">Event short description.</param>
        /// <param name="Details">Event long description in details.</param>
        /// <param name="NoMatterIfAuditEnabled">Add audit item even this feature is switched off.</param>
        public static void AppEventInfo(String MemberEmail, String Description, String Details = null, bool NoMatterIfAuditEnabled = false)
        {
            if (!IsAduitEnabled())
                return;

            AuditEventItem Item = new AuditEventItem
            {
                EventType = AuditEventType.Info,
                IPAddress = GetIPAddress(),
                MemberEmail = MemberEmail,
                Description = Description,
                Details = Details
            };

            AddAppEvent(Item);
        }

        /// <summary>
        /// Adds audit event item with type Success. 
        /// </summary>
        /// <param name="MemberEmail">Email of executor.</param>
        /// <param name="Description">Event short description.</param>
        /// <param name="Details">Event long description in details.</param>
        /// <param name="NoMatterIfAuditEnabled">Add audit item even this feature is switched off.</param>
        public static void AppEventSuccess(String MemberEmail, String Description, String Details = null, bool NoMatterIfAuditEnabled = false)
        {
            if (!IsAduitEnabled())
                return;

            
            AuditEventItem Item = new AuditEventItem
            {
                EventType = AuditEventType.Success,
                IPAddress = GetIPAddress(),
                MemberEmail = MemberEmail,
                Description = Description,
                Details = Details
            };
            
            AddAppEvent(Item);
        }

        /// <summary>
        /// Adds audit event item with type Warning.
        /// </summary>
        /// <param name="MemberEmail">Email of executor.</param>
        /// <param name="Description">Event short description.</param>
        /// <param name="Details">Event long description in details.</param>
        /// <param name="NoMatterIfAuditEnabled">Add audit item even this feature is switched off.</param>
        public static void AppEventWarning(String MemberEmail, String Description, String Details = null, bool NoMatterIfAuditEnabled = false)
        {
            if (!IsAduitEnabled())
                return;


            AuditEventItem Item = new AuditEventItem
            {
                EventType = AuditEventType.Warning,
                IPAddress = GetIPAddress(),
                MemberEmail = MemberEmail,
                Description = Description,
                Details = Details
            };

            AddAppEvent(Item);
        }

        /// <summary>
        /// Adds audit event item with type Warning.
        /// </summary>
        /// <param name="MemberEmail"></param>
        /// <param name="Description"></param>
        /// <param name="Details"></param>
        /// <param name="NoMatterIfAuditEnabled"></param>
        public static void AppEventError(String MemberEmail, String Description, String Details = null, bool NoMatterIfAuditEnabled = false)
        {
            if (!IsAduitEnabled())
                return;

            AuditEventItem Item = new AuditEventItem
            {
                EventType = AuditEventType.Error,
                IPAddress = GetIPAddress(),
                MemberEmail = MemberEmail,
                Description = Description,
                Details = Details
            };

            AddAppEvent(Item);
        }

        /// <summary>
        /// Adds audit event item with source Application.
        /// </summary>
        /// <param name="EventItem">EventItem which describes an action.</param>
        public static void AddAppEvent(AuditEventItem EventItem)
        {
            if (!IsAduitEnabled())
                return;

            AddEvent(AuditEventSource.App, EventItem);
        }

        /// <summary>
        /// Adds audit event item with source System.
        /// </summary>
        /// <param name="EventItem">EventItem which describes an action.</param>
        public static void AddSystemEvent(AuditEventItem EventItem)
        {
            if (!IsAduitEnabled())
                return;

            AddEvent(AuditEventSource.System, EventItem);
        }

        /// <summary>
        /// Adds audit event item with source API.
        /// </summary>
        /// <param name="EventItem">EventItem which describes an action.</param>
        public static void AddAPIEvent(AuditEventItem EventItem)
        {
            if (!IsAduitEnabled())
                return;

            AddEvent(AuditEventSource.API, EventItem);
        }

        /// <summary>
        /// Adds audit event item with predefined source.
        /// </summary>
        /// <param name="Source">
        /// App - an acction is conneted with application ativity logic;
        ///	System - an acction is conneted with system ativity logic;
        ///	API - an acction is conneted with API call;
        /// </param>
        /// <param name="EventItem">EventItem which describes an action.</param>
        private static void AddEvent(AuditEventSource Source, AuditEventItem EventItem)
        {
            if (!IsAduitEnabled())
                return;
            
            AuditEvent Event = new AuditEvent();
            Event.EventSource = Source;
            Event.EventType = EventItem.EventType;
            Event.Description = EventItem.Description;
            Event.MemberEmail = EventItem.MemberEmail;
            Event.Details = EventItem.Details;
            Event.IPAddress = GetIPAddress();
            Event.Save();
        }
        
        /// <summary>
        /// Return HTTP session details from current HTTP context. 
        /// </summary>
        /// <param name="Details">Additional text which will be includded in the result string.</param>
        /// <returns></returns>
        public static string GetSessionDetails(String Details = "")
        {
            string detailSession = "";
         
            try
            {
                HttpContext hc = System.Web.HttpContext.Current;
                if (hc != null)
                {
                    //Client IP
                    // hc.Request.ServerVariables["REMOTE_ADDR"];

                    //Details
                    if (Details != null && Details.Length > 0)
                    {
                        detailSession += "##Details";
                        detailSession += "%%" + Details + "%%";
                    }

                    //Session                    
                    if (hc.Session != null && hc.Session.Count > 0)
                    {
                        detailSession += "##Session";
                        for (int i = 0; i < hc.Session.Count; i++)
                        {
                            detailSession += "%%" + hc.Session.Keys[i] + "=";
                            if (hc.Session[i] != null)
                            {
                                detailSession += hc.Session[i].ToString();
                                if (hc.Session[i].GetType() == Type.GetType("System.String"))
                                    detailSession += (string)hc.Session[i];
                                else
                                {
                                    detailSession += hc.Session[i] + "%%";
                                    PropertyInfo[] pia = hc.Session[i].GetType().GetProperties();
                                    try
                                    {
                                        foreach (PropertyInfo pi in pia)
                                        {
                                            detailSession += "%%  - " + pi.Name + " = " + pi.GetValue(hc.Session[i], null) + "%%";
                                        }
                                    }
                                    catch { }
                                }
                            }
                            else detailSession += "%%";
                        }
                    }
                    
                    //Application
                    if (hc.Application.Count > 0) detailSession += "##Application";
                    for (int i = 0; i < hc.Application.Count; i++)
                    {
                        detailSession += "%%" + hc.Application.Keys[i] + "=";
                        if (hc.Application[i] != null)
                        {
                            if (hc.Application[i].GetType() == Type.GetType("System.String"))
                                detailSession += (string)hc.Application[i];
                            else detailSession += hc.Application[i].ToString();
                        }
                        detailSession += "%%";
                    }
                    //ServerVariables
                    if (hc.Request.ServerVariables.Count > 0) detailSession += "##ServerVariables";
                    Hashtable listServerVariables = new Hashtable();
                    for (int i = 0; i < hc.Request.ServerVariables.Count; i++)
                    {
                        string str = hc.Request.ServerVariables.Keys[i].ToUpper();
                        switch (str)
                        {
                            case "HTTP_ACCEPT_LANGUAGE":
                            case "HTTP_HOST":
                            case "HTTP_REFERER":
                            case "HTTP_USER_AGENT":
                            case "HTTPS":
                            case "LOCAL_ADDR":
                            case "PATH_INFO":
                            case "PATH_TRANSLATED":
                            case "REMOTE_ADDR":
                            case "REMOTE_HOST":
                            case "REMOTE_PORT":
                            case "REQUEST_METHOD":
                                break;
                            default:
                                continue;

                        }

                        if (listServerVariables.Contains(str) == false)
                        {
                            string strDetailSession = "%%" + hc.Request.ServerVariables.Keys[i] + "=";
                            if (hc.Request.ServerVariables[i] != null) strDetailSession += hc.Request.ServerVariables[i];

                            listServerVariables.Add(str, strDetailSession);

                            detailSession += strDetailSession + "%%";
                        }

                    }

                    //Post Variables
                    if (hc.Request.Form.Count > 0) detailSession += "##Post Variables";
                    for (int i = 0; i < hc.Request.Form.Count; i++)
                    {
                        detailSession += "%%" + hc.Request.Form.Keys[i] + "=";
                        if (hc.Request.Form[i] != null)
                        {
                            if (hc.Request.Form[i].Length > 5000)
                                detailSession += hc.Request.Form[i].Substring(0, 5000);
                            else
                                detailSession += hc.Request.Form[i];
                        }
                        detailSession += "%%";
                    }

                    //Query Strings
                    if (hc.Request.QueryString.Count > 0) detailSession += "##Query Strings";
                    for (int i = 0; i < hc.Request.QueryString.Count; i++)
                    {
                        detailSession += "%%" + hc.Request.QueryString.Keys[i] + "=";
                        if (hc.Request.QueryString[i] != null) detailSession += hc.Request.QueryString[i];
                        detailSession += "%%";
                    }
                    //Cookies
                    if (hc.Request.Cookies.Count > 0) detailSession += "##Cookies";
                    for (int i = 0; i < hc.Request.Cookies.Count; i++)
                    {
                        detailSession += "%%" + hc.Request.Cookies.Keys[i] + "=";
                        if (hc.Request.Cookies[i].Value != null) detailSession += hc.Request.Cookies[i].Value;
                        detailSession += "%%";
                    }
                }

            }
            catch { }
            
            return detailSession;
        }

        /// <summary>
        /// Gets collection of audit event items by AuditEvent object.
        /// </summary>
        /// <param name="AuditEvent">Audit event item without details.</param>
        /// <returns></returns>
        public static List<AuditEventItemDetail> GetAuditEventDetails(AuditEvent AuditEvent)
        {
            string detailtext = AuditEvent.Details;
            string lApplication = "";
            string lCookies = "";
            string lDetail = "";
            string lPostVariables = "";
            string lQueryStrings = "";
            string lServerVariables = "";
            string lSession = "";

            int i = detailtext.IndexOf("##");
            if (i >= 0)
            {
                lDetail = detailtext.Substring(0, i);
                string vars = detailtext.Remove(0, i);
                MatchCollection MatchLinkNames = Regex.Matches(vars, "##(?<names>[^#]+)");
                for (int j = 0; j < MatchLinkNames.Count; j++)
                {
                    string tmp = MatchLinkNames[j].Groups["names"].Value;
                    int k = tmp.IndexOf("%");
                    string what;
                    if (k >= 0)
                    {
                        what = tmp.Substring(0, k);
                        tmp = tmp.Remove(0, k);
                        tmp = tmp.Replace("%%%%", "<br>");
                        tmp = tmp.Replace("%%", "");
                    }
                    else what = "empty";
                    switch (what)
                    {
                        case "Session": lSession = tmp;
                            break;
                        case "Application": lApplication = tmp;
                            break;
                        case "ServerVariables": lServerVariables = tmp;
                            break;
                        case "Post Variables":
                            MatchCollection ccd = Regex.Matches(tmp, @"(?<name>\w+)=(?<value>[^<]+)");
                            for (int ij = 0; ij < ccd.Count; ij++)
                            {
                                string ccname = ccd[ij].Groups["name"].Value;
                                string ccvalue = ccd[ij].Groups["value"].Value;
                                if (ccname.ToLower().IndexOf("cc") != -1)
                                    tmp = tmp.Replace("=" + ccvalue, "=xxxxx");
                            }
                            lPostVariables = tmp;
                            break;
                        case "Query Strings": lQueryStrings = tmp;
                            break;
                        case "Cookies": lCookies = tmp;
                            break;
                        case "Details": lDetail = tmp;
                            break;
                    }
                }

            }

            List<AuditEventItemDetail> AuditEventItems = new List<AuditEventItemDetail>();
            AuditEventItems.Add(new AuditEventItemDetail { Title = "Details", Description = lDetail.Replace("\r\n", "<br/>") });
            AuditEventItems.Add(new AuditEventItemDetail { Title = "Server Variables", Description = lServerVariables });
            AuditEventItems.Add(new AuditEventItemDetail { Title = "Query Strings", Description = lQueryStrings });
            AuditEventItems.Add(new AuditEventItemDetail { Title = "Post Variables", Description = lPostVariables });
            AuditEventItems.Add(new AuditEventItemDetail { Title = "Cookies", Description = lCookies });
            AuditEventItems.Add(new AuditEventItemDetail { Title = "Session", Description = lSession });
            AuditEventItems.Add(new AuditEventItemDetail { Title = "Application", Description = lApplication });

            return AuditEventItems;
        }

    }

    /// <summary>
    /// Database read/write part.
    /// </summary>
    [DataContract]
    public partial class AuditEvent : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        [DataMember]
        public long EventID         { get; set; }

        /// <summary>
        /// Type of the item.
        /// Audit event type possible values:
        /// Default - the type of action can't be defined;
        /// Info - if something not realy important happened;
        /// Success - if an acction finished succesfylly;
        /// Warning - needs to pay attantion to an action;
        /// Error - an error occurred during an action.
        /// </summary>
        [DataMember]
        public AuditEventType       EventType { get; set; }

        /// <summary>
        /// Source of the item.
        /// App - an acction is conneted with application ativity logic;
        ///	System - an acction is conneted with system ativity logic;
        ///	API - an acction is conneted with API call;
        /// </summary>
        [DataMember]
        public AuditEventSource     EventSource { get; set; }
        
        /// <summary>
        /// Event short description.
        /// </summary>
        [DataMember]
        public string Description   { get; set; }
        
        /// <summary>
        /// Email of an executor.
        /// </summary>
        [DataMember]
        public string MemberEmail   { get; set; }
        
        /// <summary>
        /// Event description in details.
        /// </summary>
        public string Details       { get; set; }
        
        /// <summary>
        /// IP Address of an executor.
        /// </summary>
        [DataMember]
        public string IPAddress     { get; set; }
        
        /// <summary>
        /// Date of creation.
        /// </summary>
        [DataMember(EmitDefaultValue = false)]    
        public DateTime Created     { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public AuditEvent ()
        {
            EventType = AuditEventType.Default;
            EventSource = AuditEventSource.App;
        }

        /// <summary>
        /// Creates AuditEvent object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public AuditEvent(IDataReader dr):base()
        {
            this.Load(dr);
        }

        /// <summary>
        /// Loads result set field values and saves into properties of class.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        /// <returns>Returns true if it was successfully loaded.</returns>
        public virtual bool Load(IDataReader dr)
        {
            IsValid = false;

            this.EventID        = DBUtil.GetLongField(dr, "EventID");
            this.MemberEmail    = DBUtil.GetCharField(dr, "MemberEmail");
            this.EventType      = (AuditEventType) DBUtil.GetIntField(dr, "EventType");
            this.EventSource    = (AuditEventSource) DBUtil.GetIntField(dr, "EventSource");
            this.Details        = DBUtil.GetCharField(dr, "Details");
            this.IPAddress      = DBUtil.GetCharField(dr, "IPAddress");     
            this.Description    = DBUtil.GetCharField(dr, "Description");
            this.Created        = DBUtil.GetDateTimeField(dr, "Created");

            IsValid = true;
            return IsValid;
        }

        /// <summary>
        /// Inserts an object in database according to class properties.
        /// </summary>
        /// <returns>Returns true if it was successfully saved.</returns>
        public virtual bool Save()
        {
            if (IPAddress == "::1")
                IPAddress = "localhost";

            this.WasSaved = false;
            SpRoleAdmin sp = null;
          
            sp = new SpRoleAdmin(String.Format(@"
                    INSERT INTO {0} (EventType , EventSource , Description, MemberEmail, Details, IPAddress, Created) 
                           VALUES(@EventType , @EventSource , @Description, @MemberEmail, @Details, @IPAddress, @Created); SELECT @EventID = @@IDENTITY",Table));

            sp.AddParameter("EventID", EventID, System.Data.ParameterDirection.Output);
            sp.AddParameter("EventType", (int)EventType);   
            sp.AddParameter("EventSource",(int)EventSource);
            sp.AddParameter("Description", Description);
            sp.AddParameter("Created", DateTime.UtcNow);
            sp.AddParameter("MemberEmail", MemberEmail);
            sp.AddParameter("IPAddress",   IPAddress);
            
            if(Details == null || Details.Length == 0)
                sp.AddParameter("Details", DBNull.Value);
            else
                sp.AddParameter("Details", Details);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.EventID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            EventID = (long)sp.GetParameter("EventID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                EventID = Convert.ToInt64(cm.LastInsertedId);

                            break;
                        }
                }             
                
            }

            return this.WasSaved;
        }

        /// <summary>
        /// Deletes an object from the database.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool Delete()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE EventID = @EventID", Table));
            sp.AddParameter("EventID", EventID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }
    }

}
