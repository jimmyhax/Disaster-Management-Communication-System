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
    /// SocialSignInAvailabilities
    /// </summary>
    public class SocialSignInAvailabilities : Collection<SocialSignInAvailability>
    {
        /// <summary>
        /// Returns SocialSignInAvailability structure. 
        /// </summary>
        /// <returns></returns>
        public static SocialSignInAvailability GetSocialSignInAvailability()
        {
            HttpContext hc = HttpContext.Current;

            if (hc != null)
            {
                IPrincipal user = hc.User;

                Connection Connection = new Connection(
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIUrl"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberName"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberToken"]);

                return GetItem(new StreamReader(Tools.StreamGet("GetSocialSignInAvailability", Connection)));
            }

            return null;
        }    
    
    }

}