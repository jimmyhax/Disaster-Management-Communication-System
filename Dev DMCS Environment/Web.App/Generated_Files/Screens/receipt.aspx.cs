using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class receiptClass : System.Web.UI.Page
    {
        public receipt receipt = new receipt();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            receipt = receipt_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            receipt = receipt_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            receipt = receipt_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public receipt receipt_selectForInsert(int ID)
        {
            receipt = receipt.Select(ID);
            Account_ID_Insert_TextBox.Text = Convert.ToString(receipt.Account_ID);
            Check_Num_Insert_TextBox.Text = Convert.ToString(receipt.Check_Num);
            DLN_Insert_TextBox.Text = Convert.ToString(receipt.DLN);
            Phone_Insert_TextBox.Text = Convert.ToString(receipt.Phone);
            Pay_Type_Insert_TextBox.Text = Convert.ToString(receipt.Pay_Type);
            Amount_Insert_TextBox.Text = Convert.ToString(receipt.Amount);
            Transfer_Insert_TextBox.Text = Convert.ToString(receipt.Transfer);
            Recieve_Insert_TextBox.Text = Convert.ToString(receipt.Recieve);
            return receipt;
        }
        public receipt receipt_selectForUpdate(int ID)
        {
            receipt = receipt.Select(ID);
            Receipt_ID_Update_TextBox.Text = Convert.ToString(receipt.Receipt_ID);
            Account_ID_Update_TextBox.Text = Convert.ToString(receipt.Account_ID);
            Check_Num_Update_TextBox.Text = Convert.ToString(receipt.Check_Num);
            DLN_Update_TextBox.Text = Convert.ToString(receipt.DLN);
            Phone_Update_TextBox.Text = Convert.ToString(receipt.Phone);
            Pay_Type_Update_TextBox.Text = Convert.ToString(receipt.Pay_Type);
            Amount_Update_TextBox.Text = Convert.ToString(receipt.Amount);
            Transfer_Update_TextBox.Text = Convert.ToString(receipt.Transfer);
            Recieve_Update_TextBox.Text = Convert.ToString(receipt.Recieve);
            return receipt;
        }
        public receipt receipt_selectForDelete(int ID)
        {
            receipt = receipt.Select(ID);
            Receipt_ID_Delete_TextBox.Text = Convert.ToString(receipt.Receipt_ID);
            Account_ID_Delete_TextBox.Text = Convert.ToString(receipt.Account_ID);
            Check_Num_Delete_TextBox.Text = Convert.ToString(receipt.Check_Num);
            DLN_Delete_TextBox.Text = Convert.ToString(receipt.DLN);
            Phone_Delete_TextBox.Text = Convert.ToString(receipt.Phone);
            Pay_Type_Delete_TextBox.Text = Convert.ToString(receipt.Pay_Type);
            Amount_Delete_TextBox.Text = Convert.ToString(receipt.Amount);
            Transfer_Delete_TextBox.Text = Convert.ToString(receipt.Transfer);
            Recieve_Delete_TextBox.Text = Convert.ToString(receipt.Recieve);
            return receipt;
        }
        //Database CRUD Call Functions
        public receipt receipt_insert()
        {
            receipt.Account_ID = Convert.ToInt32(Account_ID_Insert_TextBox.Text);
            receipt.Check_Num = Convert.ToInt32(Check_Num_Insert_TextBox.Text);
            receipt.DLN = Convert.ToInt32(DLN_Insert_TextBox.Text);
            receipt.Phone = Convert.ToInt32(Phone_Insert_TextBox.Text);
            receipt.Pay_Type = Convert.ToInt32(Pay_Type_Insert_TextBox.Text);
            receipt.Amount = Convert.ToInt32(Amount_Insert_TextBox.Text);
            receipt.Transfer = Convert.ToBoolean(Transfer_Insert_TextBox.Text);
            receipt.Recieve = Convert.ToBoolean(Recieve_Insert_TextBox.Text);
            receipt = receipt.Insert(receipt);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return receipt;
        }
        public receipt receipt_update(int ID)
        {
            receipt = receipt.Select(ID);
            receipt.Receipt_ID = Convert.ToInt32(Update_GridView.SelectedValue);
            receipt.Account_ID = Convert.ToInt32(Account_ID_Update_TextBox.Text);
            receipt.Check_Num = Convert.ToInt32(Check_Num_Update_TextBox.Text);
            receipt.DLN = Convert.ToInt32(DLN_Update_TextBox.Text);
            receipt.Phone = Convert.ToInt32(Phone_Update_TextBox.Text);
            receipt.Pay_Type = Convert.ToInt32(Pay_Type_Update_TextBox.Text);
            receipt.Amount = Convert.ToInt32(Amount_Update_TextBox.Text);
            receipt.Transfer = Convert.ToBoolean(Transfer_Update_TextBox.Text);
            receipt.Recieve = Convert.ToBoolean(Recieve_Update_TextBox.Text);
            receipt.Update(receipt);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return receipt;
        }
        public void receipt_delete(int ID)
        {
            receipt.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            receipt = receipt_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            receipt = receipt_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            receipt_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

