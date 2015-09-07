using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class lotClass : System.Web.UI.Page
    {
        public lot lot = new lot();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            lot = lot_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            lot = lot_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            lot = lot_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public lot lot_selectForInsert(int ID)
        {
            lot = lot.Select(ID);
            product_id_Insert_TextBox.Text = Convert.ToString(lot.product_id);
            manufactured_date_Insert_TextBox.Text = Convert.ToString(lot.manufactured_date);
            expiration_date_Insert_TextBox.Text = Convert.ToString(lot.expiration_date);
            manufacture_name_Insert_TextBox.Text = Convert.ToString(lot.manufacture_name);
            return lot;
        }
        public lot lot_selectForUpdate(int ID)
        {
            lot = lot.Select(ID);
            lot_id_Update_TextBox.Text = Convert.ToString(lot.lot_id);
            product_id_Update_TextBox.Text = Convert.ToString(lot.product_id);
            manufactured_date_Update_TextBox.Text = Convert.ToString(lot.manufactured_date);
            expiration_date_Update_TextBox.Text = Convert.ToString(lot.expiration_date);
            manufacture_name_Update_TextBox.Text = Convert.ToString(lot.manufacture_name);
            return lot;
        }
        public lot lot_selectForDelete(int ID)
        {
            lot = lot.Select(ID);
            lot_id_Delete_TextBox.Text = Convert.ToString(lot.lot_id);
            product_id_Delete_TextBox.Text = Convert.ToString(lot.product_id);
            manufactured_date_Delete_TextBox.Text = Convert.ToString(lot.manufactured_date);
            expiration_date_Delete_TextBox.Text = Convert.ToString(lot.expiration_date);
            manufacture_name_Delete_TextBox.Text = Convert.ToString(lot.manufacture_name);
            return lot;
        }
        //Database CRUD Call Functions
        public lot lot_insert()
        {
            lot.product_id = Convert.ToInt32(product_id_Insert_TextBox.Text);
            lot.manufactured_date = Convert.ToDateTime(manufactured_date_Insert_TextBox.Text);
            lot.expiration_date = Convert.ToDateTime(expiration_date_Insert_TextBox.Text);
            lot.manufacture_name = manufacture_name_Insert_TextBox.Text;
            lot = lot.Insert(lot);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return lot;
        }
        public lot lot_update(int ID)
        {
            lot = lot.Select(ID);
            lot.lot_id = Convert.ToInt32(Update_GridView.SelectedValue);
            lot.product_id = Convert.ToInt32(product_id_Update_TextBox.Text);
            lot.manufactured_date = Convert.ToDateTime(manufactured_date_Update_TextBox.Text);
            lot.expiration_date = Convert.ToDateTime(expiration_date_Update_TextBox.Text);
            lot.manufacture_name = manufacture_name_Update_TextBox.Text;
            lot.Update(lot);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return lot;
        }
        public void lot_delete(int ID)
        {
            lot.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            lot = lot_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            lot = lot_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            lot_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

