using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Server_.API.Collections;
using Server_.API.Objects;
using Server_.API.Utilities;

namespace Web.App.Account
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect(Tools.SingleSignOnRedirectUrl(SingleSignOnRedirectTo.ForgotPassword, Request.QueryString["ReturnUrl"]));
        }
    }
}
