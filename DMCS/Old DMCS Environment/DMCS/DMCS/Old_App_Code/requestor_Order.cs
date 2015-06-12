using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class requestor_Order
{
    public Int32 OrderID
    {
        get;
        set;
    }
    public Int32 Requestor_ID
    {
        get;
        set;
    }
    public Int32 EncounterID
    {
        get;
        set;
    }
    public Int32 OrderPriority
    {
        get;
        set;
    }
    public Int32 OrderNum
    {
        get;
        set;
    }
    public Int32 ShipToAddressID
    {
        get;
        set;
    }
    public String OrderDeliveryType
    {
        get;
        set;
    }
    public DateTime OrderPickUpDate
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        OrderID = 0;
        Requestor_ID = 0;
        EncounterID = 0;
        OrderPriority = 0;
        OrderNum = 0;
        ShipToAddressID = 0;
        OrderDeliveryType = " ";
        OrderPickUpDate = DateTime.Now;
    }
    public requestor_Order Select(int id)
    {
        requestor_Order requestor_Order = new requestor_Order();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_REQUESTOR_ORDER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@OrderID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    requestor_Order.OrderID = rdr.GetInt32(0);
                }
                else
                {
                    requestor_Order.OrderID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    requestor_Order.Requestor_ID = rdr.GetInt32(1);
                }
                else
                {
                    requestor_Order.Requestor_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    requestor_Order.EncounterID = rdr.GetInt32(2);
                }
                else
                {
                    requestor_Order.EncounterID = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    requestor_Order.OrderPriority = rdr.GetInt32(3);
                }
                else
                {
                    requestor_Order.OrderPriority = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    requestor_Order.OrderNum = rdr.GetInt32(4);
                }
                else
                {
                    requestor_Order.OrderNum = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    requestor_Order.ShipToAddressID = rdr.GetInt32(5);
                }
                else
                {
                    requestor_Order.ShipToAddressID = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    requestor_Order.OrderDeliveryType = rdr.GetString(6);
                }
                else
                {
                    requestor_Order.OrderDeliveryType = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    requestor_Order.OrderPickUpDate = rdr.GetDateTime(7);
                }
                else
                {
                    requestor_Order.OrderPickUpDate = DateTime.Now;
                }
                }
                else
                {
                    requestor_Order.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            requestor_Order.SetColumnDefaults();
            return requestor_Order;
            }
        finally
        {
            con.Close();
        }
        return requestor_Order;
    }

    public requestor_Order Insert(requestor_Order id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_REQUESTOR_ORDER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Requestor_ID", id.Requestor_ID);
            cmd.Parameters.AddWithValue("@EncounterID", id.EncounterID);
            cmd.Parameters.AddWithValue("@OrderPriority", id.OrderPriority);
            cmd.Parameters.AddWithValue("@OrderNum", id.OrderNum);
            cmd.Parameters.AddWithValue("@ShipToAddressID", id.ShipToAddressID);
            cmd.Parameters.AddWithValue("@OrderDeliveryType", id.OrderDeliveryType);
            cmd.Parameters.AddWithValue("@OrderPickUpDate", id.OrderPickUpDate);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_REQUESTOR_ORDER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Requestor_ID", id.Requestor_ID);
            cmd.Parameters.AddWithValue("@EncounterID", id.EncounterID);
            cmd.Parameters.AddWithValue("@OrderPriority", id.OrderPriority);
            cmd.Parameters.AddWithValue("@OrderNum", id.OrderNum);
            cmd.Parameters.AddWithValue("@ShipToAddressID", id.ShipToAddressID);
            cmd.Parameters.AddWithValue("@OrderDeliveryType", id.OrderDeliveryType);
            cmd.Parameters.AddWithValue("@OrderPickUpDate", id.OrderPickUpDate);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.OrderID = rdr.GetInt32(0);
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
    public Boolean Update(requestor_Order id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_REQUESTOR_ORDER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@OrderID", id.OrderID);
            cmd.Parameters.AddWithValue("@Requestor_ID", id.Requestor_ID);
            cmd.Parameters.AddWithValue("@EncounterID", id.EncounterID);
            cmd.Parameters.AddWithValue("@OrderPriority", id.OrderPriority);
            cmd.Parameters.AddWithValue("@OrderNum", id.OrderNum);
            cmd.Parameters.AddWithValue("@ShipToAddressID", id.ShipToAddressID);
            cmd.Parameters.AddWithValue("@OrderDeliveryType", id.OrderDeliveryType);
            cmd.Parameters.AddWithValue("@OrderPickUpDate", id.OrderPickUpDate);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_REQUESTOR_ORDER", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@OrderID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_REQUESTOR_ORDER_WC", con);
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




