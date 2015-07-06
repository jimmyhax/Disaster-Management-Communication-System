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
    /// <summary>
    /// Token type
    /// SelfActivation - means that the token will be used for activation purposes,
    /// PasswordReset  - means that the token will be used for changing password purposes.
    /// </summary>
    public enum ActionTokenTypes
    {
        /// <summary>
        /// The token will be used for activation purposes.
        /// </summary>
        SelfActivation = 1,
        /// <summary>
        /// The token will be used for changing password purposes.
        /// </summary>
        PasswordReset = 2
    }

    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class ActionToken : ApplicationObject, IApplicationObject
    {
       
    }

    /// <summary>
    /// Provides a wrapper on single row in the ActionTokens database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using ActionTokens class which returns collection of ActionToken objects by different condition.
    /// </summary>
    public partial class ActionToken : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique identifier in the database.
        /// </summary>
        public long ActionID { get; set; }

        /// <summary>
        /// Type of action token. 
        /// Here is the list of possible values:
        /// SelfActivation - means that the token will be used for activation purposes,
        /// PasswordReset  - means that the token will be used for changing password purposes.
        /// </summary>
        public ActionTokenTypes ActionType { get; set; }
        
        /// <summary>
        /// Random symbols and numbers string which is in lower and upper case.
        /// </summary>
        public string Token { get; set; }
        
        /// <summary>
        /// Token's owner email.
        /// </summary>
        public string Email { get; set; }
        
        /// <summary>
        /// Creation date time in UTC format.
        /// </summary>
        public DateTime Created { get; set; }
        
        /// <summary>
        /// Rediration URL which is used after token processing.
        /// </summary>
        public String ReturnURL { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public ActionToken()
        {
            Email = "";
        }
        
        /// <summary>
        /// Creates ActionToken object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public ActionToken(IDataReader dr)
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

            this.ActionID   = DBUtil.GetLongField(dr, "ActionID");
            this.ActionType = (ActionTokenTypes)DBUtil.GetIntField(dr, "ActionType");
            this.Token      = DBUtil.GetCharField(dr, "Token");
            this.Email      = DBUtil.GetCharField(dr, "Email");
            this.Created    = DBUtil.GetDateTimeField(dr, "Created");
            this.ReturnURL  = DBUtil.GetCharField(dr, "ReturnURL");
            
            this.IsValid = true;
            return this.IsValid;
        }

        /// <summary>
        /// Inserts an object in database according to class properties. It depends on ActionID property.
        /// </summary>
        /// <returns>Returns true if it was successfully saved.</returns>
        public virtual bool Save()
        {
            this.WasSaved = false;            
            SpRoleAdmin sp = null;
        
            sp = new SpRoleAdmin(String.Format(@"
                    INSERT INTO {0} (Token, Email, ActionType, Created, ReturnUrl) 
                           VALUES(@Token, @Email,@ActionType, @Created, @ReturnUrl); SELECT @ActionID = @@IDENTITY", Table));

            sp.AddParameter("ActionID", ActionID, System.Data.ParameterDirection.Output);

            sp.AddParameter("Token", Token);
            sp.AddParameter("Email", Email);
            sp.AddParameter("ActionType", ActionType);
            sp.AddParameter("Created", DateTime.UtcNow);
            
            if (ReturnURL != null)
                sp.AddParameter("ReturnURL", ReturnURL);
            else
                sp.AddParameter("ReturnURL", DBNull.Value);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.ActionID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            ActionID = (long)sp.GetParameter("ActionID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                ActionID = Convert.ToInt64(cm.LastInsertedId);

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE ActionID = @ActionID",Table));
            sp.AddParameter("ActionID", ActionID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }
    }
}
