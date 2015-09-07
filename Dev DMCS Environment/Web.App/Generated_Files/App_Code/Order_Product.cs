using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Order_Product : System.Web.UI.Page
    {
        public Int32 order_Product_ID
        {
            get;
            set;
        }
        public Int32 orderID
        {
            get;
            set;
        }
        public Int32 ProductID
        {
            get;
            set;
        }
        public Int32 Quantity
        {
            get;
            set;
        }
        public Int32 warehouseid
        {
            get;
            set;
        }
        public DateTime DatePicked
        {
            get;
            set;
        }
        public Int32 Qtypicked
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            order_Product_ID = 0;
            orderID = 0;
            ProductID = 0;
            Quantity = 0;
            warehouseid = 0;
            DatePicked = DateTime.Now;
            Qtypicked = 0;
        }
        public Order_Product Select(int id)
        {
            Order_Product Order_Product = new Order_Product();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ORDER_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_Product_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Order_Product.order_Product_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Order_Product.order_Product_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Order_Product.orderID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Order_Product.orderID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Order_Product.ProductID = rdr.GetInt32(2);
                    }
                    else
                    {
                        Order_Product.ProductID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Order_Product.Quantity = rdr.GetInt32(3);
                    }
                    else
                    {
                        Order_Product.Quantity = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Order_Product.warehouseid = rdr.GetInt32(4);
                    }
                    else
                    {
                        Order_Product.warehouseid = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Order_Product.DatePicked = rdr.GetDateTime(5);
                    }
                    else
                    {
                        Order_Product.DatePicked = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Order_Product.Qtypicked = rdr.GetInt32(6);
                    }
                    else
                    {
                        Order_Product.Qtypicked = 0;
                    }
                    }
                    else
                    {
                    Order_Product.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Order_Product.SetColumnDefaults();
                return Order_Product;
                }
            finally
            {
                con.Close();
            }
            return Order_Product;
        }

        public Order_Product Insert(Order_Product id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ORDER_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@orderID", id.orderID);
                cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
                cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
                cmd.Parameters.AddWithValue("@warehouseid", id.warehouseid);
                cmd.Parameters.AddWithValue("@DatePicked", id.DatePicked);
                cmd.Parameters.AddWithValue("@Qtypicked", id.Qtypicked);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ORDER_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@orderID", id.orderID);
                cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
                cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
                cmd.Parameters.AddWithValue("@warehouseid", id.warehouseid);
                cmd.Parameters.AddWithValue("@DatePicked", id.DatePicked);
                cmd.Parameters.AddWithValue("@Qtypicked", id.Qtypicked);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.order_Product_ID = rdr.GetInt32(0);
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
        public Boolean Update(Order_Product id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ORDER_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_Product_ID", id.order_Product_ID);
                cmd.Parameters.AddWithValue("@orderID", id.orderID);
                cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
                cmd.Parameters.AddWithValue("@Quantity", id.Quantity);
                cmd.Parameters.AddWithValue("@warehouseid", id.warehouseid);
                cmd.Parameters.AddWithValue("@DatePicked", id.DatePicked);
                cmd.Parameters.AddWithValue("@Qtypicked", id.Qtypicked);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ORDER_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_Product_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ORDER_PRODUCT_WC", con);
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




