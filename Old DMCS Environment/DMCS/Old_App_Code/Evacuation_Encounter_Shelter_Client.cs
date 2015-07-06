using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class Evacuation_Encounter_Shelter_Client
{
    public Int32 Evacuation_Encounter_Shelter_Client_ID
    {
        get;
        set;
    }
    public Int32 Evacuation_Area_ID
    {
        get;
        set;
    }
    public Int32 Encounter_Id
    {
        get;
        set;
    }
    public DateTime Start_Date
    {
        get;
        set;
    }
    public DateTime End_Date
    {
        get;
        set;
    }
    public Int32 Shelter_ID
    {
        get;
        set;
    }
    public Int32 Client_ID
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Evacuation_Encounter_Shelter_Client_ID = 0;
        Evacuation_Area_ID = 0;
        Encounter_Id = 0;
        Start_Date = DateTime.Now;
        End_Date = DateTime.Now;
        Shelter_ID = 0;
        Client_ID = 0;
    }
    public Evacuation_Encounter_Shelter_Client Select(int id)
    {
        Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client = new Evacuation_Encounter_Shelter_Client();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Evacuation_Encounter_Shelter_Client_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID = rdr.GetInt32(0);
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID = rdr.GetInt32(1);
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    Evacuation_Encounter_Shelter_Client.Encounter_Id = rdr.GetInt32(2);
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.Encounter_Id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    Evacuation_Encounter_Shelter_Client.Start_Date = rdr.GetDateTime(3);
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.Start_Date = DateTime.Now;
                }
                if (!rdr.IsDBNull(4))
                {
                    Evacuation_Encounter_Shelter_Client.End_Date = rdr.GetDateTime(4);
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.End_Date = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    Evacuation_Encounter_Shelter_Client.Shelter_ID = rdr.GetInt32(5);
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.Shelter_ID = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    Evacuation_Encounter_Shelter_Client.Client_ID = rdr.GetInt32(6);
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.Client_ID = 0;
                }
                }
                else
                {
                    Evacuation_Encounter_Shelter_Client.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            Evacuation_Encounter_Shelter_Client.SetColumnDefaults();
            return Evacuation_Encounter_Shelter_Client;
            }
        finally
        {
            con.Close();
        }
        return Evacuation_Encounter_Shelter_Client;
    }

    public Evacuation_Encounter_Shelter_Client Insert(Evacuation_Encounter_Shelter_Client id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
            cmd.Parameters.AddWithValue("@Encounter_Id", id.Encounter_Id);
            cmd.Parameters.AddWithValue("@Start_Date", id.Start_Date);
            cmd.Parameters.AddWithValue("@End_Date", id.End_Date);
            cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
            cmd.Parameters.AddWithValue("@Client_ID", id.Client_ID);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
            cmd.Parameters.AddWithValue("@Encounter_Id", id.Encounter_Id);
            cmd.Parameters.AddWithValue("@Start_Date", id.Start_Date);
            cmd.Parameters.AddWithValue("@End_Date", id.End_Date);
            cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
            cmd.Parameters.AddWithValue("@Client_ID", id.Client_ID);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Evacuation_Encounter_Shelter_Client_ID = rdr.GetInt32(0);
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
    public Boolean Update(Evacuation_Encounter_Shelter_Client id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Evacuation_Encounter_Shelter_Client_ID", id.Evacuation_Encounter_Shelter_Client_ID);
            cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
            cmd.Parameters.AddWithValue("@Encounter_Id", id.Encounter_Id);
            cmd.Parameters.AddWithValue("@Start_Date", id.Start_Date);
            cmd.Parameters.AddWithValue("@End_Date", id.End_Date);
            cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
            cmd.Parameters.AddWithValue("@Client_ID", id.Client_ID);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Evacuation_Encounter_Shelter_Client_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT_WC", con);
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




