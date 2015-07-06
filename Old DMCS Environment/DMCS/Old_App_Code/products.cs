using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class products
{
    public Int32 product_id
    {
        get;
        set;
    }
    public Int32 Resource_ID
    {
        get;
        set;
    }
    public String product_name
    {
        get;
        set;
    }
    public String product_type
    {
        get;
        set;
    }
    public Int32 product_qty
    {
        get;
        set;
    }
    public String product_desc
    {
        get;
        set;
    }
    public String product_color
    {
        get;
        set;
    }
    public String product_size
    {
        get;
        set;
    }
    public Decimal product_cost
    {
        get;
        set;
    }
    public DateTime Product_exp_date
    {
        get;
        set;
    }
    public String Product_Alergy_info
    {
        get;
        set;
    }
    public String Product_refrigde
    {
        get;
        set;
    }
    public String Product_Flammable
    {
        get;
        set;
    }
    public String Product_Hazard
    {
        get;
        set;
    }
    public String Product_Other
    {
        get;
        set;
    }
    public Int32 Product_Min_Inv
    {
        get;
        set;
    }
    public String Product_Barcode
    {
        get;
        set;
    }
    public String Product_subtype
    {
        get;
        set;
    }
    public String Make
    {
        get;
        set;
    }
    public String Model
    {
        get;
        set;
    }
    public String FEMA_Description
    {
        get;
        set;
    }
    public String Year
    {
        get;
        set;
    }
    public String RFID
    {
        get;
        set;
    }
    public string GPS
    {
        get;
        set;
    }
    public String Serial_Number
    {
        get;
        set;
    }
    public String Height
    {
        get;
        set;
    }
    public String Length
    {
        get;
        set;
    }
    public String Depth
    {
        get;
        set;
    }
    public String Weight
    {
        get;
        set;
    }
    public String OAI
    {
        get;
        set;
    }
    public String OAI_Type
    {
        get;
        set;
    }
    public String Use
    {
        get;
        set;
    }
    public String Brand
    {
        get;
        set;
    }
    public String Power_Supply
    {
        get;
        set;
    }
    public String Gas_Type
    {
        get;
        set;
    }
    public Boolean Needs_Gas
    {
        get;
        set;
    }
    public Boolean Needs_Electricity
    {
        get;
        set;
    }
    public String Availability
    {
        get;
        set;
    }
    public DateTime Datetime
    {
        get;
        set;
    }
    public String OpenStatus
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        product_id = 0;
        Resource_ID = 0;
        product_name = " ";
        product_type = " ";
        product_qty = 0;
        product_desc = " ";
        product_color = " ";
        product_size = " ";
        product_cost = 0;
        Product_exp_date = DateTime.Now;
        Product_Alergy_info = " ";
        Product_refrigde = " ";
        Product_Flammable = " ";
        Product_Hazard = " ";
        Product_Other = " ";
        Product_Min_Inv = 0;
        Product_Barcode = " ";
        Product_subtype = " ";
        Make = " ";
        Model = " ";
        FEMA_Description = " ";
        Year = " ";
        RFID = " ";
        GPS = " ";
        Serial_Number = " ";
        Height = " ";
        Length = " ";
        Depth = " ";
        Weight = " ";
        OAI = " ";
        OAI_Type = " ";
        Use = " ";
        Brand = " ";
        Power_Supply = " ";
        Gas_Type = " ";
        Needs_Gas = false;
        Needs_Electricity = false;
        Availability = " ";
        Datetime = DateTime.Now;
        OpenStatus = " ";
    }
    public products Select(int id)
    {
        products products = new products();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@product_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    products.product_id = rdr.GetInt32(0);
                }
                else
                {
                    products.product_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    products.Resource_ID = rdr.GetInt32(1);
                }
                else
                {
                    products.Resource_ID = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    products.product_name = rdr.GetString(2);
                }
                else
                {
                    products.product_name = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    products.product_type = rdr.GetString(3);
                }
                else
                {
                    products.product_type = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    products.product_qty = rdr.GetInt32(4);
                }
                else
                {
                    products.product_qty = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    products.product_desc = rdr.GetString(5);
                }
                else
                {
                    products.product_desc = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    products.product_color = rdr.GetString(6);
                }
                else
                {
                    products.product_color = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    products.product_size = rdr.GetString(7);
                }
                else
                {
                    products.product_size = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    products.product_cost = rdr.GetDecimal(8);
                }
                else
                {
                    products.product_cost = 0;
                }
                if (!rdr.IsDBNull(9))
                {
                    products.Product_exp_date = rdr.GetDateTime(9);
                }
                else
                {
                    products.Product_exp_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(10))
                {
                    products.Product_Alergy_info = rdr.GetString(10);
                }
                else
                {
                    products.Product_Alergy_info = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    products.Product_refrigde = rdr.GetString(11);
                }
                else
                {
                    products.Product_refrigde = " ";
                }
                if (!rdr.IsDBNull(12))
                {
                    products.Product_Flammable = rdr.GetString(12);
                }
                else
                {
                    products.Product_Flammable = " ";
                }
                if (!rdr.IsDBNull(13))
                {
                    products.Product_Hazard = rdr.GetString(13);
                }
                else
                {
                    products.Product_Hazard = " ";
                }
                if (!rdr.IsDBNull(14))
                {
                    products.Product_Other = rdr.GetString(14);
                }
                else
                {
                    products.Product_Other = " ";
                }
                if (!rdr.IsDBNull(15))
                {
                    products.Product_Min_Inv = rdr.GetInt32(15);
                }
                else
                {
                    products.Product_Min_Inv = 0;
                }
                if (!rdr.IsDBNull(16))
                {
                    products.Product_Barcode = rdr.GetString(16);
                }
                else
                {
                    products.Product_Barcode = " ";
                }
                if (!rdr.IsDBNull(17))
                {
                    products.Product_subtype = rdr.GetString(17);
                }
                else
                {
                    products.Product_subtype = " ";
                }
                if (!rdr.IsDBNull(18))
                {
                    products.Make = rdr.GetString(18);
                }
                else
                {
                    products.Make = " ";
                }
                if (!rdr.IsDBNull(19))
                {
                    products.Model = rdr.GetString(19);
                }
                else
                {
                    products.Model = " ";
                }
                if (!rdr.IsDBNull(20))
                {
                    products.FEMA_Description = rdr.GetString(20);
                }
                else
                {
                    products.FEMA_Description = " ";
                }
                if (!rdr.IsDBNull(21))
                {
                    products.Year = rdr.GetString(21);
                }
                else
                {
                    products.Year = " ";
                }
                if (!rdr.IsDBNull(22))
                {
                    products.RFID = rdr.GetString(22);
                }
                else
                {
                    products.RFID = " ";
                }
                if (!rdr.IsDBNull(23))
                {
                    products.GPS = rdr.GetString(23);
                }
                else
                {
                    products.GPS = " ";
                }
                if (!rdr.IsDBNull(24))
                {
                    products.Serial_Number = rdr.GetString(24);
                }
                else
                {
                    products.Serial_Number = " ";
                }
                if (!rdr.IsDBNull(25))
                {
                    products.Height = rdr.GetString(25);
                }
                else
                {
                    products.Height = " ";
                }
                if (!rdr.IsDBNull(26))
                {
                    products.Length = rdr.GetString(26);
                }
                else
                {
                    products.Length = " ";
                }
                if (!rdr.IsDBNull(27))
                {
                    products.Depth = rdr.GetString(27);
                }
                else
                {
                    products.Depth = " ";
                }
                if (!rdr.IsDBNull(28))
                {
                    products.Weight = rdr.GetString(28);
                }
                else
                {
                    products.Weight = " ";
                }
                if (!rdr.IsDBNull(29))
                {
                    products.OAI = rdr.GetString(29);
                }
                else
                {
                    products.OAI = " ";
                }
                if (!rdr.IsDBNull(30))
                {
                    products.OAI_Type = rdr.GetString(30);
                }
                else
                {
                    products.OAI_Type = " ";
                }
                if (!rdr.IsDBNull(31))
                {
                    products.Use = rdr.GetString(31);
                }
                else
                {
                    products.Use = " ";
                }
                if (!rdr.IsDBNull(32))
                {
                    products.Brand = rdr.GetString(32);
                }
                else
                {
                    products.Brand = " ";
                }
                if (!rdr.IsDBNull(33))
                {
                    products.Power_Supply = rdr.GetString(33);
                }
                else
                {
                    products.Power_Supply = " ";
                }
                if (!rdr.IsDBNull(34))
                {
                    products.Gas_Type = rdr.GetString(34);
                }
                else
                {
                    products.Gas_Type = " ";
                }
                if (!rdr.IsDBNull(35))
                {
                    products.Needs_Gas = rdr.GetBoolean(35);
                }
                else
                {
                    products.Needs_Gas = false;
                }
                if (!rdr.IsDBNull(36))
                {
                    products.Needs_Electricity = rdr.GetBoolean(36);
                }
                else
                {
                    products.Needs_Electricity = false;
                }
                if (!rdr.IsDBNull(37))
                {
                    products.Availability = rdr.GetString(37);
                }
                else
                {
                    products.Availability = " ";
                }
                if (!rdr.IsDBNull(38))
                {
                    products.Datetime = rdr.GetDateTime(38);
                }
                else
                {
                    products.Datetime = DateTime.Now;
                }
                if (!rdr.IsDBNull(39))
                {
                    products.OpenStatus = rdr.GetString(39);
                }
                else
                {
                    products.OpenStatus = " ";
                }
                }
                else
                {
                    products.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            products.SetColumnDefaults();
            return products;
            }
        finally
        {
            con.Close();
        }
        return products;
    }

    public products Insert(products id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@product_name", id.product_name);
            cmd.Parameters.AddWithValue("@product_type", id.product_type);
            cmd.Parameters.AddWithValue("@product_qty", id.product_qty);
            cmd.Parameters.AddWithValue("@product_desc", id.product_desc);
            cmd.Parameters.AddWithValue("@product_color", id.product_color);
            cmd.Parameters.AddWithValue("@product_size", id.product_size);
            cmd.Parameters.AddWithValue("@product_cost", id.product_cost);
            cmd.Parameters.AddWithValue("@Product_exp_date", id.Product_exp_date);
            cmd.Parameters.AddWithValue("@Product_Alergy_info", id.Product_Alergy_info);
            cmd.Parameters.AddWithValue("@Product_refrigde", id.Product_refrigde);
            cmd.Parameters.AddWithValue("@Product_Flammable", id.Product_Flammable);
            cmd.Parameters.AddWithValue("@Product_Hazard", id.Product_Hazard);
            cmd.Parameters.AddWithValue("@Product_Other", id.Product_Other);
            cmd.Parameters.AddWithValue("@Product_Min_Inv", id.Product_Min_Inv);
            cmd.Parameters.AddWithValue("@Product_Barcode", id.Product_Barcode);
            cmd.Parameters.AddWithValue("@Product_subtype", id.Product_subtype);
            cmd.Parameters.AddWithValue("@Make", id.Make);
            cmd.Parameters.AddWithValue("@Model", id.Model);
            cmd.Parameters.AddWithValue("@FEMA_Description", id.FEMA_Description);
            cmd.Parameters.AddWithValue("@Year", id.Year);
            cmd.Parameters.AddWithValue("@RFID", id.RFID);
            cmd.Parameters.AddWithValue("@GPS", id.GPS);
            cmd.Parameters.AddWithValue("@Serial_Number", id.Serial_Number);
            cmd.Parameters.AddWithValue("@Height", id.Height);
            cmd.Parameters.AddWithValue("@Length", id.Length);
            cmd.Parameters.AddWithValue("@Depth", id.Depth);
            cmd.Parameters.AddWithValue("@Weight", id.Weight);
            cmd.Parameters.AddWithValue("@OAI", id.OAI);
            cmd.Parameters.AddWithValue("@OAI_Type", id.OAI_Type);
            cmd.Parameters.AddWithValue("@Use", id.Use);
            cmd.Parameters.AddWithValue("@Brand", id.Brand);
            cmd.Parameters.AddWithValue("@Power_Supply", id.Power_Supply);
            cmd.Parameters.AddWithValue("@Gas_Type", id.Gas_Type);
            cmd.Parameters.AddWithValue("@Needs_Gas", id.Needs_Gas);
            cmd.Parameters.AddWithValue("@Needs_Electricity", id.Needs_Electricity);
            cmd.Parameters.AddWithValue("@Availability", id.Availability);
            cmd.Parameters.AddWithValue("@Datetime", id.Datetime);
            cmd.Parameters.AddWithValue("@OpenStatus", id.OpenStatus);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@product_name", id.product_name);
            cmd.Parameters.AddWithValue("@product_type", id.product_type);
            cmd.Parameters.AddWithValue("@product_qty", id.product_qty);
            cmd.Parameters.AddWithValue("@product_desc", id.product_desc);
            cmd.Parameters.AddWithValue("@product_color", id.product_color);
            cmd.Parameters.AddWithValue("@product_size", id.product_size);
            cmd.Parameters.AddWithValue("@product_cost", id.product_cost);
            cmd.Parameters.AddWithValue("@Product_exp_date", id.Product_exp_date);
            cmd.Parameters.AddWithValue("@Product_Alergy_info", id.Product_Alergy_info);
            cmd.Parameters.AddWithValue("@Product_refrigde", id.Product_refrigde);
            cmd.Parameters.AddWithValue("@Product_Flammable", id.Product_Flammable);
            cmd.Parameters.AddWithValue("@Product_Hazard", id.Product_Hazard);
            cmd.Parameters.AddWithValue("@Product_Other", id.Product_Other);
            cmd.Parameters.AddWithValue("@Product_Min_Inv", id.Product_Min_Inv);
            cmd.Parameters.AddWithValue("@Product_Barcode", id.Product_Barcode);
            cmd.Parameters.AddWithValue("@Product_subtype", id.Product_subtype);
            cmd.Parameters.AddWithValue("@Make", id.Make);
            cmd.Parameters.AddWithValue("@Model", id.Model);
            cmd.Parameters.AddWithValue("@FEMA_Description", id.FEMA_Description);
            cmd.Parameters.AddWithValue("@Year", id.Year);
            cmd.Parameters.AddWithValue("@RFID", id.RFID);
            cmd.Parameters.AddWithValue("@GPS", id.GPS);
            cmd.Parameters.AddWithValue("@Serial_Number", id.Serial_Number);
            cmd.Parameters.AddWithValue("@Height", id.Height);
            cmd.Parameters.AddWithValue("@Length", id.Length);
            cmd.Parameters.AddWithValue("@Depth", id.Depth);
            cmd.Parameters.AddWithValue("@Weight", id.Weight);
            cmd.Parameters.AddWithValue("@OAI", id.OAI);
            cmd.Parameters.AddWithValue("@OAI_Type", id.OAI_Type);
            cmd.Parameters.AddWithValue("@Use", id.Use);
            cmd.Parameters.AddWithValue("@Brand", id.Brand);
            cmd.Parameters.AddWithValue("@Power_Supply", id.Power_Supply);
            cmd.Parameters.AddWithValue("@Gas_Type", id.Gas_Type);
            cmd.Parameters.AddWithValue("@Needs_Gas", id.Needs_Gas);
            cmd.Parameters.AddWithValue("@Needs_Electricity", id.Needs_Electricity);
            cmd.Parameters.AddWithValue("@Availability", id.Availability);
            cmd.Parameters.AddWithValue("@Datetime", id.Datetime);
            cmd.Parameters.AddWithValue("@OpenStatus", id.OpenStatus);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.product_id = rdr.GetInt32(0);
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
    public Boolean Update(products id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@product_id", id.product_id);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@product_name", id.product_name);
            cmd.Parameters.AddWithValue("@product_type", id.product_type);
            cmd.Parameters.AddWithValue("@product_qty", id.product_qty);
            cmd.Parameters.AddWithValue("@product_desc", id.product_desc);
            cmd.Parameters.AddWithValue("@product_color", id.product_color);
            cmd.Parameters.AddWithValue("@product_size", id.product_size);
            cmd.Parameters.AddWithValue("@product_cost", id.product_cost);
            cmd.Parameters.AddWithValue("@Product_exp_date", id.Product_exp_date);
            cmd.Parameters.AddWithValue("@Product_Alergy_info", id.Product_Alergy_info);
            cmd.Parameters.AddWithValue("@Product_refrigde", id.Product_refrigde);
            cmd.Parameters.AddWithValue("@Product_Flammable", id.Product_Flammable);
            cmd.Parameters.AddWithValue("@Product_Hazard", id.Product_Hazard);
            cmd.Parameters.AddWithValue("@Product_Other", id.Product_Other);
            cmd.Parameters.AddWithValue("@Product_Min_Inv", id.Product_Min_Inv);
            cmd.Parameters.AddWithValue("@Product_Barcode", id.Product_Barcode);
            cmd.Parameters.AddWithValue("@Product_subtype", id.Product_subtype);
            cmd.Parameters.AddWithValue("@Make", id.Make);
            cmd.Parameters.AddWithValue("@Model", id.Model);
            cmd.Parameters.AddWithValue("@FEMA_Description", id.FEMA_Description);
            cmd.Parameters.AddWithValue("@Year", id.Year);
            cmd.Parameters.AddWithValue("@RFID", id.RFID);
            cmd.Parameters.AddWithValue("@GPS", id.GPS);
            cmd.Parameters.AddWithValue("@Serial_Number", id.Serial_Number);
            cmd.Parameters.AddWithValue("@Height", id.Height);
            cmd.Parameters.AddWithValue("@Length", id.Length);
            cmd.Parameters.AddWithValue("@Depth", id.Depth);
            cmd.Parameters.AddWithValue("@Weight", id.Weight);
            cmd.Parameters.AddWithValue("@OAI", id.OAI);
            cmd.Parameters.AddWithValue("@OAI_Type", id.OAI_Type);
            cmd.Parameters.AddWithValue("@Use", id.Use);
            cmd.Parameters.AddWithValue("@Brand", id.Brand);
            cmd.Parameters.AddWithValue("@Power_Supply", id.Power_Supply);
            cmd.Parameters.AddWithValue("@Gas_Type", id.Gas_Type);
            cmd.Parameters.AddWithValue("@Needs_Gas", id.Needs_Gas);
            cmd.Parameters.AddWithValue("@Needs_Electricity", id.Needs_Electricity);
            cmd.Parameters.AddWithValue("@Availability", id.Availability);
            cmd.Parameters.AddWithValue("@Datetime", id.Datetime);
            cmd.Parameters.AddWithValue("@OpenStatus", id.OpenStatus);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PRODUCTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@product_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PRODUCTS_WC", con);
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




