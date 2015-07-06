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
public partial class Order_Product_Screen : System.Web.UI.Page
{
            public Order_Product Order_Product = new Order_Product();
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
        Order_Product = Insert_Order_Product_select(Convert.ToInt32(Insert_Order_Product_GridView.SelectedValue));
    }
    public Order_Product Insert_Order_Product_select(int ID)
    {
        Order_Product = Order_Product.Select(ID);
        Insert_orderID_txt.Text = Convert.ToString(Order_Product.orderID);
        Insert_ProductID_txt.Text = Convert.ToString(Order_Product.ProductID);
        Insert_Quantity_txt.Text = Convert.ToString(Order_Product.Quantity);
        Insert_warehouseid_txt.Text = Convert.ToString(Order_Product.warehouseid);
        Insert_DatePicked_txt.Text = Convert.ToString(Order_Product.DatePicked);
        Insert_Qtypicked_txt.Text = Convert.ToString(Order_Product.Qtypicked);
        return Order_Product;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Order_Product = Order_Product_insert();
    }
    public Order_Product Order_Product_insert()
    {
        Order_Product.orderID = Convert.ToInt32(Insert_orderID_txt.Text);
        Order_Product.ProductID = Convert.ToInt32(Insert_ProductID_txt.Text);
        Order_Product.Quantity = Convert.ToInt32(Insert_Quantity_txt.Text);
        Order_Product.warehouseid = Convert.ToInt32(Insert_warehouseid_txt.Text);
        Order_Product.DatePicked = Convert.ToDateTime(Insert_DatePicked_txt.Text);
        Order_Product.Qtypicked = Convert.ToInt32(Insert_Qtypicked_txt.Text);
        Order_Product = Order_Product.Insert(Order_Product);
        Insert_Order_Product_GridView.DataBind();
        Update_Order_Product_GridView.DataBind();
        Delete_Order_Product_GridView.DataBind();
        return Order_Product;
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
        Order_Product = Update_Order_Product_select(Convert.ToInt32(Update_Order_Product_GridView.SelectedValue));
    }
    public Order_Product Update_Order_Product_select(int ID)
    {
        Order_Product = Order_Product.Select(ID);
        Update_order_Product_ID_txt.Text = Convert.ToString(Order_Product.order_Product_ID);
        Update_orderID_txt.Text = Convert.ToString(Order_Product.orderID);
        Update_ProductID_txt.Text = Convert.ToString(Order_Product.ProductID);
        Update_Quantity_txt.Text = Convert.ToString(Order_Product.Quantity);
        Update_warehouseid_txt.Text = Convert.ToString(Order_Product.warehouseid);
        Update_DatePicked_txt.Text = Convert.ToString(Order_Product.DatePicked);
        Update_Qtypicked_txt.Text = Convert.ToString(Order_Product.Qtypicked);
        return Order_Product;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Order_Product = Order_Product_update(Convert.ToInt32(Update_Order_Product_GridView.SelectedValue));
    }
    public Order_Product Order_Product_update(int ID)
    {
        Order_Product = Order_Product.Select(ID);
        Order_Product.order_Product_ID = Convert.ToInt32(Update_order_Product_ID_txt.Text);
        Order_Product.orderID = Convert.ToInt32(Update_orderID_txt.Text);
        Order_Product.ProductID = Convert.ToInt32(Update_ProductID_txt.Text);
        Order_Product.Quantity = Convert.ToInt32(Update_Quantity_txt.Text);
        Order_Product.warehouseid = Convert.ToInt32(Update_warehouseid_txt.Text);
        Order_Product.DatePicked = Convert.ToDateTime(Update_DatePicked_txt.Text);
        Order_Product.Qtypicked = Convert.ToInt32(Update_Qtypicked_txt.Text);
        Order_Product.Update(Order_Product);
        Insert_Order_Product_GridView.DataBind();
        Update_Order_Product_GridView.DataBind();
        Delete_Order_Product_GridView.DataBind();
        return Order_Product;
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
        Order_Product = Delete_Order_Product_select(Convert.ToInt32(Delete_Order_Product_GridView.SelectedValue));
    }
    public Order_Product Delete_Order_Product_select(int ID)
    {
        Order_Product = Order_Product.Select(ID);
        Delete_order_Product_ID_txt_lbl.Text = Convert.ToString(Order_Product.order_Product_ID);
        Delete_orderID_txt_lbl.Text = Convert.ToString(Order_Product.orderID);
        Delete_ProductID_txt_lbl.Text = Convert.ToString(Order_Product.ProductID);
        Delete_Quantity_txt_lbl.Text = Convert.ToString(Order_Product.Quantity);
        Delete_warehouseid_txt_lbl.Text = Convert.ToString(Order_Product.warehouseid);
        Delete_DatePicked_txt_lbl.Text = Convert.ToString(Order_Product.DatePicked);
        Delete_Qtypicked_txt_lbl.Text = Convert.ToString(Order_Product.Qtypicked);
        return Order_Product;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Order_Product_delete(Convert.ToInt32(Delete_Order_Product_GridView.SelectedValue));
    }
    public void Order_Product_delete(int ID)
    {
        Order_Product.Delete(ID);
        Insert_Order_Product_GridView.DataBind();
        Update_Order_Product_GridView.DataBind();
        Delete_Order_Product_GridView.DataBind();
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

