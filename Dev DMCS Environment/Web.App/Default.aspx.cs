using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Server_.API.Objects;
using Server_.API.Collections;
using Server_.API.Utilities;

namespace Web.App
{
    public partial class _Default : Page
    {
        protected MemberSocialNetwork _Facebook;
        protected MemberSocialNetwork _Twitter;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected MemberSocialNetwork GetMemberSocialNetwork()
        {
            MemberSocialNetwork _memberNetwork = new MemberSocialNetwork();

            Connection _connection =
                            new Connection
                            (
                                System.Configuration.ConfigurationManager.AppSettings["ssoAPIUrl"],
                                System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberName"],
                                System.Configuration.ConfigurationManager.AppSettings["ssoAPIMemberToken"]
                            );

            MemberSocialNetworks.Connection = _connection;
            return MemberSocialNetworks.GetMemberSocialNetworksBySignInEmail(User.Identity.Name);
        }

    }
}