using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class campaignClass : System.Web.UI.Page
    {
        public campaign campaign = new campaign();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            campaign = campaign_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            campaign = campaign_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            campaign = campaign_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public campaign campaign_selectForInsert(int ID)
        {
            campaign = campaign.Select(ID);
            campaign_name_Insert_TextBox.Text = Convert.ToString(campaign.campaign_name);
            campaign_start_date_Insert_TextBox.Text = Convert.ToString(campaign.campaign_start_date);
            campaign_end_date_Insert_TextBox.Text = Convert.ToString(campaign.campaign_end_date);
            return campaign;
        }
        public campaign campaign_selectForUpdate(int ID)
        {
            campaign = campaign.Select(ID);
            campaign_id_Update_TextBox.Text = Convert.ToString(campaign.campaign_id);
            campaign_name_Update_TextBox.Text = Convert.ToString(campaign.campaign_name);
            campaign_start_date_Update_TextBox.Text = Convert.ToString(campaign.campaign_start_date);
            campaign_end_date_Update_TextBox.Text = Convert.ToString(campaign.campaign_end_date);
            return campaign;
        }
        public campaign campaign_selectForDelete(int ID)
        {
            campaign = campaign.Select(ID);
            campaign_id_Delete_TextBox.Text = Convert.ToString(campaign.campaign_id);
            campaign_name_Delete_TextBox.Text = Convert.ToString(campaign.campaign_name);
            campaign_start_date_Delete_TextBox.Text = Convert.ToString(campaign.campaign_start_date);
            campaign_end_date_Delete_TextBox.Text = Convert.ToString(campaign.campaign_end_date);
            return campaign;
        }
        //Database CRUD Call Functions
        public campaign campaign_insert()
        {
            campaign.campaign_name = campaign_name_Insert_TextBox.Text;
            campaign.campaign_start_date = Convert.ToDateTime(campaign_start_date_Insert_TextBox.Text);
            campaign.campaign_end_date = Convert.ToDateTime(campaign_end_date_Insert_TextBox.Text);
            campaign = campaign.Insert(campaign);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return campaign;
        }
        public campaign campaign_update(int ID)
        {
            campaign = campaign.Select(ID);
            campaign.campaign_id = Convert.ToInt32(Update_GridView.SelectedValue);
            campaign.campaign_name = campaign_name_Update_TextBox.Text;
            campaign.campaign_start_date = Convert.ToDateTime(campaign_start_date_Update_TextBox.Text);
            campaign.campaign_end_date = Convert.ToDateTime(campaign_end_date_Update_TextBox.Text);
            campaign.Update(campaign);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return campaign;
        }
        public void campaign_delete(int ID)
        {
            campaign.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            campaign = campaign_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            campaign = campaign_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            campaign_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

