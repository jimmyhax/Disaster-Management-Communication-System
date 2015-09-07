using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MemberAttemptTypesClass : System.Web.UI.Page
    {
        public MemberAttemptTypes MemberAttemptTypes = new MemberAttemptTypes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberAttemptTypes = MemberAttemptTypes_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberAttemptTypes = MemberAttemptTypes_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberAttemptTypes = MemberAttemptTypes_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public MemberAttemptTypes MemberAttemptTypes_selectForInsert(int ID)
        {
            MemberAttemptTypes = MemberAttemptTypes.Select(ID);
            AttemptTypeDescription_Insert_TextBox.Text = Convert.ToString(MemberAttemptTypes.AttemptTypeDescription);
            return MemberAttemptTypes;
        }
        public MemberAttemptTypes MemberAttemptTypes_selectForUpdate(int ID)
        {
            MemberAttemptTypes = MemberAttemptTypes.Select(ID);
            MemberAttemptTypeID_Update_TextBox.Text = Convert.ToString(MemberAttemptTypes.MemberAttemptTypeID);
            AttemptTypeDescription_Update_TextBox.Text = Convert.ToString(MemberAttemptTypes.AttemptTypeDescription);
            return MemberAttemptTypes;
        }
        public MemberAttemptTypes MemberAttemptTypes_selectForDelete(int ID)
        {
            MemberAttemptTypes = MemberAttemptTypes.Select(ID);
            MemberAttemptTypeID_Delete_TextBox.Text = Convert.ToString(MemberAttemptTypes.MemberAttemptTypeID);
            AttemptTypeDescription_Delete_TextBox.Text = Convert.ToString(MemberAttemptTypes.AttemptTypeDescription);
            return MemberAttemptTypes;
        }
        //Database CRUD Call Functions
        public MemberAttemptTypes MemberAttemptTypes_insert()
        {
            MemberAttemptTypes.AttemptTypeDescription = AttemptTypeDescription_Insert_TextBox.Text;
            MemberAttemptTypes = MemberAttemptTypes.Insert(MemberAttemptTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberAttemptTypes;
        }
        public MemberAttemptTypes MemberAttemptTypes_update(int ID)
        {
            MemberAttemptTypes = MemberAttemptTypes.Select(ID);
            MemberAttemptTypes.MemberAttemptTypeID = Convert.ToInt32(Update_GridView.SelectedValue);
            MemberAttemptTypes.AttemptTypeDescription = AttemptTypeDescription_Update_TextBox.Text;
            MemberAttemptTypes.Update(MemberAttemptTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberAttemptTypes;
        }
        public void MemberAttemptTypes_delete(int ID)
        {
            MemberAttemptTypes.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            MemberAttemptTypes = MemberAttemptTypes_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            MemberAttemptTypes = MemberAttemptTypes_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            MemberAttemptTypes_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

