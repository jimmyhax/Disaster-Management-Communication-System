using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class vendor_products
{
    public Int32 vendor_prod_id
    {
        get;
        set;
    }
    public Int32 vendor_id
    {
        get;
        set;
    }
    public Int32 product_id
    {
        get;
        set;
    }
    public Int32 product_qty
    {
        get;
        set;
    }
    public String Product_exp_date
    {
        get;
        set;
    }
    public Int32 lot_id
    {
        get;
        set;
    }
    public String Department
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        vendor_prod_id = 0;
        vendor_id = 0;
        product_id = 0;
        product_qty = 0;
        Product_exp_date = " ";
        lot_id = 0;
        Department = " ";
    }
    public vendor_products Select(int id)
    {
        vendor_products vendor_products = new vendor_products();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VENDOR_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_prod_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    vendor_products.vendor_prod_id = rdr.GetInt32(0);
                }
                else
                {
                    vendor_products.vendor_prod_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    vendor_products.vendor_id = rdr.GetInt32(1);
                }
                else
                {
                    vendor_products.vendor_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    vendor_products.product_id = rdr.GetInt32(2);
                }
                else
                {
                    vendor_products.product_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    vendor_products.product_qty = rdr.GetInt32(3);
                }
                else
                {
                    vendor_products.product_qty = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    vendor_products.Product_exp_date = rdr.GetString(4);
                }
                else
                {
                    vendor_products.Product_exp_date = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    vendor_products.lot_id = rdr.GetInt32(5);
                }
                else
                {
                    vendor_products.lot_id = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    vendor_products.Department = rdr.GetString(6);
                }
                else
                {
                    vendor_products.Department = " ";
                }
                }
                else
                {
                    vendor_products.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            vendor_products.SetColumnDefaults();
            return vendor_products;
            }
        finally
        {
            con.Close();
        }
        return vendor_products;
    }

    public vendor_products Insert(vendor_products id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_VENDOR_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_id", id.vendor_id);
            cmd.Parameters.AddWithValue("@product_id", id.product_id);
            cmd.Parameters.AddWithValue("@product_qty", id.product_qty);
            cmd.Parameters.AddWithValue("@Product_exp_date", id.Product_exp_date);
            cmd.Parameters.AddWithValue("@lot_id", id.lot_id);
            cmd.Parameters.AddWithValue("@Department", id.Department);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_VENDOR_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_id", id.vendor_id);
            cmd.Parameters.AddWithValue("@product_id", id.product_id);
            cmd.Parameters.AddWithValue("@product_qty", id.product_qty);
            cmd.Parameters.AddWithValue("@Product_exp_date", id.Product_exp_date);
            cmd.Parameters.AddWithValue("@lot_id", id.lot_id);
            cmd.Parameters.AddWithValue("@Department", id.Department);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.vendor_prod_id = rdr.GetInt32(0);
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
    public Boolean Update(vendor_products id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_VENDOR_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_prod_id", id.vendor_prod_id);
            cmd.Parameters.AddWithValue("@vendor_id", id.vendor_id);
            cmd.Parameters.AddWithValue("@product_id", id.product_id);
            cmd.Parameters.AddWithValue("@product_qty", id.product_qty);
            cmd.Parameters.AddWithValue("@Product_exp_date", id.Product_exp_date);
            cmd.Parameters.AddWithValue("@lot_id", id.lot_id);
            cmd.Parameters.AddWithValue("@Department", id.Department);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_VENDOR_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_prod_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VENDOR_PRODUCTS_WC", con);
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




