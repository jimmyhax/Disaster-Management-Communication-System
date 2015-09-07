using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class deceasedClass : System.Web.UI.Page
    {
        public deceased deceased = new deceased();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            deceased = deceased_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            deceased = deceased_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            deceased = deceased_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public deceased deceased_selectForInsert(int ID)
        {
            deceased = deceased.Select(ID);
            date_of_autopsy_Insert_TextBox.Text = Convert.ToString(deceased.date_of_autopsy);
            external_exam_Insert_TextBox.Text = Convert.ToString(deceased.external_exam);
            identifying_marks_Insert_TextBox.Text = Convert.ToString(deceased.identifying_marks);
            internal_exam_Insert_TextBox.Text = Convert.ToString(deceased.internal_exam);
            reason_of_death_Insert_TextBox.Text = Convert.ToString(deceased.reason_of_death);
            time_of_death_Insert_TextBox.Text = Convert.ToString(deceased.time_of_death);
            return deceased;
        }
        public deceased deceased_selectForUpdate(int ID)
        {
            deceased = deceased.Select(ID);
            deceased_id_Update_TextBox.Text = Convert.ToString(deceased.deceased_id);
            date_of_autopsy_Update_TextBox.Text = Convert.ToString(deceased.date_of_autopsy);
            external_exam_Update_TextBox.Text = Convert.ToString(deceased.external_exam);
            identifying_marks_Update_TextBox.Text = Convert.ToString(deceased.identifying_marks);
            internal_exam_Update_TextBox.Text = Convert.ToString(deceased.internal_exam);
            reason_of_death_Update_TextBox.Text = Convert.ToString(deceased.reason_of_death);
            time_of_death_Update_TextBox.Text = Convert.ToString(deceased.time_of_death);
            return deceased;
        }
        public deceased deceased_selectForDelete(int ID)
        {
            deceased = deceased.Select(ID);
            deceased_id_Delete_TextBox.Text = Convert.ToString(deceased.deceased_id);
            date_of_autopsy_Delete_TextBox.Text = Convert.ToString(deceased.date_of_autopsy);
            external_exam_Delete_TextBox.Text = Convert.ToString(deceased.external_exam);
            identifying_marks_Delete_TextBox.Text = Convert.ToString(deceased.identifying_marks);
            internal_exam_Delete_TextBox.Text = Convert.ToString(deceased.internal_exam);
            reason_of_death_Delete_TextBox.Text = Convert.ToString(deceased.reason_of_death);
            time_of_death_Delete_TextBox.Text = Convert.ToString(deceased.time_of_death);
            return deceased;
        }
        //Database CRUD Call Functions
        public deceased deceased_insert()
        {
            deceased.date_of_autopsy = Convert.ToDateTime(date_of_autopsy_Insert_TextBox.Text);
            deceased.external_exam = external_exam_Insert_TextBox.Text;
            deceased.identifying_marks = identifying_marks_Insert_TextBox.Text;
            deceased.internal_exam = internal_exam_Insert_TextBox.Text;
            deceased.reason_of_death = reason_of_death_Insert_TextBox.Text;
            deceased.time_of_death = Convert.ToDateTime(time_of_death_Insert_TextBox.Text);
            deceased = deceased.Insert(deceased);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return deceased;
        }
        public deceased deceased_update(int ID)
        {
            deceased = deceased.Select(ID);
            deceased.deceased_id = Convert.ToInt32(Update_GridView.SelectedValue);
            deceased.date_of_autopsy = Convert.ToDateTime(date_of_autopsy_Update_TextBox.Text);
            deceased.external_exam = external_exam_Update_TextBox.Text;
            deceased.identifying_marks = identifying_marks_Update_TextBox.Text;
            deceased.internal_exam = internal_exam_Update_TextBox.Text;
            deceased.reason_of_death = reason_of_death_Update_TextBox.Text;
            deceased.time_of_death = Convert.ToDateTime(time_of_death_Update_TextBox.Text);
            deceased.Update(deceased);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return deceased;
        }
        public void deceased_delete(int ID)
        {
            deceased.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            deceased = deceased_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            deceased = deceased_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            deceased_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

