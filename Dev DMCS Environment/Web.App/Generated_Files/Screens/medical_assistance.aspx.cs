using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class medical_assistanceClass : System.Web.UI.Page
    {
        public medical_assistance medical_assistance = new medical_assistance();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            medical_assistance = medical_assistance_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            medical_assistance = medical_assistance_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            medical_assistance = medical_assistance_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public medical_assistance medical_assistance_selectForInsert(int ID)
        {
            medical_assistance = medical_assistance.Select(ID);
            em_id_Insert_TextBox.Text = Convert.ToString(medical_assistance.em_id);
            medical_assist_date_Insert_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_date);
            medical_assist_doctor_id_Insert_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_doctor_id);
            medical_assist_hosp_price_Insert_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_hosp_price);
            medical_assist_hospital_name_Insert_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_hospital_name);
            medical_assist_script_meds_Insert_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_meds);
            medical_assist_script_price_Insert_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_price);
            medical_assist_script_quantity_Insert_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_quantity);
            return medical_assistance;
        }
        public medical_assistance medical_assistance_selectForUpdate(int ID)
        {
            medical_assistance = medical_assistance.Select(ID);
            medical_assist_order_id_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_order_id);
            em_id_Update_TextBox.Text = Convert.ToString(medical_assistance.em_id);
            medical_assist_date_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_date);
            medical_assist_doctor_id_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_doctor_id);
            medical_assist_hosp_price_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_hosp_price);
            medical_assist_hospital_name_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_hospital_name);
            medical_assist_script_meds_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_meds);
            medical_assist_script_price_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_price);
            medical_assist_script_quantity_Update_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_quantity);
            return medical_assistance;
        }
        public medical_assistance medical_assistance_selectForDelete(int ID)
        {
            medical_assistance = medical_assistance.Select(ID);
            medical_assist_order_id_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_order_id);
            em_id_Delete_TextBox.Text = Convert.ToString(medical_assistance.em_id);
            medical_assist_date_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_date);
            medical_assist_doctor_id_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_doctor_id);
            medical_assist_hosp_price_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_hosp_price);
            medical_assist_hospital_name_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_hospital_name);
            medical_assist_script_meds_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_meds);
            medical_assist_script_price_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_price);
            medical_assist_script_quantity_Delete_TextBox.Text = Convert.ToString(medical_assistance.medical_assist_script_quantity);
            return medical_assistance;
        }
        //Database CRUD Call Functions
        public medical_assistance medical_assistance_insert()
        {
            medical_assistance.em_id = Convert.ToInt32(em_id_Insert_TextBox.Text);
            medical_assistance.medical_assist_date = Convert.ToDateTime(medical_assist_date_Insert_TextBox.Text);
            medical_assistance.medical_assist_doctor_id = Convert.ToInt32(medical_assist_doctor_id_Insert_TextBox.Text);
            medical_assistance.medical_assist_hosp_price = Convert.ToDecimal(medical_assist_hosp_price_Insert_TextBox.Text);
            medical_assistance.medical_assist_hospital_name = medical_assist_hospital_name_Insert_TextBox.Text;
            medical_assistance.medical_assist_script_meds = medical_assist_script_meds_Insert_TextBox.Text;
            medical_assistance.medical_assist_script_price = Convert.ToDecimal(medical_assist_script_price_Insert_TextBox.Text);
            medical_assistance.medical_assist_script_quantity = Convert.ToInt32(medical_assist_script_quantity_Insert_TextBox.Text);
            medical_assistance = medical_assistance.Insert(medical_assistance);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return medical_assistance;
        }
        public medical_assistance medical_assistance_update(int ID)
        {
            medical_assistance = medical_assistance.Select(ID);
            medical_assistance.medical_assist_order_id = Convert.ToInt32(Update_GridView.SelectedValue);
            medical_assistance.em_id = Convert.ToInt32(em_id_Update_TextBox.Text);
            medical_assistance.medical_assist_date = Convert.ToDateTime(medical_assist_date_Update_TextBox.Text);
            medical_assistance.medical_assist_doctor_id = Convert.ToInt32(medical_assist_doctor_id_Update_TextBox.Text);
            medical_assistance.medical_assist_hosp_price = Convert.ToDecimal(medical_assist_hosp_price_Update_TextBox.Text);
            medical_assistance.medical_assist_hospital_name = medical_assist_hospital_name_Update_TextBox.Text;
            medical_assistance.medical_assist_script_meds = medical_assist_script_meds_Update_TextBox.Text;
            medical_assistance.medical_assist_script_price = Convert.ToDecimal(medical_assist_script_price_Update_TextBox.Text);
            medical_assistance.medical_assist_script_quantity = Convert.ToInt32(medical_assist_script_quantity_Update_TextBox.Text);
            medical_assistance.Update(medical_assistance);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return medical_assistance;
        }
        public void medical_assistance_delete(int ID)
        {
            medical_assistance.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            medical_assistance = medical_assistance_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            medical_assistance = medical_assistance_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            medical_assistance_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

