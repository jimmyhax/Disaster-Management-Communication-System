using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Donor_ProductClass : System.Web.UI.Page
    {
        public Donor_Product Donor_Product = new Donor_Product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Donor_Product = Donor_Product_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Donor_Product = Donor_Product_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Donor_Product = Donor_Product_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Donor_Product Donor_Product_selectForInsert(int ID)
        {
            Donor_Product = Donor_Product.Select(ID);
            DonorID_Insert_TextBox.Text = Convert.ToString(Donor_Product.DonorID);
            ProductID_Insert_TextBox.Text = Convert.ToString(Donor_Product.ProductID);
            quantity_Insert_TextBox.Text = Convert.ToString(Donor_Product.quantity);
            other_info_Insert_TextBox.Text = Convert.ToString(Donor_Product.other_info);
            Product_rec_date_Insert_TextBox.Text = Convert.ToString(Donor_Product.Product_rec_date);
            AmountOfProdDonated_Insert_TextBox.Text = Convert.ToString(Donor_Product.AmountOfProdDonated);
            return Donor_Product;
        }
        public Donor_Product Donor_Product_selectForUpdate(int ID)
        {
            Donor_Product = Donor_Product.Select(ID);
            DonorProductID_Update_TextBox.Text = Convert.ToString(Donor_Product.DonorProductID);
            DonorID_Update_TextBox.Text = Convert.ToString(Donor_Product.DonorID);
            ProductID_Update_TextBox.Text = Convert.ToString(Donor_Product.ProductID);
            quantity_Update_TextBox.Text = Convert.ToString(Donor_Product.quantity);
            other_info_Update_TextBox.Text = Convert.ToString(Donor_Product.other_info);
            Product_rec_date_Update_TextBox.Text = Convert.ToString(Donor_Product.Product_rec_date);
            AmountOfProdDonated_Update_TextBox.Text = Convert.ToString(Donor_Product.AmountOfProdDonated);
            return Donor_Product;
        }
        public Donor_Product Donor_Product_selectForDelete(int ID)
        {
            Donor_Product = Donor_Product.Select(ID);
            DonorProductID_Delete_TextBox.Text = Convert.ToString(Donor_Product.DonorProductID);
            DonorID_Delete_TextBox.Text = Convert.ToString(Donor_Product.DonorID);
            ProductID_Delete_TextBox.Text = Convert.ToString(Donor_Product.ProductID);
            quantity_Delete_TextBox.Text = Convert.ToString(Donor_Product.quantity);
            other_info_Delete_TextBox.Text = Convert.ToString(Donor_Product.other_info);
            Product_rec_date_Delete_TextBox.Text = Convert.ToString(Donor_Product.Product_rec_date);
            AmountOfProdDonated_Delete_TextBox.Text = Convert.ToString(Donor_Product.AmountOfProdDonated);
            return Donor_Product;
        }
        //Database CRUD Call Functions
        public Donor_Product Donor_Product_insert()
        {
            Donor_Product.DonorID = Convert.ToInt32(DonorID_Insert_TextBox.Text);
            Donor_Product.ProductID = Convert.ToInt32(ProductID_Insert_TextBox.Text);
            Donor_Product.quantity = Convert.ToInt32(quantity_Insert_TextBox.Text);
            Donor_Product.other_info = other_info_Insert_TextBox.Text;
            Donor_Product.Product_rec_date = Convert.ToDateTime(Product_rec_date_Insert_TextBox.Text);
            Donor_Product.AmountOfProdDonated = AmountOfProdDonated_Insert_TextBox.Text;
            Donor_Product = Donor_Product.Insert(Donor_Product);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Donor_Product;
        }
        public Donor_Product Donor_Product_update(int ID)
        {
            Donor_Product = Donor_Product.Select(ID);
            Donor_Product.DonorProductID = Convert.ToInt32(Update_GridView.SelectedValue);
            Donor_Product.DonorID = Convert.ToInt32(DonorID_Update_TextBox.Text);
            Donor_Product.ProductID = Convert.ToInt32(ProductID_Update_TextBox.Text);
            Donor_Product.quantity = Convert.ToInt32(quantity_Update_TextBox.Text);
            Donor_Product.other_info = other_info_Update_TextBox.Text;
            Donor_Product.Product_rec_date = Convert.ToDateTime(Product_rec_date_Update_TextBox.Text);
            Donor_Product.AmountOfProdDonated = AmountOfProdDonated_Update_TextBox.Text;
            Donor_Product.Update(Donor_Product);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Donor_Product;
        }
        public void Donor_Product_delete(int ID)
        {
            Donor_Product.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Donor_Product = Donor_Product_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Donor_Product = Donor_Product_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Donor_Product_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

