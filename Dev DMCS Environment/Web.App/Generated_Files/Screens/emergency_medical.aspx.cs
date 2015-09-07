using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class emergency_medicalClass : System.Web.UI.Page
    {
        public emergency_medical emergency_medical = new emergency_medical();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            emergency_medical = emergency_medical_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            emergency_medical = emergency_medical_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            emergency_medical = emergency_medical_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public emergency_medical emergency_medical_selectForInsert(int ID)
        {
            emergency_medical = emergency_medical.Select(ID);
            client_id_Insert_TextBox.Text = Convert.ToString(emergency_medical.client_id);
            ambulance_company_name_Insert_TextBox.Text = Convert.ToString(emergency_medical.ambulance_company_name);
            ambulance_identification_Insert_TextBox.Text = Convert.ToString(emergency_medical.ambulance_identification);
            appointment_date_Insert_TextBox.Text = Convert.ToString(emergency_medical.appointment_date);
            area_of_specialty_Insert_TextBox.Text = Convert.ToString(emergency_medical.area_of_specialty);
            assistance_order_Insert_TextBox.Text = Convert.ToString(emergency_medical.assistance_order);
            date_of_service_Insert_TextBox.Text = Convert.ToString(emergency_medical.date_of_service);
            degree_certifications_Insert_TextBox.Text = Convert.ToString(emergency_medical.degree_certifications);
            doctor_appointments_Insert_TextBox.Text = Convert.ToString(emergency_medical.doctor_appointments);
            doctor_id_Insert_TextBox.Text = Convert.ToString(emergency_medical.doctor_id);
            doctor_start_date_Insert_TextBox.Text = Convert.ToString(emergency_medical.doctor_start_date);
            driver_id_Insert_TextBox.Text = Convert.ToString(emergency_medical.driver_id);
            educational_institution_name_Insert_TextBox.Text = Convert.ToString(emergency_medical.educational_institution_name);
            external_examination_Insert_TextBox.Text = Convert.ToString(emergency_medical.external_examination);
            hospital_name_Insert_TextBox.Text = Convert.ToString(emergency_medical.hospital_name);
            internal_examination_Insert_TextBox.Text = Convert.ToString(emergency_medical.internal_examination);
            lights_sirens_to_scene_Insert_TextBox.Text = Convert.ToString(emergency_medical.lights_sirens_to_scene);
            location_type_Insert_TextBox.Text = Convert.ToString(emergency_medical.location_type);
            number_of_days_admitted_Insert_TextBox.Text = Convert.ToString(emergency_medical.number_of_days_admitted);
            office_location_Insert_TextBox.Text = Convert.ToString(emergency_medical.office_location);
            other_remarks_Insert_TextBox.Text = Convert.ToString(emergency_medical.other_remarks);
            prescription_medicines_Insert_TextBox.Text = Convert.ToString(emergency_medical.prescription_medicines);
            time_of_service_Insert_TextBox.Text = Convert.ToString(emergency_medical.time_of_service);
            total_cost_Insert_TextBox.Text = Convert.ToString(emergency_medical.total_cost);
            deceased_id_Insert_TextBox.Text = Convert.ToString(emergency_medical.deceased_id);
            return emergency_medical;
        }
        public emergency_medical emergency_medical_selectForUpdate(int ID)
        {
            emergency_medical = emergency_medical.Select(ID);
            em_id_Update_TextBox.Text = Convert.ToString(emergency_medical.em_id);
            client_id_Update_TextBox.Text = Convert.ToString(emergency_medical.client_id);
            ambulance_company_name_Update_TextBox.Text = Convert.ToString(emergency_medical.ambulance_company_name);
            ambulance_identification_Update_TextBox.Text = Convert.ToString(emergency_medical.ambulance_identification);
            appointment_date_Update_TextBox.Text = Convert.ToString(emergency_medical.appointment_date);
            area_of_specialty_Update_TextBox.Text = Convert.ToString(emergency_medical.area_of_specialty);
            assistance_order_Update_TextBox.Text = Convert.ToString(emergency_medical.assistance_order);
            date_of_service_Update_TextBox.Text = Convert.ToString(emergency_medical.date_of_service);
            degree_certifications_Update_TextBox.Text = Convert.ToString(emergency_medical.degree_certifications);
            doctor_appointments_Update_TextBox.Text = Convert.ToString(emergency_medical.doctor_appointments);
            doctor_id_Update_TextBox.Text = Convert.ToString(emergency_medical.doctor_id);
            doctor_start_date_Update_TextBox.Text = Convert.ToString(emergency_medical.doctor_start_date);
            driver_id_Update_TextBox.Text = Convert.ToString(emergency_medical.driver_id);
            educational_institution_name_Update_TextBox.Text = Convert.ToString(emergency_medical.educational_institution_name);
            external_examination_Update_TextBox.Text = Convert.ToString(emergency_medical.external_examination);
            hospital_name_Update_TextBox.Text = Convert.ToString(emergency_medical.hospital_name);
            internal_examination_Update_TextBox.Text = Convert.ToString(emergency_medical.internal_examination);
            lights_sirens_to_scene_Update_TextBox.Text = Convert.ToString(emergency_medical.lights_sirens_to_scene);
            location_type_Update_TextBox.Text = Convert.ToString(emergency_medical.location_type);
            number_of_days_admitted_Update_TextBox.Text = Convert.ToString(emergency_medical.number_of_days_admitted);
            office_location_Update_TextBox.Text = Convert.ToString(emergency_medical.office_location);
            other_remarks_Update_TextBox.Text = Convert.ToString(emergency_medical.other_remarks);
            prescription_medicines_Update_TextBox.Text = Convert.ToString(emergency_medical.prescription_medicines);
            time_of_service_Update_TextBox.Text = Convert.ToString(emergency_medical.time_of_service);
            total_cost_Update_TextBox.Text = Convert.ToString(emergency_medical.total_cost);
            deceased_id_Update_TextBox.Text = Convert.ToString(emergency_medical.deceased_id);
            return emergency_medical;
        }
        public emergency_medical emergency_medical_selectForDelete(int ID)
        {
            emergency_medical = emergency_medical.Select(ID);
            em_id_Delete_TextBox.Text = Convert.ToString(emergency_medical.em_id);
            client_id_Delete_TextBox.Text = Convert.ToString(emergency_medical.client_id);
            ambulance_company_name_Delete_TextBox.Text = Convert.ToString(emergency_medical.ambulance_company_name);
            ambulance_identification_Delete_TextBox.Text = Convert.ToString(emergency_medical.ambulance_identification);
            appointment_date_Delete_TextBox.Text = Convert.ToString(emergency_medical.appointment_date);
            area_of_specialty_Delete_TextBox.Text = Convert.ToString(emergency_medical.area_of_specialty);
            assistance_order_Delete_TextBox.Text = Convert.ToString(emergency_medical.assistance_order);
            date_of_service_Delete_TextBox.Text = Convert.ToString(emergency_medical.date_of_service);
            degree_certifications_Delete_TextBox.Text = Convert.ToString(emergency_medical.degree_certifications);
            doctor_appointments_Delete_TextBox.Text = Convert.ToString(emergency_medical.doctor_appointments);
            doctor_id_Delete_TextBox.Text = Convert.ToString(emergency_medical.doctor_id);
            doctor_start_date_Delete_TextBox.Text = Convert.ToString(emergency_medical.doctor_start_date);
            driver_id_Delete_TextBox.Text = Convert.ToString(emergency_medical.driver_id);
            educational_institution_name_Delete_TextBox.Text = Convert.ToString(emergency_medical.educational_institution_name);
            external_examination_Delete_TextBox.Text = Convert.ToString(emergency_medical.external_examination);
            hospital_name_Delete_TextBox.Text = Convert.ToString(emergency_medical.hospital_name);
            internal_examination_Delete_TextBox.Text = Convert.ToString(emergency_medical.internal_examination);
            lights_sirens_to_scene_Delete_TextBox.Text = Convert.ToString(emergency_medical.lights_sirens_to_scene);
            location_type_Delete_TextBox.Text = Convert.ToString(emergency_medical.location_type);
            number_of_days_admitted_Delete_TextBox.Text = Convert.ToString(emergency_medical.number_of_days_admitted);
            office_location_Delete_TextBox.Text = Convert.ToString(emergency_medical.office_location);
            other_remarks_Delete_TextBox.Text = Convert.ToString(emergency_medical.other_remarks);
            prescription_medicines_Delete_TextBox.Text = Convert.ToString(emergency_medical.prescription_medicines);
            time_of_service_Delete_TextBox.Text = Convert.ToString(emergency_medical.time_of_service);
            total_cost_Delete_TextBox.Text = Convert.ToString(emergency_medical.total_cost);
            deceased_id_Delete_TextBox.Text = Convert.ToString(emergency_medical.deceased_id);
            return emergency_medical;
        }
        //Database CRUD Call Functions
        public emergency_medical emergency_medical_insert()
        {
            emergency_medical.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            emergency_medical.ambulance_company_name = ambulance_company_name_Insert_TextBox.Text;
            emergency_medical.ambulance_identification = ambulance_identification_Insert_TextBox.Text;
            emergency_medical.appointment_date = Convert.ToDateTime(appointment_date_Insert_TextBox.Text);
            emergency_medical.area_of_specialty = area_of_specialty_Insert_TextBox.Text;
            emergency_medical.assistance_order = assistance_order_Insert_TextBox.Text;
            emergency_medical.date_of_service = Convert.ToDateTime(date_of_service_Insert_TextBox.Text);
            emergency_medical.degree_certifications = degree_certifications_Insert_TextBox.Text;
            emergency_medical.doctor_appointments = doctor_appointments_Insert_TextBox.Text;
            emergency_medical.doctor_id = Convert.ToInt32(doctor_id_Insert_TextBox.Text);
            emergency_medical.doctor_start_date = Convert.ToDateTime(doctor_start_date_Insert_TextBox.Text);
            emergency_medical.driver_id = Convert.ToInt32(driver_id_Insert_TextBox.Text);
            emergency_medical.educational_institution_name = educational_institution_name_Insert_TextBox.Text;
            emergency_medical.external_examination = external_examination_Insert_TextBox.Text;
            emergency_medical.hospital_name = hospital_name_Insert_TextBox.Text;
            emergency_medical.internal_examination = internal_examination_Insert_TextBox.Text;
            emergency_medical.lights_sirens_to_scene = lights_sirens_to_scene_Insert_TextBox.Text;
            emergency_medical.location_type = location_type_Insert_TextBox.Text;
            emergency_medical.number_of_days_admitted = Convert.ToInt32(number_of_days_admitted_Insert_TextBox.Text);
            emergency_medical.office_location = office_location_Insert_TextBox.Text;
            emergency_medical.other_remarks = other_remarks_Insert_TextBox.Text;
            emergency_medical.prescription_medicines = prescription_medicines_Insert_TextBox.Text;
            emergency_medical.time_of_service = Convert.ToDateTime(time_of_service_Insert_TextBox.Text);
            emergency_medical.total_cost = Convert.ToDecimal(total_cost_Insert_TextBox.Text);
            emergency_medical.deceased_id = Convert.ToInt32(deceased_id_Insert_TextBox.Text);
            emergency_medical = emergency_medical.Insert(emergency_medical);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return emergency_medical;
        }
        public emergency_medical emergency_medical_update(int ID)
        {
            emergency_medical = emergency_medical.Select(ID);
            emergency_medical.em_id = Convert.ToInt32(Update_GridView.SelectedValue);
            emergency_medical.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            emergency_medical.ambulance_company_name = ambulance_company_name_Update_TextBox.Text;
            emergency_medical.ambulance_identification = ambulance_identification_Update_TextBox.Text;
            emergency_medical.appointment_date = Convert.ToDateTime(appointment_date_Update_TextBox.Text);
            emergency_medical.area_of_specialty = area_of_specialty_Update_TextBox.Text;
            emergency_medical.assistance_order = assistance_order_Update_TextBox.Text;
            emergency_medical.date_of_service = Convert.ToDateTime(date_of_service_Update_TextBox.Text);
            emergency_medical.degree_certifications = degree_certifications_Update_TextBox.Text;
            emergency_medical.doctor_appointments = doctor_appointments_Update_TextBox.Text;
            emergency_medical.doctor_id = Convert.ToInt32(doctor_id_Update_TextBox.Text);
            emergency_medical.doctor_start_date = Convert.ToDateTime(doctor_start_date_Update_TextBox.Text);
            emergency_medical.driver_id = Convert.ToInt32(driver_id_Update_TextBox.Text);
            emergency_medical.educational_institution_name = educational_institution_name_Update_TextBox.Text;
            emergency_medical.external_examination = external_examination_Update_TextBox.Text;
            emergency_medical.hospital_name = hospital_name_Update_TextBox.Text;
            emergency_medical.internal_examination = internal_examination_Update_TextBox.Text;
            emergency_medical.lights_sirens_to_scene = lights_sirens_to_scene_Update_TextBox.Text;
            emergency_medical.location_type = location_type_Update_TextBox.Text;
            emergency_medical.number_of_days_admitted = Convert.ToInt32(number_of_days_admitted_Update_TextBox.Text);
            emergency_medical.office_location = office_location_Update_TextBox.Text;
            emergency_medical.other_remarks = other_remarks_Update_TextBox.Text;
            emergency_medical.prescription_medicines = prescription_medicines_Update_TextBox.Text;
            emergency_medical.time_of_service = Convert.ToDateTime(time_of_service_Update_TextBox.Text);
            emergency_medical.total_cost = Convert.ToDecimal(total_cost_Update_TextBox.Text);
            emergency_medical.deceased_id = Convert.ToInt32(deceased_id_Update_TextBox.Text);
            emergency_medical.Update(emergency_medical);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return emergency_medical;
        }
        public void emergency_medical_delete(int ID)
        {
            emergency_medical.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            emergency_medical = emergency_medical_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            emergency_medical = emergency_medical_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            emergency_medical_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

