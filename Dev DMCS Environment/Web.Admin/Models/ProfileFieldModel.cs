using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public enum ProfileFieldMode { 
        SignUp = 1,
        Edit = 2
    }
    
    public class ProfileFieldModel
    {
        public ProfileFieldModel(ProfileField Field, ProfileFieldMode Mode, String Value = "")
        {
            this.Field = Field;
            this.Mode = Mode;
            this.Value = Value;
        }        
        
        public ProfileField Field { get; set; }
        public ProfileFieldMode Mode { get; set; }
        public String Value { get; set; }

    }
}