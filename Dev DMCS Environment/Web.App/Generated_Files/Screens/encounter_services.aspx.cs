using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class encounter_servicesClass : System.Web.UI.Page
    {
        public encounter_services encounter_services = new encounter_services();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter_services = encounter_services_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter_services = encounter_services_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter_services = encounter_services_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public encounter_services encounter_services_selectForInsert(int ID)
        {
            encounter_services = encounter_services.Select(ID);
            encounter_id_Insert_TextBox.Text = Convert.ToString(encounter_services.encounter_id);
            mobile_unit_id_Insert_TextBox.Text = Convert.ToString(encounter_services.mobile_unit_id);
            service_id_Insert_TextBox.Text = Convert.ToString(encounter_services.service_id);
            service_date_Insert_TextBox.Text = Convert.ToString(encounter_services.service_date);
            service_completed_Insert_TextBox.Text = Convert.ToString(encounter_services.service_completed);
            return encounter_services;
        }
        public encounter_services encounter_services_selectForUpdate(int ID)
        {
            encounter_services = encounter_services.Select(ID);
            encounter_serv_id_Update_TextBox.Text = Convert.ToString(encounter_services.encounter_serv_id);
            encounter_id_Update_TextBox.Text = Convert.ToString(encounter_services.encounter_id);
            mobile_unit_id_Update_TextBox.Text = Convert.ToString(encounter_services.mobile_unit_id);
            service_id_Update_TextBox.Text = Convert.ToString(encounter_services.service_id);
            service_date_Update_TextBox.Text = Convert.ToString(encounter_services.service_date);
            service_completed_Update_TextBox.Text = Convert.ToString(encounter_services.service_completed);
            return encounter_services;
        }
        public encounter_services encounter_services_selectForDelete(int ID)
        {
            encounter_services = encounter_services.Select(ID);
            encounter_serv_id_Delete_TextBox.Text = Convert.ToString(encounter_services.encounter_serv_id);
            encounter_id_Delete_TextBox.Text = Convert.ToString(encounter_services.encounter_id);
            mobile_unit_id_Delete_TextBox.Text = Convert.ToString(encounter_services.mobile_unit_id);
            service_id_Delete_TextBox.Text = Convert.ToString(encounter_services.service_id);
            service_date_Delete_TextBox.Text = Convert.ToString(encounter_services.service_date);
            service_completed_Delete_TextBox.Text = Convert.ToString(encounter_services.service_completed);
            return encounter_services;
        }
        //Database CRUD Call Functions
        public encounter_services encounter_services_insert()
        {
            encounter_services.encounter_id = Convert.ToInt32(encounter_id_Insert_TextBox.Text);
            encounter_services.mobile_unit_id = Convert.ToInt32(mobile_unit_id_Insert_TextBox.Text);
            encounter_services.service_id = Convert.ToInt32(service_id_Insert_TextBox.Text);
            encounter_services.service_date = Convert.ToDateTime(service_date_Insert_TextBox.Text);
            encounter_services.service_completed = Convert.ToDateTime(service_completed_Insert_TextBox.Text);
            encounter_services = encounter_services.Insert(encounter_services);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return encounter_services;
        }
        public encounter_services encounter_services_update(int ID)
        {
            encounter_services = encounter_services.Select(ID);
            encounter_services.encounter_serv_id = Convert.ToInt32(Update_GridView.SelectedValue);
            encounter_services.encounter_id = Convert.ToInt32(encounter_id_Update_TextBox.Text);
            encounter_services.mobile_unit_id = Convert.ToInt32(mobile_unit_id_Update_TextBox.Text);
            encounter_services.service_id = Convert.ToInt32(service_id_Update_TextBox.Text);
            encounter_services.service_date = Convert.ToDateTime(service_date_Update_TextBox.Text);
            encounter_services.service_completed = Convert.ToDateTime(service_completed_Update_TextBox.Text);
            encounter_services.Update(encounter_services);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return encounter_services;
        }
        public void encounter_services_delete(int ID)
        {
            encounter_services.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            encounter_services = encounter_services_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            encounter_services = encounter_services_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            encounter_services_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

