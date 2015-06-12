using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class bank
{
    public Int32 Bank_ID
    {
        get;
        set;
    }
    public String Routing_Num
    {
        get;
        set;
    }
    public String Name
    {
        get;
        set;
    }
    public Boolean IsFDIC
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Bank_ID = 0;
        Routing_Num = " ";
        Name = " ";
        IsFDIC = false;
    }
    public bank Select(int id)
    {
        bank bank = new bank();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_BANK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Bank_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    bank.Bank_ID = rdr.GetInt32(0);
                }
                else
                {
                    bank.Bank_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    bank.Routing_Num = rdr.GetString(1);
                }
                else
                {
                    bank.Routing_Num = " ";
                }
                if (!rdr.IsDBNull(2))
                {
                    bank.Name = rdr.GetString(2);
                }
                else
                {
                    bank.Name = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    bank.IsFDIC = rdr.GetBoolean(3);
                }
                else
                {
                    bank.IsFDIC = false;
                }
                }
                else
                {
                    bank.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            bank.SetColumnDefaults();
            return bank;
            }
        finally
        {
            con.Close();
        }
        return bank;
    }

    public bank Insert(bank id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_BANK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Routing_Num", id.Routing_Num);
            cmd.Parameters.AddWithValue("@Name", id.Name);
            cmd.Parameters.AddWithValue("@IsFDIC", id.IsFDIC);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_BANK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Routing_Num", id.Routing_Num);
            cmd.Parameters.AddWithValue("@Name", id.Name);
            cmd.Parameters.AddWithValue("@IsFDIC", id.IsFDIC);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Bank_ID = rdr.GetInt32(0);
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
    public Boolean Update(bank id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_BANK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Bank_ID", id.Bank_ID);
            cmd.Parameters.AddWithValue("@Routing_Num", id.Routing_Num);
            cmd.Parameters.AddWithValue("@Name", id.Name);
            cmd.Parameters.AddWithValue("@IsFDIC", id.IsFDIC);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_BANK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Bank_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_BANK_WC", con);
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




