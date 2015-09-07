using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class AlertClass : System.Web.UI.Page
    {
        public Alert Alert = new Alert();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Alert = Alert_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Alert = Alert_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Alert = Alert_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Alert Alert_selectForInsert(int ID)
        {
            Alert = Alert.Select(ID);
            Alert_Message_Insert_TextBox.Text = Convert.ToString(Alert.Alert_Message);
            Alert_Type_Insert_TextBox.Text = Convert.ToString(Alert.Alert_Type);
            Date_Insert_TextBox.Text = Convert.ToString(Alert.Date);
            Person_ID_Insert_TextBox.Text = Convert.ToString(Alert.Person_ID);
            return Alert;
        }
        public Alert Alert_selectForUpdate(int ID)
        {
            Alert = Alert.Select(ID);
            Alert_ID_Update_TextBox.Text = Convert.ToString(Alert.Alert_ID);
            Alert_Message_Update_TextBox.Text = Convert.ToString(Alert.Alert_Message);
            Alert_Type_Update_TextBox.Text = Convert.ToString(Alert.Alert_Type);
            Date_Update_TextBox.Text = Convert.ToString(Alert.Date);
            Person_ID_Update_TextBox.Text = Convert.ToString(Alert.Person_ID);
            return Alert;
        }
        public Alert Alert_selectForDelete(int ID)
        {
            Alert = Alert.Select(ID);
            Alert_ID_Delete_TextBox.Text = Convert.ToString(Alert.Alert_ID);
            Alert_Message_Delete_TextBox.Text = Convert.ToString(Alert.Alert_Message);
            Alert_Type_Delete_TextBox.Text = Convert.ToString(Alert.Alert_Type);
            Date_Delete_TextBox.Text = Convert.ToString(Alert.Date);
            Person_ID_Delete_TextBox.Text = Convert.ToString(Alert.Person_ID);
            return Alert;
        }
        //Database CRUD Call Functions
        public Alert Alert_insert()
        {
            Alert.Alert_Message = Alert_Message_Insert_TextBox.Text;
            Alert.Alert_Type = Alert_Type_Insert_TextBox.Text;
            Alert.Date = Convert.ToDateTime(Date_Insert_TextBox.Text);
            Alert.Person_ID = Convert.ToInt32(Person_ID_Insert_TextBox.Text);
            Alert = Alert.Insert(Alert);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Alert;
        }
        public Alert Alert_update(int ID)
        {
            Alert = Alert.Select(ID);
            Alert.Alert_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Alert.Alert_Message = Alert_Message_Update_TextBox.Text;
            Alert.Alert_Type = Alert_Type_Update_TextBox.Text;
            Alert.Date = Convert.ToDateTime(Date_Update_TextBox.Text);
            Alert.Person_ID = Convert.ToInt32(Person_ID_Update_TextBox.Text);
            Alert.Update(Alert);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Alert;
        }
        public void Alert_delete(int ID)
        {
            Alert.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Alert = Alert_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Alert = Alert_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Alert_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

