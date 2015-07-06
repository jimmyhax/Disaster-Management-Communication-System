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
    public class AuditEventListModel
    {
        public List<AuditEvent> AuditEvents { get; set; }
        public AuditEventListFilter Filter { get; set; }
        public string HolderName { get; set; }
        public int TotalItems { get; set; }
        public ApplicationParameters AppParams { get; private set; }

        public AuditEventListModel()
        {
            AuditEvents = new List<AuditEvent>();
            Filter = new AuditEventListFilter();
            AppParams = new ApplicationParameters();
        }

        public AuditEventListModel(String HolderName, List<AuditEvent> AuditEvents)
        {
            this.HolderName = HolderName;
            this.AuditEvents = AuditEvents;
            Filter = new AuditEventListFilter();
            AppParams = new ApplicationParameters();
        }

        public AuditEventListModel(string HolderName)
        {
            int result = 0;
            this.Filter = new AuditEventListFilter();
            AppParams = new ApplicationParameters();

            int TotalItems = 0;
            this.HolderName = HolderName;
            this.Filter.ItemsPerPage = (HttpContext.Current.Request["s"] != null && int.TryParse(HttpContext.Current.Request["s"], out result)) ? result : int.Parse(AppParams.AppUiPagingSize.Value);
            this.Filter.CurrentPage = (HttpContext.Current.Request["p"] != null && int.TryParse(HttpContext.Current.Request["p"], out result)) ? result : 1;

            this.Filter.SortColumn = (HttpContext.Current.Request["c"] != null && int.TryParse(HttpContext.Current.Request["c"], out result)) ? result : 3;
            this.Filter.SortOrderAsc = (HttpContext.Current.Request["o"] != null && (int.TryParse(HttpContext.Current.Request["o"], out result)) ? (result == 1 ? true : false) : false);
            this.Filter.SortColumnName = "EventID";
            this.Filter.Search = (HttpContext.Current.Request["q"] != null ? HttpUtility.UrlDecode(HttpContext.Current.Request["q"]) : "");  

            switch (this.Filter.SortColumn)
            {
                case 1: Filter.SortColumnName = "EventType"; break;
                case 2: Filter.SortColumnName = "Created"; break;
                case 3: Filter.SortColumnName = "EventID"; break;
                case 4: Filter.SortColumnName = "EventSource"; break;
                case 5: Filter.SortColumnName = "IPAddress"; break;
                case 6: Filter.SortColumnName = "MemberEmail"; break;
                case 7: Filter.SortColumnName = "Description"; break;
            }
  
            this.AuditEvents  = Web.Admin.Logic.Collections.AuditEvents.Get(this.Filter,out TotalItems);
            this.TotalItems = TotalItems;
        }

        public AuditEventListModel(String HolderName, List<AuditEvent> AuditEvents, AuditEventListFilter Filter, int TotalItems)
        {
            this.HolderName = HolderName;
            this.AuditEvents = AuditEvents;
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