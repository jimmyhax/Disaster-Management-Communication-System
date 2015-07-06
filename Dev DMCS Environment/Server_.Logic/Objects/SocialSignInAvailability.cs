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
    /// Social SignIn Availability structure for API using. 
    /// </summary>
    public partial class SocialSignInAvailability : IApplicationObject
    {
        /// <summary>
        /// Is Twitter singin switched on
        /// </summary>
        public bool Twitter{get;set;}
        /// <summary>
        /// Is Facebook singin switched on
        /// </summary>
        public bool Facebook{get;set;}
        /// <summary>
        /// Is Google singin switched on
        /// </summary>        
        public bool Google{get;set;}
        /// <summary>
        /// Is Yahoo singin switched on
        /// </summary>        
        public bool Yahoo{get;set;}
        /// <summary>
        /// Is LiveJournal singin switched on
        /// </summary>        
        public bool LiveJournal{get;set;}
        /// <summary>
        /// Is Blogger singin switched on
        /// </summary>        
        public  bool Blogger{get;set;}
        /// <summary>
        /// Is OpenID singin switched on
        /// </summary>        
        public bool OpenID {get;set;}
        /// <summary>
        /// Is myOpenID singin switched on
        /// </summary>        
        public bool myOpenID { get; set; }

         /// <summary>
        /// Creates Social SignIn Availability object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public virtual bool Load(IDataReader dr)
        {
            return true;
        }

    }
}
