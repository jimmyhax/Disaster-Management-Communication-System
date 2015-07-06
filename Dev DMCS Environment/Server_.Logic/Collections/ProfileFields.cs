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
    /// Provides the possibility to get an instance or instance collection of ProfileField objects.
    /// </summary>
    public class ProfileFields : ApplicationCollection<ProfileField, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets instance of ProfileField object by unique identifier.
        /// </summary>
        /// <param name="FieldID">Field unique identifier.</param>
        /// <returns>Instance of ProfileField object.</returns>
        public static ProfileField GetBy(int FieldID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE FieldID = @FieldID", Table));
            sp.AddParameter("FieldID", FieldID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object which are available for sign-up process.
        /// </summary>
        /// <returns>List of ProfileField instances</returns>
        public static List<ProfileField> GetSignUp()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE ShowInSignUp = 1  ORDER BY OrderID,FieldID", Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object which are available for sign-up process by group.
        /// </summary>
        /// <param name="FieldGroupName">Field group name.</param>
        /// <returns>List of ProfileField instances</returns>
        public static List<ProfileField> GetSignUpActiveNonAdminByGroup(string FieldGroupName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                        SELECT * FROM {0} t1 
                            INNER JOIN ProfileFieldGroups t2 ON t1.FieldGroupID = t2.FieldGroupID AND LOWER(t2.FieldGroupName) = LOWER(@FieldGroupName)
                            WHERE t1.ShowInSignUp = 1 AND t1.IsActive = 1  AND (t1.AdminUseOnly = 0 OR t1.AdminUseOnly IS NULL)  ORDER BY t1.OrderID, t1.FieldID", Table));
            sp.AddParameter("FieldGroupName", FieldGroupName.Trim());            
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object by group name.
        /// </summary>
        /// <param name="FieldGroupName">Field group name.</param>
        /// <returns>List of ProfileField instances.</returns>
        public static List<ProfileField> GetByGroupName(string FieldGroupName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                        SELECT * FROM {0} t1 
                            INNER JOIN ProfileFieldGroups t2 ON t1.FieldGroupID = t2.FieldGroupID AND LOWER(t2.FieldGroupName) = LOWER(@FieldGroupName)
                                ORDER BY t1.OrderID, t1.FieldID", Table));
            sp.AddParameter("FieldGroupName", FieldGroupName.Trim());
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object by group unique identifier.
        /// </summary>
        /// <param name="FieldGroupID">Field group unique identifier.</param>
        /// <returns>List of ProfileField instances</returns>
        public static List<ProfileField> GetByGroupID(int FieldGroupID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                        SELECT * FROM {0} t1 
                            INNER JOIN ProfileFieldGroups t2 ON t1.FieldGroupID = t2.FieldGroupID AND t2.FieldGroupID = @FieldGroupID
                                ORDER BY t1.OrderID, t1.FieldID, t1.FieldName", Table));
            sp.AddParameter("FieldGroupID", FieldGroupID);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object by group unique identifier and domain name.
        /// </summary>
        /// <param name="FieldGroupID">Field group unique identifier.</param>
        /// <param name="DomainName">DomainName.</param>
        /// <returns>List of ProfileField instances</returns>
        public static List<ProfileField> GetByDomainGroupID(String DomainName, int FieldGroupID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                        SELECT * FROM {0} t1 
                            INNER JOIN ProfileFieldGroups t2 ON t1.FieldGroupID = t2.FieldGroupID AND t2.FieldGroupID = @FieldGroupID
                                WHERE FieldID IN
                                 ( 
                                    SELECT ProfileFieldID FROM  DomainProfileFields WHERE DomainID 
		                            IN(
			                            SELECT DomainID FROM  Domains where Name = @DomainName
		                              )
                                  )
                        ORDER BY t1.OrderID, t1.FieldID, t1.FieldName", Table));
            sp.AddParameter("FieldGroupID", FieldGroupID);
            sp.AddParameter("DomainName", DomainName);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object by group unique identifier and role name.
        /// </summary>
        /// <param name="RoleName">Role name.</param>
        /// <param name="FieldGroupID">Field group unique identifier</param>
        /// <returns>List of ProfileField instances</returns>
        public static List<ProfileField> GetByRoleGroupID(String RoleName, int FieldGroupID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                        SELECT * FROM {0} t1 
                            INNER JOIN ProfileFieldGroups t2 ON t1.FieldGroupID = t2.FieldGroupID AND t2.FieldGroupID = @FieldGroupID
                                WHERE FieldID IN
                                 ( 
                                     SELECT ProfileFieldID FROM RoleProfileFields WHERE RoleID 
		                              IN(
			                             SELECT RoleID FROM Roles where Name = @RoleName
		                             )                                   
                                  )
                        ORDER BY t1.OrderID, t1.FieldID, t1.FieldName", Table));
            sp.AddParameter("FieldGroupID", FieldGroupID);
            sp.AddParameter("RoleName", RoleName);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object by group unique identifier, member unique identifier, domain name.
        /// </summary>
        /// <param name="MemberID">Member unique identifier</param>
        /// <param name="DomainName">Domain name</param>
        /// <param name="FieldGroupID">Group unique identifier</param>
        /// <returns></returns>
        public static List<ProfileField> GetByDomainRoleGroupID( long MemberID, string DomainName, int FieldGroupID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                SELECT * FROM {0} WHERE FieldID IN (
                SELECT FieldID FROM (
            		      SELECT t3.FieldID FROM ProfileFields t3 
                                INNER JOIN RoleProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                INNER JOIN Roles t6 ON t6.RoleID = t5.RoleID
                                INNER JOIN MemberRoles t7 ON t7.RoleID = t6.RoleID AND t7.MemberID = @MemberID
                          UNION
                          SELECT t3.FieldID FROM ProfileFields t3   
                                LEFT JOIN RoleProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                LEFT JOIN Roles t6 ON t6.RoleID = t5.RoleID
								WHERE t6.Name IS NULL
				) a WHERE FieldID IN(

                          SELECT t3.FieldID FROM ProfileFields t3 
                                INNER JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                INNER JOIN Domains t6 ON t6.DomainID = t5.DomainID AND LOWER(t6.Name) = LOWER(@DomainName)
                                INNER JOIN MemberDomains t7 ON t7.DomainID = t6.DomainID AND t7.MemberID = @MemberID
                          UNION
                          SELECT t3.FieldID FROM ProfileFields t3   
								LEFT JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID
								LEFT  JOIN Domains t6 ON t6.DomainID = t5.DomainID
								WHERE t6.Name IS NULL
               )
            ) AND FieldGroupID = @FieldGroupID 
                    ORDER BY OrderID, FieldGroupID", Table));
            sp.AddParameter("FieldGroupID", FieldGroupID);
            sp.AddParameter("DomainName", DomainName);
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets the list of all profile fields in the database.
        /// </summary>
        /// <returns>List of all profile fields.</returns>
        public static List<ProfileField> GetAll()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} ORDER BY OrderID,FieldID", Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets profile field by field name.
        /// </summary>
        /// <param name="FieldName">Profile field name.</param>
        /// <returns></returns>
        public static ProfileField GetByName(String FieldName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE LOWER(FieldName) = @FieldName", Table));
            sp.AddParameter("FieldName", FieldName.Trim().ToLower());
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Updates the order of field groups according comma separated string param.
        /// </summary>
        /// <param name="Order">Comma separated unique identifiers.</param>
        /// <param name="GroupID">Target group unique identifier</param>
        public static void UpdateOrder(string Order, int GroupID)
        {
            string[] IDs = Order.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            
            
            string Statement = "";

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                {
                    Statement = "BEGIN TRAN\r\n";
                    foreach (String ID in IDs)
                    {
                        Statement += String.Format("Update {0} SET OrderID=@OrderID{1}, FieldGroupID = @FieldGroupID WHERE FieldID=@FieldID{1}\r\n", Table, int.Parse(ID));
                    }
                    Statement += "COMMIT TRAN";
                    
                    break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    Statement = "START TRANSACTION;\r\n";
                    foreach (String ID in IDs)
                    {
                        Statement += String.Format("Update {0} SET OrderID=@OrderID{1}, FieldGroupID = @FieldGroupID WHERE FieldID=@FieldID{1};\r\n", Table, int.Parse(ID));
                    }
                    Statement += "COMMIT;";
                    break;
                }
            }

            SpRoleAdmin sp = new SpRoleAdmin(Statement);
            int Counter = 1;

            foreach (String ID in IDs)
            {
                sp.AddParameter(String.Format("FieldID{0}", int.Parse(ID)), int.Parse(ID));
                sp.AddParameter(String.Format("OrderID{0}", int.Parse(ID)), Counter++);
            }

            sp.AddParameter("FieldGroupID", GroupID);
            sp.ExecuteNonQuery();
        }


        /// <summary>
        /// Returns the collection of profile fields which are attached to specific domain.
        /// </summary>
        /// <param name="DomainID">Domain ID.</param>
        /// <returns>Collection of profile fields</returns>
        public static List<ProfileField> GetByDomain(int DomainID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0} t1
                        INNER JOIN DomainProfileFields t2 ON t2.ProfileFieldID = t1.FieldID
                        WHERE t2.DomainID = @DomainID
            ", Table));

            sp.AddParameter("DomainID", DomainID);

            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Returns the collection of profile fields which are attached to specific role.
        /// </summary>
        /// <param name="RoleID">Role ID.</param>
        /// <returns>Collection of profile fields</returns>
        public static List<ProfileField> GetByRole(long RoleID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0} t1
                        INNER JOIN RoleProfileFields t2 ON t2.ProfileFieldID = t1.FieldID
                        WHERE t2.RoleID= @RoleID
            ", Table));

            sp.AddParameter("RoleID", RoleID);

            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Set IsActive field flag.
        /// </summary>
        /// <param name="Flag">True or False.</param>
        /// <param name="FieldID">Profile field unique identifier.</param>
        public static void SetIsActive(bool Flag, int FieldID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("UPDATE {0} SET IsActive = @IsActive, Modified = @Modified  WHERE FieldID = @FieldID", Table));
            sp.AddParameter("FieldID", FieldID);
            sp.AddParameter("IsActive", Flag ? 1 : 0);
            sp.AddParameter("Modified", DateTime.UtcNow);
            GetApplicationObject(sp);
        }

        /// <summary>
        /// Set AdminUseOnly field flag.
        /// </summary>
        /// <param name="Flag">True or False.</param>
        /// <param name="FieldID">Profile field unique identifier.</param>
        public static void SetAdminUseOnly(bool Flag, int FieldID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("UPDATE {0} SET AdminUseOnly = @AdminUseOnly, Modified = @Modified   WHERE FieldID = @FieldID", Table));
            sp.AddParameter("FieldID", FieldID);
            sp.AddParameter("AdminUseOnly", Flag ? 1 : 0);
            sp.AddParameter("Modified", DateTime.UtcNow);
            GetApplicationObject(sp);
        }

        /// <summary>
        /// Set ShowInSignUp field flag.
        /// </summary>
        /// <param name="Flag">True or False.</param>
        /// <param name="FieldID">Profile field unique identifier.</param>
        public static void SetShowInSignUp(bool Flag, int FieldID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("UPDATE {0} SET ShowInSignUp = @ShowInSignUp, Modified = @Modified   WHERE FieldID = @FieldID", Table));
            sp.AddParameter("FieldID", FieldID);
            sp.AddParameter("ShowInSignUp", Flag ? 1 : 0);
            sp.AddParameter("Modified", DateTime.UtcNow);
            GetApplicationObject(sp);
        }


        /// <summary>
        /// Gets instance list of ProfileField object by group unique identifier.
        /// </summary>
        /// <param name="FieldGroupID">Field group unique identifier.</param>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns>List of ProfileField instances</returns>
        public static List<ProfileField> GetByRoleDomainGroupID(int FieldGroupID, long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
            SELECT * FROM {0} WHERE FieldID IN (
                SELECT FieldID FROM (
            		      SELECT t3.FieldID FROM ProfileFields t3 
                                INNER JOIN RoleProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                INNER JOIN Roles t6 ON t6.RoleID = t5.RoleID
                                INNER JOIN MemberRoles t7 ON t7.RoleID = t6.RoleID AND t7.MemberID = @MemberID
                          UNION
                          SELECT t3.FieldID FROM ProfileFields t3   
                                LEFT JOIN RoleProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                LEFT JOIN Roles t6 ON t6.RoleID = t5.RoleID
								WHERE t6.Name IS NULL
				) a WHERE FieldID IN(

                          SELECT t3.FieldID FROM ProfileFields t3 
                                INNER JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                INNER JOIN Domains t6 ON t6.DomainID = t5.DomainID
                                INNER JOIN MemberDomains t7 ON t7.DomainID = t6.DomainID AND t7.MemberID = @MemberID
                          UNION
                          SELECT t3.FieldID FROM ProfileFields t3   
								LEFT JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID
								LEFT  JOIN Domains t6 ON t6.DomainID = t5.DomainID
								WHERE t6.Name IS NULL
               )
            ) AND FieldGroupID = @FieldGroupID 
                ORDER BY OrderID, FieldGroupID", Table));
            sp.AddParameter("FieldGroupID", FieldGroupID);
            sp.AddParameter("MemberID", MemberID);
            
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets instance list of ProfileField object which are available for sign-up process by group.
        /// </summary>
        /// <param name="FieldGroupID">Field group unique identifier.</param>
        /// <param name="DomainName">Domain name.</param>
        /// <param name="RoleName">Role name.</param>
        /// <returns>List of ProfileField instances</returns>
        public static List<ProfileField> GetSignUpActiveNonAdminByDomainGroup(int FieldGroupID, String DomainName, String RoleName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"

            SELECT * FROM {0} WHERE FieldID IN (
                SELECT FieldID FROM (
            		      SELECT t3.FieldID FROM ProfileFields t3 
                                INNER JOIN RoleProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                INNER JOIN Roles t6 ON t6.RoleID = t5.RoleID AND LOWER(t6.Name) = LOWER(@RoleName)
                          UNION
                          SELECT t3.FieldID FROM ProfileFields t3   
                                LEFT JOIN RoleProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                LEFT JOIN Roles t6 ON t6.RoleID = t5.RoleID
								WHERE t6.Name IS NULL
				) a WHERE FieldID IN(

                          SELECT t3.FieldID FROM ProfileFields t3 
                                INNER JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID                            
                                INNER JOIN Domains t6 ON t6.DomainID = t5.DomainID AND LOWER(t6.Name) = LOWER(@DomainName)
                          UNION
                          SELECT t3.FieldID FROM ProfileFields t3   
								LEFT JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID
								LEFT  JOIN Domains t6 ON t6.DomainID = t5.DomainID
								WHERE t6.Name IS NULL
               )
            ) AND FieldGroupID = @FieldGroupID AND ShowInSignUp = 1 AND IsActive = 1  AND (AdminUseOnly = 0 OR AdminUseOnly IS NULL)
                ORDER BY OrderID, FieldID", Table));

            sp.AddParameter("FieldGroupID", FieldGroupID);
            sp.AddParameter("DomainName", DomainName);
            sp.AddParameter("RoleName", RoleName);

            return GetApplicationCollection(sp);
        }
    }
}
