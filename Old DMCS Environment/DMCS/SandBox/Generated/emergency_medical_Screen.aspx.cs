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
public partial class emergency_medical_Screen : System.Web.UI.Page
{
            public emergency_medical emergency_medical = new emergency_medical();
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
        emergency_medical = Insert_emergency_medical_select(Convert.ToInt32(Insert_emergency_medical_GridView.SelectedValue));
    }
    public emergency_medical Insert_emergency_medical_select(int ID)
    {
        emergency_medical = emergency_medical.Select(ID);
        Insert_client_id_txt.Text = Convert.ToString(emergency_medical.client_id);
        Insert_ambulance_company_name_txt.Text = Convert.ToString(emergency_medical.ambulance_company_name);
        Insert_ambulance_identification_txt.Text = Convert.ToString(emergency_medical.ambulance_identification);
        Insert_appointment_date_txt.Text = Convert.ToString(emergency_medical.appointment_date);
        Insert_area_of_specialty_txt.Text = Convert.ToString(emergency_medical.area_of_specialty);
        Insert_assistance_order_txt.Text = Convert.ToString(emergency_medical.assistance_order);
        Insert_date_of_service_txt.Text = Convert.ToString(emergency_medical.date_of_service);
        Insert_degree_certifications_txt.Text = Convert.ToString(emergency_medical.degree_certifications);
        Insert_doctor_appointments_txt.Text = Convert.ToString(emergency_medical.doctor_appointments);
        Insert_doctor_id_txt.Text = Convert.ToString(emergency_medical.doctor_id);
        Insert_doctor_start_date_txt.Text = Convert.ToString(emergency_medical.doctor_start_date);
        Insert_driver_id_txt.Text = Convert.ToString(emergency_medical.driver_id);
        Insert_educational_institution_name_txt.Text = Convert.ToString(emergency_medical.educational_institution_name);
        Insert_external_examination_txt.Text = Convert.ToString(emergency_medical.external_examination);
        Insert_hospital_name_txt.Text = Convert.ToString(emergency_medical.hospital_name);
        Insert_internal_examination_txt.Text = Convert.ToString(emergency_medical.internal_examination);
        Insert_lights_sirens_to_scene_txt.Text = Convert.ToString(emergency_medical.lights_sirens_to_scene);
        Insert_location_type_txt.Text = Convert.ToString(emergency_medical.location_type);
        Insert_number_of_days_admitted_txt.Text = Convert.ToString(emergency_medical.number_of_days_admitted);
        Insert_office_location_txt.Text = Convert.ToString(emergency_medical.office_location);
        Insert_other_remarks_txt.Text = Convert.ToString(emergency_medical.other_remarks);
        Insert_prescription_medicines_txt.Text = Convert.ToString(emergency_medical.prescription_medicines);
        Insert_time_of_service_txt.Text = Convert.ToString(emergency_medical.time_of_service);
        Insert_total_cost_txt.Text = Convert.ToString(emergency_medical.total_cost);
        Insert_deceased_id_txt.Text = Convert.ToString(emergency_medical.deceased_id);
        return emergency_medical;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        emergency_medical = emergency_medical_insert();
    }
    public emergency_medical emergency_medical_insert()
    {
        emergency_medical.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        emergency_medical.ambulance_company_name = Insert_ambulance_company_name_txt.Text;
        emergency_medical.ambulance_identification = Insert_ambulance_identification_txt.Text;
        emergency_medical.appointment_date = Convert.ToDateTime(Insert_appointment_date_txt.Text);
        emergency_medical.area_of_specialty = Insert_area_of_specialty_txt.Text;
        emergency_medical.assistance_order = Insert_assistance_order_txt.Text;
        emergency_medical.date_of_service = Convert.ToDateTime(Insert_date_of_service_txt.Text);
        emergency_medical.degree_certifications = Insert_degree_certifications_txt.Text;
        emergency_medical.doctor_appointments = Insert_doctor_appointments_txt.Text;
        emergency_medical.doctor_id = Convert.ToInt32(Insert_doctor_id_txt.Text);
        emergency_medical.doctor_start_date = Convert.ToDateTime(Insert_doctor_start_date_txt.Text);
        emergency_medical.driver_id = Convert.ToInt32(Insert_driver_id_txt.Text);
        emergency_medical.educational_institution_name = Insert_educational_institution_name_txt.Text;
        emergency_medical.external_examination = Insert_external_examination_txt.Text;
        emergency_medical.hospital_name = Insert_hospital_name_txt.Text;
        emergency_medical.internal_examination = Insert_internal_examination_txt.Text;
        emergency_medical.lights_sirens_to_scene = Insert_lights_sirens_to_scene_txt.Text;
        emergency_medical.location_type = Insert_location_type_txt.Text;
        emergency_medical.number_of_days_admitted = Convert.ToInt32(Insert_number_of_days_admitted_txt.Text);
        emergency_medical.office_location = Insert_office_location_txt.Text;
        emergency_medical.other_remarks = Insert_other_remarks_txt.Text;
        emergency_medical.prescription_medicines = Insert_prescription_medicines_txt.Text;
        emergency_medical.time_of_service = Convert.ToDateTime(Insert_time_of_service_txt.Text);
        emergency_medical.total_cost = Convert.ToDecimal(Insert_total_cost_txt.Text);
        emergency_medical.deceased_id = Convert.ToInt32(Insert_deceased_id_txt.Text);
        emergency_medical = emergency_medical.Insert(emergency_medical);
        Insert_emergency_medical_GridView.DataBind();
        Update_emergency_medical_GridView.DataBind();
        Delete_emergency_medical_GridView.DataBind();
        return emergency_medical;
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
        emergency_medical = Update_emergency_medical_select(Convert.ToInt32(Update_emergency_medical_GridView.SelectedValue));
    }
    public emergency_medical Update_emergency_medical_select(int ID)
    {
        emergency_medical = emergency_medical.Select(ID);
        Update_em_id_txt.Text = Convert.ToString(emergency_medical.em_id);
        Update_client_id_txt.Text = Convert.ToString(emergency_medical.client_id);
        Update_ambulance_company_name_txt.Text = Convert.ToString(emergency_medical.ambulance_company_name);
        Update_ambulance_identification_txt.Text = Convert.ToString(emergency_medical.ambulance_identification);
        Update_appointment_date_txt.Text = Convert.ToString(emergency_medical.appointment_date);
        Update_area_of_specialty_txt.Text = Convert.ToString(emergency_medical.area_of_specialty);
        Update_assistance_order_txt.Text = Convert.ToString(emergency_medical.assistance_order);
        Update_date_of_service_txt.Text = Convert.ToString(emergency_medical.date_of_service);
        Update_degree_certifications_txt.Text = Convert.ToString(emergency_medical.degree_certifications);
        Update_doctor_appointments_txt.Text = Convert.ToString(emergency_medical.doctor_appointments);
        Update_doctor_id_txt.Text = Convert.ToString(emergency_medical.doctor_id);
        Update_doctor_start_date_txt.Text = Convert.ToString(emergency_medical.doctor_start_date);
        Update_driver_id_txt.Text = Convert.ToString(emergency_medical.driver_id);
        Update_educational_institution_name_txt.Text = Convert.ToString(emergency_medical.educational_institution_name);
        Update_external_examination_txt.Text = Convert.ToString(emergency_medical.external_examination);
        Update_hospital_name_txt.Text = Convert.ToString(emergency_medical.hospital_name);
        Update_internal_examination_txt.Text = Convert.ToString(emergency_medical.internal_examination);
        Update_lights_sirens_to_scene_txt.Text = Convert.ToString(emergency_medical.lights_sirens_to_scene);
        Update_location_type_txt.Text = Convert.ToString(emergency_medical.location_type);
        Update_number_of_days_admitted_txt.Text = Convert.ToString(emergency_medical.number_of_days_admitted);
        Update_office_location_txt.Text = Convert.ToString(emergency_medical.office_location);
        Update_other_remarks_txt.Text = Convert.ToString(emergency_medical.other_remarks);
        Update_prescription_medicines_txt.Text = Convert.ToString(emergency_medical.prescription_medicines);
        Update_time_of_service_txt.Text = Convert.ToString(emergency_medical.time_of_service);
        Update_total_cost_txt.Text = Convert.ToString(emergency_medical.total_cost);
        Update_deceased_id_txt.Text = Convert.ToString(emergency_medical.deceased_id);
        return emergency_medical;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        emergency_medical = emergency_medical_update(Convert.ToInt32(Update_emergency_medical_GridView.SelectedValue));
    }
    public emergency_medical emergency_medical_update(int ID)
    {
        emergency_medical = emergency_medical.Select(ID);
        emergency_medical.em_id = Convert.ToInt32(Update_em_id_txt.Text);
        emergency_medical.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        emergency_medical.ambulance_company_name = Update_ambulance_company_name_txt.Text;
        emergency_medical.ambulance_identification = Update_ambulance_identification_txt.Text;
        emergency_medical.appointment_date = Convert.ToDateTime(Update_appointment_date_txt.Text);
        emergency_medical.area_of_specialty = Update_area_of_specialty_txt.Text;
        emergency_medical.assistance_order = Update_assistance_order_txt.Text;
        emergency_medical.date_of_service = Convert.ToDateTime(Update_date_of_service_txt.Text);
        emergency_medical.degree_certifications = Update_degree_certifications_txt.Text;
        emergency_medical.doctor_appointments = Update_doctor_appointments_txt.Text;
        emergency_medical.doctor_id = Convert.ToInt32(Update_doctor_id_txt.Text);
        emergency_medical.doctor_start_date = Convert.ToDateTime(Update_doctor_start_date_txt.Text);
        emergency_medical.driver_id = Convert.ToInt32(Update_driver_id_txt.Text);
        emergency_medical.educational_institution_name = Update_educational_institution_name_txt.Text;
        emergency_medical.external_examination = Update_external_examination_txt.Text;
        emergency_medical.hospital_name = Update_hospital_name_txt.Text;
        emergency_medical.internal_examination = Update_internal_examination_txt.Text;
        emergency_medical.lights_sirens_to_scene = Update_lights_sirens_to_scene_txt.Text;
        emergency_medical.location_type = Update_location_type_txt.Text;
        emergency_medical.number_of_days_admitted = Convert.ToInt32(Update_number_of_days_admitted_txt.Text);
        emergency_medical.office_location = Update_office_location_txt.Text;
        emergency_medical.other_remarks = Update_other_remarks_txt.Text;
        emergency_medical.prescription_medicines = Update_prescription_medicines_txt.Text;
        emergency_medical.time_of_service = Convert.ToDateTime(Update_time_of_service_txt.Text);
        emergency_medical.total_cost = Convert.ToDecimal(Update_total_cost_txt.Text);
        emergency_medical.deceased_id = Convert.ToInt32(Update_deceased_id_txt.Text);
        emergency_medical.Update(emergency_medical);
        Insert_emergency_medical_GridView.DataBind();
        Update_emergency_medical_GridView.DataBind();
        Delete_emergency_medical_GridView.DataBind();
        return emergency_medical;
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
        emergency_medical = Delete_emergency_medical_select(Convert.ToInt32(Delete_emergency_medical_GridView.SelectedValue));
    }
    public emergency_medical Delete_emergency_medical_select(int ID)
    {
        emergency_medical = emergency_medical.Select(ID);
        Delete_em_id_txt_lbl.Text = Convert.ToString(emergency_medical.em_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(emergency_medical.client_id);
        Delete_ambulance_company_name_txt_lbl.Text = Convert.ToString(emergency_medical.ambulance_company_name);
        Delete_ambulance_identification_txt_lbl.Text = Convert.ToString(emergency_medical.ambulance_identification);
        Delete_appointment_date_txt_lbl.Text = Convert.ToString(emergency_medical.appointment_date);
        Delete_area_of_specialty_txt_lbl.Text = Convert.ToString(emergency_medical.area_of_specialty);
        Delete_assistance_order_txt_lbl.Text = Convert.ToString(emergency_medical.assistance_order);
        Delete_date_of_service_txt_lbl.Text = Convert.ToString(emergency_medical.date_of_service);
        Delete_degree_certifications_txt_lbl.Text = Convert.ToString(emergency_medical.degree_certifications);
        Delete_doctor_appointments_txt_lbl.Text = Convert.ToString(emergency_medical.doctor_appointments);
        Delete_doctor_id_txt_lbl.Text = Convert.ToString(emergency_medical.doctor_id);
        Delete_doctor_start_date_txt_lbl.Text = Convert.ToString(emergency_medical.doctor_start_date);
        Delete_driver_id_txt_lbl.Text = Convert.ToString(emergency_medical.driver_id);
        Delete_educational_institution_name_txt_lbl.Text = Convert.ToString(emergency_medical.educational_institution_name);
        Delete_external_examination_txt_lbl.Text = Convert.ToString(emergency_medical.external_examination);
        Delete_hospital_name_txt_lbl.Text = Convert.ToString(emergency_medical.hospital_name);
        Delete_internal_examination_txt_lbl.Text = Convert.ToString(emergency_medical.internal_examination);
        Delete_lights_sirens_to_scene_txt_lbl.Text = Convert.ToString(emergency_medical.lights_sirens_to_scene);
        Delete_location_type_txt_lbl.Text = Convert.ToString(emergency_medical.location_type);
        Delete_number_of_days_admitted_txt_lbl.Text = Convert.ToString(emergency_medical.number_of_days_admitted);
        Delete_office_location_txt_lbl.Text = Convert.ToString(emergency_medical.office_location);
        Delete_other_remarks_txt_lbl.Text = Convert.ToString(emergency_medical.other_remarks);
        Delete_prescription_medicines_txt_lbl.Text = Convert.ToString(emergency_medical.prescription_medicines);
        Delete_time_of_service_txt_lbl.Text = Convert.ToString(emergency_medical.time_of_service);
        Delete_total_cost_txt_lbl.Text = Convert.ToString(emergency_medical.total_cost);
        Delete_deceased_id_txt_lbl.Text = Convert.ToString(emergency_medical.deceased_id);
        return emergency_medical;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        emergency_medical_delete(Convert.ToInt32(Delete_emergency_medical_GridView.SelectedValue));
    }
    public void emergency_medical_delete(int ID)
    {
        emergency_medical.Delete(ID);
        Insert_emergency_medical_GridView.DataBind();
        Update_emergency_medical_GridView.DataBind();
        Delete_emergency_medical_GridView.DataBind();
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

