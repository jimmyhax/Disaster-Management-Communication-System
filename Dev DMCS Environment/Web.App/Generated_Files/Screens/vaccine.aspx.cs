using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class vaccineClass : System.Web.UI.Page
    {
        public vaccine vaccine = new vaccine();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vaccine = vaccine_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vaccine = vaccine_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vaccine = vaccine_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public vaccine vaccine_selectForInsert(int ID)
        {
            vaccine = vaccine.Select(ID);
            medicine_id_Insert_TextBox.Text = Convert.ToString(vaccine.medicine_id);
            Num_of_reg_doses_Insert_TextBox.Text = Convert.ToString(vaccine.Num_of_reg_doses);
            vaccine_name_Insert_TextBox.Text = Convert.ToString(vaccine.vaccine_name);
            return vaccine;
        }
        public vaccine vaccine_selectForUpdate(int ID)
        {
            vaccine = vaccine.Select(ID);
            vaccine_id_Update_TextBox.Text = Convert.ToString(vaccine.vaccine_id);
            medicine_id_Update_TextBox.Text = Convert.ToString(vaccine.medicine_id);
            Num_of_reg_doses_Update_TextBox.Text = Convert.ToString(vaccine.Num_of_reg_doses);
            vaccine_name_Update_TextBox.Text = Convert.ToString(vaccine.vaccine_name);
            return vaccine;
        }
        public vaccine vaccine_selectForDelete(int ID)
        {
            vaccine = vaccine.Select(ID);
            vaccine_id_Delete_TextBox.Text = Convert.ToString(vaccine.vaccine_id);
            medicine_id_Delete_TextBox.Text = Convert.ToString(vaccine.medicine_id);
            Num_of_reg_doses_Delete_TextBox.Text = Convert.ToString(vaccine.Num_of_reg_doses);
            vaccine_name_Delete_TextBox.Text = Convert.ToString(vaccine.vaccine_name);
            return vaccine;
        }
        //Database CRUD Call Functions
        public vaccine vaccine_insert()
        {
            vaccine.medicine_id = Convert.ToInt32(medicine_id_Insert_TextBox.Text);
            vaccine.Num_of_reg_doses = Convert.ToInt32(Num_of_reg_doses_Insert_TextBox.Text);
            vaccine.vaccine_name = vaccine_name_Insert_TextBox.Text;
            vaccine = vaccine.Insert(vaccine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vaccine;
        }
        public vaccine vaccine_update(int ID)
        {
            vaccine = vaccine.Select(ID);
            vaccine.vaccine_id = Convert.ToInt32(Update_GridView.SelectedValue);
            vaccine.medicine_id = Convert.ToInt32(medicine_id_Update_TextBox.Text);
            vaccine.Num_of_reg_doses = Convert.ToInt32(Num_of_reg_doses_Update_TextBox.Text);
            vaccine.vaccine_name = vaccine_name_Update_TextBox.Text;
            vaccine.Update(vaccine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vaccine;
        }
        public void vaccine_delete(int ID)
        {
            vaccine.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            vaccine = vaccine_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            vaccine = vaccine_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            vaccine_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

