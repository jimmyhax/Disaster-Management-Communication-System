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
public partial class call_center_Screen : System.Web.UI.Page
{
            public call_center call_center = new call_center();
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
        call_center = Insert_call_center_select(Convert.ToInt32(Insert_call_center_GridView.SelectedValue));
    }
    public call_center Insert_call_center_select(int ID)
    {
        call_center = call_center.Select(ID);
        Insert_address_id_txt.Text = Convert.ToString(call_center.address_id);
        Insert_call_center_name_txt.Text = Convert.ToString(call_center.call_center_name);
        return call_center;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        call_center = call_center_insert();
    }
    public call_center call_center_insert()
    {
        call_center.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        call_center.call_center_name = Insert_call_center_name_txt.Text;
        call_center = call_center.Insert(call_center);
        Insert_call_center_GridView.DataBind();
        Update_call_center_GridView.DataBind();
        Delete_call_center_GridView.DataBind();
        return call_center;
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
        call_center = Update_call_center_select(Convert.ToInt32(Update_call_center_GridView.SelectedValue));
    }
    public call_center Update_call_center_select(int ID)
    {
        call_center = call_center.Select(ID);
        Update_call_center_id_txt.Text = Convert.ToString(call_center.call_center_id);
        Update_address_id_txt.Text = Convert.ToString(call_center.address_id);
        Update_call_center_name_txt.Text = Convert.ToString(call_center.call_center_name);
        return call_center;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        call_center = call_center_update(Convert.ToInt32(Update_call_center_GridView.SelectedValue));
    }
    public call_center call_center_update(int ID)
    {
        call_center = call_center.Select(ID);
        call_center.call_center_id = Convert.ToInt32(Update_call_center_id_txt.Text);
        call_center.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        call_center.call_center_name = Update_call_center_name_txt.Text;
        call_center.Update(call_center);
        Insert_call_center_GridView.DataBind();
        Update_call_center_GridView.DataBind();
        Delete_call_center_GridView.DataBind();
        return call_center;
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
        call_center = Delete_call_center_select(Convert.ToInt32(Delete_call_center_GridView.SelectedValue));
    }
    public call_center Delete_call_center_select(int ID)
    {
        call_center = call_center.Select(ID);
        Delete_call_center_id_txt_lbl.Text = Convert.ToString(call_center.call_center_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(call_center.address_id);
        Delete_call_center_name_txt_lbl.Text = Convert.ToString(call_center.call_center_name);
        return call_center;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        call_center_delete(Convert.ToInt32(Delete_call_center_GridView.SelectedValue));
    }
    public void call_center_delete(int ID)
    {
        call_center.Delete(ID);
        Insert_call_center_GridView.DataBind();
        Update_call_center_GridView.DataBind();
        Delete_call_center_GridView.DataBind();
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

