using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;

namespace Server_.API.Utilities
{
    /// <summary>
    /// Keeps information about connection credentials.
    /// </summary>
    public class Credentials
    {
        /// <summary>
        /// E-mail address.
        /// </summary>
        public string Email { get; set; }
        
        /// <summary>
        /// Security token string.
        /// </summary>
        public string Token { get; set; }
    }
}
