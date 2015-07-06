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
    /// Social SingInAuthTicket structure for API using. 
    /// </summary>
    public class SingInAuthTicket : IApplicationObject
    {
        /// <summary>
        /// Member unique item identifier.
        /// </summary>
        public long MemberID { get; set; }
        /// <summary>
        /// Member name.
        /// </summary>
        public string MemberName { get; set; }
        /// <summary>
        /// Member email.
        /// </summary>
        public string MemberEmail { get; set; }
        /// <summary>
        /// Encryted ticket string.
        /// </summary>
        public string EncrytedTicket { get; set; }
        /// <summary>
        /// Cookie persistant flag.
        /// </summary>
        public int IsPersistant { get; set; }

        /// <summary>
        /// Creates  SingInAuthTicket object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public virtual bool Load(IDataReader dr)
        {
            return true;
        }

    }
}
