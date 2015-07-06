using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Web.Admin.Logic.Utilities;
using System.Runtime.Serialization;
using System.Web;
using Web.Admin.Logic.Collections;
using MySql.Data.MySqlClient;

namespace Web.Admin.Logic.Objects
{
    /// <summary>
    /// Type if export/import file
    /// CSV - comma separated format;
    /// XLS - MS Excel format'
    /// </summary>
    public enum DownloadFileType
    {
        /// <summary>
        /// comma separated format
        /// </summary>
        CSV = 1,
        /// <summary>
        /// MS Excel format
        /// </summary>
        XLS = 2
    }

    // Business logic part. Can be used for extra logic which operates by not SQL specific objects.
    public partial class Member : ApplicationObject
    {
        private MemberToken _Token = null;
        
        /// <summary>
        /// Gets list of member's role. 
        /// </summary>
        public List<Role> Roles {
            get {
                return Collections.Roles.GetByMember(MemberID);
            }
        }

        /// <summary>
        /// Gets member's token which is used for API. 
        /// </summary>
        public MemberToken Token
        {
            get
            {
                if (_Token == null)
                    _Token = Collections.MemberTokens.GetByMember(MemberID);

                return _Token;
            } 
        }

        /// <summary>
        /// Gets "|" separeted string of the member's role list. 
        /// </summary>
        public string RolesToString
        {
            get
            {
                StringBuilder sb =  new StringBuilder();
                List<Role> _Roles = Roles;
                foreach(Role Role in _Roles)
                {
                    if(sb.Length > 0)
                        sb.Append("|");

                    sb.Append(Role.Name);
                }
                
                return sb.ToString();
            }
        }

    }


    /// <summary>
    /// Provides a wrapper on single row in the Members database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using Members class which returns collection of Member objects by different condition.
    /// </summary>
    [DataContract]
    public partial class Member : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        [DataMember]
        public long MemberID { get; set; }

        /// <summary>
        /// Unique name of member. Can be last/first name or another thing.
        /// </summary>
        [DataMember]
        public string Name { get; set; }
        
        /// <summary>
        /// Email address of a member.
        /// </summary>
        [DataMember]
        public string Email { get; set; }
        
        /// <summary>
        /// Member password.
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// Member time zone code
        /// </summary>
        [DataMember]
        public string TimeZoneID { get; set; }
        
        /// <summary>
        /// Member avatar unique identifier.
        /// </summary>
        [DataMember]
        public string Avatar { get; set; }
        
        /// <summary>
        /// Current status. Will be removed in the future.
        /// </summary>
        public int IsEnable { get; set; }
        
        /// <summary>
        ///  Built-in flag.
        /// </summary>
        [DataMember]
        public bool IsBuiltIn { get; set; }

        /// <summary>
        /// Date of the last login.
        /// </summary>
        [DataMember(EmitDefaultValue = false)]
        public DateTime LastLogin { get; set; }
        
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

        private List<MemberProfileField> _ProfileFields;

        /// <summary>
        /// Member profile fields collection.
        /// </summary>
        [DataMember]
        public List<MemberProfileField> ProfileFields
        { 
            get{
                if(_ProfileFields == null)
                {
                   _ProfileFields = MemberProfileFields.GetByMember(this.MemberID);
                }

                return _ProfileFields;
            }
        }

        /// <summary>
        /// Calculates password hash via custom algorithm in order to secure short passwords.
        /// </summary>
        /// <param name="Password">Plain text password.</param>
        /// <returns>Password hash in hexadecimal format.</returns>
        public static string ComputePasswordHash(string Password)
        {
            string hash = ComputePasswordHashSHA1(Password);
            StringBuilder hashHexed = new StringBuilder();

            char[] letters = ComputePasswordHashSHA1(ComputePasswordHashMD5(Password + hash.Substring(7, 7) + hash.Substring(7, 7))).ToCharArray();
            foreach (char letter in letters)
            {
                int intval = Convert.ToInt32(letter);
                hashHexed.Append(String.Format("{0:X}", intval));
            }

            return hashHexed.ToString();
        }

        /// <summary>
        /// Calculates SHA1 Hash.
        /// </summary>
        /// <param name="Password">Plain text password.</param>
        /// <returns>Password hash in base64 format.</returns>
        public static string ComputePasswordHashSHA1(string Password)
        {
            System.Security.Cryptography.SHA1CryptoServiceProvider x = new System.Security.Cryptography.SHA1CryptoServiceProvider();
            byte[] data = System.Text.Encoding.ASCII.GetBytes(Password);

            data = x.ComputeHash(data);
            String sha1Hash = System.Convert.ToBase64String(data);

            return sha1Hash;
        }

        /// <summary>
        /// Calculates SHA1 MD5.
        /// </summary>
        /// <param name="Password">Plain text password.</param>
        /// <returns>Password hash in base64 format.</returns>
        public static string ComputePasswordHashMD5(string Password)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] data = System.Text.Encoding.ASCII.GetBytes(Password);
            
            data = x.ComputeHash(data);
            String md5Hash = System.Convert.ToBase64String(data);

            return md5Hash;               
        }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public Member()
        {
            Email = "";
        }

        /// <summary>
        /// Creates Member object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public Member(SqlDataReader dr)
        {
            this.Load(dr);
        }

        /// <summary>
        /// Updates last login time for a mmeber.
        /// </summary>
        /// <returns></returns>
        public virtual bool UpdateLoginTime()
        {
            bool result = false;
            SpRoleAdmin sp = null;

            if (this.MemberID > 0)
            {
                sp = new SpRoleAdmin(@"
                        UPDATE " + ApplicationTables.TableName(this) + @" SET 
                               LastLogin = @LastLogin
                        WHERE MemberID = @MemberID");

                sp.AddParameter("MemberID", MemberID);
                sp.AddParameter("LastLogin", DateTime.UtcNow);

                if (sp.ExecuteNonQuery() == 0)
                    result = true;
            }

            return result;

        }

        /// <summary>
        /// Updates member avatar unique identifier.
        /// </summary>
        /// <returns></returns>
        public virtual bool UpdateAvatar()
        {
            bool result = false;
            SpRoleAdmin sp = null;

            if (this.MemberID > 0)
            {
                sp = new SpRoleAdmin(@"
                        UPDATE " + ApplicationTables.TableName(this) + @" SET 
                               Avatar = @Avatar
                        WHERE MemberID = @MemberID");

                sp.AddParameter("MemberID", MemberID);
                
                if (Avatar != null && Avatar.Length > 0)
                    sp.AddParameter("Avatar", Avatar);
                else
                    sp.AddParameter("Avatar", DBNull.Value);

                if (sp.ExecuteNonQuery() == 0)
                    result = true;
            }

            return result;

        }

        /// <summary>
        /// Saves member password hash.
        /// </summary>
        /// <returns></returns>
        public virtual bool SavePassword()
        {
            bool result = false;
            SpRoleAdmin sp = null;

            if (this.MemberID > 0)
            {
                sp = new SpRoleAdmin(@"
                        UPDATE " + ApplicationTables.TableName(this) + @" SET 
                               Password = @Password
                        WHERE MemberID = @MemberID");

                sp.AddParameter("MemberID", MemberID);
                sp.AddParameter("Password", ComputePasswordHash(Password));

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
        public bool Load(IDataReader dr)
        {
            this.IsValid = false;

            this.MemberID = DBUtil.GetLongField(dr, "MemberID");
            this.Name = DBUtil.GetCharField(dr, "Name");
            this.Email = DBUtil.GetCharField(dr, "Email");
            this.Avatar = DBUtil.GetCharField(dr, "Avatar");
            this.Created = DBUtil.GetDateTimeField(dr, "Created");
            this.Modified = DBUtil.GetDateTimeField(dr, "Modified");
            this.Password = DBUtil.GetCharField(dr, "Password");
            this.IsEnable = DBUtil.GetIntField(dr, "IsEnable");
            this.IsBuiltIn = DBUtil.GetIntField(dr, "IsBuiltIn") == 1 ? true : false;
            this.LastLogin = DBUtil.GetDateTimeField(dr, "LastLogin");
            this.TimeZoneID = DBUtil.GetCharField(dr, "TimeZoneID");

            this.IsValid = true;
            return this.IsValid;
        }

        /// <summary>
        /// Updates member's time zone code.
        /// </summary>
        /// <returns>Returns true if it was successfully loaded.</returns>
        public bool UpdateTimeZone()
        {
            this.WasSaved = false;
            SpRoleAdmin sp = null;

            if (this.MemberID > 0)
            {
                sp = new SpRoleAdmin(String.Format(@"
                        UPDATE {0} SET 
                               TimeZoneID = @TimeZoneID,
                               Modified = @Modified
                        WHERE MemberID = @MemberID", Table));

                sp.AddParameter("MemberID", MemberID);

                if (TimeZoneID != null && TimeZoneID.Trim().Length > 0)
                    sp.AddParameter("TimeZoneID", TimeZoneID, System.Data.ParameterDirection.InputOutput);
                else
                    sp.AddParameter("TimeZoneID", DBNull.Value, System.Data.ParameterDirection.InputOutput,System.Data.DbType.StringFixedLength,64);
                
                sp.AddParameter("Modified", DateTime.UtcNow);
                sp.ExecuteNonQuery();
                
                sp = new SpRoleAdmin(String.Format(@"SELECT TimeZoneID FROM {0} WHERE MemberID = @MemberID", Table));
                sp.AddParameter("MemberID", MemberID);
                TimeZoneID = Convert.ToString(sp.ExecuteScalar());

                if (TimeZoneID == null)
                    TimeZoneID = "";
                
                this.WasSaved = true;

            }

            return this.WasSaved;
        }

        /// <summary>
        /// Inserts or updates an object in database according to class properties.
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
                               Name     = @Name, 
                               Email    = @Email,                               
                               TimeZoneID = @TimeZoneID,
                               Modified = @Modified
                        WHERE MemberID = @MemberID", Table));

                sp.AddParameter("MemberID", MemberID);
                sp.AddParameter("Modified", DateTime.UtcNow);
            }
            else
            {
                sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (Name, Password, TimeZoneID, Avatar, IsEnable, IsBuiltIn, LastLogin,  Email, Created, Modified) 
                               VALUES(@Name, @Password, @TimeZoneID, @Avatar, @IsEnable, @IsBuiltIn, @LastLogin,  @Email, @Created, @Modified); SELECT @MemberID = @@IDENTITY", Table));

                sp.AddParameter("MemberID", MemberID, System.Data.ParameterDirection.Output);
                sp.AddParameter("Password", ComputePasswordHash(Password));

                if (Modified != DateTime.MinValue)
                    sp.AddParameter("Modified", Created);
                else
                    sp.AddParameter("Modified", DateTime.UtcNow);
            }

            sp.AddParameter("Email", Email);
            sp.AddParameter("Name", Name);
            sp.AddParameter("IsEnable", IsEnable);
            sp.AddParameter("IsBuiltIn", IsBuiltIn ? 1 : 0);

            if (TimeZoneID != null && TimeZoneID.Trim().Length > 0)
                sp.AddParameter("TimeZoneID", TimeZoneID);
            else
                sp.AddParameter("TimeZoneID", DBNull.Value);


            if (Created != DateTime.MinValue)
                sp.AddParameter("Created", Created);
            else
                sp.AddParameter("Created", DateTime.UtcNow);


            if (LastLogin != DateTime.MinValue)
                sp.AddParameter("LastLogin", LastLogin);
            else
                sp.AddParameter("LastLogin", DBNull.Value);

            if (Avatar != null && Avatar.Length > 0)
                sp.AddParameter("Avatar", Avatar);
            else
                sp.AddParameter("Avatar", DBNull.Value);

            if (sp.ExecuteNonQuery() == 0)
                this.WasSaved = true;

            if (this.MemberID <= 0)
            {

                switch (DbRoleAdmin.CurrentProvider)
                {
                    case DatabaseProvider.MSSQLServer:
                        {
                            MemberID = (long)sp.GetParameter("MemberID");
                            break;
                        }
                    case DatabaseProvider.MySQLServer:
                        {
                            MySqlCommand cm = (MySqlCommand)sp.SqlCommand;

                            if (cm.LastInsertedId > 0)
                                MemberID = Convert.ToInt64(cm.LastInsertedId);

                            break;
                        }
                }
                
            }

            return this.WasSaved = true;
        }

        /// <summary>
        /// Deletes an object from the database.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool Delete()
        {
            this.WasDeleted = false;
            if (HttpContext.Current != null)
            {
                if (Avatar != null && Avatar.Length > 0)
                {
                    string Path = String.Format("{0}/{1}.jpg", HttpContext.Current.Server.MapPath("~/Avatar"), Avatar);
                    if (System.IO.File.Exists(Path))
                    {
                        System.IO.File.Delete(Path);
                    }
                }
            }

            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
            DELETE FROM MemberRoles WHERE MemberID = @MemberID; 
            DELETE FROM MemberTokens WHERE MemberID = @MemberID; 
            DELETE FROM MemberAttempts WHERE MemberID = @MemberID; 
            DELETE FROM MemberProfileFields WHERE MemberID = @MemberID;
            DELETE FROM MemberSocialNetworks WHERE MemberID = @MemberID;
            DELETE FROM MemberDomains WHERE MemberID = @MemberID;
            DELETE FROM {0} WHERE MemberID = @MemberID", Table));
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

    }
}
