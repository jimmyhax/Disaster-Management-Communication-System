using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Web.Admin.Models;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using System.Text.RegularExpressions;
using Web.Admin.Logic.Utilities;
using System.Text;

namespace Web.Admin.Controllers
{
    [Authorize]
    [CompressFilter]
    [CustomAuthorizeAttribute(Roles = "Admins")]
    public class ToolsController : BaseController
    {

        public ActionResult Index()
        {
            return View(new ParametersModel());
        }

        public ActionResult GenerateMachineKey(bool Audit)
        {
            System.Threading.Thread.Sleep(500);

            StringBuilder machineKey = new System.Text.StringBuilder();
            string key64byte = Web.Admin.Logic.Utilities.Tools.GenerateMachineKey(64);
            string key32byte = Web.Admin.Logic.Utilities.Tools.GenerateMachineKey(32);
            machineKey.Append("<machineKey \n");
            machineKey.Append("validationKey=\"" + key64byte + "\"\n");
            machineKey.Append("decryptionKey=\"" + key32byte + "\"\n");
            machineKey.Append("validation=\"SHA1\" decryption=\"AES\"");
            machineKey.Append("/>\n");
            String Key = machineKey.ToString();

            if (Audit)
            {
                AuditEvent.AddAppEvent(
                    new AuditEventItem
                    {
                        EventType = AuditEventType.Success,
                        IPAddress = Request.UserHostAddress,
                        MemberEmail = Profile.Member.Email,
                        Description = "Machine Key Generated: " + Key
                    }
                );
            }

            return Json(new
            {
                Message = "",
                Key = Key,

            }, JsonRequestBehavior.AllowGet);
        }

    }
}
