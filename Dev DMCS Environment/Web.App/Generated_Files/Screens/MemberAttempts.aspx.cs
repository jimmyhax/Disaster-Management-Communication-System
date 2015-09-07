using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MemberAttemptsClass : System.Web.UI.Page
    {
        public MemberAttempts MemberAttempts = new MemberAttempts();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberAttempts = MemberAttempts_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberAttempts = MemberAttempts_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberAttempts = MemberAttempts_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public MemberAttempts MemberAttempts_selectForInsert(int ID)
        {
            MemberAttempts = MemberAttempts.Select(ID);
            MemberID_Insert_TextBox.Text = Convert.ToString(MemberAttempts.MemberID);
            AttemptType_Insert_TextBox.Text = Convert.ToString(MemberAttempts.AttemptType);
            Attempts_Insert_TextBox.Text = Convert.ToString(MemberAttempts.Attempts);
            Created_Insert_TextBox.Text = Convert.ToString(MemberAttempts.Created);
            Modified_Insert_TextBox.Text = Convert.ToString(MemberAttempts.Modified);
            IsAttemptValid_Insert_TextBox.Text = Convert.ToString(MemberAttempts.IsAttemptValid);
            return MemberAttempts;
        }
        public MemberAttempts MemberAttempts_selectForUpdate(int ID)
        {
            MemberAttempts = MemberAttempts.Select(ID);
            AttemptID_Update_TextBox.Text = Convert.ToString(MemberAttempts.AttemptID);
            MemberID_Update_TextBox.Text = Convert.ToString(MemberAttempts.MemberID);
            AttemptType_Update_TextBox.Text = Convert.ToString(MemberAttempts.AttemptType);
            Attempts_Update_TextBox.Text = Convert.ToString(MemberAttempts.Attempts);
            Created_Update_TextBox.Text = Convert.ToString(MemberAttempts.Created);
            Modified_Update_TextBox.Text = Convert.ToString(MemberAttempts.Modified);
            IsAttemptValid_Update_TextBox.Text = Convert.ToString(MemberAttempts.IsAttemptValid);
            return MemberAttempts;
        }
        public MemberAttempts MemberAttempts_selectForDelete(int ID)
        {
            MemberAttempts = MemberAttempts.Select(ID);
            AttemptID_Delete_TextBox.Text = Convert.ToString(MemberAttempts.AttemptID);
            MemberID_Delete_TextBox.Text = Convert.ToString(MemberAttempts.MemberID);
            AttemptType_Delete_TextBox.Text = Convert.ToString(MemberAttempts.AttemptType);
            Attempts_Delete_TextBox.Text = Convert.ToString(MemberAttempts.Attempts);
            Created_Delete_TextBox.Text = Convert.ToString(MemberAttempts.Created);
            Modified_Delete_TextBox.Text = Convert.ToString(MemberAttempts.Modified);
            IsAttemptValid_Delete_TextBox.Text = Convert.ToString(MemberAttempts.IsAttemptValid);
            return MemberAttempts;
        }
        //Database CRUD Call Functions
        public MemberAttempts MemberAttempts_insert()
        {
            MemberAttempts.AttemptType = Convert.ToInt32(AttemptType_Insert_TextBox.Text);
            MemberAttempts.Attempts = Convert.ToInt32(Attempts_Insert_TextBox.Text);
            MemberAttempts.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            MemberAttempts.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            MemberAttempts.IsAttemptValid = Convert.ToInt32(IsAttemptValid_Insert_TextBox.Text);
            MemberAttempts = MemberAttempts.Insert(MemberAttempts);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberAttempts;
        }
        public MemberAttempts MemberAttempts_update(int ID)
        {
            MemberAttempts = MemberAttempts.Select(ID);
            MemberAttempts.AttemptID = Convert.ToInt32(Update_GridView.SelectedValue);
            MemberAttempts.AttemptType = Convert.ToInt32(AttemptType_Update_TextBox.Text);
            MemberAttempts.Attempts = Convert.ToInt32(Attempts_Update_TextBox.Text);
            MemberAttempts.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            MemberAttempts.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            MemberAttempts.IsAttemptValid = Convert.ToInt32(IsAttemptValid_Update_TextBox.Text);
            MemberAttempts.Update(MemberAttempts);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberAttempts;
        }
        public void MemberAttempts_delete(int ID)
        {
            MemberAttempts.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            MemberAttempts = MemberAttempts_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            MemberAttempts = MemberAttempts_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            MemberAttempts_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

