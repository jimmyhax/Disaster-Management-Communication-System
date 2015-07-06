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
public partial class employee_Screen : System.Web.UI.Page
{
            public employee employee = new employee();
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
        employee = Insert_employee_select(Convert.ToInt32(Insert_employee_GridView.SelectedValue));
    }
    public employee Insert_employee_select(int ID)
    {
        employee = employee.Select(ID);
        Insert_employee_date_hired_txt.Text = Convert.ToString(employee.employee_date_hired);
        Insert_employee_department_txt.Text = Convert.ToString(employee.employee_department);
        Insert_employee_hours_worked_txt.Text = Convert.ToString(employee.employee_hours_worked);
        Insert_employee_leadership_txt.Text = Convert.ToString(employee.employee_leadership);
        Insert_employee_motivation_txt.Text = Convert.ToString(employee.employee_motivation);
        Insert_employee_notes_txt.Text = Convert.ToString(employee.employee_notes);
        Insert_employee_overall_txt.Text = Convert.ToString(employee.employee_overall);
        Insert_employee_payrate_txt.Text = Convert.ToString(employee.employee_payrate);
        Insert_employee_performance_txt.Text = Convert.ToString(employee.employee_performance);
        Insert_employee_quality_txt.Text = Convert.ToString(employee.employee_quality);
        Insert_employee_timeliness_txt.Text = Convert.ToString(employee.employee_timeliness);
        Insert_username_txt.Text = Convert.ToString(employee.username);
        Insert_pswd_txt.Text = Convert.ToString(employee.pswd);
        return employee;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        employee = employee_insert();
    }
    public employee employee_insert()
    {
        employee.employee_date_hired = Convert.ToDateTime(Insert_employee_date_hired_txt.Text);
        employee.employee_department = Insert_employee_department_txt.Text;
        employee.employee_hours_worked = Convert.ToInt32(Insert_employee_hours_worked_txt.Text);
        employee.employee_leadership = Insert_employee_leadership_txt.Text;
        employee.employee_motivation = Insert_employee_motivation_txt.Text;
        employee.employee_notes = Insert_employee_notes_txt.Text;
        employee.employee_overall = Insert_employee_overall_txt.Text;
        employee.employee_payrate = Convert.ToDecimal(Insert_employee_payrate_txt.Text);
        employee.employee_performance = Insert_employee_performance_txt.Text;
        employee.employee_quality = Insert_employee_quality_txt.Text;
        employee.employee_timeliness = Insert_employee_timeliness_txt.Text;
        employee.username = Insert_username_txt.Text;
        employee.pswd = Insert_pswd_txt.Text;
        employee = employee.Insert(employee);
        Insert_employee_GridView.DataBind();
        Update_employee_GridView.DataBind();
        Delete_employee_GridView.DataBind();
        return employee;
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
        employee = Update_employee_select(Convert.ToInt32(Update_employee_GridView.SelectedValue));
    }
    public employee Update_employee_select(int ID)
    {
        employee = employee.Select(ID);
        Update_employee_id_txt.Text = Convert.ToString(employee.employee_id);
        Update_employee_date_hired_txt.Text = Convert.ToString(employee.employee_date_hired);
        Update_employee_department_txt.Text = Convert.ToString(employee.employee_department);
        Update_employee_hours_worked_txt.Text = Convert.ToString(employee.employee_hours_worked);
        Update_employee_leadership_txt.Text = Convert.ToString(employee.employee_leadership);
        Update_employee_motivation_txt.Text = Convert.ToString(employee.employee_motivation);
        Update_employee_notes_txt.Text = Convert.ToString(employee.employee_notes);
        Update_employee_overall_txt.Text = Convert.ToString(employee.employee_overall);
        Update_employee_payrate_txt.Text = Convert.ToString(employee.employee_payrate);
        Update_employee_performance_txt.Text = Convert.ToString(employee.employee_performance);
        Update_employee_quality_txt.Text = Convert.ToString(employee.employee_quality);
        Update_employee_timeliness_txt.Text = Convert.ToString(employee.employee_timeliness);
        Update_username_txt.Text = Convert.ToString(employee.username);
        Update_pswd_txt.Text = Convert.ToString(employee.pswd);
        return employee;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        employee = employee_update(Convert.ToInt32(Update_employee_GridView.SelectedValue));
    }
    public employee employee_update(int ID)
    {
        employee = employee.Select(ID);
        employee.employee_id = Convert.ToInt32(Update_employee_id_txt.Text);
        employee.employee_date_hired = Convert.ToDateTime(Update_employee_date_hired_txt.Text);
        employee.employee_department = Update_employee_department_txt.Text;
        employee.employee_hours_worked = Convert.ToInt32(Update_employee_hours_worked_txt.Text);
        employee.employee_leadership = Update_employee_leadership_txt.Text;
        employee.employee_motivation = Update_employee_motivation_txt.Text;
        employee.employee_notes = Update_employee_notes_txt.Text;
        employee.employee_overall = Update_employee_overall_txt.Text;
        employee.employee_payrate = Convert.ToDecimal(Update_employee_payrate_txt.Text);
        employee.employee_performance = Update_employee_performance_txt.Text;
        employee.employee_quality = Update_employee_quality_txt.Text;
        employee.employee_timeliness = Update_employee_timeliness_txt.Text;
        employee.username = Update_username_txt.Text;
        employee.pswd = Update_pswd_txt.Text;
        employee.Update(employee);
        Insert_employee_GridView.DataBind();
        Update_employee_GridView.DataBind();
        Delete_employee_GridView.DataBind();
        return employee;
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
        employee = Delete_employee_select(Convert.ToInt32(Delete_employee_GridView.SelectedValue));
    }
    public employee Delete_employee_select(int ID)
    {
        employee = employee.Select(ID);
        Delete_employee_id_txt_lbl.Text = Convert.ToString(employee.employee_id);
        Delete_employee_date_hired_txt_lbl.Text = Convert.ToString(employee.employee_date_hired);
        Delete_employee_department_txt_lbl.Text = Convert.ToString(employee.employee_department);
        Delete_employee_hours_worked_txt_lbl.Text = Convert.ToString(employee.employee_hours_worked);
        Delete_employee_leadership_txt_lbl.Text = Convert.ToString(employee.employee_leadership);
        Delete_employee_motivation_txt_lbl.Text = Convert.ToString(employee.employee_motivation);
        Delete_employee_notes_txt_lbl.Text = Convert.ToString(employee.employee_notes);
        Delete_employee_overall_txt_lbl.Text = Convert.ToString(employee.employee_overall);
        Delete_employee_payrate_txt_lbl.Text = Convert.ToString(employee.employee_payrate);
        Delete_employee_performance_txt_lbl.Text = Convert.ToString(employee.employee_performance);
        Delete_employee_quality_txt_lbl.Text = Convert.ToString(employee.employee_quality);
        Delete_employee_timeliness_txt_lbl.Text = Convert.ToString(employee.employee_timeliness);
        Delete_username_txt_lbl.Text = Convert.ToString(employee.username);
        Delete_pswd_txt_lbl.Text = Convert.ToString(employee.pswd);
        return employee;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        employee_delete(Convert.ToInt32(Delete_employee_GridView.SelectedValue));
    }
    public void employee_delete(int ID)
    {
        employee.Delete(ID);
        Insert_employee_GridView.DataBind();
        Update_employee_GridView.DataBind();
        Delete_employee_GridView.DataBind();
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

