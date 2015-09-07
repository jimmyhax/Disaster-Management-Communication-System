using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class tierClass : System.Web.UI.Page
    {
        public tier tier = new tier();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            tier = tier_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            tier = tier_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            tier = tier_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public tier tier_selectForInsert(int ID)
        {
            tier = tier.Select(ID);
            include_req_Insert_TextBox.Text = Convert.ToString(tier.include_req);
            campaign_id_Insert_TextBox.Text = Convert.ToString(tier.campaign_id);
            Tier_Age_Begin_Month_Insert_TextBox.Text = Convert.ToString(tier.Tier_Age_Begin_Month);
            Tier_Age_Begin_Year_Insert_TextBox.Text = Convert.ToString(tier.Tier_Age_Begin_Year);
            Tier_Age_End_Month_Insert_TextBox.Text = Convert.ToString(tier.Tier_Age_End_Month);
            Tier_Age_End_Year_Insert_TextBox.Text = Convert.ToString(tier.Tier_Age_End_Year);
            return tier;
        }
        public tier tier_selectForUpdate(int ID)
        {
            tier = tier.Select(ID);
            tier_id_Update_TextBox.Text = Convert.ToString(tier.tier_id);
            include_req_Update_TextBox.Text = Convert.ToString(tier.include_req);
            campaign_id_Update_TextBox.Text = Convert.ToString(tier.campaign_id);
            Tier_Age_Begin_Month_Update_TextBox.Text = Convert.ToString(tier.Tier_Age_Begin_Month);
            Tier_Age_Begin_Year_Update_TextBox.Text = Convert.ToString(tier.Tier_Age_Begin_Year);
            Tier_Age_End_Month_Update_TextBox.Text = Convert.ToString(tier.Tier_Age_End_Month);
            Tier_Age_End_Year_Update_TextBox.Text = Convert.ToString(tier.Tier_Age_End_Year);
            return tier;
        }
        public tier tier_selectForDelete(int ID)
        {
            tier = tier.Select(ID);
            tier_id_Delete_TextBox.Text = Convert.ToString(tier.tier_id);
            include_req_Delete_TextBox.Text = Convert.ToString(tier.include_req);
            campaign_id_Delete_TextBox.Text = Convert.ToString(tier.campaign_id);
            Tier_Age_Begin_Month_Delete_TextBox.Text = Convert.ToString(tier.Tier_Age_Begin_Month);
            Tier_Age_Begin_Year_Delete_TextBox.Text = Convert.ToString(tier.Tier_Age_Begin_Year);
            Tier_Age_End_Month_Delete_TextBox.Text = Convert.ToString(tier.Tier_Age_End_Month);
            Tier_Age_End_Year_Delete_TextBox.Text = Convert.ToString(tier.Tier_Age_End_Year);
            return tier;
        }
        //Database CRUD Call Functions
        public tier tier_insert()
        {
            tier.include_req = include_req_Insert_TextBox.Text;
            tier.campaign_id = Convert.ToInt32(campaign_id_Insert_TextBox.Text);
            tier.Tier_Age_Begin_Month = Convert.ToInt32(Tier_Age_Begin_Month_Insert_TextBox.Text);
            tier.Tier_Age_Begin_Year = Convert.ToInt32(Tier_Age_Begin_Year_Insert_TextBox.Text);
            tier.Tier_Age_End_Month = Convert.ToInt32(Tier_Age_End_Month_Insert_TextBox.Text);
            tier.Tier_Age_End_Year = Convert.ToInt32(Tier_Age_End_Year_Insert_TextBox.Text);
            tier = tier.Insert(tier);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return tier;
        }
        public tier tier_update(int ID)
        {
            tier = tier.Select(ID);
            tier.tier_id = Convert.ToInt32(Update_GridView.SelectedValue);
            tier.include_req = include_req_Update_TextBox.Text;
            tier.campaign_id = Convert.ToInt32(campaign_id_Update_TextBox.Text);
            tier.Tier_Age_Begin_Month = Convert.ToInt32(Tier_Age_Begin_Month_Update_TextBox.Text);
            tier.Tier_Age_Begin_Year = Convert.ToInt32(Tier_Age_Begin_Year_Update_TextBox.Text);
            tier.Tier_Age_End_Month = Convert.ToInt32(Tier_Age_End_Month_Update_TextBox.Text);
            tier.Tier_Age_End_Year = Convert.ToInt32(Tier_Age_End_Year_Update_TextBox.Text);
            tier.Update(tier);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return tier;
        }
        public void tier_delete(int ID)
        {
            tier.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            tier = tier_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            tier = tier_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            tier_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

