using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class missingClass : System.Web.UI.Page
    {
        public missing missing = new missing();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            missing = missing_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            missing = missing_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            missing = missing_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public missing missing_selectForInsert(int ID)
        {
            missing = missing.Select(ID);
            client_other_info_Insert_TextBox.Text = Convert.ToString(missing.client_other_info);
            clothing_Insert_TextBox.Text = Convert.ToString(missing.clothing);
            date_of_disappearance_Insert_TextBox.Text = Convert.ToString(missing.date_of_disappearance);
            return missing;
        }
        public missing missing_selectForUpdate(int ID)
        {
            missing = missing.Select(ID);
            Missing_id_Update_TextBox.Text = Convert.ToString(missing.Missing_id);
            client_other_info_Update_TextBox.Text = Convert.ToString(missing.client_other_info);
            clothing_Update_TextBox.Text = Convert.ToString(missing.clothing);
            date_of_disappearance_Update_TextBox.Text = Convert.ToString(missing.date_of_disappearance);
            return missing;
        }
        public missing missing_selectForDelete(int ID)
        {
            missing = missing.Select(ID);
            Missing_id_Delete_TextBox.Text = Convert.ToString(missing.Missing_id);
            client_other_info_Delete_TextBox.Text = Convert.ToString(missing.client_other_info);
            clothing_Delete_TextBox.Text = Convert.ToString(missing.clothing);
            date_of_disappearance_Delete_TextBox.Text = Convert.ToString(missing.date_of_disappearance);
            return missing;
        }
        //Database CRUD Call Functions
        public missing missing_insert()
        {
            missing.client_other_info = client_other_info_Insert_TextBox.Text;
            missing.clothing = clothing_Insert_TextBox.Text;
            missing.date_of_disappearance = Convert.ToDateTime(date_of_disappearance_Insert_TextBox.Text);
            missing = missing.Insert(missing);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return missing;
        }
        public missing missing_update(int ID)
        {
            missing = missing.Select(ID);
            missing.Missing_id = Convert.ToInt32(Update_GridView.SelectedValue);
            missing.client_other_info = client_other_info_Update_TextBox.Text;
            missing.clothing = clothing_Update_TextBox.Text;
            missing.date_of_disappearance = Convert.ToDateTime(date_of_disappearance_Update_TextBox.Text);
            missing.Update(missing);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return missing;
        }
        public void missing_delete(int ID)
        {
            missing.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            missing = missing_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            missing = missing_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            missing_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

