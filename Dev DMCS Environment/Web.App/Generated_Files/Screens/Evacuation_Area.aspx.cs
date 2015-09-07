using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class Evacuation_AreaClass : System.Web.UI.Page
    {
        public Evacuation_Area Evacuation_Area = new Evacuation_Area();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Area = Evacuation_Area_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Area = Evacuation_Area_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Evacuation_Area = Evacuation_Area_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Evacuation_Area Evacuation_Area_selectForInsert(int ID)
        {
            Evacuation_Area = Evacuation_Area.Select(ID);
            Location_ID_Insert_TextBox.Text = Convert.ToString(Evacuation_Area.Location_ID);
            return Evacuation_Area;
        }
        public Evacuation_Area Evacuation_Area_selectForUpdate(int ID)
        {
            Evacuation_Area = Evacuation_Area.Select(ID);
            Evacuation_Area_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Area.Evacuation_Area_ID);
            Location_ID_Update_TextBox.Text = Convert.ToString(Evacuation_Area.Location_ID);
            return Evacuation_Area;
        }
        public Evacuation_Area Evacuation_Area_selectForDelete(int ID)
        {
            Evacuation_Area = Evacuation_Area.Select(ID);
            Evacuation_Area_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Area.Evacuation_Area_ID);
            Location_ID_Delete_TextBox.Text = Convert.ToString(Evacuation_Area.Location_ID);
            return Evacuation_Area;
        }
        //Database CRUD Call Functions
        public Evacuation_Area Evacuation_Area_insert()
        {
            Evacuation_Area.Location_ID = Convert.ToInt32(Location_ID_Insert_TextBox.Text);
            Evacuation_Area = Evacuation_Area.Insert(Evacuation_Area);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Evacuation_Area;
        }
        public Evacuation_Area Evacuation_Area_update(int ID)
        {
            Evacuation_Area = Evacuation_Area.Select(ID);
            Evacuation_Area.Evacuation_Area_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Evacuation_Area.Location_ID = Convert.ToInt32(Location_ID_Update_TextBox.Text);
            Evacuation_Area.Update(Evacuation_Area);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Evacuation_Area;
        }
        public void Evacuation_Area_delete(int ID)
        {
            Evacuation_Area.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Area = Evacuation_Area_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Area = Evacuation_Area_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Evacuation_Area_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

