using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Admin.Helpers;
using System.Drawing;
using System.IO;

using Web.Admin.Models;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Logic.Utilities;
using System.Text.RegularExpressions;

namespace Web.Admin.Controllers
{    
    [Authorize]
    public class AuditEventPaginInfo
    {
        public string HolderName { get; set; }
        public int CurrentPage { get; set; }
        public int ItemsPerPage { get; set; }
        public int SortColumn { get; set; }
        public bool SortOrderAsc { get; set; }
        public string Search { get; set; }

        public AuditEventPaginInfo()
        {

        }
    }

    [Authorize]
    [CompressFilter]
    [CustomAuthorizeAttribute(Roles = "Admins")]
    public class AuditController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult RemoveAuditEvents(List<int> Items)
        {
            RequestResultModel Model = new RequestResultModel();

            if (Items != null)
            {
                foreach (int Item in Items)
                    AuditEvents.GetBy(Item).Delete();
                
                Model.Message = "Selected audit items have been removed successfully.";
            }
            else
            {
                AuditEvents.RemoveAll();
                Model.Message = "All audit items have been removed successfully.";
            }

            Model.InfoType = RequestResultInfoType.Success;
            Model.Title = "Removing Audit Items";
            

            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = this.RenderPartialView(@"_RequestResultPageInLine", Model)

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAuditEvents(AuditEventPaginInfo PaginInfo)
        {
            AuditEventListFilter Filter = new AuditEventListFilter();
            Filter.CurrentPage = PaginInfo.CurrentPage;
            Filter.ItemsPerPage = PaginInfo.ItemsPerPage;
            Filter.SortOrderAsc = PaginInfo.SortOrderAsc;
            Filter.SortColumn = PaginInfo.SortColumn;
            Filter.Search = HttpUtility.UrlDecode(PaginInfo.Search);

            Filter.SortColumnName = "EventID";
            switch (PaginInfo.SortColumn)
            {
                case 1: Filter.SortColumnName = "EventType"; break;
                case 2: Filter.SortColumnName = "Created"; break;
                case 3: Filter.SortColumnName = "EventID"; break;
                case 4: Filter.SortColumnName = "EventSource"; break;
                case 5: Filter.SortColumnName = "IPAddress"; break;
                case 6: Filter.SortColumnName = "MemberEmail"; break;
                case 7: Filter.SortColumnName = "Description"; break;
            }
       
            var totalItems = 0;
            var events = Web.Admin.Logic.Collections.AuditEvents.Get(Filter, out totalItems);

            return Json(new
            {
                Html = this.RenderPartialView("_AuditEventList", new AuditEventListModel(PaginInfo.HolderName, events, Filter, totalItems))
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAuditEventDetailsDialog(int AuditEventItem)
        {
            AuditEventModel Model = new AuditEventModel();
            AuditEvent AuditEvent = Web.Admin.Logic.Collections.AuditEvents.GetBy(AuditEventItem);
            Model.AuditEventItems = AuditEvent.GetAuditEventDetails(AuditEvent);
            Model.AuditEvent = AuditEvent;

            return Json(new
            {
                Html = this.RenderPartialView(@"_AuditEventDetails", Model),

            }, JsonRequestBehavior.AllowGet);
        }
    }
}
