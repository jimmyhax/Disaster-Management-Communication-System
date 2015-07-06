using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Logic.Objects;

namespace Web.Admin.Logic.Collections
{
    /// <summary>
    /// Conatins methods an properties which are connected with session member profile management in the admn application.
    /// </summary>
    public class MemberProfile
    {
        /// <summary>
        /// A session member.
        /// </summary>
        public Member Member { set; get; }

        /// <summary>
        /// A member default languga.
        /// </summary>
        public String Language { set; get; }

        /// <summary>
        /// List of member roles.
        /// </summary>
        public List<Role> Roles
        {
            get { return Web.Admin.Logic.Collections.Roles.GetByMember(Member.MemberID); }
        }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberProfile()
        {
            this.Member = new Member();
            this.Language = "eng";
        }

        /// <summary>
        /// The class constructor.
        /// </summary>
        /// <param name="Member">Member object.</param>
        public MemberProfile(Member Member)
        {
            this.Member = Member;
            this.Language = "eng";
        }

        /// <summary>
        /// True if the member is in admin role.
        /// </summary>
        public static bool IsInRoleAdmin
        {
            get { return IsInRole("admins"); }
        }

        /// <summary>
        /// True if the member was blocked.
        /// </summary>
        public static bool IsInRoleBlocked
        {
            get { return IsInRole("blocked"); }
        }

        /// <summary>
        /// Gets true if the member is in specific role.
        /// </summary>
        /// <param name="Name">Role name.</param>
        /// <returns>True if the member is in specific role.</returns>
        private static bool IsInRole(string Name)
        {
            MemberProfile profile = (MemberProfile)HttpContext.Current.Session["MemberProfile"];

            if (profile == null)
                return false;

            foreach (Role Role in profile.Roles)
            {
                if (Role.Name.ToLower() == Name.ToLower())
                    return true;
            }

            return false;
        }

        /// <summary>
        /// Logged member profile object.
        /// </summary>
        public static MemberProfile CurrentProfile
        {
            get
            {
                if (HttpContext.Current.Session == null)
                {
                    return new MemberProfile();
                }

                if (HttpContext.Current.Session["MemberProfile"] != null)
                    return (MemberProfile)HttpContext.Current.Session["MemberProfile"];
                else if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Member member = Members.GetByEmail(HttpContext.Current.User.Identity.Name.ToLower());
                    HttpContext.Current.Session["MemberProfile"] = new MemberProfile(member);
                    return (MemberProfile)HttpContext.Current.Session["MemberProfile"];
                }
                else
                    return null;
            }
        }
    }
}
