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
    /// Provides the possibility to get an instance or instance collection of MemberTokens objects. This type of token will be used for API requests.
    /// </summary>
    public class MemberTokens : ApplicationCollection<MemberToken, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Return instance of MemberToken object by token member unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns>Instance of MemberToken object.</returns>
        public static MemberToken GetByMember(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE MemberID = @MemberID",Table));
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Return instance of MemberToken object by token string.
        /// </summary>
        /// <param name="Token">Token string.</param>
        /// <returns>Instance of MemberToken object.</returns>
        public static MemberToken GetByToken(string Token)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE Token = @Token",Table));
            sp.AddParameter("Token", Token);
            return GetApplicationObject(sp);
        }
    }
}
