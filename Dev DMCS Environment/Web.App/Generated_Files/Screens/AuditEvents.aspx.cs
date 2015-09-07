using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class AuditEventsClass : System.Web.UI.Page
    {
        public AuditEvents AuditEvents = new AuditEvents();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEvents = AuditEvents_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEvents = AuditEvents_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            AuditEvents = AuditEvents_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public AuditEvents AuditEvents_selectForInsert(int ID)
        {
            AuditEvents = AuditEvents.Select(ID);
            EventSource_Insert_TextBox.Text = Convert.ToString(AuditEvents.EventSource);
            EventType_Insert_TextBox.Text = Convert.ToString(AuditEvents.EventType);
            Description_Insert_TextBox.Text = Convert.ToString(AuditEvents.Description);
            MemberEmail_Insert_TextBox.Text = Convert.ToString(AuditEvents.MemberEmail);
            Details_Insert_TextBox.Text = Convert.ToString(AuditEvents.Details);
            IPAddress_Insert_TextBox.Text = Convert.ToString(AuditEvents.IPAddress);
            Created_Insert_TextBox.Text = Convert.ToString(AuditEvents.Created);
            return AuditEvents;
        }
        public AuditEvents AuditEvents_selectForUpdate(int ID)
        {
            AuditEvents = AuditEvents.Select(ID);
            EventID_Update_TextBox.Text = Convert.ToString(AuditEvents.EventID);
            EventSource_Update_TextBox.Text = Convert.ToString(AuditEvents.EventSource);
            EventType_Update_TextBox.Text = Convert.ToString(AuditEvents.EventType);
            Description_Update_TextBox.Text = Convert.ToString(AuditEvents.Description);
            MemberEmail_Update_TextBox.Text = Convert.ToString(AuditEvents.MemberEmail);
            Details_Update_TextBox.Text = Convert.ToString(AuditEvents.Details);
            IPAddress_Update_TextBox.Text = Convert.ToString(AuditEvents.IPAddress);
            Created_Update_TextBox.Text = Convert.ToString(AuditEvents.Created);
            return AuditEvents;
        }
        public AuditEvents AuditEvents_selectForDelete(int ID)
        {
            AuditEvents = AuditEvents.Select(ID);
            EventID_Delete_TextBox.Text = Convert.ToString(AuditEvents.EventID);
            EventSource_Delete_TextBox.Text = Convert.ToString(AuditEvents.EventSource);
            EventType_Delete_TextBox.Text = Convert.ToString(AuditEvents.EventType);
            Description_Delete_TextBox.Text = Convert.ToString(AuditEvents.Description);
            MemberEmail_Delete_TextBox.Text = Convert.ToString(AuditEvents.MemberEmail);
            Details_Delete_TextBox.Text = Convert.ToString(AuditEvents.Details);
            IPAddress_Delete_TextBox.Text = Convert.ToString(AuditEvents.IPAddress);
            Created_Delete_TextBox.Text = Convert.ToString(AuditEvents.Created);
            return AuditEvents;
        }
        //Database CRUD Call Functions
        public AuditEvents AuditEvents_insert()
        {
            AuditEvents.EventSource = Convert.ToInt32(EventSource_Insert_TextBox.Text);
            AuditEvents.EventType = Convert.ToInt32(EventType_Insert_TextBox.Text);
            AuditEvents.Description = Description_Insert_TextBox.Text;
            AuditEvents.MemberEmail = MemberEmail_Insert_TextBox.Text;
            AuditEvents.IPAddress = IPAddress_Insert_TextBox.Text;
            AuditEvents.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            AuditEvents = AuditEvents.Insert(AuditEvents);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuditEvents;
        }
        public AuditEvents AuditEvents_update(int ID)
        {
            AuditEvents = AuditEvents.Select(ID);
            AuditEvents.EventID = Convert.ToInt32(Update_GridView.SelectedValue);
            AuditEvents.EventSource = Convert.ToInt32(EventSource_Update_TextBox.Text);
            AuditEvents.EventType = Convert.ToInt32(EventType_Update_TextBox.Text);
            AuditEvents.Description = Description_Update_TextBox.Text;
            AuditEvents.MemberEmail = MemberEmail_Update_TextBox.Text;
            AuditEvents.IPAddress = IPAddress_Update_TextBox.Text;
            AuditEvents.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            AuditEvents.Update(AuditEvents);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return AuditEvents;
        }
        public void AuditEvents_delete(int ID)
        {
            AuditEvents.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            AuditEvents = AuditEvents_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            AuditEvents = AuditEvents_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            AuditEvents_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

