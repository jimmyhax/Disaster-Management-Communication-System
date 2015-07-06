using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Web.Infrastructure.DynamicModuleHelper;
using Web.Admin.Logic;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Controllers;
using System.Web.Configuration;
using System.Configuration;
using System.Reflection;
using System.Diagnostics;
using System.Web.Optimization;

namespace Web.Admin
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class ContainerHttpModule<TModule> : IHttpModule where TModule : IHttpModule
    {
        Lazy<IHttpModule> _module = new Lazy<IHttpModule>(RetrieveModule);

        private static IHttpModule RetrieveModule()
        {
            return DependencyResolver.Current.GetService<IHttpModule>();
        }

        public void Dispose()
        {
            _module.Value.Dispose();
        }

        public void Init(HttpApplication context)
        {
            _module.Value.Init(context);
        }
    }

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            // Ensure SessionID in order to prevent the folloing exception
            // when the Application Pool Recycles
            // [HttpException]: Session state has created a session id, but cannot
            // save it because the response was already flushed by 

            string sessionId = Session.SessionID;
        }

        protected void Application_Start()
        {
            AppSession.ReloadLabels();
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            BundleConfig.RegisterBundles(BundleTable.Bundles);             
        }

        protected void Application_Error()
        {
            var exception = Server.GetLastError();
            var httpException = exception as HttpException;

            string Message = exception.Message;
            string Details = String.Format("Source: {0}\r\nStackTrace: {1}", exception.Source, exception.StackTrace);

            if (exception.InnerException != null)
            {
                Message += " " + exception.InnerException.Message;
                Details += String.Format("\r\nSource: {0}\r\nStackTrace: {1}", exception.InnerException.Source, exception.InnerException.StackTrace);
            }


            try
            {
                AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "Unhandled exception: " + Message, AuditEvent.GetSessionDetails(Details));
            }
            catch
            {


            }

            if (HttpContext.Current.IsDebuggingEnabled || (User.Identity.IsAuthenticated && AppSession.IsMemberInAdminRole))
            {

            }
            else
            {
                Response.Clear();
                Server.ClearError();

                var routeData = new RouteData();
                routeData.Values["controller"] = "Errors";
                routeData.Values["action"] = "General";
                routeData.Values["exception"] = exception;
                Response.StatusCode = 500;

                if (httpException != null)
                {
                    Response.StatusCode = httpException.GetHttpCode();
                    switch (Response.StatusCode)
                    {
                        case 403:
                            routeData.Values["action"] = "Http403";
                            break;
                        case 404:
                            routeData.Values["action"] = "Http404";
                            break;
                    }
                }

                // Avoid IIS7 getting in the middle
                // http://blog.davebouwman.com/2011/04/21/custom-404-pages-for-asp-net-mvc-3/
                Response.TrySkipIisCustomErrors = true;

                IController errorsController = new ErrorsController();
                var rc = new RequestContext(new HttpContextWrapper(Context), routeData);
                errorsController.Execute(rc);
            }
        }

        public void Application_End()
        {
            // http://weblogs.asp.net/scottgu/archive/2005/12/14/433194.aspx
            HttpRuntime runtime = (HttpRuntime)typeof(System.Web.HttpRuntime).InvokeMember("_theRuntime",
                                                                                            BindingFlags.NonPublic
                                                                                            | BindingFlags.Static
                                                                                            | BindingFlags.GetField,
                                                                                            null,
                                                                                            null,
                                                                                            null);

            if (runtime == null)
                return;

            string shutDownMessage = (string)runtime.GetType().InvokeMember("_shutDownMessage",
                                                                             BindingFlags.NonPublic
                                                                             | BindingFlags.Instance
                                                                             | BindingFlags.GetField,
                                                                             null,
                                                                             runtime,
                                                                             null);

            string shutDownStack = (string)runtime.GetType().InvokeMember("_shutDownStack",
                                                                           BindingFlags.NonPublic
                                                                           | BindingFlags.Instance
                                                                           | BindingFlags.GetField,
                                                                           null,
                                                                           runtime,
                                                                           null);

            if (!EventLog.SourceExists(".NET Runtime"))
            {
                EventLog.CreateEventSource(".NET Runtime", "Application");
            }

            EventLog log = new EventLog();
            log.Source = ".NET Runtime";
            log.WriteEntry(String.Format("\r\n\r\n_shutDownMessage={0}\r\n\r\n_shutDownStack={1}",
                                         shutDownMessage,
                                         shutDownStack),
                                         EventLogEntryType.Error);
        }
    }

    public class MaintenaceModeConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            bool IsMemberInAdminRole = AppSession.IsMemberInAdminRole;

            if (AppSession.Parameters.GeneralMaintenanceEnabled.Value == "true")
            {

                string ReturnUrl = httpContext.Request.QueryString["ReturnUrl"];

                if (ReturnUrl == null)
                    ReturnUrl = httpContext.Request.Form["ReturnUrl"];

                if (ReturnUrl != null)
                {
                    ReturnUrl = ReturnUrl.ToLower();

                    if (AppSession.Parameters.GeneralSecretAdminUrl != null && AppSession.Parameters.GeneralSecretAdminUrl.Value.Length > 0)
                    {
                        string AdminPath = AppSession.Parameters.GeneralSecretAdminUrl.Value.ToLower();

                        if (ReturnUrl.IndexOf(AdminPath) >= 0 || ReturnUrl.IndexOf("/admin") >= 0)
                            return true;
                    }
                    else if (ReturnUrl.IndexOf("/admin") >= 0)
                    {
                        return true;
                    }

                }

                if (httpContext.Request.Url.AbsoluteUri.ToLower().IndexOf("signout") < 0)
                    if (AppSession.Parameters.GeneralMaintenanceUrl != null && AppSession.Parameters.GeneralMaintenanceUrl.Value.Length > 0)
                        httpContext.Response.Redirect(AppSession.Parameters.GeneralMaintenanceUrl.Value);
                    else
                        httpContext.Response.Redirect("Offline");
                else
                    return true;

                return false;
            }
            else
                return true;
        }
    }

    public class LocalhostConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            return httpContext.Request.IsLocal;
        }
    }

    public class AdminRoleConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            return AppSession.IsMemberInAdminRole;
        }
    }

}