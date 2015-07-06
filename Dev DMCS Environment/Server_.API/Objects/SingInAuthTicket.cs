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
    /// API sign in tikect.
    /// </summary>
    public class SingInAuthTicket
    {
        /// <summary>
        /// Member unique item identifier.
        /// </summary>
        public long MemberID { get; set; }
        /// <summary>
        /// Member name.
        /// </summary>
        public string MemberName { get; set; }
        /// <summary>
        /// Member email.
        /// </summary>
        public string MemberEmail { get; set; }
        /// <summary>
        /// Encryted ticket string.
        /// </summary>
        public string EncrytedTicket { get; set; }
        /// <summary>
        /// Cookie persistant flag.
        /// </summary>
        public int IsPersistant { get; set; }

    }

}