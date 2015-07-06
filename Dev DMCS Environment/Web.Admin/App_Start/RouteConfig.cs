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
namespace Web.Admin
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            // http://stackoverflow.com/questions/4624190/mvc-does-the-favicon-ico-also-look-for-a-controller
            routes.IgnoreRoute("favicon.ico");

            // http://stackoverflow.com/questions/487230/serving-favicon-ico-in-asp-net-mvc
            routes.IgnoreRoute("{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" });

            // Ignore resources.
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("Account-SignIn", "SignIn", new { controller = "Account", action = "SignIn" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-SignOut", "SignOut", new { controller = "Account", action = "SignOut" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-SignInWith", "SignInWith", new { controller = "Account", action = "SignInWith" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });

            routes.MapRoute("Account-Forgot-Password", "ForgotPassword", new { controller = "Account", action = "ForgotPassword" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-Create-Account", "SignUp", new { controller = "Account", action = "CreateAccount" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-Register", "Register", new { controller = "Account", action = "Register" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-Activate", "Activate", new { controller = "Account", action = "Activate" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-SendChangePasswordLink", "SendChangePasswordLink", new { controller = "Account", action = "SendChangePasswordLink" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-ChangePassword", "ChangePassword", new { controller = "Account", action = "ChangePassword" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });
            routes.MapRoute("Account-ChangePasswordAccount", "ChangePasswordAccount", new { controller = "Account", action = "ChangePasswordAccount" }, new { IsMaintenaceMode = new MaintenaceModeConstraint() });

            routes.MapRoute("Home-Offile-Mode", "Offline", new { controller = "Home", action = "Offline" });

            ////////////////////////////////////////////
            // Setup administrative secret url routes
            ////////////////////////////////////////////
            string RelativeAdminPath = "{controller}/{action}/{id}";
            if (AppSession.Parameters.GeneralSecretAdminUrl != null && AppSession.Parameters.GeneralSecretAdminUrl.Value.Length > 0)
            {
                RelativeAdminPath = Path.Combine(AppSession.Parameters.GeneralSecretAdminUrl.Value.Replace("/", "\\"), RelativeAdminPath.Replace("/", "\\")).Replace("\\", "/");

                if (RelativeAdminPath[0] == '/')
                    RelativeAdminPath = RelativeAdminPath.Remove(0, 1);
            }
            else
                RelativeAdminPath = "Admin/" + RelativeAdminPath;

            routes.MapRoute(
               "Admin-Secret-Path", // Route name
               RelativeAdminPath, // URL with parameters
               new { controller = "Home", action = "Index", id = UrlParameter.Optional }
             );

            ////////////////////////////////////////////
            // Setup API secret url routes
            ////////////////////////////////////////////
            string RelativeAPIPath = "{action}/{id}";
            if (AppSession.Parameters.AppApiSecretURL != null && AppSession.Parameters.AppApiSecretURL.Value.Length > 0)
            {
                RelativeAPIPath = Path.Combine(AppSession.Parameters.AppApiSecretURL.Value.Replace("/", "\\"), RelativeAPIPath.Replace("/", "\\")).Replace("\\", "/");

                if (RelativeAPIPath[0] == '/')
                    RelativeAPIPath = RelativeAPIPath.Remove(0, 1);
            }
            else
                RelativeAPIPath = "Admin/API/" + RelativeAPIPath;

            routes.MapRoute(
               "API-Secret-Path", // Route name
               RelativeAPIPath, // URL with parameters
               new { controller = "API", action = "Ping", id = UrlParameter.Optional }
             );


            ////////////////////////////////////////////
            // Setup defaults.
            ////////////////////////////////////////////
            routes.MapRoute(
             "Default", // Route name
             "{controller}", // URL with parameters
              new { controller = "Home", action = "Index", id = UrlParameter.Optional },
              new { IsMaintenaceMode = new MaintenaceModeConstraint() });
        }

    }
}
