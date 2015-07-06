using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMCS.App_Code;
using System.Data;
using System.Data.SqlClient;
namespace DMCS.Moduals.Warehouse_Inventory
{
    public partial class Warehouse_Inventory : System.Web.UI.Page
    {


        public products products = new products();
        public warehouse_product_Location warehouse_product_Location = new warehouse_product_Location();
        public warehouse warehouse = new warehouse();
        public address address = new address();


        DataTable dt = new DataTable();

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
            if (txtSearchAddress.Text != "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "click", "codeAddress();", true);
            }
        }



        ///////////////////////////////////////////

        public void searchByAddress_Click(object sender, EventArgs e)
        {

            if (SendLat.Text != "" && SendLng.Text != "")
            {
                if (txtSearchAddress.Text != "")
                {

                    //refreshWarehouse_ADD();
                    Page.ClientScript.RegisterStartupScript(this.GetType(),
                   "initialize", "initialize();", true);

                }
                else
                {
                    lbl_warehouse_Error_ADD.Text = "You must enter an address to search for a Warehouse.";
                }

            }
            else
            {
                lbl_warehouse_Error_ADD.Text = "You must enter an address and search for the location.";
            }
        }
        protected void searchByUserLocation_Click(object sender, EventArgs e)
        {

            if (SendLat.Text != "" && SendLng.Text != "")
            {

                // refreshWarehouse_ADD();
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                   "initialize", "initialize();", true);
            }
            else
            {
                lbl_warehouse_Error_ADD.Text = "Please enable location tracking in your browser or choose another search type.";
            }
        }
        ////////////////////////////////////////////
        // ||    // ||    // ||    // ||    // || //
        // ||    // ||    // ||    // ||    // || //
        // ||    // ||    // ||    // ||    // || //
        // ||    // ||    // ||    // ||    // || //
        // \/    // \/    // \/    // \/    // \/ //
        ////////////////////////////////////////////



        ///////////
        public string grabMapMarkers()
        {
            if (SendLat.Text == "" && SendLng.Text == "")
            {
                return null;
            }
            else
            {
                string ConnectionString = IDManager.connection();

                SqlConnection con = new SqlConnection(ConnectionString);


                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_DMCS_Location_Warehouse";
                cmd.Parameters.Add("@dmlLat", SqlDbType.Decimal).Value = SendLat.Text;
                cmd.Parameters.Add("@dmlLng", SqlDbType.Decimal).Value = SendLng.Text;
                cmd.Parameters.Add("@intRadius", SqlDbType.Int).Value = ddlRadius.SelectedValue;

                cmd.Connection = con;
                try
                {
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }
                    return serializer.Serialize(rows);

                }
                catch (Exception ex)
                {
                    throw ex;
                }


                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }
        }






        //search button click events
        protected void Choose_SearchByAddress_Click(object sender, EventArgs e)
        {
            searchByUserLocation_btn.Visible = false;
            ChangeSearchType_btn.Visible = true;
            searchByAddress_btn.Visible = false;

            Address_L.Visible = true;
            txtSearchAddress.Visible = true;

            Radius_L.Visible = true;
            ddlRadius.Visible = true;

            sByALocation.Visible = true;
            sByCLocation.Visible = false;

            Lat_L.Visible = true;
            SendLat.Visible = true;

            Long_L.Visible = true;
            SendLng.Visible = true;

            SelectViewStatus_L.Text = "Search for a warehouse to view it's contents ";
            view_btn.Visible = true;


        }
        protected void Choose_SearchByUserLocation_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "click", "codeCurrentLocation();", true);

            searchByUserLocation_btn.Visible = false;
            ChangeSearchType_btn.Visible = true;
            searchByAddress_btn.Visible = false;

            Address_L.Visible = false;
            txtSearchAddress.Visible = false;

            Radius_L.Visible = true;
            ddlRadius.Visible = true;

            sByALocation.Visible = false;
            sByCLocation.Visible = true;

            Lat_L.Visible = true;
            SendLat.Visible = true;

            Long_L.Visible = true;
            SendLng.Visible = true;

            SelectViewStatus_L.Text = "Search for a warehouse to view it's contents ";
            view_btn.Visible = true;



        }
        protected void ChangeSearchType_Click(object sender, EventArgs e)
        {
            searchByUserLocation_btn.Visible = true;
            ChangeSearchType_btn.Visible = false;
            searchByAddress_btn.Visible = true;

            Address_L.Visible = false;
            txtSearchAddress.Text = "";
            txtSearchAddress.Visible = false;

            Radius_L.Visible = false;
            ddlRadius.Visible = false;

            sByALocation.Visible = false;
            sByCLocation.Visible = false;

            Lat_L.Visible = false;
            SendLat.Visible = false;

            Long_L.Visible = false;
            SendLng.Visible = false;

            SendLat.Text = "";
            SendLng.Text = "";


            SelectViewStatus_L.Text = "";
            view_btn.Visible = false;




        }

        protected void view_btn_Click(object sender, EventArgs e)
        {



            ChooseCPL.ClientState = "true";
            ChooseCPL.Collapsed = true;
            ChooseCPL.CollapsedText = "Search For a Different Warehouse";
            warehouseViewInfoHead.Visible = true;
            warehouseViewInfoBody.Visible = true;
            warehouseInformation_L.Text = warehouseInformation_L_hf.Value;




            //sdsProductType.SelectCommand += "and warehouse_id = " + Convert.ToString(passWarehouseID_hf.Value);

            GlobalVariables.WarehouseID = Convert.ToInt32(passWarehouseID_hf.Value);
            warehouse = warehouse.Select(Convert.ToInt32(passWarehouseID_hf.Value));
            address = address.Select(warehouse.address_id);
            //warehouse_product_Location = warehouse_product_Location.Select()

            name_txt.Text = warehouse.warehouse_name.ToString();
            address_txt.Text = address.str_add.ToString() + "" + address.city.ToString() + ", " + address.state.ToString() + "" + address.zip_plus_four.ToString();
            type_txt.Text = warehouse.warehouse_type.ToString();
            int returnValue = getWarehouseProductQty(GlobalVariables.WarehouseID);
            amountOfResources_txt.Text = Convert.ToString(returnValue);


        }

        protected int getWarehouseProductQty(int returnValue)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT COUNT(*) FROM warehouse_product_Location where warehouse_id = " + Convert.ToString(passWarehouseID_hf.Value);
            cmd.Connection = con;
            con.Open();

            returnValue = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();
            return returnValue;
        }



        /////////////////////////////////////////////////////////////////view///////////////////////////////////////////////////////////////////////
        protected void gvResourceSearchresult_SelectedIndexChanged(object sender, EventArgs e)
        {

            warehouse_product_Location = warehouse_product_Location.Select(Convert.ToInt32(gvResourceSearchresult.SelectedDataKey.Value));


            refreshResourceList();
        }

        protected void gvResourceSearchresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvResourceSearchresult.PageIndex = e.NewPageIndex;
            refreshResourceList();
        }
        //refresh list of clients
        protected void refreshResourceList()
        {
            try
            {

                //String whereclause = "person_type='C' AND f_name LIKE '%" + txtfirstname.Text.Replace("'", "''") + "%' AND l_name LIKE '%" + txtlastname.Text.Replace("'", "''") + "%'";

                //gvResourceSearchresult.DataSource = clientperson.Select(whereclause);
                //gvResourceSearchresult.DataBind();


            }
            catch (Exception ex)
            {
                //lblSearchErrormsg_ADD.Text = "Error looking for client";
            }
        }





        protected void ProductSearch_btn_Click(object sender, EventArgs e)
        {
            try
            {
                String whereclause = "";

                ////Single searches

                //if (sMake_txt.Text != "" && sModel_txt.Text == "")
                //{
                //    whereclause = "Make LIKE '%" + sMake_txt.Text + "%'";
                //}
                //if (sMake_txt.Text == "" && sModel_txt.Text != "")
                //{
                //    whereclause = "Model LIKE '%" + sModel_txt.Text + "%'";
                //}
                ////double searches
                //if (sMake_txt.Text != "" && sModel_txt.Text != "")
                //{
                //    whereclause = "Model LIKE '%" + sModel_txt.Text + "%'" + " AND Model LIKE '%" + sModel_txt.Text + "%'";
                //}
                ////triple searches

                ////searches all fields



                gvResourceSearchresult.DataSource = warehouse_product_Location.SelectWProduct(whereclause);

                if (gvResourceSearchresult.DataSource == null)
                {
                    lbl_warehouse_Error_ADD.Text = "No products were found in the database given the current search variables.";
                }
                gvResourceSearchresult.DataBind();
            }
            catch (Exception ex)
            {
                lbl_warehouse_Error_ADD.Text = "Error looking for warehouse products";
            }
        }
    }
}