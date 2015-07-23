using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
namespace Web.App
{
    public class address
    {
        public Int32 address_id
        {
            get;
            set;
        }
        public Int32 address_type_id
        {
            get;
            set;
        }
        public String city
        {
            get;
            set;
        }
        public String country
        {
            get;
            set;
        }
        public String County_Township
        {
            get;
            set;
        }
        public Decimal longitude
        {
            get;
            set;
        }
        public Decimal latitude
        {
            get;
            set;
        }
        public String state
        {
            get;
            set;
        }
        public String str_add
        {
            get;
            set;
        }
        public String str_add2
        {
            get;
            set;
        }
        public String zip_plus_four
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            address_id = 0;
            address_type_id = 0;
            city = "";
            country = "";
            County_Township = "";
            longitude = 0;
            latitude = 0;
            state = "";
            str_add = "";
            str_add2 = "";
            zip_plus_four = "";
        }
        public address Select(int id)
        {
            address address = new address();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ADDRESS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        address.address_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        address.address_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        address.address_type_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        address.address_type_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        address.city = rdr.GetString(2);
                    }
                    else
                    {
                        address.city = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        address.country = rdr.GetString(3);
                    }
                    else
                    {
                        address.country = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        address.County_Township = rdr.GetString(4);
                    }
                    else
                    {
                        address.County_Township = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        address.longitude = rdr.GetDecimal(5);
                    }
                    else
                    {
                        address.longitude = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        address.latitude = rdr.GetDecimal(6);
                    }
                    else
                    {
                        address.latitude = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        address.state = rdr.GetString(7);
                    }
                    else
                    {
                        address.state = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        address.str_add = rdr.GetString(8);
                    }
                    else
                    {
                        address.str_add = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        address.str_add2 = rdr.GetString(9);
                    }
                    else
                    {
                        address.str_add2 = " ";
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        address.zip_plus_four = rdr.GetString(10);
                    }
                    else
                    {
                        address.zip_plus_four = " ";
                    }
                    }
                    else
                    {
                    address.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                address.SetColumnDefaults();
                return address;
                }
            finally
            {
                con.Close();
            }
            return address;
        }

        public address Insert(address id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ADDRESS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_type_id", id.address_type_id);
                cmd.Parameters.AddWithValue("@city", id.city);
                cmd.Parameters.AddWithValue("@country", id.country);
                cmd.Parameters.AddWithValue("@County_Township", id.County_Township);
                cmd.Parameters.AddWithValue("@longitude", id.longitude);
                cmd.Parameters.AddWithValue("@latitude", id.latitude);
                cmd.Parameters.AddWithValue("@state", id.state);
                cmd.Parameters.AddWithValue("@str_add", id.str_add);
                cmd.Parameters.AddWithValue("@str_add2", id.str_add2);
                cmd.Parameters.AddWithValue("@zip_plus_four", id.zip_plus_four);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ADDRESS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_type_id", id.address_type_id);
                cmd.Parameters.AddWithValue("@city", id.city);
                cmd.Parameters.AddWithValue("@country", id.country);
                cmd.Parameters.AddWithValue("@County_Township", id.County_Township);
                cmd.Parameters.AddWithValue("@longitude", id.longitude);
                cmd.Parameters.AddWithValue("@latitude", id.latitude);
                cmd.Parameters.AddWithValue("@state", id.state);
                cmd.Parameters.AddWithValue("@str_add", id.str_add);
                cmd.Parameters.AddWithValue("@str_add2", id.str_add2);
                cmd.Parameters.AddWithValue("@zip_plus_four", id.zip_plus_four);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.address_id = rdr.GetInt32(0);
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
        public Boolean Update(address id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ADDRESS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@address_type_id", id.address_type_id);
                cmd.Parameters.AddWithValue("@city", id.city);
                cmd.Parameters.AddWithValue("@country", id.country);
                cmd.Parameters.AddWithValue("@County_Township", id.County_Township);
                cmd.Parameters.AddWithValue("@longitude", id.longitude);
                cmd.Parameters.AddWithValue("@latitude", id.latitude);
                cmd.Parameters.AddWithValue("@state", id.state);
                cmd.Parameters.AddWithValue("@str_add", id.str_add);
                cmd.Parameters.AddWithValue("@str_add2", id.str_add2);
                cmd.Parameters.AddWithValue("@zip_plus_four", id.zip_plus_four);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ADDRESS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ADDRESS_WC", con);
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




