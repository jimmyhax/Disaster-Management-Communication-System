using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ActionTokenTypesClass : System.Web.UI.Page
    {
        public ActionTokenTypes ActionTokenTypes = new ActionTokenTypes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ActionTokenTypes = ActionTokenTypes_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ActionTokenTypes = ActionTokenTypes_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ActionTokenTypes = ActionTokenTypes_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public ActionTokenTypes ActionTokenTypes_selectForInsert(int ID)
        {
            ActionTokenTypes = ActionTokenTypes.Select(ID);
            Description_Insert_TextBox.Text = Convert.ToString(ActionTokenTypes.Description);
            return ActionTokenTypes;
        }
        public ActionTokenTypes ActionTokenTypes_selectForUpdate(int ID)
        {
            ActionTokenTypes = ActionTokenTypes.Select(ID);
            ActionTypeID_Update_TextBox.Text = Convert.ToString(ActionTokenTypes.ActionTypeID);
            Description_Update_TextBox.Text = Convert.ToString(ActionTokenTypes.Description);
            return ActionTokenTypes;
        }
        public ActionTokenTypes ActionTokenTypes_selectForDelete(int ID)
        {
            ActionTokenTypes = ActionTokenTypes.Select(ID);
            ActionTypeID_Delete_TextBox.Text = Convert.ToString(ActionTokenTypes.ActionTypeID);
            Description_Delete_TextBox.Text = Convert.ToString(ActionTokenTypes.Description);
            return ActionTokenTypes;
        }
        //Database CRUD Call Functions
        public ActionTokenTypes ActionTokenTypes_insert()
        {
            ActionTokenTypes.Description = Description_Insert_TextBox.Text;
            ActionTokenTypes = ActionTokenTypes.Insert(ActionTokenTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ActionTokenTypes;
        }
        public ActionTokenTypes ActionTokenTypes_update(int ID)
        {
            ActionTokenTypes = ActionTokenTypes.Select(ID);
            ActionTokenTypes.ActionTypeID = Convert.ToInt32(Update_GridView.SelectedValue);
            ActionTokenTypes.Description = Description_Update_TextBox.Text;
            ActionTokenTypes.Update(ActionTokenTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ActionTokenTypes;
        }
        public void ActionTokenTypes_delete(int ID)
        {
            ActionTokenTypes.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            ActionTokenTypes = ActionTokenTypes_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            ActionTokenTypes = ActionTokenTypes_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            ActionTokenTypes_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

