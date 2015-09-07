using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class requirementsClass : System.Web.UI.Page
    {
        public requirements requirements = new requirements();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requirements = requirements_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requirements = requirements_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requirements = requirements_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public requirements requirements_selectForInsert(int ID)
        {
            requirements = requirements.Select(ID);
            requirement_desc_Insert_TextBox.Text = Convert.ToString(requirements.requirement_desc);
            return requirements;
        }
        public requirements requirements_selectForUpdate(int ID)
        {
            requirements = requirements.Select(ID);
            req_id_Update_TextBox.Text = Convert.ToString(requirements.req_id);
            requirement_desc_Update_TextBox.Text = Convert.ToString(requirements.requirement_desc);
            return requirements;
        }
        public requirements requirements_selectForDelete(int ID)
        {
            requirements = requirements.Select(ID);
            req_id_Delete_TextBox.Text = Convert.ToString(requirements.req_id);
            requirement_desc_Delete_TextBox.Text = Convert.ToString(requirements.requirement_desc);
            return requirements;
        }
        //Database CRUD Call Functions
        public requirements requirements_insert()
        {
            requirements.requirement_desc = requirement_desc_Insert_TextBox.Text;
            requirements = requirements.Insert(requirements);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return requirements;
        }
        public requirements requirements_update(int ID)
        {
            requirements = requirements.Select(ID);
            requirements.req_id = Convert.ToInt32(Update_GridView.SelectedValue);
            requirements.requirement_desc = requirement_desc_Update_TextBox.Text;
            requirements.Update(requirements);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return requirements;
        }
        public void requirements_delete(int ID)
        {
            requirements.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            requirements = requirements_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            requirements = requirements_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            requirements_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

