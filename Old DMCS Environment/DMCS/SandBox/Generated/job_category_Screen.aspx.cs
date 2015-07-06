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
public partial class job_category_Screen : System.Web.UI.Page
{
            public job_category job_category = new job_category();
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
        job_category = Insert_job_category_select(Convert.ToInt32(Insert_job_category_GridView.SelectedValue));
    }
    public job_category Insert_job_category_select(int ID)
    {
        job_category = job_category.Select(ID);
        Insert_job_category_name_txt.Text = Convert.ToString(job_category.job_category_name);
        return job_category;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        job_category = job_category_insert();
    }
    public job_category job_category_insert()
    {
        job_category.job_category_name = Insert_job_category_name_txt.Text;
        job_category = job_category.Insert(job_category);
        Insert_job_category_GridView.DataBind();
        Update_job_category_GridView.DataBind();
        Delete_job_category_GridView.DataBind();
        return job_category;
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
        job_category = Update_job_category_select(Convert.ToInt32(Update_job_category_GridView.SelectedValue));
    }
    public job_category Update_job_category_select(int ID)
    {
        job_category = job_category.Select(ID);
        Update_job_cat_id_txt.Text = Convert.ToString(job_category.job_cat_id);
        Update_job_category_name_txt.Text = Convert.ToString(job_category.job_category_name);
        return job_category;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        job_category = job_category_update(Convert.ToInt32(Update_job_category_GridView.SelectedValue));
    }
    public job_category job_category_update(int ID)
    {
        job_category = job_category.Select(ID);
        job_category.job_cat_id = Convert.ToInt32(Update_job_cat_id_txt.Text);
        job_category.job_category_name = Update_job_category_name_txt.Text;
        job_category.Update(job_category);
        Insert_job_category_GridView.DataBind();
        Update_job_category_GridView.DataBind();
        Delete_job_category_GridView.DataBind();
        return job_category;
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
        job_category = Delete_job_category_select(Convert.ToInt32(Delete_job_category_GridView.SelectedValue));
    }
    public job_category Delete_job_category_select(int ID)
    {
        job_category = job_category.Select(ID);
        Delete_job_cat_id_txt_lbl.Text = Convert.ToString(job_category.job_cat_id);
        Delete_job_category_name_txt_lbl.Text = Convert.ToString(job_category.job_category_name);
        return job_category;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        job_category_delete(Convert.ToInt32(Delete_job_category_GridView.SelectedValue));
    }
    public void job_category_delete(int ID)
    {
        job_category.Delete(ID);
        Insert_job_category_GridView.DataBind();
        Update_job_category_GridView.DataBind();
        Delete_job_category_GridView.DataBind();
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

