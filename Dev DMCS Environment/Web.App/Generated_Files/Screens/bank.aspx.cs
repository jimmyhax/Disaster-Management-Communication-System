using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class bankClass : System.Web.UI.Page
    {
        public bank bank = new bank();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            bank = bank_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            bank = bank_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            bank = bank_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public bank bank_selectForInsert(int ID)
        {
            bank = bank.Select(ID);
            Routing_Num_Insert_TextBox.Text = Convert.ToString(bank.Routing_Num);
            Name_Insert_TextBox.Text = Convert.ToString(bank.Name);
            IsFDIC_Insert_TextBox.Text = Convert.ToString(bank.IsFDIC);
            return bank;
        }
        public bank bank_selectForUpdate(int ID)
        {
            bank = bank.Select(ID);
            Bank_ID_Update_TextBox.Text = Convert.ToString(bank.Bank_ID);
            Routing_Num_Update_TextBox.Text = Convert.ToString(bank.Routing_Num);
            Name_Update_TextBox.Text = Convert.ToString(bank.Name);
            IsFDIC_Update_TextBox.Text = Convert.ToString(bank.IsFDIC);
            return bank;
        }
        public bank bank_selectForDelete(int ID)
        {
            bank = bank.Select(ID);
            Bank_ID_Delete_TextBox.Text = Convert.ToString(bank.Bank_ID);
            Routing_Num_Delete_TextBox.Text = Convert.ToString(bank.Routing_Num);
            Name_Delete_TextBox.Text = Convert.ToString(bank.Name);
            IsFDIC_Delete_TextBox.Text = Convert.ToString(bank.IsFDIC);
            return bank;
        }
        //Database CRUD Call Functions
        public bank bank_insert()
        {
            bank.Routing_Num = Routing_Num_Insert_TextBox.Text;
            bank.Name = Name_Insert_TextBox.Text;
            bank.IsFDIC = Convert.ToBoolean(IsFDIC_Insert_TextBox.Text);
            bank = bank.Insert(bank);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return bank;
        }
        public bank bank_update(int ID)
        {
            bank = bank.Select(ID);
            bank.Bank_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            bank.Routing_Num = Routing_Num_Update_TextBox.Text;
            bank.Name = Name_Update_TextBox.Text;
            bank.IsFDIC = Convert.ToBoolean(IsFDIC_Update_TextBox.Text);
            bank.Update(bank);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return bank;
        }
        public void bank_delete(int ID)
        {
            bank.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            bank = bank_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            bank = bank_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            bank_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

