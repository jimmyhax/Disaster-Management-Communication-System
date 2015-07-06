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
    /// Provides the fields to create the complex searching condition. 
    /// </summary>
    public class RoleListFilter
    {
        /// <summary>
        /// Items per page number
        /// </summary>
        public int ItemsPerPage { get; set; }
        
        /// <summary>
        /// Sorting column name.
        /// </summary>
        public string SortColumnName { get; set; }

        /// <summary>
        /// Sorting column number.
        /// </summary>
        public int SortColumn { get; set; }

        /// <summary>
        /// Order direction.
        /// </summary>
        public bool SortOrderAsc { get; set; }

        /// <summary>
        /// Current page number.
        /// </summary>
        public int CurrentPage { get; set; }
    }
    
    /// <summary>
    /// It provides a possibility to get an instance or instance collection of Role objects.
    /// </summary>
    public class Roles : ApplicationCollection<Role, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets all instances of Member object from the database.
        /// </summary>
        /// <returns>List of Role instances.</returns>
        public static List<Role> Get()
        {            
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT *, (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = RoleID) MemberCount FROM {0} ORDER BY NAME",Table));
            return GetApplicationCollection(sp);            
        }

        /// <summary>
        /// Gets an instance of Role object by unique identifier.
        /// </summary>
        /// <param name="RoleID">Role unique identifier.</param>
        /// <returns>Insatnce of Role object.</returns>
        public static Role GetBy(long RoleID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT *, (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = RoleID) MemberCount FROM {0} WHERE RoleID = @RoleID", Table));
            sp.AddParameter("RoleID", RoleID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets member count for specific role.
        /// </summary>
        /// <param name="RoleID">Role unique identifie.</param>
        /// <returns>Member count number.</returns>
        public static int GetMemberCount(long RoleID)
        {
            int MemberCount = 0;
            SpRoleAdmin sp = new SpRoleAdmin("SELECT @MemberCount = COUNT(MemberID) FROM MemberRoles WHERE RoleID = @RoleID");
            
            sp.AddParameter("MemberCount", MemberCount, System.Data.ParameterDirection.Output);
            sp.AddParameter("RoleID", RoleID);
            
            sp.ExecuteNonQuery();
            MemberCount = (int)sp.GetParameter("MemberCount");
            return MemberCount;
        }

        /// <summary>
        /// Gets member count by role name.
        /// </summary>
        /// <param name="Name">Role name.</param>
        /// <returns>Insatnce of Role object.</returns>
        public static Role GetBy(String Name)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT *, (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = RoleID) MemberCount FROM {0} WHERE UPPER(Name) = @Name",Table));
            sp.AddParameter("Name", Name.ToUpper());
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Return collection of Role objects by a filter.
        /// </summary>
        /// <param name="Filter">The RoleListFilter includes: 
        /// ItemsPerPage - items number per page;
        /// SortColumnName - sorting column name;
        /// SortColumn - sorting column number;
        /// SortOrderAsc - sorting condition;
        /// CurrentPage - current page which calculated by total items and items per page;
        /// </param>
        /// <param name="TotalItems">It will contain total item number after method execution.</param>
        /// <returns>Total item number</returns>
        public static List<Role> Get(RoleListFilter Filter, out int TotalItems)
        {
            TotalItems = 0;
            String SortOrder = Filter.SortOrderAsc ? " ASC" : " DESC";

            SpRoleAdmin sp = null;
            
            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                {
                    sp = new SpRoleAdmin(String.Format(@"SELECT RoleID,	Name, IsBuiltIn, BackColor,	ForeColor, Settings, Created, Modified, MemberCount FROM
                          (
                            SELECT RowNum = ROW_NUMBER() OVER (ORDER BY {1} {2} ), * FROM
                              (
                                 SELECT * , (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = {0}.RoleID) as MemberCount  FROM {0} 
                              ) AS b 
                          ) AS a
		                        WHERE RowNum > (@ItemsPerPage * (@CurrentPageNumber - 1)) AND 
			                          RowNum <= (@ItemsPerPage * (@CurrentPageNumber - 1)) + @ItemsPerPage
                        ORDER BY {1} {2}
		           SELECT @TotalItems = COUNT(RoleID)
			            FROM  {0}",
                        Table,
                        Filter.SortColumnName,
                        SortOrder));
                        break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    sp = new SpRoleAdmin(String.Format(@"SELECT RoleID,	Name, IsBuiltIn, BackColor,	ForeColor, Settings, Created, Modified, MemberCount, RowNum FROM
                          (
                           SELECT RoleID, Name, IsBuiltIn, BackColor, ForeColor, Settings, Created, Modified, (SELECT COUNT(RoleID) FROM MemberRoles t WHERE t.RoleID = a.RoleID) AS MemberCount, (@row := @row + 1) AS RowNum
                                FROM {0} a
                            JOIN (SELECT @row := 0) b 
                                ORDER BY {1} {2}
                          ) AS c 
		                        WHERE c.RowNum > (@ItemsPerPage * (@CurrentPageNumber - 1)) AND 
			                          c.RowNum <= (@ItemsPerPage * (@CurrentPageNumber - 1)) + @ItemsPerPage
                        ORDER BY {1} {2};",
                        Table,
                        Filter.SortColumnName,
                        SortOrder));
                        break;
                }
            }
            
            sp.AddParameter("ItemsPerPage", Filter.ItemsPerPage);
            sp.AddParameter("CurrentPageNumber", Filter.CurrentPage);
            sp.AddParameter("TotalItems", TotalItems, System.Data.ParameterDirection.Output);

            List<Role> Roles = GetApplicationCollection(sp);

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                    TotalItems = (int)sp.GetParameter("TotalItems");
                    break;
                case DatabaseProvider.MySQLServer:
                    TotalItems = Convert.ToInt32((new SpRoleAdmin(String.Format(@"SELECT COUNT(*) AS TotalItems FROM {0}", Table)).ExecuteScalar()));
                    break;
            }

            if (TotalItems == 0 && Filter.CurrentPage > 1)
            {
                Filter.CurrentPage--;
                Roles = Get(Filter, out TotalItems);
            }            
            else if (TotalItems > 0 && TotalItems < (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = (TotalItems <= Filter.ItemsPerPage) ? 1 : (TotalItems / Filter.ItemsPerPage);                
                Roles = Get(Filter, out TotalItems);
            }
            else if (TotalItems > 0 && TotalItems == (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = 1;
                Roles = Get(Filter, out TotalItems);
            }

            return Roles;
        }

        /// <summary>
        /// Return collection of Role object for specific member.
        /// </summary>
        /// <param name="MemberID">Member role unique identifie</param>
        /// <returns>List of Role instances.</returns>
        public static List<Role> GetByMember(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT *, (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = RoleID) MemberCount FROM {0} WHERE RoleID IN (SELECT RoleID FROM MemberRoles WHERE MemberID=@MemberID) ORDER BY Name",Table));
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Return collection of Role object which specific member doesn't have.
        /// </summary>
        /// <param name="MemberID">Member unique identifie.</param>
        /// <returns>List of Role instances.</returns>
        public static List<Role> GetByMemberNotIn(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT *, (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = RoleID) MemberCount FROM {0} WHERE RoleID NOT IN (SELECT RoleID FROM MemberRoles WHERE MemberID=@MemberID) ORDER BY Name",Table));
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Return collection of Role object for specific member and key word in description.
        /// </summary>
        /// <param name="MemberID">Member unique identifie.</param>
        /// <param name="Keyword">Keyword in the description.</param>
        /// <returns>List of Role instances.</returns>
        public static List<Role> GetByMemberKeyWordInDescription(long MemberID, String Keyword)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT *, (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = RoleID) MemberCount FROM {0} WHERE RoleID IN (SELECT RoleID FROM MemberRoles WHERE MemberID=@MemberID) AND CHARINDEX(@Keyword,Settings) > 0 ORDER BY Name", Table));
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("Keyword", Keyword);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets collection of field Roles in the database.
        /// </summary>
        /// <returns>List of Role object insatnces.</returns>
        public static List<Role> GetFieldID(int ProfilFieldID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT *, (SELECT COUNT(MemberID) FROM MemberRoles WHERE MemberRoles.RoleID = t1.RoleID) MemberCount FROM {0} t1
                        INNER JOIN RoleProfileFields t2 ON t2.RoleID = t1.RoleID AND t2.ProfileFieldID = @ProfileFieldID
            ", Table));

            sp.AddParameter("ProfileFieldID", ProfilFieldID);

            return GetApplicationCollection(sp);
        }
    }
}
