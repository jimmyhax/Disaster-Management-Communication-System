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
    /// Provides getting collection of the audit event details using HTTP call to API web application.   
    /// </summary>
    public class AuditEventDatails : Collection<AuditEventDetail>
    {
        /// <summary>
        /// Keeps information abbout current connection.
        /// </summary>
        public static Connection Connection { get; set; }
        
        /// <summary>
        /// Gets audit event details collection where by audit event unique identifier.
        /// </summary>
        /// <param name="EventID"></param>
        /// <returns>List of audit event details.</returns>        
        public static List<AuditEventDetail> GetEventDatails(long EventID)
        {
            return GetCollection(new StreamReader(Tools.StreamPost("GetAuditEventDetails", AuditEventDatails.Connection, new { EventID = EventID })));
        }        
    }
}
