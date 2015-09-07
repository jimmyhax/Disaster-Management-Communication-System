using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Web.App
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            routes.MapPageRoute("Home", "Home_Dashboard", "~/Home_Dashboard.aspx");

            routes.MapPageRoute("Alerts", "Alerts_Dashboard", "~/Modules/Alerts/Alerts_Dashboard.aspx");
            
            routes.MapPageRoute("Clients", "Clients_Dashboard", "~/Modules/Clients/Clients_Dashboard.aspx");
            routes.MapPageRoute("Register_Clients", "Register_Client", "~/Modules/Clients/Register_Client.aspx");

            routes.MapPageRoute("Evacuation", "Evacuation_Dashboard", "~/Modules/Evacuation/Evacuation_Dashboard.aspx");
            
            routes.MapPageRoute("Resource_Allocation", "Resource_Allocation_Dashboard", "~/Modules/Resource_Allocation/Resource_Allocation_Dashboard.aspx");

            //routes.MapPageRoute("CustomerDetails", "Customers/{CustomerId}", "~/CustomerDetails.aspx");
        
        }
    }
}
