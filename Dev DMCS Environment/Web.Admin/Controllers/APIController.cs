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
using Roles = Web.Admin.Logic.Collections.Roles;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Xml;
using System.Text;

namespace Web.Admin.Controllers
{
    public class RoleCollection : List<Role> { }

    [CompressFilter]
    public class APIController : BaseController
    {
        String TypeJson = "application/json";

        [Authorize]    
        [CustomAuthorize(Roles = "Admins")]
        public ActionResult Index()
        {
            return View();
        }

        //[CustomAPIAuthorize(Roles = "API Members")]
        public JsonResult Ping()
        {
            return Json(new
            {
                Message = "200",
                Data = "Ok"
            }, JsonRequestBehavior.AllowGet);

        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetRoles()
        {
            String Json = Roles.JsonCollection(Roles.Get());
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetMemberRolesByID(long MemberID)
        {
            String Json = Roles.JsonCollection(Roles.GetByMember(MemberID));
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetMemberRolesByEmail(String MemberEmail)
        {
            Member _Member = Members.GetByEmail(MemberEmail);

            String Json = Roles.JsonCollection(Roles.GetByMember(_Member.MemberID));
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetMembers(MemberListFilter Filter)
        {
            Filter.SortColumnName = "MemberID";
            Filter.SortOrderAsc = true;

            var totalItems = 0;
            var _Members = Members.Get(Filter, out totalItems);

            String Json = Members.JsonCollection(_Members);
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetMemberByID(long MemberID)
        {
            var _Member = Members.GetBy(MemberID);

            String Json = Members.JsonItem(_Member);
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetMemberByEmail(String Email)
        {
            var _Member = Members.GetByEmail(Email);

            String Json = Members.JsonItem(_Member);
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetAuditEvents(AuditEventListFilter Filter)
        {
            Filter.Search = "";
            Filter.SortColumnName = "EventID";

            var totalItems = 0;
            var _Events = AuditEvents.Get(Filter, out totalItems);

            String Json = AuditEvents.JsonCollection(_Events);
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetAuditEventDetails(long EventID)
        {
            var _Event = AuditEvents.GetBy(EventID);

            String Json = AuditEventItemDetails.JsonCollection(AuditEvent.GetAuditEventDetails(_Event));
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult AuthenticateMember(string EmailOrName, String Password)
        {
            Member Member = Members.GetByEmailOrName(EmailOrName, EmailOrName);
            String Json = "";
            
            if (Member.MemberID > 0 && base.Authenticate(ref EmailOrName, Password))
                Json = Members.JsonItem(Member);
            else
                Json = Members.JsonItem(new Member());
            
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult AssignRoleMemberByID(long MemberID, long[] AssignRoles)
        {
            Member member = Members.GetBy(MemberID);
            foreach (long _roleID in AssignRoles)
            {
                Role Role = Roles.GetBy(_roleID);
                if (Role.RoleID > 0)
                {
                    MemberRole memberrole = new MemberRole();
                    memberrole.MemberID = MemberID;
                    memberrole.RoleID = Role.RoleID;
                    memberrole.Save();
                }
            }

            String Json = Roles.JsonCollection(Roles.GetByMember(MemberID));
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult AssignRoleMemberByName(string Email, string[] AssignRoles)
        {
            Member Member = Members.GetByEmail(Email);
            foreach (string _roleID in AssignRoles)
            {
                Role Role = Roles.GetBy(_roleID);
                if (Role.RoleID > 0)
                {
                    MemberRole memberrole = new MemberRole();
                    memberrole.MemberID = Member.MemberID;
                    memberrole.RoleID = Role.RoleID;
                    memberrole.Save();
                }
            }

            String Json = Roles.JsonCollection(Roles.GetByMember(Member.MemberID));
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult UnAssignMemberRoleByID(long MemberID, long[] UnAssignRoles)
        {
            Member member = Members.GetBy(MemberID);

            foreach (long RoleID in UnAssignRoles)
            {
                Role role = Roles.GetBy(RoleID);

                // Ignore admin in admins role
                if (member.Name.ToLower() == "admin" && role.Name.ToLower() == "admins")
                {

                }
                else
                {
                    MemberRole memberrole = new MemberRole();
                    memberrole.MemberID = MemberID;
                    memberrole.RoleID = RoleID;
                    memberrole.Delete();
                }

            }
            
            String Json = Roles.JsonCollection(Roles.GetByMember(MemberID));
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult UnAssignMemberRolesByName(string Email, string[] UnAssignRoles)
        {
            Member Member = Members.GetByEmail(Email);

            foreach (string RoleName in UnAssignRoles)
            {
                Role Role = Roles.GetBy(RoleName);
                // Ignore admin in admins role
                if (Member.Name.ToLower() == "admin" && Role.Name.ToLower() == "admins")
                {

                }
                else
                {
                    MemberRole memberrole = new MemberRole();
                    memberrole.MemberID = Member.MemberID;
                    memberrole.RoleID = Role.RoleID;
                    memberrole.Delete();
                }
            }

            String Json = Roles.JsonCollection(Roles.GetByMember(Member.MemberID));
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetMemberSocialNetwork(long MemberID)
        {
            var _Networks = MemberSocialNetworks.GetByMemberID(MemberID);

            String Json = MemberSocialNetworks.JsonItem(_Networks);
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetMemberSocialNetworksBySignInEmail(String Email)
        {
            var _Networks = MemberSocialNetworks.GetBySignInEmail(Email);

            String Json = MemberSocialNetworks.JsonItem(_Networks);
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetSocialSignInAvailability()
        {
            var _SocialSignIn = new SocialSignInAvailability();

            _SocialSignIn.Twitter = AppSession.Parameters.SocialTwitterEnabled.Value == "true" ? true : false;
            _SocialSignIn.Facebook = AppSession.Parameters.SocialFacebookEnabled.Value == "true" ? true : false;
            _SocialSignIn.Google = AppSession.Parameters.SocialGooleEnabled.Value == "true" ? true : false;
            _SocialSignIn.Yahoo = AppSession.Parameters.SocialYahooEnabled.Value == "true" ? true : false;
            _SocialSignIn.LiveJournal = AppSession.Parameters.SocialLiveJournalEnabled.Value == "true" ? true : false;
            _SocialSignIn.Blogger = AppSession.Parameters.SocialBloggerEnabled.Value == "true" ? true : false;
            _SocialSignIn.OpenID = AppSession.Parameters.SocialOpenIDEnabled.Value == "true" ? true : false;
            _SocialSignIn.myOpenID = AppSession.Parameters.SocialMyOpenIDEnabled.Value == "true" ? true : false;

            String Json = SocialSignInAvailabilities.JsonItem(_SocialSignIn);
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult GetSignInAuthTicket(string Email, string AuthToken)
        {
            String Json = "";
            Member Member = Members.GetByEmail(Email);
            AuthMemberTicket _AuthMemberTicket = AuthMemberTickets.GetByMemberToken(Member.MemberID, AuthToken);
            
            // Check does session exists for requested token. If doesn't return emty object, so client will be redirected to sign in page.
            if (_AuthMemberTicket.AuthMemberTicketID <= 0)
            {
                Json = SingInAuthTickets.JsonItem(
                   new SingInAuthTicket()
                   {
                       MemberName = "",
                       MemberEmail = "",
                       EncrytedTicket = "",
                       IsPersistant = 0,
                   }
               );
            }
            else
            {
                string CookieName = FormsAuthentication.FormsCookieName;
                string CookiePath = FormsAuthentication.FormsCookiePath;
                int IsPersistent = _AuthMemberTicket.IsPersistent;

                AuthMemberToken _ticketMemberSession = new AuthMemberToken()
                {
                    MemberID = Member.MemberID,
                    MemberEmail = Member.Email,
                    MemberName = Member.Name,
                    Token = AuthToken,
                    Domain = Request.Url.DnsSafeHost
                };

                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1,
                    Member.Email,
                    DateTime.Now,
                    _AuthMemberTicket.Expiration,
                    IsPersistent == 1 ? true : false,
                    ToJson(_ticketMemberSession),
                    CookiePath);

                string cookieEncrypted = FormsAuthentication.Encrypt(authTicket);

                Json = SingInAuthTickets.JsonItem(
                 new SingInAuthTicket()
                 {
                     MemberName = Member.Name,
                     MemberEmail = Member.Email,
                     EncrytedTicket = cookieEncrypted,
                     IsPersistant = IsPersistent
                 }
               );
            
            }
            
            return Content(Json, TypeJson);
        }

        [CustomAPIAuthorize(Roles = "API Members")]
        public ContentResult IsAuthTicketValid(string Email, string AuthToken)
        {
            String Json = "";
            bool result = false;
            Member Member = Members.GetByEmail(Email);
            AuthMemberTicket _AuthMemberTicket = AuthMemberTickets.GetByMemberToken(Member.MemberID, AuthToken);

            // Check does session exists for requested token. If doesn't return emty object, so client will be redirected to sign in page.
            if (_AuthMemberTicket.AuthMemberTicketID <= 0)
            {
                result = false;
            }
            else if (_AuthMemberTicket.AuthMemberTicketID > 0 && _AuthMemberTicket.Expiration < DateTime.Now)
            {
                _AuthMemberTicket.Delete();
                result = false;
            }
            else
            {
                result = true;
            }

            Json = ActionValidationResults.JsonItem(new ActionValidationResult() { IsValid = result, Expiration = _AuthMemberTicket.Expiration != DateTime.MinValue ?  _AuthMemberTicket.Expiration : DateTime.Now.AddDays(-1)});
            return Content(Json, TypeJson);
        }
    }
}


