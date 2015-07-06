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
public partial class military_Screen : System.Web.UI.Page
{
            public military military = new military();
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
        military = Insert_military_select(Convert.ToInt32(Insert_military_GridView.SelectedValue));
    }
    public military Insert_military_select(int ID)
    {
        military = military.Select(ID);
        Insert_case_id_txt.Text = Convert.ToString(military.case_id);
        Insert_client_id_txt.Text = Convert.ToString(military.client_id);
        Insert_discharge_date_txt.Text = Convert.ToString(military.discharge_date);
        Insert_enlistment_date_txt.Text = Convert.ToString(military.enlistment_date);
        Insert_military_branch_txt.Text = Convert.ToString(military.military_branch);
        Insert_serial_num_txt.Text = Convert.ToString(military.serial_num);
        return military;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        military = military_insert();
    }
    public military military_insert()
    {
        military.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        military.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        military.discharge_date = Convert.ToDateTime(Insert_discharge_date_txt.Text);
        military.enlistment_date = Convert.ToDateTime(Insert_enlistment_date_txt.Text);
        military.military_branch = Insert_military_branch_txt.Text;
        military.serial_num = Convert.ToInt32(Insert_serial_num_txt.Text);
        military = military.Insert(military);
        Insert_military_GridView.DataBind();
        Update_military_GridView.DataBind();
        Delete_military_GridView.DataBind();
        return military;
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
        military = Update_military_select(Convert.ToInt32(Update_military_GridView.SelectedValue));
    }
    public military Update_military_select(int ID)
    {
        military = military.Select(ID);
        Update_military_id_txt.Text = Convert.ToString(military.military_id);
        Update_case_id_txt.Text = Convert.ToString(military.case_id);
        Update_client_id_txt.Text = Convert.ToString(military.client_id);
        Update_discharge_date_txt.Text = Convert.ToString(military.discharge_date);
        Update_enlistment_date_txt.Text = Convert.ToString(military.enlistment_date);
        Update_military_branch_txt.Text = Convert.ToString(military.military_branch);
        Update_serial_num_txt.Text = Convert.ToString(military.serial_num);
        return military;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        military = military_update(Convert.ToInt32(Update_military_GridView.SelectedValue));
    }
    public military military_update(int ID)
    {
        military = military.Select(ID);
        military.military_id = Convert.ToInt32(Update_military_id_txt.Text);
        military.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        military.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        military.discharge_date = Convert.ToDateTime(Update_discharge_date_txt.Text);
        military.enlistment_date = Convert.ToDateTime(Update_enlistment_date_txt.Text);
        military.military_branch = Update_military_branch_txt.Text;
        military.serial_num = Convert.ToInt32(Update_serial_num_txt.Text);
        military.Update(military);
        Insert_military_GridView.DataBind();
        Update_military_GridView.DataBind();
        Delete_military_GridView.DataBind();
        return military;
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
        military = Delete_military_select(Convert.ToInt32(Delete_military_GridView.SelectedValue));
    }
    public military Delete_military_select(int ID)
    {
        military = military.Select(ID);
        Delete_military_id_txt_lbl.Text = Convert.ToString(military.military_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(military.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(military.client_id);
        Delete_discharge_date_txt_lbl.Text = Convert.ToString(military.discharge_date);
        Delete_enlistment_date_txt_lbl.Text = Convert.ToString(military.enlistment_date);
        Delete_military_branch_txt_lbl.Text = Convert.ToString(military.military_branch);
        Delete_serial_num_txt_lbl.Text = Convert.ToString(military.serial_num);
        return military;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        military_delete(Convert.ToInt32(Delete_military_GridView.SelectedValue));
    }
    public void military_delete(int ID)
    {
        military.Delete(ID);
        Insert_military_GridView.DataBind();
        Update_military_GridView.DataBind();
        Delete_military_GridView.DataBind();
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

