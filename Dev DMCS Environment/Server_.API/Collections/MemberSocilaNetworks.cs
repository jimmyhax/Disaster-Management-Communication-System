using System;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;

using System.Collections.Generic;
using System.Runtime.Serialization.Json;
using Server_.API.Objects;
using Server_.API.Utilities;

namespace Server_.API.Collections
{
    /// <summary>
    /// Provides getting collection of the memners using HTTP call to API web application.   
    /// </summary>
    public class MemberSocialNetworks : Collection<MemberSocialNetwork>
    {
        /// <summary>
        /// Keeps information abbout current connection.
        /// </summary>        
        public static Connection Connection { get; set; }

        /// <summary>
        /// Gets a member by member unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns>Instance of the Member class. </returns>
        public static MemberSocialNetwork GetMemberSocialNetworks(long MemberID)
        {
            return GetItem(new StreamReader(Tools.StreamPost("GetMemberSocialNetwork", MemberSocialNetworks.Connection, new { MemberID = MemberID })));
        }

        /// <summary>
        /// Gets a member by member unique identifier.
        /// </summary>
        /// <param name="Email">Member Email.</param>
        /// <returns>Instance of the Member class. </returns>
        public static MemberSocialNetwork GetMemberSocialNetworksBySignInEmail(string Email)
        {
            return GetItem(new StreamReader(Tools.StreamPost("GetMemberSocialNetworksBySignInEmail", MemberSocialNetworks.Connection, new { Email = Email })));
        }
    }
}
