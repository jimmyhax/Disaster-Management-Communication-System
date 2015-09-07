using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class tier_req : System.Web.UI.Page
    {
        public Int32 tier_req_id
        {
            get;
            set;
        }
        public Int32 req_id
        {
            get;
            set;
        }
        public Int32 tier_id
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            tier_req_id = 0;
            req_id = 0;
            tier_id = 0;
        }
        public tier_req Select(int id)
        {
            tier_req tier_req = new tier_req();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TIER_REQ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tier_req_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        tier_req.tier_req_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        tier_req.tier_req_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        tier_req.req_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        tier_req.req_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        tier_req.tier_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        tier_req.tier_id = 0;
                    }
                    }
                    else
                    {
                    tier_req.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                tier_req.SetColumnDefaults();
                return tier_req;
                }
            finally
            {
                con.Close();
            }
            return tier_req;
        }

        public tier_req Insert(tier_req id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_TIER_REQ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@req_id", id.req_id);
                cmd.Parameters.AddWithValue("@tier_id", id.tier_id);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_TIER_REQ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@req_id", id.req_id);
                cmd.Parameters.AddWithValue("@tier_id", id.tier_id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.tier_req_id = rdr.GetInt32(0);
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
        public Boolean Update(tier_req id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_TIER_REQ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tier_req_id", id.tier_req_id);
                cmd.Parameters.AddWithValue("@req_id", id.req_id);
                cmd.Parameters.AddWithValue("@tier_id", id.tier_id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_TIER_REQ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tier_req_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_TIER_REQ_WC", con);
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




