using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class LanguagesClass : System.Web.UI.Page
    {
        public Languages Languages = new Languages();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Languages = Languages_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Languages = Languages_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Languages = Languages_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Languages Languages_selectForInsert(int ID)
        {
            Languages = Languages.Select(ID);
            Code_Insert_TextBox.Text = Convert.ToString(Languages.Code);
            EnglishName_Insert_TextBox.Text = Convert.ToString(Languages.EnglishName);
            NativeName_Insert_TextBox.Text = Convert.ToString(Languages.NativeName);
            IsEnabled_Insert_TextBox.Text = Convert.ToString(Languages.IsEnabled);
            return Languages;
        }
        public Languages Languages_selectForUpdate(int ID)
        {
            Languages = Languages.Select(ID);
            LanguageID_Update_TextBox.Text = Convert.ToString(Languages.LanguageID);
            Code_Update_TextBox.Text = Convert.ToString(Languages.Code);
            EnglishName_Update_TextBox.Text = Convert.ToString(Languages.EnglishName);
            NativeName_Update_TextBox.Text = Convert.ToString(Languages.NativeName);
            IsEnabled_Update_TextBox.Text = Convert.ToString(Languages.IsEnabled);
            return Languages;
        }
        public Languages Languages_selectForDelete(int ID)
        {
            Languages = Languages.Select(ID);
            LanguageID_Delete_TextBox.Text = Convert.ToString(Languages.LanguageID);
            Code_Delete_TextBox.Text = Convert.ToString(Languages.Code);
            EnglishName_Delete_TextBox.Text = Convert.ToString(Languages.EnglishName);
            NativeName_Delete_TextBox.Text = Convert.ToString(Languages.NativeName);
            IsEnabled_Delete_TextBox.Text = Convert.ToString(Languages.IsEnabled);
            return Languages;
        }
        //Database CRUD Call Functions
        public Languages Languages_insert()
        {
            Languages.Code = Code_Insert_TextBox.Text;
            Languages.EnglishName = EnglishName_Insert_TextBox.Text;
            Languages.NativeName = NativeName_Insert_TextBox.Text;
            Languages.IsEnabled = Convert.ToInt32(IsEnabled_Insert_TextBox.Text);
            Languages = Languages.Insert(Languages);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Languages;
        }
        public Languages Languages_update(int ID)
        {
            Languages = Languages.Select(ID);
            Languages.LanguageID = Convert.ToInt32(Update_GridView.SelectedValue);
            Languages.Code = Code_Update_TextBox.Text;
            Languages.EnglishName = EnglishName_Update_TextBox.Text;
            Languages.NativeName = NativeName_Update_TextBox.Text;
            Languages.IsEnabled = Convert.ToInt32(IsEnabled_Update_TextBox.Text);
            Languages.Update(Languages);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Languages;
        }
        public void Languages_delete(int ID)
        {
            Languages.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Languages = Languages_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Languages = Languages_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Languages_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

