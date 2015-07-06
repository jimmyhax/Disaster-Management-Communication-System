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
    /// Provides the possibility to get an instance or instance collection of ProfileFieldType objects.
    /// </summary>
    public class ProfileFieldTypes : ApplicationCollection<ProfileFieldType, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets instance of ProfileFieldType object by unique identifier.
        /// </summary>
        /// <param name="FieldTypeID">FieldType unique identifie.r</param>
        /// <returns>Instance of ProfileFieldType object.</returns>
        public static ProfileFieldType Get(int FieldTypeID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE FieldTypeID = @FieldTypeID", Table));
            sp.AddParameter("FieldTypeID", FieldTypeID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets the list of all ProfileFieldTyp object instances.
        /// </summary>
        /// <returns>Instance of ProfileFieldType object.</returns>
        public static List<ProfileFieldType> Get()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0}", Table));
            return GetApplicationCollection(sp);
        }
    }
}
