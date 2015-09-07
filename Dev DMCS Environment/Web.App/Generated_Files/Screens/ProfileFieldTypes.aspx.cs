using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ProfileFieldTypesClass : System.Web.UI.Page
    {
        public ProfileFieldTypes ProfileFieldTypes = new ProfileFieldTypes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFieldTypes = ProfileFieldTypes_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFieldTypes = ProfileFieldTypes_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFieldTypes = ProfileFieldTypes_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public ProfileFieldTypes ProfileFieldTypes_selectForInsert(int ID)
        {
            ProfileFieldTypes = ProfileFieldTypes.Select(ID);
            FieldTypeName_Insert_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeName);
            FieldTypeDescription_Insert_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeDescription);
            FieldTypeSize_Insert_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeSize);
            return ProfileFieldTypes;
        }
        public ProfileFieldTypes ProfileFieldTypes_selectForUpdate(int ID)
        {
            ProfileFieldTypes = ProfileFieldTypes.Select(ID);
            FieldTypeID_Update_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeID);
            FieldTypeName_Update_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeName);
            FieldTypeDescription_Update_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeDescription);
            FieldTypeSize_Update_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeSize);
            return ProfileFieldTypes;
        }
        public ProfileFieldTypes ProfileFieldTypes_selectForDelete(int ID)
        {
            ProfileFieldTypes = ProfileFieldTypes.Select(ID);
            FieldTypeID_Delete_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeID);
            FieldTypeName_Delete_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeName);
            FieldTypeDescription_Delete_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeDescription);
            FieldTypeSize_Delete_TextBox.Text = Convert.ToString(ProfileFieldTypes.FieldTypeSize);
            return ProfileFieldTypes;
        }
        //Database CRUD Call Functions
        public ProfileFieldTypes ProfileFieldTypes_insert()
        {
            ProfileFieldTypes.FieldTypeName = FieldTypeName_Insert_TextBox.Text;
            ProfileFieldTypes.FieldTypeDescription = FieldTypeDescription_Insert_TextBox.Text;
            ProfileFieldTypes.FieldTypeSize = Convert.ToInt32(FieldTypeSize_Insert_TextBox.Text);
            ProfileFieldTypes = ProfileFieldTypes.Insert(ProfileFieldTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ProfileFieldTypes;
        }
        public ProfileFieldTypes ProfileFieldTypes_update(int ID)
        {
            ProfileFieldTypes = ProfileFieldTypes.Select(ID);
            ProfileFieldTypes.FieldTypeID = Convert.ToInt32(Update_GridView.SelectedValue);
            ProfileFieldTypes.FieldTypeName = FieldTypeName_Update_TextBox.Text;
            ProfileFieldTypes.FieldTypeDescription = FieldTypeDescription_Update_TextBox.Text;
            ProfileFieldTypes.FieldTypeSize = Convert.ToInt32(FieldTypeSize_Update_TextBox.Text);
            ProfileFieldTypes.Update(ProfileFieldTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ProfileFieldTypes;
        }
        public void ProfileFieldTypes_delete(int ID)
        {
            ProfileFieldTypes.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            ProfileFieldTypes = ProfileFieldTypes_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            ProfileFieldTypes = ProfileFieldTypes_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            ProfileFieldTypes_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

