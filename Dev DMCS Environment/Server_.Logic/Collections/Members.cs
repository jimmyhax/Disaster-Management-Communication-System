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
    /// Provides the fields to create complex searching condition. 
    /// </summary>
    public class MemberListFilter
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
        /// Order direction.
        /// </summary>
        public bool SortOrderAsc {get;set;}
        
        /// <summary>
        /// List of alphabet indexes.
        /// </summary>
        public List<int> AlphabetFilter {get;set;}
        
        /// <summary>
        /// List of role unique identifiers.
        /// </summary>
        public List<int> RolesFilter { get; set; }

        /// <summary>
        /// Current page number.
        /// </summary>
        public int CurrentPage { get; set; }

        /// <summary>
        /// Searching join condition. 
        /// </summary>
        public MemberListFilterRoleConditon RoleFilterCondition { get; set; }

        /// <summary>
        /// Set of words for searching.
        /// </summary>
        public String Search { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public MemberListFilter() {
            RoleFilterCondition = MemberListFilterRoleConditon.OR;
        }
    }


    /// <summary>
    /// Provides searching join condition. 
    /// </summary>
    public enum MemberListFilterRoleConditon
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
    /// Provides the possibility to get an instance or the collection of Member objects by specified condition from the database. For instance: you can get a member by e-mail address or unique identifier.
    /// </summary>
    public class Members : ApplicationCollection<Member, DbRoleAdmin, SpRoleAdmin>
    {
        /// <summary>
        /// Gets an instance of Member object by unique identifier.
        /// </summary>
        /// <param name="MemberID">Member unique identifier.</param>
        /// <returns>Insatnce of Member object.</returns>
        public static Member GetBy(long MemberID)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE MemberID = @MemberID",Table));
            sp.AddParameter("MemberID", MemberID);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Gets all instances of Member object from the database.
        /// </summary>
        /// <returns>List of Member instances.</returns>
        public static List<Member> Get()
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0}",Table));
            return GetApplicationCollection(sp);
        }

        /// <summary>
        /// Return collection of Member objects by a filter.
        /// </summary>
        /// <param name="Filter">The MemberListFilter includes: 
        /// ItemsPerPage - items number per page;
        /// SortColumnName - sorting column name;
        /// SortColumn - sorting column number;
        /// SortOrderAsc - sorting condition;
        /// AlphabetFilter - List of alphabet indexes
        /// RolesFilter - List of role unique identifiers.
        /// CurrentPage - current page which calculated by total items  and items per page;
        /// Search - Set of words for searching.
        /// </param>
        /// <param name="TotalItems">It will contain total item number after method execution.</param>
        /// <returns>List of Member instances.</returns>
        public static List<Member> Get(MemberListFilter Filter, out int TotalItems)
        {
            if(Filter.Search != null)
                Filter.Search = Filter.Search.Trim();

            string LikeConditionString = "";
            string RolesCondition = "";
            //string RolesConditionCount = "";

            string Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

            if (Filter.AlphabetFilter != null)
            {
                foreach (int charIndex in Filter.AlphabetFilter)
                {

                    if (LikeConditionString.Length > 0)
                        LikeConditionString += " OR ";

                    if (charIndex < Alphabet.Length)
                        LikeConditionString += String.Format(" UPPER(Name) LIKE '{0}%' ", Alphabet[charIndex]);
                }
            }

            if (LikeConditionString.Length > 0)
                LikeConditionString = String.Format(" AND ({0}) ", LikeConditionString);                

            int RolesCount = 0;
            if (Filter.RolesFilter != null)
            {
                foreach (int role in Filter.RolesFilter)
                {
                    if (RolesCondition.Length > 0)
                        RolesCondition += ",";

                    RolesCondition += role;
                    RolesCount++;
                }
            }
            
            if (Filter.RoleFilterCondition == MemberListFilterRoleConditon.OR)
            {
                if (RolesCondition.Length > 0)
                    RolesCondition = String.Format(" AND MemberID IN (SELECT DISTINCT MemberID FROM MemberRoles WHERE RoleID IN ({0}))", RolesCondition);
            }
            if (Filter.RoleFilterCondition == MemberListFilterRoleConditon.AND)
            {
                if (RolesCondition.Length > 0)
                   RolesCondition = String.Format(" AND MemberID IN (SELECT MemberID FROM MemberRoles WHERE RoleID IN({0}) GROUP BY MemberID HAVING COUNT(MemberID) = {1})", RolesCondition, RolesCount);
            }

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
			                        FROM {0} WHERE (@Search IS NULL OR Name LIKE @Search OR Email LIKE @Search) {3} {4}
                          ) AS a
		                        WHERE RowNum > (@ItemsPerPage * (@CurrentPageNumber - 1)) AND 
			                          RowNum <= (@ItemsPerPage * (@CurrentPageNumber - 1)) + @ItemsPerPage AND (@Search IS NULL OR Name LIKE @Search OR Email LIKE @Search) {3} {4}
                        ORDER BY {1} {2}
		           SELECT @TotalItems = COUNT(MemberID)
			            FROM {0} WHERE (@Search IS NULL OR Name LIKE @Search OR Email LIKE @Search) {3} {4} ",
                        Table,
                        Filter.SortColumnName,
                        SortOrder,
                        LikeConditionString,
                        RolesCondition));
                    break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    sp = new SpRoleAdmin(String.Format(@"SELECT * FROM
                          (
                            SELECT *, (@row := @row + 1) AS RowNum
			                        FROM {0}
                            JOIN (SELECT @row := 0) b
                                    WHERE (@Search IS NULL OR Name LIKE @Search OR Email LIKE @Search) {3} {4}
                            ORDER BY {1} {2}
                          ) AS a
		                        WHERE RowNum > (@ItemsPerPage * (@CurrentPageNumber - 1)) AND 
			                          RowNum <= (@ItemsPerPage * (@CurrentPageNumber - 1)) + @ItemsPerPage AND (@Search IS NULL OR Name LIKE @Search OR Email LIKE @Search) {3} {4}
                        ORDER BY {1} {2}",		           
                        Table,
                        Filter.SortColumnName,
                        SortOrder,
                        LikeConditionString,
                        RolesCondition));

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

            List<Member> Members = GetApplicationCollection(sp);

            switch (DbRoleAdmin.CurrentProvider)
            {
                case DatabaseProvider.MSSQLServer:
                {
                    TotalItems = (int)sp.GetParameter("TotalItems");
                    break;
                }
                case DatabaseProvider.MySQLServer:
                {
                    sp = new SpRoleAdmin(String.Format(@"SELECT COUNT(MemberID) AS TotalItems FROM {0} WHERE (@Search IS NULL OR Name LIKE @Search OR Email LIKE @Search) {1} {2}", Table, LikeConditionString, RolesCondition));

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
                Members = Get(Filter, out TotalItems);
            }
            else if (TotalItems > 0 && TotalItems < (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = (TotalItems <= Filter.ItemsPerPage) ? 1 : (TotalItems / Filter.ItemsPerPage);
                Members = Get(Filter, out TotalItems);
            }
            else if (TotalItems > 0 && TotalItems == (Filter.CurrentPage - 1) * Filter.ItemsPerPage)
            {
                Filter.CurrentPage = 1;
                Members = Get(Filter, out TotalItems);
            }


            return Members;
        }

        /// <summary>
        /// Return an instance of Member objects by member email.
        /// </summary>
        /// <param name="email">Member email.</param>
        /// <returns>Insatnce of Member object.</returns>
        public static Member GetByEmail(string email)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE Email=@email",Table));
            sp.AddParameter("email", email);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Return an instance of Member objects by member email or name.
        /// </summary>
        /// <param name="email">Member email.</param>
        /// <param name="name">Member name.</param>
        /// <returns>Insatnce of Member object.</returns>
        public static Member GetByEmailOrName(string email, string name)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE UPPER(Email)=UPPER(@email) OR UPPER(Name)=UPPER(@Name)", Table));
            sp.AddParameter("Email", email);
            sp.AddParameter("Name", name);
            return GetApplicationObject(sp);
        }

        /// <summary>
        /// Return an instance of Member objects by member email and name.
        /// </summary>
        /// <param name="email">Member email.</param>
        /// <param name="name">Member name.</param>
        /// <returns>Insatnce of Member object.</returns>
        public static Member GetByEmailName(string email, string name)
        {
            SpRoleAdmin sp = new SpRoleAdmin(String.Format("SELECT * FROM {0} WHERE UPPER(Email)=UPPER(@email) AND UPPER(Name)=UPPER(@Name)",Table));
            sp.AddParameter("Email", email);
            sp.AddParameter("Name", name);
            return GetApplicationObject(sp);
        }

    }
}
