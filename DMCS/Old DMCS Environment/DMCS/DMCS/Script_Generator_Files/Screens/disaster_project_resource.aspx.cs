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
public partial class disaster_project_resource_ : System.Web.UI.Page
{
            public disaster_project_resource disaster_project_resource = new disaster_project_resource();
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
        disaster_project_resource = Insert_disaster_project_resource_select(Convert.ToInt32(Insert_disaster_project_resource_GridView.SelectedValue));
    }
    public disaster_project_resource Insert_disaster_project_resource_select(int ID)
    {
        disaster_project_resource = disaster_project_resource.Select(ID);
        Insert_person_hours_id_txt.Text = Convert.ToString(disaster_project_resource.person_hours_id);
        Insert_person_total_hours_txt.Text = Convert.ToString(disaster_project_resource.person_total_hours);
        Insert_person_total_cost_txt.Text = Convert.ToString(disaster_project_resource.person_total_cost);
        return disaster_project_resource;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        disaster_project_resource = disaster_project_resource_insert();
    }
    public disaster_project_resource disaster_project_resource_insert()
    {
        disaster_project_resource.person_hours_id = Convert.ToInt32(Insert_person_hours_id_txt.Text);
        disaster_project_resource.person_total_hours = Convert.ToDecimal(Insert_person_total_hours_txt.Text);
        disaster_project_resource.person_total_cost = Convert.ToDecimal(Insert_person_total_cost_txt.Text);
        disaster_project_resource = disaster_project_resource.Insert(disaster_project_resource);
        Insert_disaster_project_resource_GridView.DataBind();
        Update_disaster_project_resource_GridView.DataBind();
        Delete_disaster_project_resource_GridView.DataBind();
        return disaster_project_resource;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        disaster_project_resource = Update_disaster_project_resource_select(Convert.ToInt32(Update_disaster_project_resource_GridView.SelectedValue));
    }
    public disaster_project_resource Update_disaster_project_resource_select(int ID)
    {
        disaster_project_resource = disaster_project_resource.Select(ID);
        Update_disaster_project_resource_id_txt.Text = Convert.ToString(disaster_project_resource.disaster_project_resource_id);
        Update_person_hours_id_txt.Text = Convert.ToString(disaster_project_resource.person_hours_id);
        Update_person_total_hours_txt.Text = Convert.ToString(disaster_project_resource.person_total_hours);
        Update_person_total_cost_txt.Text = Convert.ToString(disaster_project_resource.person_total_cost);
        return disaster_project_resource;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        disaster_project_resource = disaster_project_resource_update(Convert.ToInt32(Update_disaster_project_resource_GridView.SelectedValue));
    }
    public disaster_project_resource disaster_project_resource_update(int ID)
    {
        disaster_project_resource = disaster_project_resource.Select(ID);
        disaster_project_resource.disaster_project_resource_id = Convert.ToInt32(Update_disaster_project_resource_id_txt.Text);
        disaster_project_resource.person_hours_id = Convert.ToInt32(Update_person_hours_id_txt.Text);
        disaster_project_resource.person_total_hours = Convert.ToDecimal(Update_person_total_hours_txt.Text);
        disaster_project_resource.person_total_cost = Convert.ToDecimal(Update_person_total_cost_txt.Text);
        disaster_project_resource.Update(disaster_project_resource);
        Insert_disaster_project_resource_GridView.DataBind();
        Update_disaster_project_resource_GridView.DataBind();
        Delete_disaster_project_resource_GridView.DataBind();
        return disaster_project_resource;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        disaster_project_resource = Delete_disaster_project_resource_select(Convert.ToInt32(Delete_disaster_project_resource_GridView.SelectedValue));
    }
    public disaster_project_resource Delete_disaster_project_resource_select(int ID)
    {
        disaster_project_resource = disaster_project_resource.Select(ID);
        Delete_disaster_project_resource_id_txt_lbl.Text = Convert.ToString(disaster_project_resource.disaster_project_resource_id);
        Delete_person_hours_id_txt_lbl.Text = Convert.ToString(disaster_project_resource.person_hours_id);
        Delete_person_total_hours_txt_lbl.Text = Convert.ToString(disaster_project_resource.person_total_hours);
        Delete_person_total_cost_txt_lbl.Text = Convert.ToString(disaster_project_resource.person_total_cost);
        return disaster_project_resource;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        disaster_project_resource_delete(Convert.ToInt32(Delete_disaster_project_resource_GridView.SelectedValue));
    }
    public void disaster_project_resource_delete(int ID)
    {
        disaster_project_resource.Delete(ID);
        Insert_disaster_project_resource_GridView.DataBind();
        Update_disaster_project_resource_GridView.DataBind();
        Delete_disaster_project_resource_GridView.DataBind();
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

