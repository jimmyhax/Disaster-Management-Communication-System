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
public partial class skills_ : System.Web.UI.Page
{
            public skills skills = new skills();
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
        skills = Insert_skills_select(Convert.ToInt32(Insert_skills_GridView.SelectedValue));
    }
    public skills Insert_skills_select(int ID)
    {
        skills = skills.Select(ID);
        Insert_skills_description_txt.Text = Convert.ToString(skills.skills_description);
        return skills;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        skills = skills_insert();
    }
    public skills skills_insert()
    {
        skills.skills_description = Insert_skills_description_txt.Text;
        skills = skills.Insert(skills);
        Insert_skills_GridView.DataBind();
        Update_skills_GridView.DataBind();
        Delete_skills_GridView.DataBind();
        return skills;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        skills = Update_skills_select(Convert.ToInt32(Update_skills_GridView.SelectedValue));
    }
    public skills Update_skills_select(int ID)
    {
        skills = skills.Select(ID);
        Update_skills_id_txt.Text = Convert.ToString(skills.skills_id);
        Update_skills_description_txt.Text = Convert.ToString(skills.skills_description);
        return skills;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        skills = skills_update(Convert.ToInt32(Update_skills_GridView.SelectedValue));
    }
    public skills skills_update(int ID)
    {
        skills = skills.Select(ID);
        skills.skills_id = Convert.ToInt32(Update_skills_id_txt.Text);
        skills.skills_description = Update_skills_description_txt.Text;
        skills.Update(skills);
        Insert_skills_GridView.DataBind();
        Update_skills_GridView.DataBind();
        Delete_skills_GridView.DataBind();
        return skills;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        skills = Delete_skills_select(Convert.ToInt32(Delete_skills_GridView.SelectedValue));
    }
    public skills Delete_skills_select(int ID)
    {
        skills = skills.Select(ID);
        Delete_skills_id_txt_lbl.Text = Convert.ToString(skills.skills_id);
        Delete_skills_description_txt_lbl.Text = Convert.ToString(skills.skills_description);
        return skills;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        skills_delete(Convert.ToInt32(Delete_skills_GridView.SelectedValue));
    }
    public void skills_delete(int ID)
    {
        skills.Delete(ID);
        Insert_skills_GridView.DataBind();
        Update_skills_GridView.DataBind();
        Delete_skills_GridView.DataBind();
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

