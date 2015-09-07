using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class jobClass : System.Web.UI.Page
    {
        public job job = new job();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            job = job_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            job = job_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            job = job_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public job job_selectForInsert(int ID)
        {
            job = job.Select(ID);
            address_id_Insert_TextBox.Text = Convert.ToString(job.address_id);
            company_id_Insert_TextBox.Text = Convert.ToString(job.company_id);
            job_cat_id_Insert_TextBox.Text = Convert.ToString(job.job_cat_id);
            job_posted_date_Insert_TextBox.Text = Convert.ToString(job.job_posted_date);
            job_status_Insert_TextBox.Text = Convert.ToString(job.job_status);
            job_title_Insert_TextBox.Text = Convert.ToString(job.job_title);
            Work_Classification_Full_time_Insert_TextBox.Text = Convert.ToString(job.Work_Classification_Full_time);
            Work_Classification_Part_time_Insert_TextBox.Text = Convert.ToString(job.Work_Classification_Part_time);
            Work_Payment_Freq_Weekly_Insert_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Weekly);
            Work_Payment_Freq_Bi_Weekly_Insert_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Weekly);
            Work_Payment_Freq_Monthly_Insert_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Monthly);
            Work_Payment_Freq_Bi_Monthly_Insert_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Monthly);
            return job;
        }
        public job job_selectForUpdate(int ID)
        {
            job = job.Select(ID);
            job_id_Update_TextBox.Text = Convert.ToString(job.job_id);
            address_id_Update_TextBox.Text = Convert.ToString(job.address_id);
            company_id_Update_TextBox.Text = Convert.ToString(job.company_id);
            job_cat_id_Update_TextBox.Text = Convert.ToString(job.job_cat_id);
            job_posted_date_Update_TextBox.Text = Convert.ToString(job.job_posted_date);
            job_status_Update_TextBox.Text = Convert.ToString(job.job_status);
            job_title_Update_TextBox.Text = Convert.ToString(job.job_title);
            Work_Classification_Full_time_Update_TextBox.Text = Convert.ToString(job.Work_Classification_Full_time);
            Work_Classification_Part_time_Update_TextBox.Text = Convert.ToString(job.Work_Classification_Part_time);
            Work_Payment_Freq_Weekly_Update_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Weekly);
            Work_Payment_Freq_Bi_Weekly_Update_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Weekly);
            Work_Payment_Freq_Monthly_Update_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Monthly);
            Work_Payment_Freq_Bi_Monthly_Update_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Monthly);
            return job;
        }
        public job job_selectForDelete(int ID)
        {
            job = job.Select(ID);
            job_id_Delete_TextBox.Text = Convert.ToString(job.job_id);
            address_id_Delete_TextBox.Text = Convert.ToString(job.address_id);
            company_id_Delete_TextBox.Text = Convert.ToString(job.company_id);
            job_cat_id_Delete_TextBox.Text = Convert.ToString(job.job_cat_id);
            job_posted_date_Delete_TextBox.Text = Convert.ToString(job.job_posted_date);
            job_status_Delete_TextBox.Text = Convert.ToString(job.job_status);
            job_title_Delete_TextBox.Text = Convert.ToString(job.job_title);
            Work_Classification_Full_time_Delete_TextBox.Text = Convert.ToString(job.Work_Classification_Full_time);
            Work_Classification_Part_time_Delete_TextBox.Text = Convert.ToString(job.Work_Classification_Part_time);
            Work_Payment_Freq_Weekly_Delete_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Weekly);
            Work_Payment_Freq_Bi_Weekly_Delete_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Weekly);
            Work_Payment_Freq_Monthly_Delete_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Monthly);
            Work_Payment_Freq_Bi_Monthly_Delete_TextBox.Text = Convert.ToString(job.Work_Payment_Freq_Bi_Monthly);
            return job;
        }
        //Database CRUD Call Functions
        public job job_insert()
        {
            job.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            job.company_id = Convert.ToInt32(company_id_Insert_TextBox.Text);
            job.job_cat_id = Convert.ToInt32(job_cat_id_Insert_TextBox.Text);
            job.job_posted_date = Convert.ToDateTime(job_posted_date_Insert_TextBox.Text);
            job.job_status = job_status_Insert_TextBox.Text;
            job.job_title = job_title_Insert_TextBox.Text;
            job.Work_Classification_Full_time = Work_Classification_Full_time_Insert_TextBox.Text;
            job.Work_Classification_Part_time = Work_Classification_Part_time_Insert_TextBox.Text;
            job.Work_Payment_Freq_Weekly = Work_Payment_Freq_Weekly_Insert_TextBox.Text;
            job.Work_Payment_Freq_Bi_Weekly = Work_Payment_Freq_Bi_Weekly_Insert_TextBox.Text;
            job.Work_Payment_Freq_Monthly = Work_Payment_Freq_Monthly_Insert_TextBox.Text;
            job.Work_Payment_Freq_Bi_Monthly = Work_Payment_Freq_Bi_Monthly_Insert_TextBox.Text;
            job = job.Insert(job);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return job;
        }
        public job job_update(int ID)
        {
            job = job.Select(ID);
            job.job_id = Convert.ToInt32(Update_GridView.SelectedValue);
            job.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            job.company_id = Convert.ToInt32(company_id_Update_TextBox.Text);
            job.job_cat_id = Convert.ToInt32(job_cat_id_Update_TextBox.Text);
            job.job_posted_date = Convert.ToDateTime(job_posted_date_Update_TextBox.Text);
            job.job_status = job_status_Update_TextBox.Text;
            job.job_title = job_title_Update_TextBox.Text;
            job.Work_Classification_Full_time = Work_Classification_Full_time_Update_TextBox.Text;
            job.Work_Classification_Part_time = Work_Classification_Part_time_Update_TextBox.Text;
            job.Work_Payment_Freq_Weekly = Work_Payment_Freq_Weekly_Update_TextBox.Text;
            job.Work_Payment_Freq_Bi_Weekly = Work_Payment_Freq_Bi_Weekly_Update_TextBox.Text;
            job.Work_Payment_Freq_Monthly = Work_Payment_Freq_Monthly_Update_TextBox.Text;
            job.Work_Payment_Freq_Bi_Monthly = Work_Payment_Freq_Bi_Monthly_Update_TextBox.Text;
            job.Update(job);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return job;
        }
        public void job_delete(int ID)
        {
            job.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            job = job_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            job = job_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            job_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

