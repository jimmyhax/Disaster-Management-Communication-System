using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ShelterClass : System.Web.UI.Page
    {
        public Shelter Shelter = new Shelter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Shelter = Shelter_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Shelter = Shelter_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Shelter = Shelter_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Shelter Shelter_selectForInsert(int ID)
        {
            Shelter = Shelter.Select(ID);
            Address_ID_Insert_TextBox.Text = Convert.ToString(Shelter.Address_ID);
            Shelter_Type_Insert_TextBox.Text = Convert.ToString(Shelter.Shelter_Type);
            Max_Capacity_Insert_TextBox.Text = Convert.ToString(Shelter.Max_Capacity);
            AllowsPets_Insert_TextBox.Text = Convert.ToString(Shelter.AllowsPets);
            return Shelter;
        }
        public Shelter Shelter_selectForUpdate(int ID)
        {
            Shelter = Shelter.Select(ID);
            Shelter_ID_Update_TextBox.Text = Convert.ToString(Shelter.Shelter_ID);
            Address_ID_Update_TextBox.Text = Convert.ToString(Shelter.Address_ID);
            Shelter_Type_Update_TextBox.Text = Convert.ToString(Shelter.Shelter_Type);
            Max_Capacity_Update_TextBox.Text = Convert.ToString(Shelter.Max_Capacity);
            AllowsPets_Update_TextBox.Text = Convert.ToString(Shelter.AllowsPets);
            return Shelter;
        }
        public Shelter Shelter_selectForDelete(int ID)
        {
            Shelter = Shelter.Select(ID);
            Shelter_ID_Delete_TextBox.Text = Convert.ToString(Shelter.Shelter_ID);
            Address_ID_Delete_TextBox.Text = Convert.ToString(Shelter.Address_ID);
            Shelter_Type_Delete_TextBox.Text = Convert.ToString(Shelter.Shelter_Type);
            Max_Capacity_Delete_TextBox.Text = Convert.ToString(Shelter.Max_Capacity);
            AllowsPets_Delete_TextBox.Text = Convert.ToString(Shelter.AllowsPets);
            return Shelter;
        }
        //Database CRUD Call Functions
        public Shelter Shelter_insert()
        {
            Shelter.Address_ID = Convert.ToInt32(Address_ID_Insert_TextBox.Text);
            Shelter.Shelter_Type = Shelter_Type_Insert_TextBox.Text;
            Shelter.Max_Capacity = Convert.ToInt32(Max_Capacity_Insert_TextBox.Text);
            Shelter.AllowsPets = AllowsPets_Insert_TextBox.Text;
            Shelter = Shelter.Insert(Shelter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Shelter;
        }
        public Shelter Shelter_update(int ID)
        {
            Shelter = Shelter.Select(ID);
            Shelter.Shelter_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Shelter.Address_ID = Convert.ToInt32(Address_ID_Update_TextBox.Text);
            Shelter.Shelter_Type = Shelter_Type_Update_TextBox.Text;
            Shelter.Max_Capacity = Convert.ToInt32(Max_Capacity_Update_TextBox.Text);
            Shelter.AllowsPets = AllowsPets_Update_TextBox.Text;
            Shelter.Update(Shelter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Shelter;
        }
        public void Shelter_delete(int ID)
        {
            Shelter.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Shelter = Shelter_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Shelter = Shelter_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Shelter_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

