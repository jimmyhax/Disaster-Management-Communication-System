using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Server_.API.Objects
{
    /// <summary>
    /// Audit event type possible values:
    /// Default - the type of action can't be defined;
    /// Info - if something not realy important happened;
    /// Success - if an acction finished succesfylly;
    /// Warning - needs to pay attantion to an action;
    /// Error - an error occurred during an action.
    /// </summary>
    public enum AuditEventType
    {
        /// <summary>
        /// General type of audit item.
        /// </summary>
        Default = 1,
        /// <summary>
        /// Information type of audit item.
        /// </summary>
        Info = 2,
        /// <summary>
        /// An ction was finished fine type.
        /// </summary>
        Success = 3,
        /// <summary>
        /// An action was finished with warnings.
        /// </summary>
        Warning = 4,
        /// <summary>
        /// An action was failed.
        /// </summary>
        Error = 5
    }

    /// <summary>
    /// App - an action is connected with application activity;
    ///	System - an action is connected with system activity;
    ///	API - an action is connected with API call;
    /// </summary>
    public enum AuditEventSource
    {
        /// <summary>
        /// The event source is admin application
        /// </summary>
        App = 1,
        /// <summary>
        /// The source is process in a library
        /// </summary>
        System = 2,
        /// <summary>
        /// The source is application API
        /// </summary>
        API = 3,
    }


    /// <summary>
    /// Provides a wrapper on single row in the AuditEvents database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using AuditEvents class which returns collection of AuditEvent objects by different condition.   
    /// The object of this class contains information about single action which happens during application activity. There are the types of event: system, application, API.
    /// </summary> 
    public class AuditEvent
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public long EventID { get; set; }
        
        /// <summary>
        /// Event type, can be:
        /// Default - the type of action can't be defined;
        /// Info - if something not realy important happened;
        /// Success - if an acction finished succesfylly;
        /// Warning - needs to pay attantion to an action;
        /// Error - an error occurred during an action.
        /// </summary>
        public AuditEventType EventType { get; set; }

        /// <summary>
        /// E-mail address of executor.
        /// </summary>
        public String MemberEmail { get; set; }

        /// <summary>
        /// IP address of the executor.
        /// </summary>
        public String IPAddress { get; set; }

        /// <summary>
        /// An acction short description.
        /// </summary>
        public String Details { get; set; }

        /// <summary>
        /// An action long description.
        /// </summary>
        public String Description { get; set; }
    }

}
