using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web;
using System.Security.Principal;
using Server_.API.Utilities;
using System.IO;

namespace Server_.API.Objects
{
    /// <summary>
    /// SingInAuthTickets
    /// </summary>
    public class SingInAuthTickets : Collection<SingInAuthTicket>
    {
        /// <summary>
        /// Returns SocialSignInAvailability structure. 
        /// </summary>
        /// <returns></returns>
        public static SingInAuthTicket GetSignInTicket(string Email, string AuthToken)
        {
            HttpContext hc = HttpContext.Current;

            if (hc != null)
            {
                IPrincipal user = hc.User;

                Connection Connection = new Connection(
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIUrl"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberName"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberToken"]);

                return GetItem(new StreamReader(Tools.StreamPost("GetSignInAuthTicket", Connection, new { Email = Email, AuthToken = AuthToken })));
            }

            return null;
        }    
    
    }

}