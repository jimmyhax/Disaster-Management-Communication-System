using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ShipmentClass : System.Web.UI.Page
    {
        public Shipment Shipment = new Shipment();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Shipment = Shipment_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Shipment = Shipment_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Shipment = Shipment_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Shipment Shipment_selectForInsert(int ID)
        {
            Shipment = Shipment.Select(ID);
            WarehouseID_Insert_TextBox.Text = Convert.ToString(Shipment.WarehouseID);
            Tracking_Num_Insert_TextBox.Text = Convert.ToString(Shipment.Tracking_Num);
            Ship_Method_Insert_TextBox.Text = Convert.ToString(Shipment.Ship_Method);
            Other_Insert_TextBox.Text = Convert.ToString(Shipment.Other);
            OrderRecByID_Insert_TextBox.Text = Convert.ToString(Shipment.OrderRecByID);
            FullOrderReceived_Insert_TextBox.Text = Convert.ToString(Shipment.FullOrderReceived);
            return Shipment;
        }
        public Shipment Shipment_selectForUpdate(int ID)
        {
            Shipment = Shipment.Select(ID);
            ShipmentID_Update_TextBox.Text = Convert.ToString(Shipment.ShipmentID);
            WarehouseID_Update_TextBox.Text = Convert.ToString(Shipment.WarehouseID);
            Tracking_Num_Update_TextBox.Text = Convert.ToString(Shipment.Tracking_Num);
            Ship_Method_Update_TextBox.Text = Convert.ToString(Shipment.Ship_Method);
            Other_Update_TextBox.Text = Convert.ToString(Shipment.Other);
            OrderRecByID_Update_TextBox.Text = Convert.ToString(Shipment.OrderRecByID);
            FullOrderReceived_Update_TextBox.Text = Convert.ToString(Shipment.FullOrderReceived);
            return Shipment;
        }
        public Shipment Shipment_selectForDelete(int ID)
        {
            Shipment = Shipment.Select(ID);
            ShipmentID_Delete_TextBox.Text = Convert.ToString(Shipment.ShipmentID);
            WarehouseID_Delete_TextBox.Text = Convert.ToString(Shipment.WarehouseID);
            Tracking_Num_Delete_TextBox.Text = Convert.ToString(Shipment.Tracking_Num);
            Ship_Method_Delete_TextBox.Text = Convert.ToString(Shipment.Ship_Method);
            Other_Delete_TextBox.Text = Convert.ToString(Shipment.Other);
            OrderRecByID_Delete_TextBox.Text = Convert.ToString(Shipment.OrderRecByID);
            FullOrderReceived_Delete_TextBox.Text = Convert.ToString(Shipment.FullOrderReceived);
            return Shipment;
        }
        //Database CRUD Call Functions
        public Shipment Shipment_insert()
        {
            Shipment.WarehouseID = Convert.ToInt32(WarehouseID_Insert_TextBox.Text);
            Shipment.Tracking_Num = Tracking_Num_Insert_TextBox.Text;
            Shipment.Ship_Method = Ship_Method_Insert_TextBox.Text;
            Shipment.Other = Other_Insert_TextBox.Text;
            Shipment.OrderRecByID = Convert.ToInt32(OrderRecByID_Insert_TextBox.Text);
            Shipment.FullOrderReceived = FullOrderReceived_Insert_TextBox.Text;
            Shipment = Shipment.Insert(Shipment);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Shipment;
        }
        public Shipment Shipment_update(int ID)
        {
            Shipment = Shipment.Select(ID);
            Shipment.ShipmentID = Convert.ToInt32(Update_GridView.SelectedValue);
            Shipment.WarehouseID = Convert.ToInt32(WarehouseID_Update_TextBox.Text);
            Shipment.Tracking_Num = Tracking_Num_Update_TextBox.Text;
            Shipment.Ship_Method = Ship_Method_Update_TextBox.Text;
            Shipment.Other = Other_Update_TextBox.Text;
            Shipment.OrderRecByID = Convert.ToInt32(OrderRecByID_Update_TextBox.Text);
            Shipment.FullOrderReceived = FullOrderReceived_Update_TextBox.Text;
            Shipment.Update(Shipment);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Shipment;
        }
        public void Shipment_delete(int ID)
        {
            Shipment.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Shipment = Shipment_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Shipment = Shipment_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Shipment_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

