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
    /// Provides the possibility to get single insatnce of language object or collection of Language object instances.
    /// </summary>
    public class Languages : ApplicationCollection<Language, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets Language object insatnce by unique identifier
        /// </summary>
        /// <param name="LanguageID"></param>
        /// <returns>Insatnce of Language object.</returns>
        public static Language GetBy(long LanguageID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE LanguageID = @LanguageID",Table));
            sp.AddParameter("LanguageID", LanguageID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets collection of all languages in the database.
        /// </summary>
        /// <returns>List of language object insatnces.</returns>
        public static List<Language> Get()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0}",Table));
            return GetApplicationCollection(sp);
        }
    }
}
