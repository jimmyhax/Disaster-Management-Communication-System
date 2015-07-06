using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;

namespace Web.Admin.Logic.Objects
{

    /// <summary>
    /// Provides a wrapper on single item in the MemberTokens database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from a database using MemberTokens class which returns collection of MemberToken by different condition.  
    /// </summary>    
    public partial class MemberToken : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>        
        public long MemberTokenID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>        
        public long MemberID { get; set; }
        
        /// <summary>
        /// Member token string.
        /// </summary>
        public string Token { get; set; }
        
        /// <summary>
        /// Email of the token creator.
        /// </summary>
        public string GeneratedBy { get; set; }

        /// <summary>
        /// Date of item creation.
        /// </summary>
        public DateTime Created { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        public DateTime Modified { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberToken()
        {

        }

        /// <summary>
        /// Creates MemberToken object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public MemberToken(IDataReader dr)
        {
            this.Load(dr);
        }

        /// <summary>
        /// Updates member token string and set modification date.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool SaveToken()
        {
            bool result = false;
            SpRoleAdmin sp = null;

            if (this.MemberID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET Token = @Token, Modified = @Modified
                        WHERE MemberID = @MemberID",Table));

                sp.AddParameter("MemberID", MemberID);
                sp.AddParameter("Token", Token);
                sp.AddParameter("Modified", DateTime.Now.ToUniversalTime());

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

            this.MemberTokenID = DBUtil.GetLongField(dr, "MemberTokenID");
            this.MemberID       = DBUtil.GetLongField(dr, "MemberID");
            this.Token          = DBUtil.GetCharField(dr, "Token");
            this.GeneratedBy    = DBUtil.GetCharField(dr, "GeneratedBy");
            this.Created        = DBUtil.GetDateTimeField(dr, "Created");
            this.Modified       = DBUtil.GetDateTimeField(dr, "Modified");

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

            if (this.MemberTokenID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                               Token        = @Token, 
                               GeneratedBy  = @GeneratedBy,                               
                               Modified     = @Modified
                        WHERE MemberTokenID = @MemberTokenID",Table));

                sp.AddParameter("MemberTokenID", MemberTokenID);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO  {0} ( MemberID, Token,GeneratedBy, Created, Modified) 
                               VALUES( @MemberID, @Token, @GeneratedBy, @Created, @Modified); SELECT @MemberTokenID = @@IDENTITY",Table));

                sp.AddParameter("MemberTokenID", MemberID, System.Data.ParameterDirection.Output);

                if (Modified != DateTime.MinValue)
                    sp.AddParameter("Modified", Created);
                else
                    sp.AddParameter("Modified", DateTime.UtcNow);

            }

            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("GeneratedBy", GeneratedBy);
            sp.AddParameter("Token", Token);
            
            if(Created != DateTime.MinValue)
                sp.AddParameter("Created", Created);
            else
                sp.AddParameter("Created", DateTime.UtcNow);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.MemberTokenID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            MemberID = (long)sp.GetParameter("MemberTokenID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE MemberTokenID=@MemberTokenID",Table));
            sp.AddParameter("MemberTokenID", MemberTokenID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
