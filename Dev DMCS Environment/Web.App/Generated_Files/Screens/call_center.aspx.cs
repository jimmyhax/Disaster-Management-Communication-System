using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class call_centerClass : System.Web.UI.Page
    {
        public call_center call_center = new call_center();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            call_center = call_center_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            call_center = call_center_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            call_center = call_center_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public call_center call_center_selectForInsert(int ID)
        {
            call_center = call_center.Select(ID);
            address_id_Insert_TextBox.Text = Convert.ToString(call_center.address_id);
            call_center_name_Insert_TextBox.Text = Convert.ToString(call_center.call_center_name);
            return call_center;
        }
        public call_center call_center_selectForUpdate(int ID)
        {
            call_center = call_center.Select(ID);
            call_center_id_Update_TextBox.Text = Convert.ToString(call_center.call_center_id);
            address_id_Update_TextBox.Text = Convert.ToString(call_center.address_id);
            call_center_name_Update_TextBox.Text = Convert.ToString(call_center.call_center_name);
            return call_center;
        }
        public call_center call_center_selectForDelete(int ID)
        {
            call_center = call_center.Select(ID);
            call_center_id_Delete_TextBox.Text = Convert.ToString(call_center.call_center_id);
            address_id_Delete_TextBox.Text = Convert.ToString(call_center.address_id);
            call_center_name_Delete_TextBox.Text = Convert.ToString(call_center.call_center_name);
            return call_center;
        }
        //Database CRUD Call Functions
        public call_center call_center_insert()
        {
            call_center.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            call_center.call_center_name = call_center_name_Insert_TextBox.Text;
            call_center = call_center.Insert(call_center);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return call_center;
        }
        public call_center call_center_update(int ID)
        {
            call_center = call_center.Select(ID);
            call_center.call_center_id = Convert.ToInt32(Update_GridView.SelectedValue);
            call_center.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            call_center.call_center_name = call_center_name_Update_TextBox.Text;
            call_center.Update(call_center);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return call_center;
        }
        public void call_center_delete(int ID)
        {
            call_center.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            call_center = call_center_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            call_center = call_center_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            call_center_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

