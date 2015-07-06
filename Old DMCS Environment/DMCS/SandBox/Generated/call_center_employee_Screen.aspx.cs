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
public partial class call_center_employee_Screen : System.Web.UI.Page
{
            public call_center_employee call_center_employee = new call_center_employee();
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
        call_center_employee = Insert_call_center_employee_select(Convert.ToInt32(Insert_call_center_employee_GridView.SelectedValue));
    }
    public call_center_employee Insert_call_center_employee_select(int ID)
    {
        call_center_employee = call_center_employee.Select(ID);
        Insert_call_center_id_txt.Text = Convert.ToString(call_center_employee.call_center_id);
        Insert_employee_id_txt.Text = Convert.ToString(call_center_employee.employee_id);
        return call_center_employee;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        call_center_employee = call_center_employee_insert();
    }
    public call_center_employee call_center_employee_insert()
    {
        call_center_employee.call_center_id = Convert.ToInt32(Insert_call_center_id_txt.Text);
        call_center_employee.employee_id = Convert.ToInt32(Insert_employee_id_txt.Text);
        call_center_employee = call_center_employee.Insert(call_center_employee);
        Insert_call_center_employee_GridView.DataBind();
        Update_call_center_employee_GridView.DataBind();
        Delete_call_center_employee_GridView.DataBind();
        return call_center_employee;
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
        call_center_employee = Update_call_center_employee_select(Convert.ToInt32(Update_call_center_employee_GridView.SelectedValue));
    }
    public call_center_employee Update_call_center_employee_select(int ID)
    {
        call_center_employee = call_center_employee.Select(ID);
        Update_call_center_employee_id_txt.Text = Convert.ToString(call_center_employee.call_center_employee_id);
        Update_call_center_id_txt.Text = Convert.ToString(call_center_employee.call_center_id);
        Update_employee_id_txt.Text = Convert.ToString(call_center_employee.employee_id);
        return call_center_employee;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        call_center_employee = call_center_employee_update(Convert.ToInt32(Update_call_center_employee_GridView.SelectedValue));
    }
    public call_center_employee call_center_employee_update(int ID)
    {
        call_center_employee = call_center_employee.Select(ID);
        call_center_employee.call_center_employee_id = Convert.ToInt32(Update_call_center_employee_id_txt.Text);
        call_center_employee.call_center_id = Convert.ToInt32(Update_call_center_id_txt.Text);
        call_center_employee.employee_id = Convert.ToInt32(Update_employee_id_txt.Text);
        call_center_employee.Update(call_center_employee);
        Insert_call_center_employee_GridView.DataBind();
        Update_call_center_employee_GridView.DataBind();
        Delete_call_center_employee_GridView.DataBind();
        return call_center_employee;
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
        call_center_employee = Delete_call_center_employee_select(Convert.ToInt32(Delete_call_center_employee_GridView.SelectedValue));
    }
    public call_center_employee Delete_call_center_employee_select(int ID)
    {
        call_center_employee = call_center_employee.Select(ID);
        Delete_call_center_employee_id_txt_lbl.Text = Convert.ToString(call_center_employee.call_center_employee_id);
        Delete_call_center_id_txt_lbl.Text = Convert.ToString(call_center_employee.call_center_id);
        Delete_employee_id_txt_lbl.Text = Convert.ToString(call_center_employee.employee_id);
        return call_center_employee;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        call_center_employee_delete(Convert.ToInt32(Delete_call_center_employee_GridView.SelectedValue));
    }
    public void call_center_employee_delete(int ID)
    {
        call_center_employee.Delete(ID);
        Insert_call_center_employee_GridView.DataBind();
        Update_call_center_employee_GridView.DataBind();
        Delete_call_center_employee_GridView.DataBind();
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

