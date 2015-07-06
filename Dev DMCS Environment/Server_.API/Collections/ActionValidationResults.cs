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
    public class ActionValidationResults : Collection<ActionValidationResult>
    {
        /// <summary>
        /// IsAuthTicketValid method
        /// </summary>
        /// <param name="Email"></param>
        /// <param name="AuthToken"></param>
        /// <returns></returns>
        public static ActionValidationResult IsAuthTicketValid(string Email, string AuthToken)
        {
            HttpContext hc = HttpContext.Current;

            if (hc != null)
            {
                IPrincipal user = hc.User;

                Connection Connection = new Connection(
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIUrl"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberName"],
                     System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberToken"]);

               ActionValidationResult _result = GetItem(new StreamReader(Tools.StreamPost("IsAuthTicketValid", Connection, new { Email = Email, AuthToken = AuthToken })));
               return _result;
            }

            return new ActionValidationResult() ;
        }    
    
    }

}