using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ActionTokensClass : System.Web.UI.Page
    {
        public ActionTokens ActionTokens = new ActionTokens();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ActionTokens = ActionTokens_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ActionTokens = ActionTokens_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ActionTokens = ActionTokens_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public ActionTokens ActionTokens_selectForInsert(int ID)
        {
            ActionTokens = ActionTokens.Select(ID);
            ActionType_Insert_TextBox.Text = Convert.ToString(ActionTokens.ActionType);
            Token_Insert_TextBox.Text = Convert.ToString(ActionTokens.Token);
            Email_Insert_TextBox.Text = Convert.ToString(ActionTokens.Email);
            Created_Insert_TextBox.Text = Convert.ToString(ActionTokens.Created);
            ReturnURL_Insert_TextBox.Text = Convert.ToString(ActionTokens.ReturnURL);
            return ActionTokens;
        }
        public ActionTokens ActionTokens_selectForUpdate(int ID)
        {
            ActionTokens = ActionTokens.Select(ID);
            ActionID_Update_TextBox.Text = Convert.ToString(ActionTokens.ActionID);
            ActionType_Update_TextBox.Text = Convert.ToString(ActionTokens.ActionType);
            Token_Update_TextBox.Text = Convert.ToString(ActionTokens.Token);
            Email_Update_TextBox.Text = Convert.ToString(ActionTokens.Email);
            Created_Update_TextBox.Text = Convert.ToString(ActionTokens.Created);
            ReturnURL_Update_TextBox.Text = Convert.ToString(ActionTokens.ReturnURL);
            return ActionTokens;
        }
        public ActionTokens ActionTokens_selectForDelete(int ID)
        {
            ActionTokens = ActionTokens.Select(ID);
            ActionID_Delete_TextBox.Text = Convert.ToString(ActionTokens.ActionID);
            ActionType_Delete_TextBox.Text = Convert.ToString(ActionTokens.ActionType);
            Token_Delete_TextBox.Text = Convert.ToString(ActionTokens.Token);
            Email_Delete_TextBox.Text = Convert.ToString(ActionTokens.Email);
            Created_Delete_TextBox.Text = Convert.ToString(ActionTokens.Created);
            ReturnURL_Delete_TextBox.Text = Convert.ToString(ActionTokens.ReturnURL);
            return ActionTokens;
        }
        //Database CRUD Call Functions
        public ActionTokens ActionTokens_insert()
        {
            ActionTokens.ActionType = Convert.ToInt32(ActionType_Insert_TextBox.Text);
            ActionTokens.Token = Token_Insert_TextBox.Text;
            ActionTokens.Email = Email_Insert_TextBox.Text;
            ActionTokens.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            ActionTokens.ReturnURL = ReturnURL_Insert_TextBox.Text;
            ActionTokens = ActionTokens.Insert(ActionTokens);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ActionTokens;
        }
        public ActionTokens ActionTokens_update(int ID)
        {
            ActionTokens = ActionTokens.Select(ID);
            ActionTokens.ActionID = Convert.ToInt32(Update_GridView.SelectedValue);
            ActionTokens.ActionType = Convert.ToInt32(ActionType_Update_TextBox.Text);
            ActionTokens.Token = Token_Update_TextBox.Text;
            ActionTokens.Email = Email_Update_TextBox.Text;
            ActionTokens.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            ActionTokens.ReturnURL = ReturnURL_Update_TextBox.Text;
            ActionTokens.Update(ActionTokens);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ActionTokens;
        }
        public void ActionTokens_delete(int ID)
        {
            ActionTokens.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            ActionTokens = ActionTokens_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            ActionTokens = ActionTokens_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            ActionTokens_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

