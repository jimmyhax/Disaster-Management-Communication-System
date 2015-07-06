using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;
using System.Data;
using MySql.Data.MySqlClient;

namespace Web.Admin.Logic.Objects
{
 
    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class AuthMemberTicket: ApplicationObject, IApplicationObject
    {
       
    }

    /// <summary>
    /// Provides a wrapper on single row in the ActionTokens database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using ActionTokens class which returns collection of AuthMemberTicket objects by different condition.
    /// </summary>
    public partial class AuthMemberTicket: ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique identifier in the database.
        /// </summary>
        public long AuthMemberTicketID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>
        public long MemberID { get; set; }
	    /// <summary>
        /// Ticket issue date.
	    /// </summary>
        public DateTime IssueDate { get; set; }
	    /// <summary>
        /// Ticket expiration date.
	    /// </summary>
        public DateTime Expiration { get; set; }
        /// <summary>
        /// Is ticket persistent flag.
        /// </summary>
        public int IsPersistent { get; set; }

        /// <summary>
        /// Random symbols and numbers string which is in lower and upper case.
        /// </summary>
        public string Token { get; set; }
        
       
        /// <summary>
        /// The class constructor.
        /// </summary>
        public  AuthMemberTicket()
        {
         
        }
        
        /// <summary>
        /// Creates AuthMemberTicketobject which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public AuthMemberTicket(IDataReader dr)
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

            this.AuthMemberTicketID   = DBUtil.GetLongField(dr, "AuthMemberTicketID");
            this.Token = DBUtil.GetCharField(dr, "Token");
            this.MemberID = DBUtil.GetLongField(dr, "MemberID");
            this.IssueDate = DBUtil.GetDateTimeField(dr, "IssueDate");
            this.Expiration = DBUtil.GetDateTimeField(dr, "Expiration");
            this.IsPersistent = DBUtil.GetIntField(dr, "IsPersistent");
            this.IsValid = true;
            return this.IsValid;
        }

        /// <summary>
        /// Inserts an object in database according to class properties. It depends on AuthMemberTicketID property.
        /// </summary>
        /// <returns>Returns true if it was successfully saved.</returns>
        public virtual bool Save()
        {
            this.WasSaved = false;            
            SpRoleAdmin sp = null;
        
            sp = new SpRoleAdmin(String.Format(@"
                    INSERT INTO {0} (Token, MemberID, IssueDate, Expiration, IsPersistent) 
                           VALUES(@Token, @MemberID, @IssueDate, @Expiration, @IsPersistent); SELECT @AuthMemberTicketID = @@IDENTITY", Table));

            sp.AddParameter("AuthMemberTicketID", AuthMemberTicketID, System.Data.ParameterDirection.Output);

            sp.AddParameter("Token", Token);
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("IssueDate", IssueDate);
            sp.AddParameter("Expiration", Expiration);
            sp.AddParameter("IsPersistent", IsPersistent);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.AuthMemberTicketID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            AuthMemberTicketID = (long)sp.GetParameter("AuthMemberTicketID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                AuthMemberTicketID = Convert.ToInt64(cm.LastInsertedId);

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE AuthMemberTicketID = @AuthMemberTicketID",Table));
            sp.AddParameter("AuthMemberTicketID", AuthMemberTicketID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }
    }
}
