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
    public class MemberInfo
    {
        public long MemberID{get;set;}
        public String Name{get;set;}
        public String Email{get;set;}
        public String Password{get;set;}
        public String Confirmation{ get; set; }
        public ProfileFieldInfo[] FieldInfo { get; set; }
        public String TimeZoneID { get; set; }
        public int[] Domains { get; set; }
    }

    [Authorize]
    [CompressFilter]
    [CustomAuthorizeAttribute(Roles = "Admins")]
    public class MembersController : BaseController
    {
        public class MemberPaginInfo
        {
            public string HolderName { get; set; }
            public int CurrentPage { get; set; }
            public int ItemsPerPage { get; set; }
            public int SortColumn { get; set; }
            public bool SortOrderAsc { get; set; }
            public List<int> AlphabetFilter { get; set; }
            public List<int> RolesFilter { get; set; }
            public string RolesFilterCondition { get; set; }
            public string Search { get; set; }

            public MemberPaginInfo()
            {
               AlphabetFilter = new List<int>();
               RolesFilter = new List<int>(); 
            }
        }

        public class SetMembersGroup{
            public int GroupID{get;set;}
            public List<int> MemberID { get; set; }
        }

        public ActionResult Index()
        {
            return View("Members");
        }

        public ActionResult Members()
        {
            return View("Members");
        }

        public ActionResult SetMemberGroup(SetMembersGroup Info)
        {
            foreach (long itemID in Info.MemberID)
            {
                MemberRole _item = new MemberRole();
                _item.RoleID = Info.GroupID;
                _item.MemberID = itemID;
                _item.Save();

                Member Member = Web.Admin.Logic.Collections.Members.GetBy(itemID);
                Role Role = Web.Admin.Logic.Collections.Roles.GetBy(Info.GroupID);
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberAssigToRole, Member.Name, Member.Email, Role.Name));
            }

            return Json(new
            {
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetNewMemberDialog(long MemberID=-1)
        {
            return Json(new
            {
                Html = this.RenderPartialView(@"_AddMember", null),

            }, JsonRequestBehavior.AllowGet);
        }
        
        public JsonResult GetEditMemberDialog(int MemberID)
        {
            Member member = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
            MemberListModel _model = new MemberListModel();
            _model.Members.Add(member);

            return Json(new
            {
                Html = this.RenderPartialView(@"_EditMember", _model),

            }, JsonRequestBehavior.AllowGet);
        }
        
        public JsonResult GetRemoveMemberDialog(int[] RemoveMembers)
        {
            MemberListModel _model = new MemberListModel();
            foreach (int MemberID in RemoveMembers)
            {
                Member role = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
                _model.Members.Add(role);
            }

            return Json(new
            {
                Html = this.RenderPartialView(@"_RemoveMembers", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveMember(MemberInfo Info)
        {
            RequestResultModel _model = new RequestResultModel();
            _model.InfoType = RequestResultInfoType.ErrorOrDanger;
            _model.Message = "";
            
            Member member = null;

            if (AppSession.IsEmail(Info.Name))
            {
                _model.Message += String.Format("<li>{0}</<li>", "The member's name looks like an e-mail address. Please change it.");
            }

            if (Info.Name == null || Info.Name.Trim().Length == 0 ||
                ((Info.Password == null || Info.Password.Trim().Length == 0 ) && Info.MemberID == 0) ||
                Info.Email == null || Info.Email.Trim().Length == 0 ||
                Info.Password != Info.Confirmation ||
                !AppSession.IsEmail(Info.Email))
            {
                if (Info.Name == null || Info.Name.Trim().Length == 0)
                    _model.Message += String.Format("<li>{0}</li>","Name is empty. Please, enter member name.");

                if ((Info.Password == null || Info.Password.Trim().Length == 0) && Info.MemberID == 0) 
                    _model.Message += String.Format("<li>{0}</li>","Password is empty. Please, enter member password.");

                if (Info.Email == null || Info.Email.Trim().Length == 0)
                    _model.Message += String.Format("<li>{0}</li>","Email is empty. Please, enter member email.");

                if (Info.Email!= null && !AppSession.IsEmail(Info.Email))
                    _model.Message += String.Format("<li>{0}</li>","Email has wrong format. Please, check it.");

                if (Info.Password != Info.Confirmation)
                    _model.Message += String.Format("<li>{0}</li>","Password does not match confirmation. Please, check it.");

                Member Member = Web.Admin.Logic.Collections.Members.GetBy(Info.MemberID);
                AuditEvent.AppEventWarning(Profile.Member.Email, String.Format(AuditEvent.SavingMemberInfo, Member.Name, Member.Email, _model.Message));
            }

            // Check mandatory fields
            if (Info.FieldInfo != null)
            {
                foreach (ProfileFieldInfo Field in Info.FieldInfo)
                {
                    ProfileField profileField = ProfileFields.GetBy(int.Parse(Field.ID));
                    if (profileField.IsMandatory == 1 && (Field.Value == null || Field.Value.Trim().Length == 0))
                    {
                        _model.Message += String.Format("<li>{0}</li>", String.Format(GetLabel("Account.CreateAccount.Mandatory"), profileField.FieldName));
                    }

                    if (profileField.IsMandatory == 1 && profileField.FieldTypeID == ProfileFieldTypeEnum.CheckBox && Field.Value != null && Field.Value.ToLower() == "false")
                    {
                        _model.Message += String.Format("<li>{0}</li>", String.Format(GetLabel("Account.CreateAccount.Mandatory"), profileField.FieldName));
                    }

                }
            }

            bool nonAlphaNumeric = Info.Name.Replace(" ", "").All(c => char.IsLetterOrDigit(c));
            if (!nonAlphaNumeric)
            {
                _model.Message += String.Format("<li>{0}</<li>", "The name contains non-alpha numeric characters (#@!$ etc...). Please change it.");
            }


            if (_model.Message.Length > 0)
            {
                _model.Message = String.Format("<ul class=\"error-message-list\">{0}</ul>", _model.Message);
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;

                return Json(new
                {
                    Status = RequestResultInfoType.ErrorOrDanger,
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }

            
            if (Info.MemberID > 0)
                member = Web.Admin.Logic.Collections.Members.GetBy(Info.MemberID);

            Member existsMember = Web.Admin.Logic.Collections.Members.GetByEmailOrName(Info.Email.Trim(), Info.Name.Trim());
            if (Info.MemberID <= 0 && existsMember.MemberID > 0)
            {
                _model.Title = "Warning";
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = String.Format("Member \"{0}\" &lt;{1}&gt; already exists. Please, change member email and try again.", existsMember.Name, existsMember.Email);
                AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }
            else if (Info.MemberID > 0)
            {
                if (existsMember.MemberID > 0 && Info.MemberID != existsMember.MemberID)
                {
                    _model.Title = "Warning";
                    _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                    _model.Message = String.Format("Member \"{0}\" &lt;{1}&gt; already exists. Please, change member email and try again.", existsMember.Name, existsMember.Email);
                    AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                if (!member.IsBuiltIn)
                {
                    member.Name = Info.Name;
                    member.IsBuiltIn = false;
                }
                else
                {
                    member.IsBuiltIn = true;
                }

                member.Email = Info.Email;
                member.Password = Info.Password;
                member.TimeZoneID = Info.TimeZoneID;
                member.Save();

                if (member.Password != null && member.Password.Length > 0){
                    member.SavePassword();
                }

                if (Info.FieldInfo != null)
                {
                    List<MemberProfileField> memberProfileFields = MemberProfileFields.GetByMember(member.MemberID);
                    foreach (ProfileFieldInfo Field in Info.FieldInfo)
                    {
                        ProfileField profileField = ProfileFields.GetBy(int.Parse(Field.ID));
                        MemberProfileField memberProfileField = MemberProfileFields.GetField(memberProfileFields, int.Parse(Field.ID));

                        if (profileField.Encrypted == 1 && memberProfileField.FieldValue != null && memberProfileField.FieldValue.Length > 0)
                        {
                            memberProfileField.FieldValue = Encryptor.DecryptStringAES(memberProfileField.FieldValue, AppSession.EncryptionKey);
                        }

                        if (memberProfileField != null)
                        {
                            memberProfileField.MemberID = member.MemberID;
                            memberProfileField.FieldID = int.Parse(Field.ID);
                            memberProfileField.FieldValue = Field.Value != null ? Field.Value.Trim() : Field.Value;

                            if (profileField.Encrypted == 1 && memberProfileField.FieldValue != null && memberProfileField.FieldValue.Length > 0)
                            {
                                memberProfileField.FieldValue = Encryptor.EncryptStringAES(memberProfileField.FieldValue, AppSession.EncryptionKey);
                            }
                            
                            memberProfileField.Save();

                        }
                    }
                }

                 List<Domain> _domains = Domains.Get();
                 foreach (Domain _domain in _domains)
                 {
                     MemberDomain _memberDomain = new MemberDomain();
                     _memberDomain.DomainID = _domain.DomainID;
                     _memberDomain.MemberID = member.MemberID;

                     if (Info.Domains != null)
                     {
                         if (Info.Domains.Where(t => t == _domain.DomainID).FirstOrDefault() != default(int))
                             _memberDomain.Save();
                         else
                             _memberDomain.Delete();
                     }
                     else
                         _memberDomain.Delete();
                 }

                _model = new RequestResultModel();
                _model.Message = String.Format("\"{0}\"<{1}> has been updated.",member.Name,member.Email);
                _model.HideInSeconds = 2000;
                AuditEvent.AppEventSuccess(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.PageInline,
                    Html = this.RenderPartialView(@"_RequestResultPageInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                Member memberExists = Web.Admin.Logic.Collections.Members.GetByEmail(Info.Email);
                if (memberExists.MemberID > 0)
                {
                    _model.Title = "Warning";
                    _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                    _model.Message = String.Format("\"{0}\" <{1}> already exists. Please, change member email and try again.", memberExists.Name, memberExists.Email);
                    AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                Member Member = new Member();                
                Member.Name = Info.Name;
                Member.Email = Info.Email;
                Member.Password = Info.Password;
                Member.IsBuiltIn = false;
                Member.TimeZoneID = Info.TimeZoneID;
                Member.Save();

                if (Info.FieldInfo != null)
                {
                    List<MemberProfileField> memberProfileFields = MemberProfileFields.GetByMember(Member.MemberID);
                    foreach (ProfileFieldInfo Field in Info.FieldInfo)
                    {

                        ProfileField profileField = ProfileFields.GetBy(int.Parse(Field.ID));
                        MemberProfileField memberProfileField = MemberProfileFields.GetField(memberProfileFields, int.Parse(Field.ID));
                        memberProfileField.MemberID = member.MemberID;
                        memberProfileField.FieldID = int.Parse(Field.ID);
                        memberProfileField.FieldValue = Field.Value;
                        memberProfileField.Save();
                    }
                }

                _model.InfoType = RequestResultInfoType.Success;
                _model.Message = String.Format("\"{0}\"<{1}> has been created.", Member.Name, Member.Email);
                AuditEvent.AppEventSuccess(Profile.Member.Email, _model.Message);
                
                return Json(new
                {
                    NotifyType = NotifyType.PageInline,
                    Html = this.RenderPartialView(@"_RequestResultPageInLine", _model),
                    MemberID = Member.MemberID

                }, JsonRequestBehavior.AllowGet);

            }
        }

        public JsonResult GetMemberToRoleInlineDialog(long MemberID)
        {
            Member member = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
            MemberRoleListInlineModel _model = new MemberRoleListInlineModel();
            
            _model.Member = member;
            _model.AllRoles = Web.Admin.Logic.Collections.Roles.GetByMemberNotIn(MemberID);
            _model.MemberRoles = Web.Admin.Logic.Collections.Roles.GetByMember(MemberID);

            return Json(new
            {
                Html = this.RenderPartialView(@"_MemberAddRoleInline", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAssignRoleMembersDialog(long RoleID, int[] AssignMembers, bool Assign)
        {
            MemberListModel _model = new MemberListModel();
            foreach (int MemberID in AssignMembers)
            {
                Member member = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
                _model.Members.Add(member);
            }

            _model.Role = Roles.GetBy(RoleID);
            _model.Assign = Assign;

            return Json(new
            {
                Html = this.RenderPartialView(@"_AssignRoleMembers", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RemoveMember(int[] RemoveMembers)
        {
            MemberListModel _model = new MemberListModel();
            List<Member> _deleted = new List<Member>();

            foreach (int MemberID in RemoveMembers)
            {
                Member member = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
                if (member.IsBuiltIn)
                {
                    member.WasDeleted = false;
                    member.UIMessage = String.Format("\"{0}\"<{1}> is built in and can't be deleted.", member.Name, member.Email);
                    member.UIMessageType = UIMessageType.Warning;
                    AuditEvent.AppEventWarning(Profile.Member.Email, member.UIMessage);
                }else if (member.Delete())
                {
                    member.WasDeleted = true;
                    member.UIMessage = String.Format("\"{0}\"<{1}>  has been deleted.", member.Name, member.Email);
                    member.UIMessageType = UIMessageType.Success;
                    AuditEvent.AppEventSuccess(Profile.Member.Email, member.UIMessage);
                }
                _deleted.Add(member);
            }

            _model.Members = _deleted;

            return Json(new
            {
                NotifyType = NotifyType.Dialog,
                Html = this.RenderPartialView(@"_RemoveMembersResult", _model)

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RemoveFromRole(long MemberID, long RoleID)
        {
            Member member = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
            Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleID);


            // Ignore admin in admins role
            if (member.Name.ToLower() == "admin" && role.Name.ToLower() == "admins")
            {
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberNoRemovedAdminFromRole, member.Name, member.Email, role.Name));
            }
            else
            {
                MemberRole memberrole = new MemberRole();
                memberrole.MemberID = MemberID;
                memberrole.RoleID = RoleID;
                memberrole.Delete();

                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberRemovedFromRole, member.Name, member.Email, role.Name));
            }

            if (role.Name.ToLower() == "blocked")
            {
                MemberAttempt MemberAttempt = MemberAttempts.GetValid(MemberID, DateTime.Now, MemberAttemptTypes.LoginPasswordFailed);
                if (MemberAttempt.AttemptID > 0)
                {
                    MemberAttempt.Attempts = 0;
                    MemberAttempt.Save();
                }
            }

            MemberListModel model = new MemberListModel();
            
            model.Members.Add(member);

            return Json(new
            {
                Html = this.RenderPartialView(@"_MemberRoleList", model),
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AssignRolesToMember(long MemberID, long[] AssignRoles)
        {        
            Member member = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
            foreach (long _roleID in AssignRoles)
            {
                Role Role = Web.Admin.Logic.Collections.Roles.GetBy(_roleID);
                if (Role.RoleID > 0)
                {
                    MemberRole memberrole = new MemberRole();
                    memberrole.MemberID = MemberID;
                    memberrole.RoleID = Role.RoleID;
                    memberrole.Save();

                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberAssigToRole, member.Name, member.Email, Role.Name));
                }
            }

            MemberListModel model = new MemberListModel();            
            model.Members.Add(member);

            return Json(new
            {
                Html = this.RenderPartialView(@"_MemberRoleList", model),
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AssignRoleMembers(long RoleID, int[] AssignMembers, bool Assign)
        {
            MemberListModel _model = new MemberListModel();
            
            foreach (int MemberID in AssignMembers)
            {
                Web.Admin.Logic.Objects.Member Member = Web.Admin.Logic.Collections.Members.GetBy(MemberID);
                Web.Admin.Logic.Objects.Role Role = Web.Admin.Logic.Collections.Roles.GetBy(RoleID);
                
                if (RoleID > 0)
                {
                    if (Member.IsBuiltIn)
                    {
                        if (Member.Name.Trim().ToLower() == "admin" && Role.Name.Trim().ToLower() == "admins")
                        {
                            AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberNoRemovedAdminFromRole, Member.Name, Member.Email, Role.Name));
                            continue;
                        }
                    }
                    else
                    {
                        MemberRole _roleMember = new MemberRole();
                        _roleMember.MemberID = MemberID;
                        _roleMember.RoleID = RoleID;

                        if (Role.Name.ToLower() == "blocked")
                            ResetPasswordfailedAttemps(MemberID);

                        if (Assign)
                        {
                            _roleMember.Save();
                            AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberAssigToRole, Member.Name, Member.Email, Role.Name));
                        }
                        else
                        {                         
                            _roleMember.Delete();
                            AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberRemovedFromRole, Member.Name, Member.Email, Role.Name));
                        }
                    }
                }
                else if (!Assign)
                {
                    if (Member.IsBuiltIn)
                    {
                        AuditEvent.AppEventWarning(Profile.Member.Email, String.Format(AuditEvent.MemberNoRemovedAdminFromRole, Member.Name, Member.Email, Role.Name));
                        continue;
                    }
                    else
                    {
                        MemberRole _roleMember = new MemberRole();
                        _roleMember.MemberID = MemberID;
                        _roleMember.DeleteAll();

                        ResetPasswordfailedAttemps(MemberID);
                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberRemovedFromAllRole, Member.Name, Member.Email));
                    }
                }
            }

            _model.Role = Roles.GetBy(RoleID);

            return Json(new
            {
                Html = ""

            }, JsonRequestBehavior.AllowGet);
        }

        private void ResetPasswordfailedAttemps(long MemberID)
        {
            if (AppSession.Parameters.RulesPasswordFailedRoles.Value != null && AppSession.Parameters.RulesPasswordFailedRoles.Value.Length > 0)
            {

                MemberAttempt MemberAttempt = MemberAttempts.GetValid(MemberID, DateTime.Now, MemberAttemptTypes.LoginPasswordFailed);
                if (MemberAttempt.AttemptID > 0)
                {
                    Parameter Param = AppSession.Parameters.RulesPasswordFailedAttempts;

                    long value = -1;
                    bool result = long.TryParse(Param.Value, out value);

                    if (result && value > 0 && MemberAttempt.Attempts >= value)
                    {
                        MemberAttempt.Attempts = 0;
                        MemberAttempt.Save();
                    }
                }
            }
        }

        public JsonResult GetMembers(MemberPaginInfo PaginInfo)
        {
            MemberListFilter Filter = new MemberListFilter();
            Filter.CurrentPage = PaginInfo.CurrentPage; 
            Filter.ItemsPerPage = PaginInfo.ItemsPerPage; 
            Filter.SortOrderAsc = PaginInfo.SortOrderAsc; 
            Filter.AlphabetFilter = PaginInfo.AlphabetFilter;
            Filter.RolesFilter = PaginInfo.RolesFilter;
            Filter.SortColumn = PaginInfo.SortColumn;
            Filter.Search = HttpUtility.UrlDecode(PaginInfo.Search);

            Filter.SortColumnName = "MemberID";
            switch (PaginInfo.SortColumn)
            {
                case 2: Filter.SortColumnName = "Name"; break;
                case 4: Filter.SortColumnName = "Email"; break;
                case 5: Filter.SortColumnName = "LastLogin"; break;
                case 6: Filter.SortColumnName = "Created"; break;
            }

            if (PaginInfo.RolesFilterCondition == "or")
                Filter.RoleFilterCondition = MemberListFilterRoleConditon.OR;
            else if (PaginInfo.RolesFilterCondition == "and")
                Filter.RoleFilterCondition = MemberListFilterRoleConditon.AND;

            var totalItems = 0;
            var members = Web.Admin.Logic.Collections.Members.Get(Filter, out totalItems);

            return Json(new
            {
                Html = this.RenderPartialView("_MemberList", new MemberListModel(PaginInfo.HolderName, members,Filter,totalItems))
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Download(DownloadFileType FileType)
        {
            if (FileType == DownloadFileType.CSV)
            {
                StringBuilder sb = new StringBuilder();
                List<Member> Members = Web.Admin.Logic.Collections.Members.Get();

                sb.Append("Name, Roles, Email, Password, AvatarID, AvatarImage, LastLogin, Created, Token, GeneratedBy, TokenCreated, TokenModified\r\n");
                foreach (Member Member in Members)
                {
                    MemberToken Token = MemberTokens.GetByMember(Member.MemberID);
                    string Format = "\"{0}\",\"{1}\",\"{2}\",{3},{4},{5},{6},{7},{8},{9},{10},{11}\r\n";

                    if (Token.MemberID > 0)
                    {
                        sb.Append(String.Format(Format,
                         AppSession.DemoMode ? "**** demo ****" : Member.Name,
                         Member.RolesToString,
                         AppSession.DemoMode ? "**** demo ****" : Member.Email,
                         AppSession.DemoMode ? "**** demo ****" : Member.Password,
                         (Member.Avatar != null && Member.Avatar.Length > 0 ? Member.Avatar : ""),
                         (Member.Avatar != null && Member.Avatar.Length > 0 ? GetAvatarBase64FromByteArray(Member.Avatar) : ""),
                         Member.LastLogin.ToString("dd.MM.yyyy HH:mm:ss"),
                         Member.Created.ToString("dd.MM.yyyy HH:mm:ss"),
                         Token.Token,
                         Token.GeneratedBy,
                         Token.Created.ToString("dd.MM.yyyy HH:mm:ss"),
                         Token.Modified.ToString("dd.MM.yyyy HH:mm:ss")
                         ));
                    }
                    else
                    {
                        sb.Append(String.Format(Format,
                            AppSession.DemoMode ? "**** demo ****" : Member.Name,
                            Member.RolesToString,
                            AppSession.DemoMode ? "**** demo ****" : Member.Email,
                            AppSession.DemoMode ? "**** demo ****" : Member.Password,
                            (Member.Avatar != null && Member.Avatar.Length > 0 ? Member.Avatar : ""),
                            (Member.Avatar != null && Member.Avatar.Length > 0 ? GetAvatarBase64FromByteArray(Member.Avatar) : ""),
                            Member.LastLogin.ToString("dd.MM.yyyy HH:mm:ss"),
                            Member.Created.ToString("dd.MM.yyyy HH:mm:ss"),
                            "","","",""
                            ));
                    }
                }
                
                ControllerContext.HttpContext.Response.AddHeader("content-disposition", "attachment; filename=members-" + DateTime.Now.ToString("dd.MM.yyyy") + ".csv");
                ControllerContext.HttpContext.Response.ContentType = "text/csv";
                ControllerContext.HttpContext.Response.BinaryWrite(System.Text.ASCIIEncoding.UTF8.GetBytes(sb.ToString()));
                ControllerContext.HttpContext.Response.Flush();
            
                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberDounloaded, Members.Count));
            
            }else if (FileType == DownloadFileType.XLS)
            { 
            
            

            }
            
            return new EmptyResult();
        }

        private string GetAvatarBase64FromByteArray(String Name)
        {
            string FileName = Server.MapPath("~/Avatar/" + Name + ".jpg");
            System.IO.FileStream inFile;
            byte[] binaryData;
            string base64String = "";

            if(System.IO.File.Exists(FileName))
            {
                inFile = new System.IO.FileStream(FileName,System.IO.FileMode.Open,System.IO.FileAccess.Read);
                binaryData = new Byte[inFile.Length];
                long bytesRead = inFile.Read(binaryData, 0,(int)inFile.Length);
                inFile.Close();

                base64String = System.Convert.ToBase64String(binaryData, 0, binaryData.Length);
            }
            
            // Convert the binary input into Base64 UUEncoded output.
            return base64String;
        }

        private void SaveAvatarFromBase64FromByteArray(String Name, String Content)
        {
            string FileName = Server.MapPath("~/Avatar/" + Name + ".jpg");
            System.IO.FileStream outFile;
            byte[] binaryData;

            if (!System.IO.File.Exists(FileName))
            {
                outFile = new System.IO.FileStream(FileName, System.IO.FileMode.Create, System.IO.FileAccess.Write);
                binaryData = System.Convert.FromBase64String(Content);
                outFile.Write(binaryData, 0, binaryData.Length);

                outFile.Flush();
                outFile.Close();
            }
        }

        public ActionResult ImportMembers()
        {
            System.Threading.Thread.Sleep(200);
            
            CultureInfo provider = CultureInfo.InvariantCulture;
            List<Member> MemberResult = new List<Member>();
            int LineNumber = 1;
            
            try
            {
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    String FileContent = "";
                    HttpPostedFileBase PostedFile = Request.Files[i];

                    using (System.IO.Stream input = PostedFile.InputStream)
                    {
                        byte[] buffer = new byte[PostedFile.InputStream.Length];
                        input.Read(buffer, 0, buffer.Length);
                        FileContent = System.Text.ASCIIEncoding.UTF8.GetString(buffer);
                    }


                    if (FileContent.Length > 0)
                    {
                        string[] Lines = FileContent.Split(new string[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);
                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberUploadHasStarted, Lines.Length));
                        
                        int Added = 0;
                        int Failed = 0;
                        int Exists = 0;

                        foreach (String Line in Lines)
                        {
                            System.Threading.Thread.Sleep(1);
                            
                            if (LineNumber == 1 || Line == null || Line.Trim().Length == 0)
                            {
                                LineNumber++;
                                continue;
                            }

                            List<string> Values = new List<string>();
                            CsvParser parser = new CsvParser(Line);

                            foreach (string s in parser)
                                Values.Add(s.Trim());

                            if (Values.Count >= 11)
                            {
                                Member Member = Web.Admin.Logic.Collections.Members.GetByEmail(Values[2]);
                                if (Member.MemberID > 0)
                                {
                                    Member.UIMessage = "Member already exists.";
                                    Member.UILineNumber = LineNumber;
                                    Member.UIMessageType = Logic.UIMessageType.Warning;
                                    AuditEvent.AppEventWarning(Profile.Member.Email, String.Format(AuditEvent.MemberUploadMemberExists, Member.Name, Member.Email));
                                    Exists++; 
                                }
                                else
                                {
                                    Member.Name = Values[0];
                                    Member.Email = Values[2];

                                    bool randomPassword = false;
                                    if (Values[3] == null || Values[3].Trim().Length == 0)
                                    {
                                        Member.Password = Web.Admin.Logic.StringTool.RandomString(10);
                                        randomPassword = true;
                                    }
                                    else
                                    {
                                        Member.Password = Values[3];
                                    }
                                    
                                    Member.Avatar = Values[4];
                                    
                                    if(Values[5] != null && Values[5].Length > 0)
                                    {
                                        try{
                                        
                                            if (Member.Avatar == null || Member.Avatar.Trim().Length == 0)
                                            {
                                                Member.Avatar = Web.Admin.Logic.StringTool.RandomString(24);
                                            }
                                            
                                            SaveAvatarFromBase64FromByteArray(Member.Avatar, Values[5]);

                                        }
                                        catch { Member.Avatar = ""; }
                                    }
                                    
                                    if(BuiltInRoleMember.ContainsMember(Member.Name))
                                        Member.IsBuiltIn = true;
                                    else
                                        Member.IsBuiltIn = false;

                                    try
                                    {
                                        Member.LastLogin = DateTime.ParseExact(Values[6], "dd.MM.yyyy HH:mm:ss", provider);
                                    }
                                    catch { }
                                    
                                    try
                                    {
                                        Member.Created = DateTime.ParseExact(Values[7], "dd.MM.yyyy HH:mm:ss", provider);
                                    }
                                    catch { }
                                    
                                    Member.Save();
                                    Added ++;

                                    if(Values[1] != null && Values[1].Length > 0)
                                    {
                                        string[] toRols = Values[1].Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                                        foreach (string RoleName in toRols)
                                        {
                                            Role Role = Roles.GetBy(RoleName);
                                            if (Role.RoleID > 0)
                                            {
                                                MemberRole MemberRole = new MemberRole();
                                                MemberRole.MemberID = Member.MemberID;
                                                MemberRole.RoleID = Role.RoleID;
                                                MemberRole.Save();
                                            }
                                            else
                                            { 
                                                // Create new role ?
                                            
                                            }
                                        }
                                    }



                                    Member.UIMessage = "Member has been added." + (randomPassword ? " (Random password)" : "");
                                    Member.UIMessageType = Logic.UIMessageType.Success;
                                    Member.UILineNumber = LineNumber;
                                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberUploadedItemAdded, Member.Name, Member.Email));
                                }

                                MemberResult.Add(Member);
                                if (Values[8] != null && Values[8].Trim().Length > 0)
                                {
                                    MemberToken Token = MemberTokens.GetByMember(Member.MemberID);

                                    if (Token.MemberTokenID <= 0)
                                        Token = MemberTokens.GetByToken(Values[8].Trim());

                                    if (Token.MemberTokenID <= 0)
                                    {
                                        MemberToken MemberToken = new MemberToken();
                                        MemberToken.MemberID = Member.MemberID;
                                        MemberToken.Token = Values[8];
                                        MemberToken.GeneratedBy = Values[9];

                                        try
                                        {
                                            MemberToken.Created = DateTime.ParseExact(Values[10], "dd.MM.yyyy HH:mm:ss", provider);
                                        }
                                        catch { }

                                        try
                                        {
                                            if (Values.Count == 12)
                                                MemberToken.Modified = DateTime.ParseExact(Values[11], "dd.MM.yyyy HH:mm:ss", provider);
                                        }
                                        catch { }

                                        MemberToken.Save();
                                    }
                                    else
                                    {
                                        Member member = Web.Admin.Logic.Collections.Members.GetBy(Token.MemberID);
                                        Member.UIMessage = String.Format("Member has been added, but API token \"{0}\" already exists in database for member \"{1}\" <{2}>", Values[8], member.Name, member.Email);
                                        Member.UIMessageType = Logic.UIMessageType.Warning;
                                    }
                                }
                            }
                            else if (Values.Count > 0)
                            {
                                Member Member = new Member();

                                Member.UIMessage = "Wrong line format. Number of columns: " + Values.Count.ToString();
                                Member.UIMessageType = Logic.UIMessageType.ErrorOrDanger;
                                Member.UILineNumber = LineNumber;                                
                                MemberResult.Add(Member);
                                Failed++;
                                
                                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberUploadWrongLineFormat,LineNumber,Values.Count));
                            }

                            LineNumber++;
                        }

                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.MemberUploadHasStarted, Lines.Length, Added, Exists, Failed));
                    }
                }

                System.Threading.Thread.Sleep(1000);
                MemberListModel Model = new MemberListModel();
                Model.Members = MemberResult;

                return Json(new
                {
                    NotifyType = NotifyType.Dialog,
                    Html = this.RenderPartialView(@"_ImportMembersResult", Model)

                }, "text/html", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                RequestResultModel _model = new RequestResultModel();

                _model.Title = "Warning";
                _model.Message = String.Format("Something went wrong: {0}", HttpUtility.HtmlEncode(ex.Message));
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.HideInSeconds = 0;
                _model.Height = 250;

                AuditEvent.AppEventError(Profile.Member.Email, _model.Message, AuditEvent.GetSessionDetails(ex.StackTrace));

                return Json(new
                {
                    Status = "Ok",
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialog", _model)

                }, "text/html", JsonRequestBehavior.AllowGet);

            }

        }

        public ActionResult SendRandomPassword(string Email)
        {
            RequestResultModel _model = new RequestResultModel();
            Member Member = Web.Admin.Logic.Collections.Members.GetByEmail(Email);

            if (!AppSession.IsEmail(Email))
            {
                _model.Title = GetLabel("Member.Controler.Warning");
                _model.Message = GetLabel("Member.Controler.WrongEmail");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;

                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.SentRandomPasswordBadFormat,Email)); 
            }
            else
            {
                if (Member.MemberID <= 0)
                {
                    _model.Title = GetLabel("Member.Controler.Warning");
                    _model.Message = GetLabel("Member.Controler.AccountNotExists");
                    _model.InfoType = RequestResultInfoType.Warning;

                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.SentRandomPasswordNotExist,Email)); 
                }
                else
                {
                    string Password =  Web.Admin.Logic.StringTool.RandomString(10);
                    Member.Password = Password;
                    Member.SavePassword();
                    
                    bool result = SendRandomPasswordEmail(Member.Name, Email,Password);

                    if (result)
                    {
                        _model.Title = GetLabel("Member.Controler.Congrat");
                        _model.Message = GetLabel("Member.Controler.RandomPassSent");
                        _model.InfoType = RequestResultInfoType.Success;

                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.SentRandomPasswordSent, Member.Name, Email));
                    }
                    else
                    {
                        _model.Title = GetLabel("Member.Controler.Congrat");
                        _model.Message = GetLabel("Member.Controler.RandomPassDidNotSend");
                        _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                        AuditEvent.AppEventError(Profile.Member.Email, _model.Message);
                    }
                }

            }

            return Json(new
            {
                Status = _model.InfoType,
                NotifyType = NotifyType.DialogInline,
                Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

            }, JsonRequestBehavior.AllowGet);
        }

        public bool SendRandomPasswordEmail(string Name, string Email, string Password)
        {
            string template = this.RenderPartialView(@"Templates/Mails/_GeneratePasswordConfirmation", null);

            template = template.Replace("{{name}}", Name);
            template = template.Replace("{{email}}", Email);
            template = template.Replace("{{password}}", Password);

            string body = StringTool.DeleteLines(template, 1);
            string subject = template.Replace(body, "").Replace("\r\n", "");

            return AppSession.SendMail
            (
               AppParams.MailServerSmtpUser.Value, AppParams.MailServerSmtpEmail.Value,
               Name, Email,
               AppParams.RulesMailBccRegistration.Value == "true" ? AppSession.Parameters.RulesMailBcc.Value : null,
               subject,
               body
            ); 
        }

        public ActionResult GenerateMemberToken(string Email)
        {
            RequestResultModel _model = new RequestResultModel();
            Member Member = Web.Admin.Logic.Collections.Members.GetByEmail(Email);

            if (!AppSession.IsEmail(Email))
            {
                _model.Title = GetLabel("Member.Controler.Warning");
                _model.Message = GetLabel("Member.Controler.WrongEmail");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;

                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.SentRandomPasswordBadFormat, Email));
            }
            else
            {
                if (Member.MemberID <= 0)
                {
                    _model.Title = GetLabel("Member.Controler.Warning");
                    _model.Message = GetLabel("Member.Controler.AccountNotExists");
                    _model.InfoType = RequestResultInfoType.Warning;

                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.SentRandomPasswordNotExist, Email));
                }
                else
                {
                    string Token = Web.Admin.Logic.StringTool.RandomString(48);
                    bool result = false;

                    MemberToken ExistToken = MemberTokens.GetByMember(Member.MemberID);
                    if (ExistToken.MemberTokenID > 0)
                    {
                        ExistToken.Token = Token;
                        result = ExistToken.SaveToken();
                    }
                    else
                    {
                        MemberToken _Token = new MemberToken();
                        _Token.MemberID = Member.MemberID;
                        _Token.GeneratedBy = Profile.Member.Email;
                        _Token.Token = Token;
                        result = _Token.Save();
                    }

                    if (result)
                    {
                        _model.Title = GetLabel("Member.Controler.Congrat");
                        _model.Message = GetLabel("Member.Controler.MemberTokenCreated");
                        _model.InfoType = RequestResultInfoType.Success;

                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("The member \"{0}\"<{1}> token has been created by \"{2}\"<{3}>.", Member.Name, Email,Profile.Member.Name, Profile.Member.Email));
                    }
                }

            }

            MemberListModel _ListModel = new MemberListModel();
            _ListModel.Members.Add(Member);

            return Json(new
            {
                Status = _model.InfoType,
                NotifyType = NotifyType.DialogInline,
                Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model),
                TokenPanel = this.RenderPartialView(@"_MemberToken", _ListModel),

            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult RemoveMemberToken(string Email)
        {
            RequestResultModel _model = new RequestResultModel();
            Member Member = Web.Admin.Logic.Collections.Members.GetByEmail(Email);

            if (!AppSession.IsEmail(Email))
            {
                _model.Title = GetLabel("Member.Controler.Warning");
                _model.Message = GetLabel("Member.Controler.WrongEmail");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;

                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.SentRandomPasswordBadFormat, Email));
            }
            else
            {
                if (Member.MemberID <= 0)
                {
                    _model.Title = GetLabel("Member.Controler.Warning");
                    _model.Message = GetLabel("Member.Controler.AccountNotExists");
                    _model.InfoType = RequestResultInfoType.Warning;

                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.SentRandomPasswordNotExist, Email));
                }
                else
                {
                    string Token = Web.Admin.Logic.StringTool.RandomString(20);

                    MemberToken ExistToken = MemberTokens.GetByMember(Member.MemberID);
                    if (ExistToken.Delete())
                    {
                        _model.Title = GetLabel("Member.Controler.Congrat");
                        _model.Message = GetLabel("Member.Controler.MemberTokenRemoved");
                        _model.InfoType = RequestResultInfoType.Success;

                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format("\"{0}\"<{1}> token has been removed by \"{2}\"<{3}>.", Member.Name, Email, Profile.Member.Name, Profile.Member.Email));
                    }
                }

            }

            MemberListModel _ListModel = new MemberListModel();
            _ListModel.Members.Add(Member);

            return Json(new
            {
                Status = _model.InfoType,
                NotifyType = NotifyType.DialogInline,
                Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model),
                TokenPanel = this.RenderPartialView(@"_MemberToken", _ListModel),

            }, JsonRequestBehavior.AllowGet);
        }
        
    }
}
