using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Inspection_StatusClass : System.Web.UI.Page
    {
        public Inspection_Status Inspection_Status = new Inspection_Status();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Inspection_Status = Inspection_Status_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Inspection_Status = Inspection_Status_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Inspection_Status = Inspection_Status_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Inspection_Status Inspection_Status_selectForInsert(int ID)
        {
            Inspection_Status = Inspection_Status.Select(ID);
            Evacuation_Area_ID_Insert_TextBox.Text = Convert.ToString(Inspection_Status.Evacuation_Area_ID);
            Address_ID_Insert_TextBox.Text = Convert.ToString(Inspection_Status.Address_ID);
            Inspection_Code_Insert_TextBox.Text = Convert.ToString(Inspection_Status.Inspection_Code);
            Client_Found_Insert_TextBox.Text = Convert.ToString(Inspection_Status.Client_Found);
            Client_Found_Status_Insert_TextBox.Text = Convert.ToString(Inspection_Status.Client_Found_Status);
            return Inspection_Status;
        }
        public Inspection_Status Inspection_Status_selectForUpdate(int ID)
        {
            Inspection_Status = Inspection_Status.Select(ID);
            InspectionStatus_ID_Update_TextBox.Text = Convert.ToString(Inspection_Status.InspectionStatus_ID);
            Evacuation_Area_ID_Update_TextBox.Text = Convert.ToString(Inspection_Status.Evacuation_Area_ID);
            Address_ID_Update_TextBox.Text = Convert.ToString(Inspection_Status.Address_ID);
            Inspection_Code_Update_TextBox.Text = Convert.ToString(Inspection_Status.Inspection_Code);
            Client_Found_Update_TextBox.Text = Convert.ToString(Inspection_Status.Client_Found);
            Client_Found_Status_Update_TextBox.Text = Convert.ToString(Inspection_Status.Client_Found_Status);
            return Inspection_Status;
        }
        public Inspection_Status Inspection_Status_selectForDelete(int ID)
        {
            Inspection_Status = Inspection_Status.Select(ID);
            InspectionStatus_ID_Delete_TextBox.Text = Convert.ToString(Inspection_Status.InspectionStatus_ID);
            Evacuation_Area_ID_Delete_TextBox.Text = Convert.ToString(Inspection_Status.Evacuation_Area_ID);
            Address_ID_Delete_TextBox.Text = Convert.ToString(Inspection_Status.Address_ID);
            Inspection_Code_Delete_TextBox.Text = Convert.ToString(Inspection_Status.Inspection_Code);
            Client_Found_Delete_TextBox.Text = Convert.ToString(Inspection_Status.Client_Found);
            Client_Found_Status_Delete_TextBox.Text = Convert.ToString(Inspection_Status.Client_Found_Status);
            return Inspection_Status;
        }
        //Database CRUD Call Functions
        public Inspection_Status Inspection_Status_insert()
        {
            Inspection_Status.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Insert_TextBox.Text);
            Inspection_Status.Address_ID = Convert.ToInt32(Address_ID_Insert_TextBox.Text);
            Inspection_Status.Inspection_Code = Inspection_Code_Insert_TextBox.Text;
            Inspection_Status.Client_Found = Client_Found_Insert_TextBox.Text;
            Inspection_Status.Client_Found_Status = Client_Found_Status_Insert_TextBox.Text;
            Inspection_Status = Inspection_Status.Insert(Inspection_Status);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Inspection_Status;
        }
        public Inspection_Status Inspection_Status_update(int ID)
        {
            Inspection_Status = Inspection_Status.Select(ID);
            Inspection_Status.InspectionStatus_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Inspection_Status.Evacuation_Area_ID = Convert.ToInt32(Evacuation_Area_ID_Update_TextBox.Text);
            Inspection_Status.Address_ID = Convert.ToInt32(Address_ID_Update_TextBox.Text);
            Inspection_Status.Inspection_Code = Inspection_Code_Update_TextBox.Text;
            Inspection_Status.Client_Found = Client_Found_Update_TextBox.Text;
            Inspection_Status.Client_Found_Status = Client_Found_Status_Update_TextBox.Text;
            Inspection_Status.Update(Inspection_Status);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Inspection_Status;
        }
        public void Inspection_Status_delete(int ID)
        {
            Inspection_Status.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Inspection_Status = Inspection_Status_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Inspection_Status = Inspection_Status_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Inspection_Status_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

