using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Server_.API.Objects
{
    /// <summary>
    /// Provides a wrapper on single row in the AuditEventDetails database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using AuditEventDetails class which returns collection of AuditEventDetail objects by different condition.   
    /// The object of this class contains information about single action in details which happens during application activity.
    /// </summary>
    public class AuditEventDetail
    {
        /// <summary>
        /// An action short description.
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// An action long description.
        /// </summary>
        public string Description { get; set; }
    }
}
