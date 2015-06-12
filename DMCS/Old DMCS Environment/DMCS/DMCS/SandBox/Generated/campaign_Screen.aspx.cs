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
public partial class campaign_Screen : System.Web.UI.Page
{
            public campaign campaign = new campaign();
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
        campaign = Insert_campaign_select(Convert.ToInt32(Insert_campaign_GridView.SelectedValue));
    }
    public campaign Insert_campaign_select(int ID)
    {
        campaign = campaign.Select(ID);
        Insert_campaign_name_txt.Text = Convert.ToString(campaign.campaign_name);
        Insert_campaign_start_date_txt.Text = Convert.ToString(campaign.campaign_start_date);
        Insert_campaign_end_date_txt.Text = Convert.ToString(campaign.campaign_end_date);
        return campaign;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        campaign = campaign_insert();
    }
    public campaign campaign_insert()
    {
        campaign.campaign_name = Insert_campaign_name_txt.Text;
        campaign.campaign_start_date = Convert.ToDateTime(Insert_campaign_start_date_txt.Text);
        campaign.campaign_end_date = Convert.ToDateTime(Insert_campaign_end_date_txt.Text);
        campaign = campaign.Insert(campaign);
        Insert_campaign_GridView.DataBind();
        Update_campaign_GridView.DataBind();
        Delete_campaign_GridView.DataBind();
        return campaign;
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
        campaign = Update_campaign_select(Convert.ToInt32(Update_campaign_GridView.SelectedValue));
    }
    public campaign Update_campaign_select(int ID)
    {
        campaign = campaign.Select(ID);
        Update_campaign_id_txt.Text = Convert.ToString(campaign.campaign_id);
        Update_campaign_name_txt.Text = Convert.ToString(campaign.campaign_name);
        Update_campaign_start_date_txt.Text = Convert.ToString(campaign.campaign_start_date);
        Update_campaign_end_date_txt.Text = Convert.ToString(campaign.campaign_end_date);
        return campaign;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        campaign = campaign_update(Convert.ToInt32(Update_campaign_GridView.SelectedValue));
    }
    public campaign campaign_update(int ID)
    {
        campaign = campaign.Select(ID);
        campaign.campaign_id = Convert.ToInt32(Update_campaign_id_txt.Text);
        campaign.campaign_name = Update_campaign_name_txt.Text;
        campaign.campaign_start_date = Convert.ToDateTime(Update_campaign_start_date_txt.Text);
        campaign.campaign_end_date = Convert.ToDateTime(Update_campaign_end_date_txt.Text);
        campaign.Update(campaign);
        Insert_campaign_GridView.DataBind();
        Update_campaign_GridView.DataBind();
        Delete_campaign_GridView.DataBind();
        return campaign;
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
        campaign = Delete_campaign_select(Convert.ToInt32(Delete_campaign_GridView.SelectedValue));
    }
    public campaign Delete_campaign_select(int ID)
    {
        campaign = campaign.Select(ID);
        Delete_campaign_id_txt_lbl.Text = Convert.ToString(campaign.campaign_id);
        Delete_campaign_name_txt_lbl.Text = Convert.ToString(campaign.campaign_name);
        Delete_campaign_start_date_txt_lbl.Text = Convert.ToString(campaign.campaign_start_date);
        Delete_campaign_end_date_txt_lbl.Text = Convert.ToString(campaign.campaign_end_date);
        return campaign;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        campaign_delete(Convert.ToInt32(Delete_campaign_GridView.SelectedValue));
    }
    public void campaign_delete(int ID)
    {
        campaign.Delete(ID);
        Insert_campaign_GridView.DataBind();
        Update_campaign_GridView.DataBind();
        Delete_campaign_GridView.DataBind();
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

