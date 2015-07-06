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
public partial class vehicle_Screen : System.Web.UI.Page
{
            public vehicle vehicle = new vehicle();
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
        vehicle = Insert_vehicle_select(Convert.ToInt32(Insert_vehicle_GridView.SelectedValue));
    }
    public vehicle Insert_vehicle_select(int ID)
    {
        vehicle = vehicle.Select(ID);
        Insert_case_id_txt.Text = Convert.ToString(vehicle.case_id);
        Insert_client_id_txt.Text = Convert.ToString(vehicle.client_id);
        Insert_vehicle_make_txt.Text = Convert.ToString(vehicle.vehicle_make);
        Insert_vehicle_model_txt.Text = Convert.ToString(vehicle.vehicle_model);
        Insert_vehicle_type_txt.Text = Convert.ToString(vehicle.vehicle_type);
        Insert_vehicle_year_txt.Text = Convert.ToString(vehicle.vehicle_year);
        Insert_vehicle_desc_txt.Text = Convert.ToString(vehicle.vehicle_desc);
        Insert_vin_txt.Text = Convert.ToString(vehicle.vin);
        Insert_start_mileage_txt.Text = Convert.ToString(vehicle.start_mileage);
        Insert_first_service_date_txt.Text = Convert.ToString(vehicle.first_service_date);
        Insert_last_service_date_txt.Text = Convert.ToString(vehicle.last_service_date);
        Insert_PLATENUMBER_txt.Text = Convert.ToString(vehicle.PLATENUMBER);
        Insert_FUELTYPE_txt.Text = Convert.ToString(vehicle.FUELTYPE);
        Insert_MPH_txt.Text = Convert.ToString(vehicle.MPH);
        Insert_INSURED_txt.Text = Convert.ToString(vehicle.INSURED);
        return vehicle;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        vehicle = vehicle_insert();
    }
    public vehicle vehicle_insert()
    {
        vehicle.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        vehicle.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        vehicle.vehicle_make = Insert_vehicle_make_txt.Text;
        vehicle.vehicle_model = Insert_vehicle_model_txt.Text;
        vehicle.vehicle_type = Insert_vehicle_type_txt.Text;
        vehicle.vehicle_year = Convert.ToInt32(Insert_vehicle_year_txt.Text);
        vehicle.vehicle_desc = Insert_vehicle_desc_txt.Text;
        vehicle.vin = Insert_vin_txt.Text;
        vehicle.start_mileage = Convert.ToInt32(Insert_start_mileage_txt.Text);
        vehicle.first_service_date = Convert.ToDateTime(Insert_first_service_date_txt.Text);
        vehicle.last_service_date = Convert.ToDateTime(Insert_last_service_date_txt.Text);
        vehicle.PLATENUMBER = Insert_PLATENUMBER_txt.Text;
        vehicle.FUELTYPE = Insert_FUELTYPE_txt.Text;
        vehicle.MPH = Convert.ToInt32(Insert_MPH_txt.Text);
        vehicle.INSURED = Insert_INSURED_txt.Text;
        vehicle = vehicle.Insert(vehicle);
        Insert_vehicle_GridView.DataBind();
        Update_vehicle_GridView.DataBind();
        Delete_vehicle_GridView.DataBind();
        return vehicle;
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
        vehicle = Update_vehicle_select(Convert.ToInt32(Update_vehicle_GridView.SelectedValue));
    }
    public vehicle Update_vehicle_select(int ID)
    {
        vehicle = vehicle.Select(ID);
        Update_vehicle_id_txt.Text = Convert.ToString(vehicle.vehicle_id);
        Update_case_id_txt.Text = Convert.ToString(vehicle.case_id);
        Update_client_id_txt.Text = Convert.ToString(vehicle.client_id);
        Update_vehicle_make_txt.Text = Convert.ToString(vehicle.vehicle_make);
        Update_vehicle_model_txt.Text = Convert.ToString(vehicle.vehicle_model);
        Update_vehicle_type_txt.Text = Convert.ToString(vehicle.vehicle_type);
        Update_vehicle_year_txt.Text = Convert.ToString(vehicle.vehicle_year);
        Update_vehicle_desc_txt.Text = Convert.ToString(vehicle.vehicle_desc);
        Update_vin_txt.Text = Convert.ToString(vehicle.vin);
        Update_start_mileage_txt.Text = Convert.ToString(vehicle.start_mileage);
        Update_first_service_date_txt.Text = Convert.ToString(vehicle.first_service_date);
        Update_last_service_date_txt.Text = Convert.ToString(vehicle.last_service_date);
        Update_PLATENUMBER_txt.Text = Convert.ToString(vehicle.PLATENUMBER);
        Update_FUELTYPE_txt.Text = Convert.ToString(vehicle.FUELTYPE);
        Update_MPH_txt.Text = Convert.ToString(vehicle.MPH);
        Update_INSURED_txt.Text = Convert.ToString(vehicle.INSURED);
        return vehicle;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        vehicle = vehicle_update(Convert.ToInt32(Update_vehicle_GridView.SelectedValue));
    }
    public vehicle vehicle_update(int ID)
    {
        vehicle = vehicle.Select(ID);
        vehicle.vehicle_id = Convert.ToInt32(Update_vehicle_id_txt.Text);
        vehicle.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        vehicle.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        vehicle.vehicle_make = Update_vehicle_make_txt.Text;
        vehicle.vehicle_model = Update_vehicle_model_txt.Text;
        vehicle.vehicle_type = Update_vehicle_type_txt.Text;
        vehicle.vehicle_year = Convert.ToInt32(Update_vehicle_year_txt.Text);
        vehicle.vehicle_desc = Update_vehicle_desc_txt.Text;
        vehicle.vin = Update_vin_txt.Text;
        vehicle.start_mileage = Convert.ToInt32(Update_start_mileage_txt.Text);
        vehicle.first_service_date = Convert.ToDateTime(Update_first_service_date_txt.Text);
        vehicle.last_service_date = Convert.ToDateTime(Update_last_service_date_txt.Text);
        vehicle.PLATENUMBER = Update_PLATENUMBER_txt.Text;
        vehicle.FUELTYPE = Update_FUELTYPE_txt.Text;
        vehicle.MPH = Convert.ToInt32(Update_MPH_txt.Text);
        vehicle.INSURED = Update_INSURED_txt.Text;
        vehicle.Update(vehicle);
        Insert_vehicle_GridView.DataBind();
        Update_vehicle_GridView.DataBind();
        Delete_vehicle_GridView.DataBind();
        return vehicle;
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
        vehicle = Delete_vehicle_select(Convert.ToInt32(Delete_vehicle_GridView.SelectedValue));
    }
    public vehicle Delete_vehicle_select(int ID)
    {
        vehicle = vehicle.Select(ID);
        Delete_vehicle_id_txt_lbl.Text = Convert.ToString(vehicle.vehicle_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(vehicle.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(vehicle.client_id);
        Delete_vehicle_make_txt_lbl.Text = Convert.ToString(vehicle.vehicle_make);
        Delete_vehicle_model_txt_lbl.Text = Convert.ToString(vehicle.vehicle_model);
        Delete_vehicle_type_txt_lbl.Text = Convert.ToString(vehicle.vehicle_type);
        Delete_vehicle_year_txt_lbl.Text = Convert.ToString(vehicle.vehicle_year);
        Delete_vehicle_desc_txt_lbl.Text = Convert.ToString(vehicle.vehicle_desc);
        Delete_vin_txt_lbl.Text = Convert.ToString(vehicle.vin);
        Delete_start_mileage_txt_lbl.Text = Convert.ToString(vehicle.start_mileage);
        Delete_first_service_date_txt_lbl.Text = Convert.ToString(vehicle.first_service_date);
        Delete_last_service_date_txt_lbl.Text = Convert.ToString(vehicle.last_service_date);
        Delete_PLATENUMBER_txt_lbl.Text = Convert.ToString(vehicle.PLATENUMBER);
        Delete_FUELTYPE_txt_lbl.Text = Convert.ToString(vehicle.FUELTYPE);
        Delete_MPH_txt_lbl.Text = Convert.ToString(vehicle.MPH);
        Delete_INSURED_txt_lbl.Text = Convert.ToString(vehicle.INSURED);
        return vehicle;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        vehicle_delete(Convert.ToInt32(Delete_vehicle_GridView.SelectedValue));
    }
    public void vehicle_delete(int ID)
    {
        vehicle.Delete(ID);
        Insert_vehicle_GridView.DataBind();
        Update_vehicle_GridView.DataBind();
        Delete_vehicle_GridView.DataBind();
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

