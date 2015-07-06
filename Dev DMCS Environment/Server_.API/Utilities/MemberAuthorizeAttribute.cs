using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Configuration;

using System.Runtime.Serialization.Json;
using Server_.API.Objects;

namespace Server_.API.Utilities
{
    /// <summary>
    /// Provides the implementation of custome security attribute based on the MemberRoleAdmin's application roles roles.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class MemberAuthorizeAttribute : AuthorizeAttribute
    {
        /// <summary>
        /// Checks the authorization of logged member according to the member's roles.
        /// </summary>
        /// <param name="httpContext">HTTP context of current member.</param>
        /// <returns>True if the member is authorized in current context.</returns>
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            return !Member.IsInRoleInAPI("blocked") && Member.IsInRoleInAPI(this.Roles);
        }

        /// <summary>
        /// Catches unauthorized request and returns the response appropriate to request type.
        /// </summary>
        /// <param name="filterContext">Filter of authorization context.</param>
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
                            filterContext.Result = new ViewResult { ViewName = "AccessDeniedAjax" };
                        else
                            filterContext.Result = new ViewResult { ViewName = "AccessDeniedHtml" };
                        break;
                    }
                    else if (type.Contains("javascript"))
                    {
                        filterContext.Result = new ViewResult { ViewName = "AccessDeniedJavaScript" };
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
                 if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
                  {
                      // get from cached variable from web configuration
                      string loginUrl = System.Configuration.ConfigurationManager.AppSettings["ssoUrlSignIn"];
                      
                     if (filterContext.HttpContext.Request != null)
                      {
                          loginUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(filterContext.HttpContext
                                                                   .Request
                                                                   .Url
                                                                   .AbsoluteUri);
                      }
                     
                     filterContext.Result = new RedirectResult( loginUrl );
                  }
            }
        }
    }
}
