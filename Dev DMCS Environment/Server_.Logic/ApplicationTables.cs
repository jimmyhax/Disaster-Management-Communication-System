using System;
using System.Text;
using System.Reflection;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Data;
using Web.Admin.Logic.Objects;

namespace Web.Admin.Logic
{
    /// <summary>
    /// It supports wrapping database objects and keeps correspondence between the C# classes and database tables.
    /// </summary>
    public class ApplicationTables
    {
        /// <summary>
        /// Correspondence between the C# classes and database tables.
        /// </summary>
        private static Hashtable _Names = new Hashtable()
        { 
            {typeof(Member).ToString(), "Members"},
            {typeof(Role).ToString(), "Roles"},
            {typeof(Domain).ToString(), "Domains"},
            {typeof(Language).ToString(), "Languages"},
            {typeof(MemberRole).ToString(), "MemberRoles"},          
            {typeof(Parameter).ToString(), "Parameters"},
            {typeof(AuditEvent).ToString(), "AuditEvents"},
            {typeof(ActionToken).ToString(), "ActionTokens"},
            {typeof(MemberToken).ToString(), "MemberTokens"},
            {typeof(MemberAttempt).ToString(), "MemberAttempts"},
            {typeof(ProfileFieldGroup).ToString(), "ProfileFieldGroups"},
            {typeof(ProfileField).ToString(), "ProfileFields"},
            {typeof(ProfileFieldType).ToString(), "ProfileFieldTypes"},
            {typeof(MemberProfileField).ToString(), "MemberProfileFields"},
            {typeof(DomainProfileField).ToString(), "DomainProfileFields"},
            {typeof(RoleProfileField).ToString(), "RoleProfileFields"},
            {typeof(MemberSocialNetwork).ToString(), "MemberSocialNetworks"},
            {typeof(MemberDomain).ToString(), "MemberDomains"},
            {typeof(AuthMemberTicket).ToString(), "AuthMemberTickets"}
        };

        /// <summary>
        /// Gets Hashtable of correspondence between the C# classes and database tables.
        /// </summary>
        protected static Hashtable Names { get { return _Names; }}

        /// <summary>
        /// Gets table name by class type.
        /// </summary>
        public static string TableName(object ObjectType)
        {
            return (string)Names[ObjectType.GetType().ToString()];
        }

        /// <summary>
        /// Gets table name by type name.
        /// </summary>
        /// <param name="Name"></param>
        /// <returns></returns>
        public static string TableByTypeName(string Name)
        {
            return (string)Names[Name];
        }
    }
}

