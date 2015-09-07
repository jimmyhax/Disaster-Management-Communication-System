using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class ParameterTypesClass : System.Web.UI.Page
    {
        public ParameterTypes ParameterTypes = new ParameterTypes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ParameterTypes = ParameterTypes_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ParameterTypes = ParameterTypes_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ParameterTypes = ParameterTypes_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public ParameterTypes ParameterTypes_selectForInsert(int ID)
        {
            ParameterTypes = ParameterTypes.Select(ID);
            TypeName_Insert_TextBox.Text = Convert.ToString(ParameterTypes.TypeName);
            TypeSize_Insert_TextBox.Text = Convert.ToString(ParameterTypes.TypeSize);
            return ParameterTypes;
        }
        public ParameterTypes ParameterTypes_selectForUpdate(int ID)
        {
            ParameterTypes = ParameterTypes.Select(ID);
            TypeID_Update_TextBox.Text = Convert.ToString(ParameterTypes.TypeID);
            TypeName_Update_TextBox.Text = Convert.ToString(ParameterTypes.TypeName);
            TypeSize_Update_TextBox.Text = Convert.ToString(ParameterTypes.TypeSize);
            return ParameterTypes;
        }
        public ParameterTypes ParameterTypes_selectForDelete(int ID)
        {
            ParameterTypes = ParameterTypes.Select(ID);
            TypeID_Delete_TextBox.Text = Convert.ToString(ParameterTypes.TypeID);
            TypeName_Delete_TextBox.Text = Convert.ToString(ParameterTypes.TypeName);
            TypeSize_Delete_TextBox.Text = Convert.ToString(ParameterTypes.TypeSize);
            return ParameterTypes;
        }
        //Database CRUD Call Functions
        public ParameterTypes ParameterTypes_insert()
        {
            ParameterTypes.TypeName = TypeName_Insert_TextBox.Text;
            ParameterTypes.TypeSize = Convert.ToInt32(TypeSize_Insert_TextBox.Text);
            ParameterTypes = ParameterTypes.Insert(ParameterTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ParameterTypes;
        }
        public ParameterTypes ParameterTypes_update(int ID)
        {
            ParameterTypes = ParameterTypes.Select(ID);
            ParameterTypes.TypeID = Convert.ToInt32(Update_GridView.SelectedValue);
            ParameterTypes.TypeName = TypeName_Update_TextBox.Text;
            ParameterTypes.TypeSize = Convert.ToInt32(TypeSize_Update_TextBox.Text);
            ParameterTypes.Update(ParameterTypes);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return ParameterTypes;
        }
        public void ParameterTypes_delete(int ID)
        {
            ParameterTypes.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            ParameterTypes = ParameterTypes_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            ParameterTypes = ParameterTypes_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            ParameterTypes_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

