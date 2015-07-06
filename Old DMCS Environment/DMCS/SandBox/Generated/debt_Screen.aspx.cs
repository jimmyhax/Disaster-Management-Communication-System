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
public partial class debt_Screen : System.Web.UI.Page
{
            public debt debt = new debt();
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
        debt = Insert_debt_select(Convert.ToInt32(Insert_debt_GridView.SelectedValue));
    }
    public debt Insert_debt_select(int ID)
    {
        debt = debt.Select(ID);
        Insert_amt_paid_txt.Text = Convert.ToString(debt.amt_paid);
        Insert_case_id_txt.Text = Convert.ToString(debt.case_id);
        Insert_client_id_txt.Text = Convert.ToString(debt.client_id);
        Insert_creditor_name_txt.Text = Convert.ToString(debt.creditor_name);
        Insert_debt_amt_txt.Text = Convert.ToString(debt.debt_amt);
        Insert_item_purchased_txt.Text = Convert.ToString(debt.item_purchased);
        Insert_last_payment_date_txt.Text = Convert.ToString(debt.last_payment_date);
        Insert_purchase_date_txt.Text = Convert.ToString(debt.purchase_date);
        Insert_value_amt_txt.Text = Convert.ToString(debt.value_amt);
        return debt;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        debt = debt_insert();
    }
    public debt debt_insert()
    {
        debt.amt_paid = Convert.ToDecimal(Insert_amt_paid_txt.Text);
        debt.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        debt.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        debt.creditor_name = Insert_creditor_name_txt.Text;
        debt.debt_amt = Convert.ToDecimal(Insert_debt_amt_txt.Text);
        debt.item_purchased = Insert_item_purchased_txt.Text;
        debt.last_payment_date = Convert.ToDateTime(Insert_last_payment_date_txt.Text);
        debt.purchase_date = Convert.ToDateTime(Insert_purchase_date_txt.Text);
        debt.value_amt = Convert.ToDecimal(Insert_value_amt_txt.Text);
        debt = debt.Insert(debt);
        Insert_debt_GridView.DataBind();
        Update_debt_GridView.DataBind();
        Delete_debt_GridView.DataBind();
        return debt;
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
        debt = Update_debt_select(Convert.ToInt32(Update_debt_GridView.SelectedValue));
    }
    public debt Update_debt_select(int ID)
    {
        debt = debt.Select(ID);
        Update_debt_id_txt.Text = Convert.ToString(debt.debt_id);
        Update_amt_paid_txt.Text = Convert.ToString(debt.amt_paid);
        Update_case_id_txt.Text = Convert.ToString(debt.case_id);
        Update_client_id_txt.Text = Convert.ToString(debt.client_id);
        Update_creditor_name_txt.Text = Convert.ToString(debt.creditor_name);
        Update_debt_amt_txt.Text = Convert.ToString(debt.debt_amt);
        Update_item_purchased_txt.Text = Convert.ToString(debt.item_purchased);
        Update_last_payment_date_txt.Text = Convert.ToString(debt.last_payment_date);
        Update_purchase_date_txt.Text = Convert.ToString(debt.purchase_date);
        Update_value_amt_txt.Text = Convert.ToString(debt.value_amt);
        return debt;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        debt = debt_update(Convert.ToInt32(Update_debt_GridView.SelectedValue));
    }
    public debt debt_update(int ID)
    {
        debt = debt.Select(ID);
        debt.debt_id = Convert.ToInt32(Update_debt_id_txt.Text);
        debt.amt_paid = Convert.ToDecimal(Update_amt_paid_txt.Text);
        debt.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        debt.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        debt.creditor_name = Update_creditor_name_txt.Text;
        debt.debt_amt = Convert.ToDecimal(Update_debt_amt_txt.Text);
        debt.item_purchased = Update_item_purchased_txt.Text;
        debt.last_payment_date = Convert.ToDateTime(Update_last_payment_date_txt.Text);
        debt.purchase_date = Convert.ToDateTime(Update_purchase_date_txt.Text);
        debt.value_amt = Convert.ToDecimal(Update_value_amt_txt.Text);
        debt.Update(debt);
        Insert_debt_GridView.DataBind();
        Update_debt_GridView.DataBind();
        Delete_debt_GridView.DataBind();
        return debt;
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
        debt = Delete_debt_select(Convert.ToInt32(Delete_debt_GridView.SelectedValue));
    }
    public debt Delete_debt_select(int ID)
    {
        debt = debt.Select(ID);
        Delete_debt_id_txt_lbl.Text = Convert.ToString(debt.debt_id);
        Delete_amt_paid_txt_lbl.Text = Convert.ToString(debt.amt_paid);
        Delete_case_id_txt_lbl.Text = Convert.ToString(debt.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(debt.client_id);
        Delete_creditor_name_txt_lbl.Text = Convert.ToString(debt.creditor_name);
        Delete_debt_amt_txt_lbl.Text = Convert.ToString(debt.debt_amt);
        Delete_item_purchased_txt_lbl.Text = Convert.ToString(debt.item_purchased);
        Delete_last_payment_date_txt_lbl.Text = Convert.ToString(debt.last_payment_date);
        Delete_purchase_date_txt_lbl.Text = Convert.ToString(debt.purchase_date);
        Delete_value_amt_txt_lbl.Text = Convert.ToString(debt.value_amt);
        return debt;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        debt_delete(Convert.ToInt32(Delete_debt_GridView.SelectedValue));
    }
    public void debt_delete(int ID)
    {
        debt.Delete(ID);
        Insert_debt_GridView.DataBind();
        Update_debt_GridView.DataBind();
        Delete_debt_GridView.DataBind();
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

