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
public partial class tier_req_Screen : System.Web.UI.Page
{
            public tier_req tier_req = new tier_req();
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
        tier_req = Insert_tier_req_select(Convert.ToInt32(Insert_tier_req_GridView.SelectedValue));
    }
    public tier_req Insert_tier_req_select(int ID)
    {
        tier_req = tier_req.Select(ID);
        Insert_req_id_txt.Text = Convert.ToString(tier_req.req_id);
        Insert_tier_id_txt.Text = Convert.ToString(tier_req.tier_id);
        return tier_req;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        tier_req = tier_req_insert();
    }
    public tier_req tier_req_insert()
    {
        tier_req.req_id = Convert.ToInt32(Insert_req_id_txt.Text);
        tier_req.tier_id = Convert.ToInt32(Insert_tier_id_txt.Text);
        tier_req = tier_req.Insert(tier_req);
        Insert_tier_req_GridView.DataBind();
        Update_tier_req_GridView.DataBind();
        Delete_tier_req_GridView.DataBind();
        return tier_req;
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
        tier_req = Update_tier_req_select(Convert.ToInt32(Update_tier_req_GridView.SelectedValue));
    }
    public tier_req Update_tier_req_select(int ID)
    {
        tier_req = tier_req.Select(ID);
        Update_tier_req_id_txt.Text = Convert.ToString(tier_req.tier_req_id);
        Update_req_id_txt.Text = Convert.ToString(tier_req.req_id);
        Update_tier_id_txt.Text = Convert.ToString(tier_req.tier_id);
        return tier_req;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        tier_req = tier_req_update(Convert.ToInt32(Update_tier_req_GridView.SelectedValue));
    }
    public tier_req tier_req_update(int ID)
    {
        tier_req = tier_req.Select(ID);
        tier_req.tier_req_id = Convert.ToInt32(Update_tier_req_id_txt.Text);
        tier_req.req_id = Convert.ToInt32(Update_req_id_txt.Text);
        tier_req.tier_id = Convert.ToInt32(Update_tier_id_txt.Text);
        tier_req.Update(tier_req);
        Insert_tier_req_GridView.DataBind();
        Update_tier_req_GridView.DataBind();
        Delete_tier_req_GridView.DataBind();
        return tier_req;
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
        tier_req = Delete_tier_req_select(Convert.ToInt32(Delete_tier_req_GridView.SelectedValue));
    }
    public tier_req Delete_tier_req_select(int ID)
    {
        tier_req = tier_req.Select(ID);
        Delete_tier_req_id_txt_lbl.Text = Convert.ToString(tier_req.tier_req_id);
        Delete_req_id_txt_lbl.Text = Convert.ToString(tier_req.req_id);
        Delete_tier_id_txt_lbl.Text = Convert.ToString(tier_req.tier_id);
        return tier_req;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        tier_req_delete(Convert.ToInt32(Delete_tier_req_GridView.SelectedValue));
    }
    public void tier_req_delete(int ID)
    {
        tier_req.Delete(ID);
        Insert_tier_req_GridView.DataBind();
        Update_tier_req_GridView.DataBind();
        Delete_tier_req_GridView.DataBind();
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

