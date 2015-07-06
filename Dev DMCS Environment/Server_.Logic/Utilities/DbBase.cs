using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web.Admin.Logic.Utilities
{

    /// <summary>
    /// Database provider which are used for getting data from the database.
    /// </summary>
    public enum DatabaseProvider
    {
        /// <summary>
        /// MS SQL Server
        /// </summary>        
        MSSQLServer = 1,

        /// <summary>
        /// MySQL Server.
        /// </summary>
        MySQLServer = 2,

        /// <summary>
        /// Any SQL Server with ODBC rrovider.
        /// </summary>
        ODBCSQLServer = 3,

    }

	/// <summary>
	/// Represents base abstract database connection class which keeps the connection settings
	/// </summary>
	public abstract class DbBase
	{
		/// <summary>
		/// Connection timeout in seconds.
		/// </summary>
        public int CommandTimeout = 30;
		
        /// <summary>
		/// Connection string from web.config file. 
		/// </summary>
        public string ConnectionString = "";

        /// <summary>
        /// Source database provider. 
        /// </summary>
        public DatabaseProvider DatabaseProvider = DatabaseProvider.MSSQLServer;
		
        /// <summary>
        /// Throw an exception if something wrong happend inside SQL executor class. Will be removed in next release.
        /// </summary>
        public static bool ThrowExceptionIsOn = true;

        /// <summary>
        /// The class constructor.
        /// </summary>
		public DbBase() 
		{
		
		}
	}
}
