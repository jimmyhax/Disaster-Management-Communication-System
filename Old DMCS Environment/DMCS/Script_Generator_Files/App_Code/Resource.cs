using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class Resource
{
    public Int32 Resource_ID
    {
        get;
        set;
    }
    public Int32 Resource_Type_ID
    {
        get;
        set;
    }
    public String Description
    {
        get;
        set;
    }
    public String Address
    {
        get;
        set;
    }
    public String City
    {
        get;
        set;
    }
    public String State
    {
        get;
        set;
    }
    public String Zip Code
    {
        get;
        set;
    }
    public String PayType
    {
        get;
        set;
    }
    public Decimal PayRate
    {
        get;
        set;
    }
    public DateTime AvailabilityDate
    {
        get;
        set;
    }
    public DateTime AvailabilityHours
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Resource_ID = 0;
        Resource_Type_ID = 0;
        Description = " ";
        Address = " ";
        City = " ";
        State = " ";
        Zip Code = " ";
        PayType = " ";
        PayRate = 0;
        AvailabilityDate = DateTime.Now;
        AvailabilityHours = DateTime.Now;
    }
    public Resource Select(int id)
    {
        Resource Resource = new Resource();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    Resource.Resource_ID = rdr.GetInt32(0);
                }
                else
                {
                    Resource.Resource_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    Resource.Resource_Type_ID = rdr.GetInt32(1);
                }
                else
                {
                    Resource.Resource_Type_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    Resource.Description = rdr.GetString(2);
                }
                else
                {
                    Resource.Description = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    Resource.Address = rdr.GetString(3);
                }
                else
                {
                    Resource.Address = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    Resource.City = rdr.GetString(4);
                }
                else
                {
                    Resource.City = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    Resource.State = rdr.GetString(5);
                }
                else
                {
                    Resource.State = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    Resource.Zip Code = rdr.GetString(6);
                }
                else
                {
                    Resource.Zip Code = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    Resource.PayType = rdr.GetString(7);
                }
                else
                {
                    Resource.PayType = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    Resource.PayRate = rdr.GetDecimal(8);
                }
                else
                {
                    Resource.PayRate = 0;
                }
                if (!rdr.IsDBNull(9))
                {
                    Resource.AvailabilityDate = rdr.GetDateTime(9);
                }
                else
                {
                    Resource.AvailabilityDate = DateTime.Now;
                }
                if (!rdr.IsDBNull(10))
                {
                    Resource.AvailabilityHours = rdr.GetDateTime(10);
                }
                else
                {
                    Resource.AvailabilityHours = DateTime.Now;
                }
                }
                else
                {
                    Resource.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            Resource.SetColumnDefaults();
            return Resource;
            }
        finally
        {
            con.Close();
        }
        return Resource;
    }

    public Resource Insert(Resource id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_Type_ID", id.Resource_Type_ID);
            cmd.Parameters.AddWithValue("@Description", id.Description);
            cmd.Parameters.AddWithValue("@Address", id.Address);
            cmd.Parameters.AddWithValue("@City", id.City);
            cmd.Parameters.AddWithValue("@State", id.State);
            cmd.Parameters.AddWithValue("@Zip Code", id.Zip Code);
            cmd.Parameters.AddWithValue("@PayType", id.PayType);
            cmd.Parameters.AddWithValue("@PayRate", id.PayRate);
            cmd.Parameters.AddWithValue("@AvailabilityDate", id.AvailabilityDate);
            cmd.Parameters.AddWithValue("@AvailabilityHours", id.AvailabilityHours);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_Type_ID", id.Resource_Type_ID);
            cmd.Parameters.AddWithValue("@Description", id.Description);
            cmd.Parameters.AddWithValue("@Address", id.Address);
            cmd.Parameters.AddWithValue("@City", id.City);
            cmd.Parameters.AddWithValue("@State", id.State);
            cmd.Parameters.AddWithValue("@Zip Code", id.Zip Code);
            cmd.Parameters.AddWithValue("@PayType", id.PayType);
            cmd.Parameters.AddWithValue("@PayRate", id.PayRate);
            cmd.Parameters.AddWithValue("@AvailabilityDate", id.AvailabilityDate);
            cmd.Parameters.AddWithValue("@AvailabilityHours", id.AvailabilityHours);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Resource_ID = rdr.GetInt32(0);
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
    public Boolean Update(Resource id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@Resource_Type_ID", id.Resource_Type_ID);
            cmd.Parameters.AddWithValue("@Description", id.Description);
            cmd.Parameters.AddWithValue("@Address", id.Address);
            cmd.Parameters.AddWithValue("@City", id.City);
            cmd.Parameters.AddWithValue("@State", id.State);
            cmd.Parameters.AddWithValue("@Zip Code", id.Zip Code);
            cmd.Parameters.AddWithValue("@PayType", id.PayType);
            cmd.Parameters.AddWithValue("@PayRate", id.PayRate);
            cmd.Parameters.AddWithValue("@AvailabilityDate", id.AvailabilityDate);
            cmd.Parameters.AddWithValue("@AvailabilityHours", id.AvailabilityHours);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_RESOURCE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RESOURCE_WC", con);
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




