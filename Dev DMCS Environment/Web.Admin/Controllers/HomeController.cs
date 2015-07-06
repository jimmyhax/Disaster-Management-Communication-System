using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;

namespace Web.Admin.Controllers
{
    [CompressFilter]
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            if(User != null && User.Identity != null && User.Identity.IsAuthenticated)
            {
                if (AppSession.IsMemberInAdminRole)
                {
                    String ReturnUrl = Request.QueryString["returnUrl"];
                    String RedirectTo = "";

                    if (ReturnUrl != null && ReturnUrl.Length > 0)
                    {
                        RedirectTo = ReturnUrl;
                    }
                    else if (AppSession.Parameters.RulesRedirectAfterLogout != null && AppSession.Parameters.RulesRedirectAfterLogout.Value.Length > 0)
                    {
                        if (AppSession.Parameters.GeneralMaintenanceEnabled.Value != "true")
                            RedirectTo = AppSession.Parameters.RulesRedirectAfterLogout.Value;
                        else
                            RedirectTo = Url.Content("~/SignOut");
                    }
                    else
                    {
                        RedirectTo = Url.Content("~/SignOut");
                    }


                    if (AppSession.Parameters.GeneralSecretAdminUrl.Value != null && AppSession.Parameters.GeneralSecretAdminUrl.Value.Length > 0)
                    {
                        if (Request.Url.AbsolutePath.ToLower().IndexOf(AppSession.Parameters.GeneralSecretAdminUrl.Value.ToLower()) < 0)
                        {
                            AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, "Secret admin UI is active. Member tries to enter admin UI by direct link: " + Request.Url.AbsoluteUri + " and will be redirected to " + RedirectTo);
                            return new RedirectResult(RedirectTo);
                        }

                        else if (Request.Url.AbsolutePath.ToLower().IndexOf("/admin") < 0)
                        {
                            AuditEvent.AppEventWarning(AppSession.Parameters.GeneralAdminEmail.Value, "Member tries to enter admin UI by direct link: " + Request.Url.AbsoluteUri + " and will be redirected to " + RedirectTo);
                            return new RedirectResult(RedirectTo);
                        }
                    }
                    
                    return View("HomeAdmin");
                }
                else
                    return View("HomeMember");
            }

            return View("HomePublic");
        }

        public ActionResult Offline()
        {
            return View("HomeMaintenance");
        }

    }
}
