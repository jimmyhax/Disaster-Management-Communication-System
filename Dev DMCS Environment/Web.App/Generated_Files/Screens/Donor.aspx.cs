using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class DonorClass : System.Web.UI.Page
    {
        public Donor Donor = new Donor();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Donor = Donor_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Donor = Donor_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Donor = Donor_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Donor Donor_selectForInsert(int ID)
        {
            Donor = Donor.Select(ID);
            PersonID_Insert_TextBox.Text = Convert.ToString(Donor.PersonID);
            Status_Insert_TextBox.Text = Convert.ToString(Donor.Status);
            DonorType_Insert_TextBox.Text = Convert.ToString(Donor.DonorType);
            AgencyID_Insert_TextBox.Text = Convert.ToString(Donor.AgencyID);
            Phone_Insert_TextBox.Text = Convert.ToString(Donor.Phone);
            return Donor;
        }
        public Donor Donor_selectForUpdate(int ID)
        {
            Donor = Donor.Select(ID);
            donor_id_Update_TextBox.Text = Convert.ToString(Donor.donor_id);
            PersonID_Update_TextBox.Text = Convert.ToString(Donor.PersonID);
            Status_Update_TextBox.Text = Convert.ToString(Donor.Status);
            DonorType_Update_TextBox.Text = Convert.ToString(Donor.DonorType);
            AgencyID_Update_TextBox.Text = Convert.ToString(Donor.AgencyID);
            Phone_Update_TextBox.Text = Convert.ToString(Donor.Phone);
            return Donor;
        }
        public Donor Donor_selectForDelete(int ID)
        {
            Donor = Donor.Select(ID);
            donor_id_Delete_TextBox.Text = Convert.ToString(Donor.donor_id);
            PersonID_Delete_TextBox.Text = Convert.ToString(Donor.PersonID);
            Status_Delete_TextBox.Text = Convert.ToString(Donor.Status);
            DonorType_Delete_TextBox.Text = Convert.ToString(Donor.DonorType);
            AgencyID_Delete_TextBox.Text = Convert.ToString(Donor.AgencyID);
            Phone_Delete_TextBox.Text = Convert.ToString(Donor.Phone);
            return Donor;
        }
        //Database CRUD Call Functions
        public Donor Donor_insert()
        {
            Donor.PersonID = Convert.ToInt32(PersonID_Insert_TextBox.Text);
            Donor.Status = Status_Insert_TextBox.Text;
            Donor.DonorType = DonorType_Insert_TextBox.Text;
            Donor.AgencyID = Convert.ToInt32(AgencyID_Insert_TextBox.Text);
            Donor.Phone = Convert.ToInt32(Phone_Insert_TextBox.Text);
            Donor = Donor.Insert(Donor);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Donor;
        }
        public Donor Donor_update(int ID)
        {
            Donor = Donor.Select(ID);
            Donor.donor_id = Convert.ToInt32(Update_GridView.SelectedValue);
            Donor.PersonID = Convert.ToInt32(PersonID_Update_TextBox.Text);
            Donor.Status = Status_Update_TextBox.Text;
            Donor.DonorType = DonorType_Update_TextBox.Text;
            Donor.AgencyID = Convert.ToInt32(AgencyID_Update_TextBox.Text);
            Donor.Phone = Convert.ToInt32(Phone_Update_TextBox.Text);
            Donor.Update(Donor);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Donor;
        }
        public void Donor_delete(int ID)
        {
            Donor.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Donor = Donor_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Donor = Donor_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Donor_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

