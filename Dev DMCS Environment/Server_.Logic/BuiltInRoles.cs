using System;
using System.Collections;
using Web.Admin.Logic.Utilities;
using System.Collections.Generic;

namespace Web.Admin.Logic
{
    /// <summary>
    /// Contains the list of built-in role and member labels.
    /// </summary>
    public class BuiltInRoleMember {

        /// <summary>
        /// The list of of built-in roles.
        /// </summary>
        private static Dictionary<String, int> _Roles = new Dictionary<string, int>();
        
        /// <summary>
        /// The list of of built-in members.
        /// </summary>
        private static Dictionary<String, int> _Members = new Dictionary<string, int>();

        /// <summary>
        /// The class constructor.
        /// </summary>
        static BuiltInRoleMember()
        {
            _Roles.Add("admins",0);
            _Roles.Add("self registered",0);
            _Roles.Add("self activated", 0);
            _Roles.Add("activated",0);
            _Roles.Add("not activated",0);
            _Roles.Add("api members", 0);
            _Roles.Add("invited",0);

            _Members.Add("admin", 0);
        }

        /// <summary>
        /// Gets true if a role is  built-in role.
        /// </summary>
        /// <param name="Name">Role name</param>
        /// <returns>True if a role is  built-in role.</returns>
        public static bool ContainsRole(String Name)
        {
            return _Roles.ContainsKey(Name.ToLower());
        }

        /// <summary>
        /// Gets true if a member is built-in member.
        /// </summary>
        /// <param name="Name">member name</param>
        /// <returns>True if a member is in collection.</returns>
        public static bool ContainsMember(String Name)
        {
            return _Members.ContainsKey(Name.ToLower());
        }
    }
}
