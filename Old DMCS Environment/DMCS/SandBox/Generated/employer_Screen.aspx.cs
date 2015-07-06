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
public partial class employer_Screen : System.Web.UI.Page
{
            public employer employer = new employer();
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
        employer = Insert_employer_select(Convert.ToInt32(Insert_employer_GridView.SelectedValue));
    }
    public employer Insert_employer_select(int ID)
    {
        employer = employer.Select(ID);
        Insert_case_id_txt.Text = Convert.ToString(employer.case_id);
        Insert_client_id_txt.Text = Convert.ToString(employer.client_id);
        Insert_address_id_txt.Text = Convert.ToString(employer.address_id);
        Insert_emplr_name_txt.Text = Convert.ToString(employer.emplr_name);
        Insert_emplr_phone_txt.Text = Convert.ToString(employer.emplr_phone);
        Insert_end_date_txt.Text = Convert.ToString(employer.end_date);
        Insert_strt_date_txt.Text = Convert.ToString(employer.strt_date);
        Insert_term_reason_txt.Text = Convert.ToString(employer.term_reason);
        return employer;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        employer = employer_insert();
    }
    public employer employer_insert()
    {
        employer.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        employer.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        employer.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        employer.emplr_name = Insert_emplr_name_txt.Text;
        employer.emplr_phone = Insert_emplr_phone_txt.Text;
        employer.end_date = Convert.ToDateTime(Insert_end_date_txt.Text);
        employer.strt_date = Convert.ToDateTime(Insert_strt_date_txt.Text);
        employer.term_reason = Insert_term_reason_txt.Text;
        employer = employer.Insert(employer);
        Insert_employer_GridView.DataBind();
        Update_employer_GridView.DataBind();
        Delete_employer_GridView.DataBind();
        return employer;
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
        employer = Update_employer_select(Convert.ToInt32(Update_employer_GridView.SelectedValue));
    }
    public employer Update_employer_select(int ID)
    {
        employer = employer.Select(ID);
        Update_emplr_id_txt.Text = Convert.ToString(employer.emplr_id);
        Update_case_id_txt.Text = Convert.ToString(employer.case_id);
        Update_client_id_txt.Text = Convert.ToString(employer.client_id);
        Update_address_id_txt.Text = Convert.ToString(employer.address_id);
        Update_emplr_name_txt.Text = Convert.ToString(employer.emplr_name);
        Update_emplr_phone_txt.Text = Convert.ToString(employer.emplr_phone);
        Update_end_date_txt.Text = Convert.ToString(employer.end_date);
        Update_strt_date_txt.Text = Convert.ToString(employer.strt_date);
        Update_term_reason_txt.Text = Convert.ToString(employer.term_reason);
        return employer;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        employer = employer_update(Convert.ToInt32(Update_employer_GridView.SelectedValue));
    }
    public employer employer_update(int ID)
    {
        employer = employer.Select(ID);
        employer.emplr_id = Convert.ToInt32(Update_emplr_id_txt.Text);
        employer.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        employer.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        employer.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        employer.emplr_name = Update_emplr_name_txt.Text;
        employer.emplr_phone = Update_emplr_phone_txt.Text;
        employer.end_date = Convert.ToDateTime(Update_end_date_txt.Text);
        employer.strt_date = Convert.ToDateTime(Update_strt_date_txt.Text);
        employer.term_reason = Update_term_reason_txt.Text;
        employer.Update(employer);
        Insert_employer_GridView.DataBind();
        Update_employer_GridView.DataBind();
        Delete_employer_GridView.DataBind();
        return employer;
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
        employer = Delete_employer_select(Convert.ToInt32(Delete_employer_GridView.SelectedValue));
    }
    public employer Delete_employer_select(int ID)
    {
        employer = employer.Select(ID);
        Delete_emplr_id_txt_lbl.Text = Convert.ToString(employer.emplr_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(employer.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(employer.client_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(employer.address_id);
        Delete_emplr_name_txt_lbl.Text = Convert.ToString(employer.emplr_name);
        Delete_emplr_phone_txt_lbl.Text = Convert.ToString(employer.emplr_phone);
        Delete_end_date_txt_lbl.Text = Convert.ToString(employer.end_date);
        Delete_strt_date_txt_lbl.Text = Convert.ToString(employer.strt_date);
        Delete_term_reason_txt_lbl.Text = Convert.ToString(employer.term_reason);
        return employer;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        employer_delete(Convert.ToInt32(Delete_employer_GridView.SelectedValue));
    }
    public void employer_delete(int ID)
    {
        employer.Delete(ID);
        Insert_employer_GridView.DataBind();
        Update_employer_GridView.DataBind();
        Delete_employer_GridView.DataBind();
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

