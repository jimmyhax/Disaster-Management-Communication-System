using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class warehouseClass : System.Web.UI.Page
    {
        public warehouse warehouse = new warehouse();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            warehouse = warehouse_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            warehouse = warehouse_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            warehouse = warehouse_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public warehouse warehouse_selectForInsert(int ID)
        {
            warehouse = warehouse.Select(ID);
            warehouse_name_Insert_TextBox.Text = Convert.ToString(warehouse.warehouse_name);
            address_id_Insert_TextBox.Text = Convert.ToString(warehouse.address_id);
            warehouse_type_Insert_TextBox.Text = Convert.ToString(warehouse.warehouse_type);
            Location_ID_Insert_TextBox.Text = Convert.ToString(warehouse.Location_ID);
            return warehouse;
        }
        public warehouse warehouse_selectForUpdate(int ID)
        {
            warehouse = warehouse.Select(ID);
            warehouse_id_Update_TextBox.Text = Convert.ToString(warehouse.warehouse_id);
            warehouse_name_Update_TextBox.Text = Convert.ToString(warehouse.warehouse_name);
            address_id_Update_TextBox.Text = Convert.ToString(warehouse.address_id);
            warehouse_type_Update_TextBox.Text = Convert.ToString(warehouse.warehouse_type);
            Location_ID_Update_TextBox.Text = Convert.ToString(warehouse.Location_ID);
            return warehouse;
        }
        public warehouse warehouse_selectForDelete(int ID)
        {
            warehouse = warehouse.Select(ID);
            warehouse_id_Delete_TextBox.Text = Convert.ToString(warehouse.warehouse_id);
            warehouse_name_Delete_TextBox.Text = Convert.ToString(warehouse.warehouse_name);
            address_id_Delete_TextBox.Text = Convert.ToString(warehouse.address_id);
            warehouse_type_Delete_TextBox.Text = Convert.ToString(warehouse.warehouse_type);
            Location_ID_Delete_TextBox.Text = Convert.ToString(warehouse.Location_ID);
            return warehouse;
        }
        //Database CRUD Call Functions
        public warehouse warehouse_insert()
        {
            warehouse.warehouse_name = warehouse_name_Insert_TextBox.Text;
            warehouse.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            warehouse.warehouse_type = warehouse_type_Insert_TextBox.Text;
            warehouse.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            warehouse = warehouse.Insert(warehouse);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return warehouse;
        }
        public warehouse warehouse_update(int ID)
        {
            warehouse = warehouse.Select(ID);
            warehouse.warehouse_id = Convert.ToInt32(Update_GridView.SelectedValue);
            warehouse.warehouse_name = warehouse_name_Update_TextBox.Text;
            warehouse.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            warehouse.warehouse_type = warehouse_type_Update_TextBox.Text;
            warehouse.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            warehouse.Update(warehouse);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return warehouse;
        }
        public void warehouse_delete(int ID)
        {
            warehouse.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            warehouse = warehouse_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            warehouse = warehouse_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            warehouse_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

