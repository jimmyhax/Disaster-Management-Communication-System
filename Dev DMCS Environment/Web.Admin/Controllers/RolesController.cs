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
using System.Text.RegularExpressions;
using Web.Admin.Logic.Utilities;
using Web.Admin.Logic;
using System.Globalization;


namespace Web.Admin.Controllers
{
    
    public class RoleInfo
    {
        public int RoleID { get; set; }
        public string Name{get;set;}
        public string Settings { get; set; }
        public string Color { get; set; }

        public RoleInfo()
        {
            RoleID = 0;
            Settings = "";
            Color = "";
        }
   }

    public class RolePaginInfo
    {
       public string HolderName { get; set; }
       public int CurrentPage {get; set;}
       public int ItemsPerPage {get; set;}
       public int SortColumn { get; set; }
       public bool SortOrderAsc { get; set; }

    }

    [Authorize]
    [CompressFilter]
    [CustomAuthorizeAttribute(Roles = "Admins")]
    public class RolesController : BaseController
    {
        public ActionResult Index()
        {
            return View("Roles");
        }
        
        public ActionResult Roles()
        {
            return View("Roles");
        }

        public JsonResult GetNewRoleDialog(int RoleID = 0)
        {
            return Json(new
            {
                Html = this.RenderPartialView(@"_AddRole", null)

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetEditRoleDialog(int RoleID)
        {
            Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleID);
            RoleListModel _model = new RoleListModel();
            _model.Roles.Add(role);

            return Json(new
            {
                Html = this.RenderPartialView(@"_EditRole", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRemoveRoleDialog(int[] RmoveRoles)
        {
            RoleListModel _model = new RoleListModel();
            foreach (int RoleID in RmoveRoles)
            {
                Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleID);
                _model.Roles.Add(role);
            }

            return Json(new
            {
                Html = this.RenderPartialView(@"_RemoveRoles", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveRole(RoleInfo Info)
        {
            RequestResultModel _model = new RequestResultModel();

            if (Info.Name == null || Info.Name.Trim().Length == 0)
            {
                _model = new RequestResultModel();
                _model.Title = "Warning";
                _model.Message = "Name is empty. Please, enter role name.";                
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }

            if (!AppSession.IsColor(Info.Color))
            {
                _model = new RequestResultModel();
                _model.Title = "Warning";
                _model.Message = "Wrong color value or format, please check.";
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                return Json(new
                {
                    NotifyType = NotifyType.DialogInline,
                    Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }
            
            if (Info.RoleID > 0)
            {
                Role role = Web.Admin.Logic.Collections.Roles.GetBy(Info.RoleID);
                Role roleExists = Web.Admin.Logic.Collections.Roles.GetBy(Info.Name);

                // The role has been deleted.
                if (role.RoleID <= 0)
                {
                    _model.Title = "Warning";
                    _model.Message = String.Format("Role '{0}' doesn't exist. Please, refresh role list and try again.", roleExists.Name);
                    AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                // The role already esists.
                if (roleExists.RoleID > 0 && Info.RoleID != roleExists.RoleID)
                {
                    _model.Title = "Warning";
                    _model.Message = String.Format("Role '{0}' already exists. Please, change role name and try again.", roleExists.Name);
                    AuditEvent.AppEventWarning(Profile.Member.Email, _model.Message);

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                if (!role.IsBuiltIn)
                {
                    role.Name = Info.Name;
                    role.IsBuiltIn = false;
                }
                else
                {
                    role.IsBuiltIn = true;
                }

                role.Settings = Info.Settings;
                role.BackColor = Info.Color != null ? Info.Color.Replace("#", "") : "FFFFFF";
                role.ForeColor = Role.ContrastColor(role.BackColor.Replace("#", ""));
                role.Save();

                _model = new RequestResultModel();
                _model.Message = String.Format("Role \"{0}\"has been updated.",role.Name);
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
                Role roleExists = Web.Admin.Logic.Collections.Roles.GetBy(Info.Name);
                
                // The role already esists.
                if (roleExists.RoleID > 0)
                {
                    _model.Title = "Warning";
                    _model.Message = String.Format("Role '{0}' already exists. Please, change role name and try again.", roleExists.Name);

                    return Json(new
                    {
                        NotifyType = NotifyType.DialogInline,
                        Html = this.RenderPartialView(@"_RequestResultDialogInLine", _model)

                    }, JsonRequestBehavior.AllowGet);
                }

                Role Role = new Role();
                Role.Name = Info.Name;
                Role.Settings = Info.Settings;
                Role.BackColor = Info.Color != null ? Info.Color.Replace("#", "") : "FFFFFF";
                Role.ForeColor = Role.ContrastColor(Role.BackColor.Replace("#", ""));
                Role.IsBuiltIn = false;
                Role.Save();

                _model.Message = String.Format("New role \"{0}\" has been created.",Role.Name);

                return Json(new
                {
                    NotifyType = NotifyType.PageInline,
                    Html = this.RenderPartialView(@"_RequestResultPageInLine", _model)

                }, JsonRequestBehavior.AllowGet);
            }        
        }

        public JsonResult RemoveRole(int[] RemoeRoles)
        {
            RoleListModel _model = new RoleListModel();
            List<Role> _deleted = new List<Role>();

            foreach (int RoleID in RemoeRoles)
            {
                Role role = Web.Admin.Logic.Collections.Roles.GetBy(RoleID);
                List<ProfileField> _profileFields = ProfileFields.GetByRole(RoleID);

                if (Web.Admin.Logic.Collections.Roles.GetMemberCount(role.RoleID) > 0)
                {
                    role.WasDeleted = false;
                    role.UIMessage = "The role contains members.";
                    role.UIMessageType = UIMessageType.Warning;
                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleContainsMembers, role.Name));
                }
                else if (_profileFields.Count > 0)
                {
                    role.WasDeleted = false;
                    role.UIMessage = "The role has not been deleted. Attached fields: ";
                    foreach (ProfileField profileField in _profileFields)
                    {
                        role.UIMessage += "<u>" + profileField.FieldName + "</u>&nbsp;";
                    }
                    role.UIMessageType = UIMessageType.Warning;
                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleContainsMembers, role.Name));                
                }
                else
                {
                    if (role.IsBuiltIn)
                    {
                        role.WasDeleted = true;
                        role.UIMessage = "The role is built in and can't be deleted.";
                        role.UIMessageType = UIMessageType.Warning;
                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleIsBuiltIn, role.Name));
                    }
                    else if (role.Delete())
                    {
                        role.WasDeleted = true;
                        role.UIMessage = "The role has been deleted.";
                        role.UIMessageType = UIMessageType.Success;
                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleDeleted, role.Name));
                    }
                }
            
                _deleted.Add(role);
            }

            _model.Roles = _deleted;

            return Json(new
            {
               NotifyType = NotifyType.Dialog,
               Html = this.RenderPartialView(@"_RemoveRolesResult", _model)

            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRoles(RolePaginInfo PaginInfo)
        {
            RoleListFilter Filter = new RoleListFilter();
            Filter.CurrentPage = PaginInfo.CurrentPage;
            Filter.ItemsPerPage = PaginInfo.ItemsPerPage;
            Filter.SortOrderAsc = PaginInfo.SortOrderAsc;
            Filter.SortColumn = PaginInfo.SortColumn;

            Filter.SortColumnName = "RoleID";
            switch (PaginInfo.SortColumn)
            {
                case 2: Filter.SortColumnName = "Name"; break;
                case 3: Filter.SortColumnName = "MemberCount"; break;
                case 6: Filter.SortColumnName = "Created"; break;
                case 7: Filter.SortColumnName = "Modified"; break;
                case 5: Filter.SortColumnName = "Settings"; break;
            }
            
            var totalItems = 0;
            var roles = Web.Admin.Logic.Collections.Roles.Get(Filter, out totalItems);

            return Json(new
            {
                Html = this.RenderPartialView("_RoleList", new RoleListModel(PaginInfo.HolderName, roles,Filter,totalItems))
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Download(DownloadFileType FileType)
        {
            if (FileType == DownloadFileType.CSV)
            {
                StringBuilder sb = new StringBuilder();
                List<Role> Roles = Web.Admin.Logic.Collections.Roles.Get();

                sb.Append("Name,Settings,Color,BackgroundColor Created, Modified\r\n");
                foreach (Role Role in Roles)
                    sb.Append(String.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\"\r\n", Role.Name, Role.Settings, Role.BackColor, Role.ForeColor, Role.Created.ToString("dd.MM.yyyy HH:mm:ss"), Role.Modified.ToString("dd.MM.yyyy HH:mm:ss")));

                ControllerContext.HttpContext.Response.AddHeader("content-disposition", "attachment; filename=roles-" + DateTime.Now.ToString("dd.MM.yyyy") + ".csv");
                ControllerContext.HttpContext.Response.ContentType = "text/csv";
                ControllerContext.HttpContext.Response.BinaryWrite(System.Text.ASCIIEncoding.UTF8.GetBytes(sb.ToString()));
                ControllerContext.HttpContext.Response.Flush();

                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleDounloaded, Roles.Count));
            }
            else if (FileType == DownloadFileType.XLS)
            {



            }

            return new EmptyResult();
        }

        public ActionResult ImportRoles()
        {
            System.Threading.Thread.Sleep(200);
            CultureInfo provider = CultureInfo.InvariantCulture;

            List<Role> RoleResult = new List<Role>();
            try
            {
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    System.Threading.Thread.Sleep(1);
                    
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
                        AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleUploadHasStarted, Lines.Length));

                        int LineNumber = 1;
                        foreach (String Line in Lines)
                        {
                            if (LineNumber == 1 || Line == null || Line.Trim().Length == 0)
                            {
                                LineNumber++;
                                continue;
                            }

                            List<string> Values = new List<string>();
                            CsvParser parser = new CsvParser(Line);

                            foreach (string s in parser)
                                Values.Add(s.Trim());

                            if (Values.Count >= 4)
                            {
                                Role Role = Web.Admin.Logic.Collections.Roles.GetBy(Values[0]);
                                if (Role.RoleID > 0)
                                {
                                    Role.UIMessage = "Role already exists.";
                                    Role.UILineNumber = LineNumber;
                                    Role.UIMessageType = Logic.UIMessageType.Warning;
                                    AuditEvent.AppEventWarning(Profile.Member.Email, String.Format(AuditEvent.RoleUploadMemberExists, Role.Name));
                                }
                                else
                                {
                                    Role.Name = Values[0];
                                    Role.Settings = Values[1];

                                    if (Values[3].Trim().Length == 0)
                                        Role.BackColor = "aaaaaa";
                                    else
                                        Role.BackColor = Values[2];

                                    if (Values[3].Trim().Length == 0)
                                        Role.ForeColor = "000000";
                                    else
                                        Role.ForeColor = Values[3];

                                    if (BuiltInRoleMember.ContainsRole(Role.Name))
                                        Role.IsBuiltIn = true;
                                    else
                                        Role.IsBuiltIn = false;

                                    try
                                    {
                                        Role.Created = DateTime.ParseExact(Values[4], "dd.MM.yyyy HH:mm:ss", provider);
                                    }
                                    catch { }

                                    try
                                    {
                                        Role.Modified = DateTime.ParseExact(Values[5], "dd.MM.yyyy HH:mm:ss", provider);
                                    }
                                    catch { 
                                    }

                                    Role.Save();

                                    Role.UIMessage = "Role has been added.";
                                    Role.UIMessageType = Logic.UIMessageType.Success;
                                    Role.UILineNumber = LineNumber;
                                    AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleUploadedItemAdded, Role.Name));

                                }

                                RoleResult.Add(Role);
                            }
                            else if (Values.Count > 0)
                            {
                                Role Role = new Role();

                                Role.UIMessage = "Wrong line format. Number of columns: " + Values.Count.ToString();
                                Role.UIMessageType = Logic.UIMessageType.ErrorOrDanger;
                                Role.UILineNumber = LineNumber;
                                AuditEvent.AppEventSuccess(Profile.Member.Email, String.Format(AuditEvent.RoleUploadWrongLineFormat, LineNumber, Values.Count));

                                RoleResult.Add(Role);
                            }

                            LineNumber++;
                        }

                    }
                }

                System.Threading.Thread.Sleep(1000);
                RoleListModel Model = new RoleListModel();
                Model.Roles = RoleResult;

                return Json(new
                {
                    NotifyType = NotifyType.Dialog,
                    Html = this.RenderPartialView(@"_ImportRolesResult", Model)

                }, "text/html", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

              RequestResultModel _model = new RequestResultModel();            

              _model.Title = "Warning";
              _model.Message = String.Format("Something went wrong: {0}",HttpUtility.HtmlEncode(ex.Message));
              _model.InfoType = RequestResultInfoType.ErrorOrDanger;
              _model.HideInSeconds = 0;
              _model.Height = 250;

              AuditEvent.AppEventError(Profile.Member.Email, _model.Message, AuditEvent.GetSessionDetails(ex.StackTrace));

              return Json(new
              {
                  NotifyType = NotifyType.DialogInline,
                  Html = this.RenderPartialView(@"_RequestResultDialog", _model)

              }, "text/html", JsonRequestBehavior.AllowGet);
            
            }
            
       }

    }
}
