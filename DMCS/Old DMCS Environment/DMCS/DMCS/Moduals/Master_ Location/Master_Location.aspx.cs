using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMCS.App_Code;
using System.Data;

namespace DMCS.Moduals.Master__Location
{
    public partial class Master_Location : System.Web.UI.Page
    {
        //on initial loading of the page-- load initialize() *This starts the Map from the beginning*
        protected void Page_Load(object sender, EventArgs e)
        {

            warehouseBox.Checked = false;
            resourceBox.Checked = false;
            mobileunitBox.Checked = false;

            warehouseBox.Attributes.Add("onclick", "return validate_CheckBoxs(this)");
            resourceBox.Attributes.Add("onclick", "return validate_CheckBoxs(this)");
            mobileunitBox.Attributes.Add("onclick", "return validate_CheckBoxs(this)");

            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }


            if (!Page.IsPostBack)
            {
                loadDisaster();
            }



        }

        //load the found disaster into the dropdown list box
        protected void loadDisaster()
        {
            disaster currentDisaster = new disaster();
            {


                try
                {
                    DataTable dtlw = currentDisaster.Select("1=1");
                    ddlDisaster.Items.Clear();


                    ddlDisaster.Items.Add("");

                    if (dtlw.Rows.Count > 0)
                    {
                        for (int i = 0; i < dtlw.Rows.Count; i++)
                        {
                            ddlDisaster.Items.Add(new ListItem(dtlw.Rows[i]["disaster_name"].ToString(), dtlw.Rows[i]["disaster_id"].ToString()));
                        }
                    }
                    else
                    {
                        ddlDisaster.Items.Add("No Disasters");

                    }

                }
                catch
                {

                }
            }
        }

        //display the disaster on screen (data and poly points)
        protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Page page = HttpContext.Current.Handler as Page;
                ScriptManager.RegisterStartupScript(page, page.GetType(),
                "plotPoly", "plotPoly();", true);
                disaster disaster = new disaster();
                GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);
                disaster = disaster.Select(GlobalVariables.DisasterID);
                txtDisasterName.Text = disaster.disaster_name.ToString();
                txtDisasterType.Text = disaster.disaster_type.ToString();
                txtNorthLat.Text = disaster.disaster_north_latitude.ToString();
                txtNorthLong.Text = disaster.disaster_north_longitude.ToString();
                txtSouthLat.Text = disaster.disaster_south_latitude.ToString();
                txtSouthLong.Text = disaster.disaster_south_longitude.ToString();
                txtEastLat.Text = disaster.disaster_east_latitude.ToString();
                txtEastLong.Text = disaster.disaster_east_longitude.ToString();
                txtWestLat.Text = disaster.disaster_west_latitude.ToString();
                txtWestLong.Text = disaster.disaster_west_longitude.ToString();

            }
            catch { }

        }

        //clearing the form completely
        private void clearForm(object sender, EventArgs e)
        {
            txtDisasterName.Text = "";
            txtDisasterType.Text = "";

        }



        protected void SearchbyAddress_Click(object sender, EventArgs e)
        {
            //prepair for search by address
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "disasterSet_NO", "disasterSet_NO();", true);

            SBAddress_btn.Visible = false;
            SBDisaster_btn.Visible = true;

            txtDisasterType.Visible = false;
            Type_l.Visible = false;
            ddlDisaster.Visible = false;
            Disaster_l.Visible = false;

            lblNorthLat.Visible = false;
            lblNorthLong.Visible = false;
            lblSouthLat.Visible = false;
            lblSouthLong.Visible = false;
            lblEastLat.Visible = false;
            lblEastLong.Visible = false;
            lblWestLat.Visible = false;
            lblWestLong.Visible = false;

            txtNorthLat.Visible = false;
            txtNorthLong.Visible = false;
            txtSouthLat.Visible = false;
            txtSouthLong.Visible = false;
            txtEastLat.Visible = false;
            txtEastLong.Visible = false;
            txtWestLat.Visible = false;
            txtWestLong.Visible = false;

            //deploy search by address
            Address_l.Visible = true;
            txtSearchAddress.Visible = true;

            Distance_l.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(),
    "SearchBtn_Show_YES", "SearchBtn_Show_YES();", true);
            typebtn.Visible = true;
            ddlRadius.Visible = true;
        }
        protected void SearchbyDisaster_Click(object sender, EventArgs e)
        {
            //prepair for search by Disaster
            Page.ClientScript.RegisterStartupScript(this.GetType(),
        "disasterSet_YES", "disasterSet_YES();", true);
            SBDisaster_btn.Visible = false;
            SBAddress_btn.Visible = true;

            Address_l.Visible = false;
            txtSearchAddress.Visible = false;

            //deploy search by Disaster
            txtDisasterType.Visible = true;
            Type_l.Visible = true;
            ddlDisaster.Visible = true;
            Disaster_l.Visible = true;
            ddlRadius.Visible = true;

            lblNorthLat.Visible = true;
            lblNorthLong.Visible = true;
            lblSouthLat.Visible = true;
            lblSouthLong.Visible = true;
            lblEastLat.Visible = true;
            lblEastLong.Visible = true;
            lblWestLat.Visible = true;
            lblWestLong.Visible = true;

            txtNorthLat.Visible = true;
            txtNorthLong.Visible = true;
            txtSouthLat.Visible = true;
            txtSouthLong.Visible = true;
            txtEastLat.Visible = true;
            txtEastLong.Visible = true;
            txtWestLat.Visible = true;
            txtWestLong.Visible = true;


            Distance_l.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(),
        "SearchBtn_Show_YES", "SearchBtn_Show_YES();", true);
            typebtn.Visible = true;
        }
    }
}