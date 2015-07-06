using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Admin.Helpers;
using System.Drawing;
using System.IO;
using System.Text;

using Web.Admin.Models;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Logic.Utilities;
using System.Net.Mail;
using System.Net;
using Web.Admin.Logic;
using System.Web.Routing;

namespace Web.Admin.Controllers
{
    public class ParamNameValue {
        public String Name { get; set; }
        public String Value { get; set; }
        public String Type { get; set; }
    }

    [Authorize]
    [CompressFilter]
    [NoCacheAttribute]
    [CustomAuthorizeAttribute(Roles = "Admins")]
    public class SettingsController : BaseController
    {        
        public ActionResult Index()
        {
            ParametersModel Model = new ParametersModel();
            return View("Index", Model);
        }
        
        public ActionResult ReloadLabels()
        {
            System.Threading.Thread.Sleep(500);
            AppSession.ReloadLabels();

            if (AppSession.FindLanguage(AppSession.Parameters.LanguagePublicDefault.Value) == null)
            {

            
            }
            else
            { 
            
            
            }

            return Json(new
            {
                Html = this.RenderPartialView(@"_LanguageList", this)

            }, JsonRequestBehavior.AllowGet);

        }

        public ActionResult SaveSettings(List<ParamNameValue> ParamNameValues)
        {
            List<ParamNameValue> WrongParams = new List<ParamNameValue>();
            string GeneralSecretAdminUrlOld = AppParams.GeneralSecretAdminUrl.Value;
            string AppApiSecretURL = AppParams.AppApiSecretURL.Value;

            foreach (ParamNameValue Param in ParamNameValues)
            {
                if (Param.Name == null || Param.Name.Length == 0)
                    continue;

                Parameter Parameter = Parameters.GetBy(Param.Name);
                Parameter.MemberID = Profile.Member.MemberID;
                
                string oldValue = Parameter.Value;
                Param.Value = Param.Value == null ? "" : Param.Value;

                if (Parameter.Type == ParameterType.Bool)
                {
                    if (Param.Value.ToLower() == "true")
                        Param.Value = Parameter.Value = "true";
                    else
                        Param.Value = Parameter.Value = "false";
                }
                else if (Parameter.Type == ParameterType.SmallInteger || Parameter.Type == ParameterType.RadioInteger)
                {
                    long value = -1;
                    bool result = long.TryParse(Param.Value, out value);
                    Parameter.Value = result ? Param.Value : Parameter.Value;

                    if (!result)
                        WrongParams.Add(Param);
                }
                else
                {
                    Parameter.Value = Param.Value;               
                }

                if (oldValue != Param.Value)
                    Parameter.Save();

                if (AppParams.GeneralAuditEnabled.Value == "true" && Param.Value != oldValue)
                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("Changed: {0} -> from \"{1}\" to \"{2}\"", Parameter.Name, oldValue, Parameter.Value)); 
            }

            AppParams.RefreshAppParameters();
            List<ParamNameValue> ParamValues =  new List<ParamNameValue>();
            List<Parameter> Params = Parameters.Get();

            ////////////////////////////////////////////
            // Change admin route            
            ////////////////////////////////////////////
            bool AdminRouteChaned = false;
            string RelativeAdminPath = "{controller}/{action}/{id}";
            if (AppParams.GeneralSecretAdminUrl != null && AppParams.GeneralSecretAdminUrl.Value.Length > 0 && GeneralSecretAdminUrlOld != AppParams.GeneralSecretAdminUrl.Value)
            {
                RouteCollection routes = RouteTable.Routes;
                using (routes.GetWriteLock())
                {
                    RelativeAdminPath = Path.Combine(AppSession.Parameters.GeneralSecretAdminUrl.Value.Replace("/", "\\"), RelativeAdminPath.Replace("/", "\\")).Replace("\\", "/");

                    if (RelativeAdminPath[0] == '/')
                        RelativeAdminPath = RelativeAdminPath.Remove(0, 1);

                    Route route = (Route)routes["Admin-Secret-Path"];
                    route.Url = RelativeAdminPath;            
                     
                }

                // If admin route changed redirect admin to correct url
                AdminRouteChaned = true;
            }
            else if ((AppParams.GeneralSecretAdminUrl == null || AppParams.GeneralSecretAdminUrl.Value.Length == 0) && GeneralSecretAdminUrlOld != AppParams.GeneralSecretAdminUrl.Value)
            { 
               RouteCollection routes = RouteTable.Routes;
               using (routes.GetReadLock())
               {
                   Route route = (Route)routes["Admin-Secret-Path"];
                   route.Url = "Admin/" + RelativeAdminPath;            
               }

               AdminRouteChaned = true;
            }

            ////////////////////////////////////////////
            // Change API route            
            ////////////////////////////////////////////
            bool APIRouteChaned = false;
            string RelativeAPIPath = "{action}/{id}";
            if (AppParams.AppApiSecretURL != null && AppParams.GeneralSecretAdminUrl.Value.Length > 0 && AppApiSecretURL != AppParams.AppApiSecretURL.Value)
            {
                RouteCollection routes = RouteTable.Routes;
                using (routes.GetWriteLock())
                {
                    RelativeAPIPath = Path.Combine(AppSession.Parameters.AppApiSecretURL.Value.Replace("/", "\\"), RelativeAPIPath.Replace("/", "\\")).Replace("\\", "/");

                    if (RelativeAdminPath[0] == '/')
                        RelativeAdminPath = RelativeAPIPath.Remove(0, 1);

                    Route route = (Route)routes["API-Secret-Path"];
                    route.Url = RelativeAPIPath;

                }

                // If API route changed redirect admin to correct url
                APIRouteChaned = true;
            }
            else if ((AppParams.AppApiSecretURL == null || AppParams.AppApiSecretURL.Value.Length == 0) && AppApiSecretURL != AppParams.AppApiSecretURL.Value)
            {
                RouteCollection routes = RouteTable.Routes;
                using (routes.GetReadLock())
                {
                    Route route = (Route)routes["API-Secret-Path"];
                    route.Url = "Admin/API/" + RelativeAPIPath;
                }

                APIRouteChaned = true;
            }

           
            foreach(Parameter Param in Params)
                ParamValues.Add( new ParamNameValue{ Name = Param.Name, Value = Param.Value, Type = Param.Type.ToString()});

            
            string Message = "";
            string AdminUrlChanged = "";
            string APIUrlChanged = "";
            RequestResultModel _model = new RequestResultModel();

            if (AdminRouteChaned)
            {
                AdminUrlChanged = String.Format("<br/><strong>Admin URL has been changed. Click <a href=\"{0}\">here</a> to redirect to actual admin URL.</strong>", Url.Action("", "Settings"));
            }

            if (APIRouteChaned)
            {
                string Path = (AppParams.AppApiSecretURL.Value.Length > 0 ? AppParams.AppApiSecretURL.Value : "Admin/API");
                APIUrlChanged = String.Format("<br/>API URL has been changed. Please update all API clients. Here is base url now: <strong>{0}</strong>", Path);
            }


            if (WrongParams.Count == 0)
            {
                _model.Title = GetLabel("Account.Controller.Congrat");
                _model.InfoType = RequestResultInfoType.Success;
                _model.Message = "Application settngs have been saved." + AdminUrlChanged + APIUrlChanged;
                Message = this.RenderPartialView(@"_RequestResultDialogInLine", _model); 
            }
            else
            {
                _model.Title = GetLabel("Account.Controller.Warning");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = "Some parametrs have not been saved. Please check." + AdminUrlChanged + APIUrlChanged;
                Message = this.RenderPartialView(@"_RequestResultDialogInLine", _model); 
            }


            
            return Json(new
            {
                Message = Message,
                Settings = ParamValues,
            }, JsonRequestBehavior.AllowGet);
    
        }

        public JsonResult GetAddDomainDialog(int RoleID = 0)
        {
            return Json(new
            {
                Html = this.RenderPartialView(@"_AddDomain", null)

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetEditDomainDialog(int DomainID)
        {
            Domain _domain = Web.Admin.Logic.Collections.Domains.GetBy(DomainID);

            return Json(new
            {
                Html = this.RenderPartialView(@"_EditDomain", _domain),

            }, JsonRequestBehavior.AllowGet);
        }

        public ContentResult GetDomainList()
        {
            return Content(this.RenderPartialView(@"_DomainList", null), "html/text");
        }
    }
}
