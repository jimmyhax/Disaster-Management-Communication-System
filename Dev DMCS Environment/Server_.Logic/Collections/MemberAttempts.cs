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
    /// Provides the possibility to get an instance or instance collection of MemberAttempt objects.
    /// </summary>
    public class MemberAttempts : ApplicationCollection<MemberAttempt, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets valid instance of Members Attempt object for specific date, member and type.
        /// </summary>
        /// <param name="MemberID">Member unique identifier number.</param>
        /// <param name="Date">Date</param>
        /// <param name="AttemptType">Type of attempt.</param>
        /// <returns>Insatnce of MemberAttempt objects.</returns>
        public static MemberAttempt GetValid(long MemberID, DateTime Date, MemberAttemptTypes AttemptType)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0}
                    WHERE MemberID = @MemberID AND 
                    AttemptType = @AttemptType AND  
                    IsAttemptValid = 1  AND 
                    Year(Created) = Year(@Created) AND Month(Created) = Month(@Created) AND Day(Created) = Day(@Created)", Table));
            
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("Created", Date);
            sp.AddParameter("AttemptType", AttemptType);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets instance of Members Attempt object for specific member and type.
        /// </summary>
        /// <param name="MemberID">Member unique identifier number.</param>
        /// <param name="AttemptType">Type of attempt.</param>
        /// <returns>List of MemberAttempt objects.</returns>
        public static List<MemberAttempt> Get(long MemberID, MemberAttemptTypes AttemptType)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0}
                    WHERE MemberID = @MemberID AND 
                    AttemptType = @AttemptType",Table));

            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("AttemptType", AttemptType);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets all MemberAttempt instances by member unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns>c</returns>
        public static List<MemberAttempt> Get(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0} 
                    WHERE MemberID = @MemberID",Table));
            
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        ///  Returns valid instance of MemberAttempt object for specific member and date.
        /// </summary>
        /// <param name="MemberID">Member unique identifier number.</param>
        /// <returns>Insatnce of MemberAttempt object.</returns>
        public static MemberAttempt GetTodayLoginPasswordFail(long MemberID)
        {
            return GetValid(MemberID, DateTime.UtcNow, MemberAttemptTypes.LoginPasswordFailed);
        }
    }
}
