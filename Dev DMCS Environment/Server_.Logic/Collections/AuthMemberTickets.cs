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
    /// Provides the possibility to get single insatnce of AuthMemberToken object or collection of AuthMemberToken object instances.
    /// </summary>
    public class AuthMemberTickets : ApplicationCollection<AuthMemberTicket, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets AuthMemberToken object insatnce by unique identifier
        /// </summary>
        /// <param name="AuthMemberTokenID"></param>
        /// <returns>Insatnce of AuthMemberToken object.</returns>
        public static AuthMemberTicket GetBy(long AuthMemberTokenID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE AuthMemberTicketID = @AuthMemberTicketID", Table));
            sp.AddParameter("AuthMemberTokenID", AuthMemberTokenID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets AuthMemberToken object insatnce by member unique identifier and token.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <param name="Token">Member's auth token.</param>
        /// <returns></returns>
        public static AuthMemberTicket GetByMemberToken(long MemberID, string Token)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE MemberID = @MemberID AND Token = @Token", Table));
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("Token", Token);            
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Removes  AuthMemberToken object insatnces by member unique identifier and token.
        /// </summary>
        /// <param name="MemberID"></param>
        /// <param name="Token"></param>
        /// <returns></returns>
        public static AuthMemberTicket DeleteMemberToken(long MemberID, string Token)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE MemberID = @MemberID AND Token = @Token", Table));
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("Token", Token);
            return GetApplicationObject(sp);
        }


        /// <summary>
        /// Removes All AuthMemberToken object insatnces by member unique identifier.
        /// </summary>
        /// <param name="MemberID"></param>
        /// <returns></returns>
        public static AuthMemberTicket DeleteMemberAllTokens(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE MemberID = @MemberID", Table));
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Returns AuthMemberToken object insatnces by member unique identifier.
        /// </summary>
        /// <param name="MemberID"></param>
        /// <returns></returns>
        public static AuthMemberTicket GetLastByMember(long MemberID)
        {
            string MsSQL = "";
            string MySQL = "";

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer: MsSQL = "TOP 1"; break;
                case DatabaseProvider.MySQLServer: MySQL = "LIMIT 1"; break;
            }

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT {1} * FROM {0} WHERE MemberID = @MemberID ORDER BY AuthMemberTicketID DESC {2}", Table, MsSQL, MySQL));
            
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationObject(sp);
        }

    }
}
