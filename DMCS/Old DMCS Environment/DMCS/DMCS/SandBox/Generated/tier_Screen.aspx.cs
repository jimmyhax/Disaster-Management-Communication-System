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
public partial class tier_Screen : System.Web.UI.Page
{
            public tier tier = new tier();
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
        tier = Insert_tier_select(Convert.ToInt32(Insert_tier_GridView.SelectedValue));
    }
    public tier Insert_tier_select(int ID)
    {
        tier = tier.Select(ID);
        Insert_include_req_txt.Text = Convert.ToString(tier.include_req);
        Insert_campaign_id_txt.Text = Convert.ToString(tier.campaign_id);
        Insert_Tier_Age_Begin_Month_txt.Text = Convert.ToString(tier.Tier_Age_Begin_Month);
        Insert_Tier_Age_Begin_Year_txt.Text = Convert.ToString(tier.Tier_Age_Begin_Year);
        Insert_Tier_Age_End_Month_txt.Text = Convert.ToString(tier.Tier_Age_End_Month);
        Insert_Tier_Age_End_Year_txt.Text = Convert.ToString(tier.Tier_Age_End_Year);
        return tier;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        tier = tier_insert();
    }
    public tier tier_insert()
    {
        tier.include_req = Insert_include_req_txt.Text;
        tier.campaign_id = Convert.ToInt32(Insert_campaign_id_txt.Text);
        tier.Tier_Age_Begin_Month = Convert.ToInt32(Insert_Tier_Age_Begin_Month_txt.Text);
        tier.Tier_Age_Begin_Year = Convert.ToInt32(Insert_Tier_Age_Begin_Year_txt.Text);
        tier.Tier_Age_End_Month = Convert.ToInt32(Insert_Tier_Age_End_Month_txt.Text);
        tier.Tier_Age_End_Year = Convert.ToInt32(Insert_Tier_Age_End_Year_txt.Text);
        tier = tier.Insert(tier);
        Insert_tier_GridView.DataBind();
        Update_tier_GridView.DataBind();
        Delete_tier_GridView.DataBind();
        return tier;
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
        tier = Update_tier_select(Convert.ToInt32(Update_tier_GridView.SelectedValue));
    }
    public tier Update_tier_select(int ID)
    {
        tier = tier.Select(ID);
        Update_tier_id_txt.Text = Convert.ToString(tier.tier_id);
        Update_include_req_txt.Text = Convert.ToString(tier.include_req);
        Update_campaign_id_txt.Text = Convert.ToString(tier.campaign_id);
        Update_Tier_Age_Begin_Month_txt.Text = Convert.ToString(tier.Tier_Age_Begin_Month);
        Update_Tier_Age_Begin_Year_txt.Text = Convert.ToString(tier.Tier_Age_Begin_Year);
        Update_Tier_Age_End_Month_txt.Text = Convert.ToString(tier.Tier_Age_End_Month);
        Update_Tier_Age_End_Year_txt.Text = Convert.ToString(tier.Tier_Age_End_Year);
        return tier;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        tier = tier_update(Convert.ToInt32(Update_tier_GridView.SelectedValue));
    }
    public tier tier_update(int ID)
    {
        tier = tier.Select(ID);
        tier.tier_id = Convert.ToInt32(Update_tier_id_txt.Text);
        tier.include_req = Update_include_req_txt.Text;
        tier.campaign_id = Convert.ToInt32(Update_campaign_id_txt.Text);
        tier.Tier_Age_Begin_Month = Convert.ToInt32(Update_Tier_Age_Begin_Month_txt.Text);
        tier.Tier_Age_Begin_Year = Convert.ToInt32(Update_Tier_Age_Begin_Year_txt.Text);
        tier.Tier_Age_End_Month = Convert.ToInt32(Update_Tier_Age_End_Month_txt.Text);
        tier.Tier_Age_End_Year = Convert.ToInt32(Update_Tier_Age_End_Year_txt.Text);
        tier.Update(tier);
        Insert_tier_GridView.DataBind();
        Update_tier_GridView.DataBind();
        Delete_tier_GridView.DataBind();
        return tier;
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
        tier = Delete_tier_select(Convert.ToInt32(Delete_tier_GridView.SelectedValue));
    }
    public tier Delete_tier_select(int ID)
    {
        tier = tier.Select(ID);
        Delete_tier_id_txt_lbl.Text = Convert.ToString(tier.tier_id);
        Delete_include_req_txt_lbl.Text = Convert.ToString(tier.include_req);
        Delete_campaign_id_txt_lbl.Text = Convert.ToString(tier.campaign_id);
        Delete_Tier_Age_Begin_Month_txt_lbl.Text = Convert.ToString(tier.Tier_Age_Begin_Month);
        Delete_Tier_Age_Begin_Year_txt_lbl.Text = Convert.ToString(tier.Tier_Age_Begin_Year);
        Delete_Tier_Age_End_Month_txt_lbl.Text = Convert.ToString(tier.Tier_Age_End_Month);
        Delete_Tier_Age_End_Year_txt_lbl.Text = Convert.ToString(tier.Tier_Age_End_Year);
        return tier;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        tier_delete(Convert.ToInt32(Delete_tier_GridView.SelectedValue));
    }
    public void tier_delete(int ID)
    {
        tier.Delete(ID);
        Insert_tier_GridView.DataBind();
        Update_tier_GridView.DataBind();
        Delete_tier_GridView.DataBind();
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

