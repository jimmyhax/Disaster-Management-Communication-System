using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class requestorClass : System.Web.UI.Page
    {
        public requestor requestor = new requestor();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requestor = requestor_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requestor = requestor_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            requestor = requestor_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public requestor requestor_selectForInsert(int ID)
        {
            requestor = requestor.Select(ID);
            EncounterID_Insert_TextBox.Text = Convert.ToString(requestor.EncounterID);
            Requestor_Type_Insert_TextBox.Text = Convert.ToString(requestor.Requestor_Type);
            MobilUnitID_Insert_TextBox.Text = Convert.ToString(requestor.MobilUnitID);
            PersonID_Insert_TextBox.Text = Convert.ToString(requestor.PersonID);
            AgencyID_Insert_TextBox.Text = Convert.ToString(requestor.AgencyID);
            return requestor;
        }
        public requestor requestor_selectForUpdate(int ID)
        {
            requestor = requestor.Select(ID);
            RequestorID_Update_TextBox.Text = Convert.ToString(requestor.RequestorID);
            EncounterID_Update_TextBox.Text = Convert.ToString(requestor.EncounterID);
            Requestor_Type_Update_TextBox.Text = Convert.ToString(requestor.Requestor_Type);
            MobilUnitID_Update_TextBox.Text = Convert.ToString(requestor.MobilUnitID);
            PersonID_Update_TextBox.Text = Convert.ToString(requestor.PersonID);
            AgencyID_Update_TextBox.Text = Convert.ToString(requestor.AgencyID);
            return requestor;
        }
        public requestor requestor_selectForDelete(int ID)
        {
            requestor = requestor.Select(ID);
            RequestorID_Delete_TextBox.Text = Convert.ToString(requestor.RequestorID);
            EncounterID_Delete_TextBox.Text = Convert.ToString(requestor.EncounterID);
            Requestor_Type_Delete_TextBox.Text = Convert.ToString(requestor.Requestor_Type);
            MobilUnitID_Delete_TextBox.Text = Convert.ToString(requestor.MobilUnitID);
            PersonID_Delete_TextBox.Text = Convert.ToString(requestor.PersonID);
            AgencyID_Delete_TextBox.Text = Convert.ToString(requestor.AgencyID);
            return requestor;
        }
        //Database CRUD Call Functions
        public requestor requestor_insert()
        {
            requestor.EncounterID = Convert.ToInt32(EncounterID_Insert_TextBox.Text);
            requestor.Requestor_Type = Requestor_Type_Insert_TextBox.Text;
            requestor.MobilUnitID = Convert.ToInt32(MobilUnitID_Insert_TextBox.Text);
            requestor.PersonID = Convert.ToInt32(PersonID_Insert_TextBox.Text);
            requestor.AgencyID = Convert.ToInt32(AgencyID_Insert_TextBox.Text);
            requestor = requestor.Insert(requestor);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return requestor;
        }
        public requestor requestor_update(int ID)
        {
            requestor = requestor.Select(ID);
            requestor.RequestorID = Convert.ToInt32(Update_GridView.SelectedValue);
            requestor.EncounterID = Convert.ToInt32(EncounterID_Update_TextBox.Text);
            requestor.Requestor_Type = Requestor_Type_Update_TextBox.Text;
            requestor.MobilUnitID = Convert.ToInt32(MobilUnitID_Update_TextBox.Text);
            requestor.PersonID = Convert.ToInt32(PersonID_Update_TextBox.Text);
            requestor.AgencyID = Convert.ToInt32(AgencyID_Update_TextBox.Text);
            requestor.Update(requestor);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return requestor;
        }
        public void requestor_delete(int ID)
        {
            requestor.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            requestor = requestor_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            requestor = requestor_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            requestor_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

