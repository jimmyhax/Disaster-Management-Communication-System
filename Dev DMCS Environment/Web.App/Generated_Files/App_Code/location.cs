using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class location : System.Web.UI.Page
    {
        public Int32 Location_ID
        {
            get;
            set;
        }
        public String type
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
        public Int32 zip
        {
            get;
            set;
        }
        public String county
        {
            get;
            set;
        }
        public String location_desc
        {
            get;
            set;
        }
        public Decimal n_long
        {
            get;
            set;
        }
        public Decimal s_long
        {
            get;
            set;
        }
        public Decimal e_long
        {
            get;
            set;
        }
        public Decimal w_long
        {
            get;
            set;
        }
        public Decimal n_lat
        {
            get;
            set;
        }
        public Decimal s_lat
        {
            get;
            set;
        }
        public Decimal e_lat
        {
            get;
            set;
        }
        public Decimal w_lat
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Location_ID = 0;
            type = "";
            city = "";
            state = "";
            zip = 0;
            county = "";
            location_desc = "";
            n_long = 0;
            s_long = 0;
            e_long = 0;
            w_long = 0;
            n_lat = 0;
            s_lat = 0;
            e_lat = 0;
            w_lat = 0;
        }
        public location Select(int id)
        {
            location location = new location();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Location_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        location.Location_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        location.Location_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        location.type = rdr.GetString(1);
                    }
                    else
                    {
                        location.type = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        location.city = rdr.GetString(2);
                    }
                    else
                    {
                        location.city = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        location.state = rdr.GetString(3);
                    }
                    else
                    {
                        location.state = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        location.zip = rdr.GetInt32(4);
                    }
                    else
                    {
                        location.zip = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        location.county = rdr.GetString(5);
                    }
                    else
                    {
                        location.county = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        location.location_desc = rdr.GetString(6);
                    }
                    else
                    {
                        location.location_desc = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        location.n_long = rdr.GetDecimal(7);
                    }
                    else
                    {
                        location.n_long = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        location.s_long = rdr.GetDecimal(8);
                    }
                    else
                    {
                        location.s_long = 0;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        location.e_long = rdr.GetDecimal(9);
                    }
                    else
                    {
                        location.e_long = 0;
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        location.w_long = rdr.GetDecimal(10);
                    }
                    else
                    {
                        location.w_long = 0;
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        location.n_lat = rdr.GetDecimal(11);
                    }
                    else
                    {
                        location.n_lat = 0;
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        location.s_lat = rdr.GetDecimal(12);
                    }
                    else
                    {
                        location.s_lat = 0;
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        location.e_lat = rdr.GetDecimal(13);
                    }
                    else
                    {
                        location.e_lat = 0;
                    }
                    if (!rdr.IsDBNull(14))
                    {
                        location.w_lat = rdr.GetDecimal(14);
                    }
                    else
                    {
                        location.w_lat = 0;
                    }
                    }
                    else
                    {
                    location.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                location.SetColumnDefaults();
                return location;
                }
            finally
            {
                con.Close();
            }
            return location;
        }

        public location Insert(location id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", id.type);
                cmd.Parameters.AddWithValue("@city", id.city);
                cmd.Parameters.AddWithValue("@state", id.state);
                cmd.Parameters.AddWithValue("@zip", id.zip);
                cmd.Parameters.AddWithValue("@county", id.county);
                cmd.Parameters.AddWithValue("@location_desc", id.location_desc);
                cmd.Parameters.AddWithValue("@n_long", id.n_long);
                cmd.Parameters.AddWithValue("@s_long", id.s_long);
                cmd.Parameters.AddWithValue("@e_long", id.e_long);
                cmd.Parameters.AddWithValue("@w_long", id.w_long);
                cmd.Parameters.AddWithValue("@n_lat", id.n_lat);
                cmd.Parameters.AddWithValue("@s_lat", id.s_lat);
                cmd.Parameters.AddWithValue("@e_lat", id.e_lat);
                cmd.Parameters.AddWithValue("@w_lat", id.w_lat);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", id.type);
                cmd.Parameters.AddWithValue("@city", id.city);
                cmd.Parameters.AddWithValue("@state", id.state);
                cmd.Parameters.AddWithValue("@zip", id.zip);
                cmd.Parameters.AddWithValue("@county", id.county);
                cmd.Parameters.AddWithValue("@location_desc", id.location_desc);
                cmd.Parameters.AddWithValue("@n_long", id.n_long);
                cmd.Parameters.AddWithValue("@s_long", id.s_long);
                cmd.Parameters.AddWithValue("@e_long", id.e_long);
                cmd.Parameters.AddWithValue("@w_long", id.w_long);
                cmd.Parameters.AddWithValue("@n_lat", id.n_lat);
                cmd.Parameters.AddWithValue("@s_lat", id.s_lat);
                cmd.Parameters.AddWithValue("@e_lat", id.e_lat);
                cmd.Parameters.AddWithValue("@w_lat", id.w_lat);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Location_ID = rdr.GetInt32(0);
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
        public Boolean Update(location id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@type", id.type);
                cmd.Parameters.AddWithValue("@city", id.city);
                cmd.Parameters.AddWithValue("@state", id.state);
                cmd.Parameters.AddWithValue("@zip", id.zip);
                cmd.Parameters.AddWithValue("@county", id.county);
                cmd.Parameters.AddWithValue("@location_desc", id.location_desc);
                cmd.Parameters.AddWithValue("@n_long", id.n_long);
                cmd.Parameters.AddWithValue("@s_long", id.s_long);
                cmd.Parameters.AddWithValue("@e_long", id.e_long);
                cmd.Parameters.AddWithValue("@w_long", id.w_long);
                cmd.Parameters.AddWithValue("@n_lat", id.n_lat);
                cmd.Parameters.AddWithValue("@s_lat", id.s_lat);
                cmd.Parameters.AddWithValue("@e_lat", id.e_lat);
                cmd.Parameters.AddWithValue("@w_lat", id.w_lat);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Location_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LOCATION_WC", con);
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




