using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class MemberDomainsClass : System.Web.UI.Page
    {
        public MemberDomains MemberDomains = new MemberDomains();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberDomains = MemberDomains_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberDomains = MemberDomains_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            MemberDomains = MemberDomains_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public MemberDomains MemberDomains_selectForInsert(int ID)
        {
            MemberDomains = MemberDomains.Select(ID);
            MemberID_Insert_TextBox.Text = Convert.ToString(MemberDomains.MemberID);
            DomainID_Insert_TextBox.Text = Convert.ToString(MemberDomains.DomainID);
            return MemberDomains;
        }
        public MemberDomains MemberDomains_selectForUpdate(int ID)
        {
            MemberDomains = MemberDomains.Select(ID);
            MemberDomainID_Update_TextBox.Text = Convert.ToString(MemberDomains.MemberDomainID);
            MemberID_Update_TextBox.Text = Convert.ToString(MemberDomains.MemberID);
            DomainID_Update_TextBox.Text = Convert.ToString(MemberDomains.DomainID);
            return MemberDomains;
        }
        public MemberDomains MemberDomains_selectForDelete(int ID)
        {
            MemberDomains = MemberDomains.Select(ID);
            MemberDomainID_Delete_TextBox.Text = Convert.ToString(MemberDomains.MemberDomainID);
            MemberID_Delete_TextBox.Text = Convert.ToString(MemberDomains.MemberID);
            DomainID_Delete_TextBox.Text = Convert.ToString(MemberDomains.DomainID);
            return MemberDomains;
        }
        //Database CRUD Call Functions
        public MemberDomains MemberDomains_insert()
        {
            MemberDomains.DomainID = Convert.ToInt32(DomainID_Insert_TextBox.Text);
            MemberDomains = MemberDomains.Insert(MemberDomains);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberDomains;
        }
        public MemberDomains MemberDomains_update(int ID)
        {
            MemberDomains = MemberDomains.Select(ID);
            MemberDomains.MemberDomainID = Convert.ToInt32(Update_GridView.SelectedValue);
            MemberDomains.DomainID = Convert.ToInt32(DomainID_Update_TextBox.Text);
            MemberDomains.Update(MemberDomains);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return MemberDomains;
        }
        public void MemberDomains_delete(int ID)
        {
            MemberDomains.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            MemberDomains = MemberDomains_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            MemberDomains = MemberDomains_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            MemberDomains_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

