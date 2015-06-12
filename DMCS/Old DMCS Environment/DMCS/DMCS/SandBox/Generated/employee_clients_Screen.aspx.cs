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
public partial class employee_clients_Screen : System.Web.UI.Page
{
            public employee_clients employee_clients = new employee_clients();
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
        employee_clients = Insert_employee_clients_select(Convert.ToInt32(Insert_employee_clients_GridView.SelectedValue));
    }
    public employee_clients Insert_employee_clients_select(int ID)
    {
        employee_clients = employee_clients.Select(ID);
        Insert_client_id_txt.Text = Convert.ToString(employee_clients.client_id);
        Insert_employee_id_txt.Text = Convert.ToString(employee_clients.employee_id);
        return employee_clients;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        employee_clients = employee_clients_insert();
    }
    public employee_clients employee_clients_insert()
    {
        employee_clients.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        employee_clients.employee_id = Convert.ToInt32(Insert_employee_id_txt.Text);
        employee_clients = employee_clients.Insert(employee_clients);
        Insert_employee_clients_GridView.DataBind();
        Update_employee_clients_GridView.DataBind();
        Delete_employee_clients_GridView.DataBind();
        return employee_clients;
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
        employee_clients = Update_employee_clients_select(Convert.ToInt32(Update_employee_clients_GridView.SelectedValue));
    }
    public employee_clients Update_employee_clients_select(int ID)
    {
        employee_clients = employee_clients.Select(ID);
        Update_emp_client_id_txt.Text = Convert.ToString(employee_clients.emp_client_id);
        Update_client_id_txt.Text = Convert.ToString(employee_clients.client_id);
        Update_employee_id_txt.Text = Convert.ToString(employee_clients.employee_id);
        return employee_clients;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        employee_clients = employee_clients_update(Convert.ToInt32(Update_employee_clients_GridView.SelectedValue));
    }
    public employee_clients employee_clients_update(int ID)
    {
        employee_clients = employee_clients.Select(ID);
        employee_clients.emp_client_id = Convert.ToInt32(Update_emp_client_id_txt.Text);
        employee_clients.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        employee_clients.employee_id = Convert.ToInt32(Update_employee_id_txt.Text);
        employee_clients.Update(employee_clients);
        Insert_employee_clients_GridView.DataBind();
        Update_employee_clients_GridView.DataBind();
        Delete_employee_clients_GridView.DataBind();
        return employee_clients;
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
        employee_clients = Delete_employee_clients_select(Convert.ToInt32(Delete_employee_clients_GridView.SelectedValue));
    }
    public employee_clients Delete_employee_clients_select(int ID)
    {
        employee_clients = employee_clients.Select(ID);
        Delete_emp_client_id_txt_lbl.Text = Convert.ToString(employee_clients.emp_client_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(employee_clients.client_id);
        Delete_employee_id_txt_lbl.Text = Convert.ToString(employee_clients.employee_id);
        return employee_clients;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        employee_clients_delete(Convert.ToInt32(Delete_employee_clients_GridView.SelectedValue));
    }
    public void employee_clients_delete(int ID)
    {
        employee_clients.Delete(ID);
        Insert_employee_clients_GridView.DataBind();
        Update_employee_clients_GridView.DataBind();
        Delete_employee_clients_GridView.DataBind();
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

