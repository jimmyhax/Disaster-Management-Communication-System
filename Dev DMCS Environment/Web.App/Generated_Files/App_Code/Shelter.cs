using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Shelter : System.Web.UI.Page
    {
        public Int32 Shelter_ID
        {
            get;
            set;
        }
        public Int32 Address_ID
        {
            get;
            set;
        }
        public String Shelter_Type
        {
            get;
            set;
        }
        public Int32 Max_Capacity
        {
            get;
            set;
        }
        public String AllowsPets
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Shelter_ID = 0;
            Address_ID = 0;
            Shelter_Type = "";
            Max_Capacity = 0;
            AllowsPets = "";
        }
        public Shelter Select(int id)
        {
            Shelter Shelter = new Shelter();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Shelter_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Shelter.Shelter_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Shelter.Shelter_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Shelter.Address_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Shelter.Address_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Shelter.Shelter_Type = rdr.GetString(2);
                    }
                    else
                    {
                        Shelter.Shelter_Type = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Shelter.Max_Capacity = rdr.GetInt32(3);
                    }
                    else
                    {
                        Shelter.Max_Capacity = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Shelter.AllowsPets = rdr.GetString(4);
                    }
                    else
                    {
                        Shelter.AllowsPets = " ";
                    }
                    }
                    else
                    {
                    Shelter.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Shelter.SetColumnDefaults();
                return Shelter;
                }
            finally
            {
                con.Close();
            }
            return Shelter;
        }

        public Shelter Insert(Shelter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Address_ID", id.Address_ID);
                cmd.Parameters.AddWithValue("@Shelter_Type", id.Shelter_Type);
                cmd.Parameters.AddWithValue("@Max_Capacity", id.Max_Capacity);
                cmd.Parameters.AddWithValue("@AllowsPets", id.AllowsPets);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Address_ID", id.Address_ID);
                cmd.Parameters.AddWithValue("@Shelter_Type", id.Shelter_Type);
                cmd.Parameters.AddWithValue("@Max_Capacity", id.Max_Capacity);
                cmd.Parameters.AddWithValue("@AllowsPets", id.AllowsPets);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Shelter_ID = rdr.GetInt32(0);
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
        public Boolean Update(Shelter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
                cmd.Parameters.AddWithValue("@Address_ID", id.Address_ID);
                cmd.Parameters.AddWithValue("@Shelter_Type", id.Shelter_Type);
                cmd.Parameters.AddWithValue("@Max_Capacity", id.Max_Capacity);
                cmd.Parameters.AddWithValue("@AllowsPets", id.AllowsPets);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Shelter_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SHELTER_WC", con);
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




