using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Controllers;
using System.Web.Mvc;
using System.Web.Routing;
using System.Diagnostics;


namespace Web.Admin.Filters
{
    public class LogActionFilter : ActionFilterAttribute
    {
        protected bool SkipAction { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated && AppSession.DemoMode)
            {
                bool RequestMethod = filterContext.HttpContext.Request.HttpMethod.ToUpper() == "POST";

                bool RequestDialog = filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("dialog");

                bool RequestAccounts = filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("/account/");

                bool RequestProfile = filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("/profile") && !filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("reset");

                if (RequestMethod && AppSession.DemoMode && !RequestDialog && !RequestAccounts && !RequestProfile &&
                    (
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("add") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("save") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("remove") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("delete") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("reset") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("assign") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("sort") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("generate") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("set") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("import") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("send") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("download") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("reset") ||
                        filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("update"))
                    ) {

                    filterContext.HttpContext.Response.Clear();
                    filterContext.HttpContext.Response.Write("{ \"NotifyType\":1, \"Html\":\"<div class='alert alert-warning alert-dismissible' role='alert' style='box-shadow: rgba(0, 0, 0, 0.14902) 0px 0px 0px 4px;'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Warning!</strong> This is a demo application mode. You are not able to save changes.</div>\"}");
                    filterContext.HttpContext.Response.ContentType = "application/json";
                    filterContext.HttpContext.Response.Flush();
                    filterContext.HttpContext.Response.Close();
                    filterContext.HttpContext.Response.End();

                    filterContext.Result = new EmptyResult();
                    SkipAction = true;
                }
            }

            Log("OnActionExecuting", filterContext.RouteData);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            Log("OnActionExecuted", filterContext.RouteData);
        }

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            Log("OnResultExecuting", filterContext.RouteData);
        }

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            Log("OnResultExecuted", filterContext.RouteData);
        }

        private void Log(string methodName, RouteData routeData)
        {
            var controllerName = routeData.Values["controller"];
            var actionName = routeData.Values["action"];
            var message = string.Format("{0} controller: {1} action: {2}", methodName, controllerName, actionName);
            Debug.WriteLine(message, "Action Filter Log");
        }
    }
}