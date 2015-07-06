using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public class AuditEventModel
    {
        public List<AuditEventItemDetail> AuditEventItems { get; set; }
        public AuditEvent AuditEvent { get; set; }      
    }
}