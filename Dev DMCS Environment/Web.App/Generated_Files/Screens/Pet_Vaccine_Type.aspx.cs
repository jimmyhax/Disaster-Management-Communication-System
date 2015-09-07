using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Pet_Vaccine_TypeClass : System.Web.UI.Page
    {
        public Pet_Vaccine_Type Pet_Vaccine_Type = new Pet_Vaccine_Type();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Pet_Vaccine_Type Pet_Vaccine_Type_selectForInsert(int ID)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
            Vaccine_Name_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Name);
            Vaccine_Reactions_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Reactions);
            Vaccine_Type_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type);
            Vaccine_Description_Insert_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Description);
            return Pet_Vaccine_Type;
        }
        public Pet_Vaccine_Type Pet_Vaccine_Type_selectForUpdate(int ID)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
            Vaccine_Type_ID_Update_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type_ID);
            Vaccine_Name_Update_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Name);
            Vaccine_Reactions_Update_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Reactions);
            Vaccine_Type_Update_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type);
            Vaccine_Description_Update_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Description);
            return Pet_Vaccine_Type;
        }
        public Pet_Vaccine_Type Pet_Vaccine_Type_selectForDelete(int ID)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
            Vaccine_Type_ID_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type_ID);
            Vaccine_Name_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Name);
            Vaccine_Reactions_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Reactions);
            Vaccine_Type_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type);
            Vaccine_Description_Delete_TextBox.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Description);
            return Pet_Vaccine_Type;
        }
        //Database CRUD Call Functions
        public Pet_Vaccine_Type Pet_Vaccine_Type_insert()
        {
            Pet_Vaccine_Type.Vaccine_Name = Vaccine_Name_Insert_TextBox.Text;
            Pet_Vaccine_Type.Vaccine_Reactions = Vaccine_Reactions_Insert_TextBox.Text;
            Pet_Vaccine_Type.Vaccine_Type = Vaccine_Type_Insert_TextBox.Text;
            Pet_Vaccine_Type.Vaccine_Description = Vaccine_Description_Insert_TextBox.Text;
            Pet_Vaccine_Type = Pet_Vaccine_Type.Insert(Pet_Vaccine_Type);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Vaccine_Type;
        }
        public Pet_Vaccine_Type Pet_Vaccine_Type_update(int ID)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
            Pet_Vaccine_Type.Vaccine_Type_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Pet_Vaccine_Type.Vaccine_Name = Vaccine_Name_Update_TextBox.Text;
            Pet_Vaccine_Type.Vaccine_Reactions = Vaccine_Reactions_Update_TextBox.Text;
            Pet_Vaccine_Type.Vaccine_Type = Vaccine_Type_Update_TextBox.Text;
            Pet_Vaccine_Type.Vaccine_Description = Vaccine_Description_Update_TextBox.Text;
            Pet_Vaccine_Type.Update(Pet_Vaccine_Type);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Vaccine_Type;
        }
        public void Pet_Vaccine_Type_delete(int ID)
        {
            Pet_Vaccine_Type.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Pet_Vaccine_Type = Pet_Vaccine_Type_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Pet_Vaccine_Type_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

