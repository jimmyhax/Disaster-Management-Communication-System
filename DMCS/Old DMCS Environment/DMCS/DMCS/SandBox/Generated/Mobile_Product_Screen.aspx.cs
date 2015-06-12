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
public partial class Mobile_Product_Screen : System.Web.UI.Page
{
            public Mobile_Product Mobile_Product = new Mobile_Product();
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
        Mobile_Product = Insert_Mobile_Product_select(Convert.ToInt32(Insert_Mobile_Product_GridView.SelectedValue));
    }
    public Mobile_Product Insert_Mobile_Product_select(int ID)
    {
        Mobile_Product = Mobile_Product.Select(ID);
        Insert_Mobile_Unit_id_txt.Text = Convert.ToString(Mobile_Product.Mobile_Unit_id);
        Insert_Product_id_txt.Text = Convert.ToString(Mobile_Product.Product_id);
        Insert_Case_id_txt.Text = Convert.ToString(Mobile_Product.Case_id);
        Insert_Lot_id_txt.Text = Convert.ToString(Mobile_Product.Lot_id);
        Insert_Min_inv_txt.Text = Convert.ToString(Mobile_Product.Min_inv);
        Insert_Quantity_txt.Text = Convert.ToString(Mobile_Product.Quantity);
        Insert_Experiation_Date_txt.Text = Convert.ToString(Mobile_Product.Experiation_Date);
        return Mobile_Product;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Mobile_Product = Mobile_Product_insert();
    }
    public Mobile_Product Mobile_Product_insert()
    {
        Mobile_Product.Mobile_Unit_id = Convert.ToInt32(Insert_Mobile_Unit_id_txt.Text);
        Mobile_Product.Product_id = Convert.ToInt32(Insert_Product_id_txt.Text);
        Mobile_Product.Case_id = Convert.ToInt32(Insert_Case_id_txt.Text);
        Mobile_Product.Lot_id = Convert.ToInt32(Insert_Lot_id_txt.Text);
        Mobile_Product.Min_inv = Convert.ToInt32(Insert_Min_inv_txt.Text);
        Mobile_Product.Quantity = Convert.ToInt32(Insert_Quantity_txt.Text);
        Mobile_Product.Experiation_Date = Convert.ToDateTime(Insert_Experiation_Date_txt.Text);
        Mobile_Product = Mobile_Product.Insert(Mobile_Product);
        Insert_Mobile_Product_GridView.DataBind();
        Update_Mobile_Product_GridView.DataBind();
        Delete_Mobile_Product_GridView.DataBind();
        return Mobile_Product;
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
        Mobile_Product = Update_Mobile_Product_select(Convert.ToInt32(Update_Mobile_Product_GridView.SelectedValue));
    }
    public Mobile_Product Update_Mobile_Product_select(int ID)
    {
        Mobile_Product = Mobile_Product.Select(ID);
        Update_Mobile_Product_id_txt.Text = Convert.ToString(Mobile_Product.Mobile_Product_id);
        Update_Mobile_Unit_id_txt.Text = Convert.ToString(Mobile_Product.Mobile_Unit_id);
        Update_Product_id_txt.Text = Convert.ToString(Mobile_Product.Product_id);
        Update_Case_id_txt.Text = Convert.ToString(Mobile_Product.Case_id);
        Update_Lot_id_txt.Text = Convert.ToString(Mobile_Product.Lot_id);
        Update_Min_inv_txt.Text = Convert.ToString(Mobile_Product.Min_inv);
        Update_Quantity_txt.Text = Convert.ToString(Mobile_Product.Quantity);
        Update_Experiation_Date_txt.Text = Convert.ToString(Mobile_Product.Experiation_Date);
        return Mobile_Product;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Mobile_Product = Mobile_Product_update(Convert.ToInt32(Update_Mobile_Product_GridView.SelectedValue));
    }
    public Mobile_Product Mobile_Product_update(int ID)
    {
        Mobile_Product = Mobile_Product.Select(ID);
        Mobile_Product.Mobile_Product_id = Convert.ToInt32(Update_Mobile_Product_id_txt.Text);
        Mobile_Product.Mobile_Unit_id = Convert.ToInt32(Update_Mobile_Unit_id_txt.Text);
        Mobile_Product.Product_id = Convert.ToInt32(Update_Product_id_txt.Text);
        Mobile_Product.Case_id = Convert.ToInt32(Update_Case_id_txt.Text);
        Mobile_Product.Lot_id = Convert.ToInt32(Update_Lot_id_txt.Text);
        Mobile_Product.Min_inv = Convert.ToInt32(Update_Min_inv_txt.Text);
        Mobile_Product.Quantity = Convert.ToInt32(Update_Quantity_txt.Text);
        Mobile_Product.Experiation_Date = Convert.ToDateTime(Update_Experiation_Date_txt.Text);
        Mobile_Product.Update(Mobile_Product);
        Insert_Mobile_Product_GridView.DataBind();
        Update_Mobile_Product_GridView.DataBind();
        Delete_Mobile_Product_GridView.DataBind();
        return Mobile_Product;
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
        Mobile_Product = Delete_Mobile_Product_select(Convert.ToInt32(Delete_Mobile_Product_GridView.SelectedValue));
    }
    public Mobile_Product Delete_Mobile_Product_select(int ID)
    {
        Mobile_Product = Mobile_Product.Select(ID);
        Delete_Mobile_Product_id_txt_lbl.Text = Convert.ToString(Mobile_Product.Mobile_Product_id);
        Delete_Mobile_Unit_id_txt_lbl.Text = Convert.ToString(Mobile_Product.Mobile_Unit_id);
        Delete_Product_id_txt_lbl.Text = Convert.ToString(Mobile_Product.Product_id);
        Delete_Case_id_txt_lbl.Text = Convert.ToString(Mobile_Product.Case_id);
        Delete_Lot_id_txt_lbl.Text = Convert.ToString(Mobile_Product.Lot_id);
        Delete_Min_inv_txt_lbl.Text = Convert.ToString(Mobile_Product.Min_inv);
        Delete_Quantity_txt_lbl.Text = Convert.ToString(Mobile_Product.Quantity);
        Delete_Experiation_Date_txt_lbl.Text = Convert.ToString(Mobile_Product.Experiation_Date);
        return Mobile_Product;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Mobile_Product_delete(Convert.ToInt32(Delete_Mobile_Product_GridView.SelectedValue));
    }
    public void Mobile_Product_delete(int ID)
    {
        Mobile_Product.Delete(ID);
        Insert_Mobile_Product_GridView.DataBind();
        Update_Mobile_Product_GridView.DataBind();
        Delete_Mobile_Product_GridView.DataBind();
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

