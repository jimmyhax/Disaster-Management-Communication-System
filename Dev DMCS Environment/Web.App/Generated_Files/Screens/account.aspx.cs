using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class accountClass : System.Web.UI.Page
    {
        public account account = new account();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            account = account_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            account = account_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            account = account_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public account account_selectForInsert(int ID)
        {
            account = account.Select(ID);
            Bank_ID_Insert_TextBox.Text = Convert.ToString(account.Bank_ID);
            Account_Num_Insert_TextBox.Text = Convert.ToString(account.Account_Num);
            Type_Insert_TextBox.Text = Convert.ToString(account.Type);
            return account;
        }
        public account account_selectForUpdate(int ID)
        {
            account = account.Select(ID);
            Account_ID_Update_TextBox.Text = Convert.ToString(account.Account_ID);
            Bank_ID_Update_TextBox.Text = Convert.ToString(account.Bank_ID);
            Account_Num_Update_TextBox.Text = Convert.ToString(account.Account_Num);
            Type_Update_TextBox.Text = Convert.ToString(account.Type);
            return account;
        }
        public account account_selectForDelete(int ID)
        {
            account = account.Select(ID);
            Account_ID_Delete_TextBox.Text = Convert.ToString(account.Account_ID);
            Bank_ID_Delete_TextBox.Text = Convert.ToString(account.Bank_ID);
            Account_Num_Delete_TextBox.Text = Convert.ToString(account.Account_Num);
            Type_Delete_TextBox.Text = Convert.ToString(account.Type);
            return account;
        }
        //Database CRUD Call Functions
        public account account_insert()
        {
            account.Bank_ID = Convert.ToInt32(Bank_ID_Insert_TextBox.Text);
            account.Account_Num = Account_Num_Insert_TextBox.Text;
            account.Type = Type_Insert_TextBox.Text;
            account = account.Insert(account);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return account;
        }
        public account account_update(int ID)
        {
            account = account.Select(ID);
            account.Account_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            account.Bank_ID = Convert.ToInt32(Bank_ID_Update_TextBox.Text);
            account.Account_Num = Account_Num_Update_TextBox.Text;
            account.Type = Type_Update_TextBox.Text;
            account.Update(account);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return account;
        }
        public void account_delete(int ID)
        {
            account.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            account = account_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            account = account_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            account_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

