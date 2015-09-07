using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class AuthMemberTicketsClass : System.Web.UI.Page
    {
        public AuthMemberTickets AuthMemberTickets = new AuthMemberTickets();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuthMemberTickets = AuthMemberTickets_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuthMemberTickets = AuthMemberTickets_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuthMemberTickets = AuthMemberTickets_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public AuthMemberTickets AuthMemberTickets_selectForInsert(int ID)
        {
            AuthMemberTickets = AuthMemberTickets.Select(ID);
            MemberID_Insert_TextBox.Text = Convert.ToString(AuthMemberTickets.MemberID);
            IssueDate_Insert_TextBox.Text = Convert.ToString(AuthMemberTickets.IssueDate);
            Expiration_Insert_TextBox.Text = Convert.ToString(AuthMemberTickets.Expiration);
            IsPersistent_Insert_TextBox.Text = Convert.ToString(AuthMemberTickets.IsPersistent);
            Token_Insert_TextBox.Text = Convert.ToString(AuthMemberTickets.Token);
            return AuthMemberTickets;
        }
        public AuthMemberTickets AuthMemberTickets_selectForUpdate(int ID)
        {
            AuthMemberTickets = AuthMemberTickets.Select(ID);
            AuthMemberTicketID_Update_TextBox.Text = Convert.ToString(AuthMemberTickets.AuthMemberTicketID);
            MemberID_Update_TextBox.Text = Convert.ToString(AuthMemberTickets.MemberID);
            IssueDate_Update_TextBox.Text = Convert.ToString(AuthMemberTickets.IssueDate);
            Expiration_Update_TextBox.Text = Convert.ToString(AuthMemberTickets.Expiration);
            IsPersistent_Update_TextBox.Text = Convert.ToString(AuthMemberTickets.IsPersistent);
            Token_Update_TextBox.Text = Convert.ToString(AuthMemberTickets.Token);
            return AuthMemberTickets;
        }
        public AuthMemberTickets AuthMemberTickets_selectForDelete(int ID)
        {
            AuthMemberTickets = AuthMemberTickets.Select(ID);
            AuthMemberTicketID_Delete_TextBox.Text = Convert.ToString(AuthMemberTickets.AuthMemberTicketID);
            MemberID_Delete_TextBox.Text = Convert.ToString(AuthMemberTickets.MemberID);
            IssueDate_Delete_TextBox.Text = Convert.ToString(AuthMemberTickets.IssueDate);
            Expiration_Delete_TextBox.Text = Convert.ToString(AuthMemberTickets.Expiration);
            IsPersistent_Delete_TextBox.Text = Convert.ToString(AuthMemberTickets.IsPersistent);
            Token_Delete_TextBox.Text = Convert.ToString(AuthMemberTickets.Token);
            return AuthMemberTickets;
        }
        //Database CRUD Call Functions
        public AuthMemberTickets AuthMemberTickets_insert()
        {
            AuthMemberTickets.IssueDate = Convert.ToDateTime(IssueDate_Insert_TextBox.Text);
            AuthMemberTickets.Expiration = Convert.ToDateTime(Expiration_Insert_TextBox.Text);
            AuthMemberTickets.IsPersistent = Convert.ToInt32(IsPersistent_Insert_TextBox.Text);
            AuthMemberTickets.Token = Token_Insert_TextBox.Text;
            AuthMemberTickets = AuthMemberTickets.Insert(AuthMemberTickets);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuthMemberTickets;
        }
        public AuthMemberTickets AuthMemberTickets_update(int ID)
        {
            AuthMemberTickets = AuthMemberTickets.Select(ID);
            AuthMemberTickets.AuthMemberTicketID = Convert.ToInt32(Update_GridView.SelectedValue);
            AuthMemberTickets.IssueDate = Convert.ToDateTime(IssueDate_Update_TextBox.Text);
            AuthMemberTickets.Expiration = Convert.ToDateTime(Expiration_Update_TextBox.Text);
            AuthMemberTickets.IsPersistent = Convert.ToInt32(IsPersistent_Update_TextBox.Text);
            AuthMemberTickets.Token = Token_Update_TextBox.Text;
            AuthMemberTickets.Update(AuthMemberTickets);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuthMemberTickets;
        }
        public void AuthMemberTickets_delete(int ID)
        {
            AuthMemberTickets.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            AuthMemberTickets = AuthMemberTickets_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            AuthMemberTickets = AuthMemberTickets_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            AuthMemberTickets_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

