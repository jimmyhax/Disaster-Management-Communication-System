using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class medicineClass : System.Web.UI.Page
    {
        public medicine medicine = new medicine();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            medicine = medicine_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            medicine = medicine_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            medicine = medicine_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public medicine medicine_selectForInsert(int ID)
        {
            medicine = medicine.Select(ID);
            Medication_type_Insert_TextBox.Text = Convert.ToString(medicine.Medication_type);
            Medication_name_Insert_TextBox.Text = Convert.ToString(medicine.Medication_name);
            Clients_Served_Insert_TextBox.Text = Convert.ToString(medicine.Clients_Served);
            return medicine;
        }
        public medicine medicine_selectForUpdate(int ID)
        {
            medicine = medicine.Select(ID);
            Medicine_Id_Update_TextBox.Text = Convert.ToString(medicine.Medicine_Id);
            Medication_type_Update_TextBox.Text = Convert.ToString(medicine.Medication_type);
            Medication_name_Update_TextBox.Text = Convert.ToString(medicine.Medication_name);
            Clients_Served_Update_TextBox.Text = Convert.ToString(medicine.Clients_Served);
            return medicine;
        }
        public medicine medicine_selectForDelete(int ID)
        {
            medicine = medicine.Select(ID);
            Medicine_Id_Delete_TextBox.Text = Convert.ToString(medicine.Medicine_Id);
            Medication_type_Delete_TextBox.Text = Convert.ToString(medicine.Medication_type);
            Medication_name_Delete_TextBox.Text = Convert.ToString(medicine.Medication_name);
            Clients_Served_Delete_TextBox.Text = Convert.ToString(medicine.Clients_Served);
            return medicine;
        }
        //Database CRUD Call Functions
        public medicine medicine_insert()
        {
            medicine.Medication_type = Medication_type_Insert_TextBox.Text;
            medicine.Medication_name = Medication_name_Insert_TextBox.Text;
            medicine.Clients_Served = Convert.ToInt32(Clients_Served_Insert_TextBox.Text);
            medicine = medicine.Insert(medicine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return medicine;
        }
        public medicine medicine_update(int ID)
        {
            medicine = medicine.Select(ID);
            medicine.Medicine_Id = Convert.ToInt32(Update_GridView.SelectedValue);
            medicine.Medication_type = Medication_type_Update_TextBox.Text;
            medicine.Medication_name = Medication_name_Update_TextBox.Text;
            medicine.Clients_Served = Convert.ToInt32(Clients_Served_Update_TextBox.Text);
            medicine.Update(medicine);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return medicine;
        }
        public void medicine_delete(int ID)
        {
            medicine.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            medicine = medicine_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            medicine = medicine_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            medicine_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

