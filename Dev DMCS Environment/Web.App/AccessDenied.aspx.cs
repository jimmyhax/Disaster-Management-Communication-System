using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Server_.API.Utilities;

namespace Web.App
{
    public partial class AccessDenied : System.Web.UI.Page
    {
        public bool IsBlocked { 
            get{
                return Tools.IsAccountBlocked();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
