using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public class MemberProfileFieldModel
    {
        
        public MemberProfileFieldModel(Member Member)
        {
            this.Member = Member;
        }        
        
        public Member Member { get; set; }

    }
}