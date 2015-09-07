using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class RoleProfileFieldsClass : System.Web.UI.Page
    {
        public RoleProfileFields RoleProfileFields = new RoleProfileFields();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            RoleProfileFields = RoleProfileFields_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            RoleProfileFields = RoleProfileFields_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            RoleProfileFields = RoleProfileFields_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public RoleProfileFields RoleProfileFields_selectForInsert(int ID)
        {
            RoleProfileFields = RoleProfileFields.Select(ID);
            RoleID_Insert_TextBox.Text = Convert.ToString(RoleProfileFields.RoleID);
            ProfileFieldID_Insert_TextBox.Text = Convert.ToString(RoleProfileFields.ProfileFieldID);
            return RoleProfileFields;
        }
        public RoleProfileFields RoleProfileFields_selectForUpdate(int ID)
        {
            RoleProfileFields = RoleProfileFields.Select(ID);
            RoleFieldID_Update_TextBox.Text = Convert.ToString(RoleProfileFields.RoleFieldID);
            RoleID_Update_TextBox.Text = Convert.ToString(RoleProfileFields.RoleID);
            ProfileFieldID_Update_TextBox.Text = Convert.ToString(RoleProfileFields.ProfileFieldID);
            return RoleProfileFields;
        }
        public RoleProfileFields RoleProfileFields_selectForDelete(int ID)
        {
            RoleProfileFields = RoleProfileFields.Select(ID);
            RoleFieldID_Delete_TextBox.Text = Convert.ToString(RoleProfileFields.RoleFieldID);
            RoleID_Delete_TextBox.Text = Convert.ToString(RoleProfileFields.RoleID);
            ProfileFieldID_Delete_TextBox.Text = Convert.ToString(RoleProfileFields.ProfileFieldID);
            return RoleProfileFields;
        }
        //Database CRUD Call Functions
        public RoleProfileFields RoleProfileFields_insert()
        {
            RoleProfileFields.ProfileFieldID = Convert.ToInt32(ProfileFieldID_Insert_TextBox.Text);
            RoleProfileFields = RoleProfileFields.Insert(RoleProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return RoleProfileFields;
        }
        public RoleProfileFields RoleProfileFields_update(int ID)
        {
            RoleProfileFields = RoleProfileFields.Select(ID);
            RoleProfileFields.RoleFieldID = Convert.ToInt32(Update_GridView.SelectedValue);
            RoleProfileFields.ProfileFieldID = Convert.ToInt32(ProfileFieldID_Update_TextBox.Text);
            RoleProfileFields.Update(RoleProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return RoleProfileFields;
        }
        public void RoleProfileFields_delete(int ID)
        {
            RoleProfileFields.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            RoleProfileFields = RoleProfileFields_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            RoleProfileFields = RoleProfileFields_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            RoleProfileFields_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

