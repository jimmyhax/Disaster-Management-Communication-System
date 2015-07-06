using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Server_.API.Collections;
using Server_.API.Objects;
using Server_.API.Utilities;

namespace Web.App.Management
{
    public partial class Viewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Member.IsInRoleInAPI("blocked") || !Member.IsInRoleInAPI("Viewer"))
            {
                Response.Redirect("/AccessDenied.aspx");
            }
        }

        protected string CurrentUserName
        {
            get
            {
                return HttpContext.Current.User.Identity.Name;
            }
        }

        protected string CurrentMemberName
        {
            get
            {
                return Member.NameInCoookie();
            }
        }    
    }
}