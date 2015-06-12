using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMCS.App_Code;

namespace DMCS.Moduals.Evacuation.Alerts
{
    public partial class Alert_History : System.Web.UI.Page
    {

        public Alert Alert = new Alert();
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
            Alert = Alert.Select(Convert.ToInt32(GridView1.SelectedValue));
            Alert_ID_TextBox.Text = Convert.ToString(Alert.Alert_ID);
            Alert_Message_TextBox.Text = Convert.ToString(Alert.Alert_Message);
            Alert_Type_TextBox.Text = Convert.ToString(Alert.Alert_Type);
            //Alert_Desc_RadioBtn.Checked = ?

        }

        protected void INSERT(object sender, EventArgs e)
        {

            //NOOOO Alert.Alert_ID = Convert.ToInt32(Alert_ID_TextBox.Text);
            Alert.Alert_Message = Alert_Message_TextBox.Text;
            Alert.Alert_Type = Alert_Type_TextBox.Text;
            //Alert_Desc_RadioBtn.Checked = ?
            Alert = Alert.Insert(Alert);
        }
        protected void UPDATE(object sender, EventArgs e)
        {
            Alert = Alert.Select(Convert.ToInt32(GridView1.SelectedValue));

            Alert.Alert_ID = Convert.ToInt32(Alert_ID_TextBox.Text);
            Alert.Alert_Message = Alert_Message_TextBox.Text;
            Alert.Alert_Type = Alert_Type_TextBox.Text;
            //Alert_Desc_RadioBtn.Checked = ?
            Page.ClientScript.RegisterStartupScript(this.GetType(),
    "Alert", "Alert(WE MADE IT!);", true);
            Alert.Update(Alert);
            Page.ClientScript.RegisterStartupScript(this.GetType(),
        "Alert", "Alert(WE MADE IT!2);", true);
        }
        protected void DELETE(object sender, EventArgs e)
        {
            Alert.Delete(Convert.ToInt32(GridView1.SelectedValue));
        }
    }
}