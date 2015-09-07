using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class call_center : System.Web.UI.Page
    {
        public Int32 call_center_id
        {
            get;
            set;
        }
        public Int32 address_id
        {
            get;
            set;
        }
        public String call_center_name
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            call_center_id = 0;
            address_id = 0;
            call_center_name = "";
        }
        public call_center Select(int id)
        {
            call_center call_center = new call_center();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CALL_CENTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        call_center.call_center_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        call_center.call_center_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        call_center.address_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        call_center.address_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        call_center.call_center_name = rdr.GetString(2);
                    }
                    else
                    {
                        call_center.call_center_name = " ";
                    }
                    }
                    else
                    {
                    call_center.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                call_center.SetColumnDefaults();
                return call_center;
                }
            finally
            {
                con.Close();
            }
            return call_center;
        }

        public call_center Insert(call_center id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CALL_CENTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@call_center_name", id.call_center_name);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_CALL_CENTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@call_center_name", id.call_center_name);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.call_center_id = rdr.GetInt32(0);
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
        public Boolean Update(call_center id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CALL_CENTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@call_center_name", id.call_center_name);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CALL_CENTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CALL_CENTER_WC", con);
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




