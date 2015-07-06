using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;
using System.Web.Mvc;
using DMCS.App_Code;

namespace DMCS.SandBox.Generated
{
public partial class income_source_Screen : System.Web.UI.Page
{
            public income_source income_source = new income_source();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!ClientScript.IsStartupScriptRegistered("initialize"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "initialize", "initialize();", true);
        }
        if (!Page.IsPostBack)
        {   }
    }
    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Insert Tab Methods
    protected void Insert_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Insert_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        income_source = Insert_income_source_select(Convert.ToInt32(Insert_income_source_GridView.SelectedValue));
    }
    public income_source Insert_income_source_select(int ID)
    {
        income_source = income_source.Select(ID);
        Insert_case_id_txt.Text = Convert.ToString(income_source.case_id);
        Insert_cash_amt_txt.Text = Convert.ToString(income_source.cash_amt);
        Insert_cash_on_hand_txt.Text = Convert.ToString(income_source.cash_on_hand);
        Insert_wages_stopped_txt.Text = Convert.ToString(income_source.wages_stopped);
        Insert_waiting_on_income_txt.Text = Convert.ToString(income_source.waiting_on_income);
        Insert_recieving_income_txt.Text = Convert.ToString(income_source.recieving_income);
        Insert_no_income_txt.Text = Convert.ToString(income_source.no_income);
        Insert_currently_working_txt.Text = Convert.ToString(income_source.currently_working);
        Insert_laid_off_txt.Text = Convert.ToString(income_source.laid_off);
        Insert_never_worked_txt.Text = Convert.ToString(income_source.never_worked);
        Insert_quit_txt.Text = Convert.ToString(income_source.quit);
        Insert_fired_txt.Text = Convert.ToString(income_source.fired);
        Insert_sick_leave_txt.Text = Convert.ToString(income_source.sick_leave);
        Insert_maternity_leave_txt.Text = Convert.ToString(income_source.maternity_leave);
        Insert_on_strike_txt.Text = Convert.ToString(income_source.on_strike);
        Insert_trying_to_find_work_txt.Text = Convert.ToString(income_source.trying_to_find_work);
        Insert_ckg_acct_txt.Text = Convert.ToString(income_source.ckg_acct);
        Insert_ckg_balance_txt.Text = Convert.ToString(income_source.ckg_balance);
        Insert_ckg_bank_txt.Text = Convert.ToString(income_source.ckg_bank);
        Insert_claims_txt.Text = Convert.ToString(income_source.claims);
        Insert_claims_memo_txt.Text = Convert.ToString(income_source.claims_memo);
        Insert_client_id_txt.Text = Convert.ToString(income_source.client_id);
        Insert_gifts_amt_txt.Text = Convert.ToString(income_source.gifts_amt);
        Insert_gifts_inc_txt.Text = Convert.ToString(income_source.gifts_inc);
        Insert_investments_txt.Text = Convert.ToString(income_source.investments);
        Insert_life_ins_txt.Text = Convert.ToString(income_source.life_ins);
        Insert_other_ins_txt.Text = Convert.ToString(income_source.other_ins);
        Insert_pension_amt_txt.Text = Convert.ToString(income_source.pension_amt);
        Insert_pension_inc_txt.Text = Convert.ToString(income_source.pension_inc);
        Insert_strike_benefits_amt_txt.Text = Convert.ToString(income_source.strike_benefits_amt);
        Insert_strike_benefits_inc_txt.Text = Convert.ToString(income_source.strike_benefits_inc);
        Insert_support_amt_txt.Text = Convert.ToString(income_source.support_amt);
        Insert_support_inc_txt.Text = Convert.ToString(income_source.support_inc);
        Insert_SSI_Amt_txt.Text = Convert.ToString(income_source.SSI_Amt);
        Insert_SSI_Inc_txt.Text = Convert.ToString(income_source.SSI_Inc);
        Insert_svgs_acct_txt.Text = Convert.ToString(income_source.svgs_acct);
        Insert_svgs_balance_txt.Text = Convert.ToString(income_source.svgs_balance);
        Insert_svgs_bank_txt.Text = Convert.ToString(income_source.svgs_bank);
        Insert_wages_amt_txt.Text = Convert.ToString(income_source.wages_amt);
        Insert_wages_inc_txt.Text = Convert.ToString(income_source.wages_inc);
        return income_source;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        income_source = income_source_insert();
    }
    public income_source income_source_insert()
    {
        income_source.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        income_source.cash_amt = Convert.ToDecimal(Insert_cash_amt_txt.Text);
        income_source.cash_on_hand = Insert_cash_on_hand_txt.Text;
        income_source.wages_stopped = Insert_wages_stopped_txt.Text;
        income_source.waiting_on_income = Insert_waiting_on_income_txt.Text;
        income_source.recieving_income = Insert_recieving_income_txt.Text;
        income_source.no_income = Insert_no_income_txt.Text;
        income_source.currently_working = Insert_currently_working_txt.Text;
        income_source.laid_off = Insert_laid_off_txt.Text;
        income_source.never_worked = Insert_never_worked_txt.Text;
        income_source.quit = Insert_quit_txt.Text;
        income_source.fired = Insert_fired_txt.Text;
        income_source.sick_leave = Insert_sick_leave_txt.Text;
        income_source.maternity_leave = Insert_maternity_leave_txt.Text;
        income_source.on_strike = Insert_on_strike_txt.Text;
        income_source.trying_to_find_work = Insert_trying_to_find_work_txt.Text;
        income_source.ckg_acct = Insert_ckg_acct_txt.Text;
        income_source.ckg_balance = Convert.ToDecimal(Insert_ckg_balance_txt.Text);
        income_source.ckg_bank = Insert_ckg_bank_txt.Text;
        income_source.claims = Insert_claims_txt.Text;
        income_source.claims_memo = Insert_claims_memo_txt.Text;
        income_source.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        income_source.gifts_amt = Convert.ToDecimal(Insert_gifts_amt_txt.Text);
        income_source.gifts_inc = Insert_gifts_inc_txt.Text;
        income_source.investments = Insert_investments_txt.Text;
        income_source.life_ins = Insert_life_ins_txt.Text;
        income_source.other_ins = Insert_other_ins_txt.Text;
        income_source.pension_amt = Convert.ToDecimal(Insert_pension_amt_txt.Text);
        income_source.pension_inc = Insert_pension_inc_txt.Text;
        income_source.strike_benefits_amt = Convert.ToDecimal(Insert_strike_benefits_amt_txt.Text);
        income_source.strike_benefits_inc = Insert_strike_benefits_inc_txt.Text;
        income_source.support_amt = Convert.ToDecimal(Insert_support_amt_txt.Text);
        income_source.support_inc = Insert_support_inc_txt.Text;
        income_source.SSI_Amt = Convert.ToDecimal(Insert_SSI_Amt_txt.Text);
        income_source.SSI_Inc = Insert_SSI_Inc_txt.Text;
        income_source.svgs_acct = Insert_svgs_acct_txt.Text;
        income_source.svgs_balance = Convert.ToDecimal(Insert_svgs_balance_txt.Text);
        income_source.svgs_bank = Insert_svgs_bank_txt.Text;
        income_source.wages_amt = Convert.ToDecimal(Insert_wages_amt_txt.Text);
        income_source.wages_inc = Insert_wages_inc_txt.Text;
        income_source = income_source.Insert(income_source);
        Insert_income_source_GridView.DataBind();
        Update_income_source_GridView.DataBind();
        Delete_income_source_GridView.DataBind();
        return income_source;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Update_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        income_source = Update_income_source_select(Convert.ToInt32(Update_income_source_GridView.SelectedValue));
    }
    public income_source Update_income_source_select(int ID)
    {
        income_source = income_source.Select(ID);
        Update_income_source_id_txt.Text = Convert.ToString(income_source.income_source_id);
        Update_case_id_txt.Text = Convert.ToString(income_source.case_id);
        Update_cash_amt_txt.Text = Convert.ToString(income_source.cash_amt);
        Update_cash_on_hand_txt.Text = Convert.ToString(income_source.cash_on_hand);
        Update_wages_stopped_txt.Text = Convert.ToString(income_source.wages_stopped);
        Update_waiting_on_income_txt.Text = Convert.ToString(income_source.waiting_on_income);
        Update_recieving_income_txt.Text = Convert.ToString(income_source.recieving_income);
        Update_no_income_txt.Text = Convert.ToString(income_source.no_income);
        Update_currently_working_txt.Text = Convert.ToString(income_source.currently_working);
        Update_laid_off_txt.Text = Convert.ToString(income_source.laid_off);
        Update_never_worked_txt.Text = Convert.ToString(income_source.never_worked);
        Update_quit_txt.Text = Convert.ToString(income_source.quit);
        Update_fired_txt.Text = Convert.ToString(income_source.fired);
        Update_sick_leave_txt.Text = Convert.ToString(income_source.sick_leave);
        Update_maternity_leave_txt.Text = Convert.ToString(income_source.maternity_leave);
        Update_on_strike_txt.Text = Convert.ToString(income_source.on_strike);
        Update_trying_to_find_work_txt.Text = Convert.ToString(income_source.trying_to_find_work);
        Update_ckg_acct_txt.Text = Convert.ToString(income_source.ckg_acct);
        Update_ckg_balance_txt.Text = Convert.ToString(income_source.ckg_balance);
        Update_ckg_bank_txt.Text = Convert.ToString(income_source.ckg_bank);
        Update_claims_txt.Text = Convert.ToString(income_source.claims);
        Update_claims_memo_txt.Text = Convert.ToString(income_source.claims_memo);
        Update_client_id_txt.Text = Convert.ToString(income_source.client_id);
        Update_gifts_amt_txt.Text = Convert.ToString(income_source.gifts_amt);
        Update_gifts_inc_txt.Text = Convert.ToString(income_source.gifts_inc);
        Update_investments_txt.Text = Convert.ToString(income_source.investments);
        Update_life_ins_txt.Text = Convert.ToString(income_source.life_ins);
        Update_other_ins_txt.Text = Convert.ToString(income_source.other_ins);
        Update_pension_amt_txt.Text = Convert.ToString(income_source.pension_amt);
        Update_pension_inc_txt.Text = Convert.ToString(income_source.pension_inc);
        Update_strike_benefits_amt_txt.Text = Convert.ToString(income_source.strike_benefits_amt);
        Update_strike_benefits_inc_txt.Text = Convert.ToString(income_source.strike_benefits_inc);
        Update_support_amt_txt.Text = Convert.ToString(income_source.support_amt);
        Update_support_inc_txt.Text = Convert.ToString(income_source.support_inc);
        Update_SSI_Amt_txt.Text = Convert.ToString(income_source.SSI_Amt);
        Update_SSI_Inc_txt.Text = Convert.ToString(income_source.SSI_Inc);
        Update_svgs_acct_txt.Text = Convert.ToString(income_source.svgs_acct);
        Update_svgs_balance_txt.Text = Convert.ToString(income_source.svgs_balance);
        Update_svgs_bank_txt.Text = Convert.ToString(income_source.svgs_bank);
        Update_wages_amt_txt.Text = Convert.ToString(income_source.wages_amt);
        Update_wages_inc_txt.Text = Convert.ToString(income_source.wages_inc);
        return income_source;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        income_source = income_source_update(Convert.ToInt32(Update_income_source_GridView.SelectedValue));
    }
    public income_source income_source_update(int ID)
    {
        income_source = income_source.Select(ID);
        income_source.income_source_id = Convert.ToInt32(Update_income_source_id_txt.Text);
        income_source.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        income_source.cash_amt = Convert.ToDecimal(Update_cash_amt_txt.Text);
        income_source.cash_on_hand = Update_cash_on_hand_txt.Text;
        income_source.wages_stopped = Update_wages_stopped_txt.Text;
        income_source.waiting_on_income = Update_waiting_on_income_txt.Text;
        income_source.recieving_income = Update_recieving_income_txt.Text;
        income_source.no_income = Update_no_income_txt.Text;
        income_source.currently_working = Update_currently_working_txt.Text;
        income_source.laid_off = Update_laid_off_txt.Text;
        income_source.never_worked = Update_never_worked_txt.Text;
        income_source.quit = Update_quit_txt.Text;
        income_source.fired = Update_fired_txt.Text;
        income_source.sick_leave = Update_sick_leave_txt.Text;
        income_source.maternity_leave = Update_maternity_leave_txt.Text;
        income_source.on_strike = Update_on_strike_txt.Text;
        income_source.trying_to_find_work = Update_trying_to_find_work_txt.Text;
        income_source.ckg_acct = Update_ckg_acct_txt.Text;
        income_source.ckg_balance = Convert.ToDecimal(Update_ckg_balance_txt.Text);
        income_source.ckg_bank = Update_ckg_bank_txt.Text;
        income_source.claims = Update_claims_txt.Text;
        income_source.claims_memo = Update_claims_memo_txt.Text;
        income_source.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        income_source.gifts_amt = Convert.ToDecimal(Update_gifts_amt_txt.Text);
        income_source.gifts_inc = Update_gifts_inc_txt.Text;
        income_source.investments = Update_investments_txt.Text;
        income_source.life_ins = Update_life_ins_txt.Text;
        income_source.other_ins = Update_other_ins_txt.Text;
        income_source.pension_amt = Convert.ToDecimal(Update_pension_amt_txt.Text);
        income_source.pension_inc = Update_pension_inc_txt.Text;
        income_source.strike_benefits_amt = Convert.ToDecimal(Update_strike_benefits_amt_txt.Text);
        income_source.strike_benefits_inc = Update_strike_benefits_inc_txt.Text;
        income_source.support_amt = Convert.ToDecimal(Update_support_amt_txt.Text);
        income_source.support_inc = Update_support_inc_txt.Text;
        income_source.SSI_Amt = Convert.ToDecimal(Update_SSI_Amt_txt.Text);
        income_source.SSI_Inc = Update_SSI_Inc_txt.Text;
        income_source.svgs_acct = Update_svgs_acct_txt.Text;
        income_source.svgs_balance = Convert.ToDecimal(Update_svgs_balance_txt.Text);
        income_source.svgs_bank = Update_svgs_bank_txt.Text;
        income_source.wages_amt = Convert.ToDecimal(Update_wages_amt_txt.Text);
        income_source.wages_inc = Update_wages_inc_txt.Text;
        income_source.Update(income_source);
        Insert_income_source_GridView.DataBind();
        Update_income_source_GridView.DataBind();
        Delete_income_source_GridView.DataBind();
        return income_source;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Delete_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        income_source = Delete_income_source_select(Convert.ToInt32(Delete_income_source_GridView.SelectedValue));
    }
    public income_source Delete_income_source_select(int ID)
    {
        income_source = income_source.Select(ID);
        Delete_income_source_id_txt_lbl.Text = Convert.ToString(income_source.income_source_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(income_source.case_id);
        Delete_cash_amt_txt_lbl.Text = Convert.ToString(income_source.cash_amt);
        Delete_cash_on_hand_txt_lbl.Text = Convert.ToString(income_source.cash_on_hand);
        Delete_wages_stopped_txt_lbl.Text = Convert.ToString(income_source.wages_stopped);
        Delete_waiting_on_income_txt_lbl.Text = Convert.ToString(income_source.waiting_on_income);
        Delete_recieving_income_txt_lbl.Text = Convert.ToString(income_source.recieving_income);
        Delete_no_income_txt_lbl.Text = Convert.ToString(income_source.no_income);
        Delete_currently_working_txt_lbl.Text = Convert.ToString(income_source.currently_working);
        Delete_laid_off_txt_lbl.Text = Convert.ToString(income_source.laid_off);
        Delete_never_worked_txt_lbl.Text = Convert.ToString(income_source.never_worked);
        Delete_quit_txt_lbl.Text = Convert.ToString(income_source.quit);
        Delete_fired_txt_lbl.Text = Convert.ToString(income_source.fired);
        Delete_sick_leave_txt_lbl.Text = Convert.ToString(income_source.sick_leave);
        Delete_maternity_leave_txt_lbl.Text = Convert.ToString(income_source.maternity_leave);
        Delete_on_strike_txt_lbl.Text = Convert.ToString(income_source.on_strike);
        Delete_trying_to_find_work_txt_lbl.Text = Convert.ToString(income_source.trying_to_find_work);
        Delete_ckg_acct_txt_lbl.Text = Convert.ToString(income_source.ckg_acct);
        Delete_ckg_balance_txt_lbl.Text = Convert.ToString(income_source.ckg_balance);
        Delete_ckg_bank_txt_lbl.Text = Convert.ToString(income_source.ckg_bank);
        Delete_claims_txt_lbl.Text = Convert.ToString(income_source.claims);
        Delete_claims_memo_txt_lbl.Text = Convert.ToString(income_source.claims_memo);
        Delete_client_id_txt_lbl.Text = Convert.ToString(income_source.client_id);
        Delete_gifts_amt_txt_lbl.Text = Convert.ToString(income_source.gifts_amt);
        Delete_gifts_inc_txt_lbl.Text = Convert.ToString(income_source.gifts_inc);
        Delete_investments_txt_lbl.Text = Convert.ToString(income_source.investments);
        Delete_life_ins_txt_lbl.Text = Convert.ToString(income_source.life_ins);
        Delete_other_ins_txt_lbl.Text = Convert.ToString(income_source.other_ins);
        Delete_pension_amt_txt_lbl.Text = Convert.ToString(income_source.pension_amt);
        Delete_pension_inc_txt_lbl.Text = Convert.ToString(income_source.pension_inc);
        Delete_strike_benefits_amt_txt_lbl.Text = Convert.ToString(income_source.strike_benefits_amt);
        Delete_strike_benefits_inc_txt_lbl.Text = Convert.ToString(income_source.strike_benefits_inc);
        Delete_support_amt_txt_lbl.Text = Convert.ToString(income_source.support_amt);
        Delete_support_inc_txt_lbl.Text = Convert.ToString(income_source.support_inc);
        Delete_SSI_Amt_txt_lbl.Text = Convert.ToString(income_source.SSI_Amt);
        Delete_SSI_Inc_txt_lbl.Text = Convert.ToString(income_source.SSI_Inc);
        Delete_svgs_acct_txt_lbl.Text = Convert.ToString(income_source.svgs_acct);
        Delete_svgs_balance_txt_lbl.Text = Convert.ToString(income_source.svgs_balance);
        Delete_svgs_bank_txt_lbl.Text = Convert.ToString(income_source.svgs_bank);
        Delete_wages_amt_txt_lbl.Text = Convert.ToString(income_source.wages_amt);
        Delete_wages_inc_txt_lbl.Text = Convert.ToString(income_source.wages_inc);
        return income_source;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        income_source_delete(Convert.ToInt32(Delete_income_source_GridView.SelectedValue));
    }
    public void income_source_delete(int ID)
    {
        income_source.Delete(ID);
        Insert_income_source_GridView.DataBind();
        Update_income_source_GridView.DataBind();
        Delete_income_source_GridView.DataBind();
    }





    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Universial Methods
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // EXAMPLE:
            // client_status = e.Row.Cells[5].Text;
            // Gender = e.Row.Cells[4].Text;

            //if (e.Row.Cells[5].Text == "M")
            //{
            //    e.Row.Cells[5].Text = "Missing";
            //}
            //else if (e.Row.Cells[5].Text == "D")
            //{
            //    e.Row.Cells[5].Text = "Deceased";
            //}
            //if (e.Row.Cells[4].Text == "M")
            //{
            //    e.Row.Cells[4].Text = "Male";
            //}
            //else if (e.Row.Cells[4].Text == "F")
            //{
            //    e.Row.Cells[4].Text = "Female";
            //}
        }
    }




  }
}

