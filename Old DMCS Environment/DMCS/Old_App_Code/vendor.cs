using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class vendor
{
    public Int32 vendor_id
    {
        get;
        set;
    }
    public String vendor_name
    {
        get;
        set;
    }
    public String phone_num
    {
        get;
        set;
    }
    public String email
    {
        get;
        set;
    }
    public Int32 address_id
    {
        get;
        set;
    }
    public Int32 Vendor_address2
    {
        get;
        set;
    }
    public String vendor_job_assign
    {
        get;
        set;
    }
    public DateTime vendor_start_date
    {
        get;
        set;
    }
    public DateTime vendor_end_date
    {
        get;
        set;
    }
    public String vendor_meth_of_contact
    {
        get;
        set;
    }
    public String vendor_status
    {
        get;
        set;
    }
    public String vendor_meth_of_pay
    {
        get;
        set;
    }
    public String vendor_type
    {
        get;
        set;
    }
    public String vendor_comments
    {
        get;
        set;
    }
    public String primary_fName
    {
        get;
        set;
    }
    public String primary_lName
    {
        get;
        set;
    }
    public String primary_phone
    {
        get;
        set;
    }
    public String sec_fName
    {
        get;
        set;
    }
    public String sec_lName
    {
        get;
        set;
    }
    public String sec_phone
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        vendor_id = 0;
        vendor_name = " ";
        phone_num = " ";
        email = " ";
        address_id = 0;
        Vendor_address2 = 0;
        vendor_job_assign = " ";
        vendor_start_date = DateTime.Now;
        vendor_end_date = DateTime.Now;
        vendor_meth_of_contact = " ";
        vendor_status = " ";
        vendor_meth_of_pay = " ";
        vendor_type = " ";
        vendor_comments = " ";
        primary_fName = " ";
        primary_lName = " ";
        primary_phone = " ";
        sec_fName = " ";
        sec_lName = " ";
        sec_phone = " ";
    }
    public vendor Select(int id)
    {
        vendor vendor = new vendor();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VENDOR", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    vendor.vendor_id = rdr.GetInt32(0);
                }
                else
                {
                    vendor.vendor_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    vendor.vendor_name = rdr.GetString(1);
                }
                else
                {
                    vendor.vendor_name = " ";
                }
                if (!rdr.IsDBNull(2))
                {
                    vendor.phone_num = rdr.GetString(2);
                }
                else
                {
                    vendor.phone_num = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    vendor.email = rdr.GetString(3);
                }
                else
                {
                    vendor.email = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    vendor.address_id = rdr.GetInt32(4);
                }
                else
                {
                    vendor.address_id = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    vendor.Vendor_address2 = rdr.GetInt32(5);
                }
                else
                {
                    vendor.Vendor_address2 = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    vendor.vendor_job_assign = rdr.GetString(6);
                }
                else
                {
                    vendor.vendor_job_assign = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    vendor.vendor_start_date = rdr.GetDateTime(7);
                }
                else
                {
                    vendor.vendor_start_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(8))
                {
                    vendor.vendor_end_date = rdr.GetDateTime(8);
                }
                else
                {
                    vendor.vendor_end_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(9))
                {
                    vendor.vendor_meth_of_contact = rdr.GetString(9);
                }
                else
                {
                    vendor.vendor_meth_of_contact = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    vendor.vendor_status = rdr.GetString(10);
                }
                else
                {
                    vendor.vendor_status = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    vendor.vendor_meth_of_pay = rdr.GetString(11);
                }
                else
                {
                    vendor.vendor_meth_of_pay = " ";
                }
                if (!rdr.IsDBNull(12))
                {
                    vendor.vendor_type = rdr.GetString(12);
                }
                else
                {
                    vendor.vendor_type = " ";
                }
                if (!rdr.IsDBNull(13))
                {
                    vendor.vendor_comments = rdr.GetString(13);
                }
                else
                {
                    vendor.vendor_comments = " ";
                }
                if (!rdr.IsDBNull(14))
                {
                    vendor.primary_fName = rdr.GetString(14);
                }
                else
                {
                    vendor.primary_fName = " ";
                }
                if (!rdr.IsDBNull(15))
                {
                    vendor.primary_lName = rdr.GetString(15);
                }
                else
                {
                    vendor.primary_lName = " ";
                }
                if (!rdr.IsDBNull(16))
                {
                    vendor.primary_phone = rdr.GetString(16);
                }
                else
                {
                    vendor.primary_phone = " ";
                }
                if (!rdr.IsDBNull(17))
                {
                    vendor.sec_fName = rdr.GetString(17);
                }
                else
                {
                    vendor.sec_fName = " ";
                }
                if (!rdr.IsDBNull(18))
                {
                    vendor.sec_lName = rdr.GetString(18);
                }
                else
                {
                    vendor.sec_lName = " ";
                }
                if (!rdr.IsDBNull(19))
                {
                    vendor.sec_phone = rdr.GetString(19);
                }
                else
                {
                    vendor.sec_phone = " ";
                }
                }
                else
                {
                    vendor.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            vendor.SetColumnDefaults();
            return vendor;
            }
        finally
        {
            con.Close();
        }
        return vendor;
    }

    public vendor Insert(vendor id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_VENDOR", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_name", id.vendor_name);
            cmd.Parameters.AddWithValue("@phone_num", id.phone_num);
            cmd.Parameters.AddWithValue("@email", id.email);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@Vendor_address2", id.Vendor_address2);
            cmd.Parameters.AddWithValue("@vendor_job_assign", id.vendor_job_assign);
            cmd.Parameters.AddWithValue("@vendor_start_date", id.vendor_start_date);
            cmd.Parameters.AddWithValue("@vendor_end_date", id.vendor_end_date);
            cmd.Parameters.AddWithValue("@vendor_meth_of_contact", id.vendor_meth_of_contact);
            cmd.Parameters.AddWithValue("@vendor_status", id.vendor_status);
            cmd.Parameters.AddWithValue("@vendor_meth_of_pay", id.vendor_meth_of_pay);
            cmd.Parameters.AddWithValue("@vendor_type", id.vendor_type);
            cmd.Parameters.AddWithValue("@vendor_comments", id.vendor_comments);
            cmd.Parameters.AddWithValue("@primary_fName", id.primary_fName);
            cmd.Parameters.AddWithValue("@primary_lName", id.primary_lName);
            cmd.Parameters.AddWithValue("@primary_phone", id.primary_phone);
            cmd.Parameters.AddWithValue("@sec_fName", id.sec_fName);
            cmd.Parameters.AddWithValue("@sec_lName", id.sec_lName);
            cmd.Parameters.AddWithValue("@sec_phone", id.sec_phone);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_VENDOR", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_name", id.vendor_name);
            cmd.Parameters.AddWithValue("@phone_num", id.phone_num);
            cmd.Parameters.AddWithValue("@email", id.email);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@Vendor_address2", id.Vendor_address2);
            cmd.Parameters.AddWithValue("@vendor_job_assign", id.vendor_job_assign);
            cmd.Parameters.AddWithValue("@vendor_start_date", id.vendor_start_date);
            cmd.Parameters.AddWithValue("@vendor_end_date", id.vendor_end_date);
            cmd.Parameters.AddWithValue("@vendor_meth_of_contact", id.vendor_meth_of_contact);
            cmd.Parameters.AddWithValue("@vendor_status", id.vendor_status);
            cmd.Parameters.AddWithValue("@vendor_meth_of_pay", id.vendor_meth_of_pay);
            cmd.Parameters.AddWithValue("@vendor_type", id.vendor_type);
            cmd.Parameters.AddWithValue("@vendor_comments", id.vendor_comments);
            cmd.Parameters.AddWithValue("@primary_fName", id.primary_fName);
            cmd.Parameters.AddWithValue("@primary_lName", id.primary_lName);
            cmd.Parameters.AddWithValue("@primary_phone", id.primary_phone);
            cmd.Parameters.AddWithValue("@sec_fName", id.sec_fName);
            cmd.Parameters.AddWithValue("@sec_lName", id.sec_lName);
            cmd.Parameters.AddWithValue("@sec_phone", id.sec_phone);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.vendor_id = rdr.GetInt32(0);
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
    public Boolean Update(vendor id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_VENDOR", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_id", id.vendor_id);
            cmd.Parameters.AddWithValue("@vendor_name", id.vendor_name);
            cmd.Parameters.AddWithValue("@phone_num", id.phone_num);
            cmd.Parameters.AddWithValue("@email", id.email);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@Vendor_address2", id.Vendor_address2);
            cmd.Parameters.AddWithValue("@vendor_job_assign", id.vendor_job_assign);
            cmd.Parameters.AddWithValue("@vendor_start_date", id.vendor_start_date);
            cmd.Parameters.AddWithValue("@vendor_end_date", id.vendor_end_date);
            cmd.Parameters.AddWithValue("@vendor_meth_of_contact", id.vendor_meth_of_contact);
            cmd.Parameters.AddWithValue("@vendor_status", id.vendor_status);
            cmd.Parameters.AddWithValue("@vendor_meth_of_pay", id.vendor_meth_of_pay);
            cmd.Parameters.AddWithValue("@vendor_type", id.vendor_type);
            cmd.Parameters.AddWithValue("@vendor_comments", id.vendor_comments);
            cmd.Parameters.AddWithValue("@primary_fName", id.primary_fName);
            cmd.Parameters.AddWithValue("@primary_lName", id.primary_lName);
            cmd.Parameters.AddWithValue("@primary_phone", id.primary_phone);
            cmd.Parameters.AddWithValue("@sec_fName", id.sec_fName);
            cmd.Parameters.AddWithValue("@sec_lName", id.sec_lName);
            cmd.Parameters.AddWithValue("@sec_phone", id.sec_phone);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_VENDOR", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VENDOR_WC", con);
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




