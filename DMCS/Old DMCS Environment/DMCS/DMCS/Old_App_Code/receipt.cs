using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class receipt
{
    public Int32 Receipt_ID
    {
        get;
        set;
    }
    public Int32 Account_ID
    {
        get;
        set;
    }
    public Int32 Check_Num
    {
        get;
        set;
    }
    public Int32 DLN
    {
        get;
        set;
    }
    public Int32 Phone
    {
        get;
        set;
    }
    public Int32 Pay_Type
    {
        get;
        set;
    }
    public Int32 Amount
    {
        get;
        set;
    }
    public Boolean Transfer
    {
        get;
        set;
    }
    public Boolean Recieve
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Receipt_ID = 0;
        Account_ID = 0;
        Check_Num = 0;
        DLN = 0;
        Phone = 0;
        Pay_Type = 0;
        Amount = 0;
        Transfer = false;
        Recieve = false;
    }
    public receipt Select(int id)
    {
        receipt receipt = new receipt();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RECEIPT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Receipt_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    receipt.Receipt_ID = rdr.GetInt32(0);
                }
                else
                {
                    receipt.Receipt_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    receipt.Account_ID = rdr.GetInt32(1);
                }
                else
                {
                    receipt.Account_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    receipt.Check_Num = rdr.GetInt32(2);
                }
                else
                {
                    receipt.Check_Num = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    receipt.DLN = rdr.GetInt32(3);
                }
                else
                {
                    receipt.DLN = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    receipt.Phone = rdr.GetInt32(4);
                }
                else
                {
                    receipt.Phone = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    receipt.Pay_Type = rdr.GetInt32(5);
                }
                else
                {
                    receipt.Pay_Type = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    receipt.Amount = rdr.GetInt32(6);
                }
                else
                {
                    receipt.Amount = 0;
                }
                if (!rdr.IsDBNull(7))
                {
                    receipt.Transfer = rdr.GetBoolean(7);
                }
                else
                {
                    receipt.Transfer = false;
                }
                if (!rdr.IsDBNull(8))
                {
                    receipt.Recieve = rdr.GetBoolean(8);
                }
                else
                {
                    receipt.Recieve = false;
                }
                }
                else
                {
                    receipt.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            receipt.SetColumnDefaults();
            return receipt;
            }
        finally
        {
            con.Close();
        }
        return receipt;
    }

    public receipt Insert(receipt id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_RECEIPT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Account_ID", id.Account_ID);
            cmd.Parameters.AddWithValue("@Check_Num", id.Check_Num);
            cmd.Parameters.AddWithValue("@DLN", id.DLN);
            cmd.Parameters.AddWithValue("@Phone", id.Phone);
            cmd.Parameters.AddWithValue("@Pay_Type", id.Pay_Type);
            cmd.Parameters.AddWithValue("@Amount", id.Amount);
            cmd.Parameters.AddWithValue("@Transfer", id.Transfer);
            cmd.Parameters.AddWithValue("@Recieve", id.Recieve);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_RECEIPT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Account_ID", id.Account_ID);
            cmd.Parameters.AddWithValue("@Check_Num", id.Check_Num);
            cmd.Parameters.AddWithValue("@DLN", id.DLN);
            cmd.Parameters.AddWithValue("@Phone", id.Phone);
            cmd.Parameters.AddWithValue("@Pay_Type", id.Pay_Type);
            cmd.Parameters.AddWithValue("@Amount", id.Amount);
            cmd.Parameters.AddWithValue("@Transfer", id.Transfer);
            cmd.Parameters.AddWithValue("@Recieve", id.Recieve);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Receipt_ID = rdr.GetInt32(0);
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
    public Boolean Update(receipt id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_RECEIPT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Receipt_ID", id.Receipt_ID);
            cmd.Parameters.AddWithValue("@Account_ID", id.Account_ID);
            cmd.Parameters.AddWithValue("@Check_Num", id.Check_Num);
            cmd.Parameters.AddWithValue("@DLN", id.DLN);
            cmd.Parameters.AddWithValue("@Phone", id.Phone);
            cmd.Parameters.AddWithValue("@Pay_Type", id.Pay_Type);
            cmd.Parameters.AddWithValue("@Amount", id.Amount);
            cmd.Parameters.AddWithValue("@Transfer", id.Transfer);
            cmd.Parameters.AddWithValue("@Recieve", id.Recieve);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_RECEIPT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Receipt_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RECEIPT_WC", con);
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




