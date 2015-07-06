using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Server_.API.Utilities
{
    /// <summary>
    /// API exception class.
    /// </summary>
    public class Exception : System.Exception
    {
        /// <summary>
        /// The class contructor based on parent exception.
        /// </summary>
        /// <param name="Message">Parrent exception message.</param>
        public Exception(String Message) : base(Message)
        { 
        
        }
    }
}
