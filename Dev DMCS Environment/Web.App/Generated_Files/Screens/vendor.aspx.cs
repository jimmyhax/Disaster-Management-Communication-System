using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class vendorClass : System.Web.UI.Page
    {
        public vendor vendor = new vendor();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vendor = vendor_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vendor = vendor_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            vendor = vendor_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public vendor vendor_selectForInsert(int ID)
        {
            vendor = vendor.Select(ID);
            vendor_name_Insert_TextBox.Text = Convert.ToString(vendor.vendor_name);
            phone_num_Insert_TextBox.Text = Convert.ToString(vendor.phone_num);
            email_Insert_TextBox.Text = Convert.ToString(vendor.email);
            address_id_Insert_TextBox.Text = Convert.ToString(vendor.address_id);
            Vendor_address2_Insert_TextBox.Text = Convert.ToString(vendor.Vendor_address2);
            vendor_job_assign_Insert_TextBox.Text = Convert.ToString(vendor.vendor_job_assign);
            vendor_start_date_Insert_TextBox.Text = Convert.ToString(vendor.vendor_start_date);
            vendor_end_date_Insert_TextBox.Text = Convert.ToString(vendor.vendor_end_date);
            vendor_meth_of_contact_Insert_TextBox.Text = Convert.ToString(vendor.vendor_meth_of_contact);
            vendor_status_Insert_TextBox.Text = Convert.ToString(vendor.vendor_status);
            vendor_meth_of_pay_Insert_TextBox.Text = Convert.ToString(vendor.vendor_meth_of_pay);
            vendor_type_Insert_TextBox.Text = Convert.ToString(vendor.vendor_type);
            vendor_comments_Insert_TextBox.Text = Convert.ToString(vendor.vendor_comments);
            primary_fName_Insert_TextBox.Text = Convert.ToString(vendor.primary_fName);
            primary_lName_Insert_TextBox.Text = Convert.ToString(vendor.primary_lName);
            primary_phone_Insert_TextBox.Text = Convert.ToString(vendor.primary_phone);
            sec_fName_Insert_TextBox.Text = Convert.ToString(vendor.sec_fName);
            sec_lName_Insert_TextBox.Text = Convert.ToString(vendor.sec_lName);
            sec_phone_Insert_TextBox.Text = Convert.ToString(vendor.sec_phone);
            return vendor;
        }
        public vendor vendor_selectForUpdate(int ID)
        {
            vendor = vendor.Select(ID);
            vendor_id_Update_TextBox.Text = Convert.ToString(vendor.vendor_id);
            vendor_name_Update_TextBox.Text = Convert.ToString(vendor.vendor_name);
            phone_num_Update_TextBox.Text = Convert.ToString(vendor.phone_num);
            email_Update_TextBox.Text = Convert.ToString(vendor.email);
            address_id_Update_TextBox.Text = Convert.ToString(vendor.address_id);
            Vendor_address2_Update_TextBox.Text = Convert.ToString(vendor.Vendor_address2);
            vendor_job_assign_Update_TextBox.Text = Convert.ToString(vendor.vendor_job_assign);
            vendor_start_date_Update_TextBox.Text = Convert.ToString(vendor.vendor_start_date);
            vendor_end_date_Update_TextBox.Text = Convert.ToString(vendor.vendor_end_date);
            vendor_meth_of_contact_Update_TextBox.Text = Convert.ToString(vendor.vendor_meth_of_contact);
            vendor_status_Update_TextBox.Text = Convert.ToString(vendor.vendor_status);
            vendor_meth_of_pay_Update_TextBox.Text = Convert.ToString(vendor.vendor_meth_of_pay);
            vendor_type_Update_TextBox.Text = Convert.ToString(vendor.vendor_type);
            vendor_comments_Update_TextBox.Text = Convert.ToString(vendor.vendor_comments);
            primary_fName_Update_TextBox.Text = Convert.ToString(vendor.primary_fName);
            primary_lName_Update_TextBox.Text = Convert.ToString(vendor.primary_lName);
            primary_phone_Update_TextBox.Text = Convert.ToString(vendor.primary_phone);
            sec_fName_Update_TextBox.Text = Convert.ToString(vendor.sec_fName);
            sec_lName_Update_TextBox.Text = Convert.ToString(vendor.sec_lName);
            sec_phone_Update_TextBox.Text = Convert.ToString(vendor.sec_phone);
            return vendor;
        }
        public vendor vendor_selectForDelete(int ID)
        {
            vendor = vendor.Select(ID);
            vendor_id_Delete_TextBox.Text = Convert.ToString(vendor.vendor_id);
            vendor_name_Delete_TextBox.Text = Convert.ToString(vendor.vendor_name);
            phone_num_Delete_TextBox.Text = Convert.ToString(vendor.phone_num);
            email_Delete_TextBox.Text = Convert.ToString(vendor.email);
            address_id_Delete_TextBox.Text = Convert.ToString(vendor.address_id);
            Vendor_address2_Delete_TextBox.Text = Convert.ToString(vendor.Vendor_address2);
            vendor_job_assign_Delete_TextBox.Text = Convert.ToString(vendor.vendor_job_assign);
            vendor_start_date_Delete_TextBox.Text = Convert.ToString(vendor.vendor_start_date);
            vendor_end_date_Delete_TextBox.Text = Convert.ToString(vendor.vendor_end_date);
            vendor_meth_of_contact_Delete_TextBox.Text = Convert.ToString(vendor.vendor_meth_of_contact);
            vendor_status_Delete_TextBox.Text = Convert.ToString(vendor.vendor_status);
            vendor_meth_of_pay_Delete_TextBox.Text = Convert.ToString(vendor.vendor_meth_of_pay);
            vendor_type_Delete_TextBox.Text = Convert.ToString(vendor.vendor_type);
            vendor_comments_Delete_TextBox.Text = Convert.ToString(vendor.vendor_comments);
            primary_fName_Delete_TextBox.Text = Convert.ToString(vendor.primary_fName);
            primary_lName_Delete_TextBox.Text = Convert.ToString(vendor.primary_lName);
            primary_phone_Delete_TextBox.Text = Convert.ToString(vendor.primary_phone);
            sec_fName_Delete_TextBox.Text = Convert.ToString(vendor.sec_fName);
            sec_lName_Delete_TextBox.Text = Convert.ToString(vendor.sec_lName);
            sec_phone_Delete_TextBox.Text = Convert.ToString(vendor.sec_phone);
            return vendor;
        }
        //Database CRUD Call Functions
        public vendor vendor_insert()
        {
            vendor.vendor_name = vendor_name_Insert_TextBox.Text;
            vendor.phone_num = phone_num_Insert_TextBox.Text;
            vendor.email = email_Insert_TextBox.Text;
            vendor.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            vendor.Vendor_address2 = Convert.ToInt32(Vendor_address2_Insert_TextBox.Text);
            vendor.vendor_job_assign = vendor_job_assign_Insert_TextBox.Text;
            vendor.vendor_start_date = Convert.ToDateTime(vendor_start_date_Insert_TextBox.Text);
            vendor.vendor_end_date = Convert.ToDateTime(vendor_end_date_Insert_TextBox.Text);
            vendor.vendor_meth_of_contact = vendor_meth_of_contact_Insert_TextBox.Text;
            vendor.vendor_status = vendor_status_Insert_TextBox.Text;
            vendor.vendor_meth_of_pay = vendor_meth_of_pay_Insert_TextBox.Text;
            vendor.vendor_type = vendor_type_Insert_TextBox.Text;
            vendor.vendor_comments = vendor_comments_Insert_TextBox.Text;
            vendor.primary_fName = primary_fName_Insert_TextBox.Text;
            vendor.primary_lName = primary_lName_Insert_TextBox.Text;
            vendor.primary_phone = primary_phone_Insert_TextBox.Text;
            vendor.sec_fName = sec_fName_Insert_TextBox.Text;
            vendor.sec_lName = sec_lName_Insert_TextBox.Text;
            vendor.sec_phone = sec_phone_Insert_TextBox.Text;
            vendor = vendor.Insert(vendor);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vendor;
        }
        public vendor vendor_update(int ID)
        {
            vendor = vendor.Select(ID);
            vendor.vendor_id = Convert.ToInt32(Update_GridView.SelectedValue);
            vendor.vendor_name = vendor_name_Update_TextBox.Text;
            vendor.phone_num = phone_num_Update_TextBox.Text;
            vendor.email = email_Update_TextBox.Text;
            vendor.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            vendor.Vendor_address2 = Convert.ToInt32(Vendor_address2_Update_TextBox.Text);
            vendor.vendor_job_assign = vendor_job_assign_Update_TextBox.Text;
            vendor.vendor_start_date = Convert.ToDateTime(vendor_start_date_Update_TextBox.Text);
            vendor.vendor_end_date = Convert.ToDateTime(vendor_end_date_Update_TextBox.Text);
            vendor.vendor_meth_of_contact = vendor_meth_of_contact_Update_TextBox.Text;
            vendor.vendor_status = vendor_status_Update_TextBox.Text;
            vendor.vendor_meth_of_pay = vendor_meth_of_pay_Update_TextBox.Text;
            vendor.vendor_type = vendor_type_Update_TextBox.Text;
            vendor.vendor_comments = vendor_comments_Update_TextBox.Text;
            vendor.primary_fName = primary_fName_Update_TextBox.Text;
            vendor.primary_lName = primary_lName_Update_TextBox.Text;
            vendor.primary_phone = primary_phone_Update_TextBox.Text;
            vendor.sec_fName = sec_fName_Update_TextBox.Text;
            vendor.sec_lName = sec_lName_Update_TextBox.Text;
            vendor.sec_phone = sec_phone_Update_TextBox.Text;
            vendor.Update(vendor);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return vendor;
        }
        public void vendor_delete(int ID)
        {
            vendor.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            vendor = vendor_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            vendor = vendor_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            vendor_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

