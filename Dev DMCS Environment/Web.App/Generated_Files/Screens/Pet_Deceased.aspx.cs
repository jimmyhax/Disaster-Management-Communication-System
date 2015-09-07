using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Pet_DeceasedClass : System.Web.UI.Page
    {
        public Pet_Deceased Pet_Deceased = new Pet_Deceased();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Deceased = Pet_Deceased_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Deceased = Pet_Deceased_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet_Deceased = Pet_Deceased_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Pet_Deceased Pet_Deceased_selectForInsert(int ID)
        {
            Pet_Deceased = Pet_Deceased.Select(ID);
            Date_Deceased_Insert_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Deceased);
            Location_ID_Insert_TextBox.Text = Convert.ToString(Pet_Deceased.Location_ID);
            Funeral_Insert_TextBox.Text = Convert.ToString(Pet_Deceased.Funeral);
            Cemetary_Name_Insert_TextBox.Text = Convert.ToString(Pet_Deceased.Cemetary_Name);
            Deceased_Type_Insert_TextBox.Text = Convert.ToString(Pet_Deceased.Deceased_Type);
            Date_Created_Insert_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Created);
            Date_Modified_Insert_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Modified);
            return Pet_Deceased;
        }
        public Pet_Deceased Pet_Deceased_selectForUpdate(int ID)
        {
            Pet_Deceased = Pet_Deceased.Select(ID);
            Pet_Deceased_ID_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Pet_Deceased_ID);
            Date_Deceased_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Deceased);
            Location_ID_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Location_ID);
            Funeral_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Funeral);
            Cemetary_Name_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Cemetary_Name);
            Deceased_Type_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Deceased_Type);
            Date_Created_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Created);
            Date_Modified_Update_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Modified);
            return Pet_Deceased;
        }
        public Pet_Deceased Pet_Deceased_selectForDelete(int ID)
        {
            Pet_Deceased = Pet_Deceased.Select(ID);
            Pet_Deceased_ID_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Pet_Deceased_ID);
            Date_Deceased_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Deceased);
            Location_ID_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Location_ID);
            Funeral_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Funeral);
            Cemetary_Name_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Cemetary_Name);
            Deceased_Type_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Deceased_Type);
            Date_Created_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Created);
            Date_Modified_Delete_TextBox.Text = Convert.ToString(Pet_Deceased.Date_Modified);
            return Pet_Deceased;
        }
        //Database CRUD Call Functions
        public Pet_Deceased Pet_Deceased_insert()
        {
            Pet_Deceased.Date_Deceased = Convert.ToDateTime(Date_Deceased_Insert_TextBox.Text);
            Pet_Deceased.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            Pet_Deceased.Funeral = Funeral_Insert_TextBox.Text;
            Pet_Deceased.Cemetary_Name = Cemetary_Name_Insert_TextBox.Text;
            Pet_Deceased.Deceased_Type = Deceased_Type_Insert_TextBox.Text;
            Pet_Deceased.Date_Created = Convert.ToDateTime(Date_Created_Insert_TextBox.Text);
            Pet_Deceased.Date_Modified = Convert.ToDateTime(Date_Modified_Insert_TextBox.Text);
            Pet_Deceased = Pet_Deceased.Insert(Pet_Deceased);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Deceased;
        }
        public Pet_Deceased Pet_Deceased_update(int ID)
        {
            Pet_Deceased = Pet_Deceased.Select(ID);
            Pet_Deceased.Pet_Deceased_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Pet_Deceased.Date_Deceased = Convert.ToDateTime(Date_Deceased_Update_TextBox.Text);
            Pet_Deceased.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            Pet_Deceased.Funeral = Funeral_Update_TextBox.Text;
            Pet_Deceased.Cemetary_Name = Cemetary_Name_Update_TextBox.Text;
            Pet_Deceased.Deceased_Type = Deceased_Type_Update_TextBox.Text;
            Pet_Deceased.Date_Created = Convert.ToDateTime(Date_Created_Update_TextBox.Text);
            Pet_Deceased.Date_Modified = Convert.ToDateTime(Date_Modified_Update_TextBox.Text);
            Pet_Deceased.Update(Pet_Deceased);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet_Deceased;
        }
        public void Pet_Deceased_delete(int ID)
        {
            Pet_Deceased.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Pet_Deceased = Pet_Deceased_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Pet_Deceased = Pet_Deceased_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Pet_Deceased_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

