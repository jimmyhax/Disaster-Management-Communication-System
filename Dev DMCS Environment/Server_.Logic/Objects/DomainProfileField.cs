using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;
using System.Runtime.Serialization;
using MySql.Data.MySqlClient;

namespace Web.Admin.Logic.Objects
{
    /// <summary>
    /// Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    /// </summary>
    public partial class DomainProfileField : ApplicationObject, IApplicationObject
    {

    }


    /// <summary>
    /// Database read/write part.
    /// </summary>
    public partial class DomainProfileField : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        
        [DataMember]
        public int DomainFieldID { get; set; }

        /// <summary>
        /// Domain unique identifier in the database.
        /// </summary>
        [DataMember]
        public long DomainID { get; set; }
        
        /// <summary>
        /// Field unique identifier in the database.
        /// </summary>
        [DataMember]
        public int ProfileFieldID { get; set; }


        /// <summary>
        /// The class constructor.
        /// </summary>
        public DomainProfileField ()
        {
            
        }

        /// <summary>
        /// Creates DomainProfileField object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public DomainProfileField(IDataReader dr)
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
            this.IsValid = false;

            this.DomainFieldID  = DBUtil.GetIntField(dr, "DomainFieldID");
            this.DomainID       = DBUtil.GetLongField(dr, "DomainID");
            this.ProfileFieldID = DBUtil.GetIntField(dr, "ProfileFieldID");

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
          
            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                    {

                        sp = new SpRoleAdmin(String.Format(@"
                        IF NOT EXISTS(SELECT ProfileFieldID FROM {0} WHERE ProfileFieldID = @ProfileFieldID  AND DomainID = @DomainID)
                           BEGIN
                            INSERT INTO {0} (DomainID, ProfileFieldID) 
                                VALUES(@DomainID, @ProfileFieldID); SELECT @DomainFieldID = @@IDENTITY
                        END
                        ELSE
                            SELECT @DomainFieldID = DomainFieldID FROM {0} WHERE ProfileFieldID = @ProfileFieldID  AND DomainID = @DomainID
                        ", Table));
                        break;    
                    }
                case DatabaseProvider.MySQLServer:
                    {
                        sp = new SpRoleAdmin(String.Format(@"
                            INSERT INTO {0} (DomainID, ProfileFieldID) 
                                      SELECT @DomainID, @ProfileFieldID FROM DUAL
                                            WHERE NOT EXISTS(SELECT * FROM {0} WHERE ProfileFieldID = @ProfileFieldID  AND DomainID = @DomainID) LIMIT 1;
                          ", Table));

                        break;
                    }
            }

            sp.AddParameter("DomainFieldID", DomainFieldID, System.Data.ParameterDirection.Output);
            sp.AddParameter("DomainID", DomainID);
            sp.AddParameter("ProfileFieldID", ProfileFieldID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.DomainFieldID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            DomainFieldID = (int)sp.GetParameter("DomainFieldID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                DomainFieldID = Convert.ToInt32(cm.LastInsertedId);

                            break;
                        }
                }
                
            }

            return this.WasSaved;
        }

        /// <summary>
        /// Deletes an object from the database.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool Delete()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0}  WHERE DomainID = @DomainID AND ProfileFieldID = @ProfileFieldID", Table));
            sp.AddParameter("DomainID", DomainID);
            sp.AddParameter("ProfileFieldID", ProfileFieldID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
