using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class donation
{
    public Int32 Donation_ID
    {
        get;
        set;
    }
    public Int32 Receipt_ID
    {
        get;
        set;
    }
    public Int32 Resource_ID
    {
        get;
        set;
    }
    public Int32 Donor_ID
    {
        get;
        set;
    }
    public DateTime Date
    {
        get;
        set;
    }
    public Int32 Quantity
    {
        get;
        set;
    }
    public Int32 Agency_ID
    {
        get;
        set;
    }
    public Boolean Is_Monetary
    {
        get;
        set;
    }
    public Boolean Is_FEMA
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Donation_ID = 0;
        Receipt_ID = 0;
        Resource_ID = 0;
        Donor_ID = 0;
        Date = DateTime.Now;
        Quantity = 0;
        Agency_ID = 0;
        Is_Monetary = false;
        Is_FEMA = false;
    }
    public donation Select(int id)
    {
        donation donation = new donation();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DONATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Donation_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    donation.Donation_ID = rdr.GetInt32(0);
                }
                else
                {
                    donation.Donation_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    donation.Receipt_ID = rdr.GetInt32(1);
                }
                else
                {
                    donation.Receipt_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    donation.Resource_ID = rdr.GetInt32(2);
                }
                else
                {
                    donation.Resource_ID = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    donation.Donor_ID = rdr.GetInt32(3);
                }
                else
                {
                    donation.Donor_ID = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    donation.Date = rdr.GetDateTime(4);
                }
                else
                {
                    donation.Date = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    donation.Quantity = rdr.GetInt32(5);
                }
                else
                {
                    donation.Quantity = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    donation.Agency_ID = rdr.GetInt32(6);
                }
                else
                {
                    donation.Agency_ID = 0;
                }
                if (!rdr.IsDBNull(7))
                {
                    donation.Is_Monetary = rdr.GetBoolean(7);
                }
                else
                {
                    donation.Is_Monetary = false;
                }
                if (!rdr.IsDBNull(8))
                {
                    donation.Is_FEMA = rdr.GetBoolean(8);
                }
                else
                {
                    donation.Is_FEMA = false;
                }
                }
                else
                {
                    donation.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            donation.SetColumnDefaults();
            return donation;
            }
        finally
        {
            con.Close();
        }
        return donation;
    }

    public donation Insert(donation id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DONATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Receipt_ID", id.Receipt_ID);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@Donor_ID", id.Donor_ID);
            cmd.Parameters.AddWithValue("@Date", id.Date);
            cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
            cmd.Parameters.AddWithValue("@Agency_ID", id.Agency_ID);
            cmd.Parameters.AddWithValue("@Is_Monetary", id.Is_Monetary);
            cmd.Parameters.AddWithValue("@Is_FEMA", id.Is_FEMA);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_DONATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Receipt_ID", id.Receipt_ID);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@Donor_ID", id.Donor_ID);
            cmd.Parameters.AddWithValue("@Date", id.Date);
            cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
            cmd.Parameters.AddWithValue("@Agency_ID", id.Agency_ID);
            cmd.Parameters.AddWithValue("@Is_Monetary", id.Is_Monetary);
            cmd.Parameters.AddWithValue("@Is_FEMA", id.Is_FEMA);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Donation_ID = rdr.GetInt32(0);
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
    public Boolean Update(donation id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DONATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Donation_ID", id.Donation_ID);
            cmd.Parameters.AddWithValue("@Receipt_ID", id.Receipt_ID);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@Donor_ID", id.Donor_ID);
            cmd.Parameters.AddWithValue("@Date", id.Date);
            cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
            cmd.Parameters.AddWithValue("@Agency_ID", id.Agency_ID);
            cmd.Parameters.AddWithValue("@Is_Monetary", id.Is_Monetary);
            cmd.Parameters.AddWithValue("@Is_FEMA", id.Is_FEMA);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DONATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Donation_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DONATION_WC", con);
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




