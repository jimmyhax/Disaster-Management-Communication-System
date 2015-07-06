using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class disaster_project_task
{
    public Int32 disaster_project_task_id
    {
        get;
        set;
    }
    public Int32 skills_id
    {
        get;
        set;
    }
    public String disaster_project_task_description
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        disaster_project_task_id = 0;
        skills_id = 0;
        disaster_project_task_description = " ";
    }
    public disaster_project_task Select(int id)
    {
        disaster_project_task disaster_project_task = new disaster_project_task();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_PROJECT_TASK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_task_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    disaster_project_task.disaster_project_task_id = rdr.GetInt32(0);
                }
                else
                {
                    disaster_project_task.disaster_project_task_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    disaster_project_task.skills_id = rdr.GetInt32(1);
                }
                else
                {
                    disaster_project_task.skills_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    disaster_project_task.disaster_project_task_description = rdr.GetString(2);
                }
                else
                {
                    disaster_project_task.disaster_project_task_description = " ";
                }
                }
                else
                {
                    disaster_project_task.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            disaster_project_task.SetColumnDefaults();
            return disaster_project_task;
            }
        finally
        {
            con.Close();
        }
        return disaster_project_task;
    }

    public disaster_project_task Insert(disaster_project_task id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DISASTER_PROJECT_TASK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@skills_id", id.skills_id);
            cmd.Parameters.AddWithValue("@disaster_project_task_description", id.disaster_project_task_description);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_DISASTER_PROJECT_TASK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@skills_id", id.skills_id);
            cmd.Parameters.AddWithValue("@disaster_project_task_description", id.disaster_project_task_description);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.disaster_project_task_id = rdr.GetInt32(0);
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
    public Boolean Update(disaster_project_task id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DISASTER_PROJECT_TASK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_task_id", id.disaster_project_task_id);
            cmd.Parameters.AddWithValue("@skills_id", id.skills_id);
            cmd.Parameters.AddWithValue("@disaster_project_task_description", id.disaster_project_task_description);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DISASTER_PROJECT_TASK", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_task_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_PROJECT_TASK_WC", con);
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




