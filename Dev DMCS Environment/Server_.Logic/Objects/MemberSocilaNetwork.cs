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
    public partial class MemberSocialNetwork : ApplicationObject, IApplicationObject
    { 
        
    }

    /// <summary>
    /// Provides a wrapper on single row in the MemberSocialNetworks database table. The properties of this class mapped on appropriate database fields and methods provide saving and loading into/from database.
    /// An instance of this class can be created by new word or loaded from the database using MemberSocialNetworks class which returns collection of MemberSocialNetwork objects by different condition.
    /// </summary>    
    public partial class MemberSocialNetwork : ApplicationObject, IApplicationObject
    {
        /// <summary>
        /// Unique item identifier in the database.
        /// </summary>
        public long MemberSocialNetworkID { get; set; }

        /// <summary>
        /// Member unique identifier in the database.
        /// </summary>        
        public long MemberID { get; set; }

        /// <summary>
        /// Social network unique identifier. 1 - Facebook, 2 - Twitter 
        /// </summary>
        public int SocialNetworkID { get; set; }

        /// <summary>
        /// Unique user identifier in the a social network.
        /// </summary>
        public string SocialNetworkUserID { get; set; } 

        /// <summary>
        /// User email for the a social network login.
        /// </summary>
        public string SocialNetworkUserEmail { get; set; }

        /// <summary>
        /// User name for the a social network login.
        /// </summary>        
        public string SocialNetworkUserName { get; set; }

        /// <summary>
        /// User access token  for the a social network login.
        /// </summary>        
        public string AccessToken { get; set; } 

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberSocialNetwork()
        {

        }

        /// <summary>
        /// Creates MemberSocialNetwork object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public MemberSocialNetwork(IDataReader dr)
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
            bool result = false;

            this.MemberSocialNetworkID    = DBUtil.GetLongField(dr, "MemberSocialNetworkID");
            this.MemberID  = DBUtil.GetLongField(dr, "MemberID");
            this.SocialNetworkID = DBUtil.GetIntField(dr, "SocialNetworkID");
            this.SocialNetworkUserID = DBUtil.GetCharField(dr, "SocialNetworkUserID");
            this.SocialNetworkUserEmail = DBUtil.GetCharField(dr, "SocialNetworkUserEmail");
            this.SocialNetworkUserName = DBUtil.GetCharField(dr, "SocialNetworkUserName");
            this.AccessToken = DBUtil.GetCharField(dr, "AccessToken");

            return result;
        }

        /// <summary>
        /// Inserts an object in database according to class properties.
        /// </summary>
        /// <returns>Returns true if it was successfully saved.</returns>            
        public virtual bool Save()
        {
            this.WasSaved = false;
            SpRoleAdmin sp = null;

             switch (DbRoleAdmin.CurrentProvider)
             {
                 case DatabaseProvider.MSSQLServer:
                 {
                     sp = new SpRoleAdmin(String.Format(@"
                        IF NOT EXISTS( SELECT * FROM {0} WHERE MemberID=@MemberID AND SocialNetworkUserID=@SocialNetworkUserID AND SocialNetworkID = @SocialNetworkID )
                        BEGIN 
                        INSERT INTO {0} (MemberID, SocialNetworkID, SocialNetworkUserID, SocialNetworkUserEmail, SocialNetworkUserName, AccessToken) 
                               VALUES(@MemberID, @SocialNetworkID, @SocialNetworkUserID, @SocialNetworkUserEmail, @SocialNetworkUserName, @AccessToken);
                        END", Table));
                     break;
                 }
                 case DatabaseProvider.MySQLServer:
                 {
                     sp = new SpRoleAdmin(String.Format(@"
                        INSERT INTO {0} (MemberID, SocialNetworkID ,SocialNetworkUserID, SocialNetworkUserEmail, SocialNetworkUserName, AccessToken) 
                               SELECT  @MemberID, @SocialNetworkID ,@SocialNetworkUserID, @SocialNetworkUserEmail, @SocialNetworkUserName, @AccessToken FROM DUAL WHERE NOT EXISTS( SELECT * FROM {0} WHERE MemberID=@MemberID AND SocialNetworkUserID=@SocialNetworkUserID AND SocialNetworkID = @SocialNetworkID ) LIMIT 1",
                        Table));
                     break;
                 }
             }


             sp.AddParameter("SocialNetworkID", SocialNetworkID);
             sp.AddParameter("MemberSocialNetworkID", MemberSocialNetworkID);
             sp.AddParameter("MemberID", MemberID);
             sp.AddParameter("SocialNetworkUserID", SocialNetworkUserID);
             sp.AddParameter("SocialNetworkUserName", SocialNetworkUserName);
             sp.AddParameter("AccessToken", AccessToken);
            
            if(SocialNetworkUserEmail != null)
                sp.AddParameter("SocialNetworkUserEmail", SocialNetworkUserEmail);
            else
                sp.AddParameter("SocialNetworkUserEmail", DBNull.Value);

             if (sp.ExecuteNonQuery() == 0)
                 this.WasSaved = true;

             return this.WasSaved;
        }

        /// <summary>
        /// Deletes an object from the database.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool Delete()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE MemberID= @MemberID AND MemberSocialNetworkID=@MemberSocialNetworkID",Table));
            sp.AddParameter("MemberSocialNetworkID", MemberSocialNetworkID);
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

        /// <summary>
        /// Deletes all roles from the database which are connected with specific member.
        /// </summary>
        /// <returns>Returns true if it was successfully deleted.</returns>
        public virtual bool DeleteAll()
        {
            this.WasDeleted = false;

            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0} WHERE MemberID=@MemberID", Table));
            sp.AddParameter("MemberID", MemberID);

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

            return this.WasDeleted;
        }

        /// <summary>
        /// Updates access token.
        /// </summary>
        public virtual void UpdateAccessToken()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("UPDATE {0} SET AccessToken = @AccessToken WHERE MemberID=@MemberID AND SocialNetworkID=@SocialNetworkID AND SocialNetworkUserID = @SocialNetworkUserID", Table));
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("SocialNetworkID", SocialNetworkID);
            sp.AddParameter("SocialNetworkUserID", SocialNetworkUserID);
            sp.AddParameter("AccessToken", AccessToken); 

            if (sp.ExecuteNonQuery() == 0)
                this.WasDeleted = true;

        }
    }
}
