using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class houseClass : System.Web.UI.Page
    {
        public house house = new house();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            house = house_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            house = house_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            house = house_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public house house_selectForInsert(int ID)
        {
            house = house.Select(ID);
            house_name_Insert_TextBox.Text = Convert.ToString(house.house_name);
            house_eligibility_Insert_TextBox.Text = Convert.ToString(house.house_eligibility);
            house_request_date_Insert_TextBox.Text = Convert.ToString(house.house_request_date);
            house_voucher_amt_Insert_TextBox.Text = Convert.ToString(house.house_voucher_amt);
            house_voucher_begin_date_Insert_TextBox.Text = Convert.ToString(house.house_voucher_begin_date);
            house_voucher_exp_date_Insert_TextBox.Text = Convert.ToString(house.house_voucher_exp_date);
            house_voucher_num_Insert_TextBox.Text = Convert.ToString(house.house_voucher_num);
            house_voucher_schedule_Insert_TextBox.Text = Convert.ToString(house.house_voucher_schedule);
            house_wait_list_Insert_TextBox.Text = Convert.ToString(house.house_wait_list);
            return house;
        }
        public house house_selectForUpdate(int ID)
        {
            house = house.Select(ID);
            house_id_Update_TextBox.Text = Convert.ToString(house.house_id);
            house_name_Update_TextBox.Text = Convert.ToString(house.house_name);
            house_eligibility_Update_TextBox.Text = Convert.ToString(house.house_eligibility);
            house_request_date_Update_TextBox.Text = Convert.ToString(house.house_request_date);
            house_voucher_amt_Update_TextBox.Text = Convert.ToString(house.house_voucher_amt);
            house_voucher_begin_date_Update_TextBox.Text = Convert.ToString(house.house_voucher_begin_date);
            house_voucher_exp_date_Update_TextBox.Text = Convert.ToString(house.house_voucher_exp_date);
            house_voucher_num_Update_TextBox.Text = Convert.ToString(house.house_voucher_num);
            house_voucher_schedule_Update_TextBox.Text = Convert.ToString(house.house_voucher_schedule);
            house_wait_list_Update_TextBox.Text = Convert.ToString(house.house_wait_list);
            return house;
        }
        public house house_selectForDelete(int ID)
        {
            house = house.Select(ID);
            house_id_Delete_TextBox.Text = Convert.ToString(house.house_id);
            house_name_Delete_TextBox.Text = Convert.ToString(house.house_name);
            house_eligibility_Delete_TextBox.Text = Convert.ToString(house.house_eligibility);
            house_request_date_Delete_TextBox.Text = Convert.ToString(house.house_request_date);
            house_voucher_amt_Delete_TextBox.Text = Convert.ToString(house.house_voucher_amt);
            house_voucher_begin_date_Delete_TextBox.Text = Convert.ToString(house.house_voucher_begin_date);
            house_voucher_exp_date_Delete_TextBox.Text = Convert.ToString(house.house_voucher_exp_date);
            house_voucher_num_Delete_TextBox.Text = Convert.ToString(house.house_voucher_num);
            house_voucher_schedule_Delete_TextBox.Text = Convert.ToString(house.house_voucher_schedule);
            house_wait_list_Delete_TextBox.Text = Convert.ToString(house.house_wait_list);
            return house;
        }
        //Database CRUD Call Functions
        public house house_insert()
        {
            house.house_name = house_name_Insert_TextBox.Text;
            house.house_eligibility = house_eligibility_Insert_TextBox.Text;
            house.house_request_date = Convert.ToDateTime(house_request_date_Insert_TextBox.Text);
            house.house_voucher_amt = Convert.ToDecimal(house_voucher_amt_Insert_TextBox.Text);
            house.house_voucher_begin_date = Convert.ToDateTime(house_voucher_begin_date_Insert_TextBox.Text);
            house.house_voucher_exp_date = Convert.ToDateTime(house_voucher_exp_date_Insert_TextBox.Text);
            house.house_voucher_num = Convert.ToInt32(house_voucher_num_Insert_TextBox.Text);
            house.house_voucher_schedule = house_voucher_schedule_Insert_TextBox.Text;
            house.house_wait_list = Convert.ToInt32(house_wait_list_Insert_TextBox.Text);
            house = house.Insert(house);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return house;
        }
        public house house_update(int ID)
        {
            house = house.Select(ID);
            house.house_id = Convert.ToInt32(Update_GridView.SelectedValue);
            house.house_name = house_name_Update_TextBox.Text;
            house.house_eligibility = house_eligibility_Update_TextBox.Text;
            house.house_request_date = Convert.ToDateTime(house_request_date_Update_TextBox.Text);
            house.house_voucher_amt = Convert.ToDecimal(house_voucher_amt_Update_TextBox.Text);
            house.house_voucher_begin_date = Convert.ToDateTime(house_voucher_begin_date_Update_TextBox.Text);
            house.house_voucher_exp_date = Convert.ToDateTime(house_voucher_exp_date_Update_TextBox.Text);
            house.house_voucher_num = Convert.ToInt32(house_voucher_num_Update_TextBox.Text);
            house.house_voucher_schedule = house_voucher_schedule_Update_TextBox.Text;
            house.house_wait_list = Convert.ToInt32(house_wait_list_Update_TextBox.Text);
            house.Update(house);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return house;
        }
        public void house_delete(int ID)
        {
            house.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            house = house_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            house = house_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            house_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

