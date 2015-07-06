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
public partial class disaster_Screen : System.Web.UI.Page
{
            public disaster disaster = new disaster();
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
        disaster = Insert_disaster_select(Convert.ToInt32(Insert_disaster_GridView.SelectedValue));
    }
    public disaster Insert_disaster_select(int ID)
    {
        disaster = disaster.Select(ID);
        Insert_disaster_name_txt.Text = Convert.ToString(disaster.disaster_name);
        Insert_disaster_type_txt.Text = Convert.ToString(disaster.disaster_type);
        Insert_disaster_start_date_txt.Text = Convert.ToString(disaster.disaster_start_date);
        Insert_disaster_end_date_txt.Text = Convert.ToString(disaster.disaster_end_date);
        Insert_disaster_north_latitude_txt.Text = Convert.ToString(disaster.disaster_north_latitude);
        Insert_disaster_north_longitude_txt.Text = Convert.ToString(disaster.disaster_north_longitude);
        Insert_disaster_south_latitude_txt.Text = Convert.ToString(disaster.disaster_south_latitude);
        Insert_disaster_south_longitude_txt.Text = Convert.ToString(disaster.disaster_south_longitude);
        Insert_disaster_east_latitude_txt.Text = Convert.ToString(disaster.disaster_east_latitude);
        Insert_disaster_east_longitude_txt.Text = Convert.ToString(disaster.disaster_east_longitude);
        Insert_disaster_west_latitude_txt.Text = Convert.ToString(disaster.disaster_west_latitude);
        Insert_disaster_west_longitude_txt.Text = Convert.ToString(disaster.disaster_west_longitude);
        return disaster;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        disaster = disaster_insert();
    }
    public disaster disaster_insert()
    {
        disaster.disaster_name = Insert_disaster_name_txt.Text;
        disaster.disaster_type = Insert_disaster_type_txt.Text;
        disaster.disaster_start_date = Convert.ToDateTime(Insert_disaster_start_date_txt.Text);
        disaster.disaster_end_date = Convert.ToDateTime(Insert_disaster_end_date_txt.Text);
        disaster.disaster_north_latitude = Convert.ToDecimal(Insert_disaster_north_latitude_txt.Text);
        disaster.disaster_north_longitude = Convert.ToDecimal(Insert_disaster_north_longitude_txt.Text);
        disaster.disaster_south_latitude = Convert.ToDecimal(Insert_disaster_south_latitude_txt.Text);
        disaster.disaster_south_longitude = Convert.ToDecimal(Insert_disaster_south_longitude_txt.Text);
        disaster.disaster_east_latitude = Convert.ToDecimal(Insert_disaster_east_latitude_txt.Text);
        disaster.disaster_east_longitude = Convert.ToDecimal(Insert_disaster_east_longitude_txt.Text);
        disaster.disaster_west_latitude = Convert.ToDecimal(Insert_disaster_west_latitude_txt.Text);
        disaster.disaster_west_longitude = Convert.ToDecimal(Insert_disaster_west_longitude_txt.Text);
        disaster = disaster.Insert(disaster);
        Insert_disaster_GridView.DataBind();
        Update_disaster_GridView.DataBind();
        Delete_disaster_GridView.DataBind();
        return disaster;
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
        disaster = Update_disaster_select(Convert.ToInt32(Update_disaster_GridView.SelectedValue));
    }
    public disaster Update_disaster_select(int ID)
    {
        disaster = disaster.Select(ID);
        Update_disaster_id_txt.Text = Convert.ToString(disaster.disaster_id);
        Update_disaster_name_txt.Text = Convert.ToString(disaster.disaster_name);
        Update_disaster_type_txt.Text = Convert.ToString(disaster.disaster_type);
        Update_disaster_start_date_txt.Text = Convert.ToString(disaster.disaster_start_date);
        Update_disaster_end_date_txt.Text = Convert.ToString(disaster.disaster_end_date);
        Update_disaster_north_latitude_txt.Text = Convert.ToString(disaster.disaster_north_latitude);
        Update_disaster_north_longitude_txt.Text = Convert.ToString(disaster.disaster_north_longitude);
        Update_disaster_south_latitude_txt.Text = Convert.ToString(disaster.disaster_south_latitude);
        Update_disaster_south_longitude_txt.Text = Convert.ToString(disaster.disaster_south_longitude);
        Update_disaster_east_latitude_txt.Text = Convert.ToString(disaster.disaster_east_latitude);
        Update_disaster_east_longitude_txt.Text = Convert.ToString(disaster.disaster_east_longitude);
        Update_disaster_west_latitude_txt.Text = Convert.ToString(disaster.disaster_west_latitude);
        Update_disaster_west_longitude_txt.Text = Convert.ToString(disaster.disaster_west_longitude);
        return disaster;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        disaster = disaster_update(Convert.ToInt32(Update_disaster_GridView.SelectedValue));
    }
    public disaster disaster_update(int ID)
    {
        disaster = disaster.Select(ID);
        disaster.disaster_id = Convert.ToInt32(Update_disaster_id_txt.Text);
        disaster.disaster_name = Update_disaster_name_txt.Text;
        disaster.disaster_type = Update_disaster_type_txt.Text;
        disaster.disaster_start_date = Convert.ToDateTime(Update_disaster_start_date_txt.Text);
        disaster.disaster_end_date = Convert.ToDateTime(Update_disaster_end_date_txt.Text);
        disaster.disaster_north_latitude = Convert.ToDecimal(Update_disaster_north_latitude_txt.Text);
        disaster.disaster_north_longitude = Convert.ToDecimal(Update_disaster_north_longitude_txt.Text);
        disaster.disaster_south_latitude = Convert.ToDecimal(Update_disaster_south_latitude_txt.Text);
        disaster.disaster_south_longitude = Convert.ToDecimal(Update_disaster_south_longitude_txt.Text);
        disaster.disaster_east_latitude = Convert.ToDecimal(Update_disaster_east_latitude_txt.Text);
        disaster.disaster_east_longitude = Convert.ToDecimal(Update_disaster_east_longitude_txt.Text);
        disaster.disaster_west_latitude = Convert.ToDecimal(Update_disaster_west_latitude_txt.Text);
        disaster.disaster_west_longitude = Convert.ToDecimal(Update_disaster_west_longitude_txt.Text);
        disaster.Update(disaster);
        Insert_disaster_GridView.DataBind();
        Update_disaster_GridView.DataBind();
        Delete_disaster_GridView.DataBind();
        return disaster;
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
        disaster = Delete_disaster_select(Convert.ToInt32(Delete_disaster_GridView.SelectedValue));
    }
    public disaster Delete_disaster_select(int ID)
    {
        disaster = disaster.Select(ID);
        Delete_disaster_id_txt_lbl.Text = Convert.ToString(disaster.disaster_id);
        Delete_disaster_name_txt_lbl.Text = Convert.ToString(disaster.disaster_name);
        Delete_disaster_type_txt_lbl.Text = Convert.ToString(disaster.disaster_type);
        Delete_disaster_start_date_txt_lbl.Text = Convert.ToString(disaster.disaster_start_date);
        Delete_disaster_end_date_txt_lbl.Text = Convert.ToString(disaster.disaster_end_date);
        Delete_disaster_north_latitude_txt_lbl.Text = Convert.ToString(disaster.disaster_north_latitude);
        Delete_disaster_north_longitude_txt_lbl.Text = Convert.ToString(disaster.disaster_north_longitude);
        Delete_disaster_south_latitude_txt_lbl.Text = Convert.ToString(disaster.disaster_south_latitude);
        Delete_disaster_south_longitude_txt_lbl.Text = Convert.ToString(disaster.disaster_south_longitude);
        Delete_disaster_east_latitude_txt_lbl.Text = Convert.ToString(disaster.disaster_east_latitude);
        Delete_disaster_east_longitude_txt_lbl.Text = Convert.ToString(disaster.disaster_east_longitude);
        Delete_disaster_west_latitude_txt_lbl.Text = Convert.ToString(disaster.disaster_west_latitude);
        Delete_disaster_west_longitude_txt_lbl.Text = Convert.ToString(disaster.disaster_west_longitude);
        return disaster;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        disaster_delete(Convert.ToInt32(Delete_disaster_GridView.SelectedValue));
    }
    public void disaster_delete(int ID)
    {
        disaster.Delete(ID);
        Insert_disaster_GridView.DataBind();
        Update_disaster_GridView.DataBind();
        Delete_disaster_GridView.DataBind();
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

