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
    /// Provides getting collection of the audit events using HTTP call to API web application.   
    /// </summary>
    public class AuditEvents : Collection<AuditEvent>
    {
        /// <summary>
        /// Keeps the connection infomation.
        /// </summary>
        public static Connection Connection { get; set; }

        /// <summary>
        /// Gets audit events collection where by audit event unique identifier.
        /// </summary>
        /// <param name="Filter">Filter condition object.</param>
        /// <returns>Collection of AuditEvent objects.</returns>
        public static List<AuditEvent> GetEvents(CollectionFilter Filter)
        {
            return GetCollection(new StreamReader(Tools.StreamPost("GetAuditEvents", AuditEvents.Connection, Filter)));
        }
        
    }
}
