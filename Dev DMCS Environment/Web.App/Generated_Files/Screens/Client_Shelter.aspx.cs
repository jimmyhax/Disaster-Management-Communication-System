using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Client_ShelterClass : System.Web.UI.Page
    {
        public Client_Shelter Client_Shelter = new Client_Shelter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Client_Shelter = Client_Shelter_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Client_Shelter = Client_Shelter_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Client_Shelter = Client_Shelter_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Client_Shelter Client_Shelter_selectForInsert(int ID)
        {
            Client_Shelter = Client_Shelter.Select(ID);
            Shelter_ID_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_ID);
            Client_ID_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Client_ID);
            Current_address_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Current_address);
            Current_State_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Current_State);
            Current_City_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Current_City);
            Current_Zip_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Current_Zip);
            Client_registration_status_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Client_registration_status);
            Household_size_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Household_size);
            Shelter_supplies_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_supplies);
            Shelter_occupancy_current_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_occupancy_current);
            New_household_registered_Insert_TextBox.Text = Convert.ToString(Client_Shelter.New_household_registered);
            New_Shelter_address_Insert_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_address);
            New_Shelter_city_Insert_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_city);
            New_Shelter_State_Insert_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_State);
            New_Shelter_Zip_Insert_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_Zip);
            New_Contact_Number_Insert_TextBox.Text = Convert.ToString(Client_Shelter.New_Contact_Number);
            Current_household_members_safe_Insert_TextBox.Text = Convert.ToString(Client_Shelter.Current_household_members_safe);
            CheckIn_Date_Insert_TextBox.Text = Convert.ToString(Client_Shelter.CheckIn_Date);
            CheckOut_Date_Insert_TextBox.Text = Convert.ToString(Client_Shelter.CheckOut_Date);
            return Client_Shelter;
        }
        public Client_Shelter Client_Shelter_selectForUpdate(int ID)
        {
            Client_Shelter = Client_Shelter.Select(ID);
            Client_Shelter_ID_Update_TextBox.Text = Convert.ToString(Client_Shelter.Client_Shelter_ID);
            Shelter_ID_Update_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_ID);
            Client_ID_Update_TextBox.Text = Convert.ToString(Client_Shelter.Client_ID);
            Current_address_Update_TextBox.Text = Convert.ToString(Client_Shelter.Current_address);
            Current_State_Update_TextBox.Text = Convert.ToString(Client_Shelter.Current_State);
            Current_City_Update_TextBox.Text = Convert.ToString(Client_Shelter.Current_City);
            Current_Zip_Update_TextBox.Text = Convert.ToString(Client_Shelter.Current_Zip);
            Client_registration_status_Update_TextBox.Text = Convert.ToString(Client_Shelter.Client_registration_status);
            Household_size_Update_TextBox.Text = Convert.ToString(Client_Shelter.Household_size);
            Shelter_supplies_Update_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_supplies);
            Shelter_occupancy_current_Update_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_occupancy_current);
            New_household_registered_Update_TextBox.Text = Convert.ToString(Client_Shelter.New_household_registered);
            New_Shelter_address_Update_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_address);
            New_Shelter_city_Update_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_city);
            New_Shelter_State_Update_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_State);
            New_Shelter_Zip_Update_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_Zip);
            New_Contact_Number_Update_TextBox.Text = Convert.ToString(Client_Shelter.New_Contact_Number);
            Current_household_members_safe_Update_TextBox.Text = Convert.ToString(Client_Shelter.Current_household_members_safe);
            CheckIn_Date_Update_TextBox.Text = Convert.ToString(Client_Shelter.CheckIn_Date);
            CheckOut_Date_Update_TextBox.Text = Convert.ToString(Client_Shelter.CheckOut_Date);
            return Client_Shelter;
        }
        public Client_Shelter Client_Shelter_selectForDelete(int ID)
        {
            Client_Shelter = Client_Shelter.Select(ID);
            Client_Shelter_ID_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Client_Shelter_ID);
            Shelter_ID_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_ID);
            Client_ID_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Client_ID);
            Current_address_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Current_address);
            Current_State_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Current_State);
            Current_City_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Current_City);
            Current_Zip_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Current_Zip);
            Client_registration_status_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Client_registration_status);
            Household_size_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Household_size);
            Shelter_supplies_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_supplies);
            Shelter_occupancy_current_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Shelter_occupancy_current);
            New_household_registered_Delete_TextBox.Text = Convert.ToString(Client_Shelter.New_household_registered);
            New_Shelter_address_Delete_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_address);
            New_Shelter_city_Delete_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_city);
            New_Shelter_State_Delete_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_State);
            New_Shelter_Zip_Delete_TextBox.Text = Convert.ToString(Client_Shelter.New_Shelter_Zip);
            New_Contact_Number_Delete_TextBox.Text = Convert.ToString(Client_Shelter.New_Contact_Number);
            Current_household_members_safe_Delete_TextBox.Text = Convert.ToString(Client_Shelter.Current_household_members_safe);
            CheckIn_Date_Delete_TextBox.Text = Convert.ToString(Client_Shelter.CheckIn_Date);
            CheckOut_Date_Delete_TextBox.Text = Convert.ToString(Client_Shelter.CheckOut_Date);
            return Client_Shelter;
        }
        //Database CRUD Call Functions
        public Client_Shelter Client_Shelter_insert()
        {
            Client_Shelter.Shelter_ID = Convert.ToInt32(Shelter_ID_Insert_TextBox.Text);
            Client_Shelter.Client_ID = Convert.ToInt32(Client_ID_Insert_TextBox.Text);
            Client_Shelter.Current_address = Current_address_Insert_TextBox.Text;
            Client_Shelter.Current_State = Current_State_Insert_TextBox.Text;
            Client_Shelter.Current_City = Current_City_Insert_TextBox.Text;
            Client_Shelter.Current_Zip = Convert.ToInt32(Current_Zip_Insert_TextBox.Text);
            Client_Shelter.Client_registration_status = Client_registration_status_Insert_TextBox.Text;
            Client_Shelter.Household_size = Convert.ToInt32(Household_size_Insert_TextBox.Text);
            Client_Shelter.Shelter_supplies = Shelter_supplies_Insert_TextBox.Text;
            Client_Shelter.Shelter_occupancy_current = Shelter_occupancy_current_Insert_TextBox.Text;
            Client_Shelter.New_household_registered = New_household_registered_Insert_TextBox.Text;
            Client_Shelter.New_Shelter_address = New_Shelter_address_Insert_TextBox.Text;
            Client_Shelter.New_Shelter_city = New_Shelter_city_Insert_TextBox.Text;
            Client_Shelter.New_Shelter_State = New_Shelter_State_Insert_TextBox.Text;
            Client_Shelter.New_Shelter_Zip = Convert.ToInt32(New_Shelter_Zip_Insert_TextBox.Text);
            Client_Shelter.New_Contact_Number = Convert.ToInt32(New_Contact_Number_Insert_TextBox.Text);
            Client_Shelter.Current_household_members_safe = Current_household_members_safe_Insert_TextBox.Text;
            Client_Shelter.CheckIn_Date = Convert.ToDateTime(CheckIn_Date_Insert_TextBox.Text);
            Client_Shelter.CheckOut_Date = Convert.ToDateTime(CheckOut_Date_Insert_TextBox.Text);
            Client_Shelter = Client_Shelter.Insert(Client_Shelter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Client_Shelter;
        }
        public Client_Shelter Client_Shelter_update(int ID)
        {
            Client_Shelter = Client_Shelter.Select(ID);
            Client_Shelter.Client_Shelter_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Client_Shelter.Shelter_ID = Convert.ToInt32(Shelter_ID_Update_TextBox.Text);
            Client_Shelter.Client_ID = Convert.ToInt32(Client_ID_Update_TextBox.Text);
            Client_Shelter.Current_address = Current_address_Update_TextBox.Text;
            Client_Shelter.Current_State = Current_State_Update_TextBox.Text;
            Client_Shelter.Current_City = Current_City_Update_TextBox.Text;
            Client_Shelter.Current_Zip = Convert.ToInt32(Current_Zip_Update_TextBox.Text);
            Client_Shelter.Client_registration_status = Client_registration_status_Update_TextBox.Text;
            Client_Shelter.Household_size = Convert.ToInt32(Household_size_Update_TextBox.Text);
            Client_Shelter.Shelter_supplies = Shelter_supplies_Update_TextBox.Text;
            Client_Shelter.Shelter_occupancy_current = Shelter_occupancy_current_Update_TextBox.Text;
            Client_Shelter.New_household_registered = New_household_registered_Update_TextBox.Text;
            Client_Shelter.New_Shelter_address = New_Shelter_address_Update_TextBox.Text;
            Client_Shelter.New_Shelter_city = New_Shelter_city_Update_TextBox.Text;
            Client_Shelter.New_Shelter_State = New_Shelter_State_Update_TextBox.Text;
            Client_Shelter.New_Shelter_Zip = Convert.ToInt32(New_Shelter_Zip_Update_TextBox.Text);
            Client_Shelter.New_Contact_Number = Convert.ToInt32(New_Contact_Number_Update_TextBox.Text);
            Client_Shelter.Current_household_members_safe = Current_household_members_safe_Update_TextBox.Text;
            Client_Shelter.CheckIn_Date = Convert.ToDateTime(CheckIn_Date_Update_TextBox.Text);
            Client_Shelter.CheckOut_Date = Convert.ToDateTime(CheckOut_Date_Update_TextBox.Text);
            Client_Shelter.Update(Client_Shelter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Client_Shelter;
        }
        public void Client_Shelter_delete(int ID)
        {
            Client_Shelter.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Client_Shelter = Client_Shelter_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Client_Shelter = Client_Shelter_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Client_Shelter_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

