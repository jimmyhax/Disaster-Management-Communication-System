using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Server_.API.Collections;
using Server_.API.Objects;
using Server_.API.Utilities;


namespace Web.App.Controls
{
    public partial class LayoutSignInControl : System.Web.UI.UserControl
    {
        SocialSignInAvailability _socialSignIn = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            _socialSignIn = SocialSignInAvailabilities.GetSocialSignInAvailability();
        }

        protected string CurrentUserName
        {
            get
            {
                return HttpContext.Current.User.Identity.Name;
            }
        }

        protected SocialSignInAvailability SocialSignIn
        {
            get
            {
                return _socialSignIn;
            }
        }


        protected string CurrentMemberName
        {
            get
            {
                return Member.NameInCoookie();
            }
        }

        protected string AvatarUrl
        {
            get
            {
                return Tools.GetAvatarURL();
            }
        }
    }
}