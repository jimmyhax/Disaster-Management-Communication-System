using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Mobile_Product : System.Web.UI.Page
    {
        public Int32 Mobile_Product_id
        {
            get;
            set;
        }
        public Int32 Mobile_Unit_id
        {
            get;
            set;
        }
        public Int32 Product_id
        {
            get;
            set;
        }
        public Int32 Case_id
        {
            get;
            set;
        }
        public Int32 Lot_id
        {
            get;
            set;
        }
        public Int32 Min_inv
        {
            get;
            set;
        }
        public Int32 Quantity
        {
            get;
            set;
        }
        public DateTime Experiation_Date
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Mobile_Product_id = 0;
            Mobile_Unit_id = 0;
            Product_id = 0;
            Case_id = 0;
            Lot_id = 0;
            Min_inv = 0;
            Quantity = 0;
            Experiation_Date = DateTime.Now;
        }
        public Mobile_Product Select(int id)
        {
            Mobile_Product Mobile_Product = new Mobile_Product();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MOBILE_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Mobile_Product_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Mobile_Product.Mobile_Product_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        Mobile_Product.Mobile_Product_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Mobile_Product.Mobile_Unit_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        Mobile_Product.Mobile_Unit_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Mobile_Product.Product_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        Mobile_Product.Product_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Mobile_Product.Case_id = rdr.GetInt32(3);
                    }
                    else
                    {
                        Mobile_Product.Case_id = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Mobile_Product.Lot_id = rdr.GetInt32(4);
                    }
                    else
                    {
                        Mobile_Product.Lot_id = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Mobile_Product.Min_inv = rdr.GetInt32(5);
                    }
                    else
                    {
                        Mobile_Product.Min_inv = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Mobile_Product.Quantity = rdr.GetInt32(6);
                    }
                    else
                    {
                        Mobile_Product.Quantity = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        Mobile_Product.Experiation_Date = rdr.GetDateTime(7);
                    }
                    else
                    {
                        Mobile_Product.Experiation_Date = DateTime.Now;
                    }
                    }
                    else
                    {
                    Mobile_Product.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Mobile_Product.SetColumnDefaults();
                return Mobile_Product;
                }
            finally
            {
                con.Close();
            }
            return Mobile_Product;
        }

        public Mobile_Product Insert(Mobile_Product id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MOBILE_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Mobile_Unit_id", id.Mobile_Unit_id);
                cmd.Parameters.AddWithValue("@Product_id", id.Product_id);
                cmd.Parameters.AddWithValue("@Case_id", id.Case_id);
                cmd.Parameters.AddWithValue("@Lot_id", id.Lot_id);
                cmd.Parameters.AddWithValue("@Min_inv", id.Min_inv);
                cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
                cmd.Parameters.AddWithValue("@Experiation_Date", id.Experiation_Date);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MOBILE_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Mobile_Unit_id", id.Mobile_Unit_id);
                cmd.Parameters.AddWithValue("@Product_id", id.Product_id);
                cmd.Parameters.AddWithValue("@Case_id", id.Case_id);
                cmd.Parameters.AddWithValue("@Lot_id", id.Lot_id);
                cmd.Parameters.AddWithValue("@Min_inv", id.Min_inv);
                cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
                cmd.Parameters.AddWithValue("@Experiation_Date", id.Experiation_Date);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Mobile_Product_id = rdr.GetInt32(0);
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
        public Boolean Update(Mobile_Product id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MOBILE_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Mobile_Product_id", id.Mobile_Product_id);
                cmd.Parameters.AddWithValue("@Mobile_Unit_id", id.Mobile_Unit_id);
                cmd.Parameters.AddWithValue("@Product_id", id.Product_id);
                cmd.Parameters.AddWithValue("@Case_id", id.Case_id);
                cmd.Parameters.AddWithValue("@Lot_id", id.Lot_id);
                cmd.Parameters.AddWithValue("@Min_inv", id.Min_inv);
                cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
                cmd.Parameters.AddWithValue("@Experiation_Date", id.Experiation_Date);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MOBILE_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Mobile_Product_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MOBILE_PRODUCT_WC", con);
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




