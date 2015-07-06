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
public partial class food_Screen : System.Web.UI.Page
{
            public food food = new food();
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
        food = Insert_food_select(Convert.ToInt32(Insert_food_GridView.SelectedValue));
    }
    public food Insert_food_select(int ID)
    {
        food = food.Select(ID);
        Insert_clients_served_txt.Text = Convert.ToString(food.clients_served);
        Insert_food_voucher_number_txt.Text = Convert.ToString(food.food_voucher_number);
        Insert_date_issued_txt.Text = Convert.ToString(food.date_issued);
        Insert_Product_id_txt.Text = Convert.ToString(food.Product_id);
        return food;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        food = food_insert();
    }
    public food food_insert()
    {
        food.clients_served = Convert.ToInt32(Insert_clients_served_txt.Text);
        food.food_voucher_number = Convert.ToInt32(Insert_food_voucher_number_txt.Text);
        food.date_issued = Convert.ToDateTime(Insert_date_issued_txt.Text);
        food.Product_id = Convert.ToInt32(Insert_Product_id_txt.Text);
        food = food.Insert(food);
        Insert_food_GridView.DataBind();
        Update_food_GridView.DataBind();
        Delete_food_GridView.DataBind();
        return food;
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
        food = Update_food_select(Convert.ToInt32(Update_food_GridView.SelectedValue));
    }
    public food Update_food_select(int ID)
    {
        food = food.Select(ID);
        Update_food_voucher_id_txt.Text = Convert.ToString(food.food_voucher_id);
        Update_clients_served_txt.Text = Convert.ToString(food.clients_served);
        Update_food_voucher_number_txt.Text = Convert.ToString(food.food_voucher_number);
        Update_date_issued_txt.Text = Convert.ToString(food.date_issued);
        Update_Product_id_txt.Text = Convert.ToString(food.Product_id);
        return food;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        food = food_update(Convert.ToInt32(Update_food_GridView.SelectedValue));
    }
    public food food_update(int ID)
    {
        food = food.Select(ID);
        food.food_voucher_id = Convert.ToInt32(Update_food_voucher_id_txt.Text);
        food.clients_served = Convert.ToInt32(Update_clients_served_txt.Text);
        food.food_voucher_number = Convert.ToInt32(Update_food_voucher_number_txt.Text);
        food.date_issued = Convert.ToDateTime(Update_date_issued_txt.Text);
        food.Product_id = Convert.ToInt32(Update_Product_id_txt.Text);
        food.Update(food);
        Insert_food_GridView.DataBind();
        Update_food_GridView.DataBind();
        Delete_food_GridView.DataBind();
        return food;
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
        food = Delete_food_select(Convert.ToInt32(Delete_food_GridView.SelectedValue));
    }
    public food Delete_food_select(int ID)
    {
        food = food.Select(ID);
        Delete_food_voucher_id_txt_lbl.Text = Convert.ToString(food.food_voucher_id);
        Delete_clients_served_txt_lbl.Text = Convert.ToString(food.clients_served);
        Delete_food_voucher_number_txt_lbl.Text = Convert.ToString(food.food_voucher_number);
        Delete_date_issued_txt_lbl.Text = Convert.ToString(food.date_issued);
        Delete_Product_id_txt_lbl.Text = Convert.ToString(food.Product_id);
        return food;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        food_delete(Convert.ToInt32(Delete_food_GridView.SelectedValue));
    }
    public void food_delete(int ID)
    {
        food.Delete(ID);
        Insert_food_GridView.DataBind();
        Update_food_GridView.DataBind();
        Delete_food_GridView.DataBind();
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

