using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ProfileFieldGroupsClass : System.Web.UI.Page
    {
        public ProfileFieldGroups ProfileFieldGroups = new ProfileFieldGroups();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFieldGroups = ProfileFieldGroups_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFieldGroups = ProfileFieldGroups_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFieldGroups = ProfileFieldGroups_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public ProfileFieldGroups ProfileFieldGroups_selectForInsert(int ID)
        {
            ProfileFieldGroups = ProfileFieldGroups.Select(ID);
            FieldGroupName_Insert_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupName);
            FieldGroupDescription_Insert_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupDescription);
            OrderID_Insert_TextBox.Text = Convert.ToString(ProfileFieldGroups.OrderID);
            IsActive_Insert_TextBox.Text = Convert.ToString(ProfileFieldGroups.IsActive);
            AdminUseOnly_Insert_TextBox.Text = Convert.ToString(ProfileFieldGroups.AdminUseOnly);
            return ProfileFieldGroups;
        }
        public ProfileFieldGroups ProfileFieldGroups_selectForUpdate(int ID)
        {
            ProfileFieldGroups = ProfileFieldGroups.Select(ID);
            FieldGroupID_Update_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupID);
            FieldGroupName_Update_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupName);
            FieldGroupDescription_Update_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupDescription);
            OrderID_Update_TextBox.Text = Convert.ToString(ProfileFieldGroups.OrderID);
            IsActive_Update_TextBox.Text = Convert.ToString(ProfileFieldGroups.IsActive);
            AdminUseOnly_Update_TextBox.Text = Convert.ToString(ProfileFieldGroups.AdminUseOnly);
            return ProfileFieldGroups;
        }
        public ProfileFieldGroups ProfileFieldGroups_selectForDelete(int ID)
        {
            ProfileFieldGroups = ProfileFieldGroups.Select(ID);
            FieldGroupID_Delete_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupID);
            FieldGroupName_Delete_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupName);
            FieldGroupDescription_Delete_TextBox.Text = Convert.ToString(ProfileFieldGroups.FieldGroupDescription);
            OrderID_Delete_TextBox.Text = Convert.ToString(ProfileFieldGroups.OrderID);
            IsActive_Delete_TextBox.Text = Convert.ToString(ProfileFieldGroups.IsActive);
            AdminUseOnly_Delete_TextBox.Text = Convert.ToString(ProfileFieldGroups.AdminUseOnly);
            return ProfileFieldGroups;
        }
        //Database CRUD Call Functions
        public ProfileFieldGroups ProfileFieldGroups_insert()
        {
            ProfileFieldGroups.FieldGroupName = FieldGroupName_Insert_TextBox.Text;
            ProfileFieldGroups.FieldGroupDescription = FieldGroupDescription_Insert_TextBox.Text;
            ProfileFieldGroups.OrderID = Convert.ToInt32(OrderID_Insert_TextBox.Text);
            ProfileFieldGroups.IsActive = Convert.ToInt32(IsActive_Insert_TextBox.Text);
            ProfileFieldGroups.AdminUseOnly = Convert.ToInt32(AdminUseOnly_Insert_TextBox.Text);
            ProfileFieldGroups = ProfileFieldGroups.Insert(ProfileFieldGroups);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ProfileFieldGroups;
        }
        public ProfileFieldGroups ProfileFieldGroups_update(int ID)
        {
            ProfileFieldGroups = ProfileFieldGroups.Select(ID);
            ProfileFieldGroups.FieldGroupID = Convert.ToInt32(Update_GridView.SelectedValue);
            ProfileFieldGroups.FieldGroupName = FieldGroupName_Update_TextBox.Text;
            ProfileFieldGroups.FieldGroupDescription = FieldGroupDescription_Update_TextBox.Text;
            ProfileFieldGroups.OrderID = Convert.ToInt32(OrderID_Update_TextBox.Text);
            ProfileFieldGroups.IsActive = Convert.ToInt32(IsActive_Update_TextBox.Text);
            ProfileFieldGroups.AdminUseOnly = Convert.ToInt32(AdminUseOnly_Update_TextBox.Text);
            ProfileFieldGroups.Update(ProfileFieldGroups);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ProfileFieldGroups;
        }
        public void ProfileFieldGroups_delete(int ID)
        {
            ProfileFieldGroups.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            ProfileFieldGroups = ProfileFieldGroups_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            ProfileFieldGroups = ProfileFieldGroups_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            ProfileFieldGroups_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

