using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class servicesClass : System.Web.UI.Page
    {
        public services services = new services();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            services = services_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            services = services_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            services = services_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public services services_selectForInsert(int ID)
        {
            services = services.Select(ID);
            Company_Insert_TextBox.Text = Convert.ToString(services.Company);
            service_type_Insert_TextBox.Text = Convert.ToString(services.service_type);
            Estimated_Time_Insert_TextBox.Text = Convert.ToString(services.Estimated_Time);
            Email_Insert_TextBox.Text = Convert.ToString(services.Email);
            Phone_Number_Insert_TextBox.Text = Convert.ToString(services.Phone_Number);
            Full_Cost_Insert_TextBox.Text = Convert.ToString(services.Full_Cost);
            Estimated_Cost_Insert_TextBox.Text = Convert.ToString(services.Estimated_Cost);
            return services;
        }
        public services services_selectForUpdate(int ID)
        {
            services = services.Select(ID);
            service_id_Update_TextBox.Text = Convert.ToString(services.service_id);
            Company_Update_TextBox.Text = Convert.ToString(services.Company);
            service_type_Update_TextBox.Text = Convert.ToString(services.service_type);
            Estimated_Time_Update_TextBox.Text = Convert.ToString(services.Estimated_Time);
            Email_Update_TextBox.Text = Convert.ToString(services.Email);
            Phone_Number_Update_TextBox.Text = Convert.ToString(services.Phone_Number);
            Full_Cost_Update_TextBox.Text = Convert.ToString(services.Full_Cost);
            Estimated_Cost_Update_TextBox.Text = Convert.ToString(services.Estimated_Cost);
            return services;
        }
        public services services_selectForDelete(int ID)
        {
            services = services.Select(ID);
            service_id_Delete_TextBox.Text = Convert.ToString(services.service_id);
            Company_Delete_TextBox.Text = Convert.ToString(services.Company);
            service_type_Delete_TextBox.Text = Convert.ToString(services.service_type);
            Estimated_Time_Delete_TextBox.Text = Convert.ToString(services.Estimated_Time);
            Email_Delete_TextBox.Text = Convert.ToString(services.Email);
            Phone_Number_Delete_TextBox.Text = Convert.ToString(services.Phone_Number);
            Full_Cost_Delete_TextBox.Text = Convert.ToString(services.Full_Cost);
            Estimated_Cost_Delete_TextBox.Text = Convert.ToString(services.Estimated_Cost);
            return services;
        }
        //Database CRUD Call Functions
        public services services_insert()
        {
            services.Company = Company_Insert_TextBox.Text;
            services.service_type = service_type_Insert_TextBox.Text;
            services.Estimated_Time = Convert.ToDateTime(Estimated_Time_Insert_TextBox.Text);
            services.Email = Email_Insert_TextBox.Text;
            services.Phone_Number = Convert.ToInt32(Phone_Number_Insert_TextBox.Text);
            services.Full_Cost = Convert.ToInt32(Full_Cost_Insert_TextBox.Text);
            services.Estimated_Cost = Convert.ToInt32(Estimated_Cost_Insert_TextBox.Text);
            services = services.Insert(services);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return services;
        }
        public services services_update(int ID)
        {
            services = services.Select(ID);
            services.service_id = Convert.ToInt32(Update_GridView.SelectedValue);
            services.Company = Company_Update_TextBox.Text;
            services.service_type = service_type_Update_TextBox.Text;
            services.Estimated_Time = Convert.ToDateTime(Estimated_Time_Update_TextBox.Text);
            services.Email = Email_Update_TextBox.Text;
            services.Phone_Number = Convert.ToInt32(Phone_Number_Update_TextBox.Text);
            services.Full_Cost = Convert.ToInt32(Full_Cost_Update_TextBox.Text);
            services.Estimated_Cost = Convert.ToInt32(Estimated_Cost_Update_TextBox.Text);
            services.Update(services);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return services;
        }
        public void services_delete(int ID)
        {
            services.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            services = services_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            services = services_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            services_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

