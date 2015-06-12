using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class debt
{
    public Int32 debt_id
    {
        get;
        set;
    }
    public Decimal amt_paid
    {
        get;
        set;
    }
    public Int32 case_id
    {
        get;
        set;
    }
    public Int32 client_id
    {
        get;
        set;
    }
    public String creditor_name
    {
        get;
        set;
    }
    public Decimal debt_amt
    {
        get;
        set;
    }
    public String item_purchased
    {
        get;
        set;
    }
    public DateTime last_payment_date
    {
        get;
        set;
    }
    public DateTime purchase_date
    {
        get;
        set;
    }
    public Decimal value_amt
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        debt_id = 0;
        amt_paid = 0;
        case_id = 0;
        client_id = 0;
        creditor_name = " ";
        debt_amt = 0;
        item_purchased = " ";
        last_payment_date = DateTime.Now;
        purchase_date = DateTime.Now;
        value_amt = 0;
    }
    public debt Select(int id)
    {
        debt debt = new debt();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DEBT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@debt_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    debt.debt_id = rdr.GetInt32(0);
                }
                else
                {
                    debt.debt_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    debt.amt_paid = rdr.GetDecimal(1);
                }
                else
                {
                    debt.amt_paid = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    debt.case_id = rdr.GetInt32(2);
                }
                else
                {
                    debt.case_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    debt.client_id = rdr.GetInt32(3);
                }
                else
                {
                    debt.client_id = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    debt.creditor_name = rdr.GetString(4);
                }
                else
                {
                    debt.creditor_name = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    debt.debt_amt = rdr.GetDecimal(5);
                }
                else
                {
                    debt.debt_amt = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    debt.item_purchased = rdr.GetString(6);
                }
                else
                {
                    debt.item_purchased = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    debt.last_payment_date = rdr.GetDateTime(7);
                }
                else
                {
                    debt.last_payment_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(8))
                {
                    debt.purchase_date = rdr.GetDateTime(8);
                }
                else
                {
                    debt.purchase_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(9))
                {
                    debt.value_amt = rdr.GetDecimal(9);
                }
                else
                {
                    debt.value_amt = 0;
                }
                }
                else
                {
                    debt.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            debt.SetColumnDefaults();
            return debt;
            }
        finally
        {
            con.Close();
        }
        return debt;
    }

    public debt Insert(debt id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DEBT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@amt_paid", id.amt_paid);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@creditor_name", id.creditor_name);
            cmd.Parameters.AddWithValue("@debt_amt", id.debt_amt);
            cmd.Parameters.AddWithValue("@item_purchased", id.item_purchased);
            cmd.Parameters.AddWithValue("@last_payment_date", id.last_payment_date);
            cmd.Parameters.AddWithValue("@purchase_date", id.purchase_date);
            cmd.Parameters.AddWithValue("@value_amt", id.value_amt);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_DEBT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@amt_paid", id.amt_paid);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@creditor_name", id.creditor_name);
            cmd.Parameters.AddWithValue("@debt_amt", id.debt_amt);
            cmd.Parameters.AddWithValue("@item_purchased", id.item_purchased);
            cmd.Parameters.AddWithValue("@last_payment_date", id.last_payment_date);
            cmd.Parameters.AddWithValue("@purchase_date", id.purchase_date);
            cmd.Parameters.AddWithValue("@value_amt", id.value_amt);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.debt_id = rdr.GetInt32(0);
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
    public Boolean Update(debt id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DEBT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@debt_id", id.debt_id);
            cmd.Parameters.AddWithValue("@amt_paid", id.amt_paid);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@creditor_name", id.creditor_name);
            cmd.Parameters.AddWithValue("@debt_amt", id.debt_amt);
            cmd.Parameters.AddWithValue("@item_purchased", id.item_purchased);
            cmd.Parameters.AddWithValue("@last_payment_date", id.last_payment_date);
            cmd.Parameters.AddWithValue("@purchase_date", id.purchase_date);
            cmd.Parameters.AddWithValue("@value_amt", id.value_amt);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DEBT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@debt_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DEBT_WC", con);
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




