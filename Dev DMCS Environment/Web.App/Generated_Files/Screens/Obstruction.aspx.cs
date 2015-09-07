using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ObstructionClass : System.Web.UI.Page
    {
        public Obstruction Obstruction = new Obstruction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Obstruction = Obstruction_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Obstruction = Obstruction_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Obstruction = Obstruction_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Obstruction Obstruction_selectForInsert(int ID)
        {
            Obstruction = Obstruction.Select(ID);
            Evacuation_Area_ID_Insert_TextBox.Text = Convert.ToString(Obstruction.Evacuation_Area_ID);
            Location_ID_Insert_TextBox.Text = Convert.ToString(Obstruction.Location_ID);
            Date_Reported_Insert_TextBox.Text = Convert.ToString(Obstruction.Date_Reported);
            Expected_Recovery_Date_Insert_TextBox.Text = Convert.ToString(Obstruction.Expected_Recovery_Date);
            Type_Insert_TextBox.Text = Convert.ToString(Obstruction.Type);
            Severity_Insert_TextBox.Text = Convert.ToString(Obstruction.Severity);
            return Obstruction;
        }
        public Obstruction Obstruction_selectForUpdate(int ID)
        {
            Obstruction = Obstruction.Select(ID);
            Obstruction_ID_Update_TextBox.Text = Convert.ToString(Obstruction.Obstruction_ID);
            Evacuation_Area_ID_Update_TextBox.Text = Convert.ToString(Obstruction.Evacuation_Area_ID);
            Location_ID_Update_TextBox.Text = Convert.ToString(Obstruction.Location_ID);
            Date_Reported_Update_TextBox.Text = Convert.ToString(Obstruction.Date_Reported);
            Expected_Recovery_Date_Update_TextBox.Text = Convert.ToString(Obstruction.Expected_Recovery_Date);
            Type_Update_TextBox.Text = Convert.ToString(Obstruction.Type);
            Severity_Update_TextBox.Text = Convert.ToString(Obstruction.Severity);
            return Obstruction;
        }
        public Obstruction Obstruction_selectForDelete(int ID)
        {
            Obstruction = Obstruction.Select(ID);
            Obstruction_ID_Delete_TextBox.Text = Convert.ToString(Obstruction.Obstruction_ID);
            Evacuation_Area_ID_Delete_TextBox.Text = Convert.ToString(Obstruction.Evacuation_Area_ID);
            Location_ID_Delete_TextBox.Text = Convert.ToString(Obstruction.Location_ID);
            Date_Reported_Delete_TextBox.Text = Convert.ToString(Obstruction.Date_Reported);
            Expected_Recovery_Date_Delete_TextBox.Text = Convert.ToString(Obstruction.Expected_Recovery_Date);
            Type_Delete_TextBox.Text = Convert.ToString(Obstruction.Type);
            Severity_Delete_TextBox.Text = Convert.ToString(Obstruction.Severity);
            return Obstruction;
        }
        //Database CRUD Call Functions
        public Obstruction Obstruction_insert()
        {
            Obstruction.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Insert_TextBox.Text);
            Obstruction.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            Obstruction.Date_Reported = Convert.ToDateTime(Date_Reported_Insert_TextBox.Text);
            Obstruction.Expected_Recovery_Date = Convert.ToDateTime(Expected_Recovery_Date_Insert_TextBox.Text);
            Obstruction.Type = Type_Insert_TextBox.Text;
            Obstruction.Severity = Severity_Insert_TextBox.Text;
            Obstruction = Obstruction.Insert(Obstruction);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Obstruction;
        }
        public Obstruction Obstruction_update(int ID)
        {
            Obstruction = Obstruction.Select(ID);
            Obstruction.Obstruction_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Obstruction.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Update_TextBox.Text);
            Obstruction.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            Obstruction.Date_Reported = Convert.ToDateTime(Date_Reported_Update_TextBox.Text);
            Obstruction.Expected_Recovery_Date = Convert.ToDateTime(Expected_Recovery_Date_Update_TextBox.Text);
            Obstruction.Type = Type_Update_TextBox.Text;
            Obstruction.Severity = Severity_Update_TextBox.Text;
            Obstruction.Update(Obstruction);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Obstruction;
        }
        public void Obstruction_delete(int ID)
        {
            Obstruction.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Obstruction = Obstruction_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Obstruction = Obstruction_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Obstruction_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

