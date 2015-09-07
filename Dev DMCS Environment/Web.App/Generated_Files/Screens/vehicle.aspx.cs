using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class vehicleClass : System.Web.UI.Page
    {
        public vehicle vehicle = new vehicle();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vehicle = vehicle_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vehicle = vehicle_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vehicle = vehicle_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public vehicle vehicle_selectForInsert(int ID)
        {
            vehicle = vehicle.Select(ID);
            case_id_Insert_TextBox.Text = Convert.ToString(vehicle.case_id);
            client_id_Insert_TextBox.Text = Convert.ToString(vehicle.client_id);
            vehicle_make_Insert_TextBox.Text = Convert.ToString(vehicle.vehicle_make);
            vehicle_model_Insert_TextBox.Text = Convert.ToString(vehicle.vehicle_model);
            vehicle_type_Insert_TextBox.Text = Convert.ToString(vehicle.vehicle_type);
            vehicle_year_Insert_TextBox.Text = Convert.ToString(vehicle.vehicle_year);
            vehicle_desc_Insert_TextBox.Text = Convert.ToString(vehicle.vehicle_desc);
            vin_Insert_TextBox.Text = Convert.ToString(vehicle.vin);
            start_mileage_Insert_TextBox.Text = Convert.ToString(vehicle.start_mileage);
            first_service_date_Insert_TextBox.Text = Convert.ToString(vehicle.first_service_date);
            last_service_date_Insert_TextBox.Text = Convert.ToString(vehicle.last_service_date);
            PLATENUMBER_Insert_TextBox.Text = Convert.ToString(vehicle.PLATENUMBER);
            FUELTYPE_Insert_TextBox.Text = Convert.ToString(vehicle.FUELTYPE);
            MPH_Insert_TextBox.Text = Convert.ToString(vehicle.MPH);
            INSURED_Insert_TextBox.Text = Convert.ToString(vehicle.INSURED);
            return vehicle;
        }
        public vehicle vehicle_selectForUpdate(int ID)
        {
            vehicle = vehicle.Select(ID);
            vehicle_id_Update_TextBox.Text = Convert.ToString(vehicle.vehicle_id);
            case_id_Update_TextBox.Text = Convert.ToString(vehicle.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(vehicle.client_id);
            vehicle_make_Update_TextBox.Text = Convert.ToString(vehicle.vehicle_make);
            vehicle_model_Update_TextBox.Text = Convert.ToString(vehicle.vehicle_model);
            vehicle_type_Update_TextBox.Text = Convert.ToString(vehicle.vehicle_type);
            vehicle_year_Update_TextBox.Text = Convert.ToString(vehicle.vehicle_year);
            vehicle_desc_Update_TextBox.Text = Convert.ToString(vehicle.vehicle_desc);
            vin_Update_TextBox.Text = Convert.ToString(vehicle.vin);
            start_mileage_Update_TextBox.Text = Convert.ToString(vehicle.start_mileage);
            first_service_date_Update_TextBox.Text = Convert.ToString(vehicle.first_service_date);
            last_service_date_Update_TextBox.Text = Convert.ToString(vehicle.last_service_date);
            PLATENUMBER_Update_TextBox.Text = Convert.ToString(vehicle.PLATENUMBER);
            FUELTYPE_Update_TextBox.Text = Convert.ToString(vehicle.FUELTYPE);
            MPH_Update_TextBox.Text = Convert.ToString(vehicle.MPH);
            INSURED_Update_TextBox.Text = Convert.ToString(vehicle.INSURED);
            return vehicle;
        }
        public vehicle vehicle_selectForDelete(int ID)
        {
            vehicle = vehicle.Select(ID);
            vehicle_id_Delete_TextBox.Text = Convert.ToString(vehicle.vehicle_id);
            case_id_Delete_TextBox.Text = Convert.ToString(vehicle.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(vehicle.client_id);
            vehicle_make_Delete_TextBox.Text = Convert.ToString(vehicle.vehicle_make);
            vehicle_model_Delete_TextBox.Text = Convert.ToString(vehicle.vehicle_model);
            vehicle_type_Delete_TextBox.Text = Convert.ToString(vehicle.vehicle_type);
            vehicle_year_Delete_TextBox.Text = Convert.ToString(vehicle.vehicle_year);
            vehicle_desc_Delete_TextBox.Text = Convert.ToString(vehicle.vehicle_desc);
            vin_Delete_TextBox.Text = Convert.ToString(vehicle.vin);
            start_mileage_Delete_TextBox.Text = Convert.ToString(vehicle.start_mileage);
            first_service_date_Delete_TextBox.Text = Convert.ToString(vehicle.first_service_date);
            last_service_date_Delete_TextBox.Text = Convert.ToString(vehicle.last_service_date);
            PLATENUMBER_Delete_TextBox.Text = Convert.ToString(vehicle.PLATENUMBER);
            FUELTYPE_Delete_TextBox.Text = Convert.ToString(vehicle.FUELTYPE);
            MPH_Delete_TextBox.Text = Convert.ToString(vehicle.MPH);
            INSURED_Delete_TextBox.Text = Convert.ToString(vehicle.INSURED);
            return vehicle;
        }
        //Database CRUD Call Functions
        public vehicle vehicle_insert()
        {
            vehicle.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            vehicle.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            vehicle.vehicle_make = vehicle_make_Insert_TextBox.Text;
            vehicle.vehicle_model = vehicle_model_Insert_TextBox.Text;
            vehicle.vehicle_type = vehicle_type_Insert_TextBox.Text;
            vehicle.vehicle_year = Convert.ToInt32(vehicle_year_Insert_TextBox.Text);
            vehicle.vehicle_desc = vehicle_desc_Insert_TextBox.Text;
            vehicle.vin = vin_Insert_TextBox.Text;
            vehicle.start_mileage = Convert.ToInt32(start_mileage_Insert_TextBox.Text);
            vehicle.first_service_date = Convert.ToDateTime(first_service_date_Insert_TextBox.Text);
            vehicle.last_service_date = Convert.ToDateTime(last_service_date_Insert_TextBox.Text);
            vehicle.PLATENUMBER = PLATENUMBER_Insert_TextBox.Text;
            vehicle.FUELTYPE = FUELTYPE_Insert_TextBox.Text;
            vehicle.MPH = Convert.ToInt32(MPH_Insert_TextBox.Text);
            vehicle.INSURED = INSURED_Insert_TextBox.Text;
            vehicle = vehicle.Insert(vehicle);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vehicle;
        }
        public vehicle vehicle_update(int ID)
        {
            vehicle = vehicle.Select(ID);
            vehicle.vehicle_id = Convert.ToInt32(Update_GridView.SelectedValue);
            vehicle.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            vehicle.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            vehicle.vehicle_make = vehicle_make_Update_TextBox.Text;
            vehicle.vehicle_model = vehicle_model_Update_TextBox.Text;
            vehicle.vehicle_type = vehicle_type_Update_TextBox.Text;
            vehicle.vehicle_year = Convert.ToInt32(vehicle_year_Update_TextBox.Text);
            vehicle.vehicle_desc = vehicle_desc_Update_TextBox.Text;
            vehicle.vin = vin_Update_TextBox.Text;
            vehicle.start_mileage = Convert.ToInt32(start_mileage_Update_TextBox.Text);
            vehicle.first_service_date = Convert.ToDateTime(first_service_date_Update_TextBox.Text);
            vehicle.last_service_date = Convert.ToDateTime(last_service_date_Update_TextBox.Text);
            vehicle.PLATENUMBER = PLATENUMBER_Update_TextBox.Text;
            vehicle.FUELTYPE = FUELTYPE_Update_TextBox.Text;
            vehicle.MPH = Convert.ToInt32(MPH_Update_TextBox.Text);
            vehicle.INSURED = INSURED_Update_TextBox.Text;
            vehicle.Update(vehicle);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vehicle;
        }
        public void vehicle_delete(int ID)
        {
            vehicle.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            vehicle = vehicle_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            vehicle = vehicle_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            vehicle_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

