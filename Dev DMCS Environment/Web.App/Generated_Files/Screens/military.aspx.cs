using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class militaryClass : System.Web.UI.Page
    {
        public military military = new military();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            military = military_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            military = military_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            military = military_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public military military_selectForInsert(int ID)
        {
            military = military.Select(ID);
            case_id_Insert_TextBox.Text = Convert.ToString(military.case_id);
            client_id_Insert_TextBox.Text = Convert.ToString(military.client_id);
            discharge_date_Insert_TextBox.Text = Convert.ToString(military.discharge_date);
            enlistment_date_Insert_TextBox.Text = Convert.ToString(military.enlistment_date);
            military_branch_Insert_TextBox.Text = Convert.ToString(military.military_branch);
            serial_num_Insert_TextBox.Text = Convert.ToString(military.serial_num);
            return military;
        }
        public military military_selectForUpdate(int ID)
        {
            military = military.Select(ID);
            military_id_Update_TextBox.Text = Convert.ToString(military.military_id);
            case_id_Update_TextBox.Text = Convert.ToString(military.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(military.client_id);
            discharge_date_Update_TextBox.Text = Convert.ToString(military.discharge_date);
            enlistment_date_Update_TextBox.Text = Convert.ToString(military.enlistment_date);
            military_branch_Update_TextBox.Text = Convert.ToString(military.military_branch);
            serial_num_Update_TextBox.Text = Convert.ToString(military.serial_num);
            return military;
        }
        public military military_selectForDelete(int ID)
        {
            military = military.Select(ID);
            military_id_Delete_TextBox.Text = Convert.ToString(military.military_id);
            case_id_Delete_TextBox.Text = Convert.ToString(military.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(military.client_id);
            discharge_date_Delete_TextBox.Text = Convert.ToString(military.discharge_date);
            enlistment_date_Delete_TextBox.Text = Convert.ToString(military.enlistment_date);
            military_branch_Delete_TextBox.Text = Convert.ToString(military.military_branch);
            serial_num_Delete_TextBox.Text = Convert.ToString(military.serial_num);
            return military;
        }
        //Database CRUD Call Functions
        public military military_insert()
        {
            military.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            military.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            military.discharge_date = Convert.ToDateTime(discharge_date_Insert_TextBox.Text);
            military.enlistment_date = Convert.ToDateTime(enlistment_date_Insert_TextBox.Text);
            military.military_branch = military_branch_Insert_TextBox.Text;
            military.serial_num = Convert.ToInt32(serial_num_Insert_TextBox.Text);
            military = military.Insert(military);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return military;
        }
        public military military_update(int ID)
        {
            military = military.Select(ID);
            military.military_id = Convert.ToInt32(Update_GridView.SelectedValue);
            military.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            military.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            military.discharge_date = Convert.ToDateTime(discharge_date_Update_TextBox.Text);
            military.enlistment_date = Convert.ToDateTime(enlistment_date_Update_TextBox.Text);
            military.military_branch = military_branch_Update_TextBox.Text;
            military.serial_num = Convert.ToInt32(serial_num_Update_TextBox.Text);
            military.Update(military);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return military;
        }
        public void military_delete(int ID)
        {
            military.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            military = military_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            military = military_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            military_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

