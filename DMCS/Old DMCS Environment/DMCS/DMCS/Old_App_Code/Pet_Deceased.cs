using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class Pet_Deceased
{
    public Int32 Pet_Deceased_ID
    {
        get;
        set;
    }
    public DateTime Date_Deceased
    {
        get;
        set;
    }
    public Int32 Location_ID
    {
        get;
        set;
    }
    public String Funeral
    {
        get;
        set;
    }
    public String Cemetary_Name
    {
        get;
        set;
    }
    public String Deceased_Type
    {
        get;
        set;
    }
    public DateTime Date_Created
    {
        get;
        set;
    }
    public DateTime Date_Modified
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Pet_Deceased_ID = 0;
        Date_Deceased = DateTime.Now;
        Location_ID = 0;
        Funeral = " ";
        Cemetary_Name = " ";
        Deceased_Type = " ";
        Date_Created = DateTime.Now;
        Date_Modified = DateTime.Now;
    }
    public Pet_Deceased Select(int id)
    {
        Pet_Deceased Pet_Deceased = new Pet_Deceased();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_DECEASED", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Deceased_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    Pet_Deceased.Pet_Deceased_ID = rdr.GetInt32(0);
                }
                else
                {
                    Pet_Deceased.Pet_Deceased_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    Pet_Deceased.Date_Deceased = rdr.GetDateTime(1);
                }
                else
                {
                    Pet_Deceased.Date_Deceased = DateTime.Now;
                }
                if (!rdr.IsDBNull(2))
                {
                    Pet_Deceased.Location_ID = rdr.GetInt32(2);
                }
                else
                {
                    Pet_Deceased.Location_ID = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    Pet_Deceased.Funeral = rdr.GetString(3);
                }
                else
                {
                    Pet_Deceased.Funeral = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    Pet_Deceased.Cemetary_Name = rdr.GetString(4);
                }
                else
                {
                    Pet_Deceased.Cemetary_Name = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    Pet_Deceased.Deceased_Type = rdr.GetString(5);
                }
                else
                {
                    Pet_Deceased.Deceased_Type = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    Pet_Deceased.Date_Created = rdr.GetDateTime(6);
                }
                else
                {
                    Pet_Deceased.Date_Created = DateTime.Now;
                }
                if (!rdr.IsDBNull(7))
                {
                    Pet_Deceased.Date_Modified = rdr.GetDateTime(7);
                }
                else
                {
                    Pet_Deceased.Date_Modified = DateTime.Now;
                }
                }
                else
                {
                    Pet_Deceased.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            Pet_Deceased.SetColumnDefaults();
            return Pet_Deceased;
            }
        finally
        {
            con.Close();
        }
        return Pet_Deceased;
    }

    public Pet_Deceased Insert(Pet_Deceased id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PET_DECEASED", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Deceased_ID", id.Pet_Deceased_ID);
            cmd.Parameters.AddWithValue("@Date_Deceased", id.Date_Deceased);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@Funeral", id.Funeral);
            cmd.Parameters.AddWithValue("@Cemetary_Name", id.Cemetary_Name);
            cmd.Parameters.AddWithValue("@Deceased_Type", id.Deceased_Type);
            cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
            cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_PET_DECEASED", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Date_Deceased", id.Date_Deceased);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@Funeral", id.Funeral);
            cmd.Parameters.AddWithValue("@Cemetary_Name", id.Cemetary_Name);
            cmd.Parameters.AddWithValue("@Deceased_Type", id.Deceased_Type);
            cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
            cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Pet_Deceased_ID = rdr.GetInt32(0);
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
    public Boolean Update(Pet_Deceased id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PET_DECEASED", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Deceased_ID", id.Pet_Deceased_ID);
            cmd.Parameters.AddWithValue("@Date_Deceased", id.Date_Deceased);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@Funeral", id.Funeral);
            cmd.Parameters.AddWithValue("@Cemetary_Name", id.Cemetary_Name);
            cmd.Parameters.AddWithValue("@Deceased_Type", id.Deceased_Type);
            cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
            cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PET_DECEASED", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Deceased_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_DECEASED_WC", con);
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




