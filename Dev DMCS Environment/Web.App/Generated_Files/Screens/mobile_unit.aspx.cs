using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class mobile_unitClass : System.Web.UI.Page
    {
        public mobile_unit mobile_unit = new mobile_unit();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            mobile_unit = mobile_unit_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            mobile_unit = mobile_unit_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            mobile_unit = mobile_unit_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public mobile_unit mobile_unit_selectForInsert(int ID)
        {
            mobile_unit = mobile_unit.Select(ID);
            vehicle_id_Insert_TextBox.Text = Convert.ToString(mobile_unit.vehicle_id);
            mobile_desc_Insert_TextBox.Text = Convert.ToString(mobile_unit.mobile_desc);
            call_center_id_Insert_TextBox.Text = Convert.ToString(mobile_unit.call_center_id);
            return mobile_unit;
        }
        public mobile_unit mobile_unit_selectForUpdate(int ID)
        {
            mobile_unit = mobile_unit.Select(ID);
            mobile_unit_id_Update_TextBox.Text = Convert.ToString(mobile_unit.mobile_unit_id);
            vehicle_id_Update_TextBox.Text = Convert.ToString(mobile_unit.vehicle_id);
            mobile_desc_Update_TextBox.Text = Convert.ToString(mobile_unit.mobile_desc);
            call_center_id_Update_TextBox.Text = Convert.ToString(mobile_unit.call_center_id);
            return mobile_unit;
        }
        public mobile_unit mobile_unit_selectForDelete(int ID)
        {
            mobile_unit = mobile_unit.Select(ID);
            mobile_unit_id_Delete_TextBox.Text = Convert.ToString(mobile_unit.mobile_unit_id);
            vehicle_id_Delete_TextBox.Text = Convert.ToString(mobile_unit.vehicle_id);
            mobile_desc_Delete_TextBox.Text = Convert.ToString(mobile_unit.mobile_desc);
            call_center_id_Delete_TextBox.Text = Convert.ToString(mobile_unit.call_center_id);
            return mobile_unit;
        }
        //Database CRUD Call Functions
        public mobile_unit mobile_unit_insert()
        {
            mobile_unit.vehicle_id = Convert.ToInt32(vehicle_id_Insert_TextBox.Text);
            mobile_unit.mobile_desc = mobile_desc_Insert_TextBox.Text;
            mobile_unit.call_center_id = Convert.ToInt32(call_center_id_Insert_TextBox.Text);
            mobile_unit = mobile_unit.Insert(mobile_unit);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return mobile_unit;
        }
        public mobile_unit mobile_unit_update(int ID)
        {
            mobile_unit = mobile_unit.Select(ID);
            mobile_unit.mobile_unit_id = Convert.ToInt32(Update_GridView.SelectedValue);
            mobile_unit.vehicle_id = Convert.ToInt32(vehicle_id_Update_TextBox.Text);
            mobile_unit.mobile_desc = mobile_desc_Update_TextBox.Text;
            mobile_unit.call_center_id = Convert.ToInt32(call_center_id_Update_TextBox.Text);
            mobile_unit.Update(mobile_unit);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return mobile_unit;
        }
        public void mobile_unit_delete(int ID)
        {
            mobile_unit.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            mobile_unit = mobile_unit_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            mobile_unit = mobile_unit_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            mobile_unit_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

