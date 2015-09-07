using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ParametersClass : System.Web.UI.Page
    {
        public Parameters Parameters = new Parameters();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Parameters = Parameters_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Parameters = Parameters_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Parameters = Parameters_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public Parameters Parameters_selectForInsert(int ID)
        {
            Parameters = Parameters.Select(ID);
            Name_Insert_TextBox.Text = Convert.ToString(Parameters.Name);
            Value_Insert_TextBox.Text = Convert.ToString(Parameters.Value);
            MemberID_Insert_TextBox.Text = Convert.ToString(Parameters.MemberID);
            Created_Insert_TextBox.Text = Convert.ToString(Parameters.Created);
            TypeID_Insert_TextBox.Text = Convert.ToString(Parameters.TypeID);
            Modified_Insert_TextBox.Text = Convert.ToString(Parameters.Modified);
            return Parameters;
        }
        public Parameters Parameters_selectForUpdate(int ID)
        {
            Parameters = Parameters.Select(ID);
            ID_Update_TextBox.Text = Convert.ToString(Parameters.ID);
            Name_Update_TextBox.Text = Convert.ToString(Parameters.Name);
            Value_Update_TextBox.Text = Convert.ToString(Parameters.Value);
            MemberID_Update_TextBox.Text = Convert.ToString(Parameters.MemberID);
            Created_Update_TextBox.Text = Convert.ToString(Parameters.Created);
            TypeID_Update_TextBox.Text = Convert.ToString(Parameters.TypeID);
            Modified_Update_TextBox.Text = Convert.ToString(Parameters.Modified);
            return Parameters;
        }
        public Parameters Parameters_selectForDelete(int ID)
        {
            Parameters = Parameters.Select(ID);
            ID_Delete_TextBox.Text = Convert.ToString(Parameters.ID);
            Name_Delete_TextBox.Text = Convert.ToString(Parameters.Name);
            Value_Delete_TextBox.Text = Convert.ToString(Parameters.Value);
            MemberID_Delete_TextBox.Text = Convert.ToString(Parameters.MemberID);
            Created_Delete_TextBox.Text = Convert.ToString(Parameters.Created);
            TypeID_Delete_TextBox.Text = Convert.ToString(Parameters.TypeID);
            Modified_Delete_TextBox.Text = Convert.ToString(Parameters.Modified);
            return Parameters;
        }
        //Database CRUD Call Functions
        public Parameters Parameters_insert()
        {
            Parameters.Name = Name_Insert_TextBox.Text;
            Parameters.Created = Convert.ToDateTime(Created_Insert_TextBox.Text);
            Parameters.TypeID = Convert.ToInt32(TypeID_Insert_TextBox.Text);
            Parameters.Modified = Convert.ToDateTime(Modified_Insert_TextBox.Text);
            Parameters = Parameters.Insert(Parameters);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Parameters;
        }
        public Parameters Parameters_update(int ID)
        {
            Parameters = Parameters.Select(ID);
            Parameters.ID = Convert.ToInt32(Update_GridView.SelectedValue);
            Parameters.Name = Name_Update_TextBox.Text;
            Parameters.Created = Convert.ToDateTime(Created_Update_TextBox.Text);
            Parameters.TypeID = Convert.ToInt32(TypeID_Update_TextBox.Text);
            Parameters.Modified = Convert.ToDateTime(Modified_Update_TextBox.Text);
            Parameters.Update(Parameters);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return Parameters;
        }
        public void Parameters_delete(int ID)
        {
            Parameters.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            Parameters = Parameters_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            Parameters = Parameters_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            Parameters_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

