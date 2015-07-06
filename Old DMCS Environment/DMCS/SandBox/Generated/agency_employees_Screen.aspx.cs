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
public partial class agency_employees_Screen : System.Web.UI.Page
{
            public agency_employees agency_employees = new agency_employees();
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
        agency_employees = Insert_agency_employees_select(Convert.ToInt32(Insert_agency_employees_GridView.SelectedValue));
    }
    public agency_employees Insert_agency_employees_select(int ID)
    {
        agency_employees = agency_employees.Select(ID);
        Insert_agency_id_txt.Text = Convert.ToString(agency_employees.agency_id);
        Insert_employee_id_txt.Text = Convert.ToString(agency_employees.employee_id);
        return agency_employees;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        agency_employees = agency_employees_insert();
    }
    public agency_employees agency_employees_insert()
    {
        agency_employees.agency_id = Convert.ToInt32(Insert_agency_id_txt.Text);
        agency_employees.employee_id = Convert.ToInt32(Insert_employee_id_txt.Text);
        agency_employees = agency_employees.Insert(agency_employees);
        Insert_agency_employees_GridView.DataBind();
        Update_agency_employees_GridView.DataBind();
        Delete_agency_employees_GridView.DataBind();
        return agency_employees;
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
        agency_employees = Update_agency_employees_select(Convert.ToInt32(Update_agency_employees_GridView.SelectedValue));
    }
    public agency_employees Update_agency_employees_select(int ID)
    {
        agency_employees = agency_employees.Select(ID);
        Update_agency_empl_id_txt.Text = Convert.ToString(agency_employees.agency_empl_id);
        Update_agency_id_txt.Text = Convert.ToString(agency_employees.agency_id);
        Update_employee_id_txt.Text = Convert.ToString(agency_employees.employee_id);
        return agency_employees;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        agency_employees = agency_employees_update(Convert.ToInt32(Update_agency_employees_GridView.SelectedValue));
    }
    public agency_employees agency_employees_update(int ID)
    {
        agency_employees = agency_employees.Select(ID);
        agency_employees.agency_empl_id = Convert.ToInt32(Update_agency_empl_id_txt.Text);
        agency_employees.agency_id = Convert.ToInt32(Update_agency_id_txt.Text);
        agency_employees.employee_id = Convert.ToInt32(Update_employee_id_txt.Text);
        agency_employees.Update(agency_employees);
        Insert_agency_employees_GridView.DataBind();
        Update_agency_employees_GridView.DataBind();
        Delete_agency_employees_GridView.DataBind();
        return agency_employees;
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
        agency_employees = Delete_agency_employees_select(Convert.ToInt32(Delete_agency_employees_GridView.SelectedValue));
    }
    public agency_employees Delete_agency_employees_select(int ID)
    {
        agency_employees = agency_employees.Select(ID);
        Delete_agency_empl_id_txt_lbl.Text = Convert.ToString(agency_employees.agency_empl_id);
        Delete_agency_id_txt_lbl.Text = Convert.ToString(agency_employees.agency_id);
        Delete_employee_id_txt_lbl.Text = Convert.ToString(agency_employees.employee_id);
        return agency_employees;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        agency_employees_delete(Convert.ToInt32(Delete_agency_employees_GridView.SelectedValue));
    }
    public void agency_employees_delete(int ID)
    {
        agency_employees.Delete(ID);
        Insert_agency_employees_GridView.DataBind();
        Update_agency_employees_GridView.DataBind();
        Delete_agency_employees_GridView.DataBind();
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

