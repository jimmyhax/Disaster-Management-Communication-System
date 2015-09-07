using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Evacuation_Encounter_Shelter_EmployeeClass : System.Web.UI.Page
    {
        public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee = new Evacuation_Encounter_Shelter_Employee();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee_selectForInsert(int ID)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
            Shelter_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Shelter_ID);
            Employee_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Employee_ID);
            Evacuation_Area_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID);
            Encounter_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Encounter_ID);
            return Evacuation_Encounter_Shelter_Employee;
        }
        public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee_selectForUpdate(int ID)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
            Evacuation_Encounter_Shelter_Employee_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID);
            Shelter_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Shelter_ID);
            Employee_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Employee_ID);
            Evacuation_Area_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID);
            Encounter_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Encounter_ID);
            return Evacuation_Encounter_Shelter_Employee;
        }
        public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee_selectForDelete(int ID)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
            Evacuation_Encounter_Shelter_Employee_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID);
            Shelter_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Shelter_ID);
            Employee_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Employee_ID);
            Evacuation_Area_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID);
            Encounter_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Encounter_ID);
            return Evacuation_Encounter_Shelter_Employee;
        }
        //Database CRUD Call Functions
        public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee_insert()
        {
            Evacuation_Encounter_Shelter_Employee.Shelter_ID = Convert.ToInt32(Shelter_ID_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee.Employee_ID = Convert.ToInt32(Employee_ID_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee.Encounter_ID = Convert.ToInt32(Encounter_ID_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Insert(Evacuation_Encounter_Shelter_Employee);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Evacuation_Encounter_Shelter_Employee;
        }
        public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee_update(int ID)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
            Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Evacuation_Encounter_Shelter_Employee.Shelter_ID = Convert.ToInt32(Shelter_ID_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee.Employee_ID = Convert.ToInt32(Employee_ID_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee.Encounter_ID = Convert.ToInt32(Encounter_ID_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Employee.Update(Evacuation_Encounter_Shelter_Employee);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Evacuation_Encounter_Shelter_Employee;
        }
        public void Evacuation_Encounter_Shelter_Employee_delete(int ID)
        {
            Evacuation_Encounter_Shelter_Employee.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Employee_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

