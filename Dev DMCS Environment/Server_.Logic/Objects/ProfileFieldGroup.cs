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

    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class ProfileFieldGroup : ApplicationObject, IApplicationObject
    {

    }

    /// <summary>
    /// Provides a wrapper on single item in the ProfileFieldGroups database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from a database using ProfileFieldGroups class which returns collection of ProfileFieldGroup by different condition.
    /// </summary>
    public partial class ProfileFieldGroup : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public int FieldGroupID { get; set; }
        
        /// <summary>
        /// Dield group description.
        /// </summary>
        public string FieldGroupDescription { get; set; }
        
        /// <summary>
        /// Field group name.
        /// </summary>
        public string FieldGroupName { get; set; }
        
        /// <summary>
        /// OrderID number.
        /// </summary>
        public int OrderID { get; set; }

        /// <summary>
        /// Meaning: Do members see this group on the profile page
        /// </summary>
        public int IsActive { get; set; }

        /// <summary>
        /// Only admin members will see the group if this property is true
        /// </summary>
        public int AdminUseOnly { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public ProfileFieldGroup()
        {
            AdminUseOnly = 0;
            IsActive = 0;
        }

        /// <summary>
        /// Creates ProfileFieldGroup object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>        
        public ProfileFieldGroup(IDataReader dr) : base()
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

            this.FieldGroupID = DBUtil.GetIntField(dr, "FieldGroupID");
            this.FieldGroupDescription = DBUtil.GetCharField(dr, "FieldGroupDescription");
            this.FieldGroupName   = DBUtil.GetCharField(dr, "FieldGroupName");
            this.OrderID          = DBUtil.GetIntField(dr, "OrderID");
            this.IsActive         = DBUtil.GetIntField(dr, "IsActive");
            this.AdminUseOnly     = DBUtil.GetIntField(dr, "AdminUseOnly");

            this.IsValid = true;
            return this.IsValid;
        }

        /// <summary>
        /// Inserts or updates an object in database according to class properties.
        /// </summary>
        /// <returns>Returns true if it was successfully saved.</returns>            
        public virtual bool Save()
        {
            this.WasSaved = false;
            SpRoleAdmin sp = null;

            if (this.FieldGroupID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                              FieldGroupName = @FieldGroupName,
                              FieldGroupDescription = @FieldGroupDescription,
                              IsActive = @IsActive,
                              OrderID = @OrderID,
                              AdminUseOnly = @AdminUseOnly
                        WHERE FieldGroupID = @FieldGroupID", Table));

                sp.AddParameter("FieldGroupID", FieldGroupID);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (FieldGroupDescription, FieldGroupName,OrderID, IsActive, AdminUseOnly) 
                               VALUES(@FieldGroupDescription, @FieldGroupName, @OrderID, @IsActive, @AdminUseOnly); SELECT @FieldGroupID = @@IDENTITY", Table));

                sp.AddParameter("FieldGroupID", FieldGroupID, System.Data.ParameterDirection.Output);
            }

            sp.AddParameter("FieldGroupDescription", FieldGroupDescription);
            sp.AddParameter("FieldGroupName", FieldGroupName);
            sp.AddParameter("IsActive", IsActive);
            sp.AddParameter("AdminUseOnly", AdminUseOnly);

            if (OrderID >= 0)
                sp.AddParameter("OrderID", OrderID);      
            else
                sp.AddParameter("OrderID", DBNull.Value);      

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.FieldGroupID <= 0)
            {
                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                    {
                        FieldGroupID = (int)sp.GetParameter("FieldGroupID");
                        break;
                    }
                    case DatabaseProvider.MySQLServer:
                    {
                        MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                        if (cm.LastInsertedId > 0)
                            FieldGroupID = Convert.ToInt32(cm.LastInsertedId);

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
            DELETE FROM MemberProfileFields WHERE FieldID IN (SELECT FieldID FROM ProfileFields WHERE FieldGroupID = @FieldGroupID);
            DELETE FROM DomainProfileFields WHERE ProfileFieldID IN (SELECT FieldID FROM ProfileFields WHERE FieldGroupID = @FieldGroupID);
            DELETE FROM RoleProfileFields WHERE ProfileFieldID IN (SELECT FieldID FROM ProfileFields WHERE FieldGroupID = @FieldGroupID);            
            DELETE FROM ProfileFields WHERE FieldGroupID = @FieldGroupID;
            DELETE FROM {0} WHERE FieldGroupID = @FieldGroupID;"
            , Table));
            
            sp.AddParameter("FieldGroupID", FieldGroupID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
