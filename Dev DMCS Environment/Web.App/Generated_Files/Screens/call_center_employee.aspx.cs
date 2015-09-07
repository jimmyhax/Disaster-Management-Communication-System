using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class call_center_employeeClass : System.Web.UI.Page
    {
        public call_center_employee call_center_employee = new call_center_employee();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            call_center_employee = call_center_employee_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            call_center_employee = call_center_employee_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            call_center_employee = call_center_employee_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public call_center_employee call_center_employee_selectForInsert(int ID)
        {
            call_center_employee = call_center_employee.Select(ID);
            call_center_id_Insert_TextBox.Text = Convert.ToString(call_center_employee.call_center_id);
            employee_id_Insert_TextBox.Text = Convert.ToString(call_center_employee.employee_id);
            return call_center_employee;
        }
        public call_center_employee call_center_employee_selectForUpdate(int ID)
        {
            call_center_employee = call_center_employee.Select(ID);
            call_center_employee_id_Update_TextBox.Text = Convert.ToString(call_center_employee.call_center_employee_id);
            call_center_id_Update_TextBox.Text = Convert.ToString(call_center_employee.call_center_id);
            employee_id_Update_TextBox.Text = Convert.ToString(call_center_employee.employee_id);
            return call_center_employee;
        }
        public call_center_employee call_center_employee_selectForDelete(int ID)
        {
            call_center_employee = call_center_employee.Select(ID);
            call_center_employee_id_Delete_TextBox.Text = Convert.ToString(call_center_employee.call_center_employee_id);
            call_center_id_Delete_TextBox.Text = Convert.ToString(call_center_employee.call_center_id);
            employee_id_Delete_TextBox.Text = Convert.ToString(call_center_employee.employee_id);
            return call_center_employee;
        }
        //Database CRUD Call Functions
        public call_center_employee call_center_employee_insert()
        {
            call_center_employee.call_center_id = Convert.ToInt32(call_center_id_Insert_TextBox.Text);
            call_center_employee.employee_id = Convert.ToInt32(employee_id_Insert_TextBox.Text);
            call_center_employee = call_center_employee.Insert(call_center_employee);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return call_center_employee;
        }
        public call_center_employee call_center_employee_update(int ID)
        {
            call_center_employee = call_center_employee.Select(ID);
            call_center_employee.call_center_employee_id = Convert.ToInt32(Update_GridView.SelectedValue);
            call_center_employee.call_center_id = Convert.ToInt32(call_center_id_Update_TextBox.Text);
            call_center_employee.employee_id = Convert.ToInt32(employee_id_Update_TextBox.Text);
            call_center_employee.Update(call_center_employee);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return call_center_employee;
        }
        public void call_center_employee_delete(int ID)
        {
            call_center_employee.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            call_center_employee = call_center_employee_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            call_center_employee = call_center_employee_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            call_center_employee_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

