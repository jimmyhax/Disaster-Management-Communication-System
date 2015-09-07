using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ClientWPetsClass : System.Web.UI.Page
    {
        public ClientWPets ClientWPets = new ClientWPets();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ClientWPets = ClientWPets_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ClientWPets = ClientWPets_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ClientWPets = ClientWPets_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public ClientWPets ClientWPets_selectForInsert(int ID)
        {
            ClientWPets = ClientWPets.Select(ID);
            Pet_Record_ID_Insert_TextBox.Text = Convert.ToString(ClientWPets.Pet_Record_ID);
            Client_id_Insert_TextBox.Text = Convert.ToString(ClientWPets.Client_id);
            Location_ID_Insert_TextBox.Text = Convert.ToString(ClientWPets.Location_ID);
            cp_Date_Insert_TextBox.Text = Convert.ToString(ClientWPets.cp_Date);
            ownership_Insert_TextBox.Text = Convert.ToString(ClientWPets.ownership);
            return ClientWPets;
        }
        public ClientWPets ClientWPets_selectForUpdate(int ID)
        {
            ClientWPets = ClientWPets.Select(ID);
            CLIENTWPETS_ID_Update_TextBox.Text = Convert.ToString(ClientWPets.CLIENTWPETS_ID);
            Pet_Record_ID_Update_TextBox.Text = Convert.ToString(ClientWPets.Pet_Record_ID);
            Client_id_Update_TextBox.Text = Convert.ToString(ClientWPets.Client_id);
            Location_ID_Update_TextBox.Text = Convert.ToString(ClientWPets.Location_ID);
            cp_Date_Update_TextBox.Text = Convert.ToString(ClientWPets.cp_Date);
            ownership_Update_TextBox.Text = Convert.ToString(ClientWPets.ownership);
            return ClientWPets;
        }
        public ClientWPets ClientWPets_selectForDelete(int ID)
        {
            ClientWPets = ClientWPets.Select(ID);
            CLIENTWPETS_ID_Delete_TextBox.Text = Convert.ToString(ClientWPets.CLIENTWPETS_ID);
            Pet_Record_ID_Delete_TextBox.Text = Convert.ToString(ClientWPets.Pet_Record_ID);
            Client_id_Delete_TextBox.Text = Convert.ToString(ClientWPets.Client_id);
            Location_ID_Delete_TextBox.Text = Convert.ToString(ClientWPets.Location_ID);
            cp_Date_Delete_TextBox.Text = Convert.ToString(ClientWPets.cp_Date);
            ownership_Delete_TextBox.Text = Convert.ToString(ClientWPets.ownership);
            return ClientWPets;
        }
        //Database CRUD Call Functions
        public ClientWPets ClientWPets_insert()
        {
            ClientWPets.Pet_Record_ID = Convert.ToInt32(Pet_Record_ID_Insert_TextBox.Text);
            ClientWPets.Client_id = Convert.ToInt32(Client_id_Insert_TextBox.Text);
            ClientWPets.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            ClientWPets.cp_Date = Convert.ToDateTime(cp_Date_Insert_TextBox.Text);
            ClientWPets.ownership = ownership_Insert_TextBox.Text;
            ClientWPets = ClientWPets.Insert(ClientWPets);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ClientWPets;
        }
        public ClientWPets ClientWPets_update(int ID)
        {
            ClientWPets = ClientWPets.Select(ID);
            ClientWPets.CLIENTWPETS_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            ClientWPets.Pet_Record_ID = Convert.ToInt32(Pet_Record_ID_Update_TextBox.Text);
            ClientWPets.Client_id = Convert.ToInt32(Client_id_Update_TextBox.Text);
            ClientWPets.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            ClientWPets.cp_Date = Convert.ToDateTime(cp_Date_Update_TextBox.Text);
            ClientWPets.ownership = ownership_Update_TextBox.Text;
            ClientWPets.Update(ClientWPets);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ClientWPets;
        }
        public void ClientWPets_delete(int ID)
        {
            ClientWPets.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            ClientWPets = ClientWPets_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            ClientWPets = ClientWPets_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            ClientWPets_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

