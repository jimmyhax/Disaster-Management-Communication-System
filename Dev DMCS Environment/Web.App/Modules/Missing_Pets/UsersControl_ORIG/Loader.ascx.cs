using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UsersControl_Loader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void LoadingMessage(string message)
    {
        lblMessage.Text = message;
        upMessage.Update();

    }
}
