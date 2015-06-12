using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class income_source
{
    public Int32 income_source_id
    {
        get;
        set;
    }
    public Int32 case_id
    {
        get;
        set;
    }
    public Decimal cash_amt
    {
        get;
        set;
    }
    public String cash_on_hand
    {
        get;
        set;
    }
    public String wages_stopped
    {
        get;
        set;
    }
    public String waiting_on_income
    {
        get;
        set;
    }
    public String recieving_income
    {
        get;
        set;
    }
    public String no_income
    {
        get;
        set;
    }
    public String currently_working
    {
        get;
        set;
    }
    public String laid_off
    {
        get;
        set;
    }
    public String never_worked
    {
        get;
        set;
    }
    public String quit
    {
        get;
        set;
    }
    public String fired
    {
        get;
        set;
    }
    public String sick_leave
    {
        get;
        set;
    }
    public String maternity_leave
    {
        get;
        set;
    }
    public String on_strike
    {
        get;
        set;
    }
    public String trying_to_find_work
    {
        get;
        set;
    }
    public String ckg_acct
    {
        get;
        set;
    }
    public Decimal ckg_balance
    {
        get;
        set;
    }
    public String ckg_bank
    {
        get;
        set;
    }
    public String claims
    {
        get;
        set;
    }
    public String claims_memo
    {
        get;
        set;
    }
    public Int32 client_id
    {
        get;
        set;
    }
    public Decimal gifts_amt
    {
        get;
        set;
    }
    public String gifts_inc
    {
        get;
        set;
    }
    public String investments
    {
        get;
        set;
    }
    public String life_ins
    {
        get;
        set;
    }
    public String other_ins
    {
        get;
        set;
    }
    public Decimal pension_amt
    {
        get;
        set;
    }
    public String pension_inc
    {
        get;
        set;
    }
    public Decimal strike_benefits_amt
    {
        get;
        set;
    }
    public String strike_benefits_inc
    {
        get;
        set;
    }
    public Decimal support_amt
    {
        get;
        set;
    }
    public String support_inc
    {
        get;
        set;
    }
    public Decimal SSI_Amt
    {
        get;
        set;
    }
    public String SSI_Inc
    {
        get;
        set;
    }
    public String svgs_acct
    {
        get;
        set;
    }
    public Decimal svgs_balance
    {
        get;
        set;
    }
    public String svgs_bank
    {
        get;
        set;
    }
    public Decimal wages_amt
    {
        get;
        set;
    }
    public String wages_inc
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        income_source_id = 0;
        case_id = 0;
        cash_amt = 0;
        cash_on_hand = " ";
        wages_stopped = " ";
        waiting_on_income = " ";
        recieving_income = " ";
        no_income = " ";
        currently_working = " ";
        laid_off = " ";
        never_worked = " ";
        quit = " ";
        fired = " ";
        sick_leave = " ";
        maternity_leave = " ";
        on_strike = " ";
        trying_to_find_work = " ";
        ckg_acct = " ";
        ckg_balance = 0;
        ckg_bank = " ";
        claims = " ";
        claims_memo = " ";
        client_id = 0;
        gifts_amt = 0;
        gifts_inc = " ";
        investments = " ";
        life_ins = " ";
        other_ins = " ";
        pension_amt = 0;
        pension_inc = " ";
        strike_benefits_amt = 0;
        strike_benefits_inc = " ";
        support_amt = 0;
        support_inc = " ";
        SSI_Amt = 0;
        SSI_Inc = " ";
        svgs_acct = " ";
        svgs_balance = 0;
        svgs_bank = " ";
        wages_amt = 0;
        wages_inc = " ";
    }
    public income_source Select(int id)
    {
        income_source income_source = new income_source();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_INCOME_SOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@income_source_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    income_source.income_source_id = rdr.GetInt32(0);
                }
                else
                {
                    income_source.income_source_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    income_source.case_id = rdr.GetInt32(1);
                }
                else
                {
                    income_source.case_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    income_source.cash_amt = rdr.GetDecimal(2);
                }
                else
                {
                    income_source.cash_amt = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    income_source.cash_on_hand = rdr.GetString(3);
                }
                else
                {
                    income_source.cash_on_hand = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    income_source.wages_stopped = rdr.GetString(4);
                }
                else
                {
                    income_source.wages_stopped = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    income_source.waiting_on_income = rdr.GetString(5);
                }
                else
                {
                    income_source.waiting_on_income = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    income_source.recieving_income = rdr.GetString(6);
                }
                else
                {
                    income_source.recieving_income = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    income_source.no_income = rdr.GetString(7);
                }
                else
                {
                    income_source.no_income = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    income_source.currently_working = rdr.GetString(8);
                }
                else
                {
                    income_source.currently_working = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    income_source.laid_off = rdr.GetString(9);
                }
                else
                {
                    income_source.laid_off = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    income_source.never_worked = rdr.GetString(10);
                }
                else
                {
                    income_source.never_worked = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    income_source.quit = rdr.GetString(11);
                }
                else
                {
                    income_source.quit = " ";
                }
                if (!rdr.IsDBNull(12))
                {
                    income_source.fired = rdr.GetString(12);
                }
                else
                {
                    income_source.fired = " ";
                }
                if (!rdr.IsDBNull(13))
                {
                    income_source.sick_leave = rdr.GetString(13);
                }
                else
                {
                    income_source.sick_leave = " ";
                }
                if (!rdr.IsDBNull(14))
                {
                    income_source.maternity_leave = rdr.GetString(14);
                }
                else
                {
                    income_source.maternity_leave = " ";
                }
                if (!rdr.IsDBNull(15))
                {
                    income_source.on_strike = rdr.GetString(15);
                }
                else
                {
                    income_source.on_strike = " ";
                }
                if (!rdr.IsDBNull(16))
                {
                    income_source.trying_to_find_work = rdr.GetString(16);
                }
                else
                {
                    income_source.trying_to_find_work = " ";
                }
                if (!rdr.IsDBNull(17))
                {
                    income_source.ckg_acct = rdr.GetString(17);
                }
                else
                {
                    income_source.ckg_acct = " ";
                }
                if (!rdr.IsDBNull(18))
                {
                    income_source.ckg_balance = rdr.GetDecimal(18);
                }
                else
                {
                    income_source.ckg_balance = 0;
                }
                if (!rdr.IsDBNull(19))
                {
                    income_source.ckg_bank = rdr.GetString(19);
                }
                else
                {
                    income_source.ckg_bank = " ";
                }
                if (!rdr.IsDBNull(20))
                {
                    income_source.claims = rdr.GetString(20);
                }
                else
                {
                    income_source.claims = " ";
                }
                if (!rdr.IsDBNull(21))
                {
                    income_source.claims_memo = rdr.GetString(21);
                }
                else
                {
                    income_source.claims_memo = " ";
                }
                if (!rdr.IsDBNull(22))
                {
                    income_source.client_id = rdr.GetInt32(22);
                }
                else
                {
                    income_source.client_id = 0;
                }
                if (!rdr.IsDBNull(23))
                {
                    income_source.gifts_amt = rdr.GetDecimal(23);
                }
                else
                {
                    income_source.gifts_amt = 0;
                }
                if (!rdr.IsDBNull(24))
                {
                    income_source.gifts_inc = rdr.GetString(24);
                }
                else
                {
                    income_source.gifts_inc = " ";
                }
                if (!rdr.IsDBNull(25))
                {
                    income_source.investments = rdr.GetString(25);
                }
                else
                {
                    income_source.investments = " ";
                }
                if (!rdr.IsDBNull(26))
                {
                    income_source.life_ins = rdr.GetString(26);
                }
                else
                {
                    income_source.life_ins = " ";
                }
                if (!rdr.IsDBNull(27))
                {
                    income_source.other_ins = rdr.GetString(27);
                }
                else
                {
                    income_source.other_ins = " ";
                }
                if (!rdr.IsDBNull(28))
                {
                    income_source.pension_amt = rdr.GetDecimal(28);
                }
                else
                {
                    income_source.pension_amt = 0;
                }
                if (!rdr.IsDBNull(29))
                {
                    income_source.pension_inc = rdr.GetString(29);
                }
                else
                {
                    income_source.pension_inc = " ";
                }
                if (!rdr.IsDBNull(30))
                {
                    income_source.strike_benefits_amt = rdr.GetDecimal(30);
                }
                else
                {
                    income_source.strike_benefits_amt = 0;
                }
                if (!rdr.IsDBNull(31))
                {
                    income_source.strike_benefits_inc = rdr.GetString(31);
                }
                else
                {
                    income_source.strike_benefits_inc = " ";
                }
                if (!rdr.IsDBNull(32))
                {
                    income_source.support_amt = rdr.GetDecimal(32);
                }
                else
                {
                    income_source.support_amt = 0;
                }
                if (!rdr.IsDBNull(33))
                {
                    income_source.support_inc = rdr.GetString(33);
                }
                else
                {
                    income_source.support_inc = " ";
                }
                if (!rdr.IsDBNull(34))
                {
                    income_source.SSI_Amt = rdr.GetDecimal(34);
                }
                else
                {
                    income_source.SSI_Amt = 0;
                }
                if (!rdr.IsDBNull(35))
                {
                    income_source.SSI_Inc = rdr.GetString(35);
                }
                else
                {
                    income_source.SSI_Inc = " ";
                }
                if (!rdr.IsDBNull(36))
                {
                    income_source.svgs_acct = rdr.GetString(36);
                }
                else
                {
                    income_source.svgs_acct = " ";
                }
                if (!rdr.IsDBNull(37))
                {
                    income_source.svgs_balance = rdr.GetDecimal(37);
                }
                else
                {
                    income_source.svgs_balance = 0;
                }
                if (!rdr.IsDBNull(38))
                {
                    income_source.svgs_bank = rdr.GetString(38);
                }
                else
                {
                    income_source.svgs_bank = " ";
                }
                if (!rdr.IsDBNull(39))
                {
                    income_source.wages_amt = rdr.GetDecimal(39);
                }
                else
                {
                    income_source.wages_amt = 0;
                }
                if (!rdr.IsDBNull(40))
                {
                    income_source.wages_inc = rdr.GetString(40);
                }
                else
                {
                    income_source.wages_inc = " ";
                }
                }
                else
                {
                    income_source.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            income_source.SetColumnDefaults();
            return income_source;
            }
        finally
        {
            con.Close();
        }
        return income_source;
    }

    public income_source Insert(income_source id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_INCOME_SOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@cash_amt", id.cash_amt);
            cmd.Parameters.AddWithValue("@cash_on_hand", id.cash_on_hand);
            cmd.Parameters.AddWithValue("@wages_stopped", id.wages_stopped);
            cmd.Parameters.AddWithValue("@waiting_on_income", id.waiting_on_income);
            cmd.Parameters.AddWithValue("@recieving_income", id.recieving_income);
            cmd.Parameters.AddWithValue("@no_income", id.no_income);
            cmd.Parameters.AddWithValue("@currently_working", id.currently_working);
            cmd.Parameters.AddWithValue("@laid_off", id.laid_off);
            cmd.Parameters.AddWithValue("@never_worked", id.never_worked);
            cmd.Parameters.AddWithValue("@quit", id.quit);
            cmd.Parameters.AddWithValue("@fired", id.fired);
            cmd.Parameters.AddWithValue("@sick_leave", id.sick_leave);
            cmd.Parameters.AddWithValue("@maternity_leave", id.maternity_leave);
            cmd.Parameters.AddWithValue("@on_strike", id.on_strike);
            cmd.Parameters.AddWithValue("@trying_to_find_work", id.trying_to_find_work);
            cmd.Parameters.AddWithValue("@ckg_acct", id.ckg_acct);
            cmd.Parameters.AddWithValue("@ckg_balance", id.ckg_balance);
            cmd.Parameters.AddWithValue("@ckg_bank", id.ckg_bank);
            cmd.Parameters.AddWithValue("@claims", id.claims);
            cmd.Parameters.AddWithValue("@claims_memo", id.claims_memo);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@gifts_amt", id.gifts_amt);
            cmd.Parameters.AddWithValue("@gifts_inc", id.gifts_inc);
            cmd.Parameters.AddWithValue("@investments", id.investments);
            cmd.Parameters.AddWithValue("@life_ins", id.life_ins);
            cmd.Parameters.AddWithValue("@other_ins", id.other_ins);
            cmd.Parameters.AddWithValue("@pension_amt", id.pension_amt);
            cmd.Parameters.AddWithValue("@pension_inc", id.pension_inc);
            cmd.Parameters.AddWithValue("@strike_benefits_amt", id.strike_benefits_amt);
            cmd.Parameters.AddWithValue("@strike_benefits_inc", id.strike_benefits_inc);
            cmd.Parameters.AddWithValue("@support_amt", id.support_amt);
            cmd.Parameters.AddWithValue("@support_inc", id.support_inc);
            cmd.Parameters.AddWithValue("@SSI_Amt", id.SSI_Amt);
            cmd.Parameters.AddWithValue("@SSI_Inc", id.SSI_Inc);
            cmd.Parameters.AddWithValue("@svgs_acct", id.svgs_acct);
            cmd.Parameters.AddWithValue("@svgs_balance", id.svgs_balance);
            cmd.Parameters.AddWithValue("@svgs_bank", id.svgs_bank);
            cmd.Parameters.AddWithValue("@wages_amt", id.wages_amt);
            cmd.Parameters.AddWithValue("@wages_inc", id.wages_inc);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_INCOME_SOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@cash_amt", id.cash_amt);
            cmd.Parameters.AddWithValue("@cash_on_hand", id.cash_on_hand);
            cmd.Parameters.AddWithValue("@wages_stopped", id.wages_stopped);
            cmd.Parameters.AddWithValue("@waiting_on_income", id.waiting_on_income);
            cmd.Parameters.AddWithValue("@recieving_income", id.recieving_income);
            cmd.Parameters.AddWithValue("@no_income", id.no_income);
            cmd.Parameters.AddWithValue("@currently_working", id.currently_working);
            cmd.Parameters.AddWithValue("@laid_off", id.laid_off);
            cmd.Parameters.AddWithValue("@never_worked", id.never_worked);
            cmd.Parameters.AddWithValue("@quit", id.quit);
            cmd.Parameters.AddWithValue("@fired", id.fired);
            cmd.Parameters.AddWithValue("@sick_leave", id.sick_leave);
            cmd.Parameters.AddWithValue("@maternity_leave", id.maternity_leave);
            cmd.Parameters.AddWithValue("@on_strike", id.on_strike);
            cmd.Parameters.AddWithValue("@trying_to_find_work", id.trying_to_find_work);
            cmd.Parameters.AddWithValue("@ckg_acct", id.ckg_acct);
            cmd.Parameters.AddWithValue("@ckg_balance", id.ckg_balance);
            cmd.Parameters.AddWithValue("@ckg_bank", id.ckg_bank);
            cmd.Parameters.AddWithValue("@claims", id.claims);
            cmd.Parameters.AddWithValue("@claims_memo", id.claims_memo);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@gifts_amt", id.gifts_amt);
            cmd.Parameters.AddWithValue("@gifts_inc", id.gifts_inc);
            cmd.Parameters.AddWithValue("@investments", id.investments);
            cmd.Parameters.AddWithValue("@life_ins", id.life_ins);
            cmd.Parameters.AddWithValue("@other_ins", id.other_ins);
            cmd.Parameters.AddWithValue("@pension_amt", id.pension_amt);
            cmd.Parameters.AddWithValue("@pension_inc", id.pension_inc);
            cmd.Parameters.AddWithValue("@strike_benefits_amt", id.strike_benefits_amt);
            cmd.Parameters.AddWithValue("@strike_benefits_inc", id.strike_benefits_inc);
            cmd.Parameters.AddWithValue("@support_amt", id.support_amt);
            cmd.Parameters.AddWithValue("@support_inc", id.support_inc);
            cmd.Parameters.AddWithValue("@SSI_Amt", id.SSI_Amt);
            cmd.Parameters.AddWithValue("@SSI_Inc", id.SSI_Inc);
            cmd.Parameters.AddWithValue("@svgs_acct", id.svgs_acct);
            cmd.Parameters.AddWithValue("@svgs_balance", id.svgs_balance);
            cmd.Parameters.AddWithValue("@svgs_bank", id.svgs_bank);
            cmd.Parameters.AddWithValue("@wages_amt", id.wages_amt);
            cmd.Parameters.AddWithValue("@wages_inc", id.wages_inc);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.income_source_id = rdr.GetInt32(0);
            }
        }
        catch (Exception ex)
        {
            id.SetColumnDefaults();
        }
        finally
        {
            con.Close();
        }
        return id;
    }
    public Boolean Update(income_source id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_INCOME_SOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@income_source_id", id.income_source_id);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@cash_amt", id.cash_amt);
            cmd.Parameters.AddWithValue("@cash_on_hand", id.cash_on_hand);
            cmd.Parameters.AddWithValue("@wages_stopped", id.wages_stopped);
            cmd.Parameters.AddWithValue("@waiting_on_income", id.waiting_on_income);
            cmd.Parameters.AddWithValue("@recieving_income", id.recieving_income);
            cmd.Parameters.AddWithValue("@no_income", id.no_income);
            cmd.Parameters.AddWithValue("@currently_working", id.currently_working);
            cmd.Parameters.AddWithValue("@laid_off", id.laid_off);
            cmd.Parameters.AddWithValue("@never_worked", id.never_worked);
            cmd.Parameters.AddWithValue("@quit", id.quit);
            cmd.Parameters.AddWithValue("@fired", id.fired);
            cmd.Parameters.AddWithValue("@sick_leave", id.sick_leave);
            cmd.Parameters.AddWithValue("@maternity_leave", id.maternity_leave);
            cmd.Parameters.AddWithValue("@on_strike", id.on_strike);
            cmd.Parameters.AddWithValue("@trying_to_find_work", id.trying_to_find_work);
            cmd.Parameters.AddWithValue("@ckg_acct", id.ckg_acct);
            cmd.Parameters.AddWithValue("@ckg_balance", id.ckg_balance);
            cmd.Parameters.AddWithValue("@ckg_bank", id.ckg_bank);
            cmd.Parameters.AddWithValue("@claims", id.claims);
            cmd.Parameters.AddWithValue("@claims_memo", id.claims_memo);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@gifts_amt", id.gifts_amt);
            cmd.Parameters.AddWithValue("@gifts_inc", id.gifts_inc);
            cmd.Parameters.AddWithValue("@investments", id.investments);
            cmd.Parameters.AddWithValue("@life_ins", id.life_ins);
            cmd.Parameters.AddWithValue("@other_ins", id.other_ins);
            cmd.Parameters.AddWithValue("@pension_amt", id.pension_amt);
            cmd.Parameters.AddWithValue("@pension_inc", id.pension_inc);
            cmd.Parameters.AddWithValue("@strike_benefits_amt", id.strike_benefits_amt);
            cmd.Parameters.AddWithValue("@strike_benefits_inc", id.strike_benefits_inc);
            cmd.Parameters.AddWithValue("@support_amt", id.support_amt);
            cmd.Parameters.AddWithValue("@support_inc", id.support_inc);
            cmd.Parameters.AddWithValue("@SSI_Amt", id.SSI_Amt);
            cmd.Parameters.AddWithValue("@SSI_Inc", id.SSI_Inc);
            cmd.Parameters.AddWithValue("@svgs_acct", id.svgs_acct);
            cmd.Parameters.AddWithValue("@svgs_balance", id.svgs_balance);
            cmd.Parameters.AddWithValue("@svgs_bank", id.svgs_bank);
            cmd.Parameters.AddWithValue("@wages_amt", id.wages_amt);
            cmd.Parameters.AddWithValue("@wages_inc", id.wages_inc);
            cmd.ExecuteReader();
            con.Close();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            con.Close();
        }
    }
    public Boolean Delete(int id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_INCOME_SOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@income_source_id", id);
            cmd.ExecuteReader();
            con.Close();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    public DataTable Select(string whereclause)
    {
        DataTable alrows = new DataTable();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_INCOME_SOURCE_WC", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@wareclause", whereclause);
            SqlDataReader rdr = cmd.ExecuteReader();
            alrows.Load(rdr);
            return alrows;
        }
        catch (Exception ex)
        {
            return alrows;
        }
        finally
        {
            con.Close();
        }
    }
}

}




