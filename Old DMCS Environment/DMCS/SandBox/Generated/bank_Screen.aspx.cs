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
public partial class bank_Screen : System.Web.UI.Page
{
            public bank bank = new bank();
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
        bank = Insert_bank_select(Convert.ToInt32(Insert_bank_GridView.SelectedValue));
    }
    public bank Insert_bank_select(int ID)
    {
        bank = bank.Select(ID);
        Insert_Routing_Num_txt.Text = Convert.ToString(bank.Routing_Num);
        Insert_Name_txt.Text = Convert.ToString(bank.Name);
        Insert_IsFDIC_txt.Text = Convert.ToString(bank.IsFDIC);
        return bank;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        bank = bank_insert();
    }
    public bank bank_insert()
    {
        bank.Routing_Num = Insert_Routing_Num_txt.Text;
        bank.Name = Insert_Name_txt.Text;
        bank.IsFDIC = Convert.ToBoolean(Insert_IsFDIC_txt.Text);
        bank = bank.Insert(bank);
        Insert_bank_GridView.DataBind();
        Update_bank_GridView.DataBind();
        Delete_bank_GridView.DataBind();
        return bank;
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
        bank = Update_bank_select(Convert.ToInt32(Update_bank_GridView.SelectedValue));
    }
    public bank Update_bank_select(int ID)
    {
        bank = bank.Select(ID);
        Update_Bank_ID_txt.Text = Convert.ToString(bank.Bank_ID);
        Update_Routing_Num_txt.Text = Convert.ToString(bank.Routing_Num);
        Update_Name_txt.Text = Convert.ToString(bank.Name);
        Update_IsFDIC_txt.Text = Convert.ToString(bank.IsFDIC);
        return bank;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        bank = bank_update(Convert.ToInt32(Update_bank_GridView.SelectedValue));
    }
    public bank bank_update(int ID)
    {
        bank = bank.Select(ID);
        bank.Bank_ID = Convert.ToInt32(Update_Bank_ID_txt.Text);
        bank.Routing_Num = Update_Routing_Num_txt.Text;
        bank.Name = Update_Name_txt.Text;
        bank.IsFDIC = Convert.ToBoolean(Update_IsFDIC_txt.Text);
        bank.Update(bank);
        Insert_bank_GridView.DataBind();
        Update_bank_GridView.DataBind();
        Delete_bank_GridView.DataBind();
        return bank;
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
        bank = Delete_bank_select(Convert.ToInt32(Delete_bank_GridView.SelectedValue));
    }
    public bank Delete_bank_select(int ID)
    {
        bank = bank.Select(ID);
        Delete_Bank_ID_txt_lbl.Text = Convert.ToString(bank.Bank_ID);
        Delete_Routing_Num_txt_lbl.Text = Convert.ToString(bank.Routing_Num);
        Delete_Name_txt_lbl.Text = Convert.ToString(bank.Name);
        Delete_IsFDIC_txt_lbl.Text = Convert.ToString(bank.IsFDIC);
        return bank;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        bank_delete(Convert.ToInt32(Delete_bank_GridView.SelectedValue));
    }
    public void bank_delete(int ID)
    {
        bank.Delete(ID);
        Insert_bank_GridView.DataBind();
        Update_bank_GridView.DataBind();
        Delete_bank_GridView.DataBind();
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

