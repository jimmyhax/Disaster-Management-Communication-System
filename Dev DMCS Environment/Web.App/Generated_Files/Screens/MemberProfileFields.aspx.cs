using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MemberProfileFieldsClass : System.Web.UI.Page
    {
        public MemberProfileFields MemberProfileFields = new MemberProfileFields();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberProfileFields = MemberProfileFields_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberProfileFields = MemberProfileFields_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberProfileFields = MemberProfileFields_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public MemberProfileFields MemberProfileFields_selectForInsert(int ID)
        {
            MemberProfileFields = MemberProfileFields.Select(ID);
            MemberID_Insert_TextBox.Text = Convert.ToString(MemberProfileFields.MemberID);
            FieldID_Insert_TextBox.Text = Convert.ToString(MemberProfileFields.FieldID);
            FieldValue_Insert_TextBox.Text = Convert.ToString(MemberProfileFields.FieldValue);
            Created_Insert_TextBox.Text = Convert.ToString(MemberProfileFields.Created);
            Modified_Insert_TextBox.Text = Convert.ToString(MemberProfileFields.Modified);
            return MemberProfileFields;
        }
        public MemberProfileFields MemberProfileFields_selectForUpdate(int ID)
        {
            MemberProfileFields = MemberProfileFields.Select(ID);
            ProfileFieldID_Update_TextBox.Text = Convert.ToString(MemberProfileFields.ProfileFieldID);
            MemberID_Update_TextBox.Text = Convert.ToString(MemberProfileFields.MemberID);
            FieldID_Update_TextBox.Text = Convert.ToString(MemberProfileFields.FieldID);
            FieldValue_Update_TextBox.Text = Convert.ToString(MemberProfileFields.FieldValue);
            Created_Update_TextBox.Text = Convert.ToString(MemberProfileFields.Created);
            Modified_Update_TextBox.Text = Convert.ToString(MemberProfileFields.Modified);
            return MemberProfileFields;
        }
        public MemberProfileFields MemberProfileFields_selectForDelete(int ID)
        {
            MemberProfileFields = MemberProfileFields.Select(ID);
            ProfileFieldID_Delete_TextBox.Text = Convert.ToString(MemberProfileFields.ProfileFieldID);
            MemberID_Delete_TextBox.Text = Convert.ToString(MemberProfileFields.MemberID);
            FieldID_Delete_TextBox.Text = Convert.ToString(MemberProfileFields.FieldID);
            FieldValue_Delete_TextBox.Text = Convert.ToString(MemberProfileFields.FieldValue);
            Created_Delete_TextBox.Text = Convert.ToString(MemberProfileFields.Created);
            Modified_Delete_TextBox.Text = Convert.ToString(MemberProfileFields.Modified);
            return MemberProfileFields;
        }
        //Database CRUD Call Functions
        public MemberProfileFields MemberProfileFields_insert()
        {
            MemberProfileFields.FieldID = Convert.ToInt32(FieldID_Insert_TextBox.Text);
            MemberProfileFields.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            MemberProfileFields.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            MemberProfileFields = MemberProfileFields.Insert(MemberProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberProfileFields;
        }
        public MemberProfileFields MemberProfileFields_update(int ID)
        {
            MemberProfileFields = MemberProfileFields.Select(ID);
            MemberProfileFields.ProfileFieldID = Convert.ToInt32(Update_GridView.SelectedValue);
            MemberProfileFields.FieldID = Convert.ToInt32(FieldID_Update_TextBox.Text);
            MemberProfileFields.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            MemberProfileFields.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            MemberProfileFields.Update(MemberProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberProfileFields;
        }
        public void MemberProfileFields_delete(int ID)
        {
            MemberProfileFields.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            MemberProfileFields = MemberProfileFields_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            MemberProfileFields = MemberProfileFields_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            MemberProfileFields_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

