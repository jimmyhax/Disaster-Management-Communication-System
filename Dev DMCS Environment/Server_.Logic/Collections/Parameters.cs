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
    /// Provides the possibility to get an instance or instance collection of Parameter objects. 
    /// </summary>
    public class Parameters : ApplicationCollection<Parameter, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets instance of Parameter object by the parameter unique identifier.
        /// </summary>
        /// <param name="ID">Parameter unique identifier</param>
        /// <returns>Instance of Parameter object if it exists.</returns>
        public static Parameter GetBy(long ID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT t1.*,t2. FROM {0} t1 LEFT JOIN ParameterTypes t2 ON t1.TypeID = t2.TypeID WHERE ID = @ID",Table));
            sp.AddParameter("ID", ID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets instance of Parameter object by the parameter unique name.
        /// </summary>
        /// <param name="Name">Parameter unique name.</param>
        /// <returns>Instance of Parameter object if it exists.</returns>
        public static Parameter GetBy(string Name)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} t1 LEFT JOIN ParameterTypes t2 ON t1.TypeID = t2.TypeID WHERE t1.Name = @Name",Table));
            sp.AddParameter("Name", Name);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets the list of all Parameter object instances.
        /// </summary>
        /// <returns>List of all Parameter objects in the database. </returns>
        public static List<Parameter> Get()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} t1 LEFT JOIN ParameterTypes t2 ON t1.TypeID = t2.TypeID", Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Searches MemberProfileField object in the list by field unique identifier.
        /// </summary>
        /// <param name="List">List of MemberProfileField objetcs.</param>
        /// <param name="Name">Field name.</param>
        /// <returns>Instance of Parameter object if it exists.</returns>
        public static Parameter GetParameter(List<Parameter> List, String Name)
        {
            Parameter parameter = List.Where(t => t.Name.ToLower() == Name.ToLower()).FirstOrDefault();
            return parameter == default(Parameter) ? new Parameter() : parameter;
        }
    }
}
