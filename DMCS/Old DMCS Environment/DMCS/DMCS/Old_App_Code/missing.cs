using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class missing
{
    public Int32 Missing_id
    {
        get;
        set;
    }
    public String client_other_info
    {
        get;
        set;
    }
    public String clothing
    {
        get;
        set;
    }
    public DateTime date_of_disappearance
    {
        get;
        set;
    }
    public String last_known_location
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Missing_id = 0;
        client_other_info = " ";
        clothing = " ";
        date_of_disappearance = DateTime.Now;
        last_known_location = " ";
    }
    public missing Select(int id)
    {
        missing missing = new missing();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MISSING", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Missing_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    missing.Missing_id = rdr.GetInt32(0);
                }
                else
                {
                    missing.Missing_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    missing.client_other_info = rdr.GetString(1);
                }
                else
                {
                    missing.client_other_info = " ";
                }
                if (!rdr.IsDBNull(2))
                {
                    missing.clothing = rdr.GetString(2);
                }
                else
                {
                    missing.clothing = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    missing.date_of_disappearance = rdr.GetDateTime(3);
                }
                else
                {
                    missing.date_of_disappearance = DateTime.Now;
                }
                if (!rdr.IsDBNull(4))
                {
                    missing.last_known_location = rdr.GetString(4);
                }
                else
                {
                    missing.last_known_location = " ";
                }
                }
                else
                {
                    missing.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            missing.SetColumnDefaults();
            return missing;
            }
        finally
        {
            con.Close();
        }
        return missing;
    }

    public missing Insert(missing id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MISSING", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Missing_id", id.Missing_id);
            cmd.Parameters.AddWithValue("@client_other_info", id.client_other_info);
            cmd.Parameters.AddWithValue("@clothing", id.clothing);
            cmd.Parameters.AddWithValue("@date_of_disappearance", id.date_of_disappearance);
            cmd.Parameters.AddWithValue("@last_known_location", id.last_known_location);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_MISSING", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@client_other_info", id.client_other_info);
            cmd.Parameters.AddWithValue("@clothing", id.clothing);
            cmd.Parameters.AddWithValue("@date_of_disappearance", id.date_of_disappearance);
            cmd.Parameters.AddWithValue("@last_known_location", id.last_known_location);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Missing_id = rdr.GetInt32(0);
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
    public Boolean Update(missing id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MISSING", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Missing_id", id.Missing_id);
            cmd.Parameters.AddWithValue("@client_other_info", id.client_other_info);
            cmd.Parameters.AddWithValue("@clothing", id.clothing);
            cmd.Parameters.AddWithValue("@date_of_disappearance", id.date_of_disappearance);
            cmd.Parameters.AddWithValue("@last_known_location", id.last_known_location);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MISSING", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Missing_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MISSING_WC", con);
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




