using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
    class script_generator
{
    public Int32 result
    {
        get;
        set;
    }



    public void SetColumnDefaults()
    {
        result = 0;
    }
    public script_generator Select(string table_name, string column_name)
    {
        script_generator script_generator = new script_generator();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("[SP_SCRIPT_GENERATOR_SELECT_PERCISION]", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@table_name", table_name);
            cmd.Parameters.AddWithValue("@column_name", column_name);

            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    script_generator.result = rdr.GetInt32(0);
                }
                else
                {
                    script_generator.result = 0;
                }
            }

            else
            {
                script_generator.SetColumnDefaults();
            }
        }
        catch (Exception ex)
        {
            script_generator.SetColumnDefaults();
            return script_generator;
        }
        finally
        {
            con.Close();
        }
        return script_generator;
    }
    public script_generator Check_Identity(string table_name)
    {
        script_generator script_generator = new script_generator();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("[SP_SCRIPT_GENERATOR_SELECT_TABLE_IDENTITY]", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@table_name", table_name);

            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();

                if (!rdr.IsDBNull(0))
                {
                    script_generator.result = rdr.GetInt32(0);
                }
                else
                {
                    script_generator.result = 100;
                }
            }

            else
            {
                script_generator.SetColumnDefaults();
            }
        }
        catch (Exception ex)
        {
            script_generator.SetColumnDefaults();
            return script_generator;
        }
        finally
        {
            con.Close();
        }
        return script_generator;
    }

}

}


// Thank you Jim. You are SOO00OOoo Awesome!

