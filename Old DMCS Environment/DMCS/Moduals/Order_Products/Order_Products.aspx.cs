using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMCS.App_Code;
using System.Data;
using System.Web.Services;
using System.IO;

namespace DMCS.Moduals.Order_Products
{
    public partial class Order_Products : System.Web.UI.Page
    {
        xml_datasource_generator xml_datasource_generator = new xml_datasource_generator();
        public requestor_Order requestor_Order = new requestor_Order();
        public requestor requestor = new requestor();
        public person person = new person();
        public client client = new client();
        public case_intake case_intake = new case_intake();
        public case_client case_client = new case_client();
        public call_center call_center = new call_center();
        public address address = new address();
        public encounter encounter = new encounter();
        public products products = new products();
        public warehouse_product_Location warehouse_product_location = new warehouse_product_Location();
        public warehouse warehouse = new warehouse();
        public mobile_unit mobile_unit = new mobile_unit();
        public agency agency = new agency();


        //on initial loading of the page-- load initialize() *This starts the Map from the beginning*
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (GlobalVariables.JStoC_Product_ID != null)
            //{
            //    txtSearchAddress.Text = "";

            //    for (int i = 0; i < GlobalVariables.JStoC_Product_ID.Length; i++)
            //    {
            //        txtSearchAddress.Text += GlobalVariables.JStoC_Product_ID[1];
            //    }
            //}
            warehouseBox.Checked = false;
            resourceBox.Checked = false;
            //mobileunitBox.Checked = false;

            warehouseBox.Attributes.Add("onclick", "return validate_CheckBoxs(this)");
            resourceBox.Attributes.Add("onclick", "return validate_CheckBoxs(this)");
            //mobileunitBox.Attributes.Add("onclick", "return validate_CheckBoxs(this)");
            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }
            if (!Page.IsPostBack)
            { loadDisaster();}
        }

        //load the found disaster into the dropdown list box
        protected void loadDisaster()
        {
            disaster disaster = new disaster();
            {
                try
                {
                    DataTable disaster_results = disaster.Select("1=1");
                    ddlDisaster.Items.Clear();
                    ddlDisaster.Items.Add("");
                    if (disaster_results.Rows.Count > 0)
                    {
                        for (int i = 0; i < disaster_results.Rows.Count; i++)
                        {
                            ddlDisaster.Items.Add(new ListItem(disaster_results.Rows[i]["disaster_name"].ToString(), disaster_results.Rows[i]["disaster_id"].ToString()));
                        }
                    }
                    else
                    {
                        ddlDisaster.Items.Add("No Disasters");
                    }
                }
                catch
                {}
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
                HFDisasterName.Value = disaster.disaster_name.ToString();
                HFDisasterType.Value = disaster.disaster_type.ToString();
                HFNorthLat.Value = disaster.disaster_north_latitude.ToString();
                HFNorthLong.Value = disaster.disaster_north_longitude.ToString();
                HFSouthLat.Value = disaster.disaster_south_latitude.ToString();
                HFSouthLong.Value = disaster.disaster_south_longitude.ToString();
                HFEastLat.Value = disaster.disaster_east_latitude.ToString();
                HFEastLong.Value = disaster.disaster_east_longitude.ToString();
                HFWestLat.Value = disaster.disaster_west_latitude.ToString();
                HFWestLong.Value = disaster.disaster_west_longitude.ToString();

            }
            catch { }

        }

        //clearing the form completely
        private void clearForm(object sender, EventArgs e)
        {
            //txtDisasterName.Text = "";
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
            disaster_DDL_DIV.Style.Add("display", "none");
            Address_DDL_DIV.Style.Add("display", "block");


            //deploy search by address
            Address_l.Visible = true;
            txtSearchAddress.Visible = true;

            Distance_l.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(),
            "SearchBtn_Show_YES", "SearchBtn_Show_YES();", true);
            ddlRadius.Visible = true;
        }
        protected void SearchbyDisaster_Click(object sender, EventArgs e)
        {
            //prepair for search by Disaster
            Page.ClientScript.RegisterStartupScript(this.GetType(),
        "disasterSet_YES", "disasterSet_YES();", true);
            SBDisaster_btn.Visible = false;
            SBAddress_btn.Visible = true;
            disaster_DDL_DIV.Style.Add("display", "block");
            Address_DDL_DIV.Style.Add("display", "none");

            //deploy search by Disaster
            txtDisasterType.Visible = true;
            Type_l.Visible = true;
            ddlDisaster.Visible = true;
            Disaster_l.Visible = true;
            ddlRadius.Visible = true;



            Distance_l.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(),
        "SearchBtn_Show_YES", "SearchBtn_Show_YES();", true);
        }
        protected void back_Menu_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OrderMenu.aspx");
        }
        protected void finalize_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finalize_Order.aspx");
        }
        protected void Add_To_Order()
        {
            var Product_id = GlobalVariables.JStoC_Product_ID;
            products = products.Select(Convert.ToInt32(Product_id));
            Response.Write("<script>alert('here is the results jimmy - " + products.product_name + " - " + products.product_id + " ' );</script>");
        }
        [WebMethod]
        public static string Add_To_Order(string ID_Array)
        {
            GlobalVariables.JStoC_Product_ID.Add(ID_Array);
            return ID_Array;
        }


    }
}