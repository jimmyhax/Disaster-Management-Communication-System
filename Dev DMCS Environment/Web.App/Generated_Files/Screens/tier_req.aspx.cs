using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class tier_reqClass : System.Web.UI.Page
    {
        public tier_req tier_req = new tier_req();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            tier_req = tier_req_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            tier_req = tier_req_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            tier_req = tier_req_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public tier_req tier_req_selectForInsert(int ID)
        {
            tier_req = tier_req.Select(ID);
            req_id_Insert_TextBox.Text = Convert.ToString(tier_req.req_id);
            tier_id_Insert_TextBox.Text = Convert.ToString(tier_req.tier_id);
            return tier_req;
        }
        public tier_req tier_req_selectForUpdate(int ID)
        {
            tier_req = tier_req.Select(ID);
            tier_req_id_Update_TextBox.Text = Convert.ToString(tier_req.tier_req_id);
            req_id_Update_TextBox.Text = Convert.ToString(tier_req.req_id);
            tier_id_Update_TextBox.Text = Convert.ToString(tier_req.tier_id);
            return tier_req;
        }
        public tier_req tier_req_selectForDelete(int ID)
        {
            tier_req = tier_req.Select(ID);
            tier_req_id_Delete_TextBox.Text = Convert.ToString(tier_req.tier_req_id);
            req_id_Delete_TextBox.Text = Convert.ToString(tier_req.req_id);
            tier_id_Delete_TextBox.Text = Convert.ToString(tier_req.tier_id);
            return tier_req;
        }
        //Database CRUD Call Functions
        public tier_req tier_req_insert()
        {
            tier_req.req_id = Convert.ToInt32(req_id_Insert_TextBox.Text);
            tier_req.tier_id = Convert.ToInt32(tier_id_Insert_TextBox.Text);
            tier_req = tier_req.Insert(tier_req);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return tier_req;
        }
        public tier_req tier_req_update(int ID)
        {
            tier_req = tier_req.Select(ID);
            tier_req.tier_req_id = Convert.ToInt32(Update_GridView.SelectedValue);
            tier_req.req_id = Convert.ToInt32(req_id_Update_TextBox.Text);
            tier_req.tier_id = Convert.ToInt32(tier_id_Update_TextBox.Text);
            tier_req.Update(tier_req);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return tier_req;
        }
        public void tier_req_delete(int ID)
        {
            tier_req.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            tier_req = tier_req_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            tier_req = tier_req_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            tier_req_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

