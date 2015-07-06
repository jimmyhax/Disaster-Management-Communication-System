using System;
using System.Collections.Generic;
using Server_.API.Collections;
using Server_.API.Objects;
using Server_.API.Utilities;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Web.App.Management
{
    public partial class Editor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Member.IsInRoleInAPI("blocked") || !Member.IsInRoleInAPI("editor"))
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