using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class transportationClass : System.Web.UI.Page
    {
        public transportation transportation = new transportation();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            transportation = transportation_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            transportation = transportation_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            transportation = transportation_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public transportation transportation_selectForInsert(int ID)
        {
            transportation = transportation.Select(ID);
            location_from_Insert_TextBox.Text = Convert.ToString(transportation.location_from);
            location_to_Insert_TextBox.Text = Convert.ToString(transportation.location_to);
            no_of_passangers_Insert_TextBox.Text = Convert.ToString(transportation.no_of_passangers);
            pickup_date_Insert_TextBox.Text = Convert.ToString(transportation.pickup_date);
            trans_type_Insert_TextBox.Text = Convert.ToString(transportation.trans_type);
            Vehicle_id_Insert_TextBox.Text = Convert.ToString(transportation.Vehicle_id);
            return transportation;
        }
        public transportation transportation_selectForUpdate(int ID)
        {
            transportation = transportation.Select(ID);
            transport_id_Update_TextBox.Text = Convert.ToString(transportation.transport_id);
            location_from_Update_TextBox.Text = Convert.ToString(transportation.location_from);
            location_to_Update_TextBox.Text = Convert.ToString(transportation.location_to);
            no_of_passangers_Update_TextBox.Text = Convert.ToString(transportation.no_of_passangers);
            pickup_date_Update_TextBox.Text = Convert.ToString(transportation.pickup_date);
            trans_type_Update_TextBox.Text = Convert.ToString(transportation.trans_type);
            Vehicle_id_Update_TextBox.Text = Convert.ToString(transportation.Vehicle_id);
            return transportation;
        }
        public transportation transportation_selectForDelete(int ID)
        {
            transportation = transportation.Select(ID);
            transport_id_Delete_TextBox.Text = Convert.ToString(transportation.transport_id);
            location_from_Delete_TextBox.Text = Convert.ToString(transportation.location_from);
            location_to_Delete_TextBox.Text = Convert.ToString(transportation.location_to);
            no_of_passangers_Delete_TextBox.Text = Convert.ToString(transportation.no_of_passangers);
            pickup_date_Delete_TextBox.Text = Convert.ToString(transportation.pickup_date);
            trans_type_Delete_TextBox.Text = Convert.ToString(transportation.trans_type);
            Vehicle_id_Delete_TextBox.Text = Convert.ToString(transportation.Vehicle_id);
            return transportation;
        }
        //Database CRUD Call Functions
        public transportation transportation_insert()
        {
            transportation.location_from = location_from_Insert_TextBox.Text;
            transportation.location_to = location_to_Insert_TextBox.Text;
            transportation.no_of_passangers = Convert.ToInt32(no_of_passangers_Insert_TextBox.Text);
            transportation.pickup_date = Convert.ToDateTime(pickup_date_Insert_TextBox.Text);
            transportation.trans_type = trans_type_Insert_TextBox.Text;
            transportation.Vehicle_id = Convert.ToInt32(Vehicle_id_Insert_TextBox.Text);
            transportation = transportation.Insert(transportation);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return transportation;
        }
        public transportation transportation_update(int ID)
        {
            transportation = transportation.Select(ID);
            transportation.transport_id = Convert.ToInt32(Update_GridView.SelectedValue);
            transportation.location_from = location_from_Update_TextBox.Text;
            transportation.location_to = location_to_Update_TextBox.Text;
            transportation.no_of_passangers = Convert.ToInt32(no_of_passangers_Update_TextBox.Text);
            transportation.pickup_date = Convert.ToDateTime(pickup_date_Update_TextBox.Text);
            transportation.trans_type = trans_type_Update_TextBox.Text;
            transportation.Vehicle_id = Convert.ToInt32(Vehicle_id_Update_TextBox.Text);
            transportation.Update(transportation);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return transportation;
        }
        public void transportation_delete(int ID)
        {
            transportation.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            transportation = transportation_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            transportation = transportation_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            transportation_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

