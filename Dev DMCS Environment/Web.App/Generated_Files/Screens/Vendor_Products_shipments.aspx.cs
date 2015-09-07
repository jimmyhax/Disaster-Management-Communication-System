using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Vendor_Products_shipmentsClass : System.Web.UI.Page
    {
        public Vendor_Products_shipments Vendor_Products_shipments = new Vendor_Products_shipments();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Vendor_Products_shipments = Vendor_Products_shipments_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Vendor_Products_shipments = Vendor_Products_shipments_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Vendor_Products_shipments = Vendor_Products_shipments_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Vendor_Products_shipments Vendor_Products_shipments_selectForInsert(int ID)
        {
            Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
            ShipmentID_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.ShipmentID);
            VendorID_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.VendorID);
            ProductID_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.ProductID);
            Expect_Delivery_Date_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.Expect_Delivery_Date);
            orderdate_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.orderdate);
            quantity_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.quantity);
            OtherInfo_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.OtherInfo);
            DateReceived_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.DateReceived);
            AmountReceived_Insert_TextBox.Text = Convert.ToString(Vendor_Products_shipments.AmountReceived);
            return Vendor_Products_shipments;
        }
        public Vendor_Products_shipments Vendor_Products_shipments_selectForUpdate(int ID)
        {
            Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
            PO_Order_no_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.PO_Order_no);
            ShipmentID_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.ShipmentID);
            VendorID_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.VendorID);
            ProductID_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.ProductID);
            Expect_Delivery_Date_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.Expect_Delivery_Date);
            orderdate_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.orderdate);
            quantity_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.quantity);
            OtherInfo_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.OtherInfo);
            DateReceived_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.DateReceived);
            AmountReceived_Update_TextBox.Text = Convert.ToString(Vendor_Products_shipments.AmountReceived);
            return Vendor_Products_shipments;
        }
        public Vendor_Products_shipments Vendor_Products_shipments_selectForDelete(int ID)
        {
            Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
            PO_Order_no_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.PO_Order_no);
            ShipmentID_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.ShipmentID);
            VendorID_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.VendorID);
            ProductID_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.ProductID);
            Expect_Delivery_Date_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.Expect_Delivery_Date);
            orderdate_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.orderdate);
            quantity_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.quantity);
            OtherInfo_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.OtherInfo);
            DateReceived_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.DateReceived);
            AmountReceived_Delete_TextBox.Text = Convert.ToString(Vendor_Products_shipments.AmountReceived);
            return Vendor_Products_shipments;
        }
        //Database CRUD Call Functions
        public Vendor_Products_shipments Vendor_Products_shipments_insert()
        {
            Vendor_Products_shipments.ShipmentID = Convert.ToInt32(ShipmentID_Insert_TextBox.Text);
            Vendor_Products_shipments.VendorID = Convert.ToInt32(VendorID_Insert_TextBox.Text);
            Vendor_Products_shipments.ProductID = Convert.ToInt32(ProductID_Insert_TextBox.Text);
            Vendor_Products_shipments.Expect_Delivery_Date = Convert.ToDateTime(Expect_Delivery_Date_Insert_TextBox.Text);
            Vendor_Products_shipments.orderdate = Convert.ToDateTime(orderdate_Insert_TextBox.Text);
            Vendor_Products_shipments.quantity = Convert.ToInt32(quantity_Insert_TextBox.Text);
            Vendor_Products_shipments.OtherInfo = OtherInfo_Insert_TextBox.Text;
            Vendor_Products_shipments.DateReceived = Convert.ToDateTime(DateReceived_Insert_TextBox.Text);
            Vendor_Products_shipments.AmountReceived = Convert.ToInt32(AmountReceived_Insert_TextBox.Text);
            Vendor_Products_shipments = Vendor_Products_shipments.Insert(Vendor_Products_shipments);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Vendor_Products_shipments;
        }
        public Vendor_Products_shipments Vendor_Products_shipments_update(int ID)
        {
            Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
            Vendor_Products_shipments.PO_Order_no = Convert.ToInt32(Update_GridView.SelectedValue);
            Vendor_Products_shipments.ShipmentID = Convert.ToInt32(ShipmentID_Update_TextBox.Text);
            Vendor_Products_shipments.VendorID = Convert.ToInt32(VendorID_Update_TextBox.Text);
            Vendor_Products_shipments.ProductID = Convert.ToInt32(ProductID_Update_TextBox.Text);
            Vendor_Products_shipments.Expect_Delivery_Date = Convert.ToDateTime(Expect_Delivery_Date_Update_TextBox.Text);
            Vendor_Products_shipments.orderdate = Convert.ToDateTime(orderdate_Update_TextBox.Text);
            Vendor_Products_shipments.quantity = Convert.ToInt32(quantity_Update_TextBox.Text);
            Vendor_Products_shipments.OtherInfo = OtherInfo_Update_TextBox.Text;
            Vendor_Products_shipments.DateReceived = Convert.ToDateTime(DateReceived_Update_TextBox.Text);
            Vendor_Products_shipments.AmountReceived = Convert.ToInt32(AmountReceived_Update_TextBox.Text);
            Vendor_Products_shipments.Update(Vendor_Products_shipments);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Vendor_Products_shipments;
        }
        public void Vendor_Products_shipments_delete(int ID)
        {
            Vendor_Products_shipments.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Vendor_Products_shipments = Vendor_Products_shipments_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Vendor_Products_shipments = Vendor_Products_shipments_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Vendor_Products_shipments_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

