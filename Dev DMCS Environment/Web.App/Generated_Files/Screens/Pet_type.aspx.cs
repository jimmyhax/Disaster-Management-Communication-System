using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Pet_typeClass : System.Web.UI.Page
    {
        public Pet_type Pet_type = new Pet_type();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_type = Pet_type_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_type = Pet_type_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_type = Pet_type_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Pet_type Pet_type_selectForInsert(int ID)
        {
            Pet_type = Pet_type.Select(ID);
            Pet_Species_Insert_TextBox.Text = Convert.ToString(Pet_type.Pet_Species);
            Pet_Type_Insert_TextBox.Text = Convert.ToString(Pet_type.Pet_Type);
            Pet_Breed_Insert_TextBox.Text = Convert.ToString(Pet_type.Pet_Breed);
            return Pet_type;
        }
        public Pet_type Pet_type_selectForUpdate(int ID)
        {
            Pet_type = Pet_type.Select(ID);
            Pet_Type_ID_Update_TextBox.Text = Convert.ToString(Pet_type.Pet_Type_ID);
            Pet_Species_Update_TextBox.Text = Convert.ToString(Pet_type.Pet_Species);
            Pet_Type_Update_TextBox.Text = Convert.ToString(Pet_type.Pet_Type);
            Pet_Breed_Update_TextBox.Text = Convert.ToString(Pet_type.Pet_Breed);
            return Pet_type;
        }
        public Pet_type Pet_type_selectForDelete(int ID)
        {
            Pet_type = Pet_type.Select(ID);
            Pet_Type_ID_Delete_TextBox.Text = Convert.ToString(Pet_type.Pet_Type_ID);
            Pet_Species_Delete_TextBox.Text = Convert.ToString(Pet_type.Pet_Species);
            Pet_Type_Delete_TextBox.Text = Convert.ToString(Pet_type.Pet_Type);
            Pet_Breed_Delete_TextBox.Text = Convert.ToString(Pet_type.Pet_Breed);
            return Pet_type;
        }
        //Database CRUD Call Functions
        public Pet_type Pet_type_insert()
        {
            Pet_type.Pet_Species = Pet_Species_Insert_TextBox.Text;
            Pet_type.Pet_Type = Pet_Type_Insert_TextBox.Text;
            Pet_type.Pet_Breed = Pet_Breed_Insert_TextBox.Text;
            Pet_type = Pet_type.Insert(Pet_type);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_type;
        }
        public Pet_type Pet_type_update(int ID)
        {
            Pet_type = Pet_type.Select(ID);
            Pet_type.Pet_Type_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Pet_type.Pet_Species = Pet_Species_Update_TextBox.Text;
            Pet_type.Pet_Type = Pet_Type_Update_TextBox.Text;
            Pet_type.Pet_Breed = Pet_Breed_Update_TextBox.Text;
            Pet_type.Update(Pet_type);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_type;
        }
        public void Pet_type_delete(int ID)
        {
            Pet_type.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Pet_type = Pet_type_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Pet_type = Pet_type_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Pet_type_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

