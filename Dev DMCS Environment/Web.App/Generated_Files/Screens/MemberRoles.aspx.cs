using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MemberRolesClass : System.Web.UI.Page
    {
        public MemberRoles MemberRoles = new MemberRoles();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberRoles = MemberRoles_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberRoles = MemberRoles_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberRoles = MemberRoles_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public MemberRoles MemberRoles_selectForInsert(int ID)
        {
            MemberRoles = MemberRoles.Select(ID);
            RoleID_Insert_TextBox.Text = Convert.ToString(MemberRoles.RoleID);
            Created_Insert_TextBox.Text = Convert.ToString(MemberRoles.Created);
            return MemberRoles;
        }
        public MemberRoles MemberRoles_selectForUpdate(int ID)
        {
            MemberRoles = MemberRoles.Select(ID);
            MemberID_Update_TextBox.Text = Convert.ToString(MemberRoles.MemberID);
            RoleID_Update_TextBox.Text = Convert.ToString(MemberRoles.RoleID);
            Created_Update_TextBox.Text = Convert.ToString(MemberRoles.Created);
            return MemberRoles;
        }
        public MemberRoles MemberRoles_selectForDelete(int ID)
        {
            MemberRoles = MemberRoles.Select(ID);
            MemberID_Delete_TextBox.Text = Convert.ToString(MemberRoles.MemberID);
            RoleID_Delete_TextBox.Text = Convert.ToString(MemberRoles.RoleID);
            Created_Delete_TextBox.Text = Convert.ToString(MemberRoles.Created);
            return MemberRoles;
        }
        //Database CRUD Call Functions
        public MemberRoles MemberRoles_insert()
        {
            MemberRoles.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            MemberRoles = MemberRoles.Insert(MemberRoles);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberRoles;
        }
        public MemberRoles MemberRoles_update(int ID)
        {
            MemberRoles = MemberRoles.Select(ID);
            MemberRoles.MemberID = Convert.ToInt32(Update_GridView.SelectedValue);
            MemberRoles.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            MemberRoles.Update(MemberRoles);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberRoles;
        }
        public void MemberRoles_delete(int ID)
        {
            MemberRoles.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            MemberRoles = MemberRoles_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            MemberRoles = MemberRoles_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            MemberRoles_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

