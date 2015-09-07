using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class relativeClass : System.Web.UI.Page
    {
        public relative relative = new relative();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            relative = relative_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            relative = relative_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            relative = relative_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public relative relative_selectForInsert(int ID)
        {
            relative = relative.Select(ID);
            case_id_Insert_TextBox.Text = Convert.ToString(relative.case_id);
            client_id_Insert_TextBox.Text = Convert.ToString(relative.client_id);
            address_id_Insert_TextBox.Text = Convert.ToString(relative.address_id);
            relative_help_memo_Insert_TextBox.Text = Convert.ToString(relative.relative_help_memo);
            will_help_Insert_TextBox.Text = Convert.ToString(relative.will_help);
            return relative;
        }
        public relative relative_selectForUpdate(int ID)
        {
            relative = relative.Select(ID);
            relative_id_Update_TextBox.Text = Convert.ToString(relative.relative_id);
            case_id_Update_TextBox.Text = Convert.ToString(relative.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(relative.client_id);
            address_id_Update_TextBox.Text = Convert.ToString(relative.address_id);
            relative_help_memo_Update_TextBox.Text = Convert.ToString(relative.relative_help_memo);
            will_help_Update_TextBox.Text = Convert.ToString(relative.will_help);
            return relative;
        }
        public relative relative_selectForDelete(int ID)
        {
            relative = relative.Select(ID);
            relative_id_Delete_TextBox.Text = Convert.ToString(relative.relative_id);
            case_id_Delete_TextBox.Text = Convert.ToString(relative.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(relative.client_id);
            address_id_Delete_TextBox.Text = Convert.ToString(relative.address_id);
            relative_help_memo_Delete_TextBox.Text = Convert.ToString(relative.relative_help_memo);
            will_help_Delete_TextBox.Text = Convert.ToString(relative.will_help);
            return relative;
        }
        //Database CRUD Call Functions
        public relative relative_insert()
        {
            relative.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            relative.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            relative.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            relative.relative_help_memo = relative_help_memo_Insert_TextBox.Text;
            relative.will_help = will_help_Insert_TextBox.Text;
            relative = relative.Insert(relative);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return relative;
        }
        public relative relative_update(int ID)
        {
            relative = relative.Select(ID);
            relative.relative_id = Convert.ToInt32(Update_GridView.SelectedValue);
            relative.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            relative.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            relative.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            relative.relative_help_memo = relative_help_memo_Update_TextBox.Text;
            relative.will_help = will_help_Update_TextBox.Text;
            relative.Update(relative);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return relative;
        }
        public void relative_delete(int ID)
        {
            relative.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            relative = relative_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            relative = relative_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            relative_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

