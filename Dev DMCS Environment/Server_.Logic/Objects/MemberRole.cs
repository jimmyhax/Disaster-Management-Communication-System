using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;

namespace Web.Admin.Logic.Objects
{

    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class MemberRole : ApplicationObject, IApplicationObject
    { 
        
    }

    /// <summary>
    /// Provides a wrapper on single row in the MemberRoles database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using MemberRoles class which returns collection of MemberRole objects by different condition.
    /// </summary>    
    public partial class MemberRole : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public long RoleID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>        
        public long MemberID { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        public DateTime Created { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberRole()
        {

        }

        /// <summary>
        /// Creates MemberRole object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public MemberRole(IDataReader dr)
        {
            this.Load(dr);
        }

        /// <summary>
        /// Loads result set field values and saves into properties of class.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        /// <returns>Returns true if it was successfully loaded.</returns>
        public virtual bool Load(IDataReader dr)
        {
            bool result = false;

            this.RoleID    = DBUtil.GetLongField(dr, "RoleID");
            this.MemberID  = DBUtil.GetLongField(dr, "MemberID");
            this.Created   = DBUtil.GetDateTimeField(dr, "Created");

            return result;
        }

        /// <summary>
        /// Inserts an object in database according to class properties.
        /// </summary>
        /// <returns>Returns true if it was successfully saved.</returns>            
        public virtual bool Save()
        {
            this.WasSaved = false;
            SpRoleAdmin sp = null;

             switch (DbRoleAdmin.CurrentProvider)
             {
                 case DatabaseProvider.MSSQLServer:
                 {
                     sp = new SpRoleAdmin(String.Format(@"
                        IF NOT EXISTS( SELECT * FROM {0} WHERE MemberID=@MemberID AND RoleID=@RoleID )
                        BEGIN 
                        INSERT INTO {0} (RoleID, MemberID , Created) 
                               VALUES(@RoleID, @MemberID , @Created);
                        END", Table));
                     break;
                 }
                 case DatabaseProvider.MySQLServer:
                 {
                     sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (RoleID, MemberID , Created) 
                               SELECT @RoleID, @MemberID , @Created FROM DUAL WHERE NOT EXISTS( SELECT * FROM {0} WHERE MemberID=@MemberID AND RoleID=@RoleID) LIMIT 1",
                        Table));
                     break;
                 }
             }


             sp.AddParameter("RoleID", RoleID);
             sp.AddParameter("MemberID", MemberID);
             sp.AddParameter("Created", DateTime.UtcNow);

             if (sp.ExecuteNonQuery() == 0)
                 this.WasSaved = true;

             return this.WasSaved;
        }

        /// <summary>
        /// Deletes an object from the database.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool Delete()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE MemberID= @MemberID AND RoleID=@RoleID",Table));
            sp.AddParameter("RoleID", RoleID);
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

        /// <summary>
        /// Deletes all roles from the database which are connected with specific member.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool DeleteAll()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE MemberID=@MemberID", Table));
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
