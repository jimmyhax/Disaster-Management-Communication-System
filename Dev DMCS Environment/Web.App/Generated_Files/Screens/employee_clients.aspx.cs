using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class employee_clientsClass : System.Web.UI.Page
    {
        public employee_clients employee_clients = new employee_clients();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employee_clients = employee_clients_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employee_clients = employee_clients_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employee_clients = employee_clients_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public employee_clients employee_clients_selectForInsert(int ID)
        {
            employee_clients = employee_clients.Select(ID);
            client_id_Insert_TextBox.Text = Convert.ToString(employee_clients.client_id);
            employee_id_Insert_TextBox.Text = Convert.ToString(employee_clients.employee_id);
            return employee_clients;
        }
        public employee_clients employee_clients_selectForUpdate(int ID)
        {
            employee_clients = employee_clients.Select(ID);
            emp_client_id_Update_TextBox.Text = Convert.ToString(employee_clients.emp_client_id);
            client_id_Update_TextBox.Text = Convert.ToString(employee_clients.client_id);
            employee_id_Update_TextBox.Text = Convert.ToString(employee_clients.employee_id);
            return employee_clients;
        }
        public employee_clients employee_clients_selectForDelete(int ID)
        {
            employee_clients = employee_clients.Select(ID);
            emp_client_id_Delete_TextBox.Text = Convert.ToString(employee_clients.emp_client_id);
            client_id_Delete_TextBox.Text = Convert.ToString(employee_clients.client_id);
            employee_id_Delete_TextBox.Text = Convert.ToString(employee_clients.employee_id);
            return employee_clients;
        }
        //Database CRUD Call Functions
        public employee_clients employee_clients_insert()
        {
            employee_clients.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            employee_clients.employee_id = Convert.ToInt32(employee_id_Insert_TextBox.Text);
            employee_clients = employee_clients.Insert(employee_clients);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return employee_clients;
        }
        public employee_clients employee_clients_update(int ID)
        {
            employee_clients = employee_clients.Select(ID);
            employee_clients.emp_client_id = Convert.ToInt32(Update_GridView.SelectedValue);
            employee_clients.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            employee_clients.employee_id = Convert.ToInt32(employee_id_Update_TextBox.Text);
            employee_clients.Update(employee_clients);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return employee_clients;
        }
        public void employee_clients_delete(int ID)
        {
            employee_clients.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            employee_clients = employee_clients_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            employee_clients = employee_clients_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            employee_clients_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

