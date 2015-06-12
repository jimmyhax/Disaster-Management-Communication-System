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
public partial class expense_Screen : System.Web.UI.Page
{
            public expense expense = new expense();
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
        expense = Insert_expense_select(Convert.ToInt32(Insert_expense_GridView.SelectedValue));
    }
    public expense Insert_expense_select(int ID)
    {
        expense = expense.Select(ID);
        Insert_case_id_txt.Text = Convert.ToString(expense.case_id);
        Insert_client_id_txt.Text = Convert.ToString(expense.client_id);
        Insert_date_paid_txt.Text = Convert.ToString(expense.date_paid);
        Insert_expense_amt_paid_txt.Text = Convert.ToString(expense.expense_amt_paid);
        Insert_expense_amt_paid_to_txt.Text = Convert.ToString(expense.expense_amt_paid_to);
        return expense;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        expense = expense_insert();
    }
    public expense expense_insert()
    {
        expense.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        expense.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        expense.date_paid = Convert.ToDateTime(Insert_date_paid_txt.Text);
        expense.expense_amt_paid = Convert.ToDecimal(Insert_expense_amt_paid_txt.Text);
        expense.expense_amt_paid_to = Insert_expense_amt_paid_to_txt.Text;
        expense = expense.Insert(expense);
        Insert_expense_GridView.DataBind();
        Update_expense_GridView.DataBind();
        Delete_expense_GridView.DataBind();
        return expense;
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
        expense = Update_expense_select(Convert.ToInt32(Update_expense_GridView.SelectedValue));
    }
    public expense Update_expense_select(int ID)
    {
        expense = expense.Select(ID);
        Update_expense_id_txt.Text = Convert.ToString(expense.expense_id);
        Update_case_id_txt.Text = Convert.ToString(expense.case_id);
        Update_client_id_txt.Text = Convert.ToString(expense.client_id);
        Update_date_paid_txt.Text = Convert.ToString(expense.date_paid);
        Update_expense_amt_paid_txt.Text = Convert.ToString(expense.expense_amt_paid);
        Update_expense_amt_paid_to_txt.Text = Convert.ToString(expense.expense_amt_paid_to);
        return expense;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        expense = expense_update(Convert.ToInt32(Update_expense_GridView.SelectedValue));
    }
    public expense expense_update(int ID)
    {
        expense = expense.Select(ID);
        expense.expense_id = Convert.ToInt32(Update_expense_id_txt.Text);
        expense.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        expense.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        expense.date_paid = Convert.ToDateTime(Update_date_paid_txt.Text);
        expense.expense_amt_paid = Convert.ToDecimal(Update_expense_amt_paid_txt.Text);
        expense.expense_amt_paid_to = Update_expense_amt_paid_to_txt.Text;
        expense.Update(expense);
        Insert_expense_GridView.DataBind();
        Update_expense_GridView.DataBind();
        Delete_expense_GridView.DataBind();
        return expense;
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
        expense = Delete_expense_select(Convert.ToInt32(Delete_expense_GridView.SelectedValue));
    }
    public expense Delete_expense_select(int ID)
    {
        expense = expense.Select(ID);
        Delete_expense_id_txt_lbl.Text = Convert.ToString(expense.expense_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(expense.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(expense.client_id);
        Delete_date_paid_txt_lbl.Text = Convert.ToString(expense.date_paid);
        Delete_expense_amt_paid_txt_lbl.Text = Convert.ToString(expense.expense_amt_paid);
        Delete_expense_amt_paid_to_txt_lbl.Text = Convert.ToString(expense.expense_amt_paid_to);
        return expense;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        expense_delete(Convert.ToInt32(Delete_expense_GridView.SelectedValue));
    }
    public void expense_delete(int ID)
    {
        expense.Delete(ID);
        Insert_expense_GridView.DataBind();
        Update_expense_GridView.DataBind();
        Delete_expense_GridView.DataBind();
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

