using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

using Web.Admin.Logic.Utilities;
using Web.Admin.Logic.Objects;


namespace Web.Admin.Logic.Collections
{
    /// <summary>
    /// Provides a possibility to get a token or collection of tokens which are connected with different type of action.
    /// For instance the activation process sends email notification with a token or password changing process.
    /// </summary>
    public class ActionTokens : ApplicationCollection<ActionToken, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets instance of ActionToken object by the token unique identifier.
        /// </summary>
        /// <param name="ActionID">Unique identifier of a token.</param>
        /// <returns>Instance of ActionToken object if it exists.</returns>
        public static ActionToken GetBy(long ActionID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT *  {0} WHERE ActionID = @ActionID",Table));
            sp.AddParameter("ActionID", ActionID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets instance of ActionToke object by the token unique identifier and action type.
        /// </summary>
        /// <param name="Token">Unique identifier of token.</param>
        /// <param name="Type">Action type.</param>
        /// <returns>Instance of ActionToken object if it exists.</returns>
        /// ActionToken types:
        /// SelfActivation - means that the token will be used for activation purposes;
        /// PasswordReset  - means that the token will be used for changing password purposes.
        public static ActionToken GetBy(String Token, ActionTokenTypes Type)
        {
            SpRoleAdmin sp = null;

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                {
                    sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE Token=@Token COLLATE SQL_Latin1_General_CP1_CS_AS AND ActionType=@ActionType", Table));
                    break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE Token=@Token COLLATE latin1_general_cs AND ActionType=@ActionType", Table));
                    break;
                }
            }
                
            sp.AddParameter("Token", Token);
            sp.AddParameter("ActionType", Type);
            return GetApplicationObject(sp);
        }
    }
}
