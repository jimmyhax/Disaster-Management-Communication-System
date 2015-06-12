using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class property
{
    public Int32 property_id
    {
        get;
        set;
    }
    public Decimal approx_mrkt_value
    {
        get;
        set;
    }
    public Int32 address_id
    {
        get;
        set;
    }
    public Int32 case_id
    {
        get;
        set;
    }
    public Int32 client_id
    {
        get;
        set;
    }
    public Decimal Homeowners_Insurance_Payment
    {
        get;
        set;
    }
    public Decimal monthly_property_payment
    {
        get;
        set;
    }
    public String mortg_comp
    {
        get;
        set;
    }
    public Decimal Property_Tax_Payment
    {
        get;
        set;
    }
    public String own_prop
    {
        get;
        set;
    }
    public String rent_prop
    {
        get;
        set;
    }
    public Int32 date_purchased
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        property_id = 0;
        approx_mrkt_value = 0;
        address_id = 0;
        case_id = 0;
        client_id = 0;
        Homeowners_Insurance_Payment = 0;
        monthly_property_payment = 0;
        mortg_comp = " ";
        Property_Tax_Payment = 0;
        own_prop = " ";
        rent_prop = " ";
        date_purchased = 0;
    }
    public property Select(int id)
    {
        property property = new property();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROPERTY", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@property_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    property.property_id = rdr.GetInt32(0);
                }
                else
                {
                    property.property_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    property.approx_mrkt_value = rdr.GetDecimal(1);
                }
                else
                {
                    property.approx_mrkt_value = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    property.address_id = rdr.GetInt32(2);
                }
                else
                {
                    property.address_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    property.case_id = rdr.GetInt32(3);
                }
                else
                {
                    property.case_id = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    property.client_id = rdr.GetInt32(4);
                }
                else
                {
                    property.client_id = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    property.Homeowners_Insurance_Payment = rdr.GetDecimal(5);
                }
                else
                {
                    property.Homeowners_Insurance_Payment = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    property.monthly_property_payment = rdr.GetDecimal(6);
                }
                else
                {
                    property.monthly_property_payment = 0;
                }
                if (!rdr.IsDBNull(7))
                {
                    property.mortg_comp = rdr.GetString(7);
                }
                else
                {
                    property.mortg_comp = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    property.Property_Tax_Payment = rdr.GetDecimal(8);
                }
                else
                {
                    property.Property_Tax_Payment = 0;
                }
                if (!rdr.IsDBNull(9))
                {
                    property.own_prop = rdr.GetString(9);
                }
                else
                {
                    property.own_prop = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    property.rent_prop = rdr.GetString(10);
                }
                else
                {
                    property.rent_prop = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    property.date_purchased = rdr.GetInt32(11);
                }
                else
                {
                    property.date_purchased = 0;
                }
                }
                else
                {
                    property.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            property.SetColumnDefaults();
            return property;
            }
        finally
        {
            con.Close();
        }
        return property;
    }

    public property Insert(property id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PROPERTY", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@approx_mrkt_value", id.approx_mrkt_value);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@Homeowners_Insurance_Payment", id.Homeowners_Insurance_Payment);
            cmd.Parameters.AddWithValue("@monthly_property_payment", id.monthly_property_payment);
            cmd.Parameters.AddWithValue("@mortg_comp", id.mortg_comp);
            cmd.Parameters.AddWithValue("@Property_Tax_Payment", id.Property_Tax_Payment);
            cmd.Parameters.AddWithValue("@own_prop", id.own_prop);
            cmd.Parameters.AddWithValue("@rent_prop", id.rent_prop);
            cmd.Parameters.AddWithValue("@date_purchased", id.date_purchased);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_PROPERTY", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@approx_mrkt_value", id.approx_mrkt_value);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@Homeowners_Insurance_Payment", id.Homeowners_Insurance_Payment);
            cmd.Parameters.AddWithValue("@monthly_property_payment", id.monthly_property_payment);
            cmd.Parameters.AddWithValue("@mortg_comp", id.mortg_comp);
            cmd.Parameters.AddWithValue("@Property_Tax_Payment", id.Property_Tax_Payment);
            cmd.Parameters.AddWithValue("@own_prop", id.own_prop);
            cmd.Parameters.AddWithValue("@rent_prop", id.rent_prop);
            cmd.Parameters.AddWithValue("@date_purchased", id.date_purchased);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.property_id = rdr.GetInt32(0);
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
    public Boolean Update(property id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PROPERTY", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@property_id", id.property_id);
            cmd.Parameters.AddWithValue("@approx_mrkt_value", id.approx_mrkt_value);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@Homeowners_Insurance_Payment", id.Homeowners_Insurance_Payment);
            cmd.Parameters.AddWithValue("@monthly_property_payment", id.monthly_property_payment);
            cmd.Parameters.AddWithValue("@mortg_comp", id.mortg_comp);
            cmd.Parameters.AddWithValue("@Property_Tax_Payment", id.Property_Tax_Payment);
            cmd.Parameters.AddWithValue("@own_prop", id.own_prop);
            cmd.Parameters.AddWithValue("@rent_prop", id.rent_prop);
            cmd.Parameters.AddWithValue("@date_purchased", id.date_purchased);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PROPERTY", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@property_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROPERTY_WC", con);
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




