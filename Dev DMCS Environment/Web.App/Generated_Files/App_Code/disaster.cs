using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class disaster : System.Web.UI.Page
    {
        public Int32 disaster_id
        {
            get;
            set;
        }
        public String disaster_name
        {
            get;
            set;
        }
        public String disaster_type
        {
            get;
            set;
        }
        public DateTime disaster_start_date
        {
            get;
            set;
        }
        public DateTime disaster_end_date
        {
            get;
            set;
        }
        public Decimal disaster_north_latitude
        {
            get;
            set;
        }
        public Decimal disaster_north_longitude
        {
            get;
            set;
        }
        public Decimal disaster_south_latitude
        {
            get;
            set;
        }
        public Decimal disaster_south_longitude
        {
            get;
            set;
        }
        public Decimal disaster_east_latitude
        {
            get;
            set;
        }
        public Decimal disaster_east_longitude
        {
            get;
            set;
        }
        public Decimal disaster_west_latitude
        {
            get;
            set;
        }
        public Decimal disaster_west_longitude
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            disaster_id = 0;
            disaster_name = "";
            disaster_type = "";
            disaster_start_date = DateTime.Now;
            disaster_end_date = DateTime.Now;
            disaster_north_latitude = 0;
            disaster_north_longitude = 0;
            disaster_south_latitude = 0;
            disaster_south_longitude = 0;
            disaster_east_latitude = 0;
            disaster_east_longitude = 0;
            disaster_west_latitude = 0;
            disaster_west_longitude = 0;
        }
        public disaster Select(int id)
        {
            disaster disaster = new disaster();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        disaster.disaster_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        disaster.disaster_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        disaster.disaster_name = rdr.GetString(1);
                    }
                    else
                    {
                        disaster.disaster_name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        disaster.disaster_type = rdr.GetString(2);
                    }
                    else
                    {
                        disaster.disaster_type = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        disaster.disaster_start_date = rdr.GetDateTime(3);
                    }
                    else
                    {
                        disaster.disaster_start_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        disaster.disaster_end_date = rdr.GetDateTime(4);
                    }
                    else
                    {
                        disaster.disaster_end_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        disaster.disaster_north_latitude = rdr.GetDecimal(5);
                    }
                    else
                    {
                        disaster.disaster_north_latitude = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        disaster.disaster_north_longitude = rdr.GetDecimal(6);
                    }
                    else
                    {
                        disaster.disaster_north_longitude = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        disaster.disaster_south_latitude = rdr.GetDecimal(7);
                    }
                    else
                    {
                        disaster.disaster_south_latitude = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        disaster.disaster_south_longitude = rdr.GetDecimal(8);
                    }
                    else
                    {
                        disaster.disaster_south_longitude = 0;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        disaster.disaster_east_latitude = rdr.GetDecimal(9);
                    }
                    else
                    {
                        disaster.disaster_east_latitude = 0;
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        disaster.disaster_east_longitude = rdr.GetDecimal(10);
                    }
                    else
                    {
                        disaster.disaster_east_longitude = 0;
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        disaster.disaster_west_latitude = rdr.GetDecimal(11);
                    }
                    else
                    {
                        disaster.disaster_west_latitude = 0;
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        disaster.disaster_west_longitude = rdr.GetDecimal(12);
                    }
                    else
                    {
                        disaster.disaster_west_longitude = 0;
                    }
                    }
                    else
                    {
                    disaster.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                disaster.SetColumnDefaults();
                return disaster;
                }
            finally
            {
                con.Close();
            }
            return disaster;
        }

        public disaster Insert(disaster id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DISASTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_name", id.disaster_name);
                cmd.Parameters.AddWithValue("@disaster_type", id.disaster_type);
                cmd.Parameters.AddWithValue("@disaster_start_date", id.disaster_start_date);
                cmd.Parameters.AddWithValue("@disaster_end_date", id.disaster_end_date);
                cmd.Parameters.AddWithValue("@disaster_north_latitude", id.disaster_north_latitude);
                cmd.Parameters.AddWithValue("@disaster_north_longitude", id.disaster_north_longitude);
                cmd.Parameters.AddWithValue("@disaster_south_latitude", id.disaster_south_latitude);
                cmd.Parameters.AddWithValue("@disaster_south_longitude", id.disaster_south_longitude);
                cmd.Parameters.AddWithValue("@disaster_east_latitude", id.disaster_east_latitude);
                cmd.Parameters.AddWithValue("@disaster_east_longitude", id.disaster_east_longitude);
                cmd.Parameters.AddWithValue("@disaster_west_latitude", id.disaster_west_latitude);
                cmd.Parameters.AddWithValue("@disaster_west_longitude", id.disaster_west_longitude);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_DISASTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_name", id.disaster_name);
                cmd.Parameters.AddWithValue("@disaster_type", id.disaster_type);
                cmd.Parameters.AddWithValue("@disaster_start_date", id.disaster_start_date);
                cmd.Parameters.AddWithValue("@disaster_end_date", id.disaster_end_date);
                cmd.Parameters.AddWithValue("@disaster_north_latitude", id.disaster_north_latitude);
                cmd.Parameters.AddWithValue("@disaster_north_longitude", id.disaster_north_longitude);
                cmd.Parameters.AddWithValue("@disaster_south_latitude", id.disaster_south_latitude);
                cmd.Parameters.AddWithValue("@disaster_south_longitude", id.disaster_south_longitude);
                cmd.Parameters.AddWithValue("@disaster_east_latitude", id.disaster_east_latitude);
                cmd.Parameters.AddWithValue("@disaster_east_longitude", id.disaster_east_longitude);
                cmd.Parameters.AddWithValue("@disaster_west_latitude", id.disaster_west_latitude);
                cmd.Parameters.AddWithValue("@disaster_west_longitude", id.disaster_west_longitude);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.disaster_id = rdr.GetInt32(0);
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
        public Boolean Update(disaster id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DISASTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
                cmd.Parameters.AddWithValue("@disaster_name", id.disaster_name);
                cmd.Parameters.AddWithValue("@disaster_type", id.disaster_type);
                cmd.Parameters.AddWithValue("@disaster_start_date", id.disaster_start_date);
                cmd.Parameters.AddWithValue("@disaster_end_date", id.disaster_end_date);
                cmd.Parameters.AddWithValue("@disaster_north_latitude", id.disaster_north_latitude);
                cmd.Parameters.AddWithValue("@disaster_north_longitude", id.disaster_north_longitude);
                cmd.Parameters.AddWithValue("@disaster_south_latitude", id.disaster_south_latitude);
                cmd.Parameters.AddWithValue("@disaster_south_longitude", id.disaster_south_longitude);
                cmd.Parameters.AddWithValue("@disaster_east_latitude", id.disaster_east_latitude);
                cmd.Parameters.AddWithValue("@disaster_east_longitude", id.disaster_east_longitude);
                cmd.Parameters.AddWithValue("@disaster_west_latitude", id.disaster_west_latitude);
                cmd.Parameters.AddWithValue("@disaster_west_longitude", id.disaster_west_longitude);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DISASTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_WC", con);
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




