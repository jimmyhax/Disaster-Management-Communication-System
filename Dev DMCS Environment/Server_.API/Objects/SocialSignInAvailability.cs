using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web;
using System.Security.Principal;
using Server_.API.Utilities;
using System.IO;

namespace Server_.API.Objects
{
    /// <summary>
    /// Social SignIn Availability structure for API using.
    /// </summary>
    public class SocialSignInAvailability
    {
        /// <summary>
        /// Is Twitter singin switched on
        /// </summary>
        public bool Twitter{get;set;}
        /// <summary>
        /// Is Facebook singin switched on
        /// </summary>
        public bool Facebook{get;set;}
        /// <summary>
        /// Is Google singin switched on
        /// </summary>        
        public bool Google{get;set;}
        /// <summary>
        /// Is Yahoo singin switched on
        /// </summary>        
        public bool Yahoo{get;set;}
        /// <summary>
        /// Is LiveJournal singin switched on
        /// </summary>        
        public bool LiveJournal{get;set;}
        /// <summary>
        /// Is Blogger singin switched on
        /// </summary>        
        public  bool Blogger{get;set;}
        /// <summary>
        /// Is OpenID singin switched on
        /// </summary>        
        public bool OpenID {get;set;}
        /// <summary>
        /// Is myOpenID singin switched on
        /// </summary>        
        public bool myOpenID { get; set; }

    }

}