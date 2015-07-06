using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Controllers;


namespace Web.Admin.Models
{
    public class MemberListModel
    {
        public List<Member> Members { get; set; }
        public MemberListFilter Filter { get; set; }
        public string HolderName { get; set; }
        public int TotalItems { get; set; }
        public Role Role { get; set; }
        public bool Assign { get; set; }
        public ApplicationParameters AppParams { get; private set; }

        public MemberListModel()
        {
            Members = new List<Member>();
            Filter = new MemberListFilter();
            AppParams = new ApplicationParameters();
        }

        public MemberListModel(String HolderName, List<Member> Members)
        {
            this.HolderName = HolderName;
            this.Members = Members;
            Filter = new MemberListFilter();
            AppParams = new ApplicationParameters();
        }

        public static List<int> StringToList(String Value)
        {
            int result = 0;
            List<int> Result = new List<int>();
            
            if (Value != null)
            {
                string[] Values = Value.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string ItemValue in Values)
                {
                    if(int.TryParse(ItemValue,out result)) 
                        Result.Add(result);
                }
                    
            }
            
            return Result;
        }

        public static string ListToString(List<int> Values)
        {
            string Result = "";
            foreach (int ItemValue in Values)
            {
                if (Result.Length > 0)
                    Result += ",";
                
                Result += ItemValue;
            }
            
            return Result;
        }

        public MemberListModel(string HolderName)
        {
            int result = 0;
            this.Filter = new MemberListFilter();
            AppParams = new ApplicationParameters();

            int TotalItems = 0;
            this.HolderName = HolderName;
            this.Filter.ItemsPerPage = (HttpContext.Current.Request["s"] != null && int.TryParse(HttpContext.Current.Request["s"], out result)) ? result : int.Parse(AppParams.AppUiPagingSize.Value);
            this.Filter.CurrentPage = (HttpContext.Current.Request["p"] != null && int.TryParse(HttpContext.Current.Request["p"], out result)) ? result : 1;

            this.Filter.SortColumn = (HttpContext.Current.Request["c"] != null && int.TryParse(HttpContext.Current.Request["c"], out result)) ? result : 1;
            this.Filter.SortOrderAsc = (HttpContext.Current.Request["o"] != null && (int.TryParse(HttpContext.Current.Request["o"], out result)) ? (result == 1 ? true : false) : true);
            this.Filter.SortColumnName = "MemberID";
            this.Filter.Search = (HttpContext.Current.Request["q"] != null ? HttpUtility.UrlDecode(HttpContext.Current.Request["q"]) : "");

            if (HttpContext.Current.Request["f"] != null)
            {
                if (HttpContext.Current.Request["f"] == "or")
                    Filter.RoleFilterCondition = MemberListFilterRoleConditon.OR;
                else if (HttpContext.Current.Request["f"] == "and")
                    Filter.RoleFilterCondition = MemberListFilterRoleConditon.AND;
            }

            switch (this.Filter.SortColumn)
            {
                case 2: this.Filter.SortColumnName = "Name"; break;
                case 4: this.Filter.SortColumnName = "Email"; break;
                case 5: this.Filter.SortColumnName = "LastLogin"; break;
                case 6: this.Filter.SortColumnName = "Created"; break;
            }

            this.Filter.AlphabetFilter = StringToList(HttpContext.Current.Request["a"] != null ? HttpContext.Current.Request["a"]  : "");
            this.Filter.RolesFilter = StringToList(HttpContext.Current.Request["r"] != null ? HttpContext.Current.Request["r"] : "");

            this.Members  = Web.Admin.Logic.Collections.Members.Get(this.Filter,out TotalItems);
            this.TotalItems = TotalItems;
        }

        public MemberListModel(String HolderName, List<Member> Members, MemberListFilter Filter, int TotalItems)
        {
            this.HolderName = HolderName;
            this.Members = Members;
            this.TotalItems = TotalItems;
            this.Filter = Filter;
        }

        public string SortImageClass(int Index)
         {
             string cssClass = "ui-icon-carat-2-n-s";

             if (Index == this.Filter.SortColumn)
             {
                 if (this.Filter.SortOrderAsc)
                     cssClass = "ui-icon-triangle-1-n";
                 else
                     cssClass = "ui-icon-triangle-1-s";
             }
             return cssClass;
         }
    }
}