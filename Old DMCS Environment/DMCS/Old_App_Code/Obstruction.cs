using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class Obstruction
{
    public Int32 Obstruction_ID
    {
        get;
        set;
    }
    public Int32 Evacuation_Area_ID
    {
        get;
        set;
    }
    public Int32 Location_ID
    {
        get;
        set;
    }
    public DateTime Date_Reported
    {
        get;
        set;
    }
    public DateTime Expected_Recovery_Date
    {
        get;
        set;
    }
    public String Type
    {
        get;
        set;
    }
    public String Severity
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Obstruction_ID = 0;
        Evacuation_Area_ID = 0;
        Location_ID = 0;
        Date_Reported = DateTime.Now;
        Expected_Recovery_Date = DateTime.Now;
        Type = " ";
        Severity = " ";
    }
    public Obstruction Select(int id)
    {
        Obstruction Obstruction = new Obstruction();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_OBSTRUCTION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Obstruction_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    Obstruction.Obstruction_ID = rdr.GetInt32(0);
                }
                else
                {
                    Obstruction.Obstruction_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    Obstruction.Evacuation_Area_ID = rdr.GetInt32(1);
                }
                else
                {
                    Obstruction.Evacuation_Area_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    Obstruction.Location_ID = rdr.GetInt32(2);
                }
                else
                {
                    Obstruction.Location_ID = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    Obstruction.Date_Reported = rdr.GetDateTime(3);
                }
                else
                {
                    Obstruction.Date_Reported = DateTime.Now;
                }
                if (!rdr.IsDBNull(4))
                {
                    Obstruction.Expected_Recovery_Date = rdr.GetDateTime(4);
                }
                else
                {
                    Obstruction.Expected_Recovery_Date = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    Obstruction.Type = rdr.GetString(5);
                }
                else
                {
                    Obstruction.Type = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    Obstruction.Severity = rdr.GetString(6);
                }
                else
                {
                    Obstruction.Severity = " ";
                }
                }
                else
                {
                    Obstruction.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            Obstruction.SetColumnDefaults();
            return Obstruction;
            }
        finally
        {
            con.Close();
        }
        return Obstruction;
    }

    public Obstruction Insert(Obstruction id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_OBSTRUCTION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@Date_Reported", id.Date_Reported);
            cmd.Parameters.AddWithValue("@Expected_Recovery_Date", id.Expected_Recovery_Date);
            cmd.Parameters.AddWithValue("@Type", id.Type);
            cmd.Parameters.AddWithValue("@Severity", id.Severity);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_OBSTRUCTION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@Date_Reported", id.Date_Reported);
            cmd.Parameters.AddWithValue("@Expected_Recovery_Date", id.Expected_Recovery_Date);
            cmd.Parameters.AddWithValue("@Type", id.Type);
            cmd.Parameters.AddWithValue("@Severity", id.Severity);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Obstruction_ID = rdr.GetInt32(0);
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
    public Boolean Update(Obstruction id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_OBSTRUCTION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Obstruction_ID", id.Obstruction_ID);
            cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@Date_Reported", id.Date_Reported);
            cmd.Parameters.AddWithValue("@Expected_Recovery_Date", id.Expected_Recovery_Date);
            cmd.Parameters.AddWithValue("@Type", id.Type);
            cmd.Parameters.AddWithValue("@Severity", id.Severity);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_OBSTRUCTION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Obstruction_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_OBSTRUCTION_WC", con);
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




