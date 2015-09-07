using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Pet_VaccineClass : System.Web.UI.Page
    {
        public Pet_Vaccine Pet_Vaccine = new Pet_Vaccine();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Vaccine = Pet_Vaccine_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Vaccine = Pet_Vaccine_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Vaccine = Pet_Vaccine_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Pet_Vaccine Pet_Vaccine_selectForInsert(int ID)
        {
            Pet_Vaccine = Pet_Vaccine.Select(ID);
            Vaccine_Type_ID_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine.Vaccine_Type_ID);
            Allergies_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine.Allergies);
            Current_Medacations_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine.Current_Medacations);
            Last_Vaccine_Given_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine.Last_Vaccine_Given);
            Date_Time_Stamp_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine.Date_Time_Stamp);
            return Pet_Vaccine;
        }
        public Pet_Vaccine Pet_Vaccine_selectForUpdate(int ID)
        {
            Pet_Vaccine = Pet_Vaccine.Select(ID);
            Pet_Vaccine_ID_Update_TextBox.Text = Convert.ToString(Pet_Vaccine.Pet_Vaccine_ID);
            Vaccine_Type_ID_Update_TextBox.Text = Convert.ToString(Pet_Vaccine.Vaccine_Type_ID);
            Allergies_Update_TextBox.Text = Convert.ToString(Pet_Vaccine.Allergies);
            Current_Medacations_Update_TextBox.Text = Convert.ToString(Pet_Vaccine.Current_Medacations);
            Last_Vaccine_Given_Update_TextBox.Text = Convert.ToString(Pet_Vaccine.Last_Vaccine_Given);
            Date_Time_Stamp_Update_TextBox.Text = Convert.ToString(Pet_Vaccine.Date_Time_Stamp);
            return Pet_Vaccine;
        }
        public Pet_Vaccine Pet_Vaccine_selectForDelete(int ID)
        {
            Pet_Vaccine = Pet_Vaccine.Select(ID);
            Pet_Vaccine_ID_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine.Pet_Vaccine_ID);
            Vaccine_Type_ID_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine.Vaccine_Type_ID);
            Allergies_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine.Allergies);
            Current_Medacations_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine.Current_Medacations);
            Last_Vaccine_Given_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine.Last_Vaccine_Given);
            Date_Time_Stamp_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine.Date_Time_Stamp);
            return Pet_Vaccine;
        }
        //Database CRUD Call Functions
        public Pet_Vaccine Pet_Vaccine_insert()
        {
            Pet_Vaccine.Vaccine_Type_ID = Convert.ToInt32(Vaccine_Type_ID_Insert_TextBox.Text);
            Pet_Vaccine.Allergies = Allergies_Insert_TextBox.Text;
            Pet_Vaccine.Current_Medacations = Current_Medacations_Insert_TextBox.Text;
            Pet_Vaccine.Last_Vaccine_Given = Convert.ToDateTime(Last_Vaccine_Given_Insert_TextBox.Text);
            Pet_Vaccine.Date_Time_Stamp = Convert.ToDateTime(Date_Time_Stamp_Insert_TextBox.Text);
            Pet_Vaccine = Pet_Vaccine.Insert(Pet_Vaccine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Vaccine;
        }
        public Pet_Vaccine Pet_Vaccine_update(int ID)
        {
            Pet_Vaccine = Pet_Vaccine.Select(ID);
            Pet_Vaccine.Pet_Vaccine_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Pet_Vaccine.Vaccine_Type_ID = Convert.ToInt32(Vaccine_Type_ID_Update_TextBox.Text);
            Pet_Vaccine.Allergies = Allergies_Update_TextBox.Text;
            Pet_Vaccine.Current_Medacations = Current_Medacations_Update_TextBox.Text;
            Pet_Vaccine.Last_Vaccine_Given = Convert.ToDateTime(Last_Vaccine_Given_Update_TextBox.Text);
            Pet_Vaccine.Date_Time_Stamp = Convert.ToDateTime(Date_Time_Stamp_Update_TextBox.Text);
            Pet_Vaccine.Update(Pet_Vaccine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Vaccine;
        }
        public void Pet_Vaccine_delete(int ID)
        {
            Pet_Vaccine.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Pet_Vaccine = Pet_Vaccine_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Pet_Vaccine = Pet_Vaccine_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Pet_Vaccine_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

