using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class Pet_Vaccine
{
    public Int32 Pet_Vaccine_ID
    {
        get;
        set;
    }
    public Int32 Vaccine_Type_ID
    {
        get;
        set;
    }
    public String Allergies
    {
        get;
        set;
    }
    public String Current_Medacations
    {
        get;
        set;
    }
    public DateTime Last_Vaccine_Given
    {
        get;
        set;
    }
    public DateTime Date_Time_Stamp
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Pet_Vaccine_ID = 0;
        Vaccine_Type_ID = 0;
        Allergies = " ";
        Current_Medacations = " ";
        Last_Vaccine_Given = DateTime.Now;
        Date_Time_Stamp = DateTime.Now;
    }
    public Pet_Vaccine Select(int id)
    {
        Pet_Vaccine Pet_Vaccine = new Pet_Vaccine();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Vaccine_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    Pet_Vaccine.Pet_Vaccine_ID = rdr.GetInt32(0);
                }
                else
                {
                    Pet_Vaccine.Pet_Vaccine_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    Pet_Vaccine.Vaccine_Type_ID = rdr.GetInt32(1);
                }
                else
                {
                    Pet_Vaccine.Vaccine_Type_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    Pet_Vaccine.Allergies = rdr.GetString(2);
                }
                else
                {
                    Pet_Vaccine.Allergies = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    Pet_Vaccine.Current_Medacations = rdr.GetString(3);
                }
                else
                {
                    Pet_Vaccine.Current_Medacations = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    Pet_Vaccine.Last_Vaccine_Given = rdr.GetDateTime(4);
                }
                else
                {
                    Pet_Vaccine.Last_Vaccine_Given = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    Pet_Vaccine.Date_Time_Stamp = rdr.GetDateTime(5);
                }
                else
                {
                    Pet_Vaccine.Date_Time_Stamp = DateTime.Now;
                }
                }
                else
                {
                    Pet_Vaccine.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            Pet_Vaccine.SetColumnDefaults();
            return Pet_Vaccine;
            }
        finally
        {
            con.Close();
        }
        return Pet_Vaccine;
    }

    public Pet_Vaccine Insert(Pet_Vaccine id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PET_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Vaccine_Type_ID", id.Vaccine_Type_ID);
            cmd.Parameters.AddWithValue("@Allergies", id.Allergies);
            cmd.Parameters.AddWithValue("@Current_Medacations", id.Current_Medacations);
            cmd.Parameters.AddWithValue("@Last_Vaccine_Given", id.Last_Vaccine_Given);
            cmd.Parameters.AddWithValue("@Date_Time_Stamp", id.Date_Time_Stamp);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_PET_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Vaccine_Type_ID", id.Vaccine_Type_ID);
            cmd.Parameters.AddWithValue("@Allergies", id.Allergies);
            cmd.Parameters.AddWithValue("@Current_Medacations", id.Current_Medacations);
            cmd.Parameters.AddWithValue("@Last_Vaccine_Given", id.Last_Vaccine_Given);
            cmd.Parameters.AddWithValue("@Date_Time_Stamp", id.Date_Time_Stamp);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Pet_Vaccine_ID = rdr.GetInt32(0);
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
    public Boolean Update(Pet_Vaccine id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PET_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Vaccine_ID", id.Pet_Vaccine_ID);
            cmd.Parameters.AddWithValue("@Vaccine_Type_ID", id.Vaccine_Type_ID);
            cmd.Parameters.AddWithValue("@Allergies", id.Allergies);
            cmd.Parameters.AddWithValue("@Current_Medacations", id.Current_Medacations);
            cmd.Parameters.AddWithValue("@Last_Vaccine_Given", id.Last_Vaccine_Given);
            cmd.Parameters.AddWithValue("@Date_Time_Stamp", id.Date_Time_Stamp);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PET_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Vaccine_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_VACCINE_WC", con);
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




