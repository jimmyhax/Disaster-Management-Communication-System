using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MemberSocialNetworksClass : System.Web.UI.Page
    {
        public MemberSocialNetworks MemberSocialNetworks = new MemberSocialNetworks();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberSocialNetworks = MemberSocialNetworks_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberSocialNetworks = MemberSocialNetworks_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberSocialNetworks = MemberSocialNetworks_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public MemberSocialNetworks MemberSocialNetworks_selectForInsert(int ID)
        {
            MemberSocialNetworks = MemberSocialNetworks.Select(ID);
            MemberID_Insert_TextBox.Text = Convert.ToString(MemberSocialNetworks.MemberID);
            SocialNetworkID_Insert_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkID);
            SocialNetworkUserID_Insert_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserID);
            SocialNetworkUserEmail_Insert_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserEmail);
            SocialNetworkUserName_Insert_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserName);
            AccessToken_Insert_TextBox.Text = Convert.ToString(MemberSocialNetworks.AccessToken);
            return MemberSocialNetworks;
        }
        public MemberSocialNetworks MemberSocialNetworks_selectForUpdate(int ID)
        {
            MemberSocialNetworks = MemberSocialNetworks.Select(ID);
            MemberSocialNetworkID_Update_TextBox.Text = Convert.ToString(MemberSocialNetworks.MemberSocialNetworkID);
            MemberID_Update_TextBox.Text = Convert.ToString(MemberSocialNetworks.MemberID);
            SocialNetworkID_Update_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkID);
            SocialNetworkUserID_Update_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserID);
            SocialNetworkUserEmail_Update_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserEmail);
            SocialNetworkUserName_Update_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserName);
            AccessToken_Update_TextBox.Text = Convert.ToString(MemberSocialNetworks.AccessToken);
            return MemberSocialNetworks;
        }
        public MemberSocialNetworks MemberSocialNetworks_selectForDelete(int ID)
        {
            MemberSocialNetworks = MemberSocialNetworks.Select(ID);
            MemberSocialNetworkID_Delete_TextBox.Text = Convert.ToString(MemberSocialNetworks.MemberSocialNetworkID);
            MemberID_Delete_TextBox.Text = Convert.ToString(MemberSocialNetworks.MemberID);
            SocialNetworkID_Delete_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkID);
            SocialNetworkUserID_Delete_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserID);
            SocialNetworkUserEmail_Delete_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserEmail);
            SocialNetworkUserName_Delete_TextBox.Text = Convert.ToString(MemberSocialNetworks.SocialNetworkUserName);
            AccessToken_Delete_TextBox.Text = Convert.ToString(MemberSocialNetworks.AccessToken);
            return MemberSocialNetworks;
        }
        //Database CRUD Call Functions
        public MemberSocialNetworks MemberSocialNetworks_insert()
        {
            MemberSocialNetworks.SocialNetworkID = Convert.ToInt32(SocialNetworkID_Insert_TextBox.Text);
            MemberSocialNetworks.SocialNetworkUserID = SocialNetworkUserID_Insert_TextBox.Text;
            MemberSocialNetworks.SocialNetworkUserEmail = SocialNetworkUserEmail_Insert_TextBox.Text;
            MemberSocialNetworks.SocialNetworkUserName = SocialNetworkUserName_Insert_TextBox.Text;
            MemberSocialNetworks.AccessToken = AccessToken_Insert_TextBox.Text;
            MemberSocialNetworks = MemberSocialNetworks.Insert(MemberSocialNetworks);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberSocialNetworks;
        }
        public MemberSocialNetworks MemberSocialNetworks_update(int ID)
        {
            MemberSocialNetworks = MemberSocialNetworks.Select(ID);
            MemberSocialNetworks.MemberSocialNetworkID = Convert.ToInt32(Update_GridView.SelectedValue);
            MemberSocialNetworks.SocialNetworkID = Convert.ToInt32(SocialNetworkID_Update_TextBox.Text);
            MemberSocialNetworks.SocialNetworkUserID = SocialNetworkUserID_Update_TextBox.Text;
            MemberSocialNetworks.SocialNetworkUserEmail = SocialNetworkUserEmail_Update_TextBox.Text;
            MemberSocialNetworks.SocialNetworkUserName = SocialNetworkUserName_Update_TextBox.Text;
            MemberSocialNetworks.AccessToken = AccessToken_Update_TextBox.Text;
            MemberSocialNetworks.Update(MemberSocialNetworks);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberSocialNetworks;
        }
        public void MemberSocialNetworks_delete(int ID)
        {
            MemberSocialNetworks.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            MemberSocialNetworks = MemberSocialNetworks_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            MemberSocialNetworks = MemberSocialNetworks_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            MemberSocialNetworks_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

