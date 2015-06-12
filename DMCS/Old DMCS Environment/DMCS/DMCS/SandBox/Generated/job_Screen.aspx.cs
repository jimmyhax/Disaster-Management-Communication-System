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
public partial class job_Screen : System.Web.UI.Page
{
            public job job = new job();
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
        job = Insert_job_select(Convert.ToInt32(Insert_job_GridView.SelectedValue));
    }
    public job Insert_job_select(int ID)
    {
        job = job.Select(ID);
        Insert_address_id_txt.Text = Convert.ToString(job.address_id);
        Insert_company_id_txt.Text = Convert.ToString(job.company_id);
        Insert_job_cat_id_txt.Text = Convert.ToString(job.job_cat_id);
        Insert_job_posted_date_txt.Text = Convert.ToString(job.job_posted_date);
        Insert_job_status_txt.Text = Convert.ToString(job.job_status);
        Insert_job_title_txt.Text = Convert.ToString(job.job_title);
        Insert_Work_Classification_Full_time_txt.Text = Convert.ToString(job.Work_Classification_Full_time);
        Insert_Work_Classification_Part_time_txt.Text = Convert.ToString(job.Work_Classification_Part_time);
        Insert_Work_Payment_Freq_Weekly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Weekly);
        Insert_Work_Payment_Freq_Bi_Weekly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Weekly);
        Insert_Work_Payment_Freq_Monthly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Monthly);
        Insert_Work_Payment_Freq_Bi_Monthly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Monthly);
        return job;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        job = job_insert();
    }
    public job job_insert()
    {
        job.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        job.company_id = Convert.ToInt32(Insert_company_id_txt.Text);
        job.job_cat_id = Convert.ToInt32(Insert_job_cat_id_txt.Text);
        job.job_posted_date = Convert.ToDateTime(Insert_job_posted_date_txt.Text);
        job.job_status = Insert_job_status_txt.Text;
        job.job_title = Insert_job_title_txt.Text;
        job.Work_Classification_Full_time = Insert_Work_Classification_Full_time_txt.Text;
        job.Work_Classification_Part_time = Insert_Work_Classification_Part_time_txt.Text;
        job.Work_Payment_Freq_Weekly = Insert_Work_Payment_Freq_Weekly_txt.Text;
        job.Work_Payment_Freq_Bi_Weekly = Insert_Work_Payment_Freq_Bi_Weekly_txt.Text;
        job.Work_Payment_Freq_Monthly = Insert_Work_Payment_Freq_Monthly_txt.Text;
        job.Work_Payment_Freq_Bi_Monthly = Insert_Work_Payment_Freq_Bi_Monthly_txt.Text;
        job = job.Insert(job);
        Insert_job_GridView.DataBind();
        Update_job_GridView.DataBind();
        Delete_job_GridView.DataBind();
        return job;
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
        job = Update_job_select(Convert.ToInt32(Update_job_GridView.SelectedValue));
    }
    public job Update_job_select(int ID)
    {
        job = job.Select(ID);
        Update_job_id_txt.Text = Convert.ToString(job.job_id);
        Update_address_id_txt.Text = Convert.ToString(job.address_id);
        Update_company_id_txt.Text = Convert.ToString(job.company_id);
        Update_job_cat_id_txt.Text = Convert.ToString(job.job_cat_id);
        Update_job_posted_date_txt.Text = Convert.ToString(job.job_posted_date);
        Update_job_status_txt.Text = Convert.ToString(job.job_status);
        Update_job_title_txt.Text = Convert.ToString(job.job_title);
        Update_Work_Classification_Full_time_txt.Text = Convert.ToString(job.Work_Classification_Full_time);
        Update_Work_Classification_Part_time_txt.Text = Convert.ToString(job.Work_Classification_Part_time);
        Update_Work_Payment_Freq_Weekly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Weekly);
        Update_Work_Payment_Freq_Bi_Weekly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Weekly);
        Update_Work_Payment_Freq_Monthly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Monthly);
        Update_Work_Payment_Freq_Bi_Monthly_txt.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Monthly);
        return job;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        job = job_update(Convert.ToInt32(Update_job_GridView.SelectedValue));
    }
    public job job_update(int ID)
    {
        job = job.Select(ID);
        job.job_id = Convert.ToInt32(Update_job_id_txt.Text);
        job.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        job.company_id = Convert.ToInt32(Update_company_id_txt.Text);
        job.job_cat_id = Convert.ToInt32(Update_job_cat_id_txt.Text);
        job.job_posted_date = Convert.ToDateTime(Update_job_posted_date_txt.Text);
        job.job_status = Update_job_status_txt.Text;
        job.job_title = Update_job_title_txt.Text;
        job.Work_Classification_Full_time = Update_Work_Classification_Full_time_txt.Text;
        job.Work_Classification_Part_time = Update_Work_Classification_Part_time_txt.Text;
        job.Work_Payment_Freq_Weekly = Update_Work_Payment_Freq_Weekly_txt.Text;
        job.Work_Payment_Freq_Bi_Weekly = Update_Work_Payment_Freq_Bi_Weekly_txt.Text;
        job.Work_Payment_Freq_Monthly = Update_Work_Payment_Freq_Monthly_txt.Text;
        job.Work_Payment_Freq_Bi_Monthly = Update_Work_Payment_Freq_Bi_Monthly_txt.Text;
        job.Update(job);
        Insert_job_GridView.DataBind();
        Update_job_GridView.DataBind();
        Delete_job_GridView.DataBind();
        return job;
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
        job = Delete_job_select(Convert.ToInt32(Delete_job_GridView.SelectedValue));
    }
    public job Delete_job_select(int ID)
    {
        job = job.Select(ID);
        Delete_job_id_txt_lbl.Text = Convert.ToString(job.job_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(job.address_id);
        Delete_company_id_txt_lbl.Text = Convert.ToString(job.company_id);
        Delete_job_cat_id_txt_lbl.Text = Convert.ToString(job.job_cat_id);
        Delete_job_posted_date_txt_lbl.Text = Convert.ToString(job.job_posted_date);
        Delete_job_status_txt_lbl.Text = Convert.ToString(job.job_status);
        Delete_job_title_txt_lbl.Text = Convert.ToString(job.job_title);
        Delete_Work_Classification_Full_time_txt_lbl.Text = Convert.ToString(job.Work_Classification_Full_time);
        Delete_Work_Classification_Part_time_txt_lbl.Text = Convert.ToString(job.Work_Classification_Part_time);
        Delete_Work_Payment_Freq_Weekly_txt_lbl.Text = Convert.ToString(job.Work_Payment_Freq_Weekly);
        Delete_Work_Payment_Freq_Bi_Weekly_txt_lbl.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Weekly);
        Delete_Work_Payment_Freq_Monthly_txt_lbl.Text = Convert.ToString(job.Work_Payment_Freq_Monthly);
        Delete_Work_Payment_Freq_Bi_Monthly_txt_lbl.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Monthly);
        return job;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        job_delete(Convert.ToInt32(Delete_job_GridView.SelectedValue));
    }
    public void job_delete(int ID)
    {
        job.Delete(ID);
        Insert_job_GridView.DataBind();
        Update_job_GridView.DataBind();
        Delete_job_GridView.DataBind();
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

