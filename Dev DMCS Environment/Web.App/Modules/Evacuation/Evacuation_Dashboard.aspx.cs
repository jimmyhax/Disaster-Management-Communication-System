using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Server_.API.Collections;
using Server_.API.Objects;
using Server_.API.Utilities;

namespace Web.App.Modules.Evacuation
{
    public partial class Evacuation_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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