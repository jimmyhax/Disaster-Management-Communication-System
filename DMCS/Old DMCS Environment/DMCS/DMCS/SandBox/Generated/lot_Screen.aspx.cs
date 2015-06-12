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
public partial class lot_Screen : System.Web.UI.Page
{
            public lot lot = new lot();
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
        lot = Insert_lot_select(Convert.ToInt32(Insert_lot_GridView.SelectedValue));
    }
    public lot Insert_lot_select(int ID)
    {
        lot = lot.Select(ID);
        Insert_product_id_txt.Text = Convert.ToString(lot.product_id);
        Insert_manufactured_date_txt.Text = Convert.ToString(lot.manufactured_date);
        Insert_expiration_date_txt.Text = Convert.ToString(lot.expiration_date);
        Insert_manufacture_name_txt.Text = Convert.ToString(lot.manufacture_name);
        return lot;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        lot = lot_insert();
    }
    public lot lot_insert()
    {
        lot.product_id = Convert.ToInt32(Insert_product_id_txt.Text);
        lot.manufactured_date = Convert.ToDateTime(Insert_manufactured_date_txt.Text);
        lot.expiration_date = Convert.ToDateTime(Insert_expiration_date_txt.Text);
        lot.manufacture_name = Insert_manufacture_name_txt.Text;
        lot = lot.Insert(lot);
        Insert_lot_GridView.DataBind();
        Update_lot_GridView.DataBind();
        Delete_lot_GridView.DataBind();
        return lot;
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
        lot = Update_lot_select(Convert.ToInt32(Update_lot_GridView.SelectedValue));
    }
    public lot Update_lot_select(int ID)
    {
        lot = lot.Select(ID);
        Update_lot_id_txt.Text = Convert.ToString(lot.lot_id);
        Update_product_id_txt.Text = Convert.ToString(lot.product_id);
        Update_manufactured_date_txt.Text = Convert.ToString(lot.manufactured_date);
        Update_expiration_date_txt.Text = Convert.ToString(lot.expiration_date);
        Update_manufacture_name_txt.Text = Convert.ToString(lot.manufacture_name);
        return lot;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        lot = lot_update(Convert.ToInt32(Update_lot_GridView.SelectedValue));
    }
    public lot lot_update(int ID)
    {
        lot = lot.Select(ID);
        lot.lot_id = Convert.ToInt32(Update_lot_id_txt.Text);
        lot.product_id = Convert.ToInt32(Update_product_id_txt.Text);
        lot.manufactured_date = Convert.ToDateTime(Update_manufactured_date_txt.Text);
        lot.expiration_date = Convert.ToDateTime(Update_expiration_date_txt.Text);
        lot.manufacture_name = Update_manufacture_name_txt.Text;
        lot.Update(lot);
        Insert_lot_GridView.DataBind();
        Update_lot_GridView.DataBind();
        Delete_lot_GridView.DataBind();
        return lot;
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
        lot = Delete_lot_select(Convert.ToInt32(Delete_lot_GridView.SelectedValue));
    }
    public lot Delete_lot_select(int ID)
    {
        lot = lot.Select(ID);
        Delete_lot_id_txt_lbl.Text = Convert.ToString(lot.lot_id);
        Delete_product_id_txt_lbl.Text = Convert.ToString(lot.product_id);
        Delete_manufactured_date_txt_lbl.Text = Convert.ToString(lot.manufactured_date);
        Delete_expiration_date_txt_lbl.Text = Convert.ToString(lot.expiration_date);
        Delete_manufacture_name_txt_lbl.Text = Convert.ToString(lot.manufacture_name);
        return lot;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        lot_delete(Convert.ToInt32(Delete_lot_GridView.SelectedValue));
    }
    public void lot_delete(int ID)
    {
        lot.Delete(ID);
        Insert_lot_GridView.DataBind();
        Update_lot_GridView.DataBind();
        Delete_lot_GridView.DataBind();
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

