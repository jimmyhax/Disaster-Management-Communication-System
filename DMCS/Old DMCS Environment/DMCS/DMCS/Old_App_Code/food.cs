using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class food
{
    public Int32 food_voucher_id
    {
        get;
        set;
    }
    public Int32 clients_served
    {
        get;
        set;
    }
    public Int32 food_voucher_number
    {
        get;
        set;
    }
    public DateTime date_issued
    {
        get;
        set;
    }
    public Int32 Product_id
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        food_voucher_id = 0;
        clients_served = 0;
        food_voucher_number = 0;
        date_issued = DateTime.Now;
        Product_id = 0;
    }
    public food Select(int id)
    {
        food food = new food();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_FOOD", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@food_voucher_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    food.food_voucher_id = rdr.GetInt32(0);
                }
                else
                {
                    food.food_voucher_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    food.clients_served = rdr.GetInt32(1);
                }
                else
                {
                    food.clients_served = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    food.food_voucher_number = rdr.GetInt32(2);
                }
                else
                {
                    food.food_voucher_number = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    food.date_issued = rdr.GetDateTime(3);
                }
                else
                {
                    food.date_issued = DateTime.Now;
                }
                if (!rdr.IsDBNull(4))
                {
                    food.Product_id = rdr.GetInt32(4);
                }
                else
                {
                    food.Product_id = 0;
                }
                }
                else
                {
                    food.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            food.SetColumnDefaults();
            return food;
            }
        finally
        {
            con.Close();
        }
        return food;
    }

    public food Insert(food id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_FOOD", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@food_voucher_id", id.food_voucher_id);
            cmd.Parameters.AddWithValue("@clients_served", id.clients_served);
            cmd.Parameters.AddWithValue("@food_voucher_number", id.food_voucher_number);
            cmd.Parameters.AddWithValue("@date_issued", id.date_issued);
            cmd.Parameters.AddWithValue("@Product_id", id.Product_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_FOOD", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@clients_served", id.clients_served);
            cmd.Parameters.AddWithValue("@food_voucher_number", id.food_voucher_number);
            cmd.Parameters.AddWithValue("@date_issued", id.date_issued);
            cmd.Parameters.AddWithValue("@Product_id", id.Product_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.food_voucher_id = rdr.GetInt32(0);
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
    public Boolean Update(food id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_FOOD", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@food_voucher_id", id.food_voucher_id);
            cmd.Parameters.AddWithValue("@clients_served", id.clients_served);
            cmd.Parameters.AddWithValue("@food_voucher_number", id.food_voucher_number);
            cmd.Parameters.AddWithValue("@date_issued", id.date_issued);
            cmd.Parameters.AddWithValue("@Product_id", id.Product_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_FOOD", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@food_voucher_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_FOOD_WC", con);
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




