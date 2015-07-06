using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Server_.API.Utilities
{
    /// <summary>
    /// Keeps information about a response.  
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class Response<T>
    {
        /// <summary>
        /// Response message if something wron happend.
        /// </summary>
        public string Message  { get; set; }
        
        /// <summary>
        /// StackTrace string if something wron happend.
        /// </summary>
        public string StackTrace { get; set; }
        
        /// <summary>
        /// The execution result. It can be an object or the collection of an object's.
        /// </summary>
        public T Data { get; set; }
    }
}
