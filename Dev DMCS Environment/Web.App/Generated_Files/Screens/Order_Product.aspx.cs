using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Order_ProductClass : System.Web.UI.Page
    {
        public Order_Product Order_Product = new Order_Product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Order_Product = Order_Product_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Order_Product = Order_Product_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Order_Product = Order_Product_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Order_Product Order_Product_selectForInsert(int ID)
        {
            Order_Product = Order_Product.Select(ID);
            orderID_Insert_TextBox.Text = Convert.ToString(Order_Product.orderID);
            ProductID_Insert_TextBox.Text = Convert.ToString(Order_Product.ProductID);
            Quantity_Insert_TextBox.Text = Convert.ToString(Order_Product.Quantity);
            warehouseid_Insert_TextBox.Text = Convert.ToString(Order_Product.warehouseid);
            DatePicked_Insert_TextBox.Text = Convert.ToString(Order_Product.DatePicked);
            Qtypicked_Insert_TextBox.Text = Convert.ToString(Order_Product.Qtypicked);
            return Order_Product;
        }
        public Order_Product Order_Product_selectForUpdate(int ID)
        {
            Order_Product = Order_Product.Select(ID);
            order_Product_ID_Update_TextBox.Text = Convert.ToString(Order_Product.order_Product_ID);
            orderID_Update_TextBox.Text = Convert.ToString(Order_Product.orderID);
            ProductID_Update_TextBox.Text = Convert.ToString(Order_Product.ProductID);
            Quantity_Update_TextBox.Text = Convert.ToString(Order_Product.Quantity);
            warehouseid_Update_TextBox.Text = Convert.ToString(Order_Product.warehouseid);
            DatePicked_Update_TextBox.Text = Convert.ToString(Order_Product.DatePicked);
            Qtypicked_Update_TextBox.Text = Convert.ToString(Order_Product.Qtypicked);
            return Order_Product;
        }
        public Order_Product Order_Product_selectForDelete(int ID)
        {
            Order_Product = Order_Product.Select(ID);
            order_Product_ID_Delete_TextBox.Text = Convert.ToString(Order_Product.order_Product_ID);
            orderID_Delete_TextBox.Text = Convert.ToString(Order_Product.orderID);
            ProductID_Delete_TextBox.Text = Convert.ToString(Order_Product.ProductID);
            Quantity_Delete_TextBox.Text = Convert.ToString(Order_Product.Quantity);
            warehouseid_Delete_TextBox.Text = Convert.ToString(Order_Product.warehouseid);
            DatePicked_Delete_TextBox.Text = Convert.ToString(Order_Product.DatePicked);
            Qtypicked_Delete_TextBox.Text = Convert.ToString(Order_Product.Qtypicked);
            return Order_Product;
        }
        //Database CRUD Call Functions
        public Order_Product Order_Product_insert()
        {
            Order_Product.orderID = Convert.ToInt32(orderID_Insert_TextBox.Text);
            Order_Product.ProductID = Convert.ToInt32(ProductID_Insert_TextBox.Text);
            Order_Product.Quantity = Convert.ToInt32(Quantity_Insert_TextBox.Text);
            Order_Product.warehouseid = Convert.ToInt32(warehouseid_Insert_TextBox.Text);
            Order_Product.DatePicked = Convert.ToDateTime(DatePicked_Insert_TextBox.Text);
            Order_Product.Qtypicked = Convert.ToInt32(Qtypicked_Insert_TextBox.Text);
            Order_Product = Order_Product.Insert(Order_Product);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Order_Product;
        }
        public Order_Product Order_Product_update(int ID)
        {
            Order_Product = Order_Product.Select(ID);
            Order_Product.order_Product_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Order_Product.orderID = Convert.ToInt32(orderID_Update_TextBox.Text);
            Order_Product.ProductID = Convert.ToInt32(ProductID_Update_TextBox.Text);
            Order_Product.Quantity = Convert.ToInt32(Quantity_Update_TextBox.Text);
            Order_Product.warehouseid = Convert.ToInt32(warehouseid_Update_TextBox.Text);
            Order_Product.DatePicked = Convert.ToDateTime(DatePicked_Update_TextBox.Text);
            Order_Product.Qtypicked = Convert.ToInt32(Qtypicked_Update_TextBox.Text);
            Order_Product.Update(Order_Product);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Order_Product;
        }
        public void Order_Product_delete(int ID)
        {
            Order_Product.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Order_Product = Order_Product_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Order_Product = Order_Product_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Order_Product_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

