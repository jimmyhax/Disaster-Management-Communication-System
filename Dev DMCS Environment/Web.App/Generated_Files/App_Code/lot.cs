using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class lot : System.Web.UI.Page
    {
        public Int32 lot_id
        {
            get;
            set;
        }
        public Int32 product_id
        {
            get;
            set;
        }
        public DateTime manufactured_date
        {
            get;
            set;
        }
        public DateTime expiration_date
        {
            get;
            set;
        }
        public String manufacture_name
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            lot_id = 0;
            product_id = 0;
            manufactured_date = DateTime.Now;
            expiration_date = DateTime.Now;
            manufacture_name = "";
        }
        public lot Select(int id)
        {
            lot lot = new lot();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LOT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lot_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        lot.lot_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        lot.lot_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        lot.product_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        lot.product_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        lot.manufactured_date = rdr.GetDateTime(2);
                    }
                    else
                    {
                        lot.manufactured_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        lot.expiration_date = rdr.GetDateTime(3);
                    }
                    else
                    {
                        lot.expiration_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        lot.manufacture_name = rdr.GetString(4);
                    }
                    else
                    {
                        lot.manufacture_name = " ";
                    }
                    }
                    else
                    {
                    lot.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                lot.SetColumnDefaults();
                return lot;
                }
            finally
            {
                con.Close();
            }
            return lot;
        }

        public lot Insert(lot id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_LOT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@product_id", id.product_id);
                cmd.Parameters.AddWithValue("@manufactured_date", id.manufactured_date);
                cmd.Parameters.AddWithValue("@expiration_date", id.expiration_date);
                cmd.Parameters.AddWithValue("@manufacture_name", id.manufacture_name);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_LOT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@product_id", id.product_id);
                cmd.Parameters.AddWithValue("@manufactured_date", id.manufactured_date);
                cmd.Parameters.AddWithValue("@expiration_date", id.expiration_date);
                cmd.Parameters.AddWithValue("@manufacture_name", id.manufacture_name);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.lot_id = rdr.GetInt32(0);
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
        public Boolean Update(lot id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_LOT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lot_id", id.lot_id);
                cmd.Parameters.AddWithValue("@product_id", id.product_id);
                cmd.Parameters.AddWithValue("@manufactured_date", id.manufactured_date);
                cmd.Parameters.AddWithValue("@expiration_date", id.expiration_date);
                cmd.Parameters.AddWithValue("@manufacture_name", id.manufacture_name);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_LOT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lot_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LOT_WC", con);
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




