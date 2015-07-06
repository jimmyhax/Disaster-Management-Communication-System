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
    /// Provides fields to create complex searching condition 
    /// </summary>
    public class AuditEventListFilter
    { 
        /// <summary>
        /// Items per page number.
        /// </summary>
        public int ItemsPerPage {get;set;}
        
        /// <summary>
        /// Sorting column name.
        /// </summary>
        public string SortColumnName {get;set;}
        
        /// <summary>
        /// Sorting column number.
        /// </summary>
        public int SortColumn { get; set; }
       
        /// <summary>
        /// Order direction .
        /// </summary>
        public bool SortOrderAsc {get;set;}
        
        /// <summary>
        /// Current page number.
        /// </summary>
        public int CurrentPage { get; set; }
        
        /// <summary>
        /// Set of words for searching.
        /// </summary>
        public String Search { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public AuditEventListFilter()
        {

        }
    }

    /// <summary>
    /// Provides searching join condition. 
    /// </summary>
    public enum AuditEventListFilterRoleConditon
    { 
        /// <summary>
        /// Join condition by OR.
        /// </summary>
        OR = 1,
        /// <summary>
        /// Join condition by AND.
        /// </summary>
        AND = 2
    }

    /// <summary>
    /// Provides a possibility to get an instance or instance collection of AuditEvent objects.
    /// </summary>
    public class AuditEvents : ApplicationCollection<AuditEvent, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Removes all audit event items from the database by one request. 
        /// </summary>
        public static void RemoveAll()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("DELETE FROM {0}", Table));
            GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets an instance of AuditEvent object by unique identifier.
        /// </summary>
        /// <param name="EventID">Event unique identifier</param>
        /// <returns>Insatnce of AuditEvent object.</returns>
        public static AuditEvent GetBy(long EventID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE EventID = @EventID",Table));
            sp.AddParameter("EventID", EventID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Return collection of all audit event objects in the database.
        /// </summary>
        /// <returns>List of AuditEvent objects.</returns>
        public static List<AuditEvent> Get()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0}",Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Return collection of AuditEvent objects by a filter.
        /// </summary>
        /// <param name="Filter">The AuditEventListFilter includes: 
        /// ItemsPerPage - items number per page;
        /// SortColumnName - sorting column name;
        /// SortColumn - sorting column number;
        /// SortOrderAsc - sorting condition;
        /// CurrentPage - current page which calculated by total items  and items per page;
        /// Search - Set of words for searching.
        /// </param>
        /// <param name="TotalItems">It will contain total items number after method execution</param>
        /// <returns>List of AuditEvent instances.</returns>
        public static List<AuditEvent> Get(AuditEventListFilter Filter, out int TotalItems)
        {
            if (Filter.Search != null)
                Filter.Search = Filter.Search.Trim();

            TotalItems = 0;
            String SortOrder = Filter.SortOrderAsc ? " ASC" : " DESC";

            SpRoleAdmin sp = null;

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                {
                    sp = new SpRoleAdmin(String.Format(@"SELECT * FROM
                          (
                            SELECT RowNum = ROW_NUMBER() OVER (ORDER BY {1} {2}), * 
			                        FROM {0} WHERE (@Search IS NULL OR Description LIKE @Search OR MemberEmail LIKE  @Search OR IPAddress LIKE  @Search ) 
                          ) AS a
		                        WHERE RowNum > (@ItemsPerPage * (@CurrentPageNumber - 1)) AND 
			                          RowNum <= (@ItemsPerPage * (@CurrentPageNumber - 1)) + @ItemsPerPage AND (@Search IS NULL OR Description LIKE @Search OR MemberEmail LIKE @Search OR IPAddress LIKE @Search )
                        ORDER BY {1} {2}
		           SELECT @TotalItems = COUNT(EventID)
			            FROM {0} WHERE (@Search IS NULL OR Description LIKE @Search OR MemberEmail LIKE  @Search OR IPAddress LIKE  @Search ) ",
                          Table,
                          Filter.SortColumnName,
                          SortOrder));

                    break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    sp = new SpRoleAdmin(String.Format(@"SELECT * FROM
                          (
                            SELECT *, (@row := @row + 1) AS RowNum
                                FROM {0} b
                            JOIN (SELECT @row := 0) b
			                        WHERE (@Search IS NULL OR Description LIKE @Search OR MemberEmail LIKE  @Search OR IPAddress LIKE  @Search ) 
                            ORDER BY {1} {2}
                          ) AS a
		                        WHERE RowNum > (@ItemsPerPage * (@CurrentPageNumber - 1)) AND 
			                          RowNum <= (@ItemsPerPage * (@CurrentPageNumber - 1)) + @ItemsPerPage AND (@Search IS NULL OR Description LIKE @Search OR MemberEmail LIKE  @Search OR IPAddress LIKE @Search )
                        ORDER BY {1} {2};
		           SELECT @TotalItems = COUNT(EventID)
			            FROM {0} WHERE (@Search IS NULL OR Description LIKE @Search OR MemberEmail LIKE  @Search OR IPAddress LIKE  @Search); ",
                           Table,
                           Filter.SortColumnName,
                           SortOrder));

                    break;
                }
            }

            sp.AddParameter("ItemsPerPage", Filter.ItemsPerPage);
            sp.AddParameter("CurrentPageNumber", Filter.CurrentPage);
            sp.AddParameter("TotalItems", TotalItems, System.Data.ParameterDirection.Output);

            if(Filter.Search != null && Filter.Search != "")
                sp.AddParameter("Search","%"+Filter.Search+"%");
            else
                sp.AddParameter("Search",DBNull.Value);

            List<AuditEvent> Events = GetApplicationCollection(sp);

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                {
                     TotalItems = (int)sp.GetParameter("TotalItems");
                     break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    sp = new SpRoleAdmin(String.Format(@"SELECT COUNT(*) AS TotalItems FROM {0} WHERE (@Search IS NULL OR Description LIKE @Search OR MemberEmail LIKE  @Search OR IPAddress LIKE  @Search)", Table));

                    if (Filter.Search != null && Filter.Search != "")
                        sp.AddParameter("Search", "%" + Filter.Search + "%");
                    else
                        sp.AddParameter("Search", DBNull.Value);

                    TotalItems = Convert.ToInt32(sp.ExecuteScalar());
                    break;
                }
            }

            if (TotalItems == 0 && Filter.CurrentPage > 1)
            {
                Filter.CurrentPage--;
                Events = Get(Filter, out TotalItems);
            }
            else if (TotalItems > 0 && TotalItems < (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = (TotalItems <= Filter.ItemsPerPage) ? 1 : (TotalItems / Filter.ItemsPerPage);
                Events = Get(Filter, out TotalItems);
            }
            else if (TotalItems > 0 && TotalItems == (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = 1;
                Events = Get(Filter, out TotalItems);
            }


            return Events;
        }
    }
}
