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
    /// Provides the possibility to get an instance or instance collection of MemberProfileField objects.
    /// </summary>
    public class MemberProfileFields : ApplicationCollection<MemberProfileField, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets instance of Members Attempt object by unique identifier.
        /// </summary>
        /// <param name="ProfileFieldID">Field unique identifier.</param>
        /// <returns>Instance of MemberProfileField object.</returns>
        public static MemberProfileField GetBy(long ProfileFieldID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT t1.*, t2.FieldName FROM {0} t1 LEFT JOIN ProfileFields t2 ON t1.FieldID = t2.FieldID  WHERE t1.ProfileFieldID=@ProfileFieldID", Table));
            sp.AddParameter("ProfileFieldID", ProfileFieldID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets list of MemberProfileField object instances by member unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns>List of MemberProfileField object insatnces.</returns>
        public static List<MemberProfileField> GetByMember(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT t1.*, t2.FieldName FROM {0} t1 LEFT JOIN ProfileFields t2 ON t1.FieldID = t2.FieldID  WHERE t1.MemberID=@MemberID", Table));
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Searches MemberProfileField object in the list by field unique identifier.
        /// </summary>
        /// <param name="List">List of MemberProfileField objetcs.</param>
        /// <param name="FieldID">Field unique identifier.</param>
        /// <returns></returns>
        public static MemberProfileField GetField(List<MemberProfileField> List, int FieldID)
        {
            MemberProfileField field = List.Where(t => t.FieldID == FieldID).FirstOrDefault();
            return field == default(MemberProfileField) ? new MemberProfileField() : field;
        }

        /// <summary>
        /// Searches MemberProfileField object in the list by field name.
        /// </summary>
        /// <param name="List">List of MemberProfileField objetcs.</param>
        /// <param name="FieldName">Field name.</param>
        /// <returns></returns>
        public static MemberProfileField GetField(List<MemberProfileField> List, String FieldName)
        {
            MemberProfileField field = List.Where(t => t.FieldName == FieldName).FirstOrDefault();
            return field == default(MemberProfileField) ? new MemberProfileField() : field;
        }
    }
}
