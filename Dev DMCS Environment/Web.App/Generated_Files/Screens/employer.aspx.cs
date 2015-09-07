using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class employerClass : System.Web.UI.Page
    {
        public employer employer = new employer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employer = employer_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employer = employer_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            employer = employer_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public employer employer_selectForInsert(int ID)
        {
            employer = employer.Select(ID);
            case_id_Insert_TextBox.Text = Convert.ToString(employer.case_id);
            client_id_Insert_TextBox.Text = Convert.ToString(employer.client_id);
            address_id_Insert_TextBox.Text = Convert.ToString(employer.address_id);
            emplr_name_Insert_TextBox.Text = Convert.ToString(employer.emplr_name);
            emplr_phone_Insert_TextBox.Text = Convert.ToString(employer.emplr_phone);
            end_date_Insert_TextBox.Text = Convert.ToString(employer.end_date);
            strt_date_Insert_TextBox.Text = Convert.ToString(employer.strt_date);
            term_reason_Insert_TextBox.Text = Convert.ToString(employer.term_reason);
            return employer;
        }
        public employer employer_selectForUpdate(int ID)
        {
            employer = employer.Select(ID);
            emplr_id_Update_TextBox.Text = Convert.ToString(employer.emplr_id);
            case_id_Update_TextBox.Text = Convert.ToString(employer.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(employer.client_id);
            address_id_Update_TextBox.Text = Convert.ToString(employer.address_id);
            emplr_name_Update_TextBox.Text = Convert.ToString(employer.emplr_name);
            emplr_phone_Update_TextBox.Text = Convert.ToString(employer.emplr_phone);
            end_date_Update_TextBox.Text = Convert.ToString(employer.end_date);
            strt_date_Update_TextBox.Text = Convert.ToString(employer.strt_date);
            term_reason_Update_TextBox.Text = Convert.ToString(employer.term_reason);
            return employer;
        }
        public employer employer_selectForDelete(int ID)
        {
            employer = employer.Select(ID);
            emplr_id_Delete_TextBox.Text = Convert.ToString(employer.emplr_id);
            case_id_Delete_TextBox.Text = Convert.ToString(employer.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(employer.client_id);
            address_id_Delete_TextBox.Text = Convert.ToString(employer.address_id);
            emplr_name_Delete_TextBox.Text = Convert.ToString(employer.emplr_name);
            emplr_phone_Delete_TextBox.Text = Convert.ToString(employer.emplr_phone);
            end_date_Delete_TextBox.Text = Convert.ToString(employer.end_date);
            strt_date_Delete_TextBox.Text = Convert.ToString(employer.strt_date);
            term_reason_Delete_TextBox.Text = Convert.ToString(employer.term_reason);
            return employer;
        }
        //Database CRUD Call Functions
        public employer employer_insert()
        {
            employer.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            employer.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            employer.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            employer.emplr_name = emplr_name_Insert_TextBox.Text;
            employer.emplr_phone = emplr_phone_Insert_TextBox.Text;
            employer.end_date = Convert.ToDateTime(end_date_Insert_TextBox.Text);
            employer.strt_date = Convert.ToDateTime(strt_date_Insert_TextBox.Text);
            employer.term_reason = term_reason_Insert_TextBox.Text;
            employer = employer.Insert(employer);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return employer;
        }
        public employer employer_update(int ID)
        {
            employer = employer.Select(ID);
            employer.emplr_id = Convert.ToInt32(Update_GridView.SelectedValue);
            employer.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            employer.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            employer.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            employer.emplr_name = emplr_name_Update_TextBox.Text;
            employer.emplr_phone = emplr_phone_Update_TextBox.Text;
            employer.end_date = Convert.ToDateTime(end_date_Update_TextBox.Text);
            employer.strt_date = Convert.ToDateTime(strt_date_Update_TextBox.Text);
            employer.term_reason = term_reason_Update_TextBox.Text;
            employer.Update(employer);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return employer;
        }
        public void employer_delete(int ID)
        {
            employer.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            employer = employer_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            employer = employer_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            employer_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

