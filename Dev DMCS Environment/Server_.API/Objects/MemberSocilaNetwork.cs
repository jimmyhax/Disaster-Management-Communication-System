using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Server_.API.Objects
{

    /// <summary>
    /// Provides a wrapper on single row in the MemberSocialNetworks database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using MemberSocialNetworks class which returns collection of MemberSocialNetwork objects by different condition.
    /// </summary>    
    public class MemberSocialNetwork
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public long MemberSocialNetworkID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>        
        public long MemberID { get; set; }

        /// <summary>
        /// Social network unique identifier. 1 - Facebook, 2 - Twitter 
        /// </summary>
        public int SocialNetworkID { get; set; }

        /// <summary>
        /// Unique user identifier in the a social network.
        /// </summary>
        public string SocialNetworkUserID { get; set; }

        /// <summary>
        /// User email for the a social network login.
        /// </summary>
        public string SocialNetworkUserEmail { get; set; }

        /// <summary>
        /// User name for the a social network login.
        /// </summary>        
        public string SocialNetworkUserName { get; set; }

        /// <summary>
        /// User access token  for the a social network login.
        /// </summary>        
        public string AccessToken { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberSocialNetwork()
        {

        }
    }
}
