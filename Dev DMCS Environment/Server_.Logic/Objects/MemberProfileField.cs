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
    public partial class MemberProfileField : ApplicationObject, IApplicationObject
    {

    }


    /// <summary>
    /// Database read/write part.
    /// </summary>
    public partial class MemberProfileField : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>

        [DataMember]
        public int ProfileFieldID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>
        [DataMember]
        public long MemberID { get; set; }

        /// <summary>
        /// Field unique identifier in the database.
        /// </summary>
        [DataMember]
        public int FieldID { get; set; }

        /// <summary>
        /// Field name.
        /// </summary>
        [DataMember]
        public string FieldName { get; set; }

        /// <summary>
        /// Member field value.
        /// </summary>        
        [DataMember]
        public string FieldValue { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        [DataMember(EmitDefaultValue = false)]
        public DateTime Created { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        [DataMember(EmitDefaultValue = false)]
        public DateTime Modified { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberProfileField()
        {

        }

        /// <summary>
        /// Creates MemberProfileField object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public MemberProfileField(IDataReader dr)
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

            this.ProfileFieldID = DBUtil.GetIntField(dr, "ProfileFieldID");
            this.MemberID = DBUtil.GetLongField(dr, "MemberID");
            this.FieldID = DBUtil.GetIntField(dr, "FieldID");
            this.FieldName = DBUtil.GetCharField(dr, "FieldName");
            this.FieldValue = DBUtil.GetCharField(dr, "FieldValue");
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

            if (this.ProfileFieldID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                               FieldValue = @FieldValue,
                               Modified = @Modified
                        WHERE ProfileFieldID = @ProfileFieldID", Table));

                this.Modified = DateTime.UtcNow;
                sp.AddParameter("ProfileFieldID", ProfileFieldID);
                sp.AddParameter("Modified", this.Modified);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (MemberID, FieldID, FieldValue, Created) 
                               VALUES(@MemberID, @FieldID, @FieldValue, @Created); SELECT @ProfileFieldID = @@IDENTITY", Table));

                sp.AddParameter("ProfileFieldID", ProfileFieldID, System.Data.ParameterDirection.Output);
                sp.AddParameter("Created", DateTime.UtcNow);
            }

            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("FieldID", FieldID);

            if (FieldValue == null || FieldValue.Trim().Length == 0)
                sp.AddParameter("FieldValue", "");
            else
                sp.AddParameter("FieldValue", FieldValue);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.ProfileFieldID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            ProfileFieldID = (int)sp.GetParameter("ProfileFieldID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                ProfileFieldID = Convert.ToInt32(cm.LastInsertedId);

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0}  WHERE ProfileFieldID = @ProfileFieldID", Table));
            sp.AddParameter("ProfileFieldID", ProfileFieldID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
