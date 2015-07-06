using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class mobile_unit
{
    public Int32 mobile_unit_id
    {
        get;
        set;
    }
    public Int32 vehicle_id
    {
        get;
        set;
    }
    public String mobile_desc
    {
        get;
        set;
    }
    public Int32 call_center_id
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        mobile_unit_id = 0;
        vehicle_id = 0;
        mobile_desc = " ";
        call_center_id = 0;
    }
    public mobile_unit Select(int id)
    {
        mobile_unit mobile_unit = new mobile_unit();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MOBILE_UNIT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_unit_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    mobile_unit.mobile_unit_id = rdr.GetInt32(0);
                }
                else
                {
                    mobile_unit.mobile_unit_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    mobile_unit.vehicle_id = rdr.GetInt32(1);
                }
                else
                {
                    mobile_unit.vehicle_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    mobile_unit.mobile_desc = rdr.GetString(2);
                }
                else
                {
                    mobile_unit.mobile_desc = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    mobile_unit.call_center_id = rdr.GetInt32(3);
                }
                else
                {
                    mobile_unit.call_center_id = 0;
                }
                }
                else
                {
                    mobile_unit.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            mobile_unit.SetColumnDefaults();
            return mobile_unit;
            }
        finally
        {
            con.Close();
        }
        return mobile_unit;
    }

    public mobile_unit Insert(mobile_unit id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MOBILE_UNIT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_id", id.vehicle_id);
            cmd.Parameters.AddWithValue("@mobile_desc", id.mobile_desc);
            cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_MOBILE_UNIT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_id", id.vehicle_id);
            cmd.Parameters.AddWithValue("@mobile_desc", id.mobile_desc);
            cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.mobile_unit_id = rdr.GetInt32(0);
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
    public Boolean Update(mobile_unit id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MOBILE_UNIT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_unit_id", id.mobile_unit_id);
            cmd.Parameters.AddWithValue("@vehicle_id", id.vehicle_id);
            cmd.Parameters.AddWithValue("@mobile_desc", id.mobile_desc);
            cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MOBILE_UNIT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mobile_unit_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MOBILE_UNIT_WC", con);
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




