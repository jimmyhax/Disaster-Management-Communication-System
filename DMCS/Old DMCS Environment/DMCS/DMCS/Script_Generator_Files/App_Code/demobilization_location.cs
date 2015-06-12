using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class demobilization_location
{
    public Int32 demo_location_id
    {
        get;
        set;
    }
    public Int32 demo_id
    {
        get;
        set;
    }
    public Int32 location_id
    {
        get;
        set;
    }
    public String location_description
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        demo_location_id = 0;
        demo_id = 0;
        location_id = 0;
        location_description = " ";
    }
    public demobilization_location Select(int id)
    {
        demobilization_location demobilization_location = new demobilization_location();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DEMOBILIZATION_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@demo_location_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    demobilization_location.demo_location_id = rdr.GetInt32(0);
                }
                else
                {
                    demobilization_location.demo_location_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    demobilization_location.demo_id = rdr.GetInt32(1);
                }
                else
                {
                    demobilization_location.demo_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    demobilization_location.location_id = rdr.GetInt32(2);
                }
                else
                {
                    demobilization_location.location_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    demobilization_location.location_description = rdr.GetString(3);
                }
                else
                {
                    demobilization_location.location_description = " ";
                }
                }
                else
                {
                    demobilization_location.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            demobilization_location.SetColumnDefaults();
            return demobilization_location;
            }
        finally
        {
            con.Close();
        }
        return demobilization_location;
    }

    public demobilization_location Insert(demobilization_location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DEMOBILIZATION_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@demo_id", id.demo_id);
            cmd.Parameters.AddWithValue("@location_id", id.location_id);
            cmd.Parameters.AddWithValue("@location_description", id.location_description);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_DEMOBILIZATION_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@demo_id", id.demo_id);
            cmd.Parameters.AddWithValue("@location_id", id.location_id);
            cmd.Parameters.AddWithValue("@location_description", id.location_description);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.demo_location_id = rdr.GetInt32(0);
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
    public Boolean Update(demobilization_location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DEMOBILIZATION_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@demo_location_id", id.demo_location_id);
            cmd.Parameters.AddWithValue("@demo_id", id.demo_id);
            cmd.Parameters.AddWithValue("@location_id", id.location_id);
            cmd.Parameters.AddWithValue("@location_description", id.location_description);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DEMOBILIZATION_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@demo_location_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DEMOBILIZATION_LOCATION_WC", con);
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




