using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MembersClass : System.Web.UI.Page
    {
        public Members Members = new Members();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Members = Members_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Members = Members_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Members = Members_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Members Members_selectForInsert(int ID)
        {
            Members = Members.Select(ID);
            Name_Insert_TextBox.Text = Convert.ToString(Members.Name);
            Email_Insert_TextBox.Text = Convert.ToString(Members.Email);
            Password_Insert_TextBox.Text = Convert.ToString(Members.Password);
            Avatar_Insert_TextBox.Text = Convert.ToString(Members.Avatar);
            IsEnable_Insert_TextBox.Text = Convert.ToString(Members.IsEnable);
            IsBuiltIn_Insert_TextBox.Text = Convert.ToString(Members.IsBuiltIn);
            LastLogin_Insert_TextBox.Text = Convert.ToString(Members.LastLogin);
            Created_Insert_TextBox.Text = Convert.ToString(Members.Created);
            Modified_Insert_TextBox.Text = Convert.ToString(Members.Modified);
            TimeZoneID_Insert_TextBox.Text = Convert.ToString(Members.TimeZoneID);
            return Members;
        }
        public Members Members_selectForUpdate(int ID)
        {
            Members = Members.Select(ID);
            MemberID_Update_TextBox.Text = Convert.ToString(Members.MemberID);
            Name_Update_TextBox.Text = Convert.ToString(Members.Name);
            Email_Update_TextBox.Text = Convert.ToString(Members.Email);
            Password_Update_TextBox.Text = Convert.ToString(Members.Password);
            Avatar_Update_TextBox.Text = Convert.ToString(Members.Avatar);
            IsEnable_Update_TextBox.Text = Convert.ToString(Members.IsEnable);
            IsBuiltIn_Update_TextBox.Text = Convert.ToString(Members.IsBuiltIn);
            LastLogin_Update_TextBox.Text = Convert.ToString(Members.LastLogin);
            Created_Update_TextBox.Text = Convert.ToString(Members.Created);
            Modified_Update_TextBox.Text = Convert.ToString(Members.Modified);
            TimeZoneID_Update_TextBox.Text = Convert.ToString(Members.TimeZoneID);
            return Members;
        }
        public Members Members_selectForDelete(int ID)
        {
            Members = Members.Select(ID);
            MemberID_Delete_TextBox.Text = Convert.ToString(Members.MemberID);
            Name_Delete_TextBox.Text = Convert.ToString(Members.Name);
            Email_Delete_TextBox.Text = Convert.ToString(Members.Email);
            Password_Delete_TextBox.Text = Convert.ToString(Members.Password);
            Avatar_Delete_TextBox.Text = Convert.ToString(Members.Avatar);
            IsEnable_Delete_TextBox.Text = Convert.ToString(Members.IsEnable);
            IsBuiltIn_Delete_TextBox.Text = Convert.ToString(Members.IsBuiltIn);
            LastLogin_Delete_TextBox.Text = Convert.ToString(Members.LastLogin);
            Created_Delete_TextBox.Text = Convert.ToString(Members.Created);
            Modified_Delete_TextBox.Text = Convert.ToString(Members.Modified);
            TimeZoneID_Delete_TextBox.Text = Convert.ToString(Members.TimeZoneID);
            return Members;
        }
        //Database CRUD Call Functions
        public Members Members_insert()
        {
            Members.Name = Name_Insert_TextBox.Text;
            Members.Email = Email_Insert_TextBox.Text;
            Members.Password = Password_Insert_TextBox.Text;
            Members.Avatar = Avatar_Insert_TextBox.Text;
            Members.IsEnable = Convert.ToInt32(IsEnable_Insert_TextBox.Text);
            Members.IsBuiltIn = Convert.ToInt32(IsBuiltIn_Insert_TextBox.Text);
            Members.LastLogin = Convert.ToDateTime(LastLogin_Insert_TextBox.Text);
            Members.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            Members.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            Members.TimeZoneID = TimeZoneID_Insert_TextBox.Text;
            Members = Members.Insert(Members);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Members;
        }
        public Members Members_update(int ID)
        {
            Members = Members.Select(ID);
            Members.MemberID = Convert.ToInt32(Update_GridView.SelectedValue);
            Members.Name = Name_Update_TextBox.Text;
            Members.Email = Email_Update_TextBox.Text;
            Members.Password = Password_Update_TextBox.Text;
            Members.Avatar = Avatar_Update_TextBox.Text;
            Members.IsEnable = Convert.ToInt32(IsEnable_Update_TextBox.Text);
            Members.IsBuiltIn = Convert.ToInt32(IsBuiltIn_Update_TextBox.Text);
            Members.LastLogin = Convert.ToDateTime(LastLogin_Update_TextBox.Text);
            Members.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            Members.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            Members.TimeZoneID = TimeZoneID_Update_TextBox.Text;
            Members.Update(Members);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Members;
        }
        public void Members_delete(int ID)
        {
            Members.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Members = Members_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Members = Members_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Members_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

