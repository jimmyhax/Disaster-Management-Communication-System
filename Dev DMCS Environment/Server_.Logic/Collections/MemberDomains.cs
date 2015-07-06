using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

using Web.Admin.Logic.Utilities;
using Web.Admin.Logic.Objects;

namespace Web.Admin.Logic.Collections
{
    /// <summary>
    /// Provides the possibility to get single insatnce of MemberDomain object or collection of MemberDomain object instances.
    /// </summary>
    public class MemberDomains : ApplicationCollection<MemberDomain, DbRoleAdmin, SpRoleAdmin>
    {
       
    }
}
