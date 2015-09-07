using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class FEMAClass : System.Web.UI.Page
    {
        public FEMA FEMA = new FEMA();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            FEMA = FEMA_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            FEMA = FEMA_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            FEMA = FEMA_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public FEMA FEMA_selectForInsert(int ID)
        {
            FEMA = FEMA.Select(ID);
            Cost_Code_Insert_TextBox.Text = Convert.ToString(FEMA.Cost_Code);
            Equipment_Insert_TextBox.Text = Convert.ToString(FEMA.Equipment);
            Specification_Insert_TextBox.Text = Convert.ToString(FEMA.Specification);
            Capacity_Size_Insert_TextBox.Text = Convert.ToString(FEMA.Capacity_Size);
            HP_Insert_TextBox.Text = Convert.ToString(FEMA.HP);
            Notes_Insert_TextBox.Text = Convert.ToString(FEMA.Notes);
            Unit_Insert_TextBox.Text = Convert.ToString(FEMA.Unit);
            Rate_Insert_TextBox.Text = Convert.ToString(FEMA.Rate);
            return FEMA;
        }
        public FEMA FEMA_selectForUpdate(int ID)
        {
            FEMA = FEMA.Select(ID);
            FEMA_ID_Update_TextBox.Text = Convert.ToString(FEMA.FEMA_ID);
            Cost_Code_Update_TextBox.Text = Convert.ToString(FEMA.Cost_Code);
            Equipment_Update_TextBox.Text = Convert.ToString(FEMA.Equipment);
            Specification_Update_TextBox.Text = Convert.ToString(FEMA.Specification);
            Capacity_Size_Update_TextBox.Text = Convert.ToString(FEMA.Capacity_Size);
            HP_Update_TextBox.Text = Convert.ToString(FEMA.HP);
            Notes_Update_TextBox.Text = Convert.ToString(FEMA.Notes);
            Unit_Update_TextBox.Text = Convert.ToString(FEMA.Unit);
            Rate_Update_TextBox.Text = Convert.ToString(FEMA.Rate);
            return FEMA;
        }
        public FEMA FEMA_selectForDelete(int ID)
        {
            FEMA = FEMA.Select(ID);
            FEMA_ID_Delete_TextBox.Text = Convert.ToString(FEMA.FEMA_ID);
            Cost_Code_Delete_TextBox.Text = Convert.ToString(FEMA.Cost_Code);
            Equipment_Delete_TextBox.Text = Convert.ToString(FEMA.Equipment);
            Specification_Delete_TextBox.Text = Convert.ToString(FEMA.Specification);
            Capacity_Size_Delete_TextBox.Text = Convert.ToString(FEMA.Capacity_Size);
            HP_Delete_TextBox.Text = Convert.ToString(FEMA.HP);
            Notes_Delete_TextBox.Text = Convert.ToString(FEMA.Notes);
            Unit_Delete_TextBox.Text = Convert.ToString(FEMA.Unit);
            Rate_Delete_TextBox.Text = Convert.ToString(FEMA.Rate);
            return FEMA;
        }
        //Database CRUD Call Functions
        public FEMA FEMA_insert()
        {
            FEMA.Cost_Code = Convert.ToInt32(Cost_Code_Insert_TextBox.Text);
            FEMA.Equipment = Equipment_Insert_TextBox.Text;
            FEMA.Specification = Specification_Insert_TextBox.Text;
            FEMA.Capacity_Size = Capacity_Size_Insert_TextBox.Text;
            FEMA.HP = HP_Insert_TextBox.Text;
            FEMA.Notes = Notes_Insert_TextBox.Text;
            FEMA.Unit = Unit_Insert_TextBox.Text;
            FEMA.Rate = Rate_Insert_TextBox.Text;
            FEMA = FEMA.Insert(FEMA);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return FEMA;
        }
        public FEMA FEMA_update(int ID)
        {
            FEMA = FEMA.Select(ID);
            FEMA.FEMA_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            FEMA.Cost_Code = Convert.ToInt32(Cost_Code_Update_TextBox.Text);
            FEMA.Equipment = Equipment_Update_TextBox.Text;
            FEMA.Specification = Specification_Update_TextBox.Text;
            FEMA.Capacity_Size = Capacity_Size_Update_TextBox.Text;
            FEMA.HP = HP_Update_TextBox.Text;
            FEMA.Notes = Notes_Update_TextBox.Text;
            FEMA.Unit = Unit_Update_TextBox.Text;
            FEMA.Rate = Rate_Update_TextBox.Text;
            FEMA.Update(FEMA);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return FEMA;
        }
        public void FEMA_delete(int ID)
        {
            FEMA.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            FEMA = FEMA_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            FEMA = FEMA_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            FEMA_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

