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
public partial class vendor_products_Screen : System.Web.UI.Page
{
            public vendor_products vendor_products = new vendor_products();
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
        vendor_products = Insert_vendor_products_select(Convert.ToInt32(Insert_vendor_products_GridView.SelectedValue));
    }
    public vendor_products Insert_vendor_products_select(int ID)
    {
        vendor_products = vendor_products.Select(ID);
        Insert_vendor_id_txt.Text = Convert.ToString(vendor_products.vendor_id);
        Insert_product_id_txt.Text = Convert.ToString(vendor_products.product_id);
        Insert_product_qty_txt.Text = Convert.ToString(vendor_products.product_qty);
        Insert_Product_exp_date_txt.Text = Convert.ToString(vendor_products.Product_exp_date);
        Insert_lot_id_txt.Text = Convert.ToString(vendor_products.lot_id);
        Insert_Department_txt.Text = Convert.ToString(vendor_products.Department);
        return vendor_products;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        vendor_products = vendor_products_insert();
    }
    public vendor_products vendor_products_insert()
    {
        vendor_products.vendor_id = Convert.ToInt32(Insert_vendor_id_txt.Text);
        vendor_products.product_id = Convert.ToInt32(Insert_product_id_txt.Text);
        vendor_products.product_qty = Convert.ToInt32(Insert_product_qty_txt.Text);
        vendor_products.Product_exp_date = Insert_Product_exp_date_txt.Text;
        vendor_products.lot_id = Convert.ToInt32(Insert_lot_id_txt.Text);
        vendor_products.Department = Insert_Department_txt.Text;
        vendor_products = vendor_products.Insert(vendor_products);
        Insert_vendor_products_GridView.DataBind();
        Update_vendor_products_GridView.DataBind();
        Delete_vendor_products_GridView.DataBind();
        return vendor_products;
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
        vendor_products = Update_vendor_products_select(Convert.ToInt32(Update_vendor_products_GridView.SelectedValue));
    }
    public vendor_products Update_vendor_products_select(int ID)
    {
        vendor_products = vendor_products.Select(ID);
        Update_vendor_prod_id_txt.Text = Convert.ToString(vendor_products.vendor_prod_id);
        Update_vendor_id_txt.Text = Convert.ToString(vendor_products.vendor_id);
        Update_product_id_txt.Text = Convert.ToString(vendor_products.product_id);
        Update_product_qty_txt.Text = Convert.ToString(vendor_products.product_qty);
        Update_Product_exp_date_txt.Text = Convert.ToString(vendor_products.Product_exp_date);
        Update_lot_id_txt.Text = Convert.ToString(vendor_products.lot_id);
        Update_Department_txt.Text = Convert.ToString(vendor_products.Department);
        return vendor_products;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        vendor_products = vendor_products_update(Convert.ToInt32(Update_vendor_products_GridView.SelectedValue));
    }
    public vendor_products vendor_products_update(int ID)
    {
        vendor_products = vendor_products.Select(ID);
        vendor_products.vendor_prod_id = Convert.ToInt32(Update_vendor_prod_id_txt.Text);
        vendor_products.vendor_id = Convert.ToInt32(Update_vendor_id_txt.Text);
        vendor_products.product_id = Convert.ToInt32(Update_product_id_txt.Text);
        vendor_products.product_qty = Convert.ToInt32(Update_product_qty_txt.Text);
        vendor_products.Product_exp_date = Update_Product_exp_date_txt.Text;
        vendor_products.lot_id = Convert.ToInt32(Update_lot_id_txt.Text);
        vendor_products.Department = Update_Department_txt.Text;
        vendor_products.Update(vendor_products);
        Insert_vendor_products_GridView.DataBind();
        Update_vendor_products_GridView.DataBind();
        Delete_vendor_products_GridView.DataBind();
        return vendor_products;
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
        vendor_products = Delete_vendor_products_select(Convert.ToInt32(Delete_vendor_products_GridView.SelectedValue));
    }
    public vendor_products Delete_vendor_products_select(int ID)
    {
        vendor_products = vendor_products.Select(ID);
        Delete_vendor_prod_id_txt_lbl.Text = Convert.ToString(vendor_products.vendor_prod_id);
        Delete_vendor_id_txt_lbl.Text = Convert.ToString(vendor_products.vendor_id);
        Delete_product_id_txt_lbl.Text = Convert.ToString(vendor_products.product_id);
        Delete_product_qty_txt_lbl.Text = Convert.ToString(vendor_products.product_qty);
        Delete_Product_exp_date_txt_lbl.Text = Convert.ToString(vendor_products.Product_exp_date);
        Delete_lot_id_txt_lbl.Text = Convert.ToString(vendor_products.lot_id);
        Delete_Department_txt_lbl.Text = Convert.ToString(vendor_products.Department);
        return vendor_products;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        vendor_products_delete(Convert.ToInt32(Delete_vendor_products_GridView.SelectedValue));
    }
    public void vendor_products_delete(int ID)
    {
        vendor_products.Delete(ID);
        Insert_vendor_products_GridView.DataBind();
        Update_vendor_products_GridView.DataBind();
        Delete_vendor_products_GridView.DataBind();
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

