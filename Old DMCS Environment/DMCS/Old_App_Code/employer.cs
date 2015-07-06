using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class employer
{
    public Int32 emplr_id
    {
        get;
        set;
    }
    public Int32 case_id
    {
        get;
        set;
    }
    public Int32 client_id
    {
        get;
        set;
    }
    public Int32 address_id
    {
        get;
        set;
    }
    public String emplr_name
    {
        get;
        set;
    }
    public String emplr_phone
    {
        get;
        set;
    }
    public DateTime end_date
    {
        get;
        set;
    }
    public DateTime strt_date
    {
        get;
        set;
    }
    public String term_reason
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        emplr_id = 0;
        case_id = 0;
        client_id = 0;
        address_id = 0;
        emplr_name = " ";
        emplr_phone = " ";
        end_date = DateTime.Now;
        strt_date = DateTime.Now;
        term_reason = " ";
    }
    public employer Select(int id)
    {
        employer employer = new employer();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMPLOYER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emplr_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    employer.emplr_id = rdr.GetInt32(0);
                }
                else
                {
                    employer.emplr_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    employer.case_id = rdr.GetInt32(1);
                }
                else
                {
                    employer.case_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    employer.client_id = rdr.GetInt32(2);
                }
                else
                {
                    employer.client_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    employer.address_id = rdr.GetInt32(3);
                }
                else
                {
                    employer.address_id = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    employer.emplr_name = rdr.GetString(4);
                }
                else
                {
                    employer.emplr_name = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    employer.emplr_phone = rdr.GetString(5);
                }
                else
                {
                    employer.emplr_phone = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    employer.end_date = rdr.GetDateTime(6);
                }
                else
                {
                    employer.end_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(7))
                {
                    employer.strt_date = rdr.GetDateTime(7);
                }
                else
                {
                    employer.strt_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(8))
                {
                    employer.term_reason = rdr.GetString(8);
                }
                else
                {
                    employer.term_reason = " ";
                }
                }
                else
                {
                    employer.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            employer.SetColumnDefaults();
            return employer;
            }
        finally
        {
            con.Close();
        }
        return employer;
    }

    public employer Insert(employer id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EMPLOYER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@emplr_name", id.emplr_name);
            cmd.Parameters.AddWithValue("@emplr_phone", id.emplr_phone);
            cmd.Parameters.AddWithValue("@end_date", id.end_date);
            cmd.Parameters.AddWithValue("@strt_date", id.strt_date);
            cmd.Parameters.AddWithValue("@term_reason", id.term_reason);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_EMPLOYER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@emplr_name", id.emplr_name);
            cmd.Parameters.AddWithValue("@emplr_phone", id.emplr_phone);
            cmd.Parameters.AddWithValue("@end_date", id.end_date);
            cmd.Parameters.AddWithValue("@strt_date", id.strt_date);
            cmd.Parameters.AddWithValue("@term_reason", id.term_reason);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.emplr_id = rdr.GetInt32(0);
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
    public Boolean Update(employer id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EMPLOYER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emplr_id", id.emplr_id);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@emplr_name", id.emplr_name);
            cmd.Parameters.AddWithValue("@emplr_phone", id.emplr_phone);
            cmd.Parameters.AddWithValue("@end_date", id.end_date);
            cmd.Parameters.AddWithValue("@strt_date", id.strt_date);
            cmd.Parameters.AddWithValue("@term_reason", id.term_reason);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EMPLOYER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emplr_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMPLOYER_WC", con);
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




