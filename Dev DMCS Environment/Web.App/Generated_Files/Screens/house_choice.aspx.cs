using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class house_choiceClass : System.Web.UI.Page
    {
        public house_choice house_choice = new house_choice();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            house_choice = house_choice_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            house_choice = house_choice_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            house_choice = house_choice_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public house_choice house_choice_selectForInsert(int ID)
        {
            house_choice = house_choice.Select(ID);
            house_id_Insert_TextBox.Text = Convert.ToString(house_choice.house_id);
            address_id_Insert_TextBox.Text = Convert.ToString(house_choice.address_id);
            house_choice_bathrooms_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_bathrooms);
            house_choice_comments_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_comments);
            house_choice_contact_person_id_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_contact_person_id);
            house_choice_laundry_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_laundry);
            house_choice_no_floors_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_no_floors);
            house_choice_parking_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_parking);
            house_choice_rent_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_rent);
            house_choice_type_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_type);
            house_choice_units_avail_Insert_TextBox.Text = Convert.ToString(house_choice.house_choice_units_avail);
            return house_choice;
        }
        public house_choice house_choice_selectForUpdate(int ID)
        {
            house_choice = house_choice.Select(ID);
            house_choice_id_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_id);
            house_id_Update_TextBox.Text = Convert.ToString(house_choice.house_id);
            address_id_Update_TextBox.Text = Convert.ToString(house_choice.address_id);
            house_choice_bathrooms_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_bathrooms);
            house_choice_comments_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_comments);
            house_choice_contact_person_id_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_contact_person_id);
            house_choice_laundry_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_laundry);
            house_choice_no_floors_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_no_floors);
            house_choice_parking_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_parking);
            house_choice_rent_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_rent);
            house_choice_type_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_type);
            house_choice_units_avail_Update_TextBox.Text = Convert.ToString(house_choice.house_choice_units_avail);
            return house_choice;
        }
        public house_choice house_choice_selectForDelete(int ID)
        {
            house_choice = house_choice.Select(ID);
            house_choice_id_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_id);
            house_id_Delete_TextBox.Text = Convert.ToString(house_choice.house_id);
            address_id_Delete_TextBox.Text = Convert.ToString(house_choice.address_id);
            house_choice_bathrooms_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_bathrooms);
            house_choice_comments_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_comments);
            house_choice_contact_person_id_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_contact_person_id);
            house_choice_laundry_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_laundry);
            house_choice_no_floors_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_no_floors);
            house_choice_parking_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_parking);
            house_choice_rent_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_rent);
            house_choice_type_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_type);
            house_choice_units_avail_Delete_TextBox.Text = Convert.ToString(house_choice.house_choice_units_avail);
            return house_choice;
        }
        //Database CRUD Call Functions
        public house_choice house_choice_insert()
        {
            house_choice.house_id = Convert.ToInt32(house_id_Insert_TextBox.Text);
            house_choice.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            house_choice.house_choice_bathrooms = Convert.ToInt32(house_choice_bathrooms_Insert_TextBox.Text);
            house_choice.house_choice_comments = house_choice_comments_Insert_TextBox.Text;
            house_choice.house_choice_contact_person_id = Convert.ToInt32(house_choice_contact_person_id_Insert_TextBox.Text);
            house_choice.house_choice_laundry = house_choice_laundry_Insert_TextBox.Text;
            house_choice.house_choice_no_floors = Convert.ToInt32(house_choice_no_floors_Insert_TextBox.Text);
            house_choice.house_choice_parking = house_choice_parking_Insert_TextBox.Text;
            house_choice.house_choice_rent = Convert.ToDecimal(house_choice_rent_Insert_TextBox.Text);
            house_choice.house_choice_type = house_choice_type_Insert_TextBox.Text;
            house_choice.house_choice_units_avail = Convert.ToInt32(house_choice_units_avail_Insert_TextBox.Text);
            house_choice = house_choice.Insert(house_choice);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return house_choice;
        }
        public house_choice house_choice_update(int ID)
        {
            house_choice = house_choice.Select(ID);
            house_choice.house_choice_id = Convert.ToInt32(Update_GridView.SelectedValue);
            house_choice.house_id = Convert.ToInt32(house_id_Update_TextBox.Text);
            house_choice.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            house_choice.house_choice_bathrooms = Convert.ToInt32(house_choice_bathrooms_Update_TextBox.Text);
            house_choice.house_choice_comments = house_choice_comments_Update_TextBox.Text;
            house_choice.house_choice_contact_person_id = Convert.ToInt32(house_choice_contact_person_id_Update_TextBox.Text);
            house_choice.house_choice_laundry = house_choice_laundry_Update_TextBox.Text;
            house_choice.house_choice_no_floors = Convert.ToInt32(house_choice_no_floors_Update_TextBox.Text);
            house_choice.house_choice_parking = house_choice_parking_Update_TextBox.Text;
            house_choice.house_choice_rent = Convert.ToDecimal(house_choice_rent_Update_TextBox.Text);
            house_choice.house_choice_type = house_choice_type_Update_TextBox.Text;
            house_choice.house_choice_units_avail = Convert.ToInt32(house_choice_units_avail_Update_TextBox.Text);
            house_choice.Update(house_choice);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return house_choice;
        }
        public void house_choice_delete(int ID)
        {
            house_choice.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            house_choice = house_choice_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            house_choice = house_choice_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            house_choice_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

