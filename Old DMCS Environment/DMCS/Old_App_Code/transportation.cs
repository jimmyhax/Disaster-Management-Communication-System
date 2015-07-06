using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class transportation
{
    public Int32 transport_id
    {
        get;
        set;
    }
    public String location_from
    {
        get;
        set;
    }
    public String location_to
    {
        get;
        set;
    }
    public Int32 no_of_passangers
    {
        get;
        set;
    }
    public DateTime pickup_date
    {
        get;
        set;
    }
    public String trans_type
    {
        get;
        set;
    }
    public Int32 Vehicle_id
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        transport_id = 0;
        location_from = " ";
        location_to = " ";
        no_of_passangers = 0;
        pickup_date = DateTime.Now;
        trans_type = " ";
        Vehicle_id = 0;
    }
    public transportation Select(int id)
    {
        transportation transportation = new transportation();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TRANSPORTATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@transport_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    transportation.transport_id = rdr.GetInt32(0);
                }
                else
                {
                    transportation.transport_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    transportation.location_from = rdr.GetString(1);
                }
                else
                {
                    transportation.location_from = " ";
                }
                if (!rdr.IsDBNull(2))
                {
                    transportation.location_to = rdr.GetString(2);
                }
                else
                {
                    transportation.location_to = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    transportation.no_of_passangers = rdr.GetInt32(3);
                }
                else
                {
                    transportation.no_of_passangers = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    transportation.pickup_date = rdr.GetDateTime(4);
                }
                else
                {
                    transportation.pickup_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    transportation.trans_type = rdr.GetString(5);
                }
                else
                {
                    transportation.trans_type = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    transportation.Vehicle_id = rdr.GetInt32(6);
                }
                else
                {
                    transportation.Vehicle_id = 0;
                }
                }
                else
                {
                    transportation.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            transportation.SetColumnDefaults();
            return transportation;
            }
        finally
        {
            con.Close();
        }
        return transportation;
    }

    public transportation Insert(transportation id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_TRANSPORTATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@transport_id", id.transport_id);
            cmd.Parameters.AddWithValue("@location_from", id.location_from);
            cmd.Parameters.AddWithValue("@location_to", id.location_to);
            cmd.Parameters.AddWithValue("@no_of_passangers", id.no_of_passangers);
            cmd.Parameters.AddWithValue("@pickup_date", id.pickup_date);
            cmd.Parameters.AddWithValue("@trans_type", id.trans_type);
            cmd.Parameters.AddWithValue("@Vehicle_id", id.Vehicle_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_TRANSPORTATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@location_from", id.location_from);
            cmd.Parameters.AddWithValue("@location_to", id.location_to);
            cmd.Parameters.AddWithValue("@no_of_passangers", id.no_of_passangers);
            cmd.Parameters.AddWithValue("@pickup_date", id.pickup_date);
            cmd.Parameters.AddWithValue("@trans_type", id.trans_type);
            cmd.Parameters.AddWithValue("@Vehicle_id", id.Vehicle_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.transport_id = rdr.GetInt32(0);
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
    public Boolean Update(transportation id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_TRANSPORTATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@transport_id", id.transport_id);
            cmd.Parameters.AddWithValue("@location_from", id.location_from);
            cmd.Parameters.AddWithValue("@location_to", id.location_to);
            cmd.Parameters.AddWithValue("@no_of_passangers", id.no_of_passangers);
            cmd.Parameters.AddWithValue("@pickup_date", id.pickup_date);
            cmd.Parameters.AddWithValue("@trans_type", id.trans_type);
            cmd.Parameters.AddWithValue("@Vehicle_id", id.Vehicle_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_TRANSPORTATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@transport_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TRANSPORTATION_WC", con);
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




