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
    /// Keeps information about API source location and connection credentials.
    /// </summary>
    public class Connection
    {
        /// <summary>
        /// Connection credentials: member name and token.
        /// </summary>
        public Credentials Credentials { get; set; }
        
        /// <summary>
        /// URL of API source location.
        /// </summary>
        public Location Location { get; set; }

        /// <summary>
        /// The class constructor
        /// </summary>
        /// <param name="Url">URL of the API web entry point.</param>
        /// <param name="Email">E-mail address.</param>
        /// <param name="Token">Security token.</param>
        public Connection(String Url, String Email, String Token)
        {
            Credentials = new Credentials();
            Location = new Location();

            Credentials.Email = Email;
            Credentials.Token = Token;
            Location.URL = Url;
        }
    }
}
