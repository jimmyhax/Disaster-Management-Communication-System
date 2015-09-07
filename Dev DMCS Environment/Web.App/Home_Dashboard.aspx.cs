using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Server_.API.Collections;
using Server_.API.Objects;
using Server_.API.Utilities;

namespace Web.App
{
    public partial class Home_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect(Tools.SingleSignOnRedirectUrl(SingleSignOnRedirectTo.SignIn, Request.QueryString["ReturnUrl"]));
            }
            else
            {
                if (Member.IsInRoleInAPI("blocked") || !Member.IsInRoleInAPI("editor"))
                {
                    Response.Redirect("/AccessDenied.aspx");
                }
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