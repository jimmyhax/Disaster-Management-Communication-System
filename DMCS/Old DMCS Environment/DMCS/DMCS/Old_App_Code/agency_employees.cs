using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class agency_employees
{
    public Int32 agency_empl_id
    {
        get;
        set;
    }
    public Int32 agency_id
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
        agency_empl_id = 0;
        agency_id = 0;
        employee_id = 0;
    }
    public agency_employees Select(int id)
    {
        agency_employees agency_employees = new agency_employees();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AGENCY_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@agency_empl_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    agency_employees.agency_empl_id = rdr.GetInt32(0);
                }
                else
                {
                    agency_employees.agency_empl_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    agency_employees.agency_id = rdr.GetInt32(1);
                }
                else
                {
                    agency_employees.agency_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    agency_employees.employee_id = rdr.GetInt32(2);
                }
                else
                {
                    agency_employees.employee_id = 0;
                }
                }
                else
                {
                    agency_employees.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            agency_employees.SetColumnDefaults();
            return agency_employees;
            }
        finally
        {
            con.Close();
        }
        return agency_employees;
    }

    public agency_employees Insert(agency_employees id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_AGENCY_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_AGENCY_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.agency_empl_id = rdr.GetInt32(0);
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
    public Boolean Update(agency_employees id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_AGENCY_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@agency_empl_id", id.agency_empl_id);
            cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_AGENCY_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@agency_empl_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AGENCY_EMPLOYEES_WC", con);
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




