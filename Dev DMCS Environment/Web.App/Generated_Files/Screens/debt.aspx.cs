using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class debtClass : System.Web.UI.Page
    {
        public debt debt = new debt();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            debt = debt_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            debt = debt_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            debt = debt_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public debt debt_selectForInsert(int ID)
        {
            debt = debt.Select(ID);
            amt_paid_Insert_TextBox.Text = Convert.ToString(debt.amt_paid);
            case_id_Insert_TextBox.Text = Convert.ToString(debt.case_id);
            client_id_Insert_TextBox.Text = Convert.ToString(debt.client_id);
            creditor_name_Insert_TextBox.Text = Convert.ToString(debt.creditor_name);
            debt_amt_Insert_TextBox.Text = Convert.ToString(debt.debt_amt);
            item_purchased_Insert_TextBox.Text = Convert.ToString(debt.item_purchased);
            last_payment_date_Insert_TextBox.Text = Convert.ToString(debt.last_payment_date);
            purchase_date_Insert_TextBox.Text = Convert.ToString(debt.purchase_date);
            value_amt_Insert_TextBox.Text = Convert.ToString(debt.value_amt);
            return debt;
        }
        public debt debt_selectForUpdate(int ID)
        {
            debt = debt.Select(ID);
            debt_id_Update_TextBox.Text = Convert.ToString(debt.debt_id);
            amt_paid_Update_TextBox.Text = Convert.ToString(debt.amt_paid);
            case_id_Update_TextBox.Text = Convert.ToString(debt.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(debt.client_id);
            creditor_name_Update_TextBox.Text = Convert.ToString(debt.creditor_name);
            debt_amt_Update_TextBox.Text = Convert.ToString(debt.debt_amt);
            item_purchased_Update_TextBox.Text = Convert.ToString(debt.item_purchased);
            last_payment_date_Update_TextBox.Text = Convert.ToString(debt.last_payment_date);
            purchase_date_Update_TextBox.Text = Convert.ToString(debt.purchase_date);
            value_amt_Update_TextBox.Text = Convert.ToString(debt.value_amt);
            return debt;
        }
        public debt debt_selectForDelete(int ID)
        {
            debt = debt.Select(ID);
            debt_id_Delete_TextBox.Text = Convert.ToString(debt.debt_id);
            amt_paid_Delete_TextBox.Text = Convert.ToString(debt.amt_paid);
            case_id_Delete_TextBox.Text = Convert.ToString(debt.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(debt.client_id);
            creditor_name_Delete_TextBox.Text = Convert.ToString(debt.creditor_name);
            debt_amt_Delete_TextBox.Text = Convert.ToString(debt.debt_amt);
            item_purchased_Delete_TextBox.Text = Convert.ToString(debt.item_purchased);
            last_payment_date_Delete_TextBox.Text = Convert.ToString(debt.last_payment_date);
            purchase_date_Delete_TextBox.Text = Convert.ToString(debt.purchase_date);
            value_amt_Delete_TextBox.Text = Convert.ToString(debt.value_amt);
            return debt;
        }
        //Database CRUD Call Functions
        public debt debt_insert()
        {
            debt.amt_paid = Convert.ToDecimal(amt_paid_Insert_TextBox.Text);
            debt.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            debt.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            debt.creditor_name = creditor_name_Insert_TextBox.Text;
            debt.debt_amt = Convert.ToDecimal(debt_amt_Insert_TextBox.Text);
            debt.item_purchased = item_purchased_Insert_TextBox.Text;
            debt.last_payment_date = Convert.ToDateTime(last_payment_date_Insert_TextBox.Text);
            debt.purchase_date = Convert.ToDateTime(purchase_date_Insert_TextBox.Text);
            debt.value_amt = Convert.ToDecimal(value_amt_Insert_TextBox.Text);
            debt = debt.Insert(debt);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return debt;
        }
        public debt debt_update(int ID)
        {
            debt = debt.Select(ID);
            debt.debt_id = Convert.ToInt32(Update_GridView.SelectedValue);
            debt.amt_paid = Convert.ToDecimal(amt_paid_Update_TextBox.Text);
            debt.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            debt.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            debt.creditor_name = creditor_name_Update_TextBox.Text;
            debt.debt_amt = Convert.ToDecimal(debt_amt_Update_TextBox.Text);
            debt.item_purchased = item_purchased_Update_TextBox.Text;
            debt.last_payment_date = Convert.ToDateTime(last_payment_date_Update_TextBox.Text);
            debt.purchase_date = Convert.ToDateTime(purchase_date_Update_TextBox.Text);
            debt.value_amt = Convert.ToDecimal(value_amt_Update_TextBox.Text);
            debt.Update(debt);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return debt;
        }
        public void debt_delete(int ID)
        {
            debt.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            debt = debt_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            debt = debt_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            debt_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

