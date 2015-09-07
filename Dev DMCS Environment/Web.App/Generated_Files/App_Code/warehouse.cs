using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class warehouse : System.Web.UI.Page
    {
        public Int32 warehouse_id
        {
            get;
            set;
        }
        public String warehouse_name
        {
            get;
            set;
        }
        public Int32 address_id
        {
            get;
            set;
        }
        public String warehouse_type
        {
            get;
            set;
        }
        public Int32 Location_ID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            warehouse_id = 0;
            warehouse_name = "";
            address_id = 0;
            warehouse_type = "";
            Location_ID = 0;
        }
        public warehouse Select(int id)
        {
            warehouse warehouse = new warehouse();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_WAREHOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@warehouse_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        warehouse.warehouse_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        warehouse.warehouse_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        warehouse.warehouse_name = rdr.GetString(1);
                    }
                    else
                    {
                        warehouse.warehouse_name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        warehouse.address_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        warehouse.address_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        warehouse.warehouse_type = rdr.GetString(3);
                    }
                    else
                    {
                        warehouse.warehouse_type = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        warehouse.Location_ID = rdr.GetInt32(4);
                    }
                    else
                    {
                        warehouse.Location_ID = 0;
                    }
                    }
                    else
                    {
                    warehouse.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                warehouse.SetColumnDefaults();
                return warehouse;
                }
            finally
            {
                con.Close();
            }
            return warehouse;
        }

        public warehouse Insert(warehouse id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_WAREHOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@warehouse_name", id.warehouse_name);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@warehouse_type", id.warehouse_type);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_WAREHOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@warehouse_name", id.warehouse_name);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@warehouse_type", id.warehouse_type);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.warehouse_id = rdr.GetInt32(0);
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
        public Boolean Update(warehouse id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_WAREHOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@warehouse_id", id.warehouse_id);
                cmd.Parameters.AddWithValue("@warehouse_name", id.warehouse_name);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@warehouse_type", id.warehouse_type);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_WAREHOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@warehouse_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_WAREHOUSE_WC", con);
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




