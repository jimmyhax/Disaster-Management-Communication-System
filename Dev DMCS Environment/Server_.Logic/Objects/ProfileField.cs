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
    /// String - string 32 chars;
    /// StringMultiline - string 64 chars;
	/// Number - integer number;
    /// ListSingleSelect - integer number;
    /// ListMultiSelect - integer number.
    /// </summary>
    public enum ProfileFieldTypeEnum
    { 
       	/// <summary>
       	/// The value is string.
       	/// </summary>
        String = 1,
	    /// <summary>
	    /// The value is multilen string.
	    /// </summary>
        StringMultiline = 2,
	    /// <summary>
	    /// The value is number
	    /// </summary>
        Number = 3,
	    /// <summary>
	    /// The value is string from the list.
	    /// </summary>
        ListSingleSelect = 4,
	    /// <summary>
	    /// The value is string array from the list.
	    /// </summary>
        ListMultiSelect = 5,
        /// <summary>
        /// The value is true or false.
        /// </summary>
        CheckBox = 6,
        /// <summary>
        /// The value is string from the list.
        /// </summary>
        Radio = 7,
        /// <summary>
        /// The value is string from the combobox list.
        /// </summary>
        ComboBox = 8
    }

    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class ProfileField : ApplicationObject, IApplicationObject
    {

    }

    /// <summary>
    /// Provides a wrapper on single item in the ProfileFields database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from a database using ProfileFields class which returns collection of ProfileField by different condition.
    /// </summary>
    public partial class ProfileField : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public int FieldID       { get; set; }

        /// <summary>
        /// Parameter type. Possible values are:
        /// String - string 32 chars;
        /// StringMultiline - string 64 chars;
        /// Number - integer number;
        /// ListSingleSelect - integer number;
        /// ListMultiSelect - integer number.
        /// </summary>
        public ProfileFieldTypeEnum FieldTypeID { get; set; }
        
        /// <summary>
        /// Fiels name.
        /// </summary>
        public string FieldName  { get; set; }
        
        /// <summary>
        /// Field comment.
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// The list of possible values (comma separated string).
        /// </summary>
        public string PossibleValues { get; set; }
        
        /// <summary>
        /// Select value text for drop-dwon list. 
        /// </summary>
        public string TextSelectValue { get; set; }
	    
        /// <summary>
        /// Mandatory flag.
        /// </summary>
        public int IsMandatory   { get; set; }
	    
        /// <summary>
        /// The field will be shown in sign-in form.
        /// </summary>
        public int ShowInSignUp  { get; set; }
	    
        /// <summary>
        /// Field group unique identifier.
        /// </summary>
        public int FieldGroupID  { get; set; }
        
        /// <summary>
        /// Order number.
        /// </summary>
        public int OrderID       { get; set; }

        /// <summary>
        /// Sort possible value in the list.
        /// </summary>
        public int SortValues     { get; set; }
        
        /// <summary>
        /// If field is active show field for the member.
        /// </summary>
        public int IsActive       { get; set; }
        
        /// <summary>
        /// Show the fiedl fro admin member only.
        /// </summary>
        public int AdminUseOnly   { get; set; }
        
        /// <summary>
        /// User vertical layout for radio button group and checkboxes.
        /// </summary>
        public int VerticalLayout { get; set; }

        /// <summary>
        /// If you set this flag the field value will be stored encrypted in the database.
        /// </summary>
        public int Encrypted { get; set; }

        /// <summary>
        /// Date of creation.
        /// </summary>
        public DateTime Created  { get; set; }

        /// <summary>
        /// Date of modification.
        /// </summary>
        public DateTime Modified { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public ProfileField ()
        {
          SortValues = 0 ;   
          IsActive = 0;      
          AdminUseOnly = 0;
          VerticalLayout = 0;
          Encrypted = 0;
        }

        /// <summary>
        /// Creates ProfileField object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>        
        public ProfileField(IDataReader dr) : base()
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

            this.FieldID        = DBUtil.GetIntField(dr, "FieldID");
            this.FieldTypeID    = (ProfileFieldTypeEnum)DBUtil.GetIntField(dr, "FieldTypeID");
            this.FieldName      = DBUtil.GetCharField(dr, "FieldName");
            this.Comment        = DBUtil.GetCharField(dr, "Comment");
            this.PossibleValues = DBUtil.GetCharField(dr, "PossibleValues");
            this.TextSelectValue = DBUtil.GetCharField(dr, "TextSelectValue");
            this.IsMandatory    = DBUtil.GetIntField(dr, "IsMandatory");  
            this.ShowInSignUp   = DBUtil.GetIntField(dr, "ShowInSignUp"); 
            this.FieldGroupID   = DBUtil.GetIntField(dr, "FieldGroupID");
            this.OrderID        = DBUtil.GetIntField(dr, "OrderID");                  
            this.SortValues     = DBUtil.GetIntField(dr, "SortValues");    
            this.IsActive       = DBUtil.GetIntField(dr, "IsActive");      
            this.AdminUseOnly   = DBUtil.GetIntField(dr, "AdminUseOnly");
            this.VerticalLayout = DBUtil.GetIntField(dr, "VerticalLayout");
            this.Encrypted      = DBUtil.GetIntField(dr, "Encrypted");
            this.Created        = DBUtil.GetDateTimeField(dr, "Created");
            this.Modified       = DBUtil.GetDateTimeField(dr, "Modified");

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

            if (this.FieldID > 0)
            {
                sp = new SpRoleAdmin(@"
                        UPDATE " + ApplicationTables.TableName(this) + @" SET 
                        FieldTypeID = @FieldTypeID, 
                        FieldName = @FieldName, 
                        Comment = @Comment, 
                        PossibleValues = @PossibleValues, 
                        TextSelectValue = @TextSelectValue, 
                        IsMandatory = @IsMandatory, 
                        ShowInSignUp = @ShowInSignUp, 
                        FieldGroupID = @FieldGroupID, 
                        SortValues = @SortValues, 
                        IsActive = @IsActive, 
                        AdminUseOnly = @AdminUseOnly, 
                        VerticalLayout = @VerticalLayout,     
                        OrderID = @OrderID,
                        Encrypted = @Encrypted,
                        Modified = @Modified
                        WHERE FieldID = @FieldID");

                sp.AddParameter("FieldID", FieldID);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (FieldTypeID, FieldName, Comment, PossibleValues, TextSelectValue, IsMandatory, ShowInSignUp, FieldGroupID, OrderID, SortValues, IsActive, AdminUseOnly, VerticalLayout, Encrypted, Created) 
                               VALUES(@FieldTypeID, @FieldName, @Comment, @PossibleValues, @TextSelectValue, @IsMandatory, @ShowInSignUp, @FieldGroupID, @OrderID, @SortValues, @IsActive, @AdminUseOnly, @VerticalLayout, @Encrypted, @Created); SELECT @FieldID = @@IDENTITY", Table));

                sp.AddParameter("FieldID", FieldID, System.Data.ParameterDirection.Output);
                sp.AddParameter("Created", DateTime.UtcNow);
            }

            sp.AddParameter("FieldTypeID", (int)FieldTypeID);
            sp.AddParameter("FieldName", FieldName);
            
            if (Comment != null && Comment.Length > 0)            
                sp.AddParameter("Comment",Comment);   
            else
                sp.AddParameter("Comment", DBNull.Value);


            if (PossibleValues != null && PossibleValues.Length > 0)
                sp.AddParameter("PossibleValues", PossibleValues);   
            else
                sp.AddParameter("PossibleValues", DBNull.Value);

            if (TextSelectValue != null && TextSelectValue.Length > 0)
                sp.AddParameter("TextSelectValue", TextSelectValue);   
            else
                sp.AddParameter("TextSelectValue", DBNull.Value);   


            sp.AddParameter("IsMandatory",IsMandatory);  
            sp.AddParameter("ShowInSignUp",ShowInSignUp); 
            sp.AddParameter("FieldGroupID",FieldGroupID);
            sp.AddParameter("OrderID", OrderID); 
     
            sp.AddParameter("SortValues",      SortValues);    
            sp.AddParameter("IsActive",        IsActive);      
            sp.AddParameter("AdminUseOnly",    AdminUseOnly);  
            sp.AddParameter("VerticalLayout",  VerticalLayout);

            if (Encrypted == int.MinValue)
                sp.AddParameter("Encrypted", 0);
            else
                sp.AddParameter("Encrypted", Encrypted);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.FieldID <= 0)
            {
                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                    {
                        FieldID = (int)sp.GetParameter("FieldID");
                        break;
                    }
                    case DatabaseProvider.MySQLServer:
                    {
                        MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                        if (cm.LastInsertedId > 0)
                            FieldID = Convert.ToInt32(cm.LastInsertedId);

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
            DELETE FROM MemberProfileFields WHERE FieldID = @FieldID;
            DELETE FROM DomainProfileFields WHERE ProfileFieldID = @FieldID;
            DELETE FROM RoleProfileFields WHERE ProfileFieldID = @FieldID;
            DELETE FROM {0} WHERE FieldID = @FieldID;",
            Table));

            sp.AddParameter("FieldID", FieldID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
