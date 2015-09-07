using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMCS.App_Code;

namespace DMCS.Moduals.Evacuation.Evacuation_Area
{
    public partial class Create_Evacuation_Area : System.Web.UI.Page
    {
        //finding client
        public DMCS.Evacuation_Area Evacuation_Area = new DMCS.Evacuation_Area();
        public location Location = new location();

        //disaster locations
        public Decimal nLat;
        public Decimal nLong;

        public Decimal sLat;
        public Decimal sLong;

        public Decimal eLat;
        public Decimal eLong;

        public Decimal wLat;
        public Decimal wLong;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }
            if (!IsPostBack)
            {

            }
        }
        //display the disaster on screen 
        protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                disaster disaster = new disaster();
                GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);
                disaster = disaster.Select(Convert.ToInt32(ddlDisaster.SelectedItem.Value));
                
                nLat = disaster.disaster_north_latitude;
                nLong = disaster.disaster_north_longitude;

                sLat = disaster.disaster_south_latitude;
                sLong = disaster.disaster_south_longitude;

                eLat = disaster.disaster_east_latitude;
                eLong = disaster.disaster_east_longitude;

                wLat = disaster.disaster_west_latitude;
                wLong = disaster.disaster_west_longitude;


                Page page = HttpContext.Current.Handler as Page;
                ScriptManager.RegisterStartupScript(page, page.GetType(),
                "plotPoly", "plotPoly();", true);

            }
            catch { }
        }
        protected void Insert_Click(object sender, EventArgs e)
        {

            if (city_txt.Text == ""
                || state_txt.Text == ""
                || zip_txt.Text == ""
                || county_txt.Text == ""
                || Nlat_txt.Text == ""
                || Nlong_txt.Text == ""
                || Slat_txt.Text == ""
                || Slong_txt.Text == ""
                || Elat_txt.Text == ""
                || Elong_txt.Text == ""
                || Wlat_txt.Text == ""
                || Wlong_txt.Text == ""
                || LocationDiscription_txt.Text == ""
                )
            {

                Error.Text = "Please fill out every text-box with '*' accordingly to continue.";
            }
            else
            {

                //Location
                Location.Location_ID = GlobalVariables.Location_ID;
                Location.type = "E";
                Location.city = city_txt.Text;
                Location.state = state_txt.Text;
                Location.zip = Convert.ToInt32(zip_txt.Text);
                Location.county = county_txt.Text;
                Location.location_desc = LocationDiscription_txt.Text;
                Location.n_long = Convert.ToDecimal(Nlong_txt.Text);
                Location.s_long = Convert.ToDecimal(Slong_txt.Text);
                Location.e_long = Convert.ToDecimal(Elong_txt.Text);
                Location.w_long = Convert.ToDecimal(Wlong_txt.Text);
                Location.n_lat = Convert.ToDecimal(Nlat_txt.Text);
                Location.s_lat = Convert.ToDecimal(Slat_txt.Text);
                Location.e_lat = Convert.ToDecimal(Elat_txt.Text);
                Location.w_lat = Convert.ToDecimal(Wlat_txt.Text);

                location newloc = Location.Insert(Location);

                DMCS.Evacuation_Area EvacObj = new DMCS.Evacuation_Area();
                EvacObj.Evacuation_Area_ID = GlobalVariables.Evacuation_Area_ID;
                EvacObj.Location_ID = newloc.Location_ID;

                EvacObj.Insert(EvacObj);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowMessage", string.Format("<script type='text/javascript'>alert('Evacuation Area Inserted Successfully!'); location.href = location.href;</script>", true));
            }
        }

        protected void clear(object sender, EventArgs e)
        {
            Response.Redirect("EvacuationArea.aspx");
        }

    }
}