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
public partial class task_location_ : System.Web.UI.Page
{
            public task_location task_location = new task_location();
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
        task_location = Insert_task_location_select(Convert.ToInt32(Insert_task_location_GridView.SelectedValue));
    }
    public task_location Insert_task_location_select(int ID)
    {
        task_location = task_location.Select(ID);
        Insert_task_id_txt.Text = Convert.ToString(task_location.task_id);
        Insert_task_loc_description_txt.Text = Convert.ToString(task_location.task_loc_description);
        return task_location;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        task_location = task_location_insert();
    }
    public task_location task_location_insert()
    {
        task_location.task_id = Convert.ToInt32(Insert_task_id_txt.Text);
        task_location.task_loc_description = Insert_task_loc_description_txt.Text;
        task_location = task_location.Insert(task_location);
        Insert_task_location_GridView.DataBind();
        Update_task_location_GridView.DataBind();
        Delete_task_location_GridView.DataBind();
        return task_location;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        task_location = Update_task_location_select(Convert.ToInt32(Update_task_location_GridView.SelectedValue));
    }
    public task_location Update_task_location_select(int ID)
    {
        task_location = task_location.Select(ID);
        Update_task_loc_id_txt.Text = Convert.ToString(task_location.task_loc_id);
        Update_task_id_txt.Text = Convert.ToString(task_location.task_id);
        Update_task_loc_description_txt.Text = Convert.ToString(task_location.task_loc_description);
        return task_location;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        task_location = task_location_update(Convert.ToInt32(Update_task_location_GridView.SelectedValue));
    }
    public task_location task_location_update(int ID)
    {
        task_location = task_location.Select(ID);
        task_location.task_loc_id = Convert.ToInt32(Update_task_loc_id_txt.Text);
        task_location.task_id = Convert.ToInt32(Update_task_id_txt.Text);
        task_location.task_loc_description = Update_task_loc_description_txt.Text;
        task_location.Update(task_location);
        Insert_task_location_GridView.DataBind();
        Update_task_location_GridView.DataBind();
        Delete_task_location_GridView.DataBind();
        return task_location;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        task_location = Delete_task_location_select(Convert.ToInt32(Delete_task_location_GridView.SelectedValue));
    }
    public task_location Delete_task_location_select(int ID)
    {
        task_location = task_location.Select(ID);
        Delete_task_loc_id_txt_lbl.Text = Convert.ToString(task_location.task_loc_id);
        Delete_task_id_txt_lbl.Text = Convert.ToString(task_location.task_id);
        Delete_task_loc_description_txt_lbl.Text = Convert.ToString(task_location.task_loc_description);
        return task_location;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        task_location_delete(Convert.ToInt32(Delete_task_location_GridView.SelectedValue));
    }
    public void task_location_delete(int ID)
    {
        task_location.Delete(ID);
        Insert_task_location_GridView.DataBind();
        Update_task_location_GridView.DataBind();
        Delete_task_location_GridView.DataBind();
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

