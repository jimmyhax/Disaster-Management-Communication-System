using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Evacuation_Encounter_Shelter_ClientClass : System.Web.UI.Page
    {
        public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client = new Evacuation_Encounter_Shelter_Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client_selectForInsert(int ID)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
            Evacuation_Area_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID);
            Encounter_Id_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Encounter_Id);
            Start_Date_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Start_Date);
            End_Date_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.End_Date);
            Shelter_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Shelter_ID);
            Client_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Client_ID);
            return Evacuation_Encounter_Shelter_Client;
        }
        public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client_selectForUpdate(int ID)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
            Evacuation_Encounter_Shelter_Client_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID);
            Evacuation_Area_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID);
            Encounter_Id_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Encounter_Id);
            Start_Date_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Start_Date);
            End_Date_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.End_Date);
            Shelter_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Shelter_ID);
            Client_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Client_ID);
            return Evacuation_Encounter_Shelter_Client;
        }
        public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client_selectForDelete(int ID)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
            Evacuation_Encounter_Shelter_Client_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID);
            Evacuation_Area_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID);
            Encounter_Id_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Encounter_Id);
            Start_Date_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Start_Date);
            End_Date_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.End_Date);
            Shelter_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Shelter_ID);
            Client_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Client_ID);
            return Evacuation_Encounter_Shelter_Client;
        }
        //Database CRUD Call Functions
        public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client_insert()
        {
            Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Encounter_Id = Convert.ToInt32(Encounter_Id_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Start_Date = Convert.ToDateTime(Start_Date_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.End_Date = Convert.ToDateTime(End_Date_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Shelter_ID = Convert.ToInt32(Shelter_ID_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Client_ID = Convert.ToInt32(Client_ID_Insert_TextBox.Text);
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Insert(Evacuation_Encounter_Shelter_Client);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Evacuation_Encounter_Shelter_Client;
        }
        public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client_update(int ID)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
            Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Encounter_Id = Convert.ToInt32(Encounter_Id_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Start_Date = Convert.ToDateTime(Start_Date_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.End_Date = Convert.ToDateTime(End_Date_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Shelter_ID = Convert.ToInt32(Shelter_ID_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Client_ID = Convert.ToInt32(Client_ID_Update_TextBox.Text);
            Evacuation_Encounter_Shelter_Client.Update(Evacuation_Encounter_Shelter_Client);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Evacuation_Encounter_Shelter_Client;
        }
        public void Evacuation_Encounter_Shelter_Client_delete(int ID)
        {
            Evacuation_Encounter_Shelter_Client.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Encounter_Shelter_Client_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

