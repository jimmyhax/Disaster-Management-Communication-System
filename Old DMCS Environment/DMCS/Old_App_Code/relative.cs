using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class relative
{
    public Int32 relative_id
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
    public Int32 address_id
    {
        get;
        set;
    }
    public String relative_help_memo
    {
        get;
        set;
    }
    public String will_help
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        relative_id = 0;
        case_id = 0;
        client_id = 0;
        address_id = 0;
        relative_help_memo = " ";
        will_help = " ";
    }
    public relative Select(int id)
    {
        relative relative = new relative();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RELATIVE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@relative_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    relative.relative_id = rdr.GetInt32(0);
                }
                else
                {
                    relative.relative_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    relative.case_id = rdr.GetInt32(1);
                }
                else
                {
                    relative.case_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    relative.client_id = rdr.GetInt32(2);
                }
                else
                {
                    relative.client_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    relative.address_id = rdr.GetInt32(3);
                }
                else
                {
                    relative.address_id = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    relative.relative_help_memo = rdr.GetString(4);
                }
                else
                {
                    relative.relative_help_memo = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    relative.will_help = rdr.GetString(5);
                }
                else
                {
                    relative.will_help = " ";
                }
                }
                else
                {
                    relative.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            relative.SetColumnDefaults();
            return relative;
            }
        finally
        {
            con.Close();
        }
        return relative;
    }

    public relative Insert(relative id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_RELATIVE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@relative_help_memo", id.relative_help_memo);
            cmd.Parameters.AddWithValue("@will_help", id.will_help);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_RELATIVE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@relative_help_memo", id.relative_help_memo);
            cmd.Parameters.AddWithValue("@will_help", id.will_help);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.relative_id = rdr.GetInt32(0);
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
    public Boolean Update(relative id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_RELATIVE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@relative_id", id.relative_id);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@relative_help_memo", id.relative_help_memo);
            cmd.Parameters.AddWithValue("@will_help", id.will_help);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_RELATIVE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@relative_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RELATIVE_WC", con);
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




