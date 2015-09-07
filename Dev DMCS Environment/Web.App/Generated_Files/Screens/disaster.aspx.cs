using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class disasterClass : System.Web.UI.Page
    {
        public disaster disaster = new disaster();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            disaster = disaster_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            disaster = disaster_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            disaster = disaster_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public disaster disaster_selectForInsert(int ID)
        {
            disaster = disaster.Select(ID);
            disaster_name_Insert_TextBox.Text = Convert.ToString(disaster.disaster_name);
            disaster_type_Insert_TextBox.Text = Convert.ToString(disaster.disaster_type);
            disaster_start_date_Insert_TextBox.Text = Convert.ToString(disaster.disaster_start_date);
            disaster_end_date_Insert_TextBox.Text = Convert.ToString(disaster.disaster_end_date);
            disaster_north_latitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_north_latitude);
            disaster_north_longitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_north_longitude);
            disaster_south_latitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_south_latitude);
            disaster_south_longitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_south_longitude);
            disaster_east_latitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_east_latitude);
            disaster_east_longitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_east_longitude);
            disaster_west_latitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_west_latitude);
            disaster_west_longitude_Insert_TextBox.Text = Convert.ToString(disaster.disaster_west_longitude);
            return disaster;
        }
        public disaster disaster_selectForUpdate(int ID)
        {
            disaster = disaster.Select(ID);
            disaster_id_Update_TextBox.Text = Convert.ToString(disaster.disaster_id);
            disaster_name_Update_TextBox.Text = Convert.ToString(disaster.disaster_name);
            disaster_type_Update_TextBox.Text = Convert.ToString(disaster.disaster_type);
            disaster_start_date_Update_TextBox.Text = Convert.ToString(disaster.disaster_start_date);
            disaster_end_date_Update_TextBox.Text = Convert.ToString(disaster.disaster_end_date);
            disaster_north_latitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_north_latitude);
            disaster_north_longitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_north_longitude);
            disaster_south_latitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_south_latitude);
            disaster_south_longitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_south_longitude);
            disaster_east_latitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_east_latitude);
            disaster_east_longitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_east_longitude);
            disaster_west_latitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_west_latitude);
            disaster_west_longitude_Update_TextBox.Text = Convert.ToString(disaster.disaster_west_longitude);
            return disaster;
        }
        public disaster disaster_selectForDelete(int ID)
        {
            disaster = disaster.Select(ID);
            disaster_id_Delete_TextBox.Text = Convert.ToString(disaster.disaster_id);
            disaster_name_Delete_TextBox.Text = Convert.ToString(disaster.disaster_name);
            disaster_type_Delete_TextBox.Text = Convert.ToString(disaster.disaster_type);
            disaster_start_date_Delete_TextBox.Text = Convert.ToString(disaster.disaster_start_date);
            disaster_end_date_Delete_TextBox.Text = Convert.ToString(disaster.disaster_end_date);
            disaster_north_latitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_north_latitude);
            disaster_north_longitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_north_longitude);
            disaster_south_latitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_south_latitude);
            disaster_south_longitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_south_longitude);
            disaster_east_latitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_east_latitude);
            disaster_east_longitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_east_longitude);
            disaster_west_latitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_west_latitude);
            disaster_west_longitude_Delete_TextBox.Text = Convert.ToString(disaster.disaster_west_longitude);
            return disaster;
        }
        //Database CRUD Call Functions
        public disaster disaster_insert()
        {
            disaster.disaster_name = disaster_name_Insert_TextBox.Text;
            disaster.disaster_type = disaster_type_Insert_TextBox.Text;
            disaster.disaster_start_date = Convert.ToDateTime(disaster_start_date_Insert_TextBox.Text);
            disaster.disaster_end_date = Convert.ToDateTime(disaster_end_date_Insert_TextBox.Text);
            disaster.disaster_north_latitude = Convert.ToDecimal(disaster_north_latitude_Insert_TextBox.Text);
            disaster.disaster_north_longitude = Convert.ToDecimal(disaster_north_longitude_Insert_TextBox.Text);
            disaster.disaster_south_latitude = Convert.ToDecimal(disaster_south_latitude_Insert_TextBox.Text);
            disaster.disaster_south_longitude = Convert.ToDecimal(disaster_south_longitude_Insert_TextBox.Text);
            disaster.disaster_east_latitude = Convert.ToDecimal(disaster_east_latitude_Insert_TextBox.Text);
            disaster.disaster_east_longitude = Convert.ToDecimal(disaster_east_longitude_Insert_TextBox.Text);
            disaster.disaster_west_latitude = Convert.ToDecimal(disaster_west_latitude_Insert_TextBox.Text);
            disaster.disaster_west_longitude = Convert.ToDecimal(disaster_west_longitude_Insert_TextBox.Text);
            disaster = disaster.Insert(disaster);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return disaster;
        }
        public disaster disaster_update(int ID)
        {
            disaster = disaster.Select(ID);
            disaster.disaster_id = Convert.ToInt32(Update_GridView.SelectedValue);
            disaster.disaster_name = disaster_name_Update_TextBox.Text;
            disaster.disaster_type = disaster_type_Update_TextBox.Text;
            disaster.disaster_start_date = Convert.ToDateTime(disaster_start_date_Update_TextBox.Text);
            disaster.disaster_end_date = Convert.ToDateTime(disaster_end_date_Update_TextBox.Text);
            disaster.disaster_north_latitude = Convert.ToDecimal(disaster_north_latitude_Update_TextBox.Text);
            disaster.disaster_north_longitude = Convert.ToDecimal(disaster_north_longitude_Update_TextBox.Text);
            disaster.disaster_south_latitude = Convert.ToDecimal(disaster_south_latitude_Update_TextBox.Text);
            disaster.disaster_south_longitude = Convert.ToDecimal(disaster_south_longitude_Update_TextBox.Text);
            disaster.disaster_east_latitude = Convert.ToDecimal(disaster_east_latitude_Update_TextBox.Text);
            disaster.disaster_east_longitude = Convert.ToDecimal(disaster_east_longitude_Update_TextBox.Text);
            disaster.disaster_west_latitude = Convert.ToDecimal(disaster_west_latitude_Update_TextBox.Text);
            disaster.disaster_west_longitude = Convert.ToDecimal(disaster_west_longitude_Update_TextBox.Text);
            disaster.Update(disaster);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return disaster;
        }
        public void disaster_delete(int ID)
        {
            disaster.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            disaster = disaster_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            disaster = disaster_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            disaster_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

