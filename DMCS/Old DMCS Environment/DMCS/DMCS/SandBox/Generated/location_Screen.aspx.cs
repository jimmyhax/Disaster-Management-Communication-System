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
public partial class location_Screen : System.Web.UI.Page
{
            public location location = new location();
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
        location = Insert_location_select(Convert.ToInt32(Insert_location_GridView.SelectedValue));
    }
    public location Insert_location_select(int ID)
    {
        location = location.Select(ID);
        Insert_type_txt.Text = Convert.ToString(location.type);
        Insert_city_txt.Text = Convert.ToString(location.city);
        Insert_state_txt.Text = Convert.ToString(location.state);
        Insert_zip_txt.Text = Convert.ToString(location.zip);
        Insert_county_txt.Text = Convert.ToString(location.county);
        Insert_location_desc_txt.Text = Convert.ToString(location.location_desc);
        Insert_n_long_txt.Text = Convert.ToString(location.n_long);
        Insert_s_long_txt.Text = Convert.ToString(location.s_long);
        Insert_e_long_txt.Text = Convert.ToString(location.e_long);
        Insert_w_long_txt.Text = Convert.ToString(location.w_long);
        Insert_n_lat_txt.Text = Convert.ToString(location.n_lat);
        Insert_s_lat_txt.Text = Convert.ToString(location.s_lat);
        Insert_e_lat_txt.Text = Convert.ToString(location.e_lat);
        Insert_w_lat_txt.Text = Convert.ToString(location.w_lat);
        return location;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        location = location_insert();
    }
    public location location_insert()
    {
        location.type = Insert_type_txt.Text;
        location.city = Insert_city_txt.Text;
        location.state = Insert_state_txt.Text;
        location.zip = Convert.ToInt32(Insert_zip_txt.Text);
        location.county = Insert_county_txt.Text;
        location.location_desc = Insert_location_desc_txt.Text;
        location.n_long = Convert.ToDecimal(Insert_n_long_txt.Text);
        location.s_long = Convert.ToDecimal(Insert_s_long_txt.Text);
        location.e_long = Convert.ToDecimal(Insert_e_long_txt.Text);
        location.w_long = Convert.ToDecimal(Insert_w_long_txt.Text);
        location.n_lat = Convert.ToDecimal(Insert_n_lat_txt.Text);
        location.s_lat = Convert.ToDecimal(Insert_s_lat_txt.Text);
        location.e_lat = Convert.ToDecimal(Insert_e_lat_txt.Text);
        location.w_lat = Convert.ToDecimal(Insert_w_lat_txt.Text);
        location = location.Insert(location);
        Insert_location_GridView.DataBind();
        Update_location_GridView.DataBind();
        Delete_location_GridView.DataBind();
        return location;
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
        location = Update_location_select(Convert.ToInt32(Update_location_GridView.SelectedValue));
    }
    public location Update_location_select(int ID)
    {
        location = location.Select(ID);
        Update_Location_ID_txt.Text = Convert.ToString(location.Location_ID);
        Update_type_txt.Text = Convert.ToString(location.type);
        Update_city_txt.Text = Convert.ToString(location.city);
        Update_state_txt.Text = Convert.ToString(location.state);
        Update_zip_txt.Text = Convert.ToString(location.zip);
        Update_county_txt.Text = Convert.ToString(location.county);
        Update_location_desc_txt.Text = Convert.ToString(location.location_desc);
        Update_n_long_txt.Text = Convert.ToString(location.n_long);
        Update_s_long_txt.Text = Convert.ToString(location.s_long);
        Update_e_long_txt.Text = Convert.ToString(location.e_long);
        Update_w_long_txt.Text = Convert.ToString(location.w_long);
        Update_n_lat_txt.Text = Convert.ToString(location.n_lat);
        Update_s_lat_txt.Text = Convert.ToString(location.s_lat);
        Update_e_lat_txt.Text = Convert.ToString(location.e_lat);
        Update_w_lat_txt.Text = Convert.ToString(location.w_lat);
        return location;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        location = location_update(Convert.ToInt32(Update_location_GridView.SelectedValue));
    }
    public location location_update(int ID)
    {
        location = location.Select(ID);
        location.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        location.type = Update_type_txt.Text;
        location.city = Update_city_txt.Text;
        location.state = Update_state_txt.Text;
        location.zip = Convert.ToInt32(Update_zip_txt.Text);
        location.county = Update_county_txt.Text;
        location.location_desc = Update_location_desc_txt.Text;
        location.n_long = Convert.ToDecimal(Update_n_long_txt.Text);
        location.s_long = Convert.ToDecimal(Update_s_long_txt.Text);
        location.e_long = Convert.ToDecimal(Update_e_long_txt.Text);
        location.w_long = Convert.ToDecimal(Update_w_long_txt.Text);
        location.n_lat = Convert.ToDecimal(Update_n_lat_txt.Text);
        location.s_lat = Convert.ToDecimal(Update_s_lat_txt.Text);
        location.e_lat = Convert.ToDecimal(Update_e_lat_txt.Text);
        location.w_lat = Convert.ToDecimal(Update_w_lat_txt.Text);
        location.Update(location);
        Insert_location_GridView.DataBind();
        Update_location_GridView.DataBind();
        Delete_location_GridView.DataBind();
        return location;
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
        location = Delete_location_select(Convert.ToInt32(Delete_location_GridView.SelectedValue));
    }
    public location Delete_location_select(int ID)
    {
        location = location.Select(ID);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(location.Location_ID);
        Delete_type_txt_lbl.Text = Convert.ToString(location.type);
        Delete_city_txt_lbl.Text = Convert.ToString(location.city);
        Delete_state_txt_lbl.Text = Convert.ToString(location.state);
        Delete_zip_txt_lbl.Text = Convert.ToString(location.zip);
        Delete_county_txt_lbl.Text = Convert.ToString(location.county);
        Delete_location_desc_txt_lbl.Text = Convert.ToString(location.location_desc);
        Delete_n_long_txt_lbl.Text = Convert.ToString(location.n_long);
        Delete_s_long_txt_lbl.Text = Convert.ToString(location.s_long);
        Delete_e_long_txt_lbl.Text = Convert.ToString(location.e_long);
        Delete_w_long_txt_lbl.Text = Convert.ToString(location.w_long);
        Delete_n_lat_txt_lbl.Text = Convert.ToString(location.n_lat);
        Delete_s_lat_txt_lbl.Text = Convert.ToString(location.s_lat);
        Delete_e_lat_txt_lbl.Text = Convert.ToString(location.e_lat);
        Delete_w_lat_txt_lbl.Text = Convert.ToString(location.w_lat);
        return location;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        location_delete(Convert.ToInt32(Delete_location_GridView.SelectedValue));
    }
    public void location_delete(int ID)
    {
        location.Delete(ID);
        Insert_location_GridView.DataBind();
        Update_location_GridView.DataBind();
        Delete_location_GridView.DataBind();
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

