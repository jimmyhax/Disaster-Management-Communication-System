using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class AuditEventSourcesClass : System.Web.UI.Page
    {
        public AuditEventSources AuditEventSources = new AuditEventSources();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEventSources = AuditEventSources_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEventSources = AuditEventSources_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEventSources = AuditEventSources_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public AuditEventSources AuditEventSources_selectForInsert(int ID)
        {
            AuditEventSources = AuditEventSources.Select(ID);
            Description_Insert_TextBox.Text = Convert.ToString(AuditEventSources.Description);
            return AuditEventSources;
        }
        public AuditEventSources AuditEventSources_selectForUpdate(int ID)
        {
            AuditEventSources = AuditEventSources.Select(ID);
            SourceID_Update_TextBox.Text = Convert.ToString(AuditEventSources.SourceID);
            Description_Update_TextBox.Text = Convert.ToString(AuditEventSources.Description);
            return AuditEventSources;
        }
        public AuditEventSources AuditEventSources_selectForDelete(int ID)
        {
            AuditEventSources = AuditEventSources.Select(ID);
            SourceID_Delete_TextBox.Text = Convert.ToString(AuditEventSources.SourceID);
            Description_Delete_TextBox.Text = Convert.ToString(AuditEventSources.Description);
            return AuditEventSources;
        }
        //Database CRUD Call Functions
        public AuditEventSources AuditEventSources_insert()
        {
            AuditEventSources.Description = Description_Insert_TextBox.Text;
            AuditEventSources = AuditEventSources.Insert(AuditEventSources);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuditEventSources;
        }
        public AuditEventSources AuditEventSources_update(int ID)
        {
            AuditEventSources = AuditEventSources.Select(ID);
            AuditEventSources.SourceID = Convert.ToInt32(Update_GridView.SelectedValue);
            AuditEventSources.Description = Description_Update_TextBox.Text;
            AuditEventSources.Update(AuditEventSources);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuditEventSources;
        }
        public void AuditEventSources_delete(int ID)
        {
            AuditEventSources.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            AuditEventSources = AuditEventSources_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            AuditEventSources = AuditEventSources_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            AuditEventSources_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

