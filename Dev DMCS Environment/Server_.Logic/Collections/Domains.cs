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
    public class DomainListFilter
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
    /// Provides the possibility to get single insatnce of Domain object or collection of Domain object instances.
    /// </summary>
    public class Domains : ApplicationCollection<Domain, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets Domain object insatnce by unique identifier
        /// </summary>
        /// <param name="DomainID"></param>
        /// <returns>Insatnce of Domain object.</returns>
        public static Domain GetBy(long DomainID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE DomainID = @DomainID",Table));
            sp.AddParameter("DomainID", DomainID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets Domain object insatnce by name
        /// </summary>
        /// <param name="Name"></param>
        /// <returns>Insatnce of Domain object.</returns>
        public static Domain GetByName(String Name)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE Name = @Name", Table));
            sp.AddParameter("Name", Name);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets collection of all Domains in the database.
        /// </summary>
        /// <returns>List of Domain object insatnces.</returns>
        public static List<Domain> Get()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0}",Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets collection of field Domains in the database.
        /// </summary>
        /// <returns>List of Domain object insatnces.</returns>
        public static List<Domain> GetFieldID(int ProfilFieldID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0} t1
                        INNER JOIN DomainProfileFields t2 ON t2.DomainID = t1.DomainID AND t2.ProfileFieldID = @ProfileFieldID
            ", Table));

            sp.AddParameter("ProfileFieldID", ProfilFieldID);
            
            return GetApplicationCollection(sp);
        }


        /// <summary>
        /// Return collection of Domain objects by a filter.
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
        public static List<Domain> Get(DomainListFilter Filter, out int TotalItems)
        {
            TotalItems = 0;
            String SortOrder = Filter.SortOrderAsc ? " ASC" : " DESC";

            SpRoleAdmin sp = null;

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                    {
                        sp = new SpRoleAdmin(String.Format(@"SELECT DomainID, Name, Description, Created, Modified  FROM
                          (
                            SELECT RowNum = ROW_NUMBER() OVER (ORDER BY {1} {2} ), * FROM
                              (
                                 SELECT *  FROM {0} 
                              ) AS b 
                          ) AS a
		                        WHERE RowNum > (@ItemsPerPage * (@CurrentPageNumber - 1)) AND 
			                          RowNum <= (@ItemsPerPage * (@CurrentPageNumber - 1)) + @ItemsPerPage
                        ORDER BY {1} {2}
		           SELECT @TotalItems = COUNT(DomainID)
			            FROM  {0}",
                            Table,
                            Filter.SortColumnName,
                            SortOrder));
                        break;
                    }
                case DatabaseProvider.MySQLServer:
                    {
                        sp = new SpRoleAdmin(String.Format(@"SELECT DomainID, Name, Description, Created, Modified, RowNum FROM
                          (
                           SELECT  DomainID, Name, Description, Created, Modified, (@row := @row + 1) AS RowNum
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

            List<Domain> Domains = GetApplicationCollection(sp);

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
                Domains = Get(Filter, out TotalItems);
            }
            else if (TotalItems > 0 && TotalItems < (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = (TotalItems <= Filter.ItemsPerPage) ? 1 : (TotalItems / Filter.ItemsPerPage);
                Domains = Get(Filter, out TotalItems);
            }
            else if (TotalItems > 0 && TotalItems == (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = 1;
                Domains = Get(Filter, out TotalItems);
            }

            return Domains;
        }


        /// <summary>
        /// Gets collection of field Domains in the database.
        /// </summary>
        /// <returns>List of Domain object insatnces.</returns>
        public static List<Domain> GetByMember(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"SELECT * FROM {0} t1
                        INNER JOIN MemberDomains t2 ON t2.DomainID = t1.DomainID AND t2.MemberID = @MemberID
            ", Table));

            sp.AddParameter("MemberID", MemberID);
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Gets collection of all MemberDomain in the database.
        /// </summary>
        /// <returns>List of language object insatnces.</returns>
        public static Domain GetByMember(long MemberID, String DomainName)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format(@"
                        SELECT * FROM {0} t1
                        INNER JOIN MemberDomains t2 ON t2.DomainID = t1.DomainID AND t2.MemberID = @MemberID
                            WHERE LOWER(Name) = LOWER(@DomainName)", Table));
            
            sp.AddParameter("MemberID", MemberID);
            sp.AddParameter("DomainName", DomainName);

            return GetApplicationObject(sp);
        }
    }
}
