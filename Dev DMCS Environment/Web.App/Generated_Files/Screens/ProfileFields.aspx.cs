using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ProfileFieldsClass : System.Web.UI.Page
    {
        public ProfileFields ProfileFields = new ProfileFields();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFields = ProfileFields_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFields = ProfileFields_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ProfileFields = ProfileFields_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public ProfileFields ProfileFields_selectForInsert(int ID)
        {
            ProfileFields = ProfileFields.Select(ID);
            FieldTypeID_Insert_TextBox.Text = Convert.ToString(ProfileFields.FieldTypeID);
            FieldName_Insert_TextBox.Text = Convert.ToString(ProfileFields.FieldName);
            Comment_Insert_TextBox.Text = Convert.ToString(ProfileFields.Comment);
            PossibleValues_Insert_TextBox.Text = Convert.ToString(ProfileFields.PossibleValues);
            TextSelectValue_Insert_TextBox.Text = Convert.ToString(ProfileFields.TextSelectValue);
            IsMandatory_Insert_TextBox.Text = Convert.ToString(ProfileFields.IsMandatory);
            ShowInSignUp_Insert_TextBox.Text = Convert.ToString(ProfileFields.ShowInSignUp);
            FieldGroupID_Insert_TextBox.Text = Convert.ToString(ProfileFields.FieldGroupID);
            OrderID_Insert_TextBox.Text = Convert.ToString(ProfileFields.OrderID);
            Created_Insert_TextBox.Text = Convert.ToString(ProfileFields.Created);
            Modified_Insert_TextBox.Text = Convert.ToString(ProfileFields.Modified);
            SortValues_Insert_TextBox.Text = Convert.ToString(ProfileFields.SortValues);
            IsActive_Insert_TextBox.Text = Convert.ToString(ProfileFields.IsActive);
            AdminUseOnly_Insert_TextBox.Text = Convert.ToString(ProfileFields.AdminUseOnly);
            VerticalLayout_Insert_TextBox.Text = Convert.ToString(ProfileFields.VerticalLayout);
            Encrypted_Insert_TextBox.Text = Convert.ToString(ProfileFields.Encrypted);
            return ProfileFields;
        }
        public ProfileFields ProfileFields_selectForUpdate(int ID)
        {
            ProfileFields = ProfileFields.Select(ID);
            FieldID_Update_TextBox.Text = Convert.ToString(ProfileFields.FieldID);
            FieldTypeID_Update_TextBox.Text = Convert.ToString(ProfileFields.FieldTypeID);
            FieldName_Update_TextBox.Text = Convert.ToString(ProfileFields.FieldName);
            Comment_Update_TextBox.Text = Convert.ToString(ProfileFields.Comment);
            PossibleValues_Update_TextBox.Text = Convert.ToString(ProfileFields.PossibleValues);
            TextSelectValue_Update_TextBox.Text = Convert.ToString(ProfileFields.TextSelectValue);
            IsMandatory_Update_TextBox.Text = Convert.ToString(ProfileFields.IsMandatory);
            ShowInSignUp_Update_TextBox.Text = Convert.ToString(ProfileFields.ShowInSignUp);
            FieldGroupID_Update_TextBox.Text = Convert.ToString(ProfileFields.FieldGroupID);
            OrderID_Update_TextBox.Text = Convert.ToString(ProfileFields.OrderID);
            Created_Update_TextBox.Text = Convert.ToString(ProfileFields.Created);
            Modified_Update_TextBox.Text = Convert.ToString(ProfileFields.Modified);
            SortValues_Update_TextBox.Text = Convert.ToString(ProfileFields.SortValues);
            IsActive_Update_TextBox.Text = Convert.ToString(ProfileFields.IsActive);
            AdminUseOnly_Update_TextBox.Text = Convert.ToString(ProfileFields.AdminUseOnly);
            VerticalLayout_Update_TextBox.Text = Convert.ToString(ProfileFields.VerticalLayout);
            Encrypted_Update_TextBox.Text = Convert.ToString(ProfileFields.Encrypted);
            return ProfileFields;
        }
        public ProfileFields ProfileFields_selectForDelete(int ID)
        {
            ProfileFields = ProfileFields.Select(ID);
            FieldID_Delete_TextBox.Text = Convert.ToString(ProfileFields.FieldID);
            FieldTypeID_Delete_TextBox.Text = Convert.ToString(ProfileFields.FieldTypeID);
            FieldName_Delete_TextBox.Text = Convert.ToString(ProfileFields.FieldName);
            Comment_Delete_TextBox.Text = Convert.ToString(ProfileFields.Comment);
            PossibleValues_Delete_TextBox.Text = Convert.ToString(ProfileFields.PossibleValues);
            TextSelectValue_Delete_TextBox.Text = Convert.ToString(ProfileFields.TextSelectValue);
            IsMandatory_Delete_TextBox.Text = Convert.ToString(ProfileFields.IsMandatory);
            ShowInSignUp_Delete_TextBox.Text = Convert.ToString(ProfileFields.ShowInSignUp);
            FieldGroupID_Delete_TextBox.Text = Convert.ToString(ProfileFields.FieldGroupID);
            OrderID_Delete_TextBox.Text = Convert.ToString(ProfileFields.OrderID);
            Created_Delete_TextBox.Text = Convert.ToString(ProfileFields.Created);
            Modified_Delete_TextBox.Text = Convert.ToString(ProfileFields.Modified);
            SortValues_Delete_TextBox.Text = Convert.ToString(ProfileFields.SortValues);
            IsActive_Delete_TextBox.Text = Convert.ToString(ProfileFields.IsActive);
            AdminUseOnly_Delete_TextBox.Text = Convert.ToString(ProfileFields.AdminUseOnly);
            VerticalLayout_Delete_TextBox.Text = Convert.ToString(ProfileFields.VerticalLayout);
            Encrypted_Delete_TextBox.Text = Convert.ToString(ProfileFields.Encrypted);
            return ProfileFields;
        }
        //Database CRUD Call Functions
        public ProfileFields ProfileFields_insert()
        {
            ProfileFields.FieldTypeID = Convert.ToInt32(FieldTypeID_Insert_TextBox.Text);
            ProfileFields.FieldName = FieldName_Insert_TextBox.Text;
            ProfileFields.TextSelectValue = TextSelectValue_Insert_TextBox.Text;
            ProfileFields.IsMandatory = Convert.ToInt32(IsMandatory_Insert_TextBox.Text);
            ProfileFields.ShowInSignUp = Convert.ToInt32(ShowInSignUp_Insert_TextBox.Text);
            ProfileFields.FieldGroupID = Convert.ToInt32(FieldGroupID_Insert_TextBox.Text);
            ProfileFields.OrderID = Convert.ToInt32(OrderID_Insert_TextBox.Text);
            ProfileFields.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            ProfileFields.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            ProfileFields.SortValues = Convert.ToInt32(SortValues_Insert_TextBox.Text);
            ProfileFields.IsActive = Convert.ToInt32(IsActive_Insert_TextBox.Text);
            ProfileFields.AdminUseOnly = Convert.ToInt32(AdminUseOnly_Insert_TextBox.Text);
            ProfileFields.VerticalLayout = Convert.ToInt32(VerticalLayout_Insert_TextBox.Text);
            ProfileFields.Encrypted = Convert.ToInt32(Encrypted_Insert_TextBox.Text);
            ProfileFields = ProfileFields.Insert(ProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ProfileFields;
        }
        public ProfileFields ProfileFields_update(int ID)
        {
            ProfileFields = ProfileFields.Select(ID);
            ProfileFields.FieldID = Convert.ToInt32(Update_GridView.SelectedValue);
            ProfileFields.FieldTypeID = Convert.ToInt32(FieldTypeID_Update_TextBox.Text);
            ProfileFields.FieldName = FieldName_Update_TextBox.Text;
            ProfileFields.TextSelectValue = TextSelectValue_Update_TextBox.Text;
            ProfileFields.IsMandatory = Convert.ToInt32(IsMandatory_Update_TextBox.Text);
            ProfileFields.ShowInSignUp = Convert.ToInt32(ShowInSignUp_Update_TextBox.Text);
            ProfileFields.FieldGroupID = Convert.ToInt32(FieldGroupID_Update_TextBox.Text);
            ProfileFields.OrderID = Convert.ToInt32(OrderID_Update_TextBox.Text);
            ProfileFields.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            ProfileFields.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            ProfileFields.SortValues = Convert.ToInt32(SortValues_Update_TextBox.Text);
            ProfileFields.IsActive = Convert.ToInt32(IsActive_Update_TextBox.Text);
            ProfileFields.AdminUseOnly = Convert.ToInt32(AdminUseOnly_Update_TextBox.Text);
            ProfileFields.VerticalLayout = Convert.ToInt32(VerticalLayout_Update_TextBox.Text);
            ProfileFields.Encrypted = Convert.ToInt32(Encrypted_Update_TextBox.Text);
            ProfileFields.Update(ProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ProfileFields;
        }
        public void ProfileFields_delete(int ID)
        {
            ProfileFields.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            ProfileFields = ProfileFields_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            ProfileFields = ProfileFields_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            ProfileFields_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

