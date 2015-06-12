using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class task_location
{
    public Int32 task_loc_id
    {
        get;
        set;
    }
    public Int32 task_id
    {
        get;
        set;
    }
    public String task_loc_description
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        task_loc_id = 0;
        task_id = 0;
        task_loc_description = " ";
    }
    public task_location Select(int id)
    {
        task_location task_location = new task_location();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@task_loc_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    task_location.task_loc_id = rdr.GetInt32(0);
                }
                else
                {
                    task_location.task_loc_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    task_location.task_id = rdr.GetInt32(1);
                }
                else
                {
                    task_location.task_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    task_location.task_loc_description = rdr.GetString(2);
                }
                else
                {
                    task_location.task_loc_description = " ";
                }
                }
                else
                {
                    task_location.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            task_location.SetColumnDefaults();
            return task_location;
            }
        finally
        {
            con.Close();
        }
        return task_location;
    }

    public task_location Insert(task_location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@task_loc_description", id.task_loc_description);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@task_loc_description", id.task_loc_description);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.task_loc_id = rdr.GetInt32(0);
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
    public Boolean Update(task_location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@task_loc_id", id.task_loc_id);
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@task_loc_description", id.task_loc_description);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@task_loc_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TASK_LOCATION_WC", con);
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




