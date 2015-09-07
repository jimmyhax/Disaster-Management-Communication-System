using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class warehouse_product_LocationClass : System.Web.UI.Page
    {
        public warehouse_product_Location warehouse_product_Location = new warehouse_product_Location();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            warehouse_product_Location = warehouse_product_Location_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            warehouse_product_Location = warehouse_product_Location_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            warehouse_product_Location = warehouse_product_Location_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public warehouse_product_Location warehouse_product_Location_selectForInsert(int ID)
        {
            warehouse_product_Location = warehouse_product_Location.Select(ID);
            warehouse_id_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.warehouse_id);
            product_id_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.product_id);
            Location_ID_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.Location_ID);
            service_id_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.service_id);
            Time_Date_MIA_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.Time_Date_MIA);
            Experiation_Date_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.Experiation_Date);
            min_inv_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.min_inv);
            status_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.status);
            Exp_delivery_date_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.Exp_delivery_date);
            qty_onhand_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_onhand);
            qty_commit_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_commit);
            qty_order_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_order);
            encounter_id_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.encounter_id);
            address_id_Insert_TextBox.Text = Convert.ToString(warehouse_product_Location.address_id);
            return warehouse_product_Location;
        }
        public warehouse_product_Location warehouse_product_Location_selectForUpdate(int ID)
        {
            warehouse_product_Location = warehouse_product_Location.Select(ID);
            warehouse_product_location_id_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.warehouse_product_location_id);
            warehouse_id_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.warehouse_id);
            product_id_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.product_id);
            Location_ID_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.Location_ID);
            service_id_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.service_id);
            Time_Date_MIA_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.Time_Date_MIA);
            Experiation_Date_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.Experiation_Date);
            min_inv_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.min_inv);
            status_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.status);
            Exp_delivery_date_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.Exp_delivery_date);
            qty_onhand_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_onhand);
            qty_commit_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_commit);
            qty_order_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_order);
            encounter_id_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.encounter_id);
            address_id_Update_TextBox.Text = Convert.ToString(warehouse_product_Location.address_id);
            return warehouse_product_Location;
        }
        public warehouse_product_Location warehouse_product_Location_selectForDelete(int ID)
        {
            warehouse_product_Location = warehouse_product_Location.Select(ID);
            warehouse_product_location_id_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.warehouse_product_location_id);
            warehouse_id_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.warehouse_id);
            product_id_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.product_id);
            Location_ID_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.Location_ID);
            service_id_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.service_id);
            Time_Date_MIA_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.Time_Date_MIA);
            Experiation_Date_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.Experiation_Date);
            min_inv_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.min_inv);
            status_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.status);
            Exp_delivery_date_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.Exp_delivery_date);
            qty_onhand_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_onhand);
            qty_commit_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_commit);
            qty_order_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.qty_order);
            encounter_id_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.encounter_id);
            address_id_Delete_TextBox.Text = Convert.ToString(warehouse_product_Location.address_id);
            return warehouse_product_Location;
        }
        //Database CRUD Call Functions
        public warehouse_product_Location warehouse_product_Location_insert()
        {
            warehouse_product_Location.warehouse_id = Convert.ToInt32(warehouse_id_Insert_TextBox.Text);
            warehouse_product_Location.product_id = Convert.ToInt32(product_id_Insert_TextBox.Text);
            warehouse_product_Location.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            warehouse_product_Location.service_id = Convert.ToInt32(service_id_Insert_TextBox.Text);
            warehouse_product_Location.Time_Date_MIA = Convert.ToDateTime(Time_Date_MIA_Insert_TextBox.Text);
            warehouse_product_Location.Experiation_Date = Convert.ToDateTime(Experiation_Date_Insert_TextBox.Text);
            warehouse_product_Location.min_inv = Convert.ToInt32(min_inv_Insert_TextBox.Text);
            warehouse_product_Location.status = status_Insert_TextBox.Text;
            warehouse_product_Location.Exp_delivery_date = Convert.ToDateTime(Exp_delivery_date_Insert_TextBox.Text);
            warehouse_product_Location.qty_onhand = Convert.ToInt32(qty_onhand_Insert_TextBox.Text);
            warehouse_product_Location.qty_commit = Convert.ToInt32(qty_commit_Insert_TextBox.Text);
            warehouse_product_Location.qty_order = Convert.ToInt32(qty_order_Insert_TextBox.Text);
            warehouse_product_Location.encounter_id = Convert.ToInt32(encounter_id_Insert_TextBox.Text);
            warehouse_product_Location.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            warehouse_product_Location = warehouse_product_Location.Insert(warehouse_product_Location);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return warehouse_product_Location;
        }
        public warehouse_product_Location warehouse_product_Location_update(int ID)
        {
            warehouse_product_Location = warehouse_product_Location.Select(ID);
            warehouse_product_Location.warehouse_product_location_id = Convert.ToInt32(Update_GridView.SelectedValue);
            warehouse_product_Location.warehouse_id = Convert.ToInt32(warehouse_id_Update_TextBox.Text);
            warehouse_product_Location.product_id = Convert.ToInt32(product_id_Update_TextBox.Text);
            warehouse_product_Location.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            warehouse_product_Location.service_id = Convert.ToInt32(service_id_Update_TextBox.Text);
            warehouse_product_Location.Time_Date_MIA = Convert.ToDateTime(Time_Date_MIA_Update_TextBox.Text);
            warehouse_product_Location.Experiation_Date = Convert.ToDateTime(Experiation_Date_Update_TextBox.Text);
            warehouse_product_Location.min_inv = Convert.ToInt32(min_inv_Update_TextBox.Text);
            warehouse_product_Location.status = status_Update_TextBox.Text;
            warehouse_product_Location.Exp_delivery_date = Convert.ToDateTime(Exp_delivery_date_Update_TextBox.Text);
            warehouse_product_Location.qty_onhand = Convert.ToInt32(qty_onhand_Update_TextBox.Text);
            warehouse_product_Location.qty_commit = Convert.ToInt32(qty_commit_Update_TextBox.Text);
            warehouse_product_Location.qty_order = Convert.ToInt32(qty_order_Update_TextBox.Text);
            warehouse_product_Location.encounter_id = Convert.ToInt32(encounter_id_Update_TextBox.Text);
            warehouse_product_Location.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            warehouse_product_Location.Update(warehouse_product_Location);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return warehouse_product_Location;
        }
        public void warehouse_product_Location_delete(int ID)
        {
            warehouse_product_Location.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            warehouse_product_Location = warehouse_product_Location_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            warehouse_product_Location = warehouse_product_Location_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            warehouse_product_Location_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

