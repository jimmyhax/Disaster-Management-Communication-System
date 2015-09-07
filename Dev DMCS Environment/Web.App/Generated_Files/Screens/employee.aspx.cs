using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class employeeClass : System.Web.UI.Page
    {
        public employee employee = new employee();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employee = employee_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employee = employee_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employee = employee_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public employee employee_selectForInsert(int ID)
        {
            employee = employee.Select(ID);
            member_id_Insert_TextBox.Text = Convert.ToString(employee.member_id);
            employee_date_hired_Insert_TextBox.Text = Convert.ToString(employee.employee_date_hired);
            employee_department_Insert_TextBox.Text = Convert.ToString(employee.employee_department);
            employee_hours_worked_Insert_TextBox.Text = Convert.ToString(employee.employee_hours_worked);
            employee_leadership_Insert_TextBox.Text = Convert.ToString(employee.employee_leadership);
            employee_motivation_Insert_TextBox.Text = Convert.ToString(employee.employee_motivation);
            employee_notes_Insert_TextBox.Text = Convert.ToString(employee.employee_notes);
            employee_overall_Insert_TextBox.Text = Convert.ToString(employee.employee_overall);
            employee_payrate_Insert_TextBox.Text = Convert.ToString(employee.employee_payrate);
            employee_performance_Insert_TextBox.Text = Convert.ToString(employee.employee_performance);
            employee_quality_Insert_TextBox.Text = Convert.ToString(employee.employee_quality);
            employee_timeliness_Insert_TextBox.Text = Convert.ToString(employee.employee_timeliness);
            username_Insert_TextBox.Text = Convert.ToString(employee.username);
            pswd_Insert_TextBox.Text = Convert.ToString(employee.pswd);
            return employee;
        }
        public employee employee_selectForUpdate(int ID)
        {
            employee = employee.Select(ID);
            employee_id_Update_TextBox.Text = Convert.ToString(employee.employee_id);
            member_id_Update_TextBox.Text = Convert.ToString(employee.member_id);
            employee_date_hired_Update_TextBox.Text = Convert.ToString(employee.employee_date_hired);
            employee_department_Update_TextBox.Text = Convert.ToString(employee.employee_department);
            employee_hours_worked_Update_TextBox.Text = Convert.ToString(employee.employee_hours_worked);
            employee_leadership_Update_TextBox.Text = Convert.ToString(employee.employee_leadership);
            employee_motivation_Update_TextBox.Text = Convert.ToString(employee.employee_motivation);
            employee_notes_Update_TextBox.Text = Convert.ToString(employee.employee_notes);
            employee_overall_Update_TextBox.Text = Convert.ToString(employee.employee_overall);
            employee_payrate_Update_TextBox.Text = Convert.ToString(employee.employee_payrate);
            employee_performance_Update_TextBox.Text = Convert.ToString(employee.employee_performance);
            employee_quality_Update_TextBox.Text = Convert.ToString(employee.employee_quality);
            employee_timeliness_Update_TextBox.Text = Convert.ToString(employee.employee_timeliness);
            username_Update_TextBox.Text = Convert.ToString(employee.username);
            pswd_Update_TextBox.Text = Convert.ToString(employee.pswd);
            return employee;
        }
        public employee employee_selectForDelete(int ID)
        {
            employee = employee.Select(ID);
            employee_id_Delete_TextBox.Text = Convert.ToString(employee.employee_id);
            member_id_Delete_TextBox.Text = Convert.ToString(employee.member_id);
            employee_date_hired_Delete_TextBox.Text = Convert.ToString(employee.employee_date_hired);
            employee_department_Delete_TextBox.Text = Convert.ToString(employee.employee_department);
            employee_hours_worked_Delete_TextBox.Text = Convert.ToString(employee.employee_hours_worked);
            employee_leadership_Delete_TextBox.Text = Convert.ToString(employee.employee_leadership);
            employee_motivation_Delete_TextBox.Text = Convert.ToString(employee.employee_motivation);
            employee_notes_Delete_TextBox.Text = Convert.ToString(employee.employee_notes);
            employee_overall_Delete_TextBox.Text = Convert.ToString(employee.employee_overall);
            employee_payrate_Delete_TextBox.Text = Convert.ToString(employee.employee_payrate);
            employee_performance_Delete_TextBox.Text = Convert.ToString(employee.employee_performance);
            employee_quality_Delete_TextBox.Text = Convert.ToString(employee.employee_quality);
            employee_timeliness_Delete_TextBox.Text = Convert.ToString(employee.employee_timeliness);
            username_Delete_TextBox.Text = Convert.ToString(employee.username);
            pswd_Delete_TextBox.Text = Convert.ToString(employee.pswd);
            return employee;
        }
        //Database CRUD Call Functions
        public employee employee_insert()
        {
            employee.employee_date_hired = Convert.ToDateTime(employee_date_hired_Insert_TextBox.Text);
            employee.employee_department = employee_department_Insert_TextBox.Text;
            employee.employee_hours_worked = Convert.ToInt32(employee_hours_worked_Insert_TextBox.Text);
            employee.employee_leadership = employee_leadership_Insert_TextBox.Text;
            employee.employee_motivation = employee_motivation_Insert_TextBox.Text;
            employee.employee_notes = employee_notes_Insert_TextBox.Text;
            employee.employee_overall = employee_overall_Insert_TextBox.Text;
            employee.employee_payrate = Convert.ToDecimal(employee_payrate_Insert_TextBox.Text);
            employee.employee_performance = employee_performance_Insert_TextBox.Text;
            employee.employee_quality = employee_quality_Insert_TextBox.Text;
            employee.employee_timeliness = employee_timeliness_Insert_TextBox.Text;
            employee.username = username_Insert_TextBox.Text;
            employee.pswd = pswd_Insert_TextBox.Text;
            employee = employee.Insert(employee);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return employee;
        }
        public employee employee_update(int ID)
        {
            employee = employee.Select(ID);
            employee.employee_id = Convert.ToInt32(Update_GridView.SelectedValue);
            employee.employee_date_hired = Convert.ToDateTime(employee_date_hired_Update_TextBox.Text);
            employee.employee_department = employee_department_Update_TextBox.Text;
            employee.employee_hours_worked = Convert.ToInt32(employee_hours_worked_Update_TextBox.Text);
            employee.employee_leadership = employee_leadership_Update_TextBox.Text;
            employee.employee_motivation = employee_motivation_Update_TextBox.Text;
            employee.employee_notes = employee_notes_Update_TextBox.Text;
            employee.employee_overall = employee_overall_Update_TextBox.Text;
            employee.employee_payrate = Convert.ToDecimal(employee_payrate_Update_TextBox.Text);
            employee.employee_performance = employee_performance_Update_TextBox.Text;
            employee.employee_quality = employee_quality_Update_TextBox.Text;
            employee.employee_timeliness = employee_timeliness_Update_TextBox.Text;
            employee.username = username_Update_TextBox.Text;
            employee.pswd = pswd_Update_TextBox.Text;
            employee.Update(employee);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return employee;
        }
        public void employee_delete(int ID)
        {
            employee.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            employee = employee_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            employee = employee_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            employee_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

