using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class foodClass : System.Web.UI.Page
    {
        public food food = new food();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            food = food_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            food = food_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            food = food_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public food food_selectForInsert(int ID)
        {
            food = food.Select(ID);
            clients_served_Insert_TextBox.Text = Convert.ToString(food.clients_served);
            food_voucher_number_Insert_TextBox.Text = Convert.ToString(food.food_voucher_number);
            date_issued_Insert_TextBox.Text = Convert.ToString(food.date_issued);
            Product_id_Insert_TextBox.Text = Convert.ToString(food.Product_id);
            return food;
        }
        public food food_selectForUpdate(int ID)
        {
            food = food.Select(ID);
            food_voucher_id_Update_TextBox.Text = Convert.ToString(food.food_voucher_id);
            clients_served_Update_TextBox.Text = Convert.ToString(food.clients_served);
            food_voucher_number_Update_TextBox.Text = Convert.ToString(food.food_voucher_number);
            date_issued_Update_TextBox.Text = Convert.ToString(food.date_issued);
            Product_id_Update_TextBox.Text = Convert.ToString(food.Product_id);
            return food;
        }
        public food food_selectForDelete(int ID)
        {
            food = food.Select(ID);
            food_voucher_id_Delete_TextBox.Text = Convert.ToString(food.food_voucher_id);
            clients_served_Delete_TextBox.Text = Convert.ToString(food.clients_served);
            food_voucher_number_Delete_TextBox.Text = Convert.ToString(food.food_voucher_number);
            date_issued_Delete_TextBox.Text = Convert.ToString(food.date_issued);
            Product_id_Delete_TextBox.Text = Convert.ToString(food.Product_id);
            return food;
        }
        //Database CRUD Call Functions
        public food food_insert()
        {
            food.clients_served = Convert.ToInt32(clients_served_Insert_TextBox.Text);
            food.food_voucher_number = Convert.ToInt32(food_voucher_number_Insert_TextBox.Text);
            food.date_issued = Convert.ToDateTime(date_issued_Insert_TextBox.Text);
            food.Product_id = Convert.ToInt32(Product_id_Insert_TextBox.Text);
            food = food.Insert(food);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return food;
        }
        public food food_update(int ID)
        {
            food = food.Select(ID);
            food.food_voucher_id = Convert.ToInt32(Update_GridView.SelectedValue);
            food.clients_served = Convert.ToInt32(clients_served_Update_TextBox.Text);
            food.food_voucher_number = Convert.ToInt32(food_voucher_number_Update_TextBox.Text);
            food.date_issued = Convert.ToDateTime(date_issued_Update_TextBox.Text);
            food.Product_id = Convert.ToInt32(Product_id_Update_TextBox.Text);
            food.Update(food);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return food;
        }
        public void food_delete(int ID)
        {
            food.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            food = food_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            food = food_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            food_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

