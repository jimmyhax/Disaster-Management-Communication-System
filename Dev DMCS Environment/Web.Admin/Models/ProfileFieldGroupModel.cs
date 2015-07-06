using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public class ProfileFieldGroupModel
    {
        public ProfileFieldGroupModel(String Name)
        {
            ProfileFieldGroup FieldGroup = ProfileFieldGroups.GetByName(Name);
            this.FieldGroup = FieldGroup;
        }

        public ProfileFieldGroupModel(String Name, String DomainName)
        {
            ProfileFieldGroup FieldGroup = ProfileFieldGroups.GetByName(Name);
            this.FieldGroup = FieldGroup;
            this.DomainName = DomainName;
        }


        public ProfileFieldGroupModel(ProfileFieldGroup FieldGroup)
        {
            this.FieldGroup = FieldGroup;
        }

        public ProfileFieldGroup FieldGroup { get; set; }
        public string DomainName { get; set; }
    }
}