using System;
using System.Collections;
using Web.Admin.Logic.Utilities;

namespace Web.Admin.Logic
{
	/// <summary>
    /// Contains methods which help to execute SQL statements or stored procedures for connected database. 
    /// This is small class which inherit from SpBase class and can be used as a template. If you need to execute SQL commands 
    /// from another database. You have a possibility execute as simple or complex SQL statements from one side 
    /// and Stored procedures from another side by the same class.
	/// </summary>
	public class SpRoleAdmin: SpBase
	{
		/// <summary>
		/// The class constructor.
		/// </summary>
        /// <param name="ProcedureName">Stored procedure name or parameterized SQL statement.</param>
        public SpRoleAdmin ( String ProcedureName) : base( ProcedureName)
		{
			DbRoleAdmin DB  = new DbRoleAdmin();
			base.DB = DB;
            base.RequestType = DbBaseRequestType.ParameterizedSQLText;
		}

        /// <summary>
        /// The class constructor.
        /// </summary>
        /// <param name="ProcedureName">Stored procedure name or parameterized SQL statement.</param>
        /// <param name="RequestType">The request type stored procedure name or parameterized SQL.</param>
        public SpRoleAdmin(String ProcedureName, DbBaseRequestType RequestType)
            : base(ProcedureName)
        {
            DbRoleAdmin DB = new DbRoleAdmin();
            base.RequestType = RequestType;
            base.DB = DB;
        }
	
        /// <summary>
        /// The class constructor.
        /// </summary>
        /// <param name="ProcedureName">Stored procedure name or parameterized SQL statement.</param>
        /// <param name="HashParameters">Parameters hash table.</param>
		public SpRoleAdmin ( String ProcedureName, Hashtable HashParameters) : base( ProcedureName, HashParameters)
		{
			DbRoleAdmin DB  = new DbRoleAdmin();
			base.DB = DB;
		}
	
        /// <summary>
        /// The class constructor.
        /// </summary>
        /// <param name="ProcedureName">The class constructor.</param>
        /// <param name="ParameterName">Parameter name.</param>
        /// <param name="ParameterValue">Parameter value.</param>
		public SpRoleAdmin( String ProcedureName, string ParameterName, System.Object ParameterValue) : base( ProcedureName, ParameterName, ParameterValue)
		{
			DbRoleAdmin DB  = new DbRoleAdmin();
			base.DB = DB;
		}
	}
}
