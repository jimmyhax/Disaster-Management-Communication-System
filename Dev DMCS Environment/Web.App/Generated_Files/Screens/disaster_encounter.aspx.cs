using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class disaster_encounterClass : System.Web.UI.Page
    {
        public disaster_encounter disaster_encounter = new disaster_encounter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            disaster_encounter = disaster_encounter_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            disaster_encounter = disaster_encounter_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            disaster_encounter = disaster_encounter_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public disaster_encounter disaster_encounter_selectForInsert(int ID)
        {
            disaster_encounter = disaster_encounter.Select(ID);
            disaster_id_Insert_TextBox.Text = Convert.ToString(disaster_encounter.disaster_id);
            encounter_id_Insert_TextBox.Text = Convert.ToString(disaster_encounter.encounter_id);
            location_id_Insert_TextBox.Text = Convert.ToString(disaster_encounter.location_id);
            return disaster_encounter;
        }
        public disaster_encounter disaster_encounter_selectForUpdate(int ID)
        {
            disaster_encounter = disaster_encounter.Select(ID);
            disaster_encounter_id_Update_TextBox.Text = Convert.ToString(disaster_encounter.disaster_encounter_id);
            disaster_id_Update_TextBox.Text = Convert.ToString(disaster_encounter.disaster_id);
            encounter_id_Update_TextBox.Text = Convert.ToString(disaster_encounter.encounter_id);
            location_id_Update_TextBox.Text = Convert.ToString(disaster_encounter.location_id);
            return disaster_encounter;
        }
        public disaster_encounter disaster_encounter_selectForDelete(int ID)
        {
            disaster_encounter = disaster_encounter.Select(ID);
            disaster_encounter_id_Delete_TextBox.Text = Convert.ToString(disaster_encounter.disaster_encounter_id);
            disaster_id_Delete_TextBox.Text = Convert.ToString(disaster_encounter.disaster_id);
            encounter_id_Delete_TextBox.Text = Convert.ToString(disaster_encounter.encounter_id);
            location_id_Delete_TextBox.Text = Convert.ToString(disaster_encounter.location_id);
            return disaster_encounter;
        }
        //Database CRUD Call Functions
        public disaster_encounter disaster_encounter_insert()
        {
            disaster_encounter.disaster_id = Convert.ToInt32(disaster_id_Insert_TextBox.Text);
            disaster_encounter.encounter_id = Convert.ToInt32(encounter_id_Insert_TextBox.Text);
            disaster_encounter.location_id = Convert.ToInt32(location_id_Insert_TextBox.Text);
            disaster_encounter = disaster_encounter.Insert(disaster_encounter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return disaster_encounter;
        }
        public disaster_encounter disaster_encounter_update(int ID)
        {
            disaster_encounter = disaster_encounter.Select(ID);
            disaster_encounter.disaster_encounter_id = Convert.ToInt32(Update_GridView.SelectedValue);
            disaster_encounter.disaster_id = Convert.ToInt32(disaster_id_Update_TextBox.Text);
            disaster_encounter.encounter_id = Convert.ToInt32(encounter_id_Update_TextBox.Text);
            disaster_encounter.location_id = Convert.ToInt32(location_id_Update_TextBox.Text);
            disaster_encounter.Update(disaster_encounter);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return disaster_encounter;
        }
        public void disaster_encounter_delete(int ID)
        {
            disaster_encounter.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            disaster_encounter = disaster_encounter_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            disaster_encounter = disaster_encounter_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            disaster_encounter_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

