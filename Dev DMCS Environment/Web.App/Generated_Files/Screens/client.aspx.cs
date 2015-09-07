using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class clientClass : System.Web.UI.Page
    {
        public client client = new client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            client = client_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            client = client_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            client = client_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public client client_selectForInsert(int ID)
        {
            client = client.Select(ID);
            client_status_Insert_TextBox.Text = Convert.ToString(client.client_status);
            ethnicity_Insert_TextBox.Text = Convert.ToString(client.ethnicity);
            eye_color_Insert_TextBox.Text = Convert.ToString(client.eye_color);
            hair_color_Insert_TextBox.Text = Convert.ToString(client.hair_color);
            height_Insert_TextBox.Text = Convert.ToString(client.height);
            picture_Insert_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id=" + ID);
            weight_Insert_TextBox.Text = Convert.ToString(client.weight);
            skin_color_Insert_TextBox.Text = Convert.ToString(client.skin_color);
            Info_Field_Insert_TextBox.Text = Convert.ToString(client.Info_Field);
            Client_Shelter_ID_Insert_TextBox.Text = Convert.ToString(client.Client_Shelter_ID);
            Emergency_Contact_Name_Insert_TextBox.Text = Convert.ToString(client.Emergency_Contact_Name);
            Emergency_Contact_Number_Insert_TextBox.Text = Convert.ToString(client.Emergency_Contact_Number);
            Subscribed_Alerts_Insert_TextBox.Text = Convert.ToString(client.Subscribed_Alerts);
            return client;
        }
        public client client_selectForUpdate(int ID)
        {
            client = client.Select(ID);
            client_id_Update_TextBox.Text = Convert.ToString(client.client_id);
            client_status_Update_TextBox.Text = Convert.ToString(client.client_status);
            ethnicity_Update_TextBox.Text = Convert.ToString(client.ethnicity);
            eye_color_Update_TextBox.Text = Convert.ToString(client.eye_color);
            hair_color_Update_TextBox.Text = Convert.ToString(client.hair_color);
            height_Update_TextBox.Text = Convert.ToString(client.height);
            picture_Update_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id=" + ID);
            weight_Update_TextBox.Text = Convert.ToString(client.weight);
            skin_color_Update_TextBox.Text = Convert.ToString(client.skin_color);
            Info_Field_Update_TextBox.Text = Convert.ToString(client.Info_Field);
            Client_Shelter_ID_Update_TextBox.Text = Convert.ToString(client.Client_Shelter_ID);
            Emergency_Contact_Name_Update_TextBox.Text = Convert.ToString(client.Emergency_Contact_Name);
            Emergency_Contact_Number_Update_TextBox.Text = Convert.ToString(client.Emergency_Contact_Number);
            Subscribed_Alerts_Update_TextBox.Text = Convert.ToString(client.Subscribed_Alerts);
            return client;
        }
        public client client_selectForDelete(int ID)
        {
            client = client.Select(ID);
            client_id_Delete_TextBox.Text = Convert.ToString(client.client_id);
            client_status_Delete_TextBox.Text = Convert.ToString(client.client_status);
            ethnicity_Delete_TextBox.Text = Convert.ToString(client.ethnicity);
            eye_color_Delete_TextBox.Text = Convert.ToString(client.eye_color);
            hair_color_Delete_TextBox.Text = Convert.ToString(client.hair_color);
            height_Delete_TextBox.Text = Convert.ToString(client.height);
            picture_Delete_Image.Attributes["src"] = ResolveUrl("~/Content/images/ShowImage.aspx?Table_Name=client&Image_Name=picture&ID=client_id=" + ID);
            weight_Delete_TextBox.Text = Convert.ToString(client.weight);
            skin_color_Delete_TextBox.Text = Convert.ToString(client.skin_color);
            Info_Field_Delete_TextBox.Text = Convert.ToString(client.Info_Field);
            Client_Shelter_ID_Delete_TextBox.Text = Convert.ToString(client.Client_Shelter_ID);
            Emergency_Contact_Name_Delete_TextBox.Text = Convert.ToString(client.Emergency_Contact_Name);
            Emergency_Contact_Number_Delete_TextBox.Text = Convert.ToString(client.Emergency_Contact_Number);
            Subscribed_Alerts_Delete_TextBox.Text = Convert.ToString(client.Subscribed_Alerts);
            return client;
        }
        //Database CRUD Call Functions
        public client client_insert()
        {
            client.client_status = client_status_Insert_TextBox.Text;
            client.ethnicity = ethnicity_Insert_TextBox.Text;
            client.eye_color = eye_color_Insert_TextBox.Text;
            client.hair_color = hair_color_Insert_TextBox.Text;
            client.height = height_Insert_TextBox.Text;
            if (picture_Insert_FileUpload.HasFile)
            {
                byte[] uploaded_picture = picture_Insert_FileUpload.FileBytes;
                client.picture = uploaded_picture;
            }
            client.weight = Convert.ToInt32(weight_Insert_TextBox.Text);
            client.skin_color = skin_color_Insert_TextBox.Text;
            client.Info_Field = Info_Field_Insert_TextBox.Text;
            client.Client_Shelter_ID = Convert.ToInt32(Client_Shelter_ID_Insert_TextBox.Text);
            client.Emergency_Contact_Name = Emergency_Contact_Name_Insert_TextBox.Text;
            client.Emergency_Contact_Number = Emergency_Contact_Number_Insert_TextBox.Text;
            client.Subscribed_Alerts = Subscribed_Alerts_Insert_TextBox.Text;
            client = client.Insert(client);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return client;
        }
        public client client_update(int ID)
        {
            client = client.Select(ID);
            client.client_id = Convert.ToInt32(Update_GridView.SelectedValue);
            client.client_status = client_status_Update_TextBox.Text;
            client.ethnicity = ethnicity_Update_TextBox.Text;
            client.eye_color = eye_color_Update_TextBox.Text;
            client.hair_color = hair_color_Update_TextBox.Text;
            client.height = height_Update_TextBox.Text;
            if (picture_Update_FileUpload.HasFile)
            {
                byte[] uploaded_picture = picture_Update_FileUpload.FileBytes;
                client.picture = uploaded_picture;
            }
            client.weight = Convert.ToInt32(weight_Update_TextBox.Text);
            client.skin_color = skin_color_Update_TextBox.Text;
            client.Info_Field = Info_Field_Update_TextBox.Text;
            client.Client_Shelter_ID = Convert.ToInt32(Client_Shelter_ID_Update_TextBox.Text);
            client.Emergency_Contact_Name = Emergency_Contact_Name_Update_TextBox.Text;
            client.Emergency_Contact_Number = Emergency_Contact_Number_Update_TextBox.Text;
            client.Subscribed_Alerts = Subscribed_Alerts_Update_TextBox.Text;
            client.Update(client);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return client;
        }
        public void client_delete(int ID)
        {
            client.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            client = client_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            client = client_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            client_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

