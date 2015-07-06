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
using System.Web.UI.WebControls.WebParts;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;
using DMCS.App_Code;

namespace DMCS.Moduals.Evacuation.Obstructions
{
    public partial class Obstruction_Insert : System.Web.UI.Page
    {
        public Obstruction Obstruction = new Obstruction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }
            if (!Page.IsPostBack)
            { }
        }
        protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                disaster disaster = new disaster();
                GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);
            }
            catch { }
        }
        protected void Select_Record(object sender, EventArgs e)
        {
            Obstruction = Obstruction.Select(Convert.ToInt32(GridView1.SelectedValue));
            Obstruction_ID_TextBox.Text = Convert.ToString(Obstruction.Obstruction_ID);
            Evacuation_Area_ID_TextBox.Text = Convert.ToString(Obstruction.Evacuation_Area_ID);
            Location_ID_TextBox.Text = Convert.ToString(Obstruction.Location_ID);
            Date_Reported_TextBox.Text = Convert.ToString(Obstruction.Date_Reported);
            Expected_Recovery_Date_TextBox.Text = Convert.ToString(Obstruction.Expected_Recovery_Date);
            Type_TextBox.Text = Convert.ToString(Obstruction.Type);
            Severity_TextBox.Text = Convert.ToString(Obstruction.Severity);
        }
        protected void INSERT(object sender, EventArgs e)
        {
            Obstruction.Evacuation_Area_ID = (Convert.ToInt32(Evacuation_Area_ID_TextBox.Text));
            Obstruction.Location_ID = (Convert.ToInt32(Location_ID_TextBox.Text));
            Obstruction.Date_Reported = DateTime.Now;
            Obstruction.Expected_Recovery_Date = DateTime.Now;
            Obstruction.Type = Type_TextBox.Text;
            Obstruction.Severity = Severity_TextBox.Text;
            Obstruction = Obstruction.Insert(Obstruction);
            GridView1.DataBind();
        }
    }
}
