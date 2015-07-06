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
    /// Provides the possibility to get single insatnce of MemberSocialNetwork object or collection of MemberSocialNetwork object instances.
    /// </summary>
    public class MemberSocialNetworks : ApplicationCollection<MemberSocialNetwork, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets MemberSocialNetwork object insatnce by unique identifier
        /// </summary>
        /// <param name="MemberSocialNetworkID"></param>
        /// <returns>Insatnce of MemberSocialNetwork object.</returns>
        public static MemberSocialNetwork GetBy(long MemberSocialNetworkID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE MemberSocialNetworkID = @MemberSocialNetworkID", Table));
            sp.AddParameter("MemberSocialNetworkID", MemberSocialNetworkID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets MemberSocialNetwork object insatnce by unique identifier
        /// </summary>
        /// <param name="MemberID"></param>
        /// <returns>Insatnce of MemberSocialNetwork object.</returns>
        public static MemberSocialNetwork GetByMemberID(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE MemberID = @MemberID", Table));
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets collection of all MemberSocialNetwork in the database.
        /// </summary>
        /// <returns>List of MemberSocialNetwork object insatnces.</returns>
        public static List<MemberSocialNetwork> Get()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0}",Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets MemberSocialNetwork object insatnce by unique identifier, network, user id.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <param name="SocialNetworkID">Social network unique identifier. 1 - Facebook, 2 - Twitter</param>
        /// <param name="SocialNetworkUserID">Social network unique identifier</param>
        /// <returns></returns>
        public static MemberSocialNetwork GetByMemberID(long MemberID, int SocialNetworkID, string SocialNetworkUserID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE MemberID = @MemberID AND SocialNetworkID = @SocialNetworkID AND SocialNetworkUserID = @SocialNetworkUserID", Table));
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("SocialNetworkID", SocialNetworkID);
            sp.AddParameter("SocialNetworkUserID", SocialNetworkUserID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets MemberSocialNetwork object insatnce by sign in email.
        /// </summary>
        /// <param name="Email">Member signin email.</param>
        /// <returns>Insatnce of MemberSocialNetwork object.</returns>
        public static MemberSocialNetwork GetBySignInEmail(String Email)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE MemberID = (SELECT MemberID FROM Members WHERE Email=@Email)", Table));
            sp.AddParameter("Email", Email);
            return GetApplicationObject(sp);
        }

    }
}
