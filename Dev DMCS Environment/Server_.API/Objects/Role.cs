using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Server_.API.Objects
{
    /// <summary>
    /// Provides a wrapper on single row in the Roles database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using Roles class which returns collection of Role objects by different condition.   
    /// The object of this class contains information about single role.
    /// </summary>
    public class Role
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public long RoleID { get; set; }

        /// <summary>
        /// Role label back color.
        /// </summary>
        public string BackColor { get; set; }

        /// <summary>
        /// Role label text color.
        /// </summary>
        public string ForeColor { get; set; }

        /// <summary>
        /// Role name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Role description/settings.
        /// </summary>
        public string Settings { get; set; }

        /// <summary>
        /// Built-In flag.
        /// </summary>
        public bool IsBuiltIn { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        public DateTime Created { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        public DateTime Modified { get; set; }

        /// <summary>
        /// Count of role's members.
        /// </summary>
        public int MemberCount { get; set; }
    }
}
