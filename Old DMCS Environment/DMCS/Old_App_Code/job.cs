using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class job
{
    public Int32 job_id
    {
        get;
        set;
    }
    public Int32 address_id
    {
        get;
        set;
    }
    public Int32 company_id
    {
        get;
        set;
    }
    public Int32 job_cat_id
    {
        get;
        set;
    }
    public DateTime job_posted_date
    {
        get;
        set;
    }
    public String job_status
    {
        get;
        set;
    }
    public String job_title
    {
        get;
        set;
    }
    public String Work_Classification_Full_time
    {
        get;
        set;
    }
    public String Work_Classification_Part_time
    {
        get;
        set;
    }
    public String Work_Payment_Freq_Weekly
    {
        get;
        set;
    }
    public String Work_Payment_Freq_Bi_Weekly
    {
        get;
        set;
    }
    public String Work_Payment_Freq_Monthly
    {
        get;
        set;
    }
    public String Work_Payment_Freq_Bi_Monthly
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        job_id = 0;
        address_id = 0;
        company_id = 0;
        job_cat_id = 0;
        job_posted_date = DateTime.Now;
        job_status = " ";
        job_title = " ";
        Work_Classification_Full_time = " ";
        Work_Classification_Part_time = " ";
        Work_Payment_Freq_Weekly = " ";
        Work_Payment_Freq_Bi_Weekly = " ";
        Work_Payment_Freq_Monthly = " ";
        Work_Payment_Freq_Bi_Monthly = " ";
    }
    public job Select(int id)
    {
        job job = new job();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_JOB", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@job_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    job.job_id = rdr.GetInt32(0);
                }
                else
                {
                    job.job_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    job.address_id = rdr.GetInt32(1);
                }
                else
                {
                    job.address_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    job.company_id = rdr.GetInt32(2);
                }
                else
                {
                    job.company_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    job.job_cat_id = rdr.GetInt32(3);
                }
                else
                {
                    job.job_cat_id = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    job.job_posted_date = rdr.GetDateTime(4);
                }
                else
                {
                    job.job_posted_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    job.job_status = rdr.GetString(5);
                }
                else
                {
                    job.job_status = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    job.job_title = rdr.GetString(6);
                }
                else
                {
                    job.job_title = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    job.Work_Classification_Full_time = rdr.GetString(7);
                }
                else
                {
                    job.Work_Classification_Full_time = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    job.Work_Classification_Part_time = rdr.GetString(8);
                }
                else
                {
                    job.Work_Classification_Part_time = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    job.Work_Payment_Freq_Weekly = rdr.GetString(9);
                }
                else
                {
                    job.Work_Payment_Freq_Weekly = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    job.Work_Payment_Freq_Bi_Weekly = rdr.GetString(10);
                }
                else
                {
                    job.Work_Payment_Freq_Bi_Weekly = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    job.Work_Payment_Freq_Monthly = rdr.GetString(11);
                }
                else
                {
                    job.Work_Payment_Freq_Monthly = " ";
                }
                if (!rdr.IsDBNull(12))
                {
                    job.Work_Payment_Freq_Bi_Monthly = rdr.GetString(12);
                }
                else
                {
                    job.Work_Payment_Freq_Bi_Monthly = " ";
                }
                }
                else
                {
                    job.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            job.SetColumnDefaults();
            return job;
            }
        finally
        {
            con.Close();
        }
        return job;
    }

    public job Insert(job id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_JOB", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@company_id", id.company_id);
            cmd.Parameters.AddWithValue("@job_cat_id", id.job_cat_id);
            cmd.Parameters.AddWithValue("@job_posted_date", id.job_posted_date);
            cmd.Parameters.AddWithValue("@job_status", id.job_status);
            cmd.Parameters.AddWithValue("@job_title", id.job_title);
            cmd.Parameters.AddWithValue("@Work_Classification_Full_time", id.Work_Classification_Full_time);
            cmd.Parameters.AddWithValue("@Work_Classification_Part_time", id.Work_Classification_Part_time);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Weekly", id.Work_Payment_Freq_Weekly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Bi_Weekly", id.Work_Payment_Freq_Bi_Weekly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Monthly", id.Work_Payment_Freq_Monthly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Bi_Monthly", id.Work_Payment_Freq_Bi_Monthly);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_JOB", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@company_id", id.company_id);
            cmd.Parameters.AddWithValue("@job_cat_id", id.job_cat_id);
            cmd.Parameters.AddWithValue("@job_posted_date", id.job_posted_date);
            cmd.Parameters.AddWithValue("@job_status", id.job_status);
            cmd.Parameters.AddWithValue("@job_title", id.job_title);
            cmd.Parameters.AddWithValue("@Work_Classification_Full_time", id.Work_Classification_Full_time);
            cmd.Parameters.AddWithValue("@Work_Classification_Part_time", id.Work_Classification_Part_time);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Weekly", id.Work_Payment_Freq_Weekly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Bi_Weekly", id.Work_Payment_Freq_Bi_Weekly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Monthly", id.Work_Payment_Freq_Monthly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Bi_Monthly", id.Work_Payment_Freq_Bi_Monthly);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.job_id = rdr.GetInt32(0);
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
    public Boolean Update(job id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_JOB", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@job_id", id.job_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@company_id", id.company_id);
            cmd.Parameters.AddWithValue("@job_cat_id", id.job_cat_id);
            cmd.Parameters.AddWithValue("@job_posted_date", id.job_posted_date);
            cmd.Parameters.AddWithValue("@job_status", id.job_status);
            cmd.Parameters.AddWithValue("@job_title", id.job_title);
            cmd.Parameters.AddWithValue("@Work_Classification_Full_time", id.Work_Classification_Full_time);
            cmd.Parameters.AddWithValue("@Work_Classification_Part_time", id.Work_Classification_Part_time);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Weekly", id.Work_Payment_Freq_Weekly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Bi_Weekly", id.Work_Payment_Freq_Bi_Weekly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Monthly", id.Work_Payment_Freq_Monthly);
            cmd.Parameters.AddWithValue("@Work_Payment_Freq_Bi_Monthly", id.Work_Payment_Freq_Bi_Monthly);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_JOB", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@job_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_JOB_WC", con);
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




