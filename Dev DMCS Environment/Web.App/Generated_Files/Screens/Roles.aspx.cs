using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class RolesClass : System.Web.UI.Page
    {
        public Roles Roles = new Roles();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Roles = Roles_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Roles = Roles_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Roles = Roles_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Roles Roles_selectForInsert(int ID)
        {
            Roles = Roles.Select(ID);
            Name_Insert_TextBox.Text = Convert.ToString(Roles.Name);
            IsBuiltIn_Insert_TextBox.Text = Convert.ToString(Roles.IsBuiltIn);
            BackColor_Insert_TextBox.Text = Convert.ToString(Roles.BackColor);
            ForeColor_Insert_TextBox.Text = Convert.ToString(Roles.ForeColor);
            Settings_Insert_TextBox.Text = Convert.ToString(Roles.Settings);
            Created_Insert_TextBox.Text = Convert.ToString(Roles.Created);
            Modified_Insert_TextBox.Text = Convert.ToString(Roles.Modified);
            return Roles;
        }
        public Roles Roles_selectForUpdate(int ID)
        {
            Roles = Roles.Select(ID);
            RoleID_Update_TextBox.Text = Convert.ToString(Roles.RoleID);
            Name_Update_TextBox.Text = Convert.ToString(Roles.Name);
            IsBuiltIn_Update_TextBox.Text = Convert.ToString(Roles.IsBuiltIn);
            BackColor_Update_TextBox.Text = Convert.ToString(Roles.BackColor);
            ForeColor_Update_TextBox.Text = Convert.ToString(Roles.ForeColor);
            Settings_Update_TextBox.Text = Convert.ToString(Roles.Settings);
            Created_Update_TextBox.Text = Convert.ToString(Roles.Created);
            Modified_Update_TextBox.Text = Convert.ToString(Roles.Modified);
            return Roles;
        }
        public Roles Roles_selectForDelete(int ID)
        {
            Roles = Roles.Select(ID);
            RoleID_Delete_TextBox.Text = Convert.ToString(Roles.RoleID);
            Name_Delete_TextBox.Text = Convert.ToString(Roles.Name);
            IsBuiltIn_Delete_TextBox.Text = Convert.ToString(Roles.IsBuiltIn);
            BackColor_Delete_TextBox.Text = Convert.ToString(Roles.BackColor);
            ForeColor_Delete_TextBox.Text = Convert.ToString(Roles.ForeColor);
            Settings_Delete_TextBox.Text = Convert.ToString(Roles.Settings);
            Created_Delete_TextBox.Text = Convert.ToString(Roles.Created);
            Modified_Delete_TextBox.Text = Convert.ToString(Roles.Modified);
            return Roles;
        }
        //Database CRUD Call Functions
        public Roles Roles_insert()
        {
            Roles.Name = Name_Insert_TextBox.Text;
            Roles.IsBuiltIn = Convert.ToInt32(IsBuiltIn_Insert_TextBox.Text);
            Roles.BackColor = BackColor_Insert_TextBox.Text;
            Roles.ForeColor = ForeColor_Insert_TextBox.Text;
            Roles.Settings = Settings_Insert_TextBox.Text;
            Roles.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            Roles.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            Roles = Roles.Insert(Roles);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Roles;
        }
        public Roles Roles_update(int ID)
        {
            Roles = Roles.Select(ID);
            Roles.RoleID = Convert.ToInt32(Update_GridView.SelectedValue);
            Roles.Name = Name_Update_TextBox.Text;
            Roles.IsBuiltIn = Convert.ToInt32(IsBuiltIn_Update_TextBox.Text);
            Roles.BackColor = BackColor_Update_TextBox.Text;
            Roles.ForeColor = ForeColor_Update_TextBox.Text;
            Roles.Settings = Settings_Update_TextBox.Text;
            Roles.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            Roles.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            Roles.Update(Roles);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Roles;
        }
        public void Roles_delete(int ID)
        {
            Roles.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Roles = Roles_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Roles = Roles_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Roles_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

