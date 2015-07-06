using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;
using MySql.Data.MySqlClient;

namespace Web.Admin.Logic.Objects
{

    /// <summary>
    /// Provides a wrapper on single item in the Domains database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from a database using Domains class which returns collection of Domain by different condition.  
    /// </summary>    
    public class Domain : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>    	
        public int DomainID { get; set; }
        /// <summary>
        /// Application name.
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Application description.
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// Application activity flag.
        /// </summary>
        public int IsActive { get; set; }
        /// <summary>
        /// Date of creation.
        /// </summary>
        public DateTime Created { get; set; }
        /// <summary>
        /// Date of modification.
        /// </summary>
        public DateTime Modified { get; set; }

        /// <summary>
        /// The class constructor
        /// </summary>
        public Domain()
        {

        }

        /// <summary>
        /// Loads result set field values and saves into properties of class.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        /// <returns>Returns true if it was successfully loaded.</returns>
        public virtual bool Load(IDataReader dr)
        {
            this.IsValid = false;

            this.DomainID = DBUtil.GetIntField(dr, "DomainID");
            this.Name = DBUtil.GetCharField(dr, "Name");
            this.Description = DBUtil.GetCharField(dr, "Description");
            this.Created = DBUtil.GetDateTimeField(dr, "Created");
            this.Modified = DBUtil.GetDateTimeField(dr, "Modified");

            this.IsValid = true;
            return this.IsValid;
        }

        /// <summary>
        /// Inserts an object in database according to class properties.
        /// </summary>
        /// <returns>Returns true if it was successfully saved.</returns>
        public virtual bool Save()
        {
            this.WasSaved = false;
            SpRoleAdmin sp = null;

            if (this.DomainID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                             Name           = @Name, 
                             Description    = @Description, 
                             Modified       = @Modified
                        WHERE DomainID = @DomainID
                    ", Table));

                sp.AddParameter("DomainID", DomainID);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (Name, Description, Created) 
                               VALUES(@Name, @Description, @Created); SELECT @DomainID = @@IDENTITY", Table));

                sp.AddParameter("DomainID", DomainID, System.Data.ParameterDirection.Output);
            }

            sp.AddParameter("Name", Name);
            
            if (Description == null || Description.Trim().Length == 0)
                sp.AddParameter("Description", DBNull.Value);
            else
                sp.AddParameter("Description", Description);

            if (Created != DateTime.MinValue)
                sp.AddParameter("Created", Created);
            else
                sp.AddParameter("Created", DateTime.UtcNow);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.DomainID <= 0)
            {
                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            DomainID = (int)sp.GetParameter("DomainID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                DomainID = Convert.ToInt32(cm.LastInsertedId);

                            break;
                        }
                }
            }

            return this.WasSaved;
        }

        /// <summary>
        /// Deletes all roles from the database which are connected with specific member.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool Delete()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@" 
                DELETE FROM DomainProfileFields WHERE DomainID = @DomainID;
                DELETE FROM MemberDomains WHERE DomainID = @DomainID;
                DELETE FROM {0} WHERE DomainID = @DomainID;", Table));
            sp.AddParameter("DomainID", DomainID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }
    }

}
