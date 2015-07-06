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
    public partial class Language : ApplicationObject, IApplicationObject
    { 
        
    }

    /// <summary>
    /// Provides a wrapper on single row in the Languages database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using Languages class which returns collection of Language objects by different condition.
    /// </summary>
    public partial class Language : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public int LanguageID { get; set; }
        
        /// <summary>
        /// Language name in English.
        /// </summary>
        public string EnglishName { get; set; }

        /// <summary>
        /// Language name in native words.
        /// </summary>
        public string NativeName { get; set; }
        
        /// <summary>
        /// Language ISO code.
        /// </summary>
        public string Code { get; set; }
        
        /// <summary>
        /// Language current status.
        /// </summary>
        public int IsEnabled { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public Language()
        {

        }

        /// <summary>
        /// Creates AuditEvent object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public Language(IDataReader dr)
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

            this.LanguageID     = DBUtil.GetIntField(dr, "LanguageID");
            this.IsEnabled   = DBUtil.GetIntField(dr, "IsEnabled");
            this.EnglishName = DBUtil.GetCharField(dr, "EnglishName");
            this.NativeName = DBUtil.GetCharField(dr, "NativeName");
            this.Code = DBUtil.GetCharField(dr, "COde");

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

            if (this.LanguageID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                               EnglishName  = @EnglishName, 
                               NativeName   = @NativeName,
                               Code         = @Code,
                               IsEnabled    = @IsEnabled,
                               Modified     = getdate()
                        WHERE LanguageID = @LanguageID",Table));

                sp.AddParameter("LanguageID", LanguageID);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"INSERT INTO {0} (@nglishName, NativeName, Code, IsEnabled, Created) 
                                        VALUES(@EnglishName, @NativeName, @Code, @IsEnabled, getdate()); SELECT @LanguageID = @@IDENTITY",Table));

                sp.AddParameter("LanguageID", LanguageID, System.Data.ParameterDirection.Output);
            }

            sp.AddParameter("EnglishName", EnglishName);
            sp.AddParameter("NativeName", NativeName);
            sp.AddParameter("IsEnabled", IsEnabled);
            sp.AddParameter("Code", Code);    

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.LanguageID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            LanguageID = (int)sp.GetParameter("LanguageID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                LanguageID = Convert.ToInt32(cm.LastInsertedId);

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE LanguageID = @LanguageID",Table));
            sp.AddParameter("LanguageID", LanguageID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
