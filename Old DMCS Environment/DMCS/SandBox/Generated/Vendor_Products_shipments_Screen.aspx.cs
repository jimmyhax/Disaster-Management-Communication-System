using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;
using System.Web.Mvc;
using DMCS.App_Code;

namespace DMCS.SandBox.Generated
{
public partial class Vendor_Products_shipments_Screen : System.Web.UI.Page
{
            public Vendor_Products_shipments Vendor_Products_shipments = new Vendor_Products_shipments();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!ClientScript.IsStartupScriptRegistered("initialize"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "initialize", "initialize();", true);
        }
        if (!Page.IsPostBack)
        {   }
    }
    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Insert Tab Methods
    protected void Insert_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Insert_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        Vendor_Products_shipments = Insert_Vendor_Products_shipments_select(Convert.ToInt32(Insert_Vendor_Products_shipments_GridView.SelectedValue));
    }
    public Vendor_Products_shipments Insert_Vendor_Products_shipments_select(int ID)
    {
        Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
        Insert_ShipmentID_txt.Text = Convert.ToString(Vendor_Products_shipments.ShipmentID);
        Insert_VendorID_txt.Text = Convert.ToString(Vendor_Products_shipments.VendorID);
        Insert_ProductID_txt.Text = Convert.ToString(Vendor_Products_shipments.ProductID);
        Insert_Expect_Delivery_Date_txt.Text = Convert.ToString(Vendor_Products_shipments.Expect_Delivery_Date);
        Insert_orderdate_txt.Text = Convert.ToString(Vendor_Products_shipments.orderdate);
        Insert_quantity_txt.Text = Convert.ToString(Vendor_Products_shipments.quantity);
        Insert_OtherInfo_txt.Text = Convert.ToString(Vendor_Products_shipments.OtherInfo);
        Insert_DateReceived_txt.Text = Convert.ToString(Vendor_Products_shipments.DateReceived);
        Insert_AmountReceived_txt.Text = Convert.ToString(Vendor_Products_shipments.AmountReceived);
        return Vendor_Products_shipments;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Vendor_Products_shipments = Vendor_Products_shipments_insert();
    }
    public Vendor_Products_shipments Vendor_Products_shipments_insert()
    {
        Vendor_Products_shipments.ShipmentID = Convert.ToInt32(Insert_ShipmentID_txt.Text);
        Vendor_Products_shipments.VendorID = Convert.ToInt32(Insert_VendorID_txt.Text);
        Vendor_Products_shipments.ProductID = Convert.ToInt32(Insert_ProductID_txt.Text);
        Vendor_Products_shipments.Expect_Delivery_Date = Convert.ToDateTime(Insert_Expect_Delivery_Date_txt.Text);
        Vendor_Products_shipments.orderdate = Convert.ToDateTime(Insert_orderdate_txt.Text);
        Vendor_Products_shipments.quantity = Convert.ToInt32(Insert_quantity_txt.Text);
        Vendor_Products_shipments.OtherInfo = Insert_OtherInfo_txt.Text;
        Vendor_Products_shipments.DateReceived = Convert.ToDateTime(Insert_DateReceived_txt.Text);
        Vendor_Products_shipments.AmountReceived = Convert.ToInt32(Insert_AmountReceived_txt.Text);
        Vendor_Products_shipments = Vendor_Products_shipments.Insert(Vendor_Products_shipments);
        Insert_Vendor_Products_shipments_GridView.DataBind();
        Update_Vendor_Products_shipments_GridView.DataBind();
        Delete_Vendor_Products_shipments_GridView.DataBind();
        return Vendor_Products_shipments;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Update_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        Vendor_Products_shipments = Update_Vendor_Products_shipments_select(Convert.ToInt32(Update_Vendor_Products_shipments_GridView.SelectedValue));
    }
    public Vendor_Products_shipments Update_Vendor_Products_shipments_select(int ID)
    {
        Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
        Update_PO_Order_no_txt.Text = Convert.ToString(Vendor_Products_shipments.PO_Order_no);
        Update_ShipmentID_txt.Text = Convert.ToString(Vendor_Products_shipments.ShipmentID);
        Update_VendorID_txt.Text = Convert.ToString(Vendor_Products_shipments.VendorID);
        Update_ProductID_txt.Text = Convert.ToString(Vendor_Products_shipments.ProductID);
        Update_Expect_Delivery_Date_txt.Text = Convert.ToString(Vendor_Products_shipments.Expect_Delivery_Date);
        Update_orderdate_txt.Text = Convert.ToString(Vendor_Products_shipments.orderdate);
        Update_quantity_txt.Text = Convert.ToString(Vendor_Products_shipments.quantity);
        Update_OtherInfo_txt.Text = Convert.ToString(Vendor_Products_shipments.OtherInfo);
        Update_DateReceived_txt.Text = Convert.ToString(Vendor_Products_shipments.DateReceived);
        Update_AmountReceived_txt.Text = Convert.ToString(Vendor_Products_shipments.AmountReceived);
        return Vendor_Products_shipments;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Vendor_Products_shipments = Vendor_Products_shipments_update(Convert.ToInt32(Update_Vendor_Products_shipments_GridView.SelectedValue));
    }
    public Vendor_Products_shipments Vendor_Products_shipments_update(int ID)
    {
        Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
        Vendor_Products_shipments.PO_Order_no = Convert.ToInt32(Update_PO_Order_no_txt.Text);
        Vendor_Products_shipments.ShipmentID = Convert.ToInt32(Update_ShipmentID_txt.Text);
        Vendor_Products_shipments.VendorID = Convert.ToInt32(Update_VendorID_txt.Text);
        Vendor_Products_shipments.ProductID = Convert.ToInt32(Update_ProductID_txt.Text);
        Vendor_Products_shipments.Expect_Delivery_Date = Convert.ToDateTime(Update_Expect_Delivery_Date_txt.Text);
        Vendor_Products_shipments.orderdate = Convert.ToDateTime(Update_orderdate_txt.Text);
        Vendor_Products_shipments.quantity = Convert.ToInt32(Update_quantity_txt.Text);
        Vendor_Products_shipments.OtherInfo = Update_OtherInfo_txt.Text;
        Vendor_Products_shipments.DateReceived = Convert.ToDateTime(Update_DateReceived_txt.Text);
        Vendor_Products_shipments.AmountReceived = Convert.ToInt32(Update_AmountReceived_txt.Text);
        Vendor_Products_shipments.Update(Vendor_Products_shipments);
        Insert_Vendor_Products_shipments_GridView.DataBind();
        Update_Vendor_Products_shipments_GridView.DataBind();
        Delete_Vendor_Products_shipments_GridView.DataBind();
        return Vendor_Products_shipments;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Delete_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        Vendor_Products_shipments = Delete_Vendor_Products_shipments_select(Convert.ToInt32(Delete_Vendor_Products_shipments_GridView.SelectedValue));
    }
    public Vendor_Products_shipments Delete_Vendor_Products_shipments_select(int ID)
    {
        Vendor_Products_shipments = Vendor_Products_shipments.Select(ID);
        Delete_PO_Order_no_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.PO_Order_no);
        Delete_ShipmentID_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.ShipmentID);
        Delete_VendorID_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.VendorID);
        Delete_ProductID_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.ProductID);
        Delete_Expect_Delivery_Date_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.Expect_Delivery_Date);
        Delete_orderdate_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.orderdate);
        Delete_quantity_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.quantity);
        Delete_OtherInfo_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.OtherInfo);
        Delete_DateReceived_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.DateReceived);
        Delete_AmountReceived_txt_lbl.Text = Convert.ToString(Vendor_Products_shipments.AmountReceived);
        return Vendor_Products_shipments;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Vendor_Products_shipments_delete(Convert.ToInt32(Delete_Vendor_Products_shipments_GridView.SelectedValue));
    }
    public void Vendor_Products_shipments_delete(int ID)
    {
        Vendor_Products_shipments.Delete(ID);
        Insert_Vendor_Products_shipments_GridView.DataBind();
        Update_Vendor_Products_shipments_GridView.DataBind();
        Delete_Vendor_Products_shipments_GridView.DataBind();
    }





    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Universial Methods
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // EXAMPLE:
            // client_status = e.Row.Cells[5].Text;
            // Gender = e.Row.Cells[4].Text;

            //if (e.Row.Cells[5].Text == "M")
            //{
            //    e.Row.Cells[5].Text = "Missing";
            //}
            //else if (e.Row.Cells[5].Text == "D")
            //{
            //    e.Row.Cells[5].Text = "Deceased";
            //}
            //if (e.Row.Cells[4].Text == "M")
            //{
            //    e.Row.Cells[4].Text = "Male";
            //}
            //else if (e.Row.Cells[4].Text == "F")
            //{
            //    e.Row.Cells[4].Text = "Female";
            //}
        }
    }




  }
}

