using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class disaster_project_resource
{
    public Int32 disaster_project_resource_id
    {
        get;
        set;
    }
    public Int32 person_hours_id
    {
        get;
        set;
    }
    public Decimal person_total_hours
    {
        get;
        set;
    }
    public Decimal person_total_cost
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        disaster_project_resource_id = 0;
        person_hours_id = 0;
        person_total_hours = 0;
        person_total_cost = 0;
    }
    public disaster_project_resource Select(int id)
    {
        disaster_project_resource disaster_project_resource = new disaster_project_resource();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_PROJECT_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_resource_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    disaster_project_resource.disaster_project_resource_id = rdr.GetInt32(0);
                }
                else
                {
                    disaster_project_resource.disaster_project_resource_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    disaster_project_resource.person_hours_id = rdr.GetInt32(1);
                }
                else
                {
                    disaster_project_resource.person_hours_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    disaster_project_resource.person_total_hours = rdr.GetDecimal(2);
                }
                else
                {
                    disaster_project_resource.person_total_hours = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    disaster_project_resource.person_total_cost = rdr.GetDecimal(3);
                }
                else
                {
                    disaster_project_resource.person_total_cost = 0;
                }
                }
                else
                {
                    disaster_project_resource.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            disaster_project_resource.SetColumnDefaults();
            return disaster_project_resource;
            }
        finally
        {
            con.Close();
        }
        return disaster_project_resource;
    }

    public disaster_project_resource Insert(disaster_project_resource id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DISASTER_PROJECT_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@person_hours_id", id.person_hours_id);
            cmd.Parameters.AddWithValue("@person_total_hours", id.person_total_hours);
            cmd.Parameters.AddWithValue("@person_total_cost", id.person_total_cost);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_DISASTER_PROJECT_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@person_hours_id", id.person_hours_id);
            cmd.Parameters.AddWithValue("@person_total_hours", id.person_total_hours);
            cmd.Parameters.AddWithValue("@person_total_cost", id.person_total_cost);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.disaster_project_resource_id = rdr.GetInt32(0);
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
    public Boolean Update(disaster_project_resource id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DISASTER_PROJECT_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_resource_id", id.disaster_project_resource_id);
            cmd.Parameters.AddWithValue("@person_hours_id", id.person_hours_id);
            cmd.Parameters.AddWithValue("@person_total_hours", id.person_total_hours);
            cmd.Parameters.AddWithValue("@person_total_cost", id.person_total_cost);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DISASTER_PROJECT_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_resource_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_PROJECT_RESOURCE_WC", con);
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




