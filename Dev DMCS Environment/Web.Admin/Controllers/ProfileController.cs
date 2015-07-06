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

namespace Web.Admin.Controllers
{

    public class ImageInfo {
        public int sizeX{get;set;}
        public int sizeY{get;set;}
        public int sizeH{get;set;}
        public int sizeW{get;set;}
        public long MemberID{get;set;}
        public String ImageName { get; set; }
    }

    public class MemberFieldNameValue
    {
        public String Name { get; set; }
        public String Value { get; set; }
        public int Type { get; set; }
    }


    [Authorize]
    [CompressFilter]
    [ReturnUrlFilter]
    [CustomAuthorizeNonBlockedAttribute]
    public class ProfileController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ResizeAvatarDialog( String Name, long ID = 0)
        {
            ResizeAvatarImageModel _model = new ResizeAvatarImageModel();
            
            _model.MemberID = ID;
            _model.ImageName = Name;
            
            return Json(new
            {
                Html = this.RenderPartialView(@"_ResizeAvatarImage", _model),

            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ResetAvatarUploadedImage(long ID = 0)
        {
            try
            {
                if (AppSession.AvatarTempImage != null)
                {
                    AppSession.AvatarTempImage.Dispose();
                    AppSession.AvatarTempImage = null;
                }
            }
            catch
            {
   
            }
            
            GC.Collect();
            return new EmptyResult();
        }

        public ActionResult ResetAvatarImage(long MemberID = 0)
        {
            RequestResultModel _model = new RequestResultModel();
        
            try
            {
                if (MemberID > 0 && MemberID == Profile.Member.MemberID && Profile.Member.Avatar != null && Profile.Member.Avatar.Length > 0)
                {
                    string Path = String.Format("{0}/{1}.jpg", Server.MapPath("~/Avatar"), Profile.Member.Avatar);
                    if (System.IO.File.Exists(Path))
                    {
                        System.IO.File.Delete(Path);
                    }

                    Profile.Member.Avatar = null;
                    Profile.Member.UpdateAvatar();
                }
                else if ((MemberID > 0 && MemberID != Profile.Member.MemberID && AppSession.IsMemberInAdminRole))
                {
                    Member Member = Members.GetBy(MemberID);
                    string Path = String.Format("{0}/{1}.jpg", Server.MapPath("~/Avatar"), Member.Avatar);
                    if (System.IO.File.Exists(Path))
                    {
                        System.IO.File.Delete(Path);
                    }

                    Member.Avatar = null;
                    Member.UpdateAvatar();
                }
     
                _model.Title = GetLabel("Account.Controller.Congrat");
                _model.InfoType = RequestResultInfoType.Success;
                _model.Message = "Avatar image has been reset.";

            }
            catch (Exception ex)
            {
                _model.Title = GetLabel("Account.Controller.Warning");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = "Avatar image has noot been reset: " + ex.Message;
            }

            String Message = this.RenderPartialView(@"_RequestResultPageInLine", _model);
            String FileURL = Url.Content("~/Content/images/no-photo.png");

            MemberSocialNetwork _memberNetwork = MemberSocialNetworks.GetByMemberID(MemberID);
            if (_memberNetwork.MemberSocialNetworkID > 0 && _memberNetwork.SocialNetworkID == 1)
                FileURL = String.Format("https://graph.facebook.com/{0}/picture?type=large",_memberNetwork.SocialNetworkUserID);
            else if (_memberNetwork.MemberSocialNetworkID > 0 && _memberNetwork.SocialNetworkID == 2)
                FileURL = String.Format("http://api.twitter.com/1/users/profile_image?screen_name={0}&size=bigger", _memberNetwork.SocialNetworkUserID); ;

            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = Message,
                FileURL = FileURL
            }, JsonRequestBehavior.AllowGet);            
        }

        public ActionResult UploadAvatarImage(long MemberID = 0)
        {
            System.Threading.Thread.Sleep(2000);

            Boolean FileOK = false;
            Boolean FileSaved = false;
            String Message = "";

            if (Request.Files.Count > 0)
            {
                String FileExtension = Path.GetExtension(Request.Files[0].FileName).ToLower();
                String[] allowedExtensions = { ".png", ".jpeg", ".jpg", ".gif", ".bmp" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (FileExtension.ToLower() == allowedExtensions[i])
                    {
                        FileOK = true;
                        break;
                    }
                }
            }

            try
            {
                String Guid = System.Guid.NewGuid().ToString();
                byte[] buffer = new byte[Request.Files[0].InputStream.Length];
                AppSession.AvatarTempImage = ProcessImage(Request.Files[0].InputStream, 640, 480);
                FileSaved = true;
            }
            catch (Exception ex)
            {
                RequestResultModel _model = new RequestResultModel();
                _model.Title = GetLabel("Account.Controller.Warning");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = ex.Message + (ex.InnerException != null ? " " + ex.InnerException.Message : "") ;

                Message = this.RenderPartialView(@"_RequestResultPageInLine", _model);
            }

            if (FileOK && FileSaved)
                return Content("{\"Message\": \"\", \"MemberID\":" + MemberID + ", \"Name\":\"" + Web.Admin.Logic.StringTool.RandomString(24).ToLower() + "\"}", "text/html");
            else
                return Content("{\"Message\":" + ToJson(Message) + ", \"MemberID\":" + MemberID + ", \"Name\":\"\"}", "text/html");
        }

        public ActionResult SetAvatarImage(ImageInfo ImageInfo)
        {
            RequestResultModel _model = new RequestResultModel();
            
            string Name = Web.Admin.Logic.StringTool.RandomString(24).ToLower();
            string Path = String.Format("{0}/{1}.jpg", Server.MapPath("~/Avatar"), Name);
            
            try
            {
                System.Drawing.Image OriginalImage = AppSession.AvatarTempImage;

                using (Bitmap bmp = new Bitmap(AppSession.AvatarImageSize, AppSession.AvatarImageSize, OriginalImage.PixelFormat))
                {
                    using (Graphics Graphic = System.Drawing.Graphics.FromImage(bmp))
                    {
                        Graphic.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
                        Graphic.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                        Graphic.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;

                        Graphic.DrawImage(OriginalImage, new System.Drawing.Rectangle(0, 0, AppSession.AvatarImageSize, AppSession.AvatarImageSize), ImageInfo.sizeX, ImageInfo.sizeY, ImageInfo.sizeW, ImageInfo.sizeH, System.Drawing.GraphicsUnit.Pixel);

                        MemoryStream streamThumb = new MemoryStream();
                        bmp.SetResolution(OriginalImage.HorizontalResolution, OriginalImage.VerticalResolution);
                        bmp.Save(streamThumb, System.Drawing.Imaging.ImageFormat.Jpeg);

                        FileStream fs = new FileStream(Path, FileMode.Create); 
                        byte[] imageBytes = streamThumb.ToArray();
                        fs.Write(imageBytes, 0, imageBytes.Length);
                        fs.Close();
                        fs.Dispose();

                        bmp.Dispose();
                        Graphic.Dispose();
                        OriginalImage.Dispose();

                        AppSession.AvatarTempImage.Dispose();
                        AppSession.AvatarTempImage = null;
                        streamThumb.Close();
                        streamThumb.Dispose();
                        System.GC.Collect();

                        if (ImageInfo.MemberID > 0 && AppSession.Profile.Member.MemberID == ImageInfo.MemberID)
                        {
                            if (Profile.Member.Avatar != null && Profile.Member.Avatar.Length > 0)
                            {
                                string PathPrev = String.Format("{0}/{1}.jpg", Server.MapPath("~/Avatar"), Profile.Member.Avatar);
                                if (System.IO.File.Exists(PathPrev))
                                {
                                    System.IO.File.Delete(PathPrev);
                                }
                            }

                            Profile.Member.Avatar = Name;
                            Profile.Member.UpdateAvatar();
                        }
                        else if (ImageInfo.MemberID > 0 && AppSession.Profile.Member.MemberID != ImageInfo.MemberID && AppSession.IsMemberInAdminRole)
                        {
                            Member Member = Members.GetBy(ImageInfo.MemberID);
                            if (Member.Avatar != null && Member.Avatar.Length > 0)
                            {
                                string PathPrev = String.Format("{0}/{1}.jpg", Server.MapPath("~/Avatar"), Member.Avatar);
                                if (System.IO.File.Exists(PathPrev))
                                {
                                    System.IO.File.Delete(PathPrev);
                                }
                            }

                            Member.Avatar = Name;
                            Member.UpdateAvatar();

                        }
                    }
                }

                _model.Title = GetLabel("Account.Controller.Congrat");
                _model.InfoType = RequestResultInfoType.Success;
                _model.Message = "Avatar image has been set.";

            }
            catch (Exception ex)
            {
                _model.Title = GetLabel("Account.Controller.Warning");
                _model.InfoType = RequestResultInfoType.ErrorOrDanger;
                _model.Message = "Avatar image has noot been set: " + ex.Message;
            }

            String Message = this.RenderPartialView(@"_RequestResultPageInLine", _model);
            
            return Json(new
            {
                NotifyType = NotifyType.PageInline,
                Html = Message,
                FileURL = Url.Content(String.Format("~/Avatar/{0}.jpg",Name))
            }, JsonRequestBehavior.AllowGet);
            
        }

        public ActionResult GetUploadedImage(long ID = 0)
        {
            Bitmap Image = AppSession.AvatarTempImage;

            using (MemoryStream ms = new MemoryStream())
            {
                Image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                return File(ms.ToArray(), "image/jpg");
            }
        }

        private Bitmap ProcessImage(Stream Source, int cw, int ch)
        {
            System.Drawing.Bitmap im = new System.Drawing.Bitmap(Source);

            System.IO.MemoryStream stream = new System.IO.MemoryStream();
            im.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
            stream.Close();
            stream.Dispose();

            int height = 0, width = 0;

            if (ch >= im.Height) { height = im.Height; width = im.Width; }
            else { height = ch; width = (int)((float)height * ((float)im.Width / im.Height)); }
            if (cw < width) { height = cw * height / width; width = cw; }

            System.Drawing.Bitmap thumb = new System.Drawing.Bitmap(width, height, im.PixelFormat);
            thumb.MakeTransparent(Color.White);
            thumb.SetResolution(im.HorizontalResolution, im.VerticalResolution);
            Graphics gThumb = Graphics.FromImage(thumb);

            gThumb.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBilinear;
            gThumb.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            gThumb.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;

            gThumb.DrawImage(im, -1, -1, width + 1, height + 1);
            gThumb.Dispose();

            System.IO.MemoryStream streamThumb = new System.IO.MemoryStream();
            thumb.Save(streamThumb, System.Drawing.Imaging.ImageFormat.Jpeg);
            
            im.Dispose();
            streamThumb.Close();
            streamThumb.Dispose();
            System.GC.Collect();
            
            return thumb;
        }

        public int GetBytesPerPixelByPixelFormat(System.Drawing.Imaging.PixelFormat Format)
        {
            int nBytesPerPixel = 0;

            switch (Format)
            {
                case System.Drawing.Imaging.PixelFormat.Format16bppArgb1555:
                case System.Drawing.Imaging.PixelFormat.Format16bppGrayScale:
                case System.Drawing.Imaging.PixelFormat.Format16bppRgb555:
                case System.Drawing.Imaging.PixelFormat.Format16bppRgb565:
                    {
                        nBytesPerPixel = 2;
                        break;
                    }
                case System.Drawing.Imaging.PixelFormat.Format24bppRgb:
                    {
                        nBytesPerPixel = 3;
                        break;
                    }
                case System.Drawing.Imaging.PixelFormat.Format32bppArgb:
                case System.Drawing.Imaging.PixelFormat.Format32bppPArgb:
                case System.Drawing.Imaging.PixelFormat.Format32bppRgb:
                    {
                        nBytesPerPixel = 4;
                        break;
                    }
                case System.Drawing.Imaging.PixelFormat.Format48bppRgb:
                    {
                        nBytesPerPixel = 6;
                        break;
                    }
                default:
                    {
                        nBytesPerPixel = 0;
                        break;
                    }
            }

            return nBytesPerPixel;
        }

        public ActionResult SaveProfile(List<ProfileFieldInfo> FieldInfo, string TimeZoneID)
        {
            System.Threading.Thread.Sleep(1000); 
            RequestResultModel _model = new RequestResultModel();
            _model.InfoType = RequestResultInfoType.ErrorOrDanger;
            _model.Message = "";

            // Check mandatory fields
            foreach (ProfileFieldInfo Field in FieldInfo)
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

            if (_model.Message.Length > 0)
            {
                _model.Message = String.Format("<ul class=\"error-message-list\">{0}</ul>", _model.Message);
                return Json(new
                {
                    Status = RequestResultInfoType.ErrorOrDanger,
                    NotifyType = NotifyType.DialogInline,
                    Message = HttpUtility.HtmlDecode(this.RenderPartialView(@"_RequestResultPageInLine", _model))

                }, JsonRequestBehavior.AllowGet);
            }

            if (Profile.Member.TimeZoneID != TimeZoneID)
                AuditEvent.AppEventInfo(AppSession.Profile.Member.Email, String.Format("Member updated time zone to: \"{0}\" ", Profile.Member.TimeZoneID));

            Profile.Member.TimeZoneID = TimeZoneID;
            Profile.Member.UpdateTimeZone();

            String FieldValues = "";
            List<MemberProfileField> memberProfileFields = MemberProfileFields.GetByMember(Profile.Member.MemberID);
            foreach (ProfileFieldInfo Field in FieldInfo)
            {
                String Value = Field.Value != null ? Field.Value.Trim() : Field.Value;
                ProfileField profileField = ProfileFields.GetBy(int.Parse(Field.ID));
                MemberProfileField memberProfileField = MemberProfileFields.GetField(memberProfileFields, int.Parse(Field.ID));

                if (profileField.Encrypted == 1 && memberProfileField.FieldValue != null && memberProfileField.FieldValue.Length > 0)
                {
                    memberProfileField.FieldValue = Encryptor.DecryptStringAES(memberProfileField.FieldValue, AppSession.EncryptionKey);
                }

                if (Value != memberProfileField.FieldValue)
                    FieldValues += String.Format("<b>Name</b>:  {0} <b>Before:</b>  \"{1}\" <b>Now:</b>  \"{2}\"<br/>", profileField.FieldName, memberProfileField.FieldValue, Value);
                
                memberProfileField.MemberID = Profile.Member.MemberID;
                memberProfileField.FieldID = int.Parse(Field.ID);
                memberProfileField.FieldValue = Value;

                if (profileField.Encrypted == 1 && memberProfileField.FieldValue != null && memberProfileField.FieldValue.Length > 0)
                {
                    memberProfileField.FieldValue = Encryptor.EncryptStringAES(memberProfileField.FieldValue, AppSession.EncryptionKey);
                }
                
                memberProfileField.Save();
            }

            memberProfileFields = MemberProfileFields.GetByMember(Profile.Member.MemberID);

            List<MemberFieldNameValue> MemberFieldNameValues = new List<MemberFieldNameValue>();            
            foreach (MemberProfileField memberField in memberProfileFields)
                MemberFieldNameValues.Add(new MemberFieldNameValue { Name = memberField.ProfileFieldID.ToString(), Value = memberField.FieldValue, Type = (int)ProfileFields.GetBy(memberField.FieldID).FieldTypeID});

            _model.Message = "Your profile has been updated successfully.";
            _model.InfoType = RequestResultInfoType.Success;

            AuditEvent.AppEventInfo(AppSession.Profile.Member.Email, String.Format("Profile of \"{0}\" {1} member has been updated successfully.",AppSession.Profile.Member.Name,AppSession.Profile.Member.Email) , AuditEvent.GetSessionDetails(FieldValues));

            return Json(new
            {
                Status = RequestResultInfoType.Success,
                NotifyType = NotifyType.DialogInline,
                Message = HttpUtility.HtmlDecode(this.RenderPartialView(@"_RequestResultPageInLine", _model)),
                MemberFields = MemberFieldNameValues,
                TimeZoneID = Profile.Member.TimeZoneID != null && Profile.Member.TimeZoneID.Length > 0 ? Profile.Member.TimeZoneID : ""

            }, JsonRequestBehavior.AllowGet);

        }
    }
}
