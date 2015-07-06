using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;
using System.Runtime.Serialization;
using System.Web;
using Web.Admin.Logic.Collections;
using MySql.Data.MySqlClient;

namespace Web.Admin.Logic.Objects
{
    /// <summary>
    /// SingInTickets structure for API using. We need this for correct json object for API.
    /// </summary>
    public class SingInAuthTickets : ApplicationCollection<SingInAuthTicket, DbRoleAdmin, SpRoleAdmin>
    {

    }
}
