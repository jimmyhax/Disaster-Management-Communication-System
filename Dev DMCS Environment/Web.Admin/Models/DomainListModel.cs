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
    public class DomainListModel
    {
        public List<Domain> Domains { get; set; }
        public string HolderName { get; set; }
        public int TotalItems { get; set; }
        public DomainListFilter Filter { get; set; }
        public ApplicationParameters AppParams { get; private set; }

        public DomainListModel()
        {
            Domains = new List<Domain>();
            Filter = new DomainListFilter();
            HolderName = "";
            Filter.ItemsPerPage = 5;
            Filter.CurrentPage = 1;
            AppParams = new ApplicationParameters();
        }

        public DomainListModel(string HolderName)
        {
            int result = 0;
            Filter = new DomainListFilter();
            AppParams = new ApplicationParameters();

            int TotalItems = 0;
            this.HolderName = HolderName;
            this.Filter.ItemsPerPage = (HttpContext.Current.Request["s"] != null && int.TryParse(HttpContext.Current.Request["s"], out result)) ? result : int.Parse(AppParams.AppUiPagingSize.Value);
            this.Filter.CurrentPage = (HttpContext.Current.Request["p"] != null && int.TryParse(HttpContext.Current.Request["p"], out result)) ? result : 1;

            this.Filter.SortColumn = (HttpContext.Current.Request["c"] != null && int.TryParse(HttpContext.Current.Request["c"], out result)) ? result : 1;
            this.Filter.SortOrderAsc = (HttpContext.Current.Request["o"] != null && (int.TryParse(HttpContext.Current.Request["o"], out result)) ? (result == 1 ? true : false) : true);

            this.Filter.SortColumnName = "DomainID";
            switch (this.Filter.SortColumn)
            {
                case 1: this.Filter.SortColumnName = "DomainID"; break;
                case 2: this.Filter.SortColumnName = "Name"; break;
                case 3: this.Filter.SortColumnName = "Description"; break;
                case 4: this.Filter.SortColumnName = "Created"; break;
                case 5: this.Filter.SortColumnName = "Modified"; break;
            }

            this.Domains = Web.Admin.Logic.Collections.Domains.Get(Filter, out TotalItems);
            this.TotalItems = TotalItems;
        }

        public DomainListModel(String HolderName, List<Domain> Domains, DomainListFilter Filter, int TotalItems)
        {
            this.Filter = new DomainListFilter();
            
            this.HolderName = HolderName;
            this.Domains = Domains;
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