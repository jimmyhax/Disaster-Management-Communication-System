using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public enum ProfileFieldDomainRoleMode { 
        Domain = 1,
        Role = 2
    }
    
    public class ProfileFieldDomainRoleModel
    {
        public ProfileFieldDomainRoleModel(String Name, ProfileFieldDomainRoleMode Mode)
        {
            this.Name = Name;
            this.Mode = Mode;
        }        
        
        public string Name{ get; set; }
        public ProfileFieldDomainRoleMode Mode { get; set; }
        public String Value { get; set; }

    }
}