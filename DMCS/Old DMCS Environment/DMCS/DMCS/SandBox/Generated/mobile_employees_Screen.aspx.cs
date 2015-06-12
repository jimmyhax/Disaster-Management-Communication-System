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
public partial class mobile_employees_Screen : System.Web.UI.Page
{
            public mobile_employees mobile_employees = new mobile_employees();
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
        mobile_employees = Insert_mobile_employees_select(Convert.ToInt32(Insert_mobile_employees_GridView.SelectedValue));
    }
    public mobile_employees Insert_mobile_employees_select(int ID)
    {
        mobile_employees = mobile_employees.Select(ID);
        Insert_mobile_unit_id_txt.Text = Convert.ToString(mobile_employees.mobile_unit_id);
        Insert_employee_id_txt.Text = Convert.ToString(mobile_employees.employee_id);
        return mobile_employees;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        mobile_employees = mobile_employees_insert();
    }
    public mobile_employees mobile_employees_insert()
    {
        mobile_employees.mobile_unit_id = Convert.ToInt32(Insert_mobile_unit_id_txt.Text);
        mobile_employees.employee_id = Convert.ToInt32(Insert_employee_id_txt.Text);
        mobile_employees = mobile_employees.Insert(mobile_employees);
        Insert_mobile_employees_GridView.DataBind();
        Update_mobile_employees_GridView.DataBind();
        Delete_mobile_employees_GridView.DataBind();
        return mobile_employees;
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
        mobile_employees = Update_mobile_employees_select(Convert.ToInt32(Update_mobile_employees_GridView.SelectedValue));
    }
    public mobile_employees Update_mobile_employees_select(int ID)
    {
        mobile_employees = mobile_employees.Select(ID);
        Update_mobile_employee_id_txt.Text = Convert.ToString(mobile_employees.mobile_employee_id);
        Update_mobile_unit_id_txt.Text = Convert.ToString(mobile_employees.mobile_unit_id);
        Update_employee_id_txt.Text = Convert.ToString(mobile_employees.employee_id);
        return mobile_employees;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        mobile_employees = mobile_employees_update(Convert.ToInt32(Update_mobile_employees_GridView.SelectedValue));
    }
    public mobile_employees mobile_employees_update(int ID)
    {
        mobile_employees = mobile_employees.Select(ID);
        mobile_employees.mobile_employee_id = Convert.ToInt32(Update_mobile_employee_id_txt.Text);
        mobile_employees.mobile_unit_id = Convert.ToInt32(Update_mobile_unit_id_txt.Text);
        mobile_employees.employee_id = Convert.ToInt32(Update_employee_id_txt.Text);
        mobile_employees.Update(mobile_employees);
        Insert_mobile_employees_GridView.DataBind();
        Update_mobile_employees_GridView.DataBind();
        Delete_mobile_employees_GridView.DataBind();
        return mobile_employees;
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
        mobile_employees = Delete_mobile_employees_select(Convert.ToInt32(Delete_mobile_employees_GridView.SelectedValue));
    }
    public mobile_employees Delete_mobile_employees_select(int ID)
    {
        mobile_employees = mobile_employees.Select(ID);
        Delete_mobile_employee_id_txt_lbl.Text = Convert.ToString(mobile_employees.mobile_employee_id);
        Delete_mobile_unit_id_txt_lbl.Text = Convert.ToString(mobile_employees.mobile_unit_id);
        Delete_employee_id_txt_lbl.Text = Convert.ToString(mobile_employees.employee_id);
        return mobile_employees;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        mobile_employees_delete(Convert.ToInt32(Delete_mobile_employees_GridView.SelectedValue));
    }
    public void mobile_employees_delete(int ID)
    {
        mobile_employees.Delete(ID);
        Insert_mobile_employees_GridView.DataBind();
        Update_mobile_employees_GridView.DataBind();
        Delete_mobile_employees_GridView.DataBind();
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

