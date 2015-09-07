using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class income_sourceClass : System.Web.UI.Page
    {
        public income_source income_source = new income_source();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            income_source = income_source_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            income_source = income_source_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            income_source = income_source_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public income_source income_source_selectForInsert(int ID)
        {
            income_source = income_source.Select(ID);
            case_id_Insert_TextBox.Text = Convert.ToString(income_source.case_id);
            cash_amt_Insert_TextBox.Text = Convert.ToString(income_source.cash_amt);
            cash_on_hand_Insert_TextBox.Text = Convert.ToString(income_source.cash_on_hand);
            wages_stopped_Insert_TextBox.Text = Convert.ToString(income_source.wages_stopped);
            waiting_on_income_Insert_TextBox.Text = Convert.ToString(income_source.waiting_on_income);
            recieving_income_Insert_TextBox.Text = Convert.ToString(income_source.recieving_income);
            no_income_Insert_TextBox.Text = Convert.ToString(income_source.no_income);
            currently_working_Insert_TextBox.Text = Convert.ToString(income_source.currently_working);
            laid_off_Insert_TextBox.Text = Convert.ToString(income_source.laid_off);
            never_worked_Insert_TextBox.Text = Convert.ToString(income_source.never_worked);
            quit_Insert_TextBox.Text = Convert.ToString(income_source.quit);
            fired_Insert_TextBox.Text = Convert.ToString(income_source.fired);
            sick_leave_Insert_TextBox.Text = Convert.ToString(income_source.sick_leave);
            maternity_leave_Insert_TextBox.Text = Convert.ToString(income_source.maternity_leave);
            on_strike_Insert_TextBox.Text = Convert.ToString(income_source.on_strike);
            trying_to_find_work_Insert_TextBox.Text = Convert.ToString(income_source.trying_to_find_work);
            ckg_acct_Insert_TextBox.Text = Convert.ToString(income_source.ckg_acct);
            ckg_balance_Insert_TextBox.Text = Convert.ToString(income_source.ckg_balance);
            ckg_bank_Insert_TextBox.Text = Convert.ToString(income_source.ckg_bank);
            claims_Insert_TextBox.Text = Convert.ToString(income_source.claims);
            claims_memo_Insert_TextBox.Text = Convert.ToString(income_source.claims_memo);
            client_id_Insert_TextBox.Text = Convert.ToString(income_source.client_id);
            gifts_amt_Insert_TextBox.Text = Convert.ToString(income_source.gifts_amt);
            gifts_inc_Insert_TextBox.Text = Convert.ToString(income_source.gifts_inc);
            investments_Insert_TextBox.Text = Convert.ToString(income_source.investments);
            life_ins_Insert_TextBox.Text = Convert.ToString(income_source.life_ins);
            other_ins_Insert_TextBox.Text = Convert.ToString(income_source.other_ins);
            pension_amt_Insert_TextBox.Text = Convert.ToString(income_source.pension_amt);
            pension_inc_Insert_TextBox.Text = Convert.ToString(income_source.pension_inc);
            strike_benefits_amt_Insert_TextBox.Text = Convert.ToString(income_source.strike_benefits_amt);
            strike_benefits_inc_Insert_TextBox.Text = Convert.ToString(income_source.strike_benefits_inc);
            support_amt_Insert_TextBox.Text = Convert.ToString(income_source.support_amt);
            support_inc_Insert_TextBox.Text = Convert.ToString(income_source.support_inc);
            SSI_Amt_Insert_TextBox.Text = Convert.ToString(income_source.SSI_Amt);
            SSI_Inc_Insert_TextBox.Text = Convert.ToString(income_source.SSI_Inc);
            svgs_acct_Insert_TextBox.Text = Convert.ToString(income_source.svgs_acct);
            svgs_balance_Insert_TextBox.Text = Convert.ToString(income_source.svgs_balance);
            svgs_bank_Insert_TextBox.Text = Convert.ToString(income_source.svgs_bank);
            wages_amt_Insert_TextBox.Text = Convert.ToString(income_source.wages_amt);
            wages_inc_Insert_TextBox.Text = Convert.ToString(income_source.wages_inc);
            return income_source;
        }
        public income_source income_source_selectForUpdate(int ID)
        {
            income_source = income_source.Select(ID);
            income_source_id_Update_TextBox.Text = Convert.ToString(income_source.income_source_id);
            case_id_Update_TextBox.Text = Convert.ToString(income_source.case_id);
            cash_amt_Update_TextBox.Text = Convert.ToString(income_source.cash_amt);
            cash_on_hand_Update_TextBox.Text = Convert.ToString(income_source.cash_on_hand);
            wages_stopped_Update_TextBox.Text = Convert.ToString(income_source.wages_stopped);
            waiting_on_income_Update_TextBox.Text = Convert.ToString(income_source.waiting_on_income);
            recieving_income_Update_TextBox.Text = Convert.ToString(income_source.recieving_income);
            no_income_Update_TextBox.Text = Convert.ToString(income_source.no_income);
            currently_working_Update_TextBox.Text = Convert.ToString(income_source.currently_working);
            laid_off_Update_TextBox.Text = Convert.ToString(income_source.laid_off);
            never_worked_Update_TextBox.Text = Convert.ToString(income_source.never_worked);
            quit_Update_TextBox.Text = Convert.ToString(income_source.quit);
            fired_Update_TextBox.Text = Convert.ToString(income_source.fired);
            sick_leave_Update_TextBox.Text = Convert.ToString(income_source.sick_leave);
            maternity_leave_Update_TextBox.Text = Convert.ToString(income_source.maternity_leave);
            on_strike_Update_TextBox.Text = Convert.ToString(income_source.on_strike);
            trying_to_find_work_Update_TextBox.Text = Convert.ToString(income_source.trying_to_find_work);
            ckg_acct_Update_TextBox.Text = Convert.ToString(income_source.ckg_acct);
            ckg_balance_Update_TextBox.Text = Convert.ToString(income_source.ckg_balance);
            ckg_bank_Update_TextBox.Text = Convert.ToString(income_source.ckg_bank);
            claims_Update_TextBox.Text = Convert.ToString(income_source.claims);
            claims_memo_Update_TextBox.Text = Convert.ToString(income_source.claims_memo);
            client_id_Update_TextBox.Text = Convert.ToString(income_source.client_id);
            gifts_amt_Update_TextBox.Text = Convert.ToString(income_source.gifts_amt);
            gifts_inc_Update_TextBox.Text = Convert.ToString(income_source.gifts_inc);
            investments_Update_TextBox.Text = Convert.ToString(income_source.investments);
            life_ins_Update_TextBox.Text = Convert.ToString(income_source.life_ins);
            other_ins_Update_TextBox.Text = Convert.ToString(income_source.other_ins);
            pension_amt_Update_TextBox.Text = Convert.ToString(income_source.pension_amt);
            pension_inc_Update_TextBox.Text = Convert.ToString(income_source.pension_inc);
            strike_benefits_amt_Update_TextBox.Text = Convert.ToString(income_source.strike_benefits_amt);
            strike_benefits_inc_Update_TextBox.Text = Convert.ToString(income_source.strike_benefits_inc);
            support_amt_Update_TextBox.Text = Convert.ToString(income_source.support_amt);
            support_inc_Update_TextBox.Text = Convert.ToString(income_source.support_inc);
            SSI_Amt_Update_TextBox.Text = Convert.ToString(income_source.SSI_Amt);
            SSI_Inc_Update_TextBox.Text = Convert.ToString(income_source.SSI_Inc);
            svgs_acct_Update_TextBox.Text = Convert.ToString(income_source.svgs_acct);
            svgs_balance_Update_TextBox.Text = Convert.ToString(income_source.svgs_balance);
            svgs_bank_Update_TextBox.Text = Convert.ToString(income_source.svgs_bank);
            wages_amt_Update_TextBox.Text = Convert.ToString(income_source.wages_amt);
            wages_inc_Update_TextBox.Text = Convert.ToString(income_source.wages_inc);
            return income_source;
        }
        public income_source income_source_selectForDelete(int ID)
        {
            income_source = income_source.Select(ID);
            income_source_id_Delete_TextBox.Text = Convert.ToString(income_source.income_source_id);
            case_id_Delete_TextBox.Text = Convert.ToString(income_source.case_id);
            cash_amt_Delete_TextBox.Text = Convert.ToString(income_source.cash_amt);
            cash_on_hand_Delete_TextBox.Text = Convert.ToString(income_source.cash_on_hand);
            wages_stopped_Delete_TextBox.Text = Convert.ToString(income_source.wages_stopped);
            waiting_on_income_Delete_TextBox.Text = Convert.ToString(income_source.waiting_on_income);
            recieving_income_Delete_TextBox.Text = Convert.ToString(income_source.recieving_income);
            no_income_Delete_TextBox.Text = Convert.ToString(income_source.no_income);
            currently_working_Delete_TextBox.Text = Convert.ToString(income_source.currently_working);
            laid_off_Delete_TextBox.Text = Convert.ToString(income_source.laid_off);
            never_worked_Delete_TextBox.Text = Convert.ToString(income_source.never_worked);
            quit_Delete_TextBox.Text = Convert.ToString(income_source.quit);
            fired_Delete_TextBox.Text = Convert.ToString(income_source.fired);
            sick_leave_Delete_TextBox.Text = Convert.ToString(income_source.sick_leave);
            maternity_leave_Delete_TextBox.Text = Convert.ToString(income_source.maternity_leave);
            on_strike_Delete_TextBox.Text = Convert.ToString(income_source.on_strike);
            trying_to_find_work_Delete_TextBox.Text = Convert.ToString(income_source.trying_to_find_work);
            ckg_acct_Delete_TextBox.Text = Convert.ToString(income_source.ckg_acct);
            ckg_balance_Delete_TextBox.Text = Convert.ToString(income_source.ckg_balance);
            ckg_bank_Delete_TextBox.Text = Convert.ToString(income_source.ckg_bank);
            claims_Delete_TextBox.Text = Convert.ToString(income_source.claims);
            claims_memo_Delete_TextBox.Text = Convert.ToString(income_source.claims_memo);
            client_id_Delete_TextBox.Text = Convert.ToString(income_source.client_id);
            gifts_amt_Delete_TextBox.Text = Convert.ToString(income_source.gifts_amt);
            gifts_inc_Delete_TextBox.Text = Convert.ToString(income_source.gifts_inc);
            investments_Delete_TextBox.Text = Convert.ToString(income_source.investments);
            life_ins_Delete_TextBox.Text = Convert.ToString(income_source.life_ins);
            other_ins_Delete_TextBox.Text = Convert.ToString(income_source.other_ins);
            pension_amt_Delete_TextBox.Text = Convert.ToString(income_source.pension_amt);
            pension_inc_Delete_TextBox.Text = Convert.ToString(income_source.pension_inc);
            strike_benefits_amt_Delete_TextBox.Text = Convert.ToString(income_source.strike_benefits_amt);
            strike_benefits_inc_Delete_TextBox.Text = Convert.ToString(income_source.strike_benefits_inc);
            support_amt_Delete_TextBox.Text = Convert.ToString(income_source.support_amt);
            support_inc_Delete_TextBox.Text = Convert.ToString(income_source.support_inc);
            SSI_Amt_Delete_TextBox.Text = Convert.ToString(income_source.SSI_Amt);
            SSI_Inc_Delete_TextBox.Text = Convert.ToString(income_source.SSI_Inc);
            svgs_acct_Delete_TextBox.Text = Convert.ToString(income_source.svgs_acct);
            svgs_balance_Delete_TextBox.Text = Convert.ToString(income_source.svgs_balance);
            svgs_bank_Delete_TextBox.Text = Convert.ToString(income_source.svgs_bank);
            wages_amt_Delete_TextBox.Text = Convert.ToString(income_source.wages_amt);
            wages_inc_Delete_TextBox.Text = Convert.ToString(income_source.wages_inc);
            return income_source;
        }
        //Database CRUD Call Functions
        public income_source income_source_insert()
        {
            income_source.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            income_source.cash_amt = Convert.ToDecimal(cash_amt_Insert_TextBox.Text);
            income_source.cash_on_hand = cash_on_hand_Insert_TextBox.Text;
            income_source.wages_stopped = wages_stopped_Insert_TextBox.Text;
            income_source.waiting_on_income = waiting_on_income_Insert_TextBox.Text;
            income_source.recieving_income = recieving_income_Insert_TextBox.Text;
            income_source.no_income = no_income_Insert_TextBox.Text;
            income_source.currently_working = currently_working_Insert_TextBox.Text;
            income_source.laid_off = laid_off_Insert_TextBox.Text;
            income_source.never_worked = never_worked_Insert_TextBox.Text;
            income_source.quit = quit_Insert_TextBox.Text;
            income_source.fired = fired_Insert_TextBox.Text;
            income_source.sick_leave = sick_leave_Insert_TextBox.Text;
            income_source.maternity_leave = maternity_leave_Insert_TextBox.Text;
            income_source.on_strike = on_strike_Insert_TextBox.Text;
            income_source.trying_to_find_work = trying_to_find_work_Insert_TextBox.Text;
            income_source.ckg_acct = ckg_acct_Insert_TextBox.Text;
            income_source.ckg_balance = Convert.ToDecimal(ckg_balance_Insert_TextBox.Text);
            income_source.ckg_bank = ckg_bank_Insert_TextBox.Text;
            income_source.claims = claims_Insert_TextBox.Text;
            income_source.claims_memo = claims_memo_Insert_TextBox.Text;
            income_source.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            income_source.gifts_amt = Convert.ToDecimal(gifts_amt_Insert_TextBox.Text);
            income_source.gifts_inc = gifts_inc_Insert_TextBox.Text;
            income_source.investments = investments_Insert_TextBox.Text;
            income_source.life_ins = life_ins_Insert_TextBox.Text;
            income_source.other_ins = other_ins_Insert_TextBox.Text;
            income_source.pension_amt = Convert.ToDecimal(pension_amt_Insert_TextBox.Text);
            income_source.pension_inc = pension_inc_Insert_TextBox.Text;
            income_source.strike_benefits_amt = Convert.ToDecimal(strike_benefits_amt_Insert_TextBox.Text);
            income_source.strike_benefits_inc = strike_benefits_inc_Insert_TextBox.Text;
            income_source.support_amt = Convert.ToDecimal(support_amt_Insert_TextBox.Text);
            income_source.support_inc = support_inc_Insert_TextBox.Text;
            income_source.SSI_Amt = Convert.ToDecimal(SSI_Amt_Insert_TextBox.Text);
            income_source.SSI_Inc = SSI_Inc_Insert_TextBox.Text;
            income_source.svgs_acct = svgs_acct_Insert_TextBox.Text;
            income_source.svgs_balance = Convert.ToDecimal(svgs_balance_Insert_TextBox.Text);
            income_source.svgs_bank = svgs_bank_Insert_TextBox.Text;
            income_source.wages_amt = Convert.ToDecimal(wages_amt_Insert_TextBox.Text);
            income_source.wages_inc = wages_inc_Insert_TextBox.Text;
            income_source = income_source.Insert(income_source);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return income_source;
        }
        public income_source income_source_update(int ID)
        {
            income_source = income_source.Select(ID);
            income_source.income_source_id = Convert.ToInt32(Update_GridView.SelectedValue);
            income_source.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            income_source.cash_amt = Convert.ToDecimal(cash_amt_Update_TextBox.Text);
            income_source.cash_on_hand = cash_on_hand_Update_TextBox.Text;
            income_source.wages_stopped = wages_stopped_Update_TextBox.Text;
            income_source.waiting_on_income = waiting_on_income_Update_TextBox.Text;
            income_source.recieving_income = recieving_income_Update_TextBox.Text;
            income_source.no_income = no_income_Update_TextBox.Text;
            income_source.currently_working = currently_working_Update_TextBox.Text;
            income_source.laid_off = laid_off_Update_TextBox.Text;
            income_source.never_worked = never_worked_Update_TextBox.Text;
            income_source.quit = quit_Update_TextBox.Text;
            income_source.fired = fired_Update_TextBox.Text;
            income_source.sick_leave = sick_leave_Update_TextBox.Text;
            income_source.maternity_leave = maternity_leave_Update_TextBox.Text;
            income_source.on_strike = on_strike_Update_TextBox.Text;
            income_source.trying_to_find_work = trying_to_find_work_Update_TextBox.Text;
            income_source.ckg_acct = ckg_acct_Update_TextBox.Text;
            income_source.ckg_balance = Convert.ToDecimal(ckg_balance_Update_TextBox.Text);
            income_source.ckg_bank = ckg_bank_Update_TextBox.Text;
            income_source.claims = claims_Update_TextBox.Text;
            income_source.claims_memo = claims_memo_Update_TextBox.Text;
            income_source.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            income_source.gifts_amt = Convert.ToDecimal(gifts_amt_Update_TextBox.Text);
            income_source.gifts_inc = gifts_inc_Update_TextBox.Text;
            income_source.investments = investments_Update_TextBox.Text;
            income_source.life_ins = life_ins_Update_TextBox.Text;
            income_source.other_ins = other_ins_Update_TextBox.Text;
            income_source.pension_amt = Convert.ToDecimal(pension_amt_Update_TextBox.Text);
            income_source.pension_inc = pension_inc_Update_TextBox.Text;
            income_source.strike_benefits_amt = Convert.ToDecimal(strike_benefits_amt_Update_TextBox.Text);
            income_source.strike_benefits_inc = strike_benefits_inc_Update_TextBox.Text;
            income_source.support_amt = Convert.ToDecimal(support_amt_Update_TextBox.Text);
            income_source.support_inc = support_inc_Update_TextBox.Text;
            income_source.SSI_Amt = Convert.ToDecimal(SSI_Amt_Update_TextBox.Text);
            income_source.SSI_Inc = SSI_Inc_Update_TextBox.Text;
            income_source.svgs_acct = svgs_acct_Update_TextBox.Text;
            income_source.svgs_balance = Convert.ToDecimal(svgs_balance_Update_TextBox.Text);
            income_source.svgs_bank = svgs_bank_Update_TextBox.Text;
            income_source.wages_amt = Convert.ToDecimal(wages_amt_Update_TextBox.Text);
            income_source.wages_inc = wages_inc_Update_TextBox.Text;
            income_source.Update(income_source);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return income_source;
        }
        public void income_source_delete(int ID)
        {
            income_source.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            income_source = income_source_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            income_source = income_source_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            income_source_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

