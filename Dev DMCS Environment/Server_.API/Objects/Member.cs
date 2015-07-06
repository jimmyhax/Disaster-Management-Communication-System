using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web;
using System.Security.Principal;
using Server_.API.Utilities;
using System.Web.Script.Serialization;

namespace Server_.API.Objects
{
    /// <summary>
    /// Provides a wrapper on single row in the Members database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using Members class which returns collection of Member objects by different condition.   
    /// The object of this class contains information about single member.
    /// </summary>
    public class Member
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public long MemberID { get; set; }

        /// <summary>
        /// Unique name of member. Can be last/first name or another thing.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Email address of a member
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Member time zone
        /// </summary>
        public string TimeZoneID { get; set; }

        /// <summary>
        ///  Built-in flag.
        /// </summary>
        public bool IsBuiltIn { get; set; }

        /// <summary>
        /// Date of the last login.
        /// </summary>
        public DateTime LastLogin { get; set; }

        /// <summary>
        /// Member avatar unique identifier.
        /// </summary>
        public string Avatar { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        public DateTime Created { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        public DateTime Modified { get; set; }

        /// <summary>
        /// Member profiles field collection.
        /// </summary>                  
        public List<MemberProfileField> ProfileFields { get; set; }

        /// <summary>
        /// Gets member profile field value by ID.
        /// </summary>
        /// <param name="ProfileFieldID">Member profile field ID.</param>
        /// <returns>Member profile field object.</returns>
        public string GetFieldValueByID(int ProfileFieldID)
        {
            if (ProfileFields != null && ProfileFields.Count > 0)
            {
                MemberProfileField Field = ProfileFields.Where(t => t.FieldID == ProfileFieldID).FirstOrDefault();
                if (Field != null)
                    return ProfileFields.Where(t => t.FieldID == ProfileFieldID).FirstOrDefault().FieldValue;
                else return "";
            }
            else
                return "";

        }

        /// <summary>
        /// Gets member profile field value by name.
        /// </summary>
        /// <param name="ProfileFieldName">Member profile field name.</param>
        /// <returns>Member profile field object.</returns>
        public string GetFieldValueByName(String ProfileFieldName)
        {
            if (ProfileFields != null && ProfileFields.Count > 0)
            {
                MemberProfileField Field = ProfileFields.Where(t => t.FieldName == ProfileFieldName).FirstOrDefault();
                if (Field != null)
                    return ProfileFields.Where(t => t.FieldName == ProfileFieldName).FirstOrDefault().FieldValue;
                else return "";
            }
            else
                return "";

        }

        /// <summary>
        /// Returns true if the member is in a role defined by name. It expects list of roles in cookies.
        /// </summary>
        /// <param name="Name">Role name.</param>
        /// <returns>True if the member is in a role defined by name.</returns>
        public static bool IsInRoleInCookie(String Name)
        {
           HttpContext hc = HttpContext.Current;
           
           if(hc != null)
           {
               IPrincipal user = hc.User;

               if (!user.Identity.IsAuthenticated)
                   return false;

               string CookieName = FormsAuthentication.FormsCookieName;
               string CookiePath = FormsAuthentication.FormsCookiePath;
               HttpCookie cookieEncrypted = hc.Request.Cookies[CookieName];

               if (cookieEncrypted != null)
               {
                   FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(cookieEncrypted.Value);
                   string[] MemberRoles = authTicket.UserData.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);

                   List<String> Roles = MemberRoles.ToList<String>();
                   string[] _roles = Name.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);

                   foreach (string role in _roles)
                   {
                       String _Role = Roles.Where(t => t.ToLower() == role.ToLower()).FirstOrDefault();

                       if (_Role != null)
                           return true;
                   }
               }
               else
                   throw new API.Utilities.Exception(String.Format("Authentication cookie \"{0}\" not found.", CookieName));
           }
  
            return false;
        }

        /// <summary>
        /// Return true if the member is in a role defined by name. It receives list of roles by API call.
        /// </summary>
        /// <param name="Name">Role name.</param>
        /// <returns>True  if the member is in a role defined by name</returns>
        public static bool IsInRoleInAPI(String Name)
        {
           HttpContext hc = HttpContext.Current;
           
           if(hc != null)
           {
               IPrincipal user = hc.User;

               if (!user.Identity.IsAuthenticated)
                   return false;

               Connection Connection = new Connection(
                    System.Configuration.ConfigurationManager.AppSettings["ssoAPIUrl"],
                    System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberName"],
                    System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberToken"]);
               
               API.Collections.Roles.Connection = Connection; 

               List<Role> Roles = Server_.API.Collections.Roles.GetMemberRoles(hc.User.Identity.Name);
               string[] _roles = Name.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);

               foreach (string role in _roles)
               {
                   Role _Role = Roles.Where(t => t.Name.ToLower() == role.ToLower()).FirstOrDefault();

                   if (_Role != default(Role))
                       return true;
               }
           }
  
            return false;
        }

        /// <summary>
        /// Creates auth ticket member session object instance.
        /// </summary>
        /// <param name="input">JSON representation of object.</param>
        /// <returns></returns>
        public static AuthMemberToken TokenFromJson(string input)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Deserialize<AuthMemberToken>(input);
        }

        /// <summary>
        /// Returns member's name from the authorization cookie.
        /// </summary>
        /// <returns>Member name.</returns>
        public static string NameInCoookie()
        {
          HttpContext hc = HttpContext.Current;
          String _memberName = "";
          
          if(hc != null)
          {
               IPrincipal user = hc.User;

               if (!user.Identity.IsAuthenticated)
                   return "";

               string CookieName = FormsAuthentication.FormsCookieName;
               string CookiePath = FormsAuthentication.FormsCookiePath;
               HttpCookie cookieEncrypted = hc.Request.Cookies[CookieName];

               if (cookieEncrypted != null)
               {
                   FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(cookieEncrypted.Value);
                   _memberName = Member.TokenFromJson(authTicket.UserData).MemberName;
                   
                   // Get member name view API.
                   if (_memberName == null || _memberName.Trim().Length == 0)
                       _memberName = Member.GetMember(user.Identity.Name).Name;
               }
           }
           
            return _memberName;
        }

        /// <summary>
        /// Return a member properties.
        /// </summary>
        /// <param name="Name">Members' email.</param>
        /// <returns>Member object instance or null.</returns>
        public static Member GetMember(string Email)
        {
            HttpContext hc = HttpContext.Current;

            if (hc != null)
            {
                IPrincipal user = hc.User;

                if (!user.Identity.IsAuthenticated)
                    return null;

                Connection Connection = new Connection(
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIUrl"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberName"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberToken"]);

                API.Collections.Members.Connection = Connection;

                return Server_.API.Collections.Members.GetMember(hc.User.Identity.Name);
            }

            return null;
        }
    }
}