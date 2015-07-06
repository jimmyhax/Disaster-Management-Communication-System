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
    /// Provides the possibility to get an instance or instance collection of ProfileFieldGroup objects.
    /// </summary>
    public class ProfileFieldGroups : ApplicationCollection<ProfileFieldGroup, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets instance of ProfileFieldGroup object by unique identifier.
        /// </summary>
        /// <param name="FieldGroupID">FieldGroup unique identifier.</param>
        /// <returns>Instance of ProfileFieldGroup object.</returns>
        public static ProfileFieldGroup GetBy(int FieldGroupID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE FieldGroupID = @FieldGroupID", Table));
            sp.AddParameter("FieldGroupID", FieldGroupID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets list of MemberProfileField object instances by group name.
        /// </summary>
        /// <param name="FieldGroupName">Group name.</param>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static ProfileFieldGroup GetByName(String FieldGroupName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE FieldGroupName = @FieldGroupName", Table));
            sp.AddParameter("FieldGroupName", FieldGroupName);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets the list of all ProfileFieldGroup object instances.
        /// </summary>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static List<ProfileFieldGroup> GetAll()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} ORDER BY OrderID,FieldGroupID", Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets the list of all active ProfileFieldGroup object instances.
        /// </summary>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static List<ProfileFieldGroup> GetAllActive()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE IsActive=1 ORDER BY OrderID,FieldGroupID", Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets the list of all active non admin ProfileFieldGroup object instances.
        /// </summary>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static List<ProfileFieldGroup> GetAllActiveNonAdminByDomainRoleMember(long MemberID, String DomainName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                 SELECT * FROM {0} t1 
                                WHERE IsActive=1 AND (AdminUseOnly = 0 OR AdminUseOnly IS NULL) AND (SELECT COUNT(*) FROM ProfileFields t2  WHERE t1.FieldGroupID = t2.FieldGroupID AND t2.IsActive=1 AND (t2.AdminUseOnly = 0 OR t2.AdminUseOnly IS NULL)) > 0 AND
                           FieldGroupID IN (
                              SELECT DISTINCT FieldGroupID FROM ProfileFields WHERE FieldID
	                                IN(	
                                        SELECT FieldID FROM 
                                            (
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
                                                       INNER JOIN Domains t6 ON t6.DomainID = t5.DomainID AND t6.Name = @DomainName
                                                       INNER JOIN MemberDomains t7 ON t7.DomainID = t6.DomainID AND t7.MemberID = @MemberID
                                                 UNION
                                                 SELECT t3.FieldID FROM ProfileFields t3   
								                       LEFT JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID
								                       LEFT  JOIN Domains t6 ON t6.DomainID = t5.DomainID
								                       WHERE t6.Name IS NULL
                                        )
                                )
                             ) ORDER BY OrderID,FieldGroupID
            ", Table));
            
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("DomainName", DomainName);
            return GetApplicationCollection(sp);
        }


        /// <summary>
        /// Updates the order of field according comma separated string param.
        /// </summary>
        /// <param name="Order">Comma separated unique identifiers.</param>
        public static void UpdateOrder(string Order)
        {
            string[] IDs = Order.Split(new string[] {","}, StringSplitOptions.RemoveEmptyEntries);
            string Statement = "";


            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                {
                    Statement = "BEGIN TRAN\r\n";
                    foreach (String ID in IDs)
                    {
                        Statement += String.Format("Update {0} SET OrderID=@OrderID{1} WHERE FieldGroupID=@FieldGroupID{1}\r\n", Table, int.Parse(ID));
                    }
                    Statement += "COMMIT TRAN";
                    break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    Statement = "START TRANSACTION;\r\n";
                    foreach (String ID in IDs)
                    {
                        Statement += String.Format("Update {0} SET OrderID=@OrderID{1} WHERE FieldGroupID=@FieldGroupID{1};\r\n", Table, int.Parse(ID));
                    }
                    Statement += "COMMIT;";
                    break;
                }
            }


            SpRoleAdmin sp = new SpRoleAdmin(Statement);
            int Counter = 1;
            
            foreach (String ID in IDs)
            {
                sp.AddParameter(String.Format("FieldGroupID{0}", int.Parse(ID)), int.Parse(ID));
                sp.AddParameter(String.Format("OrderID{0}", int.Parse(ID)), Counter++);
            }

            sp.ExecuteNonQuery();
        }

        /// <summary>
        /// Gets the list of all ProfileFieldGroup object instances by domain.
        /// </summary>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static List<ProfileFieldGroup> GetAllByDomain(string DomainName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
            SELECT * FROM {0} WHERE FieldGroupID IN(
                SELECT DISTINCT FieldGroupID FROM  ProfileFields WHERE FieldID
	                IN(	
		                SELECT ProfileFieldID FROM  DomainProfileFields WHERE DomainID 
		                IN(
			                SELECT DomainID FROM  Domains where Name = @DomainName
		                  )
	                )
                ) ORDER BY OrderID
            ", Table));
            sp.AddParameter("DomainName", DomainName);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets the list of all ProfileFieldGroup object instances by role name.
        /// </summary>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static List<ProfileFieldGroup> GetAllByRole(string RoleName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
            SELECT * FROM ProfileFieldGroups WHERE FieldGroupID IN(
            SELECT DISTINCT FieldGroupID FROM  ProfileFields WHERE FieldID
	            IN(	
		            SELECT ProfileFieldID FROM RoleProfileFields WHERE RoleID 
		            IN(
			            SELECT RoleID FROM Roles where Name = @RoleName
		              )
	            )

            ) ORDER BY OrderID", Table));
            sp.AddParameter("RoleName", RoleName);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets the list of all ProfileFieldGroup object instances by domain.
        /// </summary>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static List<ProfileFieldGroup> GetAllActiveNonAdminByDomain(string DomainName, String RoleName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
            SELECT * FROM {0} t1 
                WHERE IsActive=1 AND (AdminUseOnly = 0 OR AdminUseOnly IS NULL) AND (SELECT COUNT(*) FROM ProfileFields t2  WHERE t1.FieldGroupID = t2.FieldGroupID AND t2.IsActive=1 AND (t2.AdminUseOnly = 0 OR t2.AdminUseOnly IS NULL)) > 0 AND
           FieldGroupID IN (
                SELECT DISTINCT FieldGroupID FROM  ProfileFields WHERE FieldID
	                IN(	

                        SELECT FieldID FROM 
                         (
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
                                      INNER JOIN Domains t6 ON t6.DomainID = t5.DomainID AND t6.Name = @DomainName
                                UNION
                                SELECT t3.FieldID FROM ProfileFields t3   
						              LEFT JOIN DomainProfileFields t5 ON t5.ProfileFieldID = t3.FieldID
						              LEFT  JOIN Domains t6 ON t6.DomainID = t5.DomainID
						              WHERE t6.Name IS NULL
                        )
                    )
            ) ORDER BY OrderID,FieldGroupID
            ", Table));
            sp.AddParameter("DomainName", DomainName);
            sp.AddParameter("RoleName", RoleName);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets the list of all ProfileFieldGroup object instances.
        /// </summary>
        /// <returns>List of ProfileFieldGroup instances.</returns>
        public static List<ProfileFieldGroup> GetFilteredByDomainRoles(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0} 
                WHERE FieldGroupID IN (
                SELECT DISTINCT FieldGroupID FROM ProfileFields WHERE FieldID
	                IN(	
                        SELECT FieldID FROM 
                            (
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
                )
             ) ORDER BY OrderID, FieldGroupID ", Table));

            sp.AddParameter("MemberID", MemberID);
            
            return GetApplicationCollection(sp);
        }
    }
}
