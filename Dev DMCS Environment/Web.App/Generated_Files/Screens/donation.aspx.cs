using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class donationClass : System.Web.UI.Page
    {
        public donation donation = new donation();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            donation = donation_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            donation = donation_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            donation = donation_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public donation donation_selectForInsert(int ID)
        {
            donation = donation.Select(ID);
            Receipt_ID_Insert_TextBox.Text = Convert.ToString(donation.Receipt_ID);
            Resource_ID_Insert_TextBox.Text = Convert.ToString(donation.Resource_ID);
            Donor_ID_Insert_TextBox.Text = Convert.ToString(donation.Donor_ID);
            Date_Insert_TextBox.Text = Convert.ToString(donation.Date);
            Quantity_Insert_TextBox.Text = Convert.ToString(donation.Quantity);
            Agency_ID_Insert_TextBox.Text = Convert.ToString(donation.Agency_ID);
            Is_Monetary_Insert_TextBox.Text = Convert.ToString(donation.Is_Monetary);
            Is_FEMA_Insert_TextBox.Text = Convert.ToString(donation.Is_FEMA);
            return donation;
        }
        public donation donation_selectForUpdate(int ID)
        {
            donation = donation.Select(ID);
            Donation_ID_Update_TextBox.Text = Convert.ToString(donation.Donation_ID);
            Receipt_ID_Update_TextBox.Text = Convert.ToString(donation.Receipt_ID);
            Resource_ID_Update_TextBox.Text = Convert.ToString(donation.Resource_ID);
            Donor_ID_Update_TextBox.Text = Convert.ToString(donation.Donor_ID);
            Date_Update_TextBox.Text = Convert.ToString(donation.Date);
            Quantity_Update_TextBox.Text = Convert.ToString(donation.Quantity);
            Agency_ID_Update_TextBox.Text = Convert.ToString(donation.Agency_ID);
            Is_Monetary_Update_TextBox.Text = Convert.ToString(donation.Is_Monetary);
            Is_FEMA_Update_TextBox.Text = Convert.ToString(donation.Is_FEMA);
            return donation;
        }
        public donation donation_selectForDelete(int ID)
        {
            donation = donation.Select(ID);
            Donation_ID_Delete_TextBox.Text = Convert.ToString(donation.Donation_ID);
            Receipt_ID_Delete_TextBox.Text = Convert.ToString(donation.Receipt_ID);
            Resource_ID_Delete_TextBox.Text = Convert.ToString(donation.Resource_ID);
            Donor_ID_Delete_TextBox.Text = Convert.ToString(donation.Donor_ID);
            Date_Delete_TextBox.Text = Convert.ToString(donation.Date);
            Quantity_Delete_TextBox.Text = Convert.ToString(donation.Quantity);
            Agency_ID_Delete_TextBox.Text = Convert.ToString(donation.Agency_ID);
            Is_Monetary_Delete_TextBox.Text = Convert.ToString(donation.Is_Monetary);
            Is_FEMA_Delete_TextBox.Text = Convert.ToString(donation.Is_FEMA);
            return donation;
        }
        //Database CRUD Call Functions
        public donation donation_insert()
        {
            donation.Receipt_ID = Convert.ToInt32(Receipt_ID_Insert_TextBox.Text);
            donation.Resource_ID = Convert.ToInt32(Resource_ID_Insert_TextBox.Text);
            donation.Donor_ID = Convert.ToInt32(Donor_ID_Insert_TextBox.Text);
            donation.Date = Convert.ToDateTime(Date_Insert_TextBox.Text);
            donation.Quantity = Convert.ToInt32(Quantity_Insert_TextBox.Text);
            donation.Agency_ID = Convert.ToInt32(Agency_ID_Insert_TextBox.Text);
            donation.Is_Monetary = Convert.ToBoolean(Is_Monetary_Insert_TextBox.Text);
            donation.Is_FEMA = Convert.ToBoolean(Is_FEMA_Insert_TextBox.Text);
            donation = donation.Insert(donation);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return donation;
        }
        public donation donation_update(int ID)
        {
            donation = donation.Select(ID);
            donation.Donation_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            donation.Receipt_ID = Convert.ToInt32(Receipt_ID_Update_TextBox.Text);
            donation.Resource_ID = Convert.ToInt32(Resource_ID_Update_TextBox.Text);
            donation.Donor_ID = Convert.ToInt32(Donor_ID_Update_TextBox.Text);
            donation.Date = Convert.ToDateTime(Date_Update_TextBox.Text);
            donation.Quantity = Convert.ToInt32(Quantity_Update_TextBox.Text);
            donation.Agency_ID = Convert.ToInt32(Agency_ID_Update_TextBox.Text);
            donation.Is_Monetary = Convert.ToBoolean(Is_Monetary_Update_TextBox.Text);
            donation.Is_FEMA = Convert.ToBoolean(Is_FEMA_Update_TextBox.Text);
            donation.Update(donation);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return donation;
        }
        public void donation_delete(int ID)
        {
            donation.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            donation = donation_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            donation = donation_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            donation_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

