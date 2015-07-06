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

namespace DMCS
{
public partial class locationDMCS_ : System.Web.UI.Page
{
            public locationDMCS locationDMCS = new locationDMCS();
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
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        locationDMCS = Insert_locationDMCS_select(Convert.ToInt32(Insert_locationDMCS_GridView.SelectedValue));
    }
    public locationDMCS Insert_locationDMCS_select(int ID)
    {
        locationDMCS = locationDMCS.Select(ID);
        Insert_city_txt.Text = Convert.ToString(locationDMCS.city);
        Insert_county_txt.Text = Convert.ToString(locationDMCS.county);
        Insert_e_lat_txt.Text = Convert.ToString(locationDMCS.e_lat);
        Insert_e_long_txt.Text = Convert.ToString(locationDMCS.e_long);
        Insert_location_desc_txt.Text = Convert.ToString(locationDMCS.location_desc);
        Insert_n_lat_txt.Text = Convert.ToString(locationDMCS.n_lat);
        Insert_n_long_txt.Text = Convert.ToString(locationDMCS.n_long);
        Insert_state_txt.Text = Convert.ToString(locationDMCS.state);
        Insert_type_txt.Text = Convert.ToString(locationDMCS.type);
        Insert_w_lat_txt.Text = Convert.ToString(locationDMCS.w_lat);
        Insert_w_long_txt.Text = Convert.ToString(locationDMCS.w_long);
        Insert_zip_txt.Text = Convert.ToString(locationDMCS.zip);
        return locationDMCS;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        locationDMCS = locationDMCS_insert();
    }
    public locationDMCS locationDMCS_insert()
    {
        locationDMCS.city = Insert_city_txt.Text;
        locationDMCS.county = Insert_county_txt.Text;
        locationDMCS.e_lat = Convert.ToInt32(Insert_e_lat_txt.Text);
        locationDMCS.e_long = Convert.ToInt32(Insert_e_long_txt.Text);
        locationDMCS.location_desc = Insert_location_desc_txt.Text;
        locationDMCS.n_lat = Convert.ToInt32(Insert_n_lat_txt.Text);
        locationDMCS.n_long = Convert.ToInt32(Insert_n_long_txt.Text);
        locationDMCS.state = Insert_state_txt.Text;
        locationDMCS.type = Insert_type_txt.Text;
        locationDMCS.w_lat = Convert.ToInt32(Insert_w_lat_txt.Text);
        locationDMCS.w_long = Convert.ToInt32(Insert_w_long_txt.Text);
        locationDMCS.zip = Convert.ToInt32(Insert_zip_txt.Text);
        locationDMCS = locationDMCS.Insert(locationDMCS);
        Insert_locationDMCS_GridView.DataBind();
        Update_locationDMCS_GridView.DataBind();
        Delete_locationDMCS_GridView.DataBind();
        return locationDMCS;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        locationDMCS = Update_locationDMCS_select(Convert.ToInt32(Update_locationDMCS_GridView.SelectedValue));
    }
    public locationDMCS Update_locationDMCS_select(int ID)
    {
        locationDMCS = locationDMCS.Select(ID);
        Update_locationdmcs_id_txt.Text = Convert.ToString(locationDMCS.locationdmcs_id);
        Update_city_txt.Text = Convert.ToString(locationDMCS.city);
        Update_county_txt.Text = Convert.ToString(locationDMCS.county);
        Update_e_lat_txt.Text = Convert.ToString(locationDMCS.e_lat);
        Update_e_long_txt.Text = Convert.ToString(locationDMCS.e_long);
        Update_location_desc_txt.Text = Convert.ToString(locationDMCS.location_desc);
        Update_n_lat_txt.Text = Convert.ToString(locationDMCS.n_lat);
        Update_n_long_txt.Text = Convert.ToString(locationDMCS.n_long);
        Update_state_txt.Text = Convert.ToString(locationDMCS.state);
        Update_type_txt.Text = Convert.ToString(locationDMCS.type);
        Update_w_lat_txt.Text = Convert.ToString(locationDMCS.w_lat);
        Update_w_long_txt.Text = Convert.ToString(locationDMCS.w_long);
        Update_zip_txt.Text = Convert.ToString(locationDMCS.zip);
        return locationDMCS;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        locationDMCS = locationDMCS_update(Convert.ToInt32(Update_locationDMCS_GridView.SelectedValue));
    }
    public locationDMCS locationDMCS_update(int ID)
    {
        locationDMCS = locationDMCS.Select(ID);
        locationDMCS.locationdmcs_id = Convert.ToInt32(Update_locationdmcs_id_txt.Text);
        locationDMCS.city = Update_city_txt.Text;
        locationDMCS.county = Update_county_txt.Text;
        locationDMCS.e_lat = Convert.ToInt32(Update_e_lat_txt.Text);
        locationDMCS.e_long = Convert.ToInt32(Update_e_long_txt.Text);
        locationDMCS.location_desc = Update_location_desc_txt.Text;
        locationDMCS.n_lat = Convert.ToInt32(Update_n_lat_txt.Text);
        locationDMCS.n_long = Convert.ToInt32(Update_n_long_txt.Text);
        locationDMCS.state = Update_state_txt.Text;
        locationDMCS.type = Update_type_txt.Text;
        locationDMCS.w_lat = Convert.ToInt32(Update_w_lat_txt.Text);
        locationDMCS.w_long = Convert.ToInt32(Update_w_long_txt.Text);
        locationDMCS.zip = Convert.ToInt32(Update_zip_txt.Text);
        locationDMCS.Update(locationDMCS);
        Insert_locationDMCS_GridView.DataBind();
        Update_locationDMCS_GridView.DataBind();
        Delete_locationDMCS_GridView.DataBind();
        return locationDMCS;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        locationDMCS = Delete_locationDMCS_select(Convert.ToInt32(Delete_locationDMCS_GridView.SelectedValue));
    }
    public locationDMCS Delete_locationDMCS_select(int ID)
    {
        locationDMCS = locationDMCS.Select(ID);
        Delete_locationdmcs_id_txt_lbl.Text = Convert.ToString(locationDMCS.locationdmcs_id);
        Delete_city_txt_lbl.Text = Convert.ToString(locationDMCS.city);
        Delete_county_txt_lbl.Text = Convert.ToString(locationDMCS.county);
        Delete_e_lat_txt_lbl.Text = Convert.ToString(locationDMCS.e_lat);
        Delete_e_long_txt_lbl.Text = Convert.ToString(locationDMCS.e_long);
        Delete_location_desc_txt_lbl.Text = Convert.ToString(locationDMCS.location_desc);
        Delete_n_lat_txt_lbl.Text = Convert.ToString(locationDMCS.n_lat);
        Delete_n_long_txt_lbl.Text = Convert.ToString(locationDMCS.n_long);
        Delete_state_txt_lbl.Text = Convert.ToString(locationDMCS.state);
        Delete_type_txt_lbl.Text = Convert.ToString(locationDMCS.type);
        Delete_w_lat_txt_lbl.Text = Convert.ToString(locationDMCS.w_lat);
        Delete_w_long_txt_lbl.Text = Convert.ToString(locationDMCS.w_long);
        Delete_zip_txt_lbl.Text = Convert.ToString(locationDMCS.zip);
        return locationDMCS;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        locationDMCS_delete(Convert.ToInt32(Delete_locationDMCS_GridView.SelectedValue));
    }
    public void locationDMCS_delete(int ID)
    {
        locationDMCS.Delete(ID);
        Insert_locationDMCS_GridView.DataBind();
        Update_locationDMCS_GridView.DataBind();
        Delete_locationDMCS_GridView.DataBind();
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

