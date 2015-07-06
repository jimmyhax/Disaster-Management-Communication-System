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
    /// Provides getting collection of the roles using HTTP call to API web application.   
    /// </summary>
    public class Roles : Collection<Role>
    {
        /// <summary>
        /// Keeps information abbout current connection.
        /// </summary>
        public static Connection Connection { get; set; }

        /// <summary>
        /// Gets a collection of all the roles in the database.
        /// </summary>
        /// <returns>A List of Roles objects representing all the users in the database.</returns>
        public static List<Role> GetRoles()
        {
            return GetCollection(new StreamReader(Tools.StreamGet("GetRoles",Roles.Connection)));                
        }

        /// <summary>
        /// Gets a collection of the roles for the member matches the member specified unique identifier.
        /// </summary>
        /// <param name="MemberID"></param>
        /// <returns>A List of Roles objects representing the roles for the member matches the member specified unique identifier.</returns>
        public static List<Role> GetMemberRoles(long MemberID)
        {
            return GetCollection(new StreamReader(Tools.StreamPost("GetMemberRolesByID", Roles.Connection, new { MemberID = MemberID })));                                             
        }

        /// <summary>
        /// ets a collection of the roles for the member matches the member specified unique identifier.
        /// </summary>
        /// <param name="Email">Member e-mail address.</param>
        /// <returns>A List of Roles objectsfor the member matches the member specified unique identifier.</returns>
        public static List<Role> GetMemberRoles(string Email)
        {
            return GetCollection(new StreamReader(Tools.StreamPost("GetMemberRolesByEmail", Roles.Connection, new { MemberEmail = Email })));                             
        }
    }
}
