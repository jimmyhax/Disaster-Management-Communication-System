using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class AuditEventTypesClass : System.Web.UI.Page
    {
        public AuditEventTypes AuditEventTypes = new AuditEventTypes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEventTypes = AuditEventTypes_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEventTypes = AuditEventTypes_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEventTypes = AuditEventTypes_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public AuditEventTypes AuditEventTypes_selectForInsert(int ID)
        {
            AuditEventTypes = AuditEventTypes.Select(ID);
            Description_Insert_TextBox.Text = Convert.ToString(AuditEventTypes.Description);
            return AuditEventTypes;
        }
        public AuditEventTypes AuditEventTypes_selectForUpdate(int ID)
        {
            AuditEventTypes = AuditEventTypes.Select(ID);
            TypeID_Update_TextBox.Text = Convert.ToString(AuditEventTypes.TypeID);
            Description_Update_TextBox.Text = Convert.ToString(AuditEventTypes.Description);
            return AuditEventTypes;
        }
        public AuditEventTypes AuditEventTypes_selectForDelete(int ID)
        {
            AuditEventTypes = AuditEventTypes.Select(ID);
            TypeID_Delete_TextBox.Text = Convert.ToString(AuditEventTypes.TypeID);
            Description_Delete_TextBox.Text = Convert.ToString(AuditEventTypes.Description);
            return AuditEventTypes;
        }
        //Database CRUD Call Functions
        public AuditEventTypes AuditEventTypes_insert()
        {
            AuditEventTypes.Description = Description_Insert_TextBox.Text;
            AuditEventTypes = AuditEventTypes.Insert(AuditEventTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuditEventTypes;
        }
        public AuditEventTypes AuditEventTypes_update(int ID)
        {
            AuditEventTypes = AuditEventTypes.Select(ID);
            AuditEventTypes.TypeID = Convert.ToInt32(Update_GridView.SelectedValue);
            AuditEventTypes.Description = Description_Update_TextBox.Text;
            AuditEventTypes.Update(AuditEventTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuditEventTypes;
        }
        public void AuditEventTypes_delete(int ID)
        {
            AuditEventTypes.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            AuditEventTypes = AuditEventTypes_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            AuditEventTypes = AuditEventTypes_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            AuditEventTypes_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

