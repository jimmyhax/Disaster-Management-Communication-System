using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class missing_client_location : System.Web.UI.Page
    {
        public Int32 missing_client_location_id
        {
            get;
            set;
        }
        public Int32 missing_client_id
        {
            get;
            set;
        }
        public Int32 reporting_client_id
        {
            get;
            set;
        }
        public Int32 location_id
        {
            get;
            set;
        }
        public DateTime datetime_reported
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            missing_client_location_id = 0;
            missing_client_id = 0;
            reporting_client_id = 0;
            location_id = 0;
            datetime_reported = DateTime.Now;
        }
        public missing_client_location Select(int id)
        {
            missing_client_location missing_client_location = new missing_client_location();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MISSING_CLIENT_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@missing_client_location_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        missing_client_location.missing_client_location_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        missing_client_location.missing_client_location_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        missing_client_location.missing_client_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        missing_client_location.missing_client_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        missing_client_location.reporting_client_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        missing_client_location.reporting_client_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        missing_client_location.location_id = rdr.GetInt32(3);
                    }
                    else
                    {
                        missing_client_location.location_id = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        missing_client_location.datetime_reported = rdr.GetDateTime(4);
                    }
                    else
                    {
                        missing_client_location.datetime_reported = DateTime.Now;
                    }
                    }
                    else
                    {
                    missing_client_location.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                missing_client_location.SetColumnDefaults();
                return missing_client_location;
                }
            finally
            {
                con.Close();
            }
            return missing_client_location;
        }

        public missing_client_location Insert(missing_client_location id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MISSING_CLIENT_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@missing_client_id", id.missing_client_id);
                cmd.Parameters.AddWithValue("@reporting_client_id", id.reporting_client_id);
                cmd.Parameters.AddWithValue("@location_id", id.location_id);
                cmd.Parameters.AddWithValue("@datetime_reported", id.datetime_reported);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MISSING_CLIENT_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@missing_client_id", id.missing_client_id);
                cmd.Parameters.AddWithValue("@reporting_client_id", id.reporting_client_id);
                cmd.Parameters.AddWithValue("@location_id", id.location_id);
                cmd.Parameters.AddWithValue("@datetime_reported", id.datetime_reported);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.missing_client_location_id = rdr.GetInt32(0);
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
        public Boolean Update(missing_client_location id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MISSING_CLIENT_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@missing_client_location_id", id.missing_client_location_id);
                cmd.Parameters.AddWithValue("@missing_client_id", id.missing_client_id);
                cmd.Parameters.AddWithValue("@reporting_client_id", id.reporting_client_id);
                cmd.Parameters.AddWithValue("@location_id", id.location_id);
                cmd.Parameters.AddWithValue("@datetime_reported", id.datetime_reported);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MISSING_CLIENT_LOCATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@missing_client_location_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MISSING_CLIENT_LOCATION_WC", con);
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




