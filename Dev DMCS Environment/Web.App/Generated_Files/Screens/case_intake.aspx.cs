using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class case_intakeClass : System.Web.UI.Page
    {
        public case_intake case_intake = new case_intake();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            case_intake = case_intake_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            case_intake = case_intake_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            case_intake = case_intake_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public case_intake case_intake_selectForInsert(int ID)
        {
            case_intake = case_intake.Select(ID);
            applic_end_date_time_Insert_TextBox.Text = Convert.ToString(case_intake.applic_end_date_time);
            applic_start_date_time_Insert_TextBox.Text = Convert.ToString(case_intake.applic_start_date_time);
            circum_emergency_event_Insert_TextBox.Text = Convert.ToString(case_intake.circum_emergency_event);
            circum_help_request_memo_Insert_TextBox.Text = Convert.ToString(case_intake.circum_help_request_memo);
            circum_income_stolen_Insert_TextBox.Text = Convert.ToString(case_intake.circum_income_stolen);
            circum_memo_Insert_TextBox.Text = Convert.ToString(case_intake.circum_memo);
            circum_no_income_Insert_TextBox.Text = Convert.ToString(case_intake.circum_no_income);
            circum_not_enough_income_Insert_TextBox.Text = Convert.ToString(case_intake.circum_not_enough_income);
            agency_id_Insert_TextBox.Text = Convert.ToString(case_intake.agency_id);
            call_center_id_Insert_TextBox.Text = Convert.ToString(case_intake.call_center_id);
            return case_intake;
        }
        public case_intake case_intake_selectForUpdate(int ID)
        {
            case_intake = case_intake.Select(ID);
            case_id_Update_TextBox.Text = Convert.ToString(case_intake.case_id);
            applic_end_date_time_Update_TextBox.Text = Convert.ToString(case_intake.applic_end_date_time);
            applic_start_date_time_Update_TextBox.Text = Convert.ToString(case_intake.applic_start_date_time);
            circum_emergency_event_Update_TextBox.Text = Convert.ToString(case_intake.circum_emergency_event);
            circum_help_request_memo_Update_TextBox.Text = Convert.ToString(case_intake.circum_help_request_memo);
            circum_income_stolen_Update_TextBox.Text = Convert.ToString(case_intake.circum_income_stolen);
            circum_memo_Update_TextBox.Text = Convert.ToString(case_intake.circum_memo);
            circum_no_income_Update_TextBox.Text = Convert.ToString(case_intake.circum_no_income);
            circum_not_enough_income_Update_TextBox.Text = Convert.ToString(case_intake.circum_not_enough_income);
            agency_id_Update_TextBox.Text = Convert.ToString(case_intake.agency_id);
            call_center_id_Update_TextBox.Text = Convert.ToString(case_intake.call_center_id);
            return case_intake;
        }
        public case_intake case_intake_selectForDelete(int ID)
        {
            case_intake = case_intake.Select(ID);
            case_id_Delete_TextBox.Text = Convert.ToString(case_intake.case_id);
            applic_end_date_time_Delete_TextBox.Text = Convert.ToString(case_intake.applic_end_date_time);
            applic_start_date_time_Delete_TextBox.Text = Convert.ToString(case_intake.applic_start_date_time);
            circum_emergency_event_Delete_TextBox.Text = Convert.ToString(case_intake.circum_emergency_event);
            circum_help_request_memo_Delete_TextBox.Text = Convert.ToString(case_intake.circum_help_request_memo);
            circum_income_stolen_Delete_TextBox.Text = Convert.ToString(case_intake.circum_income_stolen);
            circum_memo_Delete_TextBox.Text = Convert.ToString(case_intake.circum_memo);
            circum_no_income_Delete_TextBox.Text = Convert.ToString(case_intake.circum_no_income);
            circum_not_enough_income_Delete_TextBox.Text = Convert.ToString(case_intake.circum_not_enough_income);
            agency_id_Delete_TextBox.Text = Convert.ToString(case_intake.agency_id);
            call_center_id_Delete_TextBox.Text = Convert.ToString(case_intake.call_center_id);
            return case_intake;
        }
        //Database CRUD Call Functions
        public case_intake case_intake_insert()
        {
            case_intake.applic_end_date_time = Convert.ToDateTime(applic_end_date_time_Insert_TextBox.Text);
            case_intake.applic_start_date_time = Convert.ToDateTime(applic_start_date_time_Insert_TextBox.Text);
            case_intake.circum_emergency_event = circum_emergency_event_Insert_TextBox.Text;
            case_intake.circum_help_request_memo = circum_help_request_memo_Insert_TextBox.Text;
            case_intake.circum_income_stolen = circum_income_stolen_Insert_TextBox.Text;
            case_intake.circum_memo = circum_memo_Insert_TextBox.Text;
            case_intake.circum_no_income = circum_no_income_Insert_TextBox.Text;
            case_intake.circum_not_enough_income = circum_not_enough_income_Insert_TextBox.Text;
            case_intake.agency_id = Convert.ToInt32(agency_id_Insert_TextBox.Text);
            case_intake.call_center_id = Convert.ToInt32(call_center_id_Insert_TextBox.Text);
            case_intake = case_intake.Insert(case_intake);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return case_intake;
        }
        public case_intake case_intake_update(int ID)
        {
            case_intake = case_intake.Select(ID);
            case_intake.case_id = Convert.ToInt32(Update_GridView.SelectedValue);
            case_intake.applic_end_date_time = Convert.ToDateTime(applic_end_date_time_Update_TextBox.Text);
            case_intake.applic_start_date_time = Convert.ToDateTime(applic_start_date_time_Update_TextBox.Text);
            case_intake.circum_emergency_event = circum_emergency_event_Update_TextBox.Text;
            case_intake.circum_help_request_memo = circum_help_request_memo_Update_TextBox.Text;
            case_intake.circum_income_stolen = circum_income_stolen_Update_TextBox.Text;
            case_intake.circum_memo = circum_memo_Update_TextBox.Text;
            case_intake.circum_no_income = circum_no_income_Update_TextBox.Text;
            case_intake.circum_not_enough_income = circum_not_enough_income_Update_TextBox.Text;
            case_intake.agency_id = Convert.ToInt32(agency_id_Update_TextBox.Text);
            case_intake.call_center_id = Convert.ToInt32(call_center_id_Update_TextBox.Text);
            case_intake.Update(case_intake);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return case_intake;
        }
        public void case_intake_delete(int ID)
        {
            case_intake.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            case_intake = case_intake_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            case_intake = case_intake_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            case_intake_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

