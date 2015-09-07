using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class agency : System.Web.UI.Page
    {
        public Int32 agency_id
        {
            get;
            set;
        }
        public Int32 address_id
        {
            get;
            set;
        }
        public String agency_name
        {
            get;
            set;
        }
        public String primary_fName
        {
            get;
            set;
        }
        public String primary_lName
        {
            get;
            set;
        }
        public String primary_phone
        {
            get;
            set;
        }
        public String sec_fName
        {
            get;
            set;
        }
        public String sec_lName
        {
            get;
            set;
        }
        public String sec_phone
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            agency_id = 0;
            address_id = 0;
            agency_name = "";
            primary_fName = "";
            primary_lName = "";
            primary_phone = "";
            sec_fName = "";
            sec_lName = "";
            sec_phone = "";
        }
        public agency Select(int id)
        {
            agency agency = new agency();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AGENCY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@agency_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        agency.agency_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        agency.agency_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        agency.address_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        agency.address_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        agency.agency_name = rdr.GetString(2);
                    }
                    else
                    {
                        agency.agency_name = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        agency.primary_fName = rdr.GetString(3);
                    }
                    else
                    {
                        agency.primary_fName = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        agency.primary_lName = rdr.GetString(4);
                    }
                    else
                    {
                        agency.primary_lName = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        agency.primary_phone = rdr.GetString(5);
                    }
                    else
                    {
                        agency.primary_phone = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        agency.sec_fName = rdr.GetString(6);
                    }
                    else
                    {
                        agency.sec_fName = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        agency.sec_lName = rdr.GetString(7);
                    }
                    else
                    {
                        agency.sec_lName = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        agency.sec_phone = rdr.GetString(8);
                    }
                    else
                    {
                        agency.sec_phone = " ";
                    }
                    }
                    else
                    {
                    agency.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                agency.SetColumnDefaults();
                return agency;
                }
            finally
            {
                con.Close();
            }
            return agency;
        }

        public agency Insert(agency id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_AGENCY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@agency_name", id.agency_name);
                cmd.Parameters.AddWithValue("@primary_fName", id.primary_fName);
                cmd.Parameters.AddWithValue("@primary_lName", id.primary_lName);
                cmd.Parameters.AddWithValue("@primary_phone", id.primary_phone);
                cmd.Parameters.AddWithValue("@sec_fName", id.sec_fName);
                cmd.Parameters.AddWithValue("@sec_lName", id.sec_lName);
                cmd.Parameters.AddWithValue("@sec_phone", id.sec_phone);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_AGENCY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@agency_name", id.agency_name);
                cmd.Parameters.AddWithValue("@primary_fName", id.primary_fName);
                cmd.Parameters.AddWithValue("@primary_lName", id.primary_lName);
                cmd.Parameters.AddWithValue("@primary_phone", id.primary_phone);
                cmd.Parameters.AddWithValue("@sec_fName", id.sec_fName);
                cmd.Parameters.AddWithValue("@sec_lName", id.sec_lName);
                cmd.Parameters.AddWithValue("@sec_phone", id.sec_phone);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.agency_id = rdr.GetInt32(0);
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
        public Boolean Update(agency id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_AGENCY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@agency_name", id.agency_name);
                cmd.Parameters.AddWithValue("@primary_fName", id.primary_fName);
                cmd.Parameters.AddWithValue("@primary_lName", id.primary_lName);
                cmd.Parameters.AddWithValue("@primary_phone", id.primary_phone);
                cmd.Parameters.AddWithValue("@sec_fName", id.sec_fName);
                cmd.Parameters.AddWithValue("@sec_lName", id.sec_lName);
                cmd.Parameters.AddWithValue("@sec_phone", id.sec_phone);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_AGENCY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@agency_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AGENCY_WC", con);
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




