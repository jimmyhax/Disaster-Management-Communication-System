using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class job_categoryClass : System.Web.UI.Page
    {
        public job_category job_category = new job_category();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            job_category = job_category_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            job_category = job_category_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            job_category = job_category_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public job_category job_category_selectForInsert(int ID)
        {
            job_category = job_category.Select(ID);
            job_category_name_Insert_TextBox.Text = Convert.ToString(job_category.job_category_name);
            return job_category;
        }
        public job_category job_category_selectForUpdate(int ID)
        {
            job_category = job_category.Select(ID);
            job_cat_id_Update_TextBox.Text = Convert.ToString(job_category.job_cat_id);
            job_category_name_Update_TextBox.Text = Convert.ToString(job_category.job_category_name);
            return job_category;
        }
        public job_category job_category_selectForDelete(int ID)
        {
            job_category = job_category.Select(ID);
            job_cat_id_Delete_TextBox.Text = Convert.ToString(job_category.job_cat_id);
            job_category_name_Delete_TextBox.Text = Convert.ToString(job_category.job_category_name);
            return job_category;
        }
        //Database CRUD Call Functions
        public job_category job_category_insert()
        {
            job_category.job_category_name = job_category_name_Insert_TextBox.Text;
            job_category = job_category.Insert(job_category);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return job_category;
        }
        public job_category job_category_update(int ID)
        {
            job_category = job_category.Select(ID);
            job_category.job_cat_id = Convert.ToInt32(Update_GridView.SelectedValue);
            job_category.job_category_name = job_category_name_Update_TextBox.Text;
            job_category.Update(job_category);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return job_category;
        }
        public void job_category_delete(int ID)
        {
            job_category.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            job_category = job_category_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            job_category = job_category_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            job_category_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

