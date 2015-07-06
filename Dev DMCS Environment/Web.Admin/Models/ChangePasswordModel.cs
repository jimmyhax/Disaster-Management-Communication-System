using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public class ChangePasswordModel
    {
        public string Email {get;set;}
        public string Name {get;set;}
        public string Token { get; set; }
    }
}