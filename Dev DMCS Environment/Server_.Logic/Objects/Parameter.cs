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
    /// Parameter type. Possible values are:
    /// ShortString - string 32 cahrs
    /// LongString - string 2048 cahrs
    /// SmallInteger - integer number
    /// Bool - true or false
    /// RadioInteger - integer
    /// </summary>
    public enum ParameterType
    { 
        /// <summary>
        /// String 32 cahrs.
        /// </summary>
        ShortString = 1,
	    /// <summary>
        /// string 2048 cahrs.
	    /// </summary>
        LongString = 2,	
	    /// <summary>
        /// integer number.
	    /// </summary>
        SmallInteger = 3,
	    /// <summary>
        /// true or false.
	    /// </summary>
        Bool = 	4,
        /// <summary>
        /// integer.
        /// </summary>
        RadioInteger = 5 
    }

    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class Parameter : ApplicationObject, IApplicationObject
    {

    }

    /// <summary>
    /// Provides a wrapper on single item in the Parameters database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from a database using Parameters class which returns collection of Parameter by different condition. 
    /// </summary>
    public partial class Parameter : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public int ID { get; set; }
        
        /// <summary>
        /// Parameter unique name.
        /// </summary>
        public string Name { get; set; }
        
        /// <summary>
        /// Parameter value.
        /// </summary>
        public string Value { get; set; }

        /// <summary>
        /// Member (creator) unique identifier in the database.
        /// </summary>        
        public long MemberID { get; set; }

        /// Parameter type possible values:
        /// ShortString - string 32 cahrs;
        /// LongString - string 2048 cahrs;
        /// SmallInteger - integer number;
        /// Bool - true or false;
        /// RadioInteger - integer.
        public ParameterType Type { get; set; }
        
        /// <summary>
        /// Name of type.
        /// </summary>
        public String TypeName { get; set; }
        
        /// <summary>
        /// Type size number.
        /// </summary>
        public int TypeSize { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        public DateTime Created { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        public DateTime Modified { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public Parameter()
        {
            
        }

        /// <summary>
        /// Creates Parameter object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>        
        public Parameter(IDataReader dr)
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

            this.ID         = DBUtil.GetIntField(dr, "ID");
            this.MemberID   = DBUtil.GetLongField(dr, "MemberID");
            this.Name       = DBUtil.GetCharField(dr, "Name");
            this.Value      = DBUtil.GetCharField(dr, "Value");
            this.Created    = DBUtil.GetDateTimeField(dr, "Created");
            this.Modified   = DBUtil.GetDateTimeField(dr, "Modified");
            this.Type       = (ParameterType)DBUtil.GetIntField(dr, "TypeID");
            this.TypeName   = DBUtil.GetCharField(dr, "TypeName");
            this.TypeSize   = DBUtil.GetIntField(dr, "TypeSize");

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

            if (this.MemberID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                               Value    = @Value,
                               MemberID = @MemberID,                               
                               Modified = @Modified
                        WHERE ID = @ID",Table));

                sp.AddParameter("ID", ID);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (Name, Value, MemberID,TypeID, Created) 
                               VALUES(@Name, @Value, @MemberID, @TypeID, @Created); SELECT @MemberID = @@IDENTITY",Table));

                sp.AddParameter("ID", ID, System.Data.ParameterDirection.Output);
                sp.AddParameter("Created", DateTime.UtcNow);
                sp.AddParameter("Name", Name);
            }
            
            if(Value == null || Value.Trim().Length == 0)
                sp.AddParameter("Value", DBNull.Value);            
            else
                sp.AddParameter("Value",Value);            
            
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("TypeID", (int)Type);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.ID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                    {
                        ID = (int)sp.GetParameter("ID");
                        break;
                    }
                    case DatabaseProvider.MySQLServer:
                    {
                        MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                        if (cm.LastInsertedId > 0)
                            ID = Convert.ToInt32(cm.LastInsertedId);

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

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0}  WHERE ID = @ID",Table));
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
