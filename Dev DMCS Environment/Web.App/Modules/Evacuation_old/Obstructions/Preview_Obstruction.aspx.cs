using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;
using DMCS.App_Code;

namespace DMCS.Moduals.Evacuation.Obstructions
{
    public partial class Preview_Obstruction : System.Web.UI.Page
    {


        //on initial loading of the page-- load initialize() *This starts the Map from the beginning*
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }


            if (!Page.IsPostBack)
            {


            }


        }


        //display the disaster on screen (data and poly points)
        protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                disaster disaster = new disaster();
                GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);


            }
            catch { }

        }
    }
}