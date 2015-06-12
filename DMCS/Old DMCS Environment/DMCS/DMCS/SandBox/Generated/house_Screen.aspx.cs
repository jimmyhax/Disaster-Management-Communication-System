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
public partial class house_Screen : System.Web.UI.Page
{
            public house house = new house();
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
        house = Insert_house_select(Convert.ToInt32(Insert_house_GridView.SelectedValue));
    }
    public house Insert_house_select(int ID)
    {
        house = house.Select(ID);
        Insert_house_name_txt.Text = Convert.ToString(house.house_name);
        Insert_house_eligibility_txt.Text = Convert.ToString(house.house_eligibility);
        Insert_house_request_date_txt.Text = Convert.ToString(house.house_request_date);
        Insert_house_voucher_amt_txt.Text = Convert.ToString(house.house_voucher_amt);
        Insert_house_voucher_begin_date_txt.Text = Convert.ToString(house.house_voucher_begin_date);
        Insert_house_voucher_exp_date_txt.Text = Convert.ToString(house.house_voucher_exp_date);
        Insert_house_voucher_num_txt.Text = Convert.ToString(house.house_voucher_num);
        Insert_house_voucher_schedule_txt.Text = Convert.ToString(house.house_voucher_schedule);
        Insert_house_wait_list_txt.Text = Convert.ToString(house.house_wait_list);
        return house;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        house = house_insert();
    }
    public house house_insert()
    {
        house.house_name = Insert_house_name_txt.Text;
        house.house_eligibility = Insert_house_eligibility_txt.Text;
        house.house_request_date = Convert.ToDateTime(Insert_house_request_date_txt.Text);
        house.house_voucher_amt = Convert.ToDecimal(Insert_house_voucher_amt_txt.Text);
        house.house_voucher_begin_date = Convert.ToDateTime(Insert_house_voucher_begin_date_txt.Text);
        house.house_voucher_exp_date = Convert.ToDateTime(Insert_house_voucher_exp_date_txt.Text);
        house.house_voucher_num = Convert.ToInt32(Insert_house_voucher_num_txt.Text);
        house.house_voucher_schedule = Insert_house_voucher_schedule_txt.Text;
        house.house_wait_list = Convert.ToInt32(Insert_house_wait_list_txt.Text);
        house = house.Insert(house);
        Insert_house_GridView.DataBind();
        Update_house_GridView.DataBind();
        Delete_house_GridView.DataBind();
        return house;
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
        house = Update_house_select(Convert.ToInt32(Update_house_GridView.SelectedValue));
    }
    public house Update_house_select(int ID)
    {
        house = house.Select(ID);
        Update_house_id_txt.Text = Convert.ToString(house.house_id);
        Update_house_name_txt.Text = Convert.ToString(house.house_name);
        Update_house_eligibility_txt.Text = Convert.ToString(house.house_eligibility);
        Update_house_request_date_txt.Text = Convert.ToString(house.house_request_date);
        Update_house_voucher_amt_txt.Text = Convert.ToString(house.house_voucher_amt);
        Update_house_voucher_begin_date_txt.Text = Convert.ToString(house.house_voucher_begin_date);
        Update_house_voucher_exp_date_txt.Text = Convert.ToString(house.house_voucher_exp_date);
        Update_house_voucher_num_txt.Text = Convert.ToString(house.house_voucher_num);
        Update_house_voucher_schedule_txt.Text = Convert.ToString(house.house_voucher_schedule);
        Update_house_wait_list_txt.Text = Convert.ToString(house.house_wait_list);
        return house;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        house = house_update(Convert.ToInt32(Update_house_GridView.SelectedValue));
    }
    public house house_update(int ID)
    {
        house = house.Select(ID);
        house.house_id = Convert.ToInt32(Update_house_id_txt.Text);
        house.house_name = Update_house_name_txt.Text;
        house.house_eligibility = Update_house_eligibility_txt.Text;
        house.house_request_date = Convert.ToDateTime(Update_house_request_date_txt.Text);
        house.house_voucher_amt = Convert.ToDecimal(Update_house_voucher_amt_txt.Text);
        house.house_voucher_begin_date = Convert.ToDateTime(Update_house_voucher_begin_date_txt.Text);
        house.house_voucher_exp_date = Convert.ToDateTime(Update_house_voucher_exp_date_txt.Text);
        house.house_voucher_num = Convert.ToInt32(Update_house_voucher_num_txt.Text);
        house.house_voucher_schedule = Update_house_voucher_schedule_txt.Text;
        house.house_wait_list = Convert.ToInt32(Update_house_wait_list_txt.Text);
        house.Update(house);
        Insert_house_GridView.DataBind();
        Update_house_GridView.DataBind();
        Delete_house_GridView.DataBind();
        return house;
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
        house = Delete_house_select(Convert.ToInt32(Delete_house_GridView.SelectedValue));
    }
    public house Delete_house_select(int ID)
    {
        house = house.Select(ID);
        Delete_house_id_txt_lbl.Text = Convert.ToString(house.house_id);
        Delete_house_name_txt_lbl.Text = Convert.ToString(house.house_name);
        Delete_house_eligibility_txt_lbl.Text = Convert.ToString(house.house_eligibility);
        Delete_house_request_date_txt_lbl.Text = Convert.ToString(house.house_request_date);
        Delete_house_voucher_amt_txt_lbl.Text = Convert.ToString(house.house_voucher_amt);
        Delete_house_voucher_begin_date_txt_lbl.Text = Convert.ToString(house.house_voucher_begin_date);
        Delete_house_voucher_exp_date_txt_lbl.Text = Convert.ToString(house.house_voucher_exp_date);
        Delete_house_voucher_num_txt_lbl.Text = Convert.ToString(house.house_voucher_num);
        Delete_house_voucher_schedule_txt_lbl.Text = Convert.ToString(house.house_voucher_schedule);
        Delete_house_wait_list_txt_lbl.Text = Convert.ToString(house.house_wait_list);
        return house;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        house_delete(Convert.ToInt32(Delete_house_GridView.SelectedValue));
    }
    public void house_delete(int ID)
    {
        house.Delete(ID);
        Insert_house_GridView.DataBind();
        Update_house_GridView.DataBind();
        Delete_house_GridView.DataBind();
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

