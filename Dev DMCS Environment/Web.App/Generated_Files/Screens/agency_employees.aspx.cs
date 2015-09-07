using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class agency_employeesClass : System.Web.UI.Page
    {
        public agency_employees agency_employees = new agency_employees();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            agency_employees = agency_employees_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            agency_employees = agency_employees_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            agency_employees = agency_employees_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public agency_employees agency_employees_selectForInsert(int ID)
        {
            agency_employees = agency_employees.Select(ID);
            agency_id_Insert_TextBox.Text = Convert.ToString(agency_employees.agency_id);
            employee_id_Insert_TextBox.Text = Convert.ToString(agency_employees.employee_id);
            return agency_employees;
        }
        public agency_employees agency_employees_selectForUpdate(int ID)
        {
            agency_employees = agency_employees.Select(ID);
            agency_empl_id_Update_TextBox.Text = Convert.ToString(agency_employees.agency_empl_id);
            agency_id_Update_TextBox.Text = Convert.ToString(agency_employees.agency_id);
            employee_id_Update_TextBox.Text = Convert.ToString(agency_employees.employee_id);
            return agency_employees;
        }
        public agency_employees agency_employees_selectForDelete(int ID)
        {
            agency_employees = agency_employees.Select(ID);
            agency_empl_id_Delete_TextBox.Text = Convert.ToString(agency_employees.agency_empl_id);
            agency_id_Delete_TextBox.Text = Convert.ToString(agency_employees.agency_id);
            employee_id_Delete_TextBox.Text = Convert.ToString(agency_employees.employee_id);
            return agency_employees;
        }
        //Database CRUD Call Functions
        public agency_employees agency_employees_insert()
        {
            agency_employees.agency_id = Convert.ToInt32(agency_id_Insert_TextBox.Text);
            agency_employees.employee_id = Convert.ToInt32(employee_id_Insert_TextBox.Text);
            agency_employees = agency_employees.Insert(agency_employees);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return agency_employees;
        }
        public agency_employees agency_employees_update(int ID)
        {
            agency_employees = agency_employees.Select(ID);
            agency_employees.agency_empl_id = Convert.ToInt32(Update_GridView.SelectedValue);
            agency_employees.agency_id = Convert.ToInt32(agency_id_Update_TextBox.Text);
            agency_employees.employee_id = Convert.ToInt32(employee_id_Update_TextBox.Text);
            agency_employees.Update(agency_employees);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return agency_employees;
        }
        public void agency_employees_delete(int ID)
        {
            agency_employees.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            agency_employees = agency_employees_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            agency_employees = agency_employees_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            agency_employees_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

