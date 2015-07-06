using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Collections;

using SimpleTools.RoleAdmin.Logic.Utilities;
using SimpleTools.RoleAdmin.Logic.Objects;

namespace SimpleTools.RoleAdmin.Logic.Collections
{
	/// <summary>
    /// IPRestrictions.
	/// </summary>
    public class IPRestrictions : ApplicationCollection<IPRestriction, DbRoleAdmin, SpRoleAdmin>
	{
        public IPRestrictions()
		{
			
		}

        public static List<IPRestriction> Get()
		{
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} ", Table));                   
            return GetApplicationCollection(sp);
		}

        public static IPRestriction GetByID(int Id)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE IPId = @IPId",Table));        
            sp.AddParameter("IPId", Id);
            return GetApplicationObject(sp);
        }
	}
}
