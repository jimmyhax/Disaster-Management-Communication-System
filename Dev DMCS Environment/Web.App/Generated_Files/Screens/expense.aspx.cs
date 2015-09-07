using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class expenseClass : System.Web.UI.Page
    {
        public expense expense = new expense();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            expense = expense_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            expense = expense_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            expense = expense_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public expense expense_selectForInsert(int ID)
        {
            expense = expense.Select(ID);
            case_id_Insert_TextBox.Text = Convert.ToString(expense.case_id);
            client_id_Insert_TextBox.Text = Convert.ToString(expense.client_id);
            date_paid_Insert_TextBox.Text = Convert.ToString(expense.date_paid);
            expense_amt_paid_Insert_TextBox.Text = Convert.ToString(expense.expense_amt_paid);
            expense_amt_paid_to_Insert_TextBox.Text = Convert.ToString(expense.expense_amt_paid_to);
            return expense;
        }
        public expense expense_selectForUpdate(int ID)
        {
            expense = expense.Select(ID);
            expense_id_Update_TextBox.Text = Convert.ToString(expense.expense_id);
            case_id_Update_TextBox.Text = Convert.ToString(expense.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(expense.client_id);
            date_paid_Update_TextBox.Text = Convert.ToString(expense.date_paid);
            expense_amt_paid_Update_TextBox.Text = Convert.ToString(expense.expense_amt_paid);
            expense_amt_paid_to_Update_TextBox.Text = Convert.ToString(expense.expense_amt_paid_to);
            return expense;
        }
        public expense expense_selectForDelete(int ID)
        {
            expense = expense.Select(ID);
            expense_id_Delete_TextBox.Text = Convert.ToString(expense.expense_id);
            case_id_Delete_TextBox.Text = Convert.ToString(expense.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(expense.client_id);
            date_paid_Delete_TextBox.Text = Convert.ToString(expense.date_paid);
            expense_amt_paid_Delete_TextBox.Text = Convert.ToString(expense.expense_amt_paid);
            expense_amt_paid_to_Delete_TextBox.Text = Convert.ToString(expense.expense_amt_paid_to);
            return expense;
        }
        //Database CRUD Call Functions
        public expense expense_insert()
        {
            expense.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            expense.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            expense.date_paid = Convert.ToDateTime(date_paid_Insert_TextBox.Text);
            expense.expense_amt_paid = Convert.ToDecimal(expense_amt_paid_Insert_TextBox.Text);
            expense.expense_amt_paid_to = expense_amt_paid_to_Insert_TextBox.Text;
            expense = expense.Insert(expense);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return expense;
        }
        public expense expense_update(int ID)
        {
            expense = expense.Select(ID);
            expense.expense_id = Convert.ToInt32(Update_GridView.SelectedValue);
            expense.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            expense.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            expense.date_paid = Convert.ToDateTime(date_paid_Update_TextBox.Text);
            expense.expense_amt_paid = Convert.ToDecimal(expense_amt_paid_Update_TextBox.Text);
            expense.expense_amt_paid_to = expense_amt_paid_to_Update_TextBox.Text;
            expense.Update(expense);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return expense;
        }
        public void expense_delete(int ID)
        {
            expense.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            expense = expense_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            expense = expense_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            expense_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

