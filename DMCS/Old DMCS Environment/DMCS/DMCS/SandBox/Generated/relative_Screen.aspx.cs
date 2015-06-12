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
public partial class relative_Screen : System.Web.UI.Page
{
            public relative relative = new relative();
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
        relative = Insert_relative_select(Convert.ToInt32(Insert_relative_GridView.SelectedValue));
    }
    public relative Insert_relative_select(int ID)
    {
        relative = relative.Select(ID);
        Insert_case_id_txt.Text = Convert.ToString(relative.case_id);
        Insert_client_id_txt.Text = Convert.ToString(relative.client_id);
        Insert_address_id_txt.Text = Convert.ToString(relative.address_id);
        Insert_relative_help_memo_txt.Text = Convert.ToString(relative.relative_help_memo);
        Insert_will_help_txt.Text = Convert.ToString(relative.will_help);
        return relative;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        relative = relative_insert();
    }
    public relative relative_insert()
    {
        relative.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        relative.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        relative.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        relative.relative_help_memo = Insert_relative_help_memo_txt.Text;
        relative.will_help = Insert_will_help_txt.Text;
        relative = relative.Insert(relative);
        Insert_relative_GridView.DataBind();
        Update_relative_GridView.DataBind();
        Delete_relative_GridView.DataBind();
        return relative;
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
        relative = Update_relative_select(Convert.ToInt32(Update_relative_GridView.SelectedValue));
    }
    public relative Update_relative_select(int ID)
    {
        relative = relative.Select(ID);
        Update_relative_id_txt.Text = Convert.ToString(relative.relative_id);
        Update_case_id_txt.Text = Convert.ToString(relative.case_id);
        Update_client_id_txt.Text = Convert.ToString(relative.client_id);
        Update_address_id_txt.Text = Convert.ToString(relative.address_id);
        Update_relative_help_memo_txt.Text = Convert.ToString(relative.relative_help_memo);
        Update_will_help_txt.Text = Convert.ToString(relative.will_help);
        return relative;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        relative = relative_update(Convert.ToInt32(Update_relative_GridView.SelectedValue));
    }
    public relative relative_update(int ID)
    {
        relative = relative.Select(ID);
        relative.relative_id = Convert.ToInt32(Update_relative_id_txt.Text);
        relative.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        relative.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        relative.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        relative.relative_help_memo = Update_relative_help_memo_txt.Text;
        relative.will_help = Update_will_help_txt.Text;
        relative.Update(relative);
        Insert_relative_GridView.DataBind();
        Update_relative_GridView.DataBind();
        Delete_relative_GridView.DataBind();
        return relative;
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
        relative = Delete_relative_select(Convert.ToInt32(Delete_relative_GridView.SelectedValue));
    }
    public relative Delete_relative_select(int ID)
    {
        relative = relative.Select(ID);
        Delete_relative_id_txt_lbl.Text = Convert.ToString(relative.relative_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(relative.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(relative.client_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(relative.address_id);
        Delete_relative_help_memo_txt_lbl.Text = Convert.ToString(relative.relative_help_memo);
        Delete_will_help_txt_lbl.Text = Convert.ToString(relative.will_help);
        return relative;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        relative_delete(Convert.ToInt32(Delete_relative_GridView.SelectedValue));
    }
    public void relative_delete(int ID)
    {
        relative.Delete(ID);
        Insert_relative_GridView.DataBind();
        Update_relative_GridView.DataBind();
        Delete_relative_GridView.DataBind();
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

