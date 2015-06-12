using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class vehicle
{
    public Int32 vehicle_id
    {
        get;
        set;
    }
    public Char[1] vehicle_brand
    {
        get;
        set;
    }
    public Char[30] vehicle_model
    {
        get;
        set;
    }
    public Char[1] vehicle_year
    {
        get;
        set;
    }
    public Char[1] vehicle_description
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        vehicle_id = 0;
        vehicle_brand = ;
        vehicle_model = ;
        vehicle_year = ;
        vehicle_description = ;
    }
    public vehicle Select(int id)
    {
        vehicle vehicle = new vehicle();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VEHICLE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    vehicle.vehicle_id = rdr.GetInt32(0);
                }
                else
                {
                    vehicle.vehicle_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    vehicle.vehicle_brand = 
                }
                else
                {
                    vehicle.vehicle_brand = ;
                }
                if (!rdr.IsDBNull(2))
                {
                    vehicle.vehicle_model = 
                }
                else
                {
                    vehicle.vehicle_model = ;
                }
                if (!rdr.IsDBNull(3))
                {
                    vehicle.vehicle_year = 
                }
                else
                {
                    vehicle.vehicle_year = ;
                }
                if (!rdr.IsDBNull(4))
                {
                    vehicle.vehicle_description = 
                }
                else
                {
                    vehicle.vehicle_description = ;
                }
                }
                else
                {
                    vehicle.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            vehicle.SetColumnDefaults();
            return vehicle;
            }
        finally
        {
            con.Close();
        }
        return vehicle;
    }

    public vehicle Insert(vehicle id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_VEHICLE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_brand", id.vehicle_brand);
            cmd.Parameters.AddWithValue("@vehicle_model", id.vehicle_model);
            cmd.Parameters.AddWithValue("@vehicle_year", id.vehicle_year);
            cmd.Parameters.AddWithValue("@vehicle_description", id.vehicle_description);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_VEHICLE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_brand", id.vehicle_brand);
            cmd.Parameters.AddWithValue("@vehicle_model", id.vehicle_model);
            cmd.Parameters.AddWithValue("@vehicle_year", id.vehicle_year);
            cmd.Parameters.AddWithValue("@vehicle_description", id.vehicle_description);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.vehicle_id = rdr.GetInt32(0);
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
    public Boolean Update(vehicle id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_VEHICLE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_id", id.vehicle_id);
            cmd.Parameters.AddWithValue("@vehicle_brand", id.vehicle_brand);
            cmd.Parameters.AddWithValue("@vehicle_model", id.vehicle_model);
            cmd.Parameters.AddWithValue("@vehicle_year", id.vehicle_year);
            cmd.Parameters.AddWithValue("@vehicle_description", id.vehicle_description);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_VEHICLE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VEHICLE_WC", con);
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




