using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class agencyClass : System.Web.UI.Page
    {
        public agency agency = new agency();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            agency = agency_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            agency = agency_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            agency = agency_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public agency agency_selectForInsert(int ID)
        {
            agency = agency.Select(ID);
            address_id_Insert_TextBox.Text = Convert.ToString(agency.address_id);
            agency_name_Insert_TextBox.Text = Convert.ToString(agency.agency_name);
            primary_fName_Insert_TextBox.Text = Convert.ToString(agency.primary_fName);
            primary_lName_Insert_TextBox.Text = Convert.ToString(agency.primary_lName);
            primary_phone_Insert_TextBox.Text = Convert.ToString(agency.primary_phone);
            sec_fName_Insert_TextBox.Text = Convert.ToString(agency.sec_fName);
            sec_lName_Insert_TextBox.Text = Convert.ToString(agency.sec_lName);
            sec_phone_Insert_TextBox.Text = Convert.ToString(agency.sec_phone);
            return agency;
        }
        public agency agency_selectForUpdate(int ID)
        {
            agency = agency.Select(ID);
            agency_id_Update_TextBox.Text = Convert.ToString(agency.agency_id);
            address_id_Update_TextBox.Text = Convert.ToString(agency.address_id);
            agency_name_Update_TextBox.Text = Convert.ToString(agency.agency_name);
            primary_fName_Update_TextBox.Text = Convert.ToString(agency.primary_fName);
            primary_lName_Update_TextBox.Text = Convert.ToString(agency.primary_lName);
            primary_phone_Update_TextBox.Text = Convert.ToString(agency.primary_phone);
            sec_fName_Update_TextBox.Text = Convert.ToString(agency.sec_fName);
            sec_lName_Update_TextBox.Text = Convert.ToString(agency.sec_lName);
            sec_phone_Update_TextBox.Text = Convert.ToString(agency.sec_phone);
            return agency;
        }
        public agency agency_selectForDelete(int ID)
        {
            agency = agency.Select(ID);
            agency_id_Delete_TextBox.Text = Convert.ToString(agency.agency_id);
            address_id_Delete_TextBox.Text = Convert.ToString(agency.address_id);
            agency_name_Delete_TextBox.Text = Convert.ToString(agency.agency_name);
            primary_fName_Delete_TextBox.Text = Convert.ToString(agency.primary_fName);
            primary_lName_Delete_TextBox.Text = Convert.ToString(agency.primary_lName);
            primary_phone_Delete_TextBox.Text = Convert.ToString(agency.primary_phone);
            sec_fName_Delete_TextBox.Text = Convert.ToString(agency.sec_fName);
            sec_lName_Delete_TextBox.Text = Convert.ToString(agency.sec_lName);
            sec_phone_Delete_TextBox.Text = Convert.ToString(agency.sec_phone);
            return agency;
        }
        //Database CRUD Call Functions
        public agency agency_insert()
        {
            agency.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            agency.agency_name = agency_name_Insert_TextBox.Text;
            agency.primary_fName = primary_fName_Insert_TextBox.Text;
            agency.primary_lName = primary_lName_Insert_TextBox.Text;
            agency.primary_phone = primary_phone_Insert_TextBox.Text;
            agency.sec_fName = sec_fName_Insert_TextBox.Text;
            agency.sec_lName = sec_lName_Insert_TextBox.Text;
            agency.sec_phone = sec_phone_Insert_TextBox.Text;
            agency = agency.Insert(agency);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return agency;
        }
        public agency agency_update(int ID)
        {
            agency = agency.Select(ID);
            agency.agency_id = Convert.ToInt32(Update_GridView.SelectedValue);
            agency.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            agency.agency_name = agency_name_Update_TextBox.Text;
            agency.primary_fName = primary_fName_Update_TextBox.Text;
            agency.primary_lName = primary_lName_Update_TextBox.Text;
            agency.primary_phone = primary_phone_Update_TextBox.Text;
            agency.sec_fName = sec_fName_Update_TextBox.Text;
            agency.sec_lName = sec_lName_Update_TextBox.Text;
            agency.sec_phone = sec_phone_Update_TextBox.Text;
            agency.Update(agency);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return agency;
        }
        public void agency_delete(int ID)
        {
            agency.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            agency = agency_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            agency = agency_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            agency_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

