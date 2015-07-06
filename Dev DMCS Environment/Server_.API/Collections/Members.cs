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
    /// Provides getting collection of the memners using HTTP call to API web application.   
    /// </summary>
    public class Members : Collection<Member>
    {
        /// <summary>
        /// Keeps information abbout current connection.
        /// </summary>        
        public static Connection Connection { get; set; }

        /// <summary>
        /// Gets list of members by a condition filter.
        /// </summary>
        /// <param name="Filter">Filter condition.</param>
        /// <returns>List of members.</returns>
        public static List<Member> GetMembers(CollectionFilter Filter)
        {
            return GetCollection(new StreamReader(Tools.StreamPost("GetMembers", Members.Connection, Filter)));                
        }

        /// <summary>
        /// Gets a member by member unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns>Instance of the Member class. </returns>
        public static Member GetMember(long MemberID)
        {
            return GetItem(new StreamReader(Tools.StreamPost("GetMemberByID", Members.Connection, new { MemberID = MemberID })));
        }

        /// <summary>
        /// Gets a member where the e-mail address for the member matches the specified e-mail address.
        /// </summary>
        /// <param name="Email">Member e-mail address.</param>
        /// <returns>A Member object representing the member associated with the specified e-mail address.</returns>
        public static Member GetMember(String Email)
        {
            return GetItem(new StreamReader(Tools.StreamPost("GetMemberByEmail", Members.Connection, new { Email = Email })));
        }

        /// <summary>
        /// Assigns a member with the specified unique identifier to role with the specified unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <param name="RoleID">Role unique identifier.</param>
        /// <returns>A Member object representing the member associated with the specified unique identifier.</returns>
        public static Member AssignRoles(long MemberID, long RoleID)
        {
            return GetItem(new StreamReader(Tools.StreamPost("AssignRoleMemberByID", Members.Connection, new { MemberID = MemberID, AssignRole = new long[] { RoleID } })));
        }

        /// <summary>
        /// Assigns a member with the specified unique identifier to roles with the specified unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <param name="RoleID">Array of role unique identifiers.</param>
        /// <returns>A Member object representing the member associated with the specified unique identifier.</returns>
        public static Member AssignRoles(long MemberID, long[] RoleID)
        {
            return GetItem(new StreamReader(Tools.StreamPost("AssignRoleMemberByID", Members.Connection, new { MemberID = MemberID, AssignRole = RoleID })));
        }

        /// <summary>
        /// Assigns a member with the specified e-mail to roles with the specified name.
        /// </summary>
        /// <param name="Email">Members e-mail address.</param>
        /// <param name="RoleName">Role name.</param>
        /// <returns>A Member object representing the member associated with the specified e-mail address.</returns>
        public static Member AssignRoles(string Email, string RoleName)
        {
            return GetItem(new StreamReader(Tools.StreamPost("AssignRoleMemberByName", Members.Connection, new { Email = Email, AssignRoles = new string[] { RoleName } })));
        }

        /// <summary>
        /// Assigns a member with the specified e-mail to roles with the specified name.
        /// </summary>
        /// <param name="Email">Members e-mail address.</param>
        /// <param name="RoleName">Role name.</param>
        /// <returns>A Member object representing the member associated with the specified e-mail address.</returns>        
        public static Member AssignRoles(string Email, string[] RoleName)
        {
            return GetItem(new StreamReader(Tools.StreamPost("AssignRoleMemberByName", Members.Connection, new { Email = Email, AssignRoles = RoleName })));
        }

        /// <summary>
        /// Unassigns a member with the specified unique identifier to role with the specified unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <param name="RoleID">Role unique identifier.</param>
        /// <returns>A Member object representing the member associated with the specified unique identifier.</returns>
        public static Member UnAssignRoles(long MemberID, long RoleID)
        {
            return GetItem(new StreamReader(Tools.StreamPost("UnAssignRoleMemberByID", Members.Connection, new { MemberID = MemberID, AssignRoles = new long[] { RoleID } })));
        }

        /// <summary>
        /// Unassign a member with the specified unique identifier to roles with the specified unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <param name="RoleID">Array of role unique identifiers.</param>
        /// <returns>A Member object representing the member associated with the specified unique identifier.</returns>
        public static Member UnAssignRoles(long MemberID, long[] RoleID)
        {
            return GetItem(new StreamReader(Tools.StreamPost("UnAssignRoleMemberByID", Members.Connection, new { MemberID = MemberID, AssignRoles = RoleID })));
        }

        /// <summary>
        /// Unassigns a member with the specified e-mail to roles with the specified name.
        /// </summary>
        /// <param name="Email">Members e-mail address</param>
        /// <param name="RoleName">Role name</param>
        /// <returns>A Member object representing the member associated with the specified e-mail address.</returns>
        public static Member UnAssignRoles(string Email, string RoleName)
        {
            return GetItem(new StreamReader(Tools.StreamPost("UnAssignRoleMemberByName", Members.Connection, new { Email = Email, UnAssignRoles = new string[] { RoleName } })));
        }

        /// <summary>
        /// Unassigns a member with the specified e-mail to roles with the specified name.
        /// </summary>
        /// <param name="Email">Members e-mail address</param>
        /// <param name="RoleName">Array of roles name</param>
        /// <returns>A Member object representing the member associated with the specified email address.</returns>
        public static Member UnAssignRoles(string Email, string[] RoleName)
        {
            return GetItem(new StreamReader(Tools.StreamPost("UnAssignRoleMemberByName", Members.Connection, new { Email = Email, UnAssignRoles = RoleName })));
        }

        /// <summary>
        /// Authenticates a member with the specified e-mail adress and password.
        /// </summary>
        /// <param name="Email">Members e-mail address</param>
        /// <param name="Password">Members password.</param>
        /// <returns>A Member object representing the member associated with the specified e-mail address.</returns>
        public static Member AuthenticateMember(string Email, string Password)
        {
            return GetItem(new StreamReader(Tools.StreamPost("AuthenticateMember", Members.Connection, new { Email = Email, Password = Password })));
        }

    }
}
