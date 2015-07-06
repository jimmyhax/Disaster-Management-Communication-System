using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;

namespace Web.Admin.Logic.Objects
{

    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class ProfileFieldType : ApplicationObject, IApplicationObject
    {

    }

    /// <summary>
    /// Provides a wrapper on single item in the ProfileFieldTypes database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from a database using ProfileFieldTypes class which returns collection of ProfileFieldType by different condition.
    /// </summary>    
    public partial class ProfileFieldType : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public ProfileFieldTypeEnum FieldTypeID { get; set; }
        
        /// <summary>
        /// Field type name.
        /// </summary>
        public string FieldTypeName { get; set; }
        
        /// <summary>
        /// Field type description.
        /// </summary>
        public string FieldTypeDescription { get; set; }
        
        /// <summary>
        /// Field type size.
        /// </summary>
        public int FieldTypeSize { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public ProfileFieldType()
        {
            
        }

        /// <summary>
        /// Creates ProfileFieldGroup object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>        
        public ProfileFieldType(IDataReader dr)
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
            this.FieldTypeID = (ProfileFieldTypeEnum)DBUtil.GetIntField(dr, "FieldTypeID");
            this.FieldTypeName = DBUtil.GetCharField(dr, "FieldTypeName");
            this.FieldTypeDescription = DBUtil.GetCharField(dr, "FieldTypeDescription");
            this.FieldTypeSize = DBUtil.GetIntField(dr, "FieldTypeSize");

            this.IsValid = true;
            return this.IsValid;
        }

    }
}
