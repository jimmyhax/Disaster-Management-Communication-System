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
    public partial class MemberDomain : ApplicationObject, IApplicationObject
    {

    }


    /// <summary>
    /// Database read/write part.
    /// </summary>
    public partial class MemberDomain : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        
        [DataMember]
        public int MemberDomainID { get; set; }

        /// <summary>
        /// Domain unique identifier in the database.
        /// </summary>
        [DataMember]
        public long DomainID { get; set; }
        
        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>
        [DataMember]
        public long MemberID { get; set; }


        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberDomain ()
        {
            
        }

        /// <summary>
        /// Creates MemberDomain object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public MemberDomain(IDataReader dr)
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

            this.MemberDomainID  = DBUtil.GetIntField(dr, "MemberDomainID");
            this.DomainID        = DBUtil.GetLongField(dr, "DomainID");
            this.MemberID        = DBUtil.GetLongField(dr, "MemberID");

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
                        IF NOT EXISTS(SELECT MemberID FROM {0} WHERE MemberID = @MemberID  AND DomainID = @DomainID)
                        BEGIN
                            INSERT INTO {0} (DomainID, MemberID) 
                                VALUES(@DomainID, @MemberID); 

                            SELECT @MemberDomainID = @@IDENTITY;
                        END
                        ELSE
                        BEGIN
                            SELECT @MemberDomainID = MemberDomainID FROM {0} WHERE MemberID = @MemberID  AND DomainID = @DomainID
                        END
                        ", Table));
                        break;    
                    }
                case DatabaseProvider.MySQLServer:
                    {
                        sp = new SpRoleAdmin(String.Format(@"
                            INSERT INTO {0} (DomainID, MemberID) 
                                      SELECT @DomainID, @MemberID FROM DUAL
                                            WHERE NOT EXISTS(SELECT MemberID FROM {0} WHERE MemberID = @MemberID  AND DomainID = @DomainID) LIMIT 1;
                          ", Table));

                        break;
                    }
            }

            sp.AddParameter("MemberDomainID", MemberDomainID, System.Data.ParameterDirection.Output);
            sp.AddParameter("DomainID", DomainID);
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.MemberDomainID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            MemberDomainID = (int)sp.GetParameter("MemberDomainID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                MemberDomainID = Convert.ToInt32(cm.LastInsertedId);

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0}  WHERE DomainID = @DomainID AND MemberID = @MemberID", Table));
            sp.AddParameter("DomainID", DomainID);
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
