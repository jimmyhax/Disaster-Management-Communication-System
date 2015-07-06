using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;
using System.Drawing;
using System.Runtime.Serialization;
using System.Data;
using MySql.Data.MySqlClient;

namespace Web.Admin.Logic.Objects
{
    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class Role : ApplicationObject, IApplicationObject
    { 
        
    }

    /// <summary>
    /// Provides a wrapper on single item in the Roles database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from a database using Roles class which returns collection of Role by different condition.
    /// </summary>    
    [DataContract]
    public partial class Role : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        [DataMember]
        public long RoleID { get; set; }
        
        /// <summary>
        /// Role label back color.
        /// </summary>
        [DataMember]
        public string BackColor { get; set; }
        
        /// <summary>
        /// Role label text color.
        /// </summary>
        [DataMember]
        public string ForeColor { get; set; }
        
        /// <summary>
        /// Role name.
        /// </summary>
        [DataMember]
        public string Name { get; set; }
        
        /// <summary>
        /// Role description/settings.
        /// </summary>
        [DataMember]
        public string Settings  { get; set; }
        
        /// <summary>
        /// Built-In flag.
        /// </summary>
        [DataMember]
        public bool IsBuiltIn { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        [DataMember(EmitDefaultValue = false)]
        public DateTime Created { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        [DataMember(EmitDefaultValue = false) ]        
        public DateTime Modified { get; set; }

        /// <summary>
        /// Count of role's members.
        /// </summary>
        [DataMember]
        public long MemberCount { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public Role()
        {
            
        }

        /// <summary>
        /// Creates Member object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public Role(IDataReader dr)
        {
            this.Load(dr);
        }

        /// <summary>
        /// Return text color string which is based on back color. 
        /// </summary>
        /// <param name="Name"></param>
        /// <returns></returns>
        public static string ContrastColor(String Name)
        {
            Color ColourToInvert = System.Drawing.ColorTranslator.FromHtml("#" + Name);
            return System.Drawing.ColorTranslator.ToHtml(GetReadableForeColor(ColourToInvert));
        }

        /// <summary>
        /// Return text color string which is based on back color. 
        /// </summary>
        /// <param name="SourecColor">Color object.</param>
        /// <returns>Color object with inversed color.</returns>
        private static Color GetReadableForeColor(Color SourecColor)
        {
            return (((SourecColor.R + SourecColor.B + SourecColor.G) / 3) > 170) ? Color.Black : Color.White;
        }

        /// <summary>
        /// Loads result set field values and saves into properties of class.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        /// <returns>Returns true if it was successfully loaded.</returns>
        public virtual bool Load(IDataReader dr)
        {
            this.IsValid = false;

            this.Name = DBUtil.GetCharField(dr, "Name");
            this.RoleID = DBUtil.GetLongField(dr, "RoleID");
            this.IsBuiltIn = DBUtil.GetIntField(dr, "IsBuiltIn") == 1 ? true : false;
            this.BackColor = DBUtil.GetCharField(dr, "BackColor");
            this.ForeColor = DBUtil.GetCharField(dr, "ForeColor");
            this.Settings = DBUtil.GetCharField(dr, "Settings");
            this.Created = DBUtil.GetDateTimeField(dr, "Created");
            this.Modified = DBUtil.GetDateTimeField(dr, "Modified");
            this.MemberCount = Convert.ToInt64(dr["MemberCount"]);
            
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

            if (this.RoleID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                               Name         = @Name,                            
                               Settings     = @Settings,
                               BackColor    = @BackColor,
                               ForeColor    = @ForeColor,
                               IsBuiltIn    = @IsBuiltIn,
                               Modified     = @Modified 
                        WHERE RoleID = @RoleID",Table));

                sp.AddParameter("RoleID", RoleID);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (Name,IsBuiltIn, Settings, BackColor, ForeColor, Created, Modified) 
                               VALUES(@Name, @IsBuiltIn, @Settings,@BackColor,@ForeColor,@Created,@Modified); SELECT @RoleID = @@IDENTITY",Table));

                sp.AddParameter("RoleID", RoleID, System.Data.ParameterDirection.Output);

                if (Created != DateTime.MinValue)
                    sp.AddParameter("Modified", Modified);
                else
                    sp.AddParameter("Modified", DBNull.Value);

            }

            sp.AddParameter("Name", Name);
            if (Settings == null || Settings.Length == 0)
                sp.AddParameter("Settings", DBNull.Value);
            else
                sp.AddParameter("Settings", Settings);

            sp.AddParameter("BackColor", BackColor);
            sp.AddParameter("ForeColor", ForeColor);
            sp.AddParameter("IsBuiltIn", IsBuiltIn ? 1 : 0);

            if (Created != DateTime.MinValue)
                sp.AddParameter("Created", Created);
            else
                sp.AddParameter("Created", DateTime.UtcNow);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.RoleID <= 0)
            {
                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                    {
                        RoleID = (long)sp.GetParameter("RoleID");
                        break;
                    }
                    case DatabaseProvider.MySQLServer:
                    {
                        MySqlCommand cm = (MySqlCommand) sp.SqlCommand;
                        
                        if (cm.LastInsertedId > 0)
                            RoleID = Convert.ToInt64(cm.LastInsertedId);
                        
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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
            DELETE FROM RoleProfileFields WHERE RoleID = @RoleID;
            DELETE FROM {0} WHERE RoleID = @RoleID;",Table));
            sp.AddParameter("RoleID", RoleID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }


    }
}