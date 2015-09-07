using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class resourceClass : System.Web.UI.Page
    {
        public resource resource = new resource();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            resource = resource_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            resource = resource_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            resource = resource_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public resource resource_selectForInsert(int ID)
        {
            resource = resource.Select(ID);
            Location_ID_Insert_TextBox.Text = Convert.ToString(resource.Location_ID);
            Resource_Type_Insert_TextBox.Text = Convert.ToString(resource.Resource_Type);
            Date_Requested_Insert_TextBox.Text = Convert.ToString(resource.Date_Requested);
            return resource;
        }
        public resource resource_selectForUpdate(int ID)
        {
            resource = resource.Select(ID);
            Resource_ID_Update_TextBox.Text = Convert.ToString(resource.Resource_ID);
            Location_ID_Update_TextBox.Text = Convert.ToString(resource.Location_ID);
            Resource_Type_Update_TextBox.Text = Convert.ToString(resource.Resource_Type);
            Date_Requested_Update_TextBox.Text = Convert.ToString(resource.Date_Requested);
            return resource;
        }
        public resource resource_selectForDelete(int ID)
        {
            resource = resource.Select(ID);
            Resource_ID_Delete_TextBox.Text = Convert.ToString(resource.Resource_ID);
            Location_ID_Delete_TextBox.Text = Convert.ToString(resource.Location_ID);
            Resource_Type_Delete_TextBox.Text = Convert.ToString(resource.Resource_Type);
            Date_Requested_Delete_TextBox.Text = Convert.ToString(resource.Date_Requested);
            return resource;
        }
        //Database CRUD Call Functions
        public resource resource_insert()
        {
            resource.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            resource.Resource_Type = Resource_Type_Insert_TextBox.Text;
            resource.Date_Requested = Convert.ToDateTime(Date_Requested_Insert_TextBox.Text);
            resource = resource.Insert(resource);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return resource;
        }
        public resource resource_update(int ID)
        {
            resource = resource.Select(ID);
            resource.Resource_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            resource.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            resource.Resource_Type = Resource_Type_Update_TextBox.Text;
            resource.Date_Requested = Convert.ToDateTime(Date_Requested_Update_TextBox.Text);
            resource.Update(resource);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return resource;
        }
        public void resource_delete(int ID)
        {
            resource.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            resource = resource_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            resource = resource_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            resource_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

