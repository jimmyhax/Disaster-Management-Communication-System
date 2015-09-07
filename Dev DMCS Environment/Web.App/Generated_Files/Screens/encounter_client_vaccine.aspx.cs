using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class encounter_client_vaccineClass : System.Web.UI.Page
    {
        public encounter_client_vaccine encounter_client_vaccine = new encounter_client_vaccine();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter_client_vaccine = encounter_client_vaccine_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter_client_vaccine = encounter_client_vaccine_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter_client_vaccine = encounter_client_vaccine_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public encounter_client_vaccine encounter_client_vaccine_selectForInsert(int ID)
        {
            encounter_client_vaccine = encounter_client_vaccine.Select(ID);
            vaccine_id_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.vaccine_id);
            current_client_medicine_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.current_client_medicine);
            assistance_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.assistance);
            quantity_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.quantity);
            Under_six_months_old_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.Under_six_months_old);
            pregnant_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.pregnant);
            children_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.children);
            occupation_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.occupation);
            chronic_disease_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.chronic_disease);
            qualify_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.qualify);
            dose_date1_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_date1);
            dose_date2_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_date2);
            adult_consent_Insert_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id=" + ID);
            guardian_consent_Insert_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id=" + ID);
            vaccine_admin_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.vaccine_admin);
            guardian_f_name_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_f_name);
            guardian_l_name_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_l_name);
            guardian_mi_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_mi);
            guardian_phone_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_phone);
            adult_consent_date_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.adult_consent_date);
            guard_consent_date_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.guard_consent_date);
            dose_form1_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_form1);
            dose_form2_Insert_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_form2);
            return encounter_client_vaccine;
        }
        public encounter_client_vaccine encounter_client_vaccine_selectForUpdate(int ID)
        {
            encounter_client_vaccine = encounter_client_vaccine.Select(ID);
            encounter_id_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.encounter_id);
            vaccine_id_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.vaccine_id);
            current_client_medicine_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.current_client_medicine);
            assistance_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.assistance);
            quantity_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.quantity);
            Under_six_months_old_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.Under_six_months_old);
            pregnant_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.pregnant);
            children_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.children);
            occupation_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.occupation);
            chronic_disease_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.chronic_disease);
            qualify_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.qualify);
            dose_date1_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_date1);
            dose_date2_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_date2);
            adult_consent_Update_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id=" + ID);
            guardian_consent_Update_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id=" + ID);
            vaccine_admin_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.vaccine_admin);
            guardian_f_name_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_f_name);
            guardian_l_name_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_l_name);
            guardian_mi_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_mi);
            guardian_phone_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_phone);
            adult_consent_date_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.adult_consent_date);
            guard_consent_date_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.guard_consent_date);
            dose_form1_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_form1);
            dose_form2_Update_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_form2);
            return encounter_client_vaccine;
        }
        public encounter_client_vaccine encounter_client_vaccine_selectForDelete(int ID)
        {
            encounter_client_vaccine = encounter_client_vaccine.Select(ID);
            encounter_id_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.encounter_id);
            vaccine_id_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.vaccine_id);
            current_client_medicine_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.current_client_medicine);
            assistance_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.assistance);
            quantity_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.quantity);
            Under_six_months_old_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.Under_six_months_old);
            pregnant_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.pregnant);
            children_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.children);
            occupation_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.occupation);
            chronic_disease_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.chronic_disease);
            qualify_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.qualify);
            dose_date1_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_date1);
            dose_date2_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_date2);
            adult_consent_Delete_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id=" + ID);
            guardian_consent_Delete_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id=" + ID);
            vaccine_admin_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.vaccine_admin);
            guardian_f_name_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_f_name);
            guardian_l_name_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_l_name);
            guardian_mi_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_mi);
            guardian_phone_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.guardian_phone);
            adult_consent_date_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.adult_consent_date);
            guard_consent_date_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.guard_consent_date);
            dose_form1_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_form1);
            dose_form2_Delete_TextBox.Text = Convert.ToString(encounter_client_vaccine.dose_form2);
            return encounter_client_vaccine;
        }
        //Database CRUD Call Functions
        public encounter_client_vaccine encounter_client_vaccine_insert()
        {
            encounter_client_vaccine.vaccine_id = Convert.ToInt32(vaccine_id_Insert_TextBox.Text);
            encounter_client_vaccine.current_client_medicine = current_client_medicine_Insert_TextBox.Text;
            encounter_client_vaccine.assistance = assistance_Insert_TextBox.Text;
            encounter_client_vaccine.quantity = Convert.ToInt32(quantity_Insert_TextBox.Text);
            encounter_client_vaccine.Under_six_months_old = Under_six_months_old_Insert_TextBox.Text;
            encounter_client_vaccine.pregnant = pregnant_Insert_TextBox.Text;
            encounter_client_vaccine.children = Convert.ToInt32(children_Insert_TextBox.Text);
            encounter_client_vaccine.occupation = occupation_Insert_TextBox.Text;
            encounter_client_vaccine.chronic_disease = chronic_disease_Insert_TextBox.Text;
            encounter_client_vaccine.qualify = qualify_Insert_TextBox.Text;
            encounter_client_vaccine.dose_date1 = Convert.ToDateTime(dose_date1_Insert_TextBox.Text);
            encounter_client_vaccine.dose_date2 = Convert.ToDateTime(dose_date2_Insert_TextBox.Text);
            if (adult_consent_Insert_FileUpload.HasFile)
            {
                byte[] uploaded_picture = adult_consent_Insert_FileUpload.FileBytes;
                encounter_client_vaccine.adult_consent = uploaded_picture;
            }
            if (guardian_consent_Insert_FileUpload.HasFile)
            {
                byte[] uploaded_picture = guardian_consent_Insert_FileUpload.FileBytes;
                encounter_client_vaccine.guardian_consent = uploaded_picture;
            }
            encounter_client_vaccine.vaccine_admin = Convert.ToDateTime(vaccine_admin_Insert_TextBox.Text);
            encounter_client_vaccine.guardian_f_name = guardian_f_name_Insert_TextBox.Text;
            encounter_client_vaccine.guardian_l_name = guardian_l_name_Insert_TextBox.Text;
            encounter_client_vaccine.guardian_mi = guardian_mi_Insert_TextBox.Text;
            encounter_client_vaccine.guardian_phone = guardian_phone_Insert_TextBox.Text;
            encounter_client_vaccine.adult_consent_date = Convert.ToDateTime(adult_consent_date_Insert_TextBox.Text);
            encounter_client_vaccine.guard_consent_date = Convert.ToDateTime(guard_consent_date_Insert_TextBox.Text);
            encounter_client_vaccine.dose_form1 = dose_form1_Insert_TextBox.Text;
            encounter_client_vaccine.dose_form2 = dose_form2_Insert_TextBox.Text;
            encounter_client_vaccine = encounter_client_vaccine.Insert(encounter_client_vaccine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return encounter_client_vaccine;
        }
        public encounter_client_vaccine encounter_client_vaccine_update(int ID)
        {
            encounter_client_vaccine = encounter_client_vaccine.Select(ID);
            encounter_client_vaccine.encounter_id = Convert.ToInt32(Update_GridView.SelectedValue);
            encounter_client_vaccine.vaccine_id = Convert.ToInt32(vaccine_id_Update_TextBox.Text);
            encounter_client_vaccine.current_client_medicine = current_client_medicine_Update_TextBox.Text;
            encounter_client_vaccine.assistance = assistance_Update_TextBox.Text;
            encounter_client_vaccine.quantity = Convert.ToInt32(quantity_Update_TextBox.Text);
            encounter_client_vaccine.Under_six_months_old = Under_six_months_old_Update_TextBox.Text;
            encounter_client_vaccine.pregnant = pregnant_Update_TextBox.Text;
            encounter_client_vaccine.children = Convert.ToInt32(children_Update_TextBox.Text);
            encounter_client_vaccine.occupation = occupation_Update_TextBox.Text;
            encounter_client_vaccine.chronic_disease = chronic_disease_Update_TextBox.Text;
            encounter_client_vaccine.qualify = qualify_Update_TextBox.Text;
            encounter_client_vaccine.dose_date1 = Convert.ToDateTime(dose_date1_Update_TextBox.Text);
            encounter_client_vaccine.dose_date2 = Convert.ToDateTime(dose_date2_Update_TextBox.Text);
            if (adult_consent_Update_FileUpload.HasFile)
            {
                byte[] uploaded_picture = adult_consent_Update_FileUpload.FileBytes;
                encounter_client_vaccine.adult_consent = uploaded_picture;
            }
            if (guardian_consent_Update_FileUpload.HasFile)
            {
                byte[] uploaded_picture = guardian_consent_Update_FileUpload.FileBytes;
                encounter_client_vaccine.guardian_consent = uploaded_picture;
            }
            encounter_client_vaccine.vaccine_admin = Convert.ToDateTime(vaccine_admin_Update_TextBox.Text);
            encounter_client_vaccine.guardian_f_name = guardian_f_name_Update_TextBox.Text;
            encounter_client_vaccine.guardian_l_name = guardian_l_name_Update_TextBox.Text;
            encounter_client_vaccine.guardian_mi = guardian_mi_Update_TextBox.Text;
            encounter_client_vaccine.guardian_phone = guardian_phone_Update_TextBox.Text;
            encounter_client_vaccine.adult_consent_date = Convert.ToDateTime(adult_consent_date_Update_TextBox.Text);
            encounter_client_vaccine.guard_consent_date = Convert.ToDateTime(guard_consent_date_Update_TextBox.Text);
            encounter_client_vaccine.dose_form1 = dose_form1_Update_TextBox.Text;
            encounter_client_vaccine.dose_form2 = dose_form2_Update_TextBox.Text;
            encounter_client_vaccine.Update(encounter_client_vaccine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return encounter_client_vaccine;
        }
        public void encounter_client_vaccine_delete(int ID)
        {
            encounter_client_vaccine.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            encounter_client_vaccine = encounter_client_vaccine_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            encounter_client_vaccine = encounter_client_vaccine_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            encounter_client_vaccine_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

