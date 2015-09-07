using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class DomainsClass : System.Web.UI.Page
    {
        public Domains Domains = new Domains();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Domains = Domains_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Domains = Domains_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Domains = Domains_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Domains Domains_selectForInsert(int ID)
        {
            Domains = Domains.Select(ID);
            Name_Insert_TextBox.Text = Convert.ToString(Domains.Name);
            Description_Insert_TextBox.Text = Convert.ToString(Domains.Description);
            Created_Insert_TextBox.Text = Convert.ToString(Domains.Created);
            Modified_Insert_TextBox.Text = Convert.ToString(Domains.Modified);
            return Domains;
        }
        public Domains Domains_selectForUpdate(int ID)
        {
            Domains = Domains.Select(ID);
            DomainID_Update_TextBox.Text = Convert.ToString(Domains.DomainID);
            Name_Update_TextBox.Text = Convert.ToString(Domains.Name);
            Description_Update_TextBox.Text = Convert.ToString(Domains.Description);
            Created_Update_TextBox.Text = Convert.ToString(Domains.Created);
            Modified_Update_TextBox.Text = Convert.ToString(Domains.Modified);
            return Domains;
        }
        public Domains Domains_selectForDelete(int ID)
        {
            Domains = Domains.Select(ID);
            DomainID_Delete_TextBox.Text = Convert.ToString(Domains.DomainID);
            Name_Delete_TextBox.Text = Convert.ToString(Domains.Name);
            Description_Delete_TextBox.Text = Convert.ToString(Domains.Description);
            Created_Delete_TextBox.Text = Convert.ToString(Domains.Created);
            Modified_Delete_TextBox.Text = Convert.ToString(Domains.Modified);
            return Domains;
        }
        //Database CRUD Call Functions
        public Domains Domains_insert()
        {
            Domains.Name = Name_Insert_TextBox.Text;
            Domains.Description = Description_Insert_TextBox.Text;
            Domains.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            Domains.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            Domains = Domains.Insert(Domains);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Domains;
        }
        public Domains Domains_update(int ID)
        {
            Domains = Domains.Select(ID);
            Domains.DomainID = Convert.ToInt32(Update_GridView.SelectedValue);
            Domains.Name = Name_Update_TextBox.Text;
            Domains.Description = Description_Update_TextBox.Text;
            Domains.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            Domains.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            Domains.Update(Domains);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Domains;
        }
        public void Domains_delete(int ID)
        {
            Domains.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Domains = Domains_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Domains = Domains_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Domains_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

