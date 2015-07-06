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
    public class DomainInfo
    {
        public int DomainID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public DomainInfo()
        {
            DomainID = 0;
            Description = "";
        }
    }

    [Authorize]
    [CompressFilter]
    [CustomAuthorizeAttribute(Roles = "Admins")]
    public class DomainsController : BaseController
    {
        public ActionResult Index()
        {
            return View();
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

        public JsonResult SaveDomain(DomainInfo Info)
        {
            RequestResultModel _model = new RequestResultModel();

            if (Info.Name == null || Info.Name.Trim().Length == 0)
            {
                _model = new RequestResultModel();
                _model.Title = "Warning";
                _model.Message = "Name is empty. Please, enter domain name.";
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }
           

            if (Info.DomainID > 0)
            {
                Domain domain = Web.Admin.Logic.Collections.Domains.GetBy(Info.DomainID);
                Domain domainExists = Web.Admin.Logic.Collections.Domains.GetByName(Info.Name);

                // The domain has been deleted.
                if (domain.DomainID <= 0)
                {
                    _model.Title = "Warning";
                    _model.Message = String.Format("Domain '{0}' doesn't exist. Please, refresh role list and try again.", domainExists.Name);
                    AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                // The domain already esists.
                if (domainExists.DomainID > 0 && Info.DomainID != domainExists.DomainID)
                {
                    _model.Title = "Warning";
                    _model.Message = String.Format("Domain '{0}' already exists. Please, change domain name and try again.", domainExists.Name);
                    AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                domain.Name = Info.Name;
                domain.Description = Info.Description;
                domain.Save();

                _model = new RequestResultModel();
                _model.Message = String.Format("Domain \"{0}\"has been updated.", domain.Name);
                _model.HideInSeconds = 4000;
                AuditEvent.AppEventSuccess(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.PageInline,
                    Html = this.RenderPartialView(@"_RequestResultPageInLine", _model)

                }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                Domain domainExists = Web.Admin.Logic.Collections.Domains.GetByName(Info.Name);

                // The domain already esists.
                if (domainExists.DomainID > 0)
                {
                    _model.Title = "Warning";
                    _model.Message = String.Format("Domain '{0}' already exists. Please, change domain name and try again.", domainExists.Name);
                    _model.InfoType = RequestResultInfoType.ErrorOrDanger;

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                Domain Domain = new Domain();
                Domain.Name = Info.Name;
                Domain.Description = Info.Description;
                Domain.Save();

                _model.Message = String.Format("New domain \"{0}\" has been created.", Domain.Name);

                return Json(new
                {
                    NotifyType = NotifyType.PageInline,
                    Html = this.RenderPartialView(@"_RequestResultPageInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult RemoveDomain(int[] RemoveDomains)
        {
            DomainListModel _model = new DomainListModel();
            List<Domain> _deleted = new List<Domain>();

            foreach (int DomainID in RemoveDomains)
            {
                Domain domain = Web.Admin.Logic.Collections.Domains.GetBy(DomainID);
                List<ProfileField> _profileFields = ProfileFields.GetByDomain(DomainID);
                
                if (ProfileFields.GetByDomain(domain.DomainID).Count > 0)
                {
                    domain.WasDeleted = false;
                    domain.UIMessage = "The domain has not been deleted. Attached fields: ";
                    foreach (ProfileField profileField in _profileFields)
                    {
                        domain.UIMessage += "<u>" + profileField.FieldName + "</u>&nbsp;";
                    }
                                        domain.UIMessageType = UIMessageType.Warning;
                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleContainsMembers, domain.Name));
                }
                else
                {
                    if (domain.Delete())
                    {
                        domain.WasDeleted = true;
                        domain.UIMessage = "The domain has been deleted.";
                        domain.UIMessageType = UIMessageType.Success;
                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleDeleted, domain.Name));
                    }
                }

                _deleted.Add(domain);
            }

            _model.Domains = _deleted;

            return Json(new
            {
                NotifyType = NotifyType.Dialog,
                Html = this.RenderPartialView(@"_RemoveDomainsResult", _model)

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetDomains(RolePaginInfo PaginInfo)
        {
            DomainListFilter Filter = new DomainListFilter();
            Filter.CurrentPage = PaginInfo.CurrentPage;
            Filter.ItemsPerPage = PaginInfo.ItemsPerPage;
            Filter.SortOrderAsc = PaginInfo.SortOrderAsc;
            Filter.SortColumn = PaginInfo.SortColumn;

            Filter.SortColumnName = "DomainID";
            switch (PaginInfo.SortColumn)
            {
                case 1: Filter.SortColumnName = "DomainID"; break;
                case 2: Filter.SortColumnName = "Name"; break;
                case 3: Filter.SortColumnName = "Description"; break;
                case 4: Filter.SortColumnName = "Created"; break;
                case 5: Filter.SortColumnName = "Modified"; break;
            }

            var totalItems = 0;
            var domains = Web.Admin.Logic.Collections.Domains.Get(Filter, out totalItems);

            return Json(new
            {
                Html = this.RenderPartialView("_DomainList", new DomainListModel(PaginInfo.HolderName, domains, Filter, totalItems))
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRemoveDomainDialog(int[] RmoveDomains)
        {
            DomainListModel _model = new DomainListModel();
            foreach (int DomainID in RmoveDomains)
            {
                Domain domain = Web.Admin.Logic.Collections.Domains.GetBy(DomainID);
                _model.Domains.Add(domain);
            }

            return Json(new
            {
                Html = this.RenderPartialView(@"_RemoveDomains", _model),

            }, JsonRequestBehavior.AllowGet);
        }
    }
}
