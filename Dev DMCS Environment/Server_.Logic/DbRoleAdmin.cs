using System;
using Web.Admin.Logic.Utilities;

namespace Web.Admin.Logic
{
	/// <summary>
	/// Base class for database connection.
	/// </summary>
    public class DbRoleAdmin : DbBase
	{
		/// <summary>
        /// The class constructor. It reads connection string value from web.config file. The element name is "Admin.Connetion.String".
		/// </summary>
        public DbRoleAdmin()
		{            
            base.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["Admin.Connetion.String"];
            base.DatabaseProvider = CurrentProvider;
		}

        /// <summary>
        /// Provider type: MSSQL, MySQL.
        /// </summary>
        public static DatabaseProvider CurrentProvider {
            get {
                    string Provider = System.Configuration.ConfigurationManager.AppSettings["Admin.Database.Provider"];

                    if (Provider.Trim().ToLower() == "mssql")
                        return DatabaseProvider.MSSQLServer;
                    else if (Provider.Trim().ToLower() == "mysql")
                        return DatabaseProvider.MySQLServer;
                    else if (Provider.Trim().ToLower() == "odbcsql")
                        return DatabaseProvider.ODBCSQLServer;
                    else
                        return DatabaseProvider.MSSQLServer;
            }
        }
	}

}
