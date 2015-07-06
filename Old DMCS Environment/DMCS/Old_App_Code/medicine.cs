using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class medicine
{
    public Int32 Medicine_Id
    {
        get;
        set;
    }
    public String Medication_type
    {
        get;
        set;
    }
    public String Medication_name
    {
        get;
        set;
    }
    public Int32 Clients_Served
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Medicine_Id = 0;
        Medication_type = " ";
        Medication_name = " ";
        Clients_Served = 0;
    }
    public medicine Select(int id)
    {
        medicine medicine = new medicine();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEDICINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Medicine_Id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    medicine.Medicine_Id = rdr.GetInt32(0);
                }
                else
                {
                    medicine.Medicine_Id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    medicine.Medication_type = rdr.GetString(1);
                }
                else
                {
                    medicine.Medication_type = " ";
                }
                if (!rdr.IsDBNull(2))
                {
                    medicine.Medication_name = rdr.GetString(2);
                }
                else
                {
                    medicine.Medication_name = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    medicine.Clients_Served = rdr.GetInt32(3);
                }
                else
                {
                    medicine.Clients_Served = 0;
                }
                }
                else
                {
                    medicine.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            medicine.SetColumnDefaults();
            return medicine;
            }
        finally
        {
            con.Close();
        }
        return medicine;
    }

    public medicine Insert(medicine id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEDICINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Medication_type", id.Medication_type);
            cmd.Parameters.AddWithValue("@Medication_name", id.Medication_name);
            cmd.Parameters.AddWithValue("@Clients_Served", id.Clients_Served);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_MEDICINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Medication_type", id.Medication_type);
            cmd.Parameters.AddWithValue("@Medication_name", id.Medication_name);
            cmd.Parameters.AddWithValue("@Clients_Served", id.Clients_Served);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Medicine_Id = rdr.GetInt32(0);
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
    public Boolean Update(medicine id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEDICINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Medicine_Id", id.Medicine_Id);
            cmd.Parameters.AddWithValue("@Medication_type", id.Medication_type);
            cmd.Parameters.AddWithValue("@Medication_name", id.Medication_name);
            cmd.Parameters.AddWithValue("@Clients_Served", id.Clients_Served);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEDICINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Medicine_Id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEDICINE_WC", con);
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




