using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web;
using System.Security.Principal;
using Server_.API.Utilities;

namespace Server_.API.Objects
{
    /// <summary>
    /// Provides a wrapper on single row in the MemberProfileField  database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using MemberProfileFields class which returns collection of MemberProfileField objects by different condition.   
    /// The object of this class contains information about single member.
    /// </summary>
    public partial class MemberProfileField
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>        
        public int ProfileFieldID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>
        public long MemberID { get; set; }

        /// <summary>
        /// Field unique identifier in the database.
        /// </summary>
        public int FieldID { get; set; }

        /// <summary>
        /// Field name.
        /// </summary>
        public String FieldName { get; set; }

        /// <summary>
        /// Member field value.
        /// </summary>        
        public string FieldValue { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        public DateTime Created { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        public DateTime Modified { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberProfileField()
        {

        }
    }
}
