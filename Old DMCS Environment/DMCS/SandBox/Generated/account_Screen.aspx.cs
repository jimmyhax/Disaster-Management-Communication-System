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
public partial class account_Screen : System.Web.UI.Page
{
            public account account = new account();
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
        account = Insert_account_select(Convert.ToInt32(Insert_account_GridView.SelectedValue));
    }
    public account Insert_account_select(int ID)
    {
        account = account.Select(ID);
        Insert_Bank_ID_txt.Text = Convert.ToString(account.Bank_ID);
        Insert_Account_Num_txt.Text = Convert.ToString(account.Account_Num);
        Insert_Type_txt.Text = Convert.ToString(account.Type);
        return account;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        account = account_insert();
    }
    public account account_insert()
    {
        account.Bank_ID = Convert.ToInt32(Insert_Bank_ID_txt.Text);
        account.Account_Num = Insert_Account_Num_txt.Text;
        account.Type = Insert_Type_txt.Text;
        account = account.Insert(account);
        Insert_account_GridView.DataBind();
        Update_account_GridView.DataBind();
        Delete_account_GridView.DataBind();
        return account;
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
        account = Update_account_select(Convert.ToInt32(Update_account_GridView.SelectedValue));
    }
    public account Update_account_select(int ID)
    {
        account = account.Select(ID);
        Update_Account_ID_txt.Text = Convert.ToString(account.Account_ID);
        Update_Bank_ID_txt.Text = Convert.ToString(account.Bank_ID);
        Update_Account_Num_txt.Text = Convert.ToString(account.Account_Num);
        Update_Type_txt.Text = Convert.ToString(account.Type);
        return account;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        account = account_update(Convert.ToInt32(Update_account_GridView.SelectedValue));
    }
    public account account_update(int ID)
    {
        account = account.Select(ID);
        account.Account_ID = Convert.ToInt32(Update_Account_ID_txt.Text);
        account.Bank_ID = Convert.ToInt32(Update_Bank_ID_txt.Text);
        account.Account_Num = Update_Account_Num_txt.Text;
        account.Type = Update_Type_txt.Text;
        account.Update(account);
        Insert_account_GridView.DataBind();
        Update_account_GridView.DataBind();
        Delete_account_GridView.DataBind();
        return account;
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
        account = Delete_account_select(Convert.ToInt32(Delete_account_GridView.SelectedValue));
    }
    public account Delete_account_select(int ID)
    {
        account = account.Select(ID);
        Delete_Account_ID_txt_lbl.Text = Convert.ToString(account.Account_ID);
        Delete_Bank_ID_txt_lbl.Text = Convert.ToString(account.Bank_ID);
        Delete_Account_Num_txt_lbl.Text = Convert.ToString(account.Account_Num);
        Delete_Type_txt_lbl.Text = Convert.ToString(account.Type);
        return account;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        account_delete(Convert.ToInt32(Delete_account_GridView.SelectedValue));
    }
    public void account_delete(int ID)
    {
        account.Delete(ID);
        Insert_account_GridView.DataBind();
        Update_account_GridView.DataBind();
        Delete_account_GridView.DataBind();
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

