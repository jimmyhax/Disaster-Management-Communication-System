using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Mobile_ProductClass : System.Web.UI.Page
    {
        public Mobile_Product Mobile_Product = new Mobile_Product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Mobile_Product = Mobile_Product_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Mobile_Product = Mobile_Product_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Mobile_Product = Mobile_Product_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Mobile_Product Mobile_Product_selectForInsert(int ID)
        {
            Mobile_Product = Mobile_Product.Select(ID);
            Mobile_Unit_id_Insert_TextBox.Text = Convert.ToString(Mobile_Product.Mobile_Unit_id);
            Product_id_Insert_TextBox.Text = Convert.ToString(Mobile_Product.Product_id);
            Case_id_Insert_TextBox.Text = Convert.ToString(Mobile_Product.Case_id);
            Lot_id_Insert_TextBox.Text = Convert.ToString(Mobile_Product.Lot_id);
            Min_inv_Insert_TextBox.Text = Convert.ToString(Mobile_Product.Min_inv);
            Quantity_Insert_TextBox.Text = Convert.ToString(Mobile_Product.Quantity);
            Experiation_Date_Insert_TextBox.Text = Convert.ToString(Mobile_Product.Experiation_Date);
            return Mobile_Product;
        }
        public Mobile_Product Mobile_Product_selectForUpdate(int ID)
        {
            Mobile_Product = Mobile_Product.Select(ID);
            Mobile_Product_id_Update_TextBox.Text = Convert.ToString(Mobile_Product.Mobile_Product_id);
            Mobile_Unit_id_Update_TextBox.Text = Convert.ToString(Mobile_Product.Mobile_Unit_id);
            Product_id_Update_TextBox.Text = Convert.ToString(Mobile_Product.Product_id);
            Case_id_Update_TextBox.Text = Convert.ToString(Mobile_Product.Case_id);
            Lot_id_Update_TextBox.Text = Convert.ToString(Mobile_Product.Lot_id);
            Min_inv_Update_TextBox.Text = Convert.ToString(Mobile_Product.Min_inv);
            Quantity_Update_TextBox.Text = Convert.ToString(Mobile_Product.Quantity);
            Experiation_Date_Update_TextBox.Text = Convert.ToString(Mobile_Product.Experiation_Date);
            return Mobile_Product;
        }
        public Mobile_Product Mobile_Product_selectForDelete(int ID)
        {
            Mobile_Product = Mobile_Product.Select(ID);
            Mobile_Product_id_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Mobile_Product_id);
            Mobile_Unit_id_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Mobile_Unit_id);
            Product_id_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Product_id);
            Case_id_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Case_id);
            Lot_id_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Lot_id);
            Min_inv_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Min_inv);
            Quantity_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Quantity);
            Experiation_Date_Delete_TextBox.Text = Convert.ToString(Mobile_Product.Experiation_Date);
            return Mobile_Product;
        }
        //Database CRUD Call Functions
        public Mobile_Product Mobile_Product_insert()
        {
            Mobile_Product.Mobile_Unit_id = Convert.ToInt32(Mobile_Unit_id_Insert_TextBox.Text);
            Mobile_Product.Product_id = Convert.ToInt32(Product_id_Insert_TextBox.Text);
            Mobile_Product.Case_id = Convert.ToInt32(Case_id_Insert_TextBox.Text);
            Mobile_Product.Lot_id = Convert.ToInt32(Lot_id_Insert_TextBox.Text);
            Mobile_Product.Min_inv = Convert.ToInt32(Min_inv_Insert_TextBox.Text);
            Mobile_Product.Quantity = Convert.ToInt32(Quantity_Insert_TextBox.Text);
            Mobile_Product.Experiation_Date = Convert.ToDateTime(Experiation_Date_Insert_TextBox.Text);
            Mobile_Product = Mobile_Product.Insert(Mobile_Product);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Mobile_Product;
        }
        public Mobile_Product Mobile_Product_update(int ID)
        {
            Mobile_Product = Mobile_Product.Select(ID);
            Mobile_Product.Mobile_Product_id = Convert.ToInt32(Update_GridView.SelectedValue);
            Mobile_Product.Mobile_Unit_id = Convert.ToInt32(Mobile_Unit_id_Update_TextBox.Text);
            Mobile_Product.Product_id = Convert.ToInt32(Product_id_Update_TextBox.Text);
            Mobile_Product.Case_id = Convert.ToInt32(Case_id_Update_TextBox.Text);
            Mobile_Product.Lot_id = Convert.ToInt32(Lot_id_Update_TextBox.Text);
            Mobile_Product.Min_inv = Convert.ToInt32(Min_inv_Update_TextBox.Text);
            Mobile_Product.Quantity = Convert.ToInt32(Quantity_Update_TextBox.Text);
            Mobile_Product.Experiation_Date = Convert.ToDateTime(Experiation_Date_Update_TextBox.Text);
            Mobile_Product.Update(Mobile_Product);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Mobile_Product;
        }
        public void Mobile_Product_delete(int ID)
        {
            Mobile_Product.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Mobile_Product = Mobile_Product_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Mobile_Product = Mobile_Product_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Mobile_Product_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

