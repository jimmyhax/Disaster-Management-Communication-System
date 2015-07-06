using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class warehouse_product_Location
{
    public Int32 warehouse_product_location_id
    {
        get;
        set;
    }
    public Int32 warehouse_id
    {
        get;
        set;
    }
    public Int32 product_id
    {
        get;
        set;
    }
    public Int32 Location_ID
    {
        get;
        set;
    }
    public Int32 service_id
    {
        get;
        set;
    }
    public DateTime Time_Date_MIA
    {
        get;
        set;
    }
    public DateTime Experiation_Date
    {
        get;
        set;
    }
    public Int32 min_inv
    {
        get;
        set;
    }
    public String status
    {
        get;
        set;
    }
    public DateTime Exp_delivery_date
    {
        get;
        set;
    }
    public Int32 qty_onhand
    {
        get;
        set;
    }
    public Int32 qty_commit
    {
        get;
        set;
    }
    public Int32 qty_order
    {
        get;
        set;
    }
    public Int32 encounter_id
    {
        get;
        set;
    }
    public Int32 address_id
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        warehouse_product_location_id = 0;
        warehouse_id = 0;
        product_id = 0;
        Location_ID = 0;
        service_id = 0;
        Time_Date_MIA = DateTime.Now;
        Experiation_Date = DateTime.Now;
        min_inv = 0;
        status = " ";
        Exp_delivery_date = DateTime.Now;
        qty_onhand = 0;
        qty_commit = 0;
        qty_order = 0;
        encounter_id = 0;
        address_id = 0;
    }
    public warehouse_product_Location Select(int id)
    {
        warehouse_product_Location warehouse_product_Location = new warehouse_product_Location();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@warehouse_product_location_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    warehouse_product_Location.warehouse_product_location_id = rdr.GetInt32(0);
                }
                else
                {
                    warehouse_product_Location.warehouse_product_location_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    warehouse_product_Location.warehouse_id = rdr.GetInt32(1);
                }
                else
                {
                    warehouse_product_Location.warehouse_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    warehouse_product_Location.product_id = rdr.GetInt32(2);
                }
                else
                {
                    warehouse_product_Location.product_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    warehouse_product_Location.Location_ID = rdr.GetInt32(3);
                }
                else
                {
                    warehouse_product_Location.Location_ID = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    warehouse_product_Location.service_id = rdr.GetInt32(4);
                }
                else
                {
                    warehouse_product_Location.service_id = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    warehouse_product_Location.Time_Date_MIA = rdr.GetDateTime(5);
                }
                else
                {
                    warehouse_product_Location.Time_Date_MIA = DateTime.Now;
                }
                if (!rdr.IsDBNull(6))
                {
                    warehouse_product_Location.Experiation_Date = rdr.GetDateTime(6);
                }
                else
                {
                    warehouse_product_Location.Experiation_Date = DateTime.Now;
                }
                if (!rdr.IsDBNull(7))
                {
                    warehouse_product_Location.min_inv = rdr.GetInt32(7);
                }
                else
                {
                    warehouse_product_Location.min_inv = 0;
                }
                if (!rdr.IsDBNull(8))
                {
                    warehouse_product_Location.status = rdr.GetString(8);
                }
                else
                {
                    warehouse_product_Location.status = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    warehouse_product_Location.Exp_delivery_date = rdr.GetDateTime(9);
                }
                else
                {
                    warehouse_product_Location.Exp_delivery_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(10))
                {
                    warehouse_product_Location.qty_onhand = rdr.GetInt32(10);
                }
                else
                {
                    warehouse_product_Location.qty_onhand = 0;
                }
                if (!rdr.IsDBNull(11))
                {
                    warehouse_product_Location.qty_commit = rdr.GetInt32(11);
                }
                else
                {
                    warehouse_product_Location.qty_commit = 0;
                }
                if (!rdr.IsDBNull(12))
                {
                    warehouse_product_Location.qty_order = rdr.GetInt32(12);
                }
                else
                {
                    warehouse_product_Location.qty_order = 0;
                }
                if (!rdr.IsDBNull(13))
                {
                    warehouse_product_Location.encounter_id = rdr.GetInt32(13);
                }
                else
                {
                    warehouse_product_Location.encounter_id = 0;
                }
                if (!rdr.IsDBNull(14))
                {
                    warehouse_product_Location.address_id = rdr.GetInt32(14);
                }
                else
                {
                    warehouse_product_Location.address_id = 0;
                }
                }
                else
                {
                    warehouse_product_Location.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            warehouse_product_Location.SetColumnDefaults();
            return warehouse_product_Location;
            }
        finally
        {
            con.Close();
        }
        return warehouse_product_Location;
    }
    public warehouse_product_Location Select_By_Product_ID(int wplid)
    {
        warehouse_product_Location warehouse_product_Location = new warehouse_product_Location();

        string ConnectionString = IDManager.connection();

        SqlConnection con = new SqlConnection(ConnectionString);


        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SP_DMCS_Select_warehouse_product_location_By_Product_ID", con);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@product_id", wplid);

            SqlDataReader rdr = cmd.ExecuteReader();

            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    warehouse_product_Location.warehouse_product_location_id = rdr.GetInt32(0);
                }
                else
                {
                    warehouse_product_Location.warehouse_product_location_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    warehouse_product_Location.warehouse_id = rdr.GetInt32(1);
                }
                else
                {
                    warehouse_product_Location.warehouse_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    warehouse_product_Location.product_id = rdr.GetInt32(2);
                }
                else
                {
                    warehouse_product_Location.product_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    warehouse_product_Location.Location_ID = rdr.GetInt32(3);
                }
                else
                {
                    warehouse_product_Location.Location_ID = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    warehouse_product_Location.service_id = rdr.GetInt32(4);
                }
                else
                {
                    warehouse_product_Location.service_id = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    warehouse_product_Location.Time_Date_MIA = rdr.GetDateTime(5);
                }
                else
                {
                    warehouse_product_Location.Time_Date_MIA = DateTime.Now;
                }
                if (!rdr.IsDBNull(6))
                {
                    warehouse_product_Location.Experiation_Date = rdr.GetDateTime(6);
                }
                else
                {
                    warehouse_product_Location.Experiation_Date = DateTime.Now;
                }
                if (!rdr.IsDBNull(7))
                {
                    warehouse_product_Location.min_inv = rdr.GetInt32(7);
                }
                else
                {
                    warehouse_product_Location.min_inv = 0;
                }
                if (!rdr.IsDBNull(8))
                {
                    warehouse_product_Location.status = rdr.GetString(8);
                }
                else
                {
                    warehouse_product_Location.status = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    warehouse_product_Location.Exp_delivery_date = rdr.GetDateTime(9);
                }
                else
                {
                    warehouse_product_Location.Exp_delivery_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(10))
                {
                    warehouse_product_Location.qty_onhand = rdr.GetInt32(10);
                }
                else
                {
                    warehouse_product_Location.qty_onhand = 0;
                }
                if (!rdr.IsDBNull(11))
                {
                    warehouse_product_Location.qty_commit = rdr.GetInt32(11);
                }
                else
                {
                    warehouse_product_Location.qty_commit = 0;
                }
                if (!rdr.IsDBNull(12))
                {
                    warehouse_product_Location.qty_order = rdr.GetInt32(12);
                }
                else
                {
                    warehouse_product_Location.qty_order = 0;
                }
                if (!rdr.IsDBNull(13))
                {
                    warehouse_product_Location.encounter_id = rdr.GetInt32(13);
                }
                else
                {
                    warehouse_product_Location.encounter_id = 0;
                }
                if (!rdr.IsDBNull(14))
                {
                    warehouse_product_Location.address_id = rdr.GetInt32(14);
                }
                else
                {
                    warehouse_product_Location.address_id = 0;
                }
            }
            else
            {
                warehouse_product_Location.SetColumnDefaults();
            }
        }
        catch (Exception ex)
        {
            warehouse_product_Location.SetColumnDefaults();
            return warehouse_product_Location;
        }
        finally
        {
            con.Close();
        }

        return warehouse_product_Location;

    }

    public DataTable SelectWProduct(string whereclause)
    {
        DataTable wprows = new DataTable();

        string ConnectionString = IDManager.connection();

        SqlConnection con = new SqlConnection(ConnectionString);


        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SP_DMCS_Select_Products_AND_Warehouse_Product_Location_WC", con);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@wareclause", whereclause);

            SqlDataReader rdr = cmd.ExecuteReader();

            wprows.Load(rdr);

            return wprows;

        }
        catch (Exception ex)
        {
            return wprows;
        }
        finally
        {
            con.Close();
        }



    }
    public warehouse_product_Location Insert(warehouse_product_Location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_WAREHOUSE_PRODUCT_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@warehouse_id", id.warehouse_id);
            cmd.Parameters.AddWithValue("@product_id", id.product_id);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@service_id", id.service_id);
            cmd.Parameters.AddWithValue("@Time_Date_MIA", id.Time_Date_MIA);
            cmd.Parameters.AddWithValue("@Experiation_Date", id.Experiation_Date);
            cmd.Parameters.AddWithValue("@min_inv", id.min_inv);
            cmd.Parameters.AddWithValue("@status", id.status);
            cmd.Parameters.AddWithValue("@Exp_delivery_date", id.Exp_delivery_date);
            cmd.Parameters.AddWithValue("@qty_onhand", id.qty_onhand);
            cmd.Parameters.AddWithValue("@qty_commit", id.qty_commit);
            cmd.Parameters.AddWithValue("@qty_order", id.qty_order);
            cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_WAREHOUSE_PRODUCT_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@warehouse_id", id.warehouse_id);
            cmd.Parameters.AddWithValue("@product_id", id.product_id);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@service_id", id.service_id);
            cmd.Parameters.AddWithValue("@Time_Date_MIA", id.Time_Date_MIA);
            cmd.Parameters.AddWithValue("@Experiation_Date", id.Experiation_Date);
            cmd.Parameters.AddWithValue("@min_inv", id.min_inv);
            cmd.Parameters.AddWithValue("@status", id.status);
            cmd.Parameters.AddWithValue("@Exp_delivery_date", id.Exp_delivery_date);
            cmd.Parameters.AddWithValue("@qty_onhand", id.qty_onhand);
            cmd.Parameters.AddWithValue("@qty_commit", id.qty_commit);
            cmd.Parameters.AddWithValue("@qty_order", id.qty_order);
            cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.warehouse_product_location_id = rdr.GetInt32(0);
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
    public Boolean Update(warehouse_product_Location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_WAREHOUSE_PRODUCT_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@warehouse_product_location_id", id.warehouse_product_location_id);
            cmd.Parameters.AddWithValue("@warehouse_id", id.warehouse_id);
            cmd.Parameters.AddWithValue("@product_id", id.product_id);
            cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
            cmd.Parameters.AddWithValue("@service_id", id.service_id);
            cmd.Parameters.AddWithValue("@Time_Date_MIA", id.Time_Date_MIA);
            cmd.Parameters.AddWithValue("@Experiation_Date", id.Experiation_Date);
            cmd.Parameters.AddWithValue("@min_inv", id.min_inv);
            cmd.Parameters.AddWithValue("@status", id.status);
            cmd.Parameters.AddWithValue("@Exp_delivery_date", id.Exp_delivery_date);
            cmd.Parameters.AddWithValue("@qty_onhand", id.qty_onhand);
            cmd.Parameters.AddWithValue("@qty_commit", id.qty_commit);
            cmd.Parameters.AddWithValue("@qty_order", id.qty_order);
            cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_WAREHOUSE_PRODUCT_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@warehouse_product_location_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_WAREHOUSE_PRODUCT_LOCATION_WC", con);
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




