using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class DomainProfileFieldsClass : System.Web.UI.Page
    {
        public DomainProfileFields DomainProfileFields = new DomainProfileFields();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            DomainProfileFields = DomainProfileFields_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            DomainProfileFields = DomainProfileFields_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            DomainProfileFields = DomainProfileFields_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public DomainProfileFields DomainProfileFields_selectForInsert(int ID)
        {
            DomainProfileFields = DomainProfileFields.Select(ID);
            DomainID_Insert_TextBox.Text = Convert.ToString(DomainProfileFields.DomainID);
            ProfileFieldID_Insert_TextBox.Text = Convert.ToString(DomainProfileFields.ProfileFieldID);
            return DomainProfileFields;
        }
        public DomainProfileFields DomainProfileFields_selectForUpdate(int ID)
        {
            DomainProfileFields = DomainProfileFields.Select(ID);
            DomainFieldID_Update_TextBox.Text = Convert.ToString(DomainProfileFields.DomainFieldID);
            DomainID_Update_TextBox.Text = Convert.ToString(DomainProfileFields.DomainID);
            ProfileFieldID_Update_TextBox.Text = Convert.ToString(DomainProfileFields.ProfileFieldID);
            return DomainProfileFields;
        }
        public DomainProfileFields DomainProfileFields_selectForDelete(int ID)
        {
            DomainProfileFields = DomainProfileFields.Select(ID);
            DomainFieldID_Delete_TextBox.Text = Convert.ToString(DomainProfileFields.DomainFieldID);
            DomainID_Delete_TextBox.Text = Convert.ToString(DomainProfileFields.DomainID);
            ProfileFieldID_Delete_TextBox.Text = Convert.ToString(DomainProfileFields.ProfileFieldID);
            return DomainProfileFields;
        }
        //Database CRUD Call Functions
        public DomainProfileFields DomainProfileFields_insert()
        {
            DomainProfileFields.DomainID = Convert.ToInt32(DomainID_Insert_TextBox.Text);
            DomainProfileFields.ProfileFieldID = Convert.ToInt32(ProfileFieldID_Insert_TextBox.Text);
            DomainProfileFields = DomainProfileFields.Insert(DomainProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return DomainProfileFields;
        }
        public DomainProfileFields DomainProfileFields_update(int ID)
        {
            DomainProfileFields = DomainProfileFields.Select(ID);
            DomainProfileFields.DomainFieldID = Convert.ToInt32(Update_GridView.SelectedValue);
            DomainProfileFields.DomainID = Convert.ToInt32(DomainID_Update_TextBox.Text);
            DomainProfileFields.ProfileFieldID = Convert.ToInt32(ProfileFieldID_Update_TextBox.Text);
            DomainProfileFields.Update(DomainProfileFields);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return DomainProfileFields;
        }
        public void DomainProfileFields_delete(int ID)
        {
            DomainProfileFields.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            DomainProfileFields = DomainProfileFields_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            DomainProfileFields = DomainProfileFields_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            DomainProfileFields_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

