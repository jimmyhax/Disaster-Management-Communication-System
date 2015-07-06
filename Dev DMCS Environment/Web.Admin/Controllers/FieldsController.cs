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
using System.Globalization;

namespace Web.Admin.Controllers
{
    [Authorize]
    [CompressFilter]
    [CustomAuthorizeAttribute(Roles = "Admins")]
    public class FieldsController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetEditFieldGroupDialog(int GroupID)
        {
            ProfileFieldGroup fieldGroup = ProfileFieldGroups.GetBy(GroupID);
            ProfileFieldGroupModel _model = new ProfileFieldGroupModel(fieldGroup);

            return Json(new
            {
                Html = this.RenderPartialView(@"_EditFieldGroup", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAddFieldGroupDialog(int ID)
        {
            return Json(new
            {
                Html = this.RenderPartialView(@"_AddFieldGroup", null),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAddFieldDialog(int GroupID)
        {
            ProfileFieldGroup fieldGroup = ProfileFieldGroups.GetBy(GroupID);
            ProfileFieldGroupModel _model = new ProfileFieldGroupModel(fieldGroup);

            return Json(new
            {
                Html = this.RenderPartialView(@"_AddField", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetEditFieldDialog(int GroupID, int FieldID, int TabIndex)
        {
            ProfileField Field = ProfileFields.GetBy(FieldID);
            ProfileFieldGroupFieldModel _model = new ProfileFieldGroupFieldModel(Field);
            _model.tabIndex = TabIndex;

            return Json(new
            {
                Html = this.RenderPartialView(@"_EditField", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveFieldGroup(int GroupID, string Name, string Description, string Order, bool IsActive, bool AdminUseOnly)
        {
            ProfileFieldGroup fieldGroup = ProfileFieldGroups.GetBy(GroupID);
            String Message = "";

            if (fieldGroup.FieldGroupName.Trim().ToLower() != Name.Trim().ToLower())
            {
                if (ProfileFieldGroups.GetByName(Name.Trim()).FieldGroupID > 0)
                    Message = "The group \"" + Name + "\" already exists.";
            }

            if (fieldGroup.FieldGroupName.Trim().ToLower().Length == 0)
                    Message = "The group name should not be empty.";


            if (Message != "")
            {
                RequestResultModel _model = new RequestResultModel();
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = Message;
                AuditEvent.AppEventWarning(Profile.Member.Email, Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model),

                }, JsonRequestBehavior.AllowGet);
            }


            fieldGroup.FieldGroupName = Name;
            fieldGroup.FieldGroupDescription = Description;
            fieldGroup.IsActive = IsActive ? 1 : 0;
            fieldGroup.AdminUseOnly = AdminUseOnly ? 1 : 0;
            fieldGroup.Save();

            if (GroupID > 0)
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" profile group has been updated.", Name));
            else
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" profile group has been added.", Name));

            if (Order != "")
                ProfileFieldGroups.UpdateOrder(Order);

            return Json(new
            {
                NotifyType = -1,
                Html = "",

            }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult AddFieldGroup(int GroupID, string Name, string Description, string Order, bool IsActive, bool AdminUseOnly)
        {
            string Message = "";            

            if (ProfileFieldGroups.GetByName(Name.Trim()).FieldGroupID > 0)
                Message = "The group \"" + Name + "\" already exists.";

            if (Name.Trim().ToLower().Length == 0)
                Message = "The group name should not be empty.";


            if (Message != "")
            {
                RequestResultModel _model = new RequestResultModel();
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = Message;

                AuditEvent.AppEventWarning(Profile.Member.Email, Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model),

                }, JsonRequestBehavior.AllowGet);
            }

            ProfileFieldGroup fieldGroup = new ProfileFieldGroup();
            
            fieldGroup.OrderID = 0;
            fieldGroup.FieldGroupName = Name;
            fieldGroup.FieldGroupDescription = Description;
            fieldGroup.IsActive = IsActive ? 1 : 0;
            fieldGroup.AdminUseOnly = AdminUseOnly ? 1 : 0;
            fieldGroup.Save();

            if (GroupID > 0)
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" profile group has been updated.", Name));
            else
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" profile group has been added.",Name));


            if (Order != "")
            {
                Order = Order.Replace("this", fieldGroup.FieldGroupID.ToString());
                ProfileFieldGroups.UpdateOrder(Order);
            }

            return Json(new
            {
                NotifyType = -1,
                Html = "",

            }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult RemoveFieldGroup(int GroupID)
        {
            ProfileFieldGroup fieldGroup = ProfileFieldGroups.GetBy(GroupID);
            RequestResultModel _model = new RequestResultModel();
           
           if(fieldGroup.FieldGroupID > 0)
           {
                 fieldGroup.Delete();

                _model.InfoType = RequestResultInfoType.Success;
                _model.Message = "The group \"" + fieldGroup.FieldGroupName + "\" has been removed.";

                if (GroupID > 0)
                    AuditEvent.AppEventSuccess(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.PageInline,
                    Html = this.RenderPartialView(@"_RequestResultPageInLine", _model),

                }, JsonRequestBehavior.AllowGet);
            }
           else
           {
                _model.InfoType = RequestResultInfoType.Success;
                _model.Message = "The group doesn't exist.";

                AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.PageInline,
                    Html = this.RenderPartialView(@"_RequestResultPageInLine", _model),

                }, JsonRequestBehavior.AllowGet);
            
           }

        }

        public JsonResult SaveField(int FieldID, String Name, String FieldType, String Comment, String PossibleValues, String SelectText, String IsMandatory, String ShowInSignup, String SortValues, String IsActive, String AdminUseOnly, String VerticalLayout, int[] SelectedDomains, int[] SelectedRoles)
        {
            String Message = "";

            ProfileField profileField = ProfileFields.GetByName(Name);
            
            if (profileField.FieldID > 0 && profileField.FieldName.Trim().ToLower() == Name.Trim().ToLower() && FieldID != profileField.FieldID)
                Message = "The field \"" + Name + "\" already exists.";

            if (Name.Trim().ToLower().Length == 0)
                Message = "The field name should not be empty.";


            if (Message != "")
            {
                RequestResultModel _model = new RequestResultModel();
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = Message;
                AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model),

                }, JsonRequestBehavior.AllowGet);
            }


            profileField = ProfileFields.GetBy(FieldID);
            profileField.FieldName = Name;
            profileField.Comment = Comment;
            profileField.FieldTypeID = (ProfileFieldTypeEnum) int.Parse(FieldType);
            profileField.PossibleValues = PossibleValues;
            profileField.TextSelectValue = SelectText;
            profileField.IsMandatory = (IsMandatory == "True" ? 1 : 0);
            profileField.ShowInSignUp = (ShowInSignup == "True" ? 1 : 0);
            profileField.SortValues = SortValues == "True" ? 1 : 0;
            profileField.IsActive = IsActive == "True" ? 1 : 0;
            profileField.AdminUseOnly = AdminUseOnly == "True" ? 1 : 0;
            profileField.VerticalLayout = VerticalLayout == "True" ? 1 : 0;
            profileField.Save();


             List<Domain> _domains = Domains.Get();
             foreach (Domain _domain in _domains)
             {
                 DomainProfileField _domainField = new DomainProfileField();
                 _domainField.DomainID = _domain.DomainID;
                 _domainField.ProfileFieldID = profileField.FieldID;

                 if (SelectedDomains != null)
                 {
                     if (SelectedDomains.Where(t => t == _domain.DomainID).FirstOrDefault() != default(int))
                         _domainField.Save();
                     else
                         _domainField.Delete();
                 }
                 else
                     _domainField.Delete();
             }

            List<Role> _roles = Web.Admin.Logic.Collections.Roles.Get();
            foreach (Role _role in _roles)
            {
                RoleProfileField _roleField = new RoleProfileField();
                _roleField.RoleID = _role.RoleID;
                _roleField.ProfileFieldID = profileField.FieldID;

                if (SelectedRoles != null)
                {
                    if (SelectedRoles.Where(t => t == _role.RoleID).FirstOrDefault() != default(int))
                        _roleField.Save();
                    else
                        _roleField.Delete();
                }
                else
                {
                    _roleField.Delete();
                }
            }

            if (FieldID > 0)
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" profile field has been updated.", Name));
            else
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" profile field has been added.", Name));

            return Json(new
            {
                NotifyType = -1,
                Html = "",

            }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult AddField(String Name, String FieldType, String Comment, String PossibleValues, String SelectText, String IsMandatory, String ShowInSignup, String SortValues, String IsActive, String AdminUseOnly, String VerticalLayout, int FieldGroupID, bool Encrypted, int[] SelectedDomains, int[] SelectedRoles)
        {
            ProfileField profileField = ProfileFields.GetByName(Name);
            String Message = "";

            if (profileField.FieldID > 0 && profileField.FieldName.Trim().ToLower() == Name.Trim().ToLower())
                Message = "The field \"" + Name + "\" already exists.";

            if (Name.Trim().ToLower().Length == 0)
                Message = "The field name should not be empty.";

            if (Message != "")
            {
                RequestResultModel _model = new RequestResultModel();
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = Message;

                AuditEvent.AppEventWarning(Profile.Member.Email, Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model),

                }, JsonRequestBehavior.AllowGet);
            }


            profileField.FieldName = Name;
            profileField.Comment = Comment;
            profileField.FieldTypeID = (ProfileFieldTypeEnum)int.Parse(FieldType);
            profileField.PossibleValues = PossibleValues;
            profileField.TextSelectValue = SelectText;
            profileField.IsMandatory = (IsMandatory == "True" ? 1 : 0);
            profileField.ShowInSignUp = (ShowInSignup == "True" ? 1 : 0);
            profileField.SortValues = SortValues == "True" ? 1 : 0;
            profileField.IsActive = IsActive == "True" ? 1 : 0;
            profileField.AdminUseOnly = AdminUseOnly == "True" ? 1 : 0;
            profileField.VerticalLayout = VerticalLayout == "True" ? 1 : 0;
            profileField.FieldGroupID = FieldGroupID;
            profileField.Encrypted = Encrypted == true ? 1 : 0;
            profileField.Save();

            if (SelectedDomains != null)
            {
                List<Domain> _domains = Domains.Get();
                foreach (Domain _domain in _domains)
                {
                    DomainProfileField _domainField = new DomainProfileField();
                    _domainField.DomainID = _domain.DomainID;
                    _domainField.ProfileFieldID = profileField.FieldID;

                    if (SelectedDomains.Where(t => t == _domain.DomainID).FirstOrDefault() != default(int))
                        _domainField.Save();
                }
            }

            if (SelectedRoles != null)
            {
                List<Role> _roles = Web.Admin.Logic.Collections.Roles.Get();
                foreach (Role _role in _roles)
                {
                    RoleProfileField _roleField = new RoleProfileField();
                    _roleField.RoleID = _role.RoleID;
                    _roleField.ProfileFieldID = profileField.FieldID;

                    if (SelectedRoles.Where(t => t == _role.RoleID).FirstOrDefault() != default(int))
                        _roleField.Save();
                }
            }

            AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" field has been added.", Name));

            return Json(new
            {
                NotifyType = -1,
                Html = "",

            }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult RemoveProfileFields(int[] Fields)
        {
            foreach(int Field in Fields)
            {
                ProfileField field = ProfileFields.GetBy(Field);
                field.Delete();
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The \"{0}\" field has been deleted.", field.FieldName));
            }

            RequestResultModel _model = new RequestResultModel();
            _model.InfoType = RequestResultInfoType.Success;
            _model.Message = "All selected fields (and their data) have been deleted.";

            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = this.RenderPartialView(@"_RequestResultPageInLine", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SortFields(String Fields,int GroupID)
        {

            ProfileFields.UpdateOrder(Fields, GroupID);
            
            RequestResultModel _model = new RequestResultModel();
            _model.InfoType = RequestResultInfoType.Success;

            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = "",

            }, JsonRequestBehavior.AllowGet);
        }

        public ContentResult GetMemberFields()
        {
            String Json = Roles.JsonCollection(Roles.Get());
            return Content(this.RenderPartialView(@"MemberFields", null),"text/html");
        }

        public JsonResult SetIsActive(bool Flag, int FieldID)
        {
            ProfileFields.SetIsActive(Flag, FieldID);

            RequestResultModel _model = new RequestResultModel();
            _model.InfoType = RequestResultInfoType.Success;

            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = "",

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SetAdminUseOnly(bool Flag, int FieldID)
        {
            ProfileFields.SetAdminUseOnly(Flag, FieldID); ;

            RequestResultModel _model = new RequestResultModel();
            _model.InfoType = RequestResultInfoType.Success;

            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = "",

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SetShowInSignUp(bool Flag, int FieldID)
        {
            ProfileFields.SetShowInSignUp(Flag, FieldID);

            RequestResultModel _model = new RequestResultModel();
            _model.InfoType = RequestResultInfoType.Success;

            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = "",

            }, JsonRequestBehavior.AllowGet);
        }
        
    }
}
