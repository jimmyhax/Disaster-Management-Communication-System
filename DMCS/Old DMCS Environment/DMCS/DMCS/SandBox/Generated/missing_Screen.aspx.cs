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
public partial class missing_Screen : System.Web.UI.Page
{
            public missing missing = new missing();
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
        missing = Insert_missing_select(Convert.ToInt32(Insert_missing_GridView.SelectedValue));
    }
    public missing Insert_missing_select(int ID)
    {
        missing = missing.Select(ID);
        Insert_client_other_info_txt.Text = Convert.ToString(missing.client_other_info);
        Insert_clothing_txt.Text = Convert.ToString(missing.clothing);
        Insert_date_of_disappearance_txt.Text = Convert.ToString(missing.date_of_disappearance);
        Insert_last_known_location_txt.Text = Convert.ToString(missing.last_known_location);
        return missing;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        missing = missing_insert();
    }
    public missing missing_insert()
    {
        missing.client_other_info = Insert_client_other_info_txt.Text;
        missing.clothing = Insert_clothing_txt.Text;
        missing.date_of_disappearance = Convert.ToDateTime(Insert_date_of_disappearance_txt.Text);
        missing.last_known_location = Insert_last_known_location_txt.Text;
        missing = missing.Insert(missing);
        Insert_missing_GridView.DataBind();
        Update_missing_GridView.DataBind();
        Delete_missing_GridView.DataBind();
        return missing;
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
        missing = Update_missing_select(Convert.ToInt32(Update_missing_GridView.SelectedValue));
    }
    public missing Update_missing_select(int ID)
    {
        missing = missing.Select(ID);
        Update_Missing_id_txt.Text = Convert.ToString(missing.Missing_id);
        Update_client_other_info_txt.Text = Convert.ToString(missing.client_other_info);
        Update_clothing_txt.Text = Convert.ToString(missing.clothing);
        Update_date_of_disappearance_txt.Text = Convert.ToString(missing.date_of_disappearance);
        Update_last_known_location_txt.Text = Convert.ToString(missing.last_known_location);
        return missing;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        missing = missing_update(Convert.ToInt32(Update_missing_GridView.SelectedValue));
    }
    public missing missing_update(int ID)
    {
        missing = missing.Select(ID);
        missing.Missing_id = Convert.ToInt32(Update_Missing_id_txt.Text);
        missing.client_other_info = Update_client_other_info_txt.Text;
        missing.clothing = Update_clothing_txt.Text;
        missing.date_of_disappearance = Convert.ToDateTime(Update_date_of_disappearance_txt.Text);
        missing.last_known_location = Update_last_known_location_txt.Text;
        missing.Update(missing);
        Insert_missing_GridView.DataBind();
        Update_missing_GridView.DataBind();
        Delete_missing_GridView.DataBind();
        return missing;
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
        missing = Delete_missing_select(Convert.ToInt32(Delete_missing_GridView.SelectedValue));
    }
    public missing Delete_missing_select(int ID)
    {
        missing = missing.Select(ID);
        Delete_Missing_id_txt_lbl.Text = Convert.ToString(missing.Missing_id);
        Delete_client_other_info_txt_lbl.Text = Convert.ToString(missing.client_other_info);
        Delete_clothing_txt_lbl.Text = Convert.ToString(missing.clothing);
        Delete_date_of_disappearance_txt_lbl.Text = Convert.ToString(missing.date_of_disappearance);
        Delete_last_known_location_txt_lbl.Text = Convert.ToString(missing.last_known_location);
        return missing;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        missing_delete(Convert.ToInt32(Delete_missing_GridView.SelectedValue));
    }
    public void missing_delete(int ID)
    {
        missing.Delete(ID);
        Insert_missing_GridView.DataBind();
        Update_missing_GridView.DataBind();
        Delete_missing_GridView.DataBind();
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

