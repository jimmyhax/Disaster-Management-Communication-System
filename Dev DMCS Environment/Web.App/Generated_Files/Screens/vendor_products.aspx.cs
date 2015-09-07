using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class vendor_productsClass : System.Web.UI.Page
    {
        public vendor_products vendor_products = new vendor_products();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vendor_products = vendor_products_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vendor_products = vendor_products_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vendor_products = vendor_products_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public vendor_products vendor_products_selectForInsert(int ID)
        {
            vendor_products = vendor_products.Select(ID);
            vendor_id_Insert_TextBox.Text = Convert.ToString(vendor_products.vendor_id);
            product_id_Insert_TextBox.Text = Convert.ToString(vendor_products.product_id);
            product_qty_Insert_TextBox.Text = Convert.ToString(vendor_products.product_qty);
            Product_exp_date_Insert_TextBox.Text = Convert.ToString(vendor_products.Product_exp_date);
            lot_id_Insert_TextBox.Text = Convert.ToString(vendor_products.lot_id);
            Department_Insert_TextBox.Text = Convert.ToString(vendor_products.Department);
            return vendor_products;
        }
        public vendor_products vendor_products_selectForUpdate(int ID)
        {
            vendor_products = vendor_products.Select(ID);
            vendor_prod_id_Update_TextBox.Text = Convert.ToString(vendor_products.vendor_prod_id);
            vendor_id_Update_TextBox.Text = Convert.ToString(vendor_products.vendor_id);
            product_id_Update_TextBox.Text = Convert.ToString(vendor_products.product_id);
            product_qty_Update_TextBox.Text = Convert.ToString(vendor_products.product_qty);
            Product_exp_date_Update_TextBox.Text = Convert.ToString(vendor_products.Product_exp_date);
            lot_id_Update_TextBox.Text = Convert.ToString(vendor_products.lot_id);
            Department_Update_TextBox.Text = Convert.ToString(vendor_products.Department);
            return vendor_products;
        }
        public vendor_products vendor_products_selectForDelete(int ID)
        {
            vendor_products = vendor_products.Select(ID);
            vendor_prod_id_Delete_TextBox.Text = Convert.ToString(vendor_products.vendor_prod_id);
            vendor_id_Delete_TextBox.Text = Convert.ToString(vendor_products.vendor_id);
            product_id_Delete_TextBox.Text = Convert.ToString(vendor_products.product_id);
            product_qty_Delete_TextBox.Text = Convert.ToString(vendor_products.product_qty);
            Product_exp_date_Delete_TextBox.Text = Convert.ToString(vendor_products.Product_exp_date);
            lot_id_Delete_TextBox.Text = Convert.ToString(vendor_products.lot_id);
            Department_Delete_TextBox.Text = Convert.ToString(vendor_products.Department);
            return vendor_products;
        }
        //Database CRUD Call Functions
        public vendor_products vendor_products_insert()
        {
            vendor_products.vendor_id = Convert.ToInt32(vendor_id_Insert_TextBox.Text);
            vendor_products.product_id = Convert.ToInt32(product_id_Insert_TextBox.Text);
            vendor_products.product_qty = Convert.ToInt32(product_qty_Insert_TextBox.Text);
            vendor_products.Product_exp_date = Product_exp_date_Insert_TextBox.Text;
            vendor_products.lot_id = Convert.ToInt32(lot_id_Insert_TextBox.Text);
            vendor_products.Department = Department_Insert_TextBox.Text;
            vendor_products = vendor_products.Insert(vendor_products);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vendor_products;
        }
        public vendor_products vendor_products_update(int ID)
        {
            vendor_products = vendor_products.Select(ID);
            vendor_products.vendor_prod_id = Convert.ToInt32(Update_GridView.SelectedValue);
            vendor_products.vendor_id = Convert.ToInt32(vendor_id_Update_TextBox.Text);
            vendor_products.product_id = Convert.ToInt32(product_id_Update_TextBox.Text);
            vendor_products.product_qty = Convert.ToInt32(product_qty_Update_TextBox.Text);
            vendor_products.Product_exp_date = Product_exp_date_Update_TextBox.Text;
            vendor_products.lot_id = Convert.ToInt32(lot_id_Update_TextBox.Text);
            vendor_products.Department = Department_Update_TextBox.Text;
            vendor_products.Update(vendor_products);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vendor_products;
        }
        public void vendor_products_delete(int ID)
        {
            vendor_products.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            vendor_products = vendor_products_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            vendor_products = vendor_products_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            vendor_products_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

