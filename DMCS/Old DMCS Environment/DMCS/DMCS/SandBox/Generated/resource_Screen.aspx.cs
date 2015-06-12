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
public partial class resource_Screen : System.Web.UI.Page
{
            public resource resource = new resource();
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
        resource = Insert_resource_select(Convert.ToInt32(Insert_resource_GridView.SelectedValue));
    }
    public resource Insert_resource_select(int ID)
    {
        resource = resource.Select(ID);
        Insert_Location_ID_txt.Text = Convert.ToString(resource.Location_ID);
        Insert_Resource_Type_txt.Text = Convert.ToString(resource.Resource_Type);
        Insert_Date_Requested_txt.Text = Convert.ToString(resource.Date_Requested);
        return resource;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        resource = resource_insert();
    }
    public resource resource_insert()
    {
        resource.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        resource.Resource_Type = Insert_Resource_Type_txt.Text;
        resource.Date_Requested = Convert.ToDateTime(Insert_Date_Requested_txt.Text);
        resource = resource.Insert(resource);
        Insert_resource_GridView.DataBind();
        Update_resource_GridView.DataBind();
        Delete_resource_GridView.DataBind();
        return resource;
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
        resource = Update_resource_select(Convert.ToInt32(Update_resource_GridView.SelectedValue));
    }
    public resource Update_resource_select(int ID)
    {
        resource = resource.Select(ID);
        Update_Resource_ID_txt.Text = Convert.ToString(resource.Resource_ID);
        Update_Location_ID_txt.Text = Convert.ToString(resource.Location_ID);
        Update_Resource_Type_txt.Text = Convert.ToString(resource.Resource_Type);
        Update_Date_Requested_txt.Text = Convert.ToString(resource.Date_Requested);
        return resource;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        resource = resource_update(Convert.ToInt32(Update_resource_GridView.SelectedValue));
    }
    public resource resource_update(int ID)
    {
        resource = resource.Select(ID);
        resource.Resource_ID = Convert.ToInt32(Update_Resource_ID_txt.Text);
        resource.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        resource.Resource_Type = Update_Resource_Type_txt.Text;
        resource.Date_Requested = Convert.ToDateTime(Update_Date_Requested_txt.Text);
        resource.Update(resource);
        Insert_resource_GridView.DataBind();
        Update_resource_GridView.DataBind();
        Delete_resource_GridView.DataBind();
        return resource;
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
        resource = Delete_resource_select(Convert.ToInt32(Delete_resource_GridView.SelectedValue));
    }
    public resource Delete_resource_select(int ID)
    {
        resource = resource.Select(ID);
        Delete_Resource_ID_txt_lbl.Text = Convert.ToString(resource.Resource_ID);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(resource.Location_ID);
        Delete_Resource_Type_txt_lbl.Text = Convert.ToString(resource.Resource_Type);
        Delete_Date_Requested_txt_lbl.Text = Convert.ToString(resource.Date_Requested);
        return resource;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        resource_delete(Convert.ToInt32(Delete_resource_GridView.SelectedValue));
    }
    public void resource_delete(int ID)
    {
        resource.Delete(ID);
        Insert_resource_GridView.DataBind();
        Update_resource_GridView.DataBind();
        Delete_resource_GridView.DataBind();
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

