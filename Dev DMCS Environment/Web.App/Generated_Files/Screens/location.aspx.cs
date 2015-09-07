using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class locationClass : System.Web.UI.Page
    {
        public location location = new location();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            location = location_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            location = location_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            location = location_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public location location_selectForInsert(int ID)
        {
            location = location.Select(ID);
            type_Insert_TextBox.Text = Convert.ToString(location.type);
            city_Insert_TextBox.Text = Convert.ToString(location.city);
            state_Insert_TextBox.Text = Convert.ToString(location.state);
            zip_Insert_TextBox.Text = Convert.ToString(location.zip);
            county_Insert_TextBox.Text = Convert.ToString(location.county);
            location_desc_Insert_TextBox.Text = Convert.ToString(location.location_desc);
            n_long_Insert_TextBox.Text = Convert.ToString(location.n_long);
            s_long_Insert_TextBox.Text = Convert.ToString(location.s_long);
            e_long_Insert_TextBox.Text = Convert.ToString(location.e_long);
            w_long_Insert_TextBox.Text = Convert.ToString(location.w_long);
            n_lat_Insert_TextBox.Text = Convert.ToString(location.n_lat);
            s_lat_Insert_TextBox.Text = Convert.ToString(location.s_lat);
            e_lat_Insert_TextBox.Text = Convert.ToString(location.e_lat);
            w_lat_Insert_TextBox.Text = Convert.ToString(location.w_lat);
            return location;
        }
        public location location_selectForUpdate(int ID)
        {
            location = location.Select(ID);
            Location_ID_Update_TextBox.Text = Convert.ToString(location.Location_ID);
            type_Update_TextBox.Text = Convert.ToString(location.type);
            city_Update_TextBox.Text = Convert.ToString(location.city);
            state_Update_TextBox.Text = Convert.ToString(location.state);
            zip_Update_TextBox.Text = Convert.ToString(location.zip);
            county_Update_TextBox.Text = Convert.ToString(location.county);
            location_desc_Update_TextBox.Text = Convert.ToString(location.location_desc);
            n_long_Update_TextBox.Text = Convert.ToString(location.n_long);
            s_long_Update_TextBox.Text = Convert.ToString(location.s_long);
            e_long_Update_TextBox.Text = Convert.ToString(location.e_long);
            w_long_Update_TextBox.Text = Convert.ToString(location.w_long);
            n_lat_Update_TextBox.Text = Convert.ToString(location.n_lat);
            s_lat_Update_TextBox.Text = Convert.ToString(location.s_lat);
            e_lat_Update_TextBox.Text = Convert.ToString(location.e_lat);
            w_lat_Update_TextBox.Text = Convert.ToString(location.w_lat);
            return location;
        }
        public location location_selectForDelete(int ID)
        {
            location = location.Select(ID);
            Location_ID_Delete_TextBox.Text = Convert.ToString(location.Location_ID);
            type_Delete_TextBox.Text = Convert.ToString(location.type);
            city_Delete_TextBox.Text = Convert.ToString(location.city);
            state_Delete_TextBox.Text = Convert.ToString(location.state);
            zip_Delete_TextBox.Text = Convert.ToString(location.zip);
            county_Delete_TextBox.Text = Convert.ToString(location.county);
            location_desc_Delete_TextBox.Text = Convert.ToString(location.location_desc);
            n_long_Delete_TextBox.Text = Convert.ToString(location.n_long);
            s_long_Delete_TextBox.Text = Convert.ToString(location.s_long);
            e_long_Delete_TextBox.Text = Convert.ToString(location.e_long);
            w_long_Delete_TextBox.Text = Convert.ToString(location.w_long);
            n_lat_Delete_TextBox.Text = Convert.ToString(location.n_lat);
            s_lat_Delete_TextBox.Text = Convert.ToString(location.s_lat);
            e_lat_Delete_TextBox.Text = Convert.ToString(location.e_lat);
            w_lat_Delete_TextBox.Text = Convert.ToString(location.w_lat);
            return location;
        }
        //Database CRUD Call Functions
        public location location_insert()
        {
            location.type = type_Insert_TextBox.Text;
            location.city = city_Insert_TextBox.Text;
            location.state = state_Insert_TextBox.Text;
            location.zip = Convert.ToInt32(zip_Insert_TextBox.Text);
            location.county = county_Insert_TextBox.Text;
            location.location_desc = location_desc_Insert_TextBox.Text;
            location.n_long = Convert.ToDecimal(n_long_Insert_TextBox.Text);
            location.s_long = Convert.ToDecimal(s_long_Insert_TextBox.Text);
            location.e_long = Convert.ToDecimal(e_long_Insert_TextBox.Text);
            location.w_long = Convert.ToDecimal(w_long_Insert_TextBox.Text);
            location.n_lat = Convert.ToDecimal(n_lat_Insert_TextBox.Text);
            location.s_lat = Convert.ToDecimal(s_lat_Insert_TextBox.Text);
            location.e_lat = Convert.ToDecimal(e_lat_Insert_TextBox.Text);
            location.w_lat = Convert.ToDecimal(w_lat_Insert_TextBox.Text);
            location = location.Insert(location);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return location;
        }
        public location location_update(int ID)
        {
            location = location.Select(ID);
            location.Location_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            location.type = type_Update_TextBox.Text;
            location.city = city_Update_TextBox.Text;
            location.state = state_Update_TextBox.Text;
            location.zip = Convert.ToInt32(zip_Update_TextBox.Text);
            location.county = county_Update_TextBox.Text;
            location.location_desc = location_desc_Update_TextBox.Text;
            location.n_long = Convert.ToDecimal(n_long_Update_TextBox.Text);
            location.s_long = Convert.ToDecimal(s_long_Update_TextBox.Text);
            location.e_long = Convert.ToDecimal(e_long_Update_TextBox.Text);
            location.w_long = Convert.ToDecimal(w_long_Update_TextBox.Text);
            location.n_lat = Convert.ToDecimal(n_lat_Update_TextBox.Text);
            location.s_lat = Convert.ToDecimal(s_lat_Update_TextBox.Text);
            location.e_lat = Convert.ToDecimal(e_lat_Update_TextBox.Text);
            location.w_lat = Convert.ToDecimal(w_lat_Update_TextBox.Text);
            location.Update(location);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return location;
        }
        public void location_delete(int ID)
        {
            location.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            location = location_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            location = location_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            location_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

