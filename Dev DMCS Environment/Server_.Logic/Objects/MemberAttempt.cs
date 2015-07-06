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
    /// Attempt action type. 
    /// </summary>
    public enum MemberAttemptTypes
    {
        /// <summary>
        /// Password failed attempt type.
        /// </summary>
        LoginPasswordFailed = 1
    }

    /// <summary>
    /// Provides a wrapper on single row in the MemberAttempts database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using MemberAttempts class which returns collection of MemberAttempt objects by different condition.
    /// </summary>
    public partial class MemberAttempt : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public long AttemptID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>
        public long MemberID { get; set; }
        
        /// <summary>
        /// Number of attempts.
        /// </summary>
        public int Attempts { get; set; }
        
        /// <summary>
        /// Last Attempt status: if it is true in this case last attempt was successful.
        /// </summary>
        public int IsAttemptValid   { get; set; }
        
        /// <summary>
        /// Attempt action type.
        /// </summary>
        public MemberAttemptTypes AttemptType { get; set; }

        /// <summary>
        /// Date of attempt item creation.
        /// </summary>
        public DateTime Created     { get; set; }

        /// <summary>
        /// Date of attempt item modification.
        /// </summary>
        public DateTime Modified    { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberAttempt ()
        {

        }

        /// <summary>
        /// Creates ActionToken object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public MemberAttempt(IDataReader dr)
        {
            this.Load(dr);
        }

        /// <summary>
        /// Save attempt number for specific type.
        /// </summary>
        /// <returns></returns>
        public virtual bool SaveAttempts()
        {
            bool result = false;
            SpRoleAdmin sp = null;

            if (this.MemberID > 0)
            {
                sp = new SpRoleAdmin(@"
                        UPDATE " + ApplicationTables.TableName(this) + @" SET Attempts = @Attempts, Modified = @Modified
                        WHERE MemberID = @MemberID");

                sp.AddParameter("MemberID", MemberID);
                sp.AddParameter("Attempts", Attempts);
                sp.AddParameter("AttemptType", AttemptType);
                sp.AddParameter("Modified",DateTime.Now.ToUniversalTime());

                if (sp.ExecuteNonQuery() == 0)
                    result = true;
            }

            return result;

        }

        /// <summary>
        /// Loads result set field values and saves into properties of class.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        /// <returns>Returns true if it was successfully loaded.</returns>
        public virtual bool Load(IDataReader dr)
        {
            this.IsValid = false;

            this.AttemptID = DBUtil.GetLongField(dr, "AttemptID");
            this.MemberID = DBUtil.GetLongField(dr, "MemberID");
            this.Attempts = DBUtil.GetIntField(dr, "Attempts");
            this.AttemptType = (MemberAttemptTypes)DBUtil.GetIntField(dr, "AttemptType");
            this.Created = DBUtil.GetDateTimeField(dr, "Created");
            this.Modified = DBUtil.GetDateTimeField(dr, "Modified");
            this.IsAttemptValid = DBUtil.GetIntField(dr, "IsAttemptValid");

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

            if (this.AttemptID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                               Attempts     = @Attempts, 
                               AttemptType  = @AttemptType,                               
                               IsAttemptValid  = @IsAttemptValid,
                               Modified     = @Modified
                        WHERE AttemptID = @AttemptID",Table));

                sp.AddParameter("AttemptID", AttemptID);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }
            else
            {
                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            sp = new SpRoleAdmin(String.Format(@"
                               IF NOT EXISTS(SELECT AttemptID FROM {0} WHERE MemberID = @MemberID AND AttemptType = @AttemptType AND Year(Created) = Year(@Created) AND Month(Created) = Month(@Created) AND Day(Created) = Day(@Created) AND IsAttemptValid = 1)
                               BEGIN
                                   INSERT INTO {0} ( MemberID, Attempts,AttemptType, Created,  IsAttemptValid) 
                                          VALUES( @MemberID, @Attempts, @AttemptType, @CreatedNow, @IsAttemptValid); SELECT @AttemptID = @@IDENTITY
                               END
                               ELSE
                               BEGIN
                                   UPDATE {0} SET 
                                          Attempts = @Attempts, 
                                          Modified = @Modified
                                   WHERE AttemptID = @AttemptID AND AttemptType = @AttemptType
                               END
                            ", Table));
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            sp = new SpRoleAdmin(String.Format(@"
                                INSERT INTO {0} (MemberID, Attempts, AttemptType, Created,  IsAttemptValid) 
                                          SELECT @MemberID, @Attempts, @AttemptType, @CreatedNow, @IsAttemptValid FROM DUAL 
                                                WHERE NOT EXISTS(SELECT * FROM {0} WHERE MemberID = @MemberID AND AttemptType = @AttemptType AND Year(Created) = Year(@Created) AND Month(Created) = Month(@Created) AND Day(Created) = Day(@Created) AND IsAttemptValid = 1) LIMIT 1;
                                                            
                                UPDATE {0} SET 
                                       Attempts = @Attempts, 
                                       Modified = @Modified
                                WHERE AttemptID = @AttemptID AND AttemptType = @AttemptType;
                              ", Table));
                            
                            break;
                        }
                }
                
                sp.AddParameter("AttemptID", MemberID, System.Data.ParameterDirection.Output);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }

            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("AttemptType", AttemptType);
            sp.AddParameter("Attempts", Attempts);
            sp.AddParameter("CreatedNow", DateTime.UtcNow);
            sp.AddParameter("Created", Created != DateTime.MinValue ? Created : DateTime.UtcNow);
            sp.AddParameter("IsAttemptValid", IsAttemptValid);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.AttemptID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            AttemptID = (long)sp.GetParameter("AttemptID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                AttemptID = Convert.ToInt64(cm.LastInsertedId);

                            break;
                        }
                }
                
            }

            return this.WasSaved;
        }

        /// <summary>
        /// Deletes an object from the database.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted</returns>
        public virtual bool Delete()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE AttemptID=@AttemptID",Table));
            sp.AddParameter("AttemptID", AttemptID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
