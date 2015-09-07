using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class resource : System.Web.UI.Page
    {
        public Int32 Resource_ID
        {
            get;
            set;
        }
        public Int32 Location_ID
        {
            get;
            set;
        }
        public String Resource_Type
        {
            get;
            set;
        }
        public DateTime Date_Requested
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Resource_ID = 0;
            Location_ID = 0;
            Resource_Type = "";
            Date_Requested = DateTime.Now;
        }
        public resource Select(int id)
        {
            resource resource = new resource();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RESOURCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Resource_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        resource.Resource_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        resource.Resource_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        resource.Location_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        resource.Location_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        resource.Resource_Type = rdr.GetString(2);
                    }
                    else
                    {
                        resource.Resource_Type = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        resource.Date_Requested = rdr.GetDateTime(3);
                    }
                    else
                    {
                        resource.Date_Requested = DateTime.Now;
                    }
                    }
                    else
                    {
                    resource.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                resource.SetColumnDefaults();
                return resource;
                }
            finally
            {
                con.Close();
            }
            return resource;
        }

        public resource Insert(resource id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_RESOURCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@Resource_Type", id.Resource_Type);
                cmd.Parameters.AddWithValue("@Date_Requested", id.Date_Requested);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_RESOURCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@Resource_Type", id.Resource_Type);
                cmd.Parameters.AddWithValue("@Date_Requested", id.Date_Requested);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Resource_ID = rdr.GetInt32(0);
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
        public Boolean Update(resource id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_RESOURCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@Resource_Type", id.Resource_Type);
                cmd.Parameters.AddWithValue("@Date_Requested", id.Date_Requested);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_RESOURCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Resource_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_RESOURCE_WC", con);
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




