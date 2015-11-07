using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class PetClass : System.Web.UI.Page
    {
        public Pet Pet = new Pet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet = Pet_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet = Pet_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Pet = Pet_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Pet Pet_selectForInsert(int ID)
        {
            Pet = Pet.Select(ID);
            Pet_Location_Found_ID_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Location_Found_ID);
            Pet_Type_ID_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Type_ID);
            Pet_Vet_ID_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Vet_ID);
            Pet_License_Tag_Insert_TextBox.Text = Convert.ToString(Pet.Pet_License_Tag);
            Pet_RFID_Insert_TextBox.Text = Convert.ToString(Pet.Pet_RFID);
            Pet_Tatoo_No_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Tatoo_No);
            Pet_Name_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Name);
            Pet_Gender_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Gender);
            Pet_Color_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Color);
            Pet_Weight_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Weight);
            Pet_Description_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Description);
            Pet_Condition_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Condition);
            Pet_Status_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Status);
            Pet_Date_Of_Birth_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Date_Of_Birth);
            Pet_Picture_Insert_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID=" + ID);
            Pet_Sterilized_Insert_TextBox.Text = Convert.ToString(Pet.Pet_Sterilized);
            Date_Modified_Insert_TextBox.Text = Convert.ToString(Pet.Date_Modified);
            Date_Created_Insert_TextBox.Text = Convert.ToString(Pet.Date_Created);
            return Pet;
        }
        public Pet Pet_selectForUpdate(int ID)
        {
            Pet = Pet.Select(ID);
            Pet_Record_ID_Update_TextBox.Text = Convert.ToString(Pet.Pet_Record_ID);
            Pet_Location_Found_ID_Update_TextBox.Text = Convert.ToString(Pet.Pet_Location_Found_ID);
            Pet_Type_ID_Update_TextBox.Text = Convert.ToString(Pet.Pet_Type_ID);
            Pet_Vet_ID_Update_TextBox.Text = Convert.ToString(Pet.Pet_Vet_ID);
            Pet_License_Tag_Update_TextBox.Text = Convert.ToString(Pet.Pet_License_Tag);
            Pet_RFID_Update_TextBox.Text = Convert.ToString(Pet.Pet_RFID);
            Pet_Tatoo_No_Update_TextBox.Text = Convert.ToString(Pet.Pet_Tatoo_No);
            Pet_Name_Update_TextBox.Text = Convert.ToString(Pet.Pet_Name);
            Pet_Gender_Update_TextBox.Text = Convert.ToString(Pet.Pet_Gender);
            Pet_Color_Update_TextBox.Text = Convert.ToString(Pet.Pet_Color);
            Pet_Weight_Update_TextBox.Text = Convert.ToString(Pet.Pet_Weight);
            Pet_Description_Update_TextBox.Text = Convert.ToString(Pet.Pet_Description);
            Pet_Condition_Update_TextBox.Text = Convert.ToString(Pet.Pet_Condition);
            Pet_Status_Update_TextBox.Text = Convert.ToString(Pet.Pet_Status);
            Pet_Date_Of_Birth_Update_TextBox.Text = Convert.ToString(Pet.Pet_Date_Of_Birth);
            Pet_Picture_Update_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID=" + ID);
            Pet_Sterilized_Update_TextBox.Text = Convert.ToString(Pet.Pet_Sterilized);
            Date_Modified_Update_TextBox.Text = Convert.ToString(Pet.Date_Modified);
            Date_Created_Update_TextBox.Text = Convert.ToString(Pet.Date_Created);
            return Pet;
        }
        public Pet Pet_selectForDelete(int ID)
        {
            Pet = Pet.Select(ID);
            Pet_Record_ID_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Record_ID);
            Pet_Location_Found_ID_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Location_Found_ID);
            Pet_Type_ID_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Type_ID);
            Pet_Vet_ID_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Vet_ID);
            Pet_License_Tag_Delete_TextBox.Text = Convert.ToString(Pet.Pet_License_Tag);
            Pet_RFID_Delete_TextBox.Text = Convert.ToString(Pet.Pet_RFID);
            Pet_Tatoo_No_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Tatoo_No);
            Pet_Name_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Name);
            Pet_Gender_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Gender);
            Pet_Color_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Color);
            Pet_Weight_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Weight);
            Pet_Description_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Description);
            Pet_Condition_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Condition);
            Pet_Status_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Status);
            Pet_Date_Of_Birth_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Date_Of_Birth);
            Pet_Picture_Delete_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID=" + ID);
            Pet_Sterilized_Delete_TextBox.Text = Convert.ToString(Pet.Pet_Sterilized);
            Date_Modified_Delete_TextBox.Text = Convert.ToString(Pet.Date_Modified);
            Date_Created_Delete_TextBox.Text = Convert.ToString(Pet.Date_Created);
            return Pet;
        }
        //Database CRUD Call Functions
        public Pet Pet_insert()
        {
            Pet.Pet_Location_Found_ID = Convert.ToInt32(Pet_Location_Found_ID_Insert_TextBox.Text);
            Pet.Pet_Type_ID = Convert.ToInt32(Pet_Type_ID_Insert_TextBox.Text);
            Pet.Pet_Vet_ID = Pet_Vet_ID_Insert_TextBox.Text;
            Pet.Pet_License_Tag = Pet_License_Tag_Insert_TextBox.Text;
            Pet.Pet_RFID = Pet_RFID_Insert_TextBox.Text;
            Pet.Pet_Tatoo_No = Pet_Tatoo_No_Insert_TextBox.Text;
            Pet.Pet_Name = Pet_Name_Insert_TextBox.Text;
            Pet.Pet_Gender = Pet_Gender_Insert_TextBox.Text;
            Pet.Pet_Color = Pet_Color_Insert_TextBox.Text;
            Pet.Pet_Weight = Convert.ToInt32(Pet_Weight_Insert_TextBox.Text);
            Pet.Pet_Description = Pet_Description_Insert_TextBox.Text;
            Pet.Pet_Condition = Pet_Condition_Insert_TextBox.Text;
            Pet.Pet_Status = Pet_Status_Insert_TextBox.Text;
            Pet.Pet_Date_Of_Birth = Convert.ToDateTime(Pet_Date_Of_Birth_Insert_TextBox.Text);
            if (Pet_Picture_Insert_FileUpload.HasFile)
            {
                byte[] uploaded_picture = Pet_Picture_Insert_FileUpload.FileBytes;
                Pet.Pet_Picture = uploaded_picture;
            }
            Pet.Pet_Sterilized = Pet_Sterilized_Insert_TextBox.Text;
            Pet.Date_Modified = Convert.ToDateTime(Date_Modified_Insert_TextBox.Text);
            Pet.Date_Created = Convert.ToDateTime(Date_Created_Insert_TextBox.Text);
            Pet = Pet.Insert(Pet);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet;
        }
        public Pet Pet_update(int ID)
        {
            Pet = Pet.Select(ID);
            Pet.Pet_Record_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Pet.Pet_Location_Found_ID = Convert.ToInt32(Pet_Location_Found_ID_Update_TextBox.Text);
            Pet.Pet_Type_ID = Convert.ToInt32(Pet_Type_ID_Update_TextBox.Text);
            Pet.Pet_Vet_ID = Pet_Vet_ID_Update_TextBox.Text;
            Pet.Pet_License_Tag = Pet_License_Tag_Update_TextBox.Text;
            Pet.Pet_RFID = Pet_RFID_Update_TextBox.Text;
            Pet.Pet_Tatoo_No = Pet_Tatoo_No_Update_TextBox.Text;
            Pet.Pet_Name = Pet_Name_Update_TextBox.Text;
            Pet.Pet_Gender = Pet_Gender_Update_TextBox.Text;
            Pet.Pet_Color = Pet_Color_Update_TextBox.Text;
            Pet.Pet_Weight = Convert.ToInt32(Pet_Weight_Update_TextBox.Text);
            Pet.Pet_Description = Pet_Description_Update_TextBox.Text;
            Pet.Pet_Condition = Pet_Condition_Update_TextBox.Text;
            Pet.Pet_Status = Pet_Status_Update_TextBox.Text;
            Pet.Pet_Date_Of_Birth = Convert.ToDateTime(Pet_Date_Of_Birth_Update_TextBox.Text);
            if (Pet_Picture_Update_FileUpload.HasFile)
            {
                byte[] uploaded_picture = Pet_Picture_Update_FileUpload.FileBytes;
                Pet.Pet_Picture = uploaded_picture;
            }
            Pet.Pet_Sterilized = Pet_Sterilized_Update_TextBox.Text;
            Pet.Date_Modified = Convert.ToDateTime(Date_Modified_Update_TextBox.Text);
            Pet.Date_Created = Convert.ToDateTime(Date_Created_Update_TextBox.Text);
            Pet.Update(Pet);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Pet;
        }
        public void Pet_delete(int ID)
        {
            Pet.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Pet = Pet_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Pet = Pet_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Pet_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

