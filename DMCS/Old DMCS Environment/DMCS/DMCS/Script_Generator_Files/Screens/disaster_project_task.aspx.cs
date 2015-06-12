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

namespace DMCS
{
public partial class disaster_project_task_ : System.Web.UI.Page
{
            public disaster_project_task disaster_project_task = new disaster_project_task();
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
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        disaster_project_task = Insert_disaster_project_task_select(Convert.ToInt32(Insert_disaster_project_task_GridView.SelectedValue));
    }
    public disaster_project_task Insert_disaster_project_task_select(int ID)
    {
        disaster_project_task = disaster_project_task.Select(ID);
        Insert_skills_id_txt.Text = Convert.ToString(disaster_project_task.skills_id);
        Insert_disaster_project_task_description_txt.Text = Convert.ToString(disaster_project_task.disaster_project_task_description);
        return disaster_project_task;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        disaster_project_task = disaster_project_task_insert();
    }
    public disaster_project_task disaster_project_task_insert()
    {
        disaster_project_task.skills_id = Convert.ToInt32(Insert_skills_id_txt.Text);
        disaster_project_task.disaster_project_task_description = Insert_disaster_project_task_description_txt.Text;
        disaster_project_task = disaster_project_task.Insert(disaster_project_task);
        Insert_disaster_project_task_GridView.DataBind();
        Update_disaster_project_task_GridView.DataBind();
        Delete_disaster_project_task_GridView.DataBind();
        return disaster_project_task;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        disaster_project_task = Update_disaster_project_task_select(Convert.ToInt32(Update_disaster_project_task_GridView.SelectedValue));
    }
    public disaster_project_task Update_disaster_project_task_select(int ID)
    {
        disaster_project_task = disaster_project_task.Select(ID);
        Update_disaster_project_task_id_txt.Text = Convert.ToString(disaster_project_task.disaster_project_task_id);
        Update_skills_id_txt.Text = Convert.ToString(disaster_project_task.skills_id);
        Update_disaster_project_task_description_txt.Text = Convert.ToString(disaster_project_task.disaster_project_task_description);
        return disaster_project_task;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        disaster_project_task = disaster_project_task_update(Convert.ToInt32(Update_disaster_project_task_GridView.SelectedValue));
    }
    public disaster_project_task disaster_project_task_update(int ID)
    {
        disaster_project_task = disaster_project_task.Select(ID);
        disaster_project_task.disaster_project_task_id = Convert.ToInt32(Update_disaster_project_task_id_txt.Text);
        disaster_project_task.skills_id = Convert.ToInt32(Update_skills_id_txt.Text);
        disaster_project_task.disaster_project_task_description = Update_disaster_project_task_description_txt.Text;
        disaster_project_task.Update(disaster_project_task);
        Insert_disaster_project_task_GridView.DataBind();
        Update_disaster_project_task_GridView.DataBind();
        Delete_disaster_project_task_GridView.DataBind();
        return disaster_project_task;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        disaster_project_task = Delete_disaster_project_task_select(Convert.ToInt32(Delete_disaster_project_task_GridView.SelectedValue));
    }
    public disaster_project_task Delete_disaster_project_task_select(int ID)
    {
        disaster_project_task = disaster_project_task.Select(ID);
        Delete_disaster_project_task_id_txt_lbl.Text = Convert.ToString(disaster_project_task.disaster_project_task_id);
        Delete_skills_id_txt_lbl.Text = Convert.ToString(disaster_project_task.skills_id);
        Delete_disaster_project_task_description_txt_lbl.Text = Convert.ToString(disaster_project_task.disaster_project_task_description);
        return disaster_project_task;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        disaster_project_task_delete(Convert.ToInt32(Delete_disaster_project_task_GridView.SelectedValue));
    }
    public void disaster_project_task_delete(int ID)
    {
        disaster_project_task.Delete(ID);
        Insert_disaster_project_task_GridView.DataBind();
        Update_disaster_project_task_GridView.DataBind();
        Delete_disaster_project_task_GridView.DataBind();
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

