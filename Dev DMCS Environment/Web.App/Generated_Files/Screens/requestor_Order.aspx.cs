using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class requestor_OrderClass : System.Web.UI.Page
    {
        public requestor_Order requestor_Order = new requestor_Order();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requestor_Order = requestor_Order_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requestor_Order = requestor_Order_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requestor_Order = requestor_Order_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public requestor_Order requestor_Order_selectForInsert(int ID)
        {
            requestor_Order = requestor_Order.Select(ID);
            Requestor_ID_Insert_TextBox.Text = Convert.ToString(requestor_Order.Requestor_ID);
            EncounterID_Insert_TextBox.Text = Convert.ToString(requestor_Order.EncounterID);
            OrderPriority_Insert_TextBox.Text = Convert.ToString(requestor_Order.OrderPriority);
            OrderNum_Insert_TextBox.Text = Convert.ToString(requestor_Order.OrderNum);
            ShipToAddressID_Insert_TextBox.Text = Convert.ToString(requestor_Order.ShipToAddressID);
            OrderDeliveryType_Insert_TextBox.Text = Convert.ToString(requestor_Order.OrderDeliveryType);
            OrderPickUpDate_Insert_TextBox.Text = Convert.ToString(requestor_Order.OrderPickUpDate);
            return requestor_Order;
        }
        public requestor_Order requestor_Order_selectForUpdate(int ID)
        {
            requestor_Order = requestor_Order.Select(ID);
            OrderID_Update_TextBox.Text = Convert.ToString(requestor_Order.OrderID);
            Requestor_ID_Update_TextBox.Text = Convert.ToString(requestor_Order.Requestor_ID);
            EncounterID_Update_TextBox.Text = Convert.ToString(requestor_Order.EncounterID);
            OrderPriority_Update_TextBox.Text = Convert.ToString(requestor_Order.OrderPriority);
            OrderNum_Update_TextBox.Text = Convert.ToString(requestor_Order.OrderNum);
            ShipToAddressID_Update_TextBox.Text = Convert.ToString(requestor_Order.ShipToAddressID);
            OrderDeliveryType_Update_TextBox.Text = Convert.ToString(requestor_Order.OrderDeliveryType);
            OrderPickUpDate_Update_TextBox.Text = Convert.ToString(requestor_Order.OrderPickUpDate);
            return requestor_Order;
        }
        public requestor_Order requestor_Order_selectForDelete(int ID)
        {
            requestor_Order = requestor_Order.Select(ID);
            OrderID_Delete_TextBox.Text = Convert.ToString(requestor_Order.OrderID);
            Requestor_ID_Delete_TextBox.Text = Convert.ToString(requestor_Order.Requestor_ID);
            EncounterID_Delete_TextBox.Text = Convert.ToString(requestor_Order.EncounterID);
            OrderPriority_Delete_TextBox.Text = Convert.ToString(requestor_Order.OrderPriority);
            OrderNum_Delete_TextBox.Text = Convert.ToString(requestor_Order.OrderNum);
            ShipToAddressID_Delete_TextBox.Text = Convert.ToString(requestor_Order.ShipToAddressID);
            OrderDeliveryType_Delete_TextBox.Text = Convert.ToString(requestor_Order.OrderDeliveryType);
            OrderPickUpDate_Delete_TextBox.Text = Convert.ToString(requestor_Order.OrderPickUpDate);
            return requestor_Order;
        }
        //Database CRUD Call Functions
        public requestor_Order requestor_Order_insert()
        {
            requestor_Order.Requestor_ID = Convert.ToInt32(Requestor_ID_Insert_TextBox.Text);
            requestor_Order.EncounterID = Convert.ToInt32(EncounterID_Insert_TextBox.Text);
            requestor_Order.OrderPriority = Convert.ToInt32(OrderPriority_Insert_TextBox.Text);
            requestor_Order.OrderNum = Convert.ToInt32(OrderNum_Insert_TextBox.Text);
            requestor_Order.ShipToAddressID = Convert.ToInt32(ShipToAddressID_Insert_TextBox.Text);
            requestor_Order.OrderDeliveryType = OrderDeliveryType_Insert_TextBox.Text;
            requestor_Order.OrderPickUpDate = Convert.ToDateTime(OrderPickUpDate_Insert_TextBox.Text);
            requestor_Order = requestor_Order.Insert(requestor_Order);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return requestor_Order;
        }
        public requestor_Order requestor_Order_update(int ID)
        {
            requestor_Order = requestor_Order.Select(ID);
            requestor_Order.OrderID = Convert.ToInt32(Update_GridView.SelectedValue);
            requestor_Order.Requestor_ID = Convert.ToInt32(Requestor_ID_Update_TextBox.Text);
            requestor_Order.EncounterID = Convert.ToInt32(EncounterID_Update_TextBox.Text);
            requestor_Order.OrderPriority = Convert.ToInt32(OrderPriority_Update_TextBox.Text);
            requestor_Order.OrderNum = Convert.ToInt32(OrderNum_Update_TextBox.Text);
            requestor_Order.ShipToAddressID = Convert.ToInt32(ShipToAddressID_Update_TextBox.Text);
            requestor_Order.OrderDeliveryType = OrderDeliveryType_Update_TextBox.Text;
            requestor_Order.OrderPickUpDate = Convert.ToDateTime(OrderPickUpDate_Update_TextBox.Text);
            requestor_Order.Update(requestor_Order);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return requestor_Order;
        }
        public void requestor_Order_delete(int ID)
        {
            requestor_Order.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            requestor_Order = requestor_Order_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            requestor_Order = requestor_Order_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            requestor_Order_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

