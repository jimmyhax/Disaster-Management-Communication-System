using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using Web.Admin.Controllers;
using System.Web.Mvc;
using System.Web.Routing;
using System.Diagnostics;


namespace Web.Admin.Models
{
    public class RoleListModel
    {
        public List<Role> Roles { get; set; }
        public string HolderName { get; set; }
        public int TotalItems { get; set; }
        public RoleListFilter Filter { get; set; }
        public ApplicationParameters AppParams { get; private set; }

        public RoleListModel()
        {
            Roles = new List<Role>();
            Filter = new RoleListFilter();
            HolderName = "";
            Filter.ItemsPerPage = 5;
            Filter.CurrentPage = 1;
            AppParams = new ApplicationParameters();
        }

        public RoleListModel(string HolderName)
        {
            int result = 0;
            Filter = new RoleListFilter();
            AppParams = new ApplicationParameters();

            int TotalItems = 0;
            this.HolderName = HolderName;
            this.Filter.ItemsPerPage = (HttpContext.Current.Request["s"] != null && int.TryParse(HttpContext.Current.Request["s"], out result)) ? result : int.Parse(AppParams.AppUiPagingSize.Value);
            this.Filter.CurrentPage = (HttpContext.Current.Request["p"] != null && int.TryParse(HttpContext.Current.Request["p"], out result)) ? result : 1;

            this.Filter.SortColumn = (HttpContext.Current.Request["c"] != null && int.TryParse(HttpContext.Current.Request["c"], out result)) ? result : 1;
            this.Filter.SortOrderAsc = (HttpContext.Current.Request["o"] != null && (int.TryParse(HttpContext.Current.Request["o"], out result)) ? (result == 1 ? true : false) : true);

            this.Filter.SortColumnName = "RoleID";
            switch (this.Filter.SortColumn)
            {
                case 2: this.Filter.SortColumnName = "Name"; break;
                case 3: this.Filter.SortColumnName = "MemberCount"; break;
                case 6: this.Filter.SortColumnName = "Created"; break;
                case 7: this.Filter.SortColumnName = "Modified"; break;
                case 5: this.Filter.SortColumnName = "Settings"; break;
            }

            this.Roles = Web.Admin.Logic.Collections.Roles.Get(Filter, out TotalItems);
            this.TotalItems = TotalItems;
        }

        public RoleListModel(String HolderName, List<Role> Roles, RoleListFilter Filter, int TotalItems)
        {
            this.Filter = new RoleListFilter();

            this.HolderName = HolderName;
            this.Roles = Roles;
            this.Filter.CurrentPage = Filter.CurrentPage;
            this.Filter.ItemsPerPage = Filter.ItemsPerPage;
            this.Filter.SortColumn = Filter.SortColumn;
            this.Filter.SortOrderAsc = Filter.SortOrderAsc;
            this.TotalItems = TotalItems;
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
