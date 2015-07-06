using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Controllers;


namespace Web.Admin.Models
{
    public class MemberRoleListInlineModel
    {
        public List<Role> AllRoles { get; set; }
        public List<Role> MemberRoles { get; set; }
        public Member Member { get; set; }
    }
}