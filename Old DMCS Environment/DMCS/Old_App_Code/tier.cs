using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class tier
{
    public Int32 tier_id
    {
        get;
        set;
    }
    public String include_req
    {
        get;
        set;
    }
    public Int32 campaign_id
    {
        get;
        set;
    }
    public Int32 Tier_Age_Begin_Month
    {
        get;
        set;
    }
    public Int32 Tier_Age_Begin_Year
    {
        get;
        set;
    }
    public Int32 Tier_Age_End_Month
    {
        get;
        set;
    }
    public Int32 Tier_Age_End_Year
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        tier_id = 0;
        include_req = " ";
        campaign_id = 0;
        Tier_Age_Begin_Month = 0;
        Tier_Age_Begin_Year = 0;
        Tier_Age_End_Month = 0;
        Tier_Age_End_Year = 0;
    }
    public tier Select(int id)
    {
        tier tier = new tier();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TIER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tier_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    tier.tier_id = rdr.GetInt32(0);
                }
                else
                {
                    tier.tier_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    tier.include_req = rdr.GetString(1);
                }
                else
                {
                    tier.include_req = " ";
                }
                if (!rdr.IsDBNull(2))
                {
                    tier.campaign_id = rdr.GetInt32(2);
                }
                else
                {
                    tier.campaign_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    tier.Tier_Age_Begin_Month = rdr.GetInt32(3);
                }
                else
                {
                    tier.Tier_Age_Begin_Month = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    tier.Tier_Age_Begin_Year = rdr.GetInt32(4);
                }
                else
                {
                    tier.Tier_Age_Begin_Year = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    tier.Tier_Age_End_Month = rdr.GetInt32(5);
                }
                else
                {
                    tier.Tier_Age_End_Month = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    tier.Tier_Age_End_Year = rdr.GetInt32(6);
                }
                else
                {
                    tier.Tier_Age_End_Year = 0;
                }
                }
                else
                {
                    tier.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            tier.SetColumnDefaults();
            return tier;
            }
        finally
        {
            con.Close();
        }
        return tier;
    }

    public tier Insert(tier id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_TIER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@include_req", id.include_req);
            cmd.Parameters.AddWithValue("@campaign_id", id.campaign_id);
            cmd.Parameters.AddWithValue("@Tier_Age_Begin_Month", id.Tier_Age_Begin_Month);
            cmd.Parameters.AddWithValue("@Tier_Age_Begin_Year", id.Tier_Age_Begin_Year);
            cmd.Parameters.AddWithValue("@Tier_Age_End_Month", id.Tier_Age_End_Month);
            cmd.Parameters.AddWithValue("@Tier_Age_End_Year", id.Tier_Age_End_Year);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_TIER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@include_req", id.include_req);
            cmd.Parameters.AddWithValue("@campaign_id", id.campaign_id);
            cmd.Parameters.AddWithValue("@Tier_Age_Begin_Month", id.Tier_Age_Begin_Month);
            cmd.Parameters.AddWithValue("@Tier_Age_Begin_Year", id.Tier_Age_Begin_Year);
            cmd.Parameters.AddWithValue("@Tier_Age_End_Month", id.Tier_Age_End_Month);
            cmd.Parameters.AddWithValue("@Tier_Age_End_Year", id.Tier_Age_End_Year);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.tier_id = rdr.GetInt32(0);
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
    public Boolean Update(tier id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_TIER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tier_id", id.tier_id);
            cmd.Parameters.AddWithValue("@include_req", id.include_req);
            cmd.Parameters.AddWithValue("@campaign_id", id.campaign_id);
            cmd.Parameters.AddWithValue("@Tier_Age_Begin_Month", id.Tier_Age_Begin_Month);
            cmd.Parameters.AddWithValue("@Tier_Age_Begin_Year", id.Tier_Age_Begin_Year);
            cmd.Parameters.AddWithValue("@Tier_Age_End_Month", id.Tier_Age_End_Month);
            cmd.Parameters.AddWithValue("@Tier_Age_End_Year", id.Tier_Age_End_Year);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_TIER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tier_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TIER_WC", con);
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




