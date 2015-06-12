using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class Vendor_Products_shipments
{
    public Int32 PO_Order_no
    {
        get;
        set;
    }
    public Int32 ShipmentID
    {
        get;
        set;
    }
    public Int32 VendorID
    {
        get;
        set;
    }
    public Int32 ProductID
    {
        get;
        set;
    }
    public DateTime Expect_Delivery_Date
    {
        get;
        set;
    }
    public DateTime orderdate
    {
        get;
        set;
    }
    public Int32 quantity
    {
        get;
        set;
    }
    public String OtherInfo
    {
        get;
        set;
    }
    public DateTime DateReceived
    {
        get;
        set;
    }
    public Int32 AmountReceived
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        PO_Order_no = 0;
        ShipmentID = 0;
        VendorID = 0;
        ProductID = 0;
        Expect_Delivery_Date = DateTime.Now;
        orderdate = DateTime.Now;
        quantity = 0;
        OtherInfo = " ";
        DateReceived = DateTime.Now;
        AmountReceived = 0;
    }
    public Vendor_Products_shipments Select(int id)
    {
        Vendor_Products_shipments Vendor_Products_shipments = new Vendor_Products_shipments();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PO_Order_no", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    Vendor_Products_shipments.PO_Order_no = rdr.GetInt32(0);
                }
                else
                {
                    Vendor_Products_shipments.PO_Order_no = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    Vendor_Products_shipments.ShipmentID = rdr.GetInt32(1);
                }
                else
                {
                    Vendor_Products_shipments.ShipmentID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    Vendor_Products_shipments.VendorID = rdr.GetInt32(2);
                }
                else
                {
                    Vendor_Products_shipments.VendorID = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    Vendor_Products_shipments.ProductID = rdr.GetInt32(3);
                }
                else
                {
                    Vendor_Products_shipments.ProductID = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    Vendor_Products_shipments.Expect_Delivery_Date = rdr.GetDateTime(4);
                }
                else
                {
                    Vendor_Products_shipments.Expect_Delivery_Date = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    Vendor_Products_shipments.orderdate = rdr.GetDateTime(5);
                }
                else
                {
                    Vendor_Products_shipments.orderdate = DateTime.Now;
                }
                if (!rdr.IsDBNull(6))
                {
                    Vendor_Products_shipments.quantity = rdr.GetInt32(6);
                }
                else
                {
                    Vendor_Products_shipments.quantity = 0;
                }
                if (!rdr.IsDBNull(7))
                {
                    Vendor_Products_shipments.OtherInfo = rdr.GetString(7);
                }
                else
                {
                    Vendor_Products_shipments.OtherInfo = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    Vendor_Products_shipments.DateReceived = rdr.GetDateTime(8);
                }
                else
                {
                    Vendor_Products_shipments.DateReceived = DateTime.Now;
                }
                if (!rdr.IsDBNull(9))
                {
                    Vendor_Products_shipments.AmountReceived = rdr.GetInt32(9);
                }
                else
                {
                    Vendor_Products_shipments.AmountReceived = 0;
                }
                }
                else
                {
                    Vendor_Products_shipments.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            Vendor_Products_shipments.SetColumnDefaults();
            return Vendor_Products_shipments;
            }
        finally
        {
            con.Close();
        }
        return Vendor_Products_shipments;
    }

    public Vendor_Products_shipments Insert(Vendor_Products_shipments id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_VENDOR_PRODUCTS_SHIPMENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ShipmentID", id.ShipmentID);
            cmd.Parameters.AddWithValue("@VendorID", id.VendorID);
            cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
            cmd.Parameters.AddWithValue("@Expect_Delivery_Date", id.Expect_Delivery_Date);
            cmd.Parameters.AddWithValue("@orderdate", id.orderdate);
            cmd.Parameters.AddWithValue("@quantity", id.quantity);
            cmd.Parameters.AddWithValue("@OtherInfo", id.OtherInfo);
            cmd.Parameters.AddWithValue("@DateReceived", id.DateReceived);
            cmd.Parameters.AddWithValue("@AmountReceived", id.AmountReceived);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_VENDOR_PRODUCTS_SHIPMENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ShipmentID", id.ShipmentID);
            cmd.Parameters.AddWithValue("@VendorID", id.VendorID);
            cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
            cmd.Parameters.AddWithValue("@Expect_Delivery_Date", id.Expect_Delivery_Date);
            cmd.Parameters.AddWithValue("@orderdate", id.orderdate);
            cmd.Parameters.AddWithValue("@quantity", id.quantity);
            cmd.Parameters.AddWithValue("@OtherInfo", id.OtherInfo);
            cmd.Parameters.AddWithValue("@DateReceived", id.DateReceived);
            cmd.Parameters.AddWithValue("@AmountReceived", id.AmountReceived);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.PO_Order_no = rdr.GetInt32(0);
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
    public Boolean Update(Vendor_Products_shipments id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_VENDOR_PRODUCTS_SHIPMENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PO_Order_no", id.PO_Order_no);
            cmd.Parameters.AddWithValue("@ShipmentID", id.ShipmentID);
            cmd.Parameters.AddWithValue("@VendorID", id.VendorID);
            cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
            cmd.Parameters.AddWithValue("@Expect_Delivery_Date", id.Expect_Delivery_Date);
            cmd.Parameters.AddWithValue("@orderdate", id.orderdate);
            cmd.Parameters.AddWithValue("@quantity", id.quantity);
            cmd.Parameters.AddWithValue("@OtherInfo", id.OtherInfo);
            cmd.Parameters.AddWithValue("@DateReceived", id.DateReceived);
            cmd.Parameters.AddWithValue("@AmountReceived", id.AmountReceived);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_VENDOR_PRODUCTS_SHIPMENTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PO_Order_no", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VENDOR_PRODUCTS_SHIPMENTS_WC", con);
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




