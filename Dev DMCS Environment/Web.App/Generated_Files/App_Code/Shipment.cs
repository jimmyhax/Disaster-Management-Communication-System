using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Shipment : System.Web.UI.Page
    {
        public Int32 ShipmentID
        {
            get;
            set;
        }
        public Int32 WarehouseID
        {
            get;
            set;
        }
        public String Tracking_Num
        {
            get;
            set;
        }
        public String Ship_Method
        {
            get;
            set;
        }
        public String Other
        {
            get;
            set;
        }
        public Int32 OrderRecByID
        {
            get;
            set;
        }
        public String FullOrderReceived
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            ShipmentID = 0;
            WarehouseID = 0;
            Tracking_Num = "";
            Ship_Method = "";
            Other = "";
            OrderRecByID = 0;
            FullOrderReceived = "";
        }
        public Shipment Select(int id)
        {
            Shipment Shipment = new Shipment();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SHIPMENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ShipmentID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Shipment.ShipmentID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Shipment.ShipmentID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Shipment.WarehouseID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Shipment.WarehouseID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Shipment.Tracking_Num = rdr.GetString(2);
                    }
                    else
                    {
                        Shipment.Tracking_Num = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Shipment.Ship_Method = rdr.GetString(3);
                    }
                    else
                    {
                        Shipment.Ship_Method = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Shipment.Other = rdr.GetString(4);
                    }
                    else
                    {
                        Shipment.Other = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Shipment.OrderRecByID = rdr.GetInt32(5);
                    }
                    else
                    {
                        Shipment.OrderRecByID = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Shipment.FullOrderReceived = rdr.GetString(6);
                    }
                    else
                    {
                        Shipment.FullOrderReceived = " ";
                    }
                    }
                    else
                    {
                    Shipment.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Shipment.SetColumnDefaults();
                return Shipment;
                }
            finally
            {
                con.Close();
            }
            return Shipment;
        }

        public Shipment Insert(Shipment id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_SHIPMENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@WarehouseID", id.WarehouseID);
                cmd.Parameters.AddWithValue("@Tracking_Num", id.Tracking_Num);
                cmd.Parameters.AddWithValue("@Ship_Method", id.Ship_Method);
                cmd.Parameters.AddWithValue("@Other", id.Other);
                cmd.Parameters.AddWithValue("@OrderRecByID", id.OrderRecByID);
                cmd.Parameters.AddWithValue("@FullOrderReceived", id.FullOrderReceived);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_SHIPMENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@WarehouseID", id.WarehouseID);
                cmd.Parameters.AddWithValue("@Tracking_Num", id.Tracking_Num);
                cmd.Parameters.AddWithValue("@Ship_Method", id.Ship_Method);
                cmd.Parameters.AddWithValue("@Other", id.Other);
                cmd.Parameters.AddWithValue("@OrderRecByID", id.OrderRecByID);
                cmd.Parameters.AddWithValue("@FullOrderReceived", id.FullOrderReceived);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.ShipmentID = rdr.GetInt32(0);
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
        public Boolean Update(Shipment id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_SHIPMENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ShipmentID", id.ShipmentID);
                cmd.Parameters.AddWithValue("@WarehouseID", id.WarehouseID);
                cmd.Parameters.AddWithValue("@Tracking_Num", id.Tracking_Num);
                cmd.Parameters.AddWithValue("@Ship_Method", id.Ship_Method);
                cmd.Parameters.AddWithValue("@Other", id.Other);
                cmd.Parameters.AddWithValue("@OrderRecByID", id.OrderRecByID);
                cmd.Parameters.AddWithValue("@FullOrderReceived", id.FullOrderReceived);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_SHIPMENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ShipmentID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SHIPMENT_WC", con);
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




