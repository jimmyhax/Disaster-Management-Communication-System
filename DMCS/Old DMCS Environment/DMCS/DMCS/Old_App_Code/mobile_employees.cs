using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class mobile_employees
{
    public Int32 mobile_employee_id
    {
        get;
        set;
    }
    public Int32 mobile_unit_id
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
        mobile_employee_id = 0;
        mobile_unit_id = 0;
        employee_id = 0;
    }
    public mobile_employees Select(int id)
    {
        mobile_employees mobile_employees = new mobile_employees();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MOBILE_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_employee_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    mobile_employees.mobile_employee_id = rdr.GetInt32(0);
                }
                else
                {
                    mobile_employees.mobile_employee_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    mobile_employees.mobile_unit_id = rdr.GetInt32(1);
                }
                else
                {
                    mobile_employees.mobile_unit_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    mobile_employees.employee_id = rdr.GetInt32(2);
                }
                else
                {
                    mobile_employees.employee_id = 0;
                }
                }
                else
                {
                    mobile_employees.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            mobile_employees.SetColumnDefaults();
            return mobile_employees;
            }
        finally
        {
            con.Close();
        }
        return mobile_employees;
    }

    public mobile_employees Insert(mobile_employees id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MOBILE_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_unit_id", id.mobile_unit_id);
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_MOBILE_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_unit_id", id.mobile_unit_id);
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.mobile_employee_id = rdr.GetInt32(0);
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
    public Boolean Update(mobile_employees id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MOBILE_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_employee_id", id.mobile_employee_id);
            cmd.Parameters.AddWithValue("@mobile_unit_id", id.mobile_unit_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MOBILE_EMPLOYEES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_employee_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MOBILE_EMPLOYEES_WC", con);
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




