using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Pet_MissingClass : System.Web.UI.Page
    {
        public Pet_Missing Pet_Missing = new Pet_Missing();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Missing = Pet_Missing_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Missing = Pet_Missing_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Missing = Pet_Missing_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Pet_Missing Pet_Missing_selectForInsert(int ID)
        {
            Pet_Missing = Pet_Missing.Select(ID);
            Last_Known_Location_ID_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Last_Known_Location_ID);
            Date_Missing_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Date_Missing);
            Date_Reported_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Date_Reported);
            Collar_Description_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Collar_Description);
            Time_Lost_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Time_Lost);
            Lost_Explanation_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Lost_Explanation);
            Length_Owned_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Length_Owned);
            Reward_Amt_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Reward_Amt);
            Breeder_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Breeder);
            Date_Created_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Date_Created);
            Date_Modified_Insert_TextBox.Text = Convert.ToString(Pet_Missing.Date_Modified);
            return Pet_Missing;
        }
        public Pet_Missing Pet_Missing_selectForUpdate(int ID)
        {
            Pet_Missing = Pet_Missing.Select(ID);
            Pet_Missing_ID_Update_TextBox.Text = Convert.ToString(Pet_Missing.Pet_Missing_ID);
            Last_Known_Location_ID_Update_TextBox.Text = Convert.ToString(Pet_Missing.Last_Known_Location_ID);
            Date_Missing_Update_TextBox.Text = Convert.ToString(Pet_Missing.Date_Missing);
            Date_Reported_Update_TextBox.Text = Convert.ToString(Pet_Missing.Date_Reported);
            Collar_Description_Update_TextBox.Text = Convert.ToString(Pet_Missing.Collar_Description);
            Time_Lost_Update_TextBox.Text = Convert.ToString(Pet_Missing.Time_Lost);
            Lost_Explanation_Update_TextBox.Text = Convert.ToString(Pet_Missing.Lost_Explanation);
            Length_Owned_Update_TextBox.Text = Convert.ToString(Pet_Missing.Length_Owned);
            Reward_Amt_Update_TextBox.Text = Convert.ToString(Pet_Missing.Reward_Amt);
            Breeder_Update_TextBox.Text = Convert.ToString(Pet_Missing.Breeder);
            Date_Created_Update_TextBox.Text = Convert.ToString(Pet_Missing.Date_Created);
            Date_Modified_Update_TextBox.Text = Convert.ToString(Pet_Missing.Date_Modified);
            return Pet_Missing;
        }
        public Pet_Missing Pet_Missing_selectForDelete(int ID)
        {
            Pet_Missing = Pet_Missing.Select(ID);
            Pet_Missing_ID_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Pet_Missing_ID);
            Last_Known_Location_ID_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Last_Known_Location_ID);
            Date_Missing_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Date_Missing);
            Date_Reported_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Date_Reported);
            Collar_Description_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Collar_Description);
            Time_Lost_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Time_Lost);
            Lost_Explanation_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Lost_Explanation);
            Length_Owned_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Length_Owned);
            Reward_Amt_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Reward_Amt);
            Breeder_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Breeder);
            Date_Created_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Date_Created);
            Date_Modified_Delete_TextBox.Text = Convert.ToString(Pet_Missing.Date_Modified);
            return Pet_Missing;
        }
        //Database CRUD Call Functions
        public Pet_Missing Pet_Missing_insert()
        {
            Pet_Missing.Last_Known_Location_ID = Convert.ToInt32(Last_Known_Location_ID_Insert_TextBox.Text);
            Pet_Missing.Date_Missing = Convert.ToDateTime(Date_Missing_Insert_TextBox.Text);
            Pet_Missing.Date_Reported = Convert.ToDateTime(Date_Reported_Insert_TextBox.Text);
            Pet_Missing.Collar_Description = Collar_Description_Insert_TextBox.Text;
            Pet_Missing.Time_Lost = Convert.ToDateTime(Time_Lost_Insert_TextBox.Text);
            Pet_Missing.Lost_Explanation = Lost_Explanation_Insert_TextBox.Text;
            Pet_Missing.Length_Owned = Convert.ToInt32(Length_Owned_Insert_TextBox.Text);
            Pet_Missing.Reward_Amt = Convert.ToDecimal(Reward_Amt_Insert_TextBox.Text);
            Pet_Missing.Breeder = Breeder_Insert_TextBox.Text;
            Pet_Missing.Date_Created = Convert.ToDateTime(Date_Created_Insert_TextBox.Text);
            Pet_Missing.Date_Modified = Convert.ToDateTime(Date_Modified_Insert_TextBox.Text);
            Pet_Missing = Pet_Missing.Insert(Pet_Missing);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Missing;
        }
        public Pet_Missing Pet_Missing_update(int ID)
        {
            Pet_Missing = Pet_Missing.Select(ID);
            Pet_Missing.Pet_Missing_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Pet_Missing.Last_Known_Location_ID = Convert.ToInt32(Last_Known_Location_ID_Update_TextBox.Text);
            Pet_Missing.Date_Missing = Convert.ToDateTime(Date_Missing_Update_TextBox.Text);
            Pet_Missing.Date_Reported = Convert.ToDateTime(Date_Reported_Update_TextBox.Text);
            Pet_Missing.Collar_Description = Collar_Description_Update_TextBox.Text;
            Pet_Missing.Time_Lost = Convert.ToDateTime(Time_Lost_Update_TextBox.Text);
            Pet_Missing.Lost_Explanation = Lost_Explanation_Update_TextBox.Text;
            Pet_Missing.Length_Owned = Convert.ToInt32(Length_Owned_Update_TextBox.Text);
            Pet_Missing.Reward_Amt = Convert.ToDecimal(Reward_Amt_Update_TextBox.Text);
            Pet_Missing.Breeder = Breeder_Update_TextBox.Text;
            Pet_Missing.Date_Created = Convert.ToDateTime(Date_Created_Update_TextBox.Text);
            Pet_Missing.Date_Modified = Convert.ToDateTime(Date_Modified_Update_TextBox.Text);
            Pet_Missing.Update(Pet_Missing);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Missing;
        }
        public void Pet_Missing_delete(int ID)
        {
            Pet_Missing.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Pet_Missing = Pet_Missing_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Pet_Missing = Pet_Missing_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Pet_Missing_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

