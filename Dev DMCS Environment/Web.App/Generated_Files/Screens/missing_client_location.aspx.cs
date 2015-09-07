using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class missing_client_locationClass : System.Web.UI.Page
    {
        public missing_client_location missing_client_location = new missing_client_location();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            missing_client_location = missing_client_location_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            missing_client_location = missing_client_location_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            missing_client_location = missing_client_location_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public missing_client_location missing_client_location_selectForInsert(int ID)
        {
            missing_client_location = missing_client_location.Select(ID);
            missing_client_id_Insert_TextBox.Text = Convert.ToString(missing_client_location.missing_client_id);
            reporting_client_id_Insert_TextBox.Text = Convert.ToString(missing_client_location.reporting_client_id);
            location_id_Insert_TextBox.Text = Convert.ToString(missing_client_location.location_id);
            datetime_reported_Insert_TextBox.Text = Convert.ToString(missing_client_location.datetime_reported);
            return missing_client_location;
        }
        public missing_client_location missing_client_location_selectForUpdate(int ID)
        {
            missing_client_location = missing_client_location.Select(ID);
            missing_client_location_id_Update_TextBox.Text = Convert.ToString(missing_client_location.missing_client_location_id);
            missing_client_id_Update_TextBox.Text = Convert.ToString(missing_client_location.missing_client_id);
            reporting_client_id_Update_TextBox.Text = Convert.ToString(missing_client_location.reporting_client_id);
            location_id_Update_TextBox.Text = Convert.ToString(missing_client_location.location_id);
            datetime_reported_Update_TextBox.Text = Convert.ToString(missing_client_location.datetime_reported);
            return missing_client_location;
        }
        public missing_client_location missing_client_location_selectForDelete(int ID)
        {
            missing_client_location = missing_client_location.Select(ID);
            missing_client_location_id_Delete_TextBox.Text = Convert.ToString(missing_client_location.missing_client_location_id);
            missing_client_id_Delete_TextBox.Text = Convert.ToString(missing_client_location.missing_client_id);
            reporting_client_id_Delete_TextBox.Text = Convert.ToString(missing_client_location.reporting_client_id);
            location_id_Delete_TextBox.Text = Convert.ToString(missing_client_location.location_id);
            datetime_reported_Delete_TextBox.Text = Convert.ToString(missing_client_location.datetime_reported);
            return missing_client_location;
        }
        //Database CRUD Call Functions
        public missing_client_location missing_client_location_insert()
        {
            missing_client_location.missing_client_id = Convert.ToInt32(missing_client_id_Insert_TextBox.Text);
            missing_client_location.reporting_client_id = Convert.ToInt32(reporting_client_id_Insert_TextBox.Text);
            missing_client_location.location_id = Convert.ToInt32(location_id_Insert_TextBox.Text);
            missing_client_location.datetime_reported = Convert.ToDateTime(datetime_reported_Insert_TextBox.Text);
            missing_client_location = missing_client_location.Insert(missing_client_location);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return missing_client_location;
        }
        public missing_client_location missing_client_location_update(int ID)
        {
            missing_client_location = missing_client_location.Select(ID);
            missing_client_location.missing_client_location_id = Convert.ToInt32(Update_GridView.SelectedValue);
            missing_client_location.missing_client_id = Convert.ToInt32(missing_client_id_Update_TextBox.Text);
            missing_client_location.reporting_client_id = Convert.ToInt32(reporting_client_id_Update_TextBox.Text);
            missing_client_location.location_id = Convert.ToInt32(location_id_Update_TextBox.Text);
            missing_client_location.datetime_reported = Convert.ToDateTime(datetime_reported_Update_TextBox.Text);
            missing_client_location.Update(missing_client_location);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return missing_client_location;
        }
        public void missing_client_location_delete(int ID)
        {
            missing_client_location.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            missing_client_location = missing_client_location_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            missing_client_location = missing_client_location_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            missing_client_location_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

