using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class mobile_employeesClass : System.Web.UI.Page
    {
        public mobile_employees mobile_employees = new mobile_employees();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            mobile_employees = mobile_employees_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            mobile_employees = mobile_employees_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            mobile_employees = mobile_employees_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public mobile_employees mobile_employees_selectForInsert(int ID)
        {
            mobile_employees = mobile_employees.Select(ID);
            mobile_unit_id_Insert_TextBox.Text = Convert.ToString(mobile_employees.mobile_unit_id);
            employee_id_Insert_TextBox.Text = Convert.ToString(mobile_employees.employee_id);
            return mobile_employees;
        }
        public mobile_employees mobile_employees_selectForUpdate(int ID)
        {
            mobile_employees = mobile_employees.Select(ID);
            mobile_employee_id_Update_TextBox.Text = Convert.ToString(mobile_employees.mobile_employee_id);
            mobile_unit_id_Update_TextBox.Text = Convert.ToString(mobile_employees.mobile_unit_id);
            employee_id_Update_TextBox.Text = Convert.ToString(mobile_employees.employee_id);
            return mobile_employees;
        }
        public mobile_employees mobile_employees_selectForDelete(int ID)
        {
            mobile_employees = mobile_employees.Select(ID);
            mobile_employee_id_Delete_TextBox.Text = Convert.ToString(mobile_employees.mobile_employee_id);
            mobile_unit_id_Delete_TextBox.Text = Convert.ToString(mobile_employees.mobile_unit_id);
            employee_id_Delete_TextBox.Text = Convert.ToString(mobile_employees.employee_id);
            return mobile_employees;
        }
        //Database CRUD Call Functions
        public mobile_employees mobile_employees_insert()
        {
            mobile_employees.mobile_unit_id = Convert.ToInt32(mobile_unit_id_Insert_TextBox.Text);
            mobile_employees.employee_id = Convert.ToInt32(employee_id_Insert_TextBox.Text);
            mobile_employees = mobile_employees.Insert(mobile_employees);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return mobile_employees;
        }
        public mobile_employees mobile_employees_update(int ID)
        {
            mobile_employees = mobile_employees.Select(ID);
            mobile_employees.mobile_employee_id = Convert.ToInt32(Update_GridView.SelectedValue);
            mobile_employees.mobile_unit_id = Convert.ToInt32(mobile_unit_id_Update_TextBox.Text);
            mobile_employees.employee_id = Convert.ToInt32(employee_id_Update_TextBox.Text);
            mobile_employees.Update(mobile_employees);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return mobile_employees;
        }
        public void mobile_employees_delete(int ID)
        {
            mobile_employees.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            mobile_employees = mobile_employees_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            mobile_employees = mobile_employees_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            mobile_employees_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

