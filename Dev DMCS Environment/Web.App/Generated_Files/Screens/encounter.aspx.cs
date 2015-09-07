using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class encounterClass : System.Web.UI.Page
    {
        public encounter encounter = new encounter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter = encounter_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter = encounter_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            encounter = encounter_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public encounter encounter_selectForInsert(int ID)
        {
            encounter = encounter.Select(ID);
            case_id_Insert_TextBox.Text = Convert.ToString(encounter.case_id);
            agency_id_Insert_TextBox.Text = Convert.ToString(encounter.agency_id);
            call_center_id_Insert_TextBox.Text = Convert.ToString(encounter.call_center_id);
            client_id_Insert_TextBox.Text = Convert.ToString(encounter.client_id);
            create_date_Insert_TextBox.Text = Convert.ToString(encounter.create_date);
            close_date_Insert_TextBox.Text = Convert.ToString(encounter.close_date);
            disaster_id_Insert_TextBox.Text = Convert.ToString(encounter.disaster_id);
            Location_ID_Insert_TextBox.Text = Convert.ToString(encounter.Location_ID);
            Pet_Record_ID_Insert_TextBox.Text = Convert.ToString(encounter.Pet_Record_ID);
            return encounter;
        }
        public encounter encounter_selectForUpdate(int ID)
        {
            encounter = encounter.Select(ID);
            encounter_id_Update_TextBox.Text = Convert.ToString(encounter.encounter_id);
            case_id_Update_TextBox.Text = Convert.ToString(encounter.case_id);
            agency_id_Update_TextBox.Text = Convert.ToString(encounter.agency_id);
            call_center_id_Update_TextBox.Text = Convert.ToString(encounter.call_center_id);
            client_id_Update_TextBox.Text = Convert.ToString(encounter.client_id);
            create_date_Update_TextBox.Text = Convert.ToString(encounter.create_date);
            close_date_Update_TextBox.Text = Convert.ToString(encounter.close_date);
            disaster_id_Update_TextBox.Text = Convert.ToString(encounter.disaster_id);
            Location_ID_Update_TextBox.Text = Convert.ToString(encounter.Location_ID);
            Pet_Record_ID_Update_TextBox.Text = Convert.ToString(encounter.Pet_Record_ID);
            return encounter;
        }
        public encounter encounter_selectForDelete(int ID)
        {
            encounter = encounter.Select(ID);
            encounter_id_Delete_TextBox.Text = Convert.ToString(encounter.encounter_id);
            case_id_Delete_TextBox.Text = Convert.ToString(encounter.case_id);
            agency_id_Delete_TextBox.Text = Convert.ToString(encounter.agency_id);
            call_center_id_Delete_TextBox.Text = Convert.ToString(encounter.call_center_id);
            client_id_Delete_TextBox.Text = Convert.ToString(encounter.client_id);
            create_date_Delete_TextBox.Text = Convert.ToString(encounter.create_date);
            close_date_Delete_TextBox.Text = Convert.ToString(encounter.close_date);
            disaster_id_Delete_TextBox.Text = Convert.ToString(encounter.disaster_id);
            Location_ID_Delete_TextBox.Text = Convert.ToString(encounter.Location_ID);
            Pet_Record_ID_Delete_TextBox.Text = Convert.ToString(encounter.Pet_Record_ID);
            return encounter;
        }
        //Database CRUD Call Functions
        public encounter encounter_insert()
        {
            encounter.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            encounter.agency_id = Convert.ToInt32(agency_id_Insert_TextBox.Text);
            encounter.call_center_id = Convert.ToInt32(call_center_id_Insert_TextBox.Text);
            encounter.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            encounter.create_date = Convert.ToDateTime(create_date_Insert_TextBox.Text);
            encounter.close_date = Convert.ToDateTime(close_date_Insert_TextBox.Text);
            encounter.disaster_id = Convert.ToInt32(disaster_id_Insert_TextBox.Text);
            encounter.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            encounter.Pet_Record_ID = Convert.ToInt32(Pet_Record_ID_Insert_TextBox.Text);
            encounter = encounter.Insert(encounter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return encounter;
        }
        public encounter encounter_update(int ID)
        {
            encounter = encounter.Select(ID);
            encounter.encounter_id = Convert.ToInt32(Update_GridView.SelectedValue);
            encounter.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            encounter.agency_id = Convert.ToInt32(agency_id_Update_TextBox.Text);
            encounter.call_center_id = Convert.ToInt32(call_center_id_Update_TextBox.Text);
            encounter.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            encounter.create_date = Convert.ToDateTime(create_date_Update_TextBox.Text);
            encounter.close_date = Convert.ToDateTime(close_date_Update_TextBox.Text);
            encounter.disaster_id = Convert.ToInt32(disaster_id_Update_TextBox.Text);
            encounter.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            encounter.Pet_Record_ID = Convert.ToInt32(Pet_Record_ID_Update_TextBox.Text);
            encounter.Update(encounter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return encounter;
        }
        public void encounter_delete(int ID)
        {
            encounter.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            encounter = encounter_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            encounter = encounter_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            encounter_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

