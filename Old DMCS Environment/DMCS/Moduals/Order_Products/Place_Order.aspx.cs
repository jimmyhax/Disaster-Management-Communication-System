using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMCS.Moduals.Order_Products
{
    public partial class Place_Order : System.Web.UI.Page
    {
        //finding client
        public person clientperson = new person();
        public client client = new client();
        public location Location = new location();
        public Mobile_Product Mobile_Product = new Mobile_Product();
        public resource Resource = new resource();
        public products products = new products();
        public warehouse_product_Location warehouse_product_location = new warehouse_product_Location();
        public warehouse selected_Warehouse = new warehouse();
        public warehouse warehouse = new warehouse();
        public address address = new address();
        public FEMA FEMA = new FEMA();
        public case_intake case_intake = new case_intake();
        public case_client case_client = new case_client();
        public call_center call_center = new call_center();
        public requestor requestor = new requestor();
        public requestor_Order requestor_Order = new requestor_Order();
        public Order_Product Order_Product = new Order_Product();
        public encounter encounter = new encounter();


        //Path defigners
        int finalAmount = 1;

        decimal Lat;
        decimal Long;

        string[] product_id_array;

        ArrayList EName = new ArrayList();
        ArrayList EType = new ArrayList();
        ArrayList EDescription = new ArrayList();

        List<int> checkWarehouseIDs = new List<int>();
        List<int> selectedWarehouseIDs = new List<int>();

        String NameOrderData;
        String TypeOrderData;
        String DescriptionOrderData;

        string callcenter_Address;





        DataTable DataTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {


            Choose_SearchByUserLocation_Click(sender, e);

            if (!IsPostBack)
            {


            }

            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);

            }




            if (Request.QueryString["Product_ID_Array"] != null)
            {
                
                product_id_array = Request.QueryString["Product_ID_Array"].Split(',');

                SelectedProduct_div.InnerHtml = "<table border='10', width=100%, borderColor='#00FF00'><tr><td style=\"padding: 5px 10px 5px 10px; background-color: #666666; font-size:large;\">Order Information:</td></tr></table>";
                int orderNumber = 0;
                // Loop over strings
                for (int i = 0; i < product_id_array.Length; i++)
                {

                    orderNumber++;

                    products = products.Select(Convert.ToInt32(product_id_array[i]));
                    warehouse_product_location = warehouse_product_location.Select_By_Product_ID(Convert.ToInt32(product_id_array[i]));
                    Location = Location.Select(warehouse_product_location.Location_ID);




                    Lat = Convert.ToDecimal(Location.n_lat);
                    Long = Convert.ToDecimal(Location.n_long);

                    passProduct_ID_hf.Value = Convert.ToString(products.FEMA_Description);




                    SelectedProduct_div.InnerHtml += "<Table border='2' width='100%' align ='center'><tr><td width='10%'>" + "<b><font color='black' size='3'>#" + orderNumber + "</b></font></td ><td width='90%' bgcolor='#333333' ></td></tr>" +
                    "<tr><td colspan='2'><b><font color='black'>Name: </b>" + products.product_name + "</td></tr>" +
                    "<tr><td colspan='2'><b><font color='black'>Type: </b>" + products.product_type + "</font></td></tr>" +
                    "<tr><td colspan='2'><b><font color='black'>Discription: </b>" + products.product_desc + "</font></td></tr>" +
                    "<tr><td colspan='2'><b><font color='black'>Lat/Long: </b>" + Lat + "/" + Long + "</font></td></tr>" +
                    "</td></tr></Table>";

                    EName.Add(products.product_name);
                    EType.Add(products.product_type);
                    EDescription.Add(products.product_desc);

                    //Page.ClientScript.RegisterStartupScript(this.GetType(),
                    //"showMap", "showMap("+ Lat +", " + Long + ");", true);
                }

            }
            else
            {
                //Response.Write("<script>alert('Your order does not exist; This instance has been loged and well be looked into.');</script>");
            }
        }

        public string grabMapMarkers()
        {
            if (passLat_hf.Value == "" && passLong_hf.Value == "")
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
                cmd.Parameters.Add("@dmlLat", SqlDbType.Decimal).Value = passLat_hf.Value;
                cmd.Parameters.Add("@dmlLng", SqlDbType.Decimal).Value = passLong_hf.Value;
                cmd.Parameters.Add("@intRadius", SqlDbType.Int).Value = ddlRadius.SelectedValue;

                cmd.Connection = con;
                try
                {
                    con.Open();

                    SqlDataAdapter DataAdapter = new SqlDataAdapter(cmd);
                    DataAdapter.Fill(DataTable);
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in DataTable.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in DataTable.Columns)
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


        ///////////////////////////////////////////

        public void searchByAddress_Click(object sender, EventArgs e)
        {

            if (passLat_hf.Value != "" && passLong_hf.Value != "")
            {
                if (txtSearchAddress.Text != "")
                {

                    //refreshWarehouse_ADD();
                    Page.ClientScript.RegisterStartupScript(this.GetType(),
                   "initialize", "initialize();", true);

                }
                else
                {
                    ERROR_txt.Text = "You must enter an address to search for a Warehouse.";
                }

            }
            else
            {
                ERROR_txt.Text = "You must enter an address and search for the location.";
            }
        }
        protected void searchByUserLocation_Click(object sender, EventArgs e)
        {

            if (passLat_hf.Value != "" && passLong_hf.Value != "")
            {

                // refreshWarehouse_ADD();
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                   "initialize", "initialize();", true);
            }
            else
            {
                ERROR_txt.Text = "Please enable location tracking in your browser or choose another search type.";
            }
        }
        ////////////////////////////////////////////
        // ||    // ||    // ||    // ||    // || //
        // ||    // ||    // ||    // ||    // || //
        // ||    // ||    // ||    // ||    // || //
        // ||    // ||    // ||    // ||    // || //
        // \/    // \/    // \/    // \/    // \/ //
        ////////////////////////////////////////////

        //search button click events
        protected void Choose_SearchByAddress_Click(object sender, EventArgs e)
        {

            searchByUserLocation_btn.Visible = true;
            searchByAddress_btn.Visible = false;

            Address_L.Visible = true;
            txtSearchAddress.Visible = true;

            Radius_L.Visible = true;
            ddlRadius.Visible = true;

            sByALocation.Visible = true;
            sByCLocation.Visible = false;




        }
        protected void Choose_SearchByUserLocation_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "click", "codeCurrentLocation();", true);

            searchByUserLocation_btn.Visible = false;
            searchByAddress_btn.Visible = true;

            Address_L.Visible = false;
            txtSearchAddress.Visible = false;

            Radius_L.Visible = true;
            ddlRadius.Visible = true;

            sByALocation.Visible = false;
            sByCLocation.Visible = true;




        }
        protected void ChangeSearchType_Click(object sender, EventArgs e)
        {
            searchByUserLocation_btn.Visible = true;
            searchByAddress_btn.Visible = true;

            Address_L.Visible = false;
            txtSearchAddress.Text = "";
            txtSearchAddress.Visible = false;

            Radius_L.Visible = false;
            ddlRadius.Visible = false;

            sByALocation.Visible = false;
            sByCLocation.Visible = false;


            passLat_hf.Value = "";
            passLong_hf.Value = "";



        }





        protected void AssignLocation_Click(object sender, EventArgs e)
        {
            if (product_id_array.Length == 0)
            {
                Response.Write("<script>alert('Can not contuinue with the order. No products have been selected.');</script>");
                return;
            }
            else
            {
                createEmail();
                createInvoicePreview();
                updateDatabase();
            }

        }

        protected void updateDatabase()
        {
            //product_id_array has all product ids
            call_center = call_center.Select(Convert.ToInt32(DDL_Call_Center.SelectedValue));
            selected_Warehouse = selected_Warehouse.Select(Convert.ToInt32(passWarehouseID_hf.Value));
            address = address.Select(selected_Warehouse.address_id);

            //case_intake
            case_intake = case_intake_insert();
            //encounter
            encounter = encounter_insert();
            //requestor
            requestor = requestor_insert();
            //requestor_Order
            requestor_Order = requestor_Order_insert();
            //Order_product
            Order_Product = Order_Product_insert();


        }
        protected void createEmail()
        {

            call_center = call_center.Select(Convert.ToInt32(DDL_Call_Center.SelectedValue));
            selected_Warehouse = selected_Warehouse.Select(Convert.ToInt32(passWarehouseID_hf.Value));
            address = address.Select(selected_Warehouse.address_id);
            //email
            callcenter_Address = call_center.call_center_name + "<br />" + "(219) 564 5567";// +address.str_add + "<br />" + address.city + " " + address.state + " " + address.zip_plus_four + "<br />" + "(219) 564 5567";

            NameOrderData = "<td colspan='1' width='10%' align='left' style='height: 87px'>" + "<b>Product Name: </b><br/><br/>";
            TypeOrderData = "<td colspan='1' width='10%' align='left' style='height: 87px'>" + "<b>Type: </b><br/><br/>";
            DescriptionOrderData = "<td colspan='1' width='10%' align='left' style='height: 87px'>" + "<b>Item Discription: </b><br/><br/>";

            for (int i = 0; i < EName.Count; i++)
            {
                NameOrderData += EName[i] + "<br/>";
                TypeOrderData += EType[i] + "<br/>";
                DescriptionOrderData += EDescription[i] + "<br/>";
            }

            NameOrderData += "</td>";
            TypeOrderData += "</td>";
            DescriptionOrderData += "</td>";

            var result = string.Join("|", EName.ToArray());

            var message = new MailMessage("jimmyjames177414@gmail.com", "jimmyjames177414@gmail.com");
            // here is an important part:

            message.Subject = result + " -Has just been assigned a new location";
            message.Body =
            "<Table><tr><tb><b><font size='3'>The following product has been assigned a new location:</b></font></td></tr></table>" +

            "<table id='Table1' width='100%' cellspacing='10' bgcolor='Silver'>" +
                        "<tr>" +
                            "<td colspan='12' align='left' style='border-style: none'>" +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td colspan='12' style='background-color: Gray' height='5px'>" + "</td>" +
                        "</tr>" +

                        "<tr>" +
                            "<td rowspan='3' align='left' valign='top'>" +
                                "<font size='6' color='red'>DMCS</font>" +
                                "<br />" +
                                "Disaster Management Communication System" +
                                "<br />" +
                                "<br />" +
                                "<b>This order was placed at: </b><br />" +
                                callcenter_Address +
                            "</td>" +
                            "<td align='right' style='font-size: x-large; color: #808080; font-family: 'Times New Roman'; font-weight: bold;'>" + "<b>INVOICE</b>" +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td>" +
                                "<br />" +
                                "<br />" +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td align='right' style='color: #000000'>" +
                                "<b>Invoice/Case/Order</b> #3" +
                                "<br />" +
                                Convert.ToString(System.DateTime.Now) +
                            "</td>" +
                        "</tr>" +

                    "</table>" +

                    "<table id='Table2' width='100%' cellspacing='10' bgcolor='Silver'>" +
                        "<tr>" +
                            "<td width='50%' align='left'>" +
                                "<b>Shipping To:</b>" + "<br />" +
                                "United States Steel Corporation" + "<br />" +
                                "1 Broadway" + "<br />" +
                                "Gary,IN" + "<br />" +
                                "(219) 888-2000" + "<br />" +
                            "</td>" +

                            "<td width='50%' align='left'>" +
                                "<b>Shiping From:</b>" + "<br />" +
                                selected_Warehouse.warehouse_name + "<br />" +
                                address.str_add + "<br />" +
                                address.city + " " + address.state + " " + address.zip_plus_four + "<br />" +
                                "(219) 564 5567" + "<br />" +

                            "</td>" +
                        "</tr>" +
                    "</table>" +

                    "<table id='Table7' width='100%' cellspacing='10' bgcolor='Silver'>" +
                        "<tr>" +
                            "<td colspan='10' width='100%' align='left'>" +
                                "<br />" +
                                "<b>ORDER:</b>" +
                            "<br />" +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                        "<tr>" +
                            "<td colspan='12' style='background-color: Gray' height='5px'>" + "</td>" +
                        "</tr>" +
                        "<tr>" +
                            NameOrderData +
                            TypeOrderData +
                            DescriptionOrderData +
                        "</tr>" +
                        "<tr>" +
                            "<td colspan='12' style='background-color: Gray' height='5px'>" + "</td>" +
                        "</tr>" +
                        "<tr>" +

                    "</table>" +
                "<table><tr><tb></td></tr>" +
                "<tr><tb><br/><br/><br/><br/>DO NOT RESPOND TO THIS MESSAGE." + "</td></tr>" +
                "<tr><tb>THIS WAS A AUTOMATED MESSAGE SENT FROM THE DMSC SERVERS. </td></tr></table>";

            //Set html to true! This allows for more then just a string with no breaks.
            message.IsBodyHtml = true;
            var client = new SmtpClient();
            client.EnableSsl = true;
            client.Send(message);
            /////////////////////////////////////////////////////// EMAIL SENT

        }
        protected void createInvoicePreview()
        {
            //create invoice preview


            final_invoice_div.Style.Add("display", "block");

            FINAL_to_Name_L.Text = selected_Warehouse.warehouse_name;
            FINAL_to_CompanyName_L.Text = selected_Warehouse.warehouse_name;
            FINAL_to_StreetAddress_L.Text = address.str_add;
            FINAL_to_CityStateZip_L.Text = address.city + " " + address.state + " " + address.zip_plus_four;

            FINAL_caseNumber_L.Text = "Case #/Order #: " + case_intake.case_id + " / " + requestor_Order.OrderID;
            FINAL_date_L.Text = Convert.ToString(DateTime.Now);


            for (int i = 0; i < product_id_array.Length; i++)
            {
                products = products.Select(Convert.ToInt32(product_id_array[i]));
                warehouse_product_location = warehouse_product_location.Select_By_Product_ID(products.product_id);
                warehouse = warehouse.Select(warehouse_product_location.warehouse_id);
                checkWarehouseIDs.Add(warehouse.warehouse_id);
                for (int j = 0; j < checkWarehouseIDs.Count; j++)
                {
                    if (warehouse.warehouse_id != checkWarehouseIDs[j] || checkWarehouseIDs.Count == 1)
                    {
                        selectedWarehouseIDs.Add(warehouse.warehouse_id);
                    }
                }

                int itemNum = i + 1;
                FINAL_orderNum_div.InnerHtml += itemNum + "<br/>";
                FINAL_ProductID_and_WarehouseID_div.InnerHtml += products.product_id + " / " + warehouse.warehouse_id + "<br/>";
                FINAL_orderQTY_div.InnerHtml += 1 + "<br/>";
                FINAL_orderDESCRIPTION_div.InnerHtml += products.product_name + "<br/>";

            }
            FINAL_from_Name_L.Text = "";
            FINAL_from_CompanyName_L.Text = "";
            FINAL_from_StreetAddress_L.Text = "";
            FINAL_from_CityStateZip_L.Text = "";
            for (int k = 0; k < selectedWarehouseIDs.Count; k++)
            {
                warehouse = warehouse.Select(selectedWarehouseIDs[k]);
                address = address.Select(warehouse.address_id);
                if (selectedWarehouseIDs[k] == selectedWarehouseIDs.Count - 1 && selectedWarehouseIDs.Count > 0)
                {
                    FINAL_from_Name_L.Text += selectedWarehouseIDs[k] + ": " + warehouse.warehouse_name + " | ";
                    FINAL_from_CompanyName_L.Text += selectedWarehouseIDs[k] + ": " + warehouse.warehouse_name + " | ";
                    FINAL_from_StreetAddress_L.Text += selectedWarehouseIDs[k] + ": " + address.str_add + " | ";
                    FINAL_from_CityStateZip_L.Text += selectedWarehouseIDs[k] + ": " + address.city + " " + address.state + " " + address.zip_plus_four + " | ";
                }
                else if (selectedWarehouseIDs[k] != selectedWarehouseIDs.Count - 1 && selectedWarehouseIDs.Count > 0)
                {
                    FINAL_from_Name_L.Text += selectedWarehouseIDs[k] + ": " + warehouse.warehouse_name;
                    FINAL_from_CompanyName_L.Text += selectedWarehouseIDs[k] + ": " + warehouse.warehouse_name;
                    FINAL_from_StreetAddress_L.Text += selectedWarehouseIDs[k] + ": " + address.str_add;
                    FINAL_from_CityStateZip_L.Text += selectedWarehouseIDs[k] + ": " + address.city + " " + address.state + " " + address.zip_plus_four;
                }
                else
                {
                    FINAL_from_Name_L.Text += warehouse.warehouse_name;
                    FINAL_from_CompanyName_L.Text += warehouse.warehouse_name;
                    FINAL_from_StreetAddress_L.Text += address.str_add;
                    FINAL_from_CityStateZip_L.Text += address.city + " " + address.state + " " + address.zip_plus_four;
                }
            }
            placeOrder_div.Style.Add("display", "none");

        }
        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Moduals/Order_Products/Order_Products.aspx");
        }
        protected void menuBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
        ////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////
        
        //database insert methods
        public case_intake case_intake_insert()
        {
            case_intake.applic_end_date_time = Convert.ToDateTime(9/9/9);//null
            case_intake.applic_start_date_time = DateTime.Now;
            case_intake.circum_emergency_event = "N/A";
            case_intake.circum_help_request_memo = "N/A";
            case_intake.circum_income_stolen = "N/A";
            case_intake.circum_memo = "Warehouse to warehouse order";
            case_intake.circum_no_income = "N/A";
            case_intake.circum_not_enough_income = "N/A";
            case_intake.agency_id = 0;//null
            case_intake.call_center_id = Convert.ToInt32(DDL_Call_Center.SelectedValue);
            case_intake = case_intake.Insert(case_intake);
            return case_intake;
        }
        public encounter encounter_insert()
        {
            encounter.case_id = case_intake.case_id;
            encounter.agency_id = 0;//null
            encounter.call_center_id = Convert.ToInt32(DDL_Call_Center.SelectedValue);
            encounter.client_id = 0;
            encounter.create_date = DateTime.Now;
            encounter.close_date = Convert.ToDateTime(9/9/9);//null
            encounter.disaster_id = Convert.ToInt32(DDL_Disaster.SelectedValue);
            encounter.Location_ID = 0;//null
            encounter.Pet_Record_ID = 0;//null
            encounter = encounter.Insert(encounter);
            return encounter;
        }
        public requestor requestor_insert()
        {
            requestor.EncounterID = encounter.encounter_id;
            requestor.Requestor_Type = "Warehouse";
            requestor.MobilUnitID = 0;//null
            requestor.PersonID = 0;//null
            requestor.AgencyID = 0;//null
            requestor = requestor.Insert(requestor);
            return requestor;
        }
        public requestor_Order requestor_Order_insert()
        {
            Random random = new Random();
            requestor_Order.Requestor_ID = requestor.RequestorID;
            requestor_Order.EncounterID = encounter.encounter_id;
            requestor_Order.OrderPriority = Convert.ToInt32(DDL_Priority_Lvl.SelectedValue);
            requestor_Order.OrderNum = random.Next(0, 100000000);
            requestor_Order.ShipToAddressID = address.address_id;
            requestor_Order.OrderDeliveryType = "Shipping";
            requestor_Order.OrderPickUpDate = Convert.ToDateTime(9/9/9);//null
            requestor_Order = requestor_Order.Insert(requestor_Order);
            return requestor_Order;
        }
        public Order_Product Order_Product_insert()
        {
            //loop through each product_id in the product_id_array and insert each time
            for (int i = 0; i < product_id_array.Length; i++)
            {
                warehouse_product_location = warehouse_product_location.Select_By_Product_ID(Convert.ToInt32(product_id_array[i]));
                warehouse = warehouse.Select(warehouse_product_location.warehouse_id);
                Order_Product.orderID = Convert.ToInt32(requestor_Order.OrderID);
                Order_Product.ProductID = Convert.ToInt32(product_id_array[i]);
                Order_Product.Quantity = 1;
                Order_Product.warehouseid = warehouse.warehouse_id;
                Order_Product.DatePicked = DateTime.Now;
                Order_Product.Qtypicked = 1;
                Order_Product = Order_Product.Insert(Order_Product);
            }
            return Order_Product;
        }

    }
}