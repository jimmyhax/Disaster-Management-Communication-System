using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class equipment
{
    public Int32 equipment_id
    {
        get;
        set;
    }
    public Int32 resource_ID
    {
        get;
        set;
    }
    public Int32 vendor_id
    {
        get;
        set;
    }
    public String Description
    {
        get;
        set;
    }
    public String costType
    {
        get;
        set;
    }
    public Decimal costRate
    {
        get;
        set;
    }
    public Int32 capacity
    {
        get;
        set;
    }
    public String make
    {
        get;
        set;
    }
    public String model
    {
        get;
        set;
    }
    public String operatorName
    {
        get;
        set;
    }
    public DateTime startDate
    {
        get;
        set;
    }
    public DateTime endDate
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        equipment_id = 0;
        resource_ID = 0;
        vendor_id = 0;
        Description = " ";
        costType = " ";
        costRate = 0;
        capacity = 0;
        make = " ";
        model = " ";
        operatorName = " ";
        startDate = DateTime.Now;
        endDate = DateTime.Now;
    }
    public equipment Select(int id)
    {
        equipment equipment = new equipment();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EQUIPMENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@equipment_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    equipment.equipment_id = rdr.GetInt32(0);
                }
                else
                {
                    equipment.equipment_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    equipment.resource_ID = rdr.GetInt32(1);
                }
                else
                {
                    equipment.resource_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    equipment.vendor_id = rdr.GetInt32(2);
                }
                else
                {
                    equipment.vendor_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    equipment.Description = rdr.GetString(3);
                }
                else
                {
                    equipment.Description = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    equipment.costType = rdr.GetString(4);
                }
                else
                {
                    equipment.costType = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    equipment.costRate = rdr.GetDecimal(5);
                }
                else
                {
                    equipment.costRate = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    equipment.capacity = rdr.GetInt32(6);
                }
                else
                {
                    equipment.capacity = 0;
                }
                if (!rdr.IsDBNull(7))
                {
                    equipment.make = rdr.GetString(7);
                }
                else
                {
                    equipment.make = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    equipment.model = rdr.GetString(8);
                }
                else
                {
                    equipment.model = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    equipment.operatorName = rdr.GetString(9);
                }
                else
                {
                    equipment.operatorName = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    equipment.startDate = rdr.GetDateTime(10);
                }
                else
                {
                    equipment.startDate = DateTime.Now;
                }
                if (!rdr.IsDBNull(11))
                {
                    equipment.endDate = rdr.GetDateTime(11);
                }
                else
                {
                    equipment.endDate = DateTime.Now;
                }
                }
                else
                {
                    equipment.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            equipment.SetColumnDefaults();
            return equipment;
            }
        finally
        {
            con.Close();
        }
        return equipment;
    }

    public equipment Insert(equipment id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EQUIPMENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@resource_ID", id.resource_ID);
            cmd.Parameters.AddWithValue("@vendor_id", id.vendor_id);
            cmd.Parameters.AddWithValue("@Description", id.Description);
            cmd.Parameters.AddWithValue("@costType", id.costType);
            cmd.Parameters.AddWithValue("@costRate", id.costRate);
            cmd.Parameters.AddWithValue("@capacity", id.capacity);
            cmd.Parameters.AddWithValue("@make", id.make);
            cmd.Parameters.AddWithValue("@model", id.model);
            cmd.Parameters.AddWithValue("@operatorName", id.operatorName);
            cmd.Parameters.AddWithValue("@startDate", id.startDate);
            cmd.Parameters.AddWithValue("@endDate", id.endDate);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_EQUIPMENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@resource_ID", id.resource_ID);
            cmd.Parameters.AddWithValue("@vendor_id", id.vendor_id);
            cmd.Parameters.AddWithValue("@Description", id.Description);
            cmd.Parameters.AddWithValue("@costType", id.costType);
            cmd.Parameters.AddWithValue("@costRate", id.costRate);
            cmd.Parameters.AddWithValue("@capacity", id.capacity);
            cmd.Parameters.AddWithValue("@make", id.make);
            cmd.Parameters.AddWithValue("@model", id.model);
            cmd.Parameters.AddWithValue("@operatorName", id.operatorName);
            cmd.Parameters.AddWithValue("@startDate", id.startDate);
            cmd.Parameters.AddWithValue("@endDate", id.endDate);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.equipment_id = rdr.GetInt32(0);
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
    public Boolean Update(equipment id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EQUIPMENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@equipment_id", id.equipment_id);
            cmd.Parameters.AddWithValue("@resource_ID", id.resource_ID);
            cmd.Parameters.AddWithValue("@vendor_id", id.vendor_id);
            cmd.Parameters.AddWithValue("@Description", id.Description);
            cmd.Parameters.AddWithValue("@costType", id.costType);
            cmd.Parameters.AddWithValue("@costRate", id.costRate);
            cmd.Parameters.AddWithValue("@capacity", id.capacity);
            cmd.Parameters.AddWithValue("@make", id.make);
            cmd.Parameters.AddWithValue("@model", id.model);
            cmd.Parameters.AddWithValue("@operatorName", id.operatorName);
            cmd.Parameters.AddWithValue("@startDate", id.startDate);
            cmd.Parameters.AddWithValue("@endDate", id.endDate);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EQUIPMENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@equipment_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EQUIPMENT_WC", con);
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




