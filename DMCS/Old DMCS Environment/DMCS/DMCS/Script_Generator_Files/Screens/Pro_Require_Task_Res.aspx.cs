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
public partial class Pro_Require_Task_Res_ : System.Web.UI.Page
{
            public Pro_Require_Task_Res Pro_Require_Task_Res = new Pro_Require_Task_Res();
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
        Pro_Require_Task_Res = Insert_Pro_Require_Task_Res_select(Convert.ToInt32(Insert_Pro_Require_Task_Res_GridView.SelectedValue));
    }
    public Pro_Require_Task_Res Insert_Pro_Require_Task_Res_select(int ID)
    {
        Pro_Require_Task_Res = Pro_Require_Task_Res.Select(ID);
        Insert_project_id_txt.Text = Convert.ToString(Pro_Require_Task_Res.project_id);
        Insert_Requirement_ID_txt.Text = Convert.ToString(Pro_Require_Task_Res.Requirement_ID);
        Insert_task_id_txt.Text = Convert.ToString(Pro_Require_Task_Res.task_id);
        Insert_Resource_ID_txt.Text = Convert.ToString(Pro_Require_Task_Res.Resource_ID);
        Insert_Project_Catagory_txt.Text = Convert.ToString(Pro_Require_Task_Res.Project_Catagory);
        Insert_Proj_Require_Description_txt.Text = Convert.ToString(Pro_Require_Task_Res.Proj_Require_Description);
        Insert_Project_Task_Description_txt.Text = Convert.ToString(Pro_Require_Task_Res.Project_Task_Description);
        Insert_Applicant_Name_txt.Text = Convert.ToString(Pro_Require_Task_Res.Applicant_Name);
        Insert_Equipment_Description_txt.Text = Convert.ToString(Pro_Require_Task_Res.Equipment_Description);
        Insert_Vehicle_txt.Text = Convert.ToString(Pro_Require_Task_Res.Vehicle);
        return Pro_Require_Task_Res;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Pro_Require_Task_Res = Pro_Require_Task_Res_insert();
    }
    public Pro_Require_Task_Res Pro_Require_Task_Res_insert()
    {
        Pro_Require_Task_Res.project_id = Convert.ToInt32(Insert_project_id_txt.Text);
        Pro_Require_Task_Res.Requirement_ID = Convert.ToInt32(Insert_Requirement_ID_txt.Text);
        Pro_Require_Task_Res.task_id = Convert.ToInt32(Insert_task_id_txt.Text);
        Pro_Require_Task_Res.Resource_ID = Convert.ToInt32(Insert_Resource_ID_txt.Text);
        Pro_Require_Task_Res.Project_Catagory = Insert_Project_Catagory_txt.Text;
        Pro_Require_Task_Res.Proj_Require_Description = Insert_Proj_Require_Description_txt.Text;
        Pro_Require_Task_Res.Project_Task_Description = Insert_Project_Task_Description_txt.Text;
        Pro_Require_Task_Res.Applicant_Name = Insert_Applicant_Name_txt.Text;
        Pro_Require_Task_Res.Equipment_Description = Insert_Equipment_Description_txt.Text;
        Pro_Require_Task_Res.Vehicle = Insert_Vehicle_txt.Text;
        Pro_Require_Task_Res = Pro_Require_Task_Res.Insert(Pro_Require_Task_Res);
        Insert_Pro_Require_Task_Res_GridView.DataBind();
        Update_Pro_Require_Task_Res_GridView.DataBind();
        Delete_Pro_Require_Task_Res_GridView.DataBind();
        return Pro_Require_Task_Res;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        Pro_Require_Task_Res = Update_Pro_Require_Task_Res_select(Convert.ToInt32(Update_Pro_Require_Task_Res_GridView.SelectedValue));
    }
    public Pro_Require_Task_Res Update_Pro_Require_Task_Res_select(int ID)
    {
        Pro_Require_Task_Res = Pro_Require_Task_Res.Select(ID);
        Update_Proj_Require_Task_Res_ID_txt.Text = Convert.ToString(Pro_Require_Task_Res.Proj_Require_Task_Res_ID);
        Update_project_id_txt.Text = Convert.ToString(Pro_Require_Task_Res.project_id);
        Update_Requirement_ID_txt.Text = Convert.ToString(Pro_Require_Task_Res.Requirement_ID);
        Update_task_id_txt.Text = Convert.ToString(Pro_Require_Task_Res.task_id);
        Update_Resource_ID_txt.Text = Convert.ToString(Pro_Require_Task_Res.Resource_ID);
        Update_Project_Catagory_txt.Text = Convert.ToString(Pro_Require_Task_Res.Project_Catagory);
        Update_Proj_Require_Description_txt.Text = Convert.ToString(Pro_Require_Task_Res.Proj_Require_Description);
        Update_Project_Task_Description_txt.Text = Convert.ToString(Pro_Require_Task_Res.Project_Task_Description);
        Update_Applicant_Name_txt.Text = Convert.ToString(Pro_Require_Task_Res.Applicant_Name);
        Update_Equipment_Description_txt.Text = Convert.ToString(Pro_Require_Task_Res.Equipment_Description);
        Update_Vehicle_txt.Text = Convert.ToString(Pro_Require_Task_Res.Vehicle);
        return Pro_Require_Task_Res;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Pro_Require_Task_Res = Pro_Require_Task_Res_update(Convert.ToInt32(Update_Pro_Require_Task_Res_GridView.SelectedValue));
    }
    public Pro_Require_Task_Res Pro_Require_Task_Res_update(int ID)
    {
        Pro_Require_Task_Res = Pro_Require_Task_Res.Select(ID);
        Pro_Require_Task_Res.Proj_Require_Task_Res_ID = Convert.ToInt32(Update_Proj_Require_Task_Res_ID_txt.Text);
        Pro_Require_Task_Res.project_id = Convert.ToInt32(Update_project_id_txt.Text);
        Pro_Require_Task_Res.Requirement_ID = Convert.ToInt32(Update_Requirement_ID_txt.Text);
        Pro_Require_Task_Res.task_id = Convert.ToInt32(Update_task_id_txt.Text);
        Pro_Require_Task_Res.Resource_ID = Convert.ToInt32(Update_Resource_ID_txt.Text);
        Pro_Require_Task_Res.Project_Catagory = Update_Project_Catagory_txt.Text;
        Pro_Require_Task_Res.Proj_Require_Description = Update_Proj_Require_Description_txt.Text;
        Pro_Require_Task_Res.Project_Task_Description = Update_Project_Task_Description_txt.Text;
        Pro_Require_Task_Res.Applicant_Name = Update_Applicant_Name_txt.Text;
        Pro_Require_Task_Res.Equipment_Description = Update_Equipment_Description_txt.Text;
        Pro_Require_Task_Res.Vehicle = Update_Vehicle_txt.Text;
        Pro_Require_Task_Res.Update(Pro_Require_Task_Res);
        Insert_Pro_Require_Task_Res_GridView.DataBind();
        Update_Pro_Require_Task_Res_GridView.DataBind();
        Delete_Pro_Require_Task_Res_GridView.DataBind();
        return Pro_Require_Task_Res;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        Pro_Require_Task_Res = Delete_Pro_Require_Task_Res_select(Convert.ToInt32(Delete_Pro_Require_Task_Res_GridView.SelectedValue));
    }
    public Pro_Require_Task_Res Delete_Pro_Require_Task_Res_select(int ID)
    {
        Pro_Require_Task_Res = Pro_Require_Task_Res.Select(ID);
        Delete_Proj_Require_Task_Res_ID_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Proj_Require_Task_Res_ID);
        Delete_project_id_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.project_id);
        Delete_Requirement_ID_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Requirement_ID);
        Delete_task_id_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.task_id);
        Delete_Resource_ID_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Resource_ID);
        Delete_Project_Catagory_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Project_Catagory);
        Delete_Proj_Require_Description_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Proj_Require_Description);
        Delete_Project_Task_Description_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Project_Task_Description);
        Delete_Applicant_Name_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Applicant_Name);
        Delete_Equipment_Description_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Equipment_Description);
        Delete_Vehicle_txt_lbl.Text = Convert.ToString(Pro_Require_Task_Res.Vehicle);
        return Pro_Require_Task_Res;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Pro_Require_Task_Res_delete(Convert.ToInt32(Delete_Pro_Require_Task_Res_GridView.SelectedValue));
    }
    public void Pro_Require_Task_Res_delete(int ID)
    {
        Pro_Require_Task_Res.Delete(ID);
        Insert_Pro_Require_Task_Res_GridView.DataBind();
        Update_Pro_Require_Task_Res_GridView.DataBind();
        Delete_Pro_Require_Task_Res_GridView.DataBind();
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

