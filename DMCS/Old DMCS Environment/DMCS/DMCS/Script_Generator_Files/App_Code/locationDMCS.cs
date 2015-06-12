using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class locationDMCS
{
    public Int32 locationdmcs_id
    {
        get;
        set;
    }
    public String city
    {
        get;
        set;
    }
    public String county
    {
        get;
        set;
    }
    public Int32 e_lat
    {
        get;
        set;
    }
    public Int32 e_long
    {
        get;
        set;
    }
    public String location_desc
    {
        get;
        set;
    }
    public Int32 n_lat
    {
        get;
        set;
    }
    public Int32 n_long
    {
        get;
        set;
    }
    public String state
    {
        get;
        set;
    }
    public String type
    {
        get;
        set;
    }
    public Int32 w_lat
    {
        get;
        set;
    }
    public Int32 w_long
    {
        get;
        set;
    }
    public Int32 zip
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        locationdmcs_id = 0;
        city = " ";
        county = " ";
        e_lat = 0;
        e_long = 0;
        location_desc = " ";
        n_lat = 0;
        n_long = 0;
        state = " ";
        type = " ";
        w_lat = 0;
        w_long = 0;
        zip = 0;
    }
    public locationDMCS Select(int id)
    {
        locationDMCS locationDMCS = new locationDMCS();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LOCATIONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@locationdmcs_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    locationDMCS.locationdmcs_id = rdr.GetInt32(0);
                }
                else
                {
                    locationDMCS.locationdmcs_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    locationDMCS.city = rdr.GetString(1);
                }
                else
                {
                    locationDMCS.city = " ";
                }
                if (!rdr.IsDBNull(2))
                {
                    locationDMCS.county = rdr.GetString(2);
                }
                else
                {
                    locationDMCS.county = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    locationDMCS.e_lat = rdr.GetInt32(3);
                }
                else
                {
                    locationDMCS.e_lat = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    locationDMCS.e_long = rdr.GetInt32(4);
                }
                else
                {
                    locationDMCS.e_long = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    locationDMCS.location_desc = rdr.GetString(5);
                }
                else
                {
                    locationDMCS.location_desc = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    locationDMCS.n_lat = rdr.GetInt32(6);
                }
                else
                {
                    locationDMCS.n_lat = 0;
                }
                if (!rdr.IsDBNull(7))
                {
                    locationDMCS.n_long = rdr.GetInt32(7);
                }
                else
                {
                    locationDMCS.n_long = 0;
                }
                if (!rdr.IsDBNull(8))
                {
                    locationDMCS.state = rdr.GetString(8);
                }
                else
                {
                    locationDMCS.state = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    locationDMCS.type = rdr.GetString(9);
                }
                else
                {
                    locationDMCS.type = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    locationDMCS.w_lat = rdr.GetInt32(10);
                }
                else
                {
                    locationDMCS.w_lat = 0;
                }
                if (!rdr.IsDBNull(11))
                {
                    locationDMCS.w_long = rdr.GetInt32(11);
                }
                else
                {
                    locationDMCS.w_long = 0;
                }
                if (!rdr.IsDBNull(12))
                {
                    locationDMCS.zip = rdr.GetInt32(12);
                }
                else
                {
                    locationDMCS.zip = 0;
                }
                }
                else
                {
                    locationDMCS.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            locationDMCS.SetColumnDefaults();
            return locationDMCS;
            }
        finally
        {
            con.Close();
        }
        return locationDMCS;
    }

    public locationDMCS Insert(locationDMCS id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_LOCATIONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@city", id.city);
            cmd.Parameters.AddWithValue("@county", id.county);
            cmd.Parameters.AddWithValue("@e_lat", id.e_lat);
            cmd.Parameters.AddWithValue("@e_long", id.e_long);
            cmd.Parameters.AddWithValue("@location_desc", id.location_desc);
            cmd.Parameters.AddWithValue("@n_lat", id.n_lat);
            cmd.Parameters.AddWithValue("@n_long", id.n_long);
            cmd.Parameters.AddWithValue("@state", id.state);
            cmd.Parameters.AddWithValue("@type", id.type);
            cmd.Parameters.AddWithValue("@w_lat", id.w_lat);
            cmd.Parameters.AddWithValue("@w_long", id.w_long);
            cmd.Parameters.AddWithValue("@zip", id.zip);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_LOCATIONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@city", id.city);
            cmd.Parameters.AddWithValue("@county", id.county);
            cmd.Parameters.AddWithValue("@e_lat", id.e_lat);
            cmd.Parameters.AddWithValue("@e_long", id.e_long);
            cmd.Parameters.AddWithValue("@location_desc", id.location_desc);
            cmd.Parameters.AddWithValue("@n_lat", id.n_lat);
            cmd.Parameters.AddWithValue("@n_long", id.n_long);
            cmd.Parameters.AddWithValue("@state", id.state);
            cmd.Parameters.AddWithValue("@type", id.type);
            cmd.Parameters.AddWithValue("@w_lat", id.w_lat);
            cmd.Parameters.AddWithValue("@w_long", id.w_long);
            cmd.Parameters.AddWithValue("@zip", id.zip);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.locationdmcs_id = rdr.GetInt32(0);
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
    public Boolean Update(locationDMCS id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_LOCATIONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@locationdmcs_id", id.locationdmcs_id);
            cmd.Parameters.AddWithValue("@city", id.city);
            cmd.Parameters.AddWithValue("@county", id.county);
            cmd.Parameters.AddWithValue("@e_lat", id.e_lat);
            cmd.Parameters.AddWithValue("@e_long", id.e_long);
            cmd.Parameters.AddWithValue("@location_desc", id.location_desc);
            cmd.Parameters.AddWithValue("@n_lat", id.n_lat);
            cmd.Parameters.AddWithValue("@n_long", id.n_long);
            cmd.Parameters.AddWithValue("@state", id.state);
            cmd.Parameters.AddWithValue("@type", id.type);
            cmd.Parameters.AddWithValue("@w_lat", id.w_lat);
            cmd.Parameters.AddWithValue("@w_long", id.w_long);
            cmd.Parameters.AddWithValue("@zip", id.zip);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_LOCATIONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@locationdmcs_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LOCATIONDMCS_WC", con);
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




