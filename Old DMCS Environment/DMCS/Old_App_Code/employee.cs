using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class employee
{
    public Int32 employee_id
    {
        get;
        set;
    }
    public DateTime employee_date_hired
    {
        get;
        set;
    }
    public String employee_department
    {
        get;
        set;
    }
    public Int32 employee_hours_worked
    {
        get;
        set;
    }
    public String employee_leadership
    {
        get;
        set;
    }
    public String employee_motivation
    {
        get;
        set;
    }
    public String employee_notes
    {
        get;
        set;
    }
    public String employee_overall
    {
        get;
        set;
    }
    public Decimal employee_payrate
    {
        get;
        set;
    }
    public String employee_performance
    {
        get;
        set;
    }
    public String employee_quality
    {
        get;
        set;
    }
    public String employee_timeliness
    {
        get;
        set;
    }
    public String username
    {
        get;
        set;
    }
    public String pswd
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        employee_id = 0;
        employee_date_hired = DateTime.Now;
        employee_department = " ";
        employee_hours_worked = 0;
        employee_leadership = " ";
        employee_motivation = " ";
        employee_notes = " ";
        employee_overall = " ";
        employee_payrate = 0;
        employee_performance = " ";
        employee_quality = " ";
        employee_timeliness = " ";
        username = " ";
        pswd = " ";
    }
    public employee Select(int id)
    {
        employee employee = new employee();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMPLOYEE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@employee_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    employee.employee_id = rdr.GetInt32(0);
                }
                else
                {
                    employee.employee_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    employee.employee_date_hired = rdr.GetDateTime(1);
                }
                else
                {
                    employee.employee_date_hired = DateTime.Now;
                }
                if (!rdr.IsDBNull(2))
                {
                    employee.employee_department = rdr.GetString(2);
                }
                else
                {
                    employee.employee_department = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    employee.employee_hours_worked = rdr.GetInt32(3);
                }
                else
                {
                    employee.employee_hours_worked = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    employee.employee_leadership = rdr.GetString(4);
                }
                else
                {
                    employee.employee_leadership = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    employee.employee_motivation = rdr.GetString(5);
                }
                else
                {
                    employee.employee_motivation = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    employee.employee_notes = rdr.GetString(6);
                }
                else
                {
                    employee.employee_notes = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    employee.employee_overall = rdr.GetString(7);
                }
                else
                {
                    employee.employee_overall = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    employee.employee_payrate = rdr.GetDecimal(8);
                }
                else
                {
                    employee.employee_payrate = 0;
                }
                if (!rdr.IsDBNull(9))
                {
                    employee.employee_performance = rdr.GetString(9);
                }
                else
                {
                    employee.employee_performance = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    employee.employee_quality = rdr.GetString(10);
                }
                else
                {
                    employee.employee_quality = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    employee.employee_timeliness = rdr.GetString(11);
                }
                else
                {
                    employee.employee_timeliness = " ";
                }
                if (!rdr.IsDBNull(12))
                {
                    employee.username = rdr.GetString(12);
                }
                else
                {
                    employee.username = " ";
                }
                if (!rdr.IsDBNull(13))
                {
                    employee.pswd = rdr.GetString(13);
                }
                else
                {
                    employee.pswd = " ";
                }
                }
                else
                {
                    employee.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            employee.SetColumnDefaults();
            return employee;
            }
        finally
        {
            con.Close();
        }
        return employee;
    }

    public employee Insert(employee id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EMPLOYEE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            cmd.Parameters.AddWithValue("@employee_date_hired", id.employee_date_hired);
            cmd.Parameters.AddWithValue("@employee_department", id.employee_department);
            cmd.Parameters.AddWithValue("@employee_hours_worked", id.employee_hours_worked);
            cmd.Parameters.AddWithValue("@employee_leadership", id.employee_leadership);
            cmd.Parameters.AddWithValue("@employee_motivation", id.employee_motivation);
            cmd.Parameters.AddWithValue("@employee_notes", id.employee_notes);
            cmd.Parameters.AddWithValue("@employee_overall", id.employee_overall);
            cmd.Parameters.AddWithValue("@employee_payrate", id.employee_payrate);
            cmd.Parameters.AddWithValue("@employee_performance", id.employee_performance);
            cmd.Parameters.AddWithValue("@employee_quality", id.employee_quality);
            cmd.Parameters.AddWithValue("@employee_timeliness", id.employee_timeliness);
            cmd.Parameters.AddWithValue("@username", id.username);
            cmd.Parameters.AddWithValue("@pswd", id.pswd);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_EMPLOYEE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@employee_date_hired", id.employee_date_hired);
            cmd.Parameters.AddWithValue("@employee_department", id.employee_department);
            cmd.Parameters.AddWithValue("@employee_hours_worked", id.employee_hours_worked);
            cmd.Parameters.AddWithValue("@employee_leadership", id.employee_leadership);
            cmd.Parameters.AddWithValue("@employee_motivation", id.employee_motivation);
            cmd.Parameters.AddWithValue("@employee_notes", id.employee_notes);
            cmd.Parameters.AddWithValue("@employee_overall", id.employee_overall);
            cmd.Parameters.AddWithValue("@employee_payrate", id.employee_payrate);
            cmd.Parameters.AddWithValue("@employee_performance", id.employee_performance);
            cmd.Parameters.AddWithValue("@employee_quality", id.employee_quality);
            cmd.Parameters.AddWithValue("@employee_timeliness", id.employee_timeliness);
            cmd.Parameters.AddWithValue("@username", id.username);
            cmd.Parameters.AddWithValue("@pswd", id.pswd);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.employee_id = rdr.GetInt32(0);
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
    public Boolean Update(employee id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EMPLOYEE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
            cmd.Parameters.AddWithValue("@employee_date_hired", id.employee_date_hired);
            cmd.Parameters.AddWithValue("@employee_department", id.employee_department);
            cmd.Parameters.AddWithValue("@employee_hours_worked", id.employee_hours_worked);
            cmd.Parameters.AddWithValue("@employee_leadership", id.employee_leadership);
            cmd.Parameters.AddWithValue("@employee_motivation", id.employee_motivation);
            cmd.Parameters.AddWithValue("@employee_notes", id.employee_notes);
            cmd.Parameters.AddWithValue("@employee_overall", id.employee_overall);
            cmd.Parameters.AddWithValue("@employee_payrate", id.employee_payrate);
            cmd.Parameters.AddWithValue("@employee_performance", id.employee_performance);
            cmd.Parameters.AddWithValue("@employee_quality", id.employee_quality);
            cmd.Parameters.AddWithValue("@employee_timeliness", id.employee_timeliness);
            cmd.Parameters.AddWithValue("@username", id.username);
            cmd.Parameters.AddWithValue("@pswd", id.pswd);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EMPLOYEE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@employee_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMPLOYEE_WC", con);
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




