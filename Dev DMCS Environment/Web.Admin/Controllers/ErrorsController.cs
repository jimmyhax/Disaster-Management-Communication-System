using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Net;
using System.Net.Mail;

using Web.Admin.Models;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using System.Text.RegularExpressions;
using Web.Admin.Logic.Utilities;

using Web.Admin.Helpers;
using Web.Admin.Logic;


// http://stackoverflow.com/questions/5226791/custom-error-pages-on-asp-net-mvc3
// http://kitsula.com/Article/MVC-Custom-Error-Pages

namespace Web.Admin.Controllers
{
    [CompressFilter]
    public class ErrorsController : BaseController
    {
        public ActionResult General(Exception exception)
        {
            return View(@"_GeneralException500");
        }

        public ActionResult Http404()
        {
            return View("_PageNotFound404");
        }

        public ActionResult Http403()
        {
            return View("_Forbidden403");
        }

    }
}
