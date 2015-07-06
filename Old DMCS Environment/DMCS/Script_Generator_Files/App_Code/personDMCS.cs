using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class personDMCS
{
    public Int32 Person_ID
    {
        get;
        set;
    }
    public Int32 Resource_ID
    {
        get;
        set;
    }
    public String f_name
    {
        get;
        set;
    }
    public String l_name
    {
        get;
        set;
    }
    public String address
    {
        get;
        set;
    }
    public String city
    {
        get;
        set;
    }
    public String state
    {
        get;
        set;
    }
    public Int32 zipcode
    {
        get;
        set;
    }
    public String phone_primary
    {
        get;
        set;
    }
    public String email
    {
        get;
        set;
    }
    public String creditcard
    {
        get;
        set;
    }
    public DateTime availability_date
    {
        get;
        set;
    }
    public Int32 availability_hours
    {
        get;
        set;
    }
    public DateTime birthdate
    {
        get;
        set;
    }
    public String marital_status
    {
        get;
        set;
    }
    public String gender
    {
        get;
        set;
    }
    public String jobtitle
    {
        get;
        set;
    }
    public DateTime workdate
    {
        get;
        set;
    }
    public Decimal regpay
    {
        get;
        set;
    }
    public Int32 OT
    {
        get;
        set;
    }
    public Decimal OT_rate
    {
        get;
        set;
    }
    public Decimal hourly_rate
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Person_ID = 0;
        Resource_ID = 0;
        f_name = " ";
        l_name = " ";
        address = " ";
        city = " ";
        state = " ";
        zipcode = 0;
        phone_primary = " ";
        email = " ";
        creditcard = " ";
        availability_date = DateTime.Now;
        availability_hours = 0;
        birthdate = DateTime.Now;
        marital_status = " ";
        gender = " ";
        jobtitle = " ";
        workdate = DateTime.Now;
        regpay = 0;
        OT = 0;
        OT_rate = 0;
        hourly_rate = 0;
    }
    public personDMCS Select(int id)
    {
        personDMCS personDMCS = new personDMCS();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PERSONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Person_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    personDMCS.Person_ID = rdr.GetInt32(0);
                }
                else
                {
                    personDMCS.Person_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    personDMCS.Resource_ID = rdr.GetInt32(1);
                }
                else
                {
                    personDMCS.Resource_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    personDMCS.f_name = rdr.GetString(2);
                }
                else
                {
                    personDMCS.f_name = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    personDMCS.l_name = rdr.GetString(3);
                }
                else
                {
                    personDMCS.l_name = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    personDMCS.address = rdr.GetString(4);
                }
                else
                {
                    personDMCS.address = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    personDMCS.city = rdr.GetString(5);
                }
                else
                {
                    personDMCS.city = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    personDMCS.state = rdr.GetString(6);
                }
                else
                {
                    personDMCS.state = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    personDMCS.zipcode = rdr.GetInt32(7);
                }
                else
                {
                    personDMCS.zipcode = 0;
                }
                if (!rdr.IsDBNull(8))
                {
                    personDMCS.phone_primary = rdr.GetString(8);
                }
                else
                {
                    personDMCS.phone_primary = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    personDMCS.email = rdr.GetString(9);
                }
                else
                {
                    personDMCS.email = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    personDMCS.creditcard = rdr.GetString(10);
                }
                else
                {
                    personDMCS.creditcard = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    personDMCS.availability_date = rdr.GetDateTime(11);
                }
                else
                {
                    personDMCS.availability_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(12))
                {
                    personDMCS.availability_hours = rdr.GetInt32(12);
                }
                else
                {
                    personDMCS.availability_hours = 0;
                }
                if (!rdr.IsDBNull(13))
                {
                    personDMCS.birthdate = rdr.GetDateTime(13);
                }
                else
                {
                    personDMCS.birthdate = DateTime.Now;
                }
                if (!rdr.IsDBNull(14))
                {
                    personDMCS.marital_status = rdr.GetString(14);
                }
                else
                {
                    personDMCS.marital_status = " ";
                }
                if (!rdr.IsDBNull(15))
                {
                    personDMCS.gender = rdr.GetString(15);
                }
                else
                {
                    personDMCS.gender = " ";
                }
                if (!rdr.IsDBNull(16))
                {
                    personDMCS.jobtitle = rdr.GetString(16);
                }
                else
                {
                    personDMCS.jobtitle = " ";
                }
                if (!rdr.IsDBNull(17))
                {
                    personDMCS.workdate = rdr.GetDateTime(17);
                }
                else
                {
                    personDMCS.workdate = DateTime.Now;
                }
                if (!rdr.IsDBNull(18))
                {
                    personDMCS.regpay = rdr.GetDecimal(18);
                }
                else
                {
                    personDMCS.regpay = 0;
                }
                if (!rdr.IsDBNull(19))
                {
                    personDMCS.OT = rdr.GetInt32(19);
                }
                else
                {
                    personDMCS.OT = 0;
                }
                if (!rdr.IsDBNull(20))
                {
                    personDMCS.OT_rate = rdr.GetDecimal(20);
                }
                else
                {
                    personDMCS.OT_rate = 0;
                }
                if (!rdr.IsDBNull(21))
                {
                    personDMCS.hourly_rate = rdr.GetDecimal(21);
                }
                else
                {
                    personDMCS.hourly_rate = 0;
                }
                }
                else
                {
                    personDMCS.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            personDMCS.SetColumnDefaults();
            return personDMCS;
            }
        finally
        {
            con.Close();
        }
        return personDMCS;
    }

    public personDMCS Insert(personDMCS id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PERSONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@f_name", id.f_name);
            cmd.Parameters.AddWithValue("@l_name", id.l_name);
            cmd.Parameters.AddWithValue("@address", id.address);
            cmd.Parameters.AddWithValue("@city", id.city);
            cmd.Parameters.AddWithValue("@state", id.state);
            cmd.Parameters.AddWithValue("@zipcode", id.zipcode);
            cmd.Parameters.AddWithValue("@phone_primary", id.phone_primary);
            cmd.Parameters.AddWithValue("@email", id.email);
            cmd.Parameters.AddWithValue("@creditcard", id.creditcard);
            cmd.Parameters.AddWithValue("@availability_date", id.availability_date);
            cmd.Parameters.AddWithValue("@availability_hours", id.availability_hours);
            cmd.Parameters.AddWithValue("@birthdate", id.birthdate);
            cmd.Parameters.AddWithValue("@marital_status", id.marital_status);
            cmd.Parameters.AddWithValue("@gender", id.gender);
            cmd.Parameters.AddWithValue("@jobtitle", id.jobtitle);
            cmd.Parameters.AddWithValue("@workdate", id.workdate);
            cmd.Parameters.AddWithValue("@regpay", id.regpay);
            cmd.Parameters.AddWithValue("@OT", id.OT);
            cmd.Parameters.AddWithValue("@OT_rate", id.OT_rate);
            cmd.Parameters.AddWithValue("@hourly_rate", id.hourly_rate);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_PERSONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@f_name", id.f_name);
            cmd.Parameters.AddWithValue("@l_name", id.l_name);
            cmd.Parameters.AddWithValue("@address", id.address);
            cmd.Parameters.AddWithValue("@city", id.city);
            cmd.Parameters.AddWithValue("@state", id.state);
            cmd.Parameters.AddWithValue("@zipcode", id.zipcode);
            cmd.Parameters.AddWithValue("@phone_primary", id.phone_primary);
            cmd.Parameters.AddWithValue("@email", id.email);
            cmd.Parameters.AddWithValue("@creditcard", id.creditcard);
            cmd.Parameters.AddWithValue("@availability_date", id.availability_date);
            cmd.Parameters.AddWithValue("@availability_hours", id.availability_hours);
            cmd.Parameters.AddWithValue("@birthdate", id.birthdate);
            cmd.Parameters.AddWithValue("@marital_status", id.marital_status);
            cmd.Parameters.AddWithValue("@gender", id.gender);
            cmd.Parameters.AddWithValue("@jobtitle", id.jobtitle);
            cmd.Parameters.AddWithValue("@workdate", id.workdate);
            cmd.Parameters.AddWithValue("@regpay", id.regpay);
            cmd.Parameters.AddWithValue("@OT", id.OT);
            cmd.Parameters.AddWithValue("@OT_rate", id.OT_rate);
            cmd.Parameters.AddWithValue("@hourly_rate", id.hourly_rate);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Person_ID = rdr.GetInt32(0);
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
    public Boolean Update(personDMCS id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PERSONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Person_ID", id.Person_ID);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@f_name", id.f_name);
            cmd.Parameters.AddWithValue("@l_name", id.l_name);
            cmd.Parameters.AddWithValue("@address", id.address);
            cmd.Parameters.AddWithValue("@city", id.city);
            cmd.Parameters.AddWithValue("@state", id.state);
            cmd.Parameters.AddWithValue("@zipcode", id.zipcode);
            cmd.Parameters.AddWithValue("@phone_primary", id.phone_primary);
            cmd.Parameters.AddWithValue("@email", id.email);
            cmd.Parameters.AddWithValue("@creditcard", id.creditcard);
            cmd.Parameters.AddWithValue("@availability_date", id.availability_date);
            cmd.Parameters.AddWithValue("@availability_hours", id.availability_hours);
            cmd.Parameters.AddWithValue("@birthdate", id.birthdate);
            cmd.Parameters.AddWithValue("@marital_status", id.marital_status);
            cmd.Parameters.AddWithValue("@gender", id.gender);
            cmd.Parameters.AddWithValue("@jobtitle", id.jobtitle);
            cmd.Parameters.AddWithValue("@workdate", id.workdate);
            cmd.Parameters.AddWithValue("@regpay", id.regpay);
            cmd.Parameters.AddWithValue("@OT", id.OT);
            cmd.Parameters.AddWithValue("@OT_rate", id.OT_rate);
            cmd.Parameters.AddWithValue("@hourly_rate", id.hourly_rate);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PERSONDMCS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Person_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PERSONDMCS_WC", con);
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




