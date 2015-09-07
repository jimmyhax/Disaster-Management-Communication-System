using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MemberTokensClass : System.Web.UI.Page
    {
        public MemberTokens MemberTokens = new MemberTokens();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberTokens = MemberTokens_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberTokens = MemberTokens_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberTokens = MemberTokens_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public MemberTokens MemberTokens_selectForInsert(int ID)
        {
            MemberTokens = MemberTokens.Select(ID);
            MemberID_Insert_TextBox.Text = Convert.ToString(MemberTokens.MemberID);
            Token_Insert_TextBox.Text = Convert.ToString(MemberTokens.Token);
            GeneratedBy_Insert_TextBox.Text = Convert.ToString(MemberTokens.GeneratedBy);
            Created_Insert_TextBox.Text = Convert.ToString(MemberTokens.Created);
            Modified_Insert_TextBox.Text = Convert.ToString(MemberTokens.Modified);
            return MemberTokens;
        }
        public MemberTokens MemberTokens_selectForUpdate(int ID)
        {
            MemberTokens = MemberTokens.Select(ID);
            MemberTokenID_Update_TextBox.Text = Convert.ToString(MemberTokens.MemberTokenID);
            MemberID_Update_TextBox.Text = Convert.ToString(MemberTokens.MemberID);
            Token_Update_TextBox.Text = Convert.ToString(MemberTokens.Token);
            GeneratedBy_Update_TextBox.Text = Convert.ToString(MemberTokens.GeneratedBy);
            Created_Update_TextBox.Text = Convert.ToString(MemberTokens.Created);
            Modified_Update_TextBox.Text = Convert.ToString(MemberTokens.Modified);
            return MemberTokens;
        }
        public MemberTokens MemberTokens_selectForDelete(int ID)
        {
            MemberTokens = MemberTokens.Select(ID);
            MemberTokenID_Delete_TextBox.Text = Convert.ToString(MemberTokens.MemberTokenID);
            MemberID_Delete_TextBox.Text = Convert.ToString(MemberTokens.MemberID);
            Token_Delete_TextBox.Text = Convert.ToString(MemberTokens.Token);
            GeneratedBy_Delete_TextBox.Text = Convert.ToString(MemberTokens.GeneratedBy);
            Created_Delete_TextBox.Text = Convert.ToString(MemberTokens.Created);
            Modified_Delete_TextBox.Text = Convert.ToString(MemberTokens.Modified);
            return MemberTokens;
        }
        //Database CRUD Call Functions
        public MemberTokens MemberTokens_insert()
        {
            MemberTokens.Token = Token_Insert_TextBox.Text;
            MemberTokens.GeneratedBy = GeneratedBy_Insert_TextBox.Text;
            MemberTokens.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            MemberTokens.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            MemberTokens = MemberTokens.Insert(MemberTokens);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberTokens;
        }
        public MemberTokens MemberTokens_update(int ID)
        {
            MemberTokens = MemberTokens.Select(ID);
            MemberTokens.MemberTokenID = Convert.ToInt32(Update_GridView.SelectedValue);
            MemberTokens.Token = Token_Update_TextBox.Text;
            MemberTokens.GeneratedBy = GeneratedBy_Update_TextBox.Text;
            MemberTokens.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            MemberTokens.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            MemberTokens.Update(MemberTokens);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberTokens;
        }
        public void MemberTokens_delete(int ID)
        {
            MemberTokens.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            MemberTokens = MemberTokens_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            MemberTokens = MemberTokens_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            MemberTokens_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

