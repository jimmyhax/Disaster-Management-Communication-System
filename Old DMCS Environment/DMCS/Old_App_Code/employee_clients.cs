using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class employee_clients
{
    public Int32 emp_client_id
    {
        get;
        set;
    }
    public Int32 client_id
    {
        get;
        set;
    }
    public Int32 employee_id
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        emp_client_id = 0;
        client_id = 0;
        employee_id = 0;
    }
    public employee_clients Select(int id)
    {
        employee_clients employee_clients = new employee_clients();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMPLOYEE_CLIENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emp_client_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    employee_clients.emp_client_id = rdr.GetInt32(0);
                }
                else
                {
                    employee_clients.emp_client_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    employee_clients.client_id = rdr.GetInt32(1);
                }
                else
                {
                    employee_clients.client_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    employee_clients.employee_id = rdr.GetInt32(2);
                }
                else
                {
                    employee_clients.employee_id = 0;
                }
                }
                else
                {
                    employee_clients.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            employee_clients.SetColumnDefaults();
            return employee_clients;
            }
        finally
        {
            con.Close();
        }
        return employee_clients;
    }

    public employee_clients Insert(employee_clients id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EMPLOYEE_CLIENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_EMPLOYEE_CLIENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.emp_client_id = rdr.GetInt32(0);
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
    public Boolean Update(employee_clients id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EMPLOYEE_CLIENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emp_client_id", id.emp_client_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EMPLOYEE_CLIENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emp_client_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMPLOYEE_CLIENTS_WC", con);
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




