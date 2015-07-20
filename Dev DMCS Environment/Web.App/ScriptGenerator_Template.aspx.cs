using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.App
{
    public partial class ScriptGenerator_Template : System.Web.UI.Page
    {
        public address address = new address();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        //GridView Functions
        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            address = address_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            address = address_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            address = address_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }

        //Create Object Functions
        public address address_selectForInsert(int ID)
        {
            address = address.Select(ID);
            address_type_id_Insert_TextBox.Text = Convert.ToString(address.address_type_id);
            city_Insert_TextBox.Text = Convert.ToString(address.city);
            country_Insert_TextBox.Text = Convert.ToString(address.country);
            County_Township_Insert_TextBox.Text = Convert.ToString(address.County_Township);
            longitude_Insert_TextBox.Text = Convert.ToString(address.longitude);
            latitude_Insert_TextBox.Text = Convert.ToString(address.latitude);
            state_Insert_TextBox.Text = Convert.ToString(address.state);
            str_add_Insert_TextBox.Text = Convert.ToString(address.str_add);
            str_add2_Insert_TextBox.Text = Convert.ToString(address.str_add2);
            zip_plus_four_Insert_TextBox.Text = Convert.ToString(address.zip_plus_four);
            return address;
        }
        public address address_selectForUpdate(int ID)
        {
            address = address.Select(ID);
            address_id_Update_TextBox.Text = Convert.ToString(address.address_id);
            address_type_id_Update_TextBox.Text = Convert.ToString(address.address_type_id);
            address_type_id_Update_TextBox.Text = Convert.ToString(address.address_type_id);
            city_Update_TextBox.Text = Convert.ToString(address.city);
            country_Update_TextBox.Text = Convert.ToString(address.country);
            County_Township_Update_TextBox.Text = Convert.ToString(address.County_Township);
            longitude_Update_TextBox.Text = Convert.ToString(address.longitude);
            latitude_Update_TextBox.Text = Convert.ToString(address.latitude);
            state_Update_TextBox.Text = Convert.ToString(address.state);
            str_add_Update_TextBox.Text = Convert.ToString(address.str_add);
            str_add2_Update_TextBox.Text = Convert.ToString(address.str_add2);
            zip_plus_four_Update_TextBox.Text = Convert.ToString(address.zip_plus_four);
            return address;
        }
        public address address_selectForDelete(int ID)
        {
            address = address.Select(ID);
            address_id_Delete_TextBox.Text = Convert.ToString(address.address_id);
            address_type_id_Delete_TextBox.Text = Convert.ToString(address.address_type_id);
            address_type_id_Delete_TextBox.Text = Convert.ToString(address.address_type_id);
            city_Delete_TextBox.Text = Convert.ToString(address.city);
            country_Delete_TextBox.Text = Convert.ToString(address.country);
            County_Township_Delete_TextBox.Text = Convert.ToString(address.County_Township);
            longitude_Delete_TextBox.Text = Convert.ToString(address.longitude);
            latitude_Delete_TextBox.Text = Convert.ToString(address.latitude);
            state_Delete_TextBox.Text = Convert.ToString(address.state);
            str_add_Delete_TextBox.Text = Convert.ToString(address.str_add);
            str_add2_Delete_TextBox.Text = Convert.ToString(address.str_add2);
            zip_plus_four_Delete_TextBox.Text = Convert.ToString(address.zip_plus_four);
            return address;
        }

        //Database CRUD Call Functions
        public address address_insert()
        {
            address.address_type_id = Convert.ToInt32(address_type_id_Insert_TextBox.Text);
            address.city = city_Insert_TextBox.Text;
            address.country = country_Insert_TextBox.Text;
            address.County_Township = County_Township_Insert_TextBox.Text;
            address.longitude = Convert.ToDecimal(longitude_Insert_TextBox.Text);
            address.latitude = Convert.ToDecimal(latitude_Insert_TextBox.Text);
            address.state = state_Insert_TextBox.Text;
            address.str_add = str_add_Insert_TextBox.Text;
            address.str_add2 = str_add2_Insert_TextBox.Text;
            address.zip_plus_four = zip_plus_four_Insert_TextBox.Text;
            address = address.Insert(address);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return address;
        }
        public address address_update(int ID)
        {
            address = address.Select(ID);
            address.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            address.address_type_id = Convert.ToInt32(address_type_id_Update_TextBox.Text);
            address.city = city_Update_TextBox.Text;
            address.country = country_Update_TextBox.Text;
            address.County_Township = County_Township_Update_TextBox.Text;
            address.longitude = Convert.ToDecimal(longitude_Update_TextBox.Text);
            address.latitude = Convert.ToDecimal(latitude_Update_TextBox.Text);
            address.state = state_Update_TextBox.Text;
            address.str_add = str_add_Update_TextBox.Text;
            address.str_add2 = str_add2_Update_TextBox.Text;
            address.zip_plus_four = zip_plus_four_Update_TextBox.Text;
            address.Update(address);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return address;
        }
        public void address_delete(int ID)
        {
            address.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            address = address_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            address = address_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            address_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        

    }
}