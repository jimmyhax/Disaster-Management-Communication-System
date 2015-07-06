using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public class ProfileFieldGroupFieldModel
    {
        public ProfileFieldGroupFieldModel(ProfileField Field)
        {
            this.Field = Field;
        }

        public ProfileField Field { get; set; }
        public int tabIndex { get; set; }

    }
}