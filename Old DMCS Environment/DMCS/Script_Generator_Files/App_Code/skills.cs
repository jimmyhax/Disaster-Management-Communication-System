using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class skills
{
    public Int32 skills_id
    {
        get;
        set;
    }
    public String skills_description
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        skills_id = 0;
        skills_description = " ";
    }
    public skills Select(int id)
    {
        skills skills = new skills();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SKILLS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@skills_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    skills.skills_id = rdr.GetInt32(0);
                }
                else
                {
                    skills.skills_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    skills.skills_description = rdr.GetString(1);
                }
                else
                {
                    skills.skills_description = " ";
                }
                }
                else
                {
                    skills.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            skills.SetColumnDefaults();
            return skills;
            }
        finally
        {
            con.Close();
        }
        return skills;
    }

    public skills Insert(skills id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_SKILLS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@skills_description", id.skills_description);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_SKILLS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@skills_description", id.skills_description);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.skills_id = rdr.GetInt32(0);
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
    public Boolean Update(skills id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_SKILLS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@skills_id", id.skills_id);
            cmd.Parameters.AddWithValue("@skills_description", id.skills_description);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_SKILLS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@skills_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SKILLS_WC", con);
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




