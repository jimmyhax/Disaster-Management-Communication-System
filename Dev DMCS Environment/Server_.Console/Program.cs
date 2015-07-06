using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;

using Server_.API;
using Server_.API.Collections;
using Server_.API.Objects;
using Server_.API.Utilities;

namespace SimpleTools.RoleAdmin.App
{
    class Program
    {
        static void Main(string[] args)
        {
            Connection Connection =
                new Connection
                (
                    "http://localhost:50000/admin/api",
                    "example@demo.com",
                    "HYXMvDsQWhGhbShE7yS1"
                );

            Tools.Connection = Connection;
            Roles.Connection = Connection;
            Members.Connection = Connection;
            AuditEvents.Connection = Connection;
            AuditEventDatails.Connection = Connection;
            MemberSocialNetworks.Connection = Connection;

            // General
            Console.WriteLine(Tools.Ping().Data);

            // Roles
            List<Role> _Roles = Roles.GetRoles();

            _Roles = Roles.GetMemberRoles(102);
            _Roles = Roles.GetMemberRoles("admin@demo.com");

            // Members
            List<Member> _Members = Members.GetMembers(new CollectionFilter() { CurrentPage = 1, ItemsPerPage = 30 });
            _Members = Members.GetMembers(new CollectionFilter() { CurrentPage = 2, ItemsPerPage = 30 });

            Member _Member = Members.GetMember(130);
            _Member = Members.GetMember("admin@demo.com");

            // Audit items
            List<AuditEvent> _Events = AuditEvents.GetEvents(new CollectionFilter() { CurrentPage = 1, ItemsPerPage = 30 });
            _Events = AuditEvents.GetEvents(new CollectionFilter() { CurrentPage = 2, ItemsPerPage = 30 });

            // Audit Item Details
            foreach (AuditEvent Event in _Events)
            {
                List<AuditEventDetail> _EventDetails = AuditEventDatails.GetEventDatails(Event.EventID);
            }


            MemberSocialNetwork _socilaNetwork = MemberSocialNetworks.GetMemberSocialNetworks(31);
            Console.WriteLine(_socilaNetwork.AccessToken);
            Console.ReadLine();

        }
    }
}