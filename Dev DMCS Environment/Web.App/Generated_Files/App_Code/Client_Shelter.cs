using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Client_Shelter : System.Web.UI.Page
    {
        public Int32 Client_Shelter_ID
        {
            get;
            set;
        }
        public Int32 Shelter_ID
        {
            get;
            set;
        }
        public Int32 Client_ID
        {
            get;
            set;
        }
        public String Current_address
        {
            get;
            set;
        }
        public String Current_State
        {
            get;
            set;
        }
        public String Current_City
        {
            get;
            set;
        }
        public Int32 Current_Zip
        {
            get;
            set;
        }
        public String Client_registration_status
        {
            get;
            set;
        }
        public Int32 Household_size
        {
            get;
            set;
        }
        public String Shelter_supplies
        {
            get;
            set;
        }
        public String Shelter_occupancy_current
        {
            get;
            set;
        }
        public String New_household_registered
        {
            get;
            set;
        }
        public String New_Shelter_address
        {
            get;
            set;
        }
        public String New_Shelter_city
        {
            get;
            set;
        }
        public String New_Shelter_State
        {
            get;
            set;
        }
        public Int32 New_Shelter_Zip
        {
            get;
            set;
        }
        public Int32 New_Contact_Number
        {
            get;
            set;
        }
        public String Current_household_members_safe
        {
            get;
            set;
        }
        public DateTime CheckIn_Date
        {
            get;
            set;
        }
        public DateTime CheckOut_Date
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Client_Shelter_ID = 0;
            Shelter_ID = 0;
            Client_ID = 0;
            Current_address = "";
            Current_State = "";
            Current_City = "";
            Current_Zip = 0;
            Client_registration_status = "";
            Household_size = 0;
            Shelter_supplies = "";
            Shelter_occupancy_current = "";
            New_household_registered = "";
            New_Shelter_address = "";
            New_Shelter_city = "";
            New_Shelter_State = "";
            New_Shelter_Zip = 0;
            New_Contact_Number = 0;
            Current_household_members_safe = "";
            CheckIn_Date = DateTime.Now;
            CheckOut_Date = DateTime.Now;
        }
        public Client_Shelter Select(int id)
        {
            Client_Shelter Client_Shelter = new Client_Shelter();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CLIENT_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Client_Shelter_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Client_Shelter.Client_Shelter_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Client_Shelter.Client_Shelter_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Client_Shelter.Shelter_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Client_Shelter.Shelter_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Client_Shelter.Client_ID = rdr.GetInt32(2);
                    }
                    else
                    {
                        Client_Shelter.Client_ID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Client_Shelter.Current_address = rdr.GetString(3);
                    }
                    else
                    {
                        Client_Shelter.Current_address = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Client_Shelter.Current_State = rdr.GetString(4);
                    }
                    else
                    {
                        Client_Shelter.Current_State = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Client_Shelter.Current_City = rdr.GetString(5);
                    }
                    else
                    {
                        Client_Shelter.Current_City = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Client_Shelter.Current_Zip = rdr.GetInt32(6);
                    }
                    else
                    {
                        Client_Shelter.Current_Zip = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        Client_Shelter.Client_registration_status = rdr.GetString(7);
                    }
                    else
                    {
                        Client_Shelter.Client_registration_status = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        Client_Shelter.Household_size = rdr.GetInt32(8);
                    }
                    else
                    {
                        Client_Shelter.Household_size = 0;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        Client_Shelter.Shelter_supplies = rdr.GetString(9);
                    }
                    else
                    {
                        Client_Shelter.Shelter_supplies = " ";
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        Client_Shelter.Shelter_occupancy_current = rdr.GetString(10);
                    }
                    else
                    {
                        Client_Shelter.Shelter_occupancy_current = " ";
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        Client_Shelter.New_household_registered = rdr.GetString(11);
                    }
                    else
                    {
                        Client_Shelter.New_household_registered = " ";
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        Client_Shelter.New_Shelter_address = rdr.GetString(12);
                    }
                    else
                    {
                        Client_Shelter.New_Shelter_address = " ";
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        Client_Shelter.New_Shelter_city = rdr.GetString(13);
                    }
                    else
                    {
                        Client_Shelter.New_Shelter_city = " ";
                    }
                    if (!rdr.IsDBNull(14))
                    {
                        Client_Shelter.New_Shelter_State = rdr.GetString(14);
                    }
                    else
                    {
                        Client_Shelter.New_Shelter_State = " ";
                    }
                    if (!rdr.IsDBNull(15))
                    {
                        Client_Shelter.New_Shelter_Zip = rdr.GetInt32(15);
                    }
                    else
                    {
                        Client_Shelter.New_Shelter_Zip = 0;
                    }
                    if (!rdr.IsDBNull(16))
                    {
                        Client_Shelter.New_Contact_Number = rdr.GetInt32(16);
                    }
                    else
                    {
                        Client_Shelter.New_Contact_Number = 0;
                    }
                    if (!rdr.IsDBNull(17))
                    {
                        Client_Shelter.Current_household_members_safe = rdr.GetString(17);
                    }
                    else
                    {
                        Client_Shelter.Current_household_members_safe = " ";
                    }
                    if (!rdr.IsDBNull(18))
                    {
                        Client_Shelter.CheckIn_Date = rdr.GetDateTime(18);
                    }
                    else
                    {
                        Client_Shelter.CheckIn_Date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(19))
                    {
                        Client_Shelter.CheckOut_Date = rdr.GetDateTime(19);
                    }
                    else
                    {
                        Client_Shelter.CheckOut_Date = DateTime.Now;
                    }
                    }
                    else
                    {
                    Client_Shelter.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Client_Shelter.SetColumnDefaults();
                return Client_Shelter;
                }
            finally
            {
                con.Close();
            }
            return Client_Shelter;
        }

        public Client_Shelter Insert(Client_Shelter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CLIENT_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
                cmd.Parameters.AddWithValue("@Client_ID", id.Client_ID);
                cmd.Parameters.AddWithValue("@Current_address", id.Current_address);
                cmd.Parameters.AddWithValue("@Current_State", id.Current_State);
                cmd.Parameters.AddWithValue("@Current_City", id.Current_City);
                cmd.Parameters.AddWithValue("@Current_Zip", id.Current_Zip);
                cmd.Parameters.AddWithValue("@Client_registration_status", id.Client_registration_status);
                cmd.Parameters.AddWithValue("@Household_size", id.Household_size);
                cmd.Parameters.AddWithValue("@Shelter_supplies", id.Shelter_supplies);
                cmd.Parameters.AddWithValue("@Shelter_occupancy_current", id.Shelter_occupancy_current);
                cmd.Parameters.AddWithValue("@New_household_registered", id.New_household_registered);
                cmd.Parameters.AddWithValue("@New_Shelter_address", id.New_Shelter_address);
                cmd.Parameters.AddWithValue("@New_Shelter_city", id.New_Shelter_city);
                cmd.Parameters.AddWithValue("@New_Shelter_State", id.New_Shelter_State);
                cmd.Parameters.AddWithValue("@New_Shelter_Zip", id.New_Shelter_Zip);
                cmd.Parameters.AddWithValue("@New_Contact_Number", id.New_Contact_Number);
                cmd.Parameters.AddWithValue("@Current_household_members_safe", id.Current_household_members_safe);
                cmd.Parameters.AddWithValue("@CheckIn_Date", id.CheckIn_Date);
                cmd.Parameters.AddWithValue("@CheckOut_Date", id.CheckOut_Date);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_CLIENT_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
                cmd.Parameters.AddWithValue("@Client_ID", id.Client_ID);
                cmd.Parameters.AddWithValue("@Current_address", id.Current_address);
                cmd.Parameters.AddWithValue("@Current_State", id.Current_State);
                cmd.Parameters.AddWithValue("@Current_City", id.Current_City);
                cmd.Parameters.AddWithValue("@Current_Zip", id.Current_Zip);
                cmd.Parameters.AddWithValue("@Client_registration_status", id.Client_registration_status);
                cmd.Parameters.AddWithValue("@Household_size", id.Household_size);
                cmd.Parameters.AddWithValue("@Shelter_supplies", id.Shelter_supplies);
                cmd.Parameters.AddWithValue("@Shelter_occupancy_current", id.Shelter_occupancy_current);
                cmd.Parameters.AddWithValue("@New_household_registered", id.New_household_registered);
                cmd.Parameters.AddWithValue("@New_Shelter_address", id.New_Shelter_address);
                cmd.Parameters.AddWithValue("@New_Shelter_city", id.New_Shelter_city);
                cmd.Parameters.AddWithValue("@New_Shelter_State", id.New_Shelter_State);
                cmd.Parameters.AddWithValue("@New_Shelter_Zip", id.New_Shelter_Zip);
                cmd.Parameters.AddWithValue("@New_Contact_Number", id.New_Contact_Number);
                cmd.Parameters.AddWithValue("@Current_household_members_safe", id.Current_household_members_safe);
                cmd.Parameters.AddWithValue("@CheckIn_Date", id.CheckIn_Date);
                cmd.Parameters.AddWithValue("@CheckOut_Date", id.CheckOut_Date);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Client_Shelter_ID = rdr.GetInt32(0);
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
        public Boolean Update(Client_Shelter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CLIENT_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Client_Shelter_ID", id.Client_Shelter_ID);
                cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
                cmd.Parameters.AddWithValue("@Client_ID", id.Client_ID);
                cmd.Parameters.AddWithValue("@Current_address", id.Current_address);
                cmd.Parameters.AddWithValue("@Current_State", id.Current_State);
                cmd.Parameters.AddWithValue("@Current_City", id.Current_City);
                cmd.Parameters.AddWithValue("@Current_Zip", id.Current_Zip);
                cmd.Parameters.AddWithValue("@Client_registration_status", id.Client_registration_status);
                cmd.Parameters.AddWithValue("@Household_size", id.Household_size);
                cmd.Parameters.AddWithValue("@Shelter_supplies", id.Shelter_supplies);
                cmd.Parameters.AddWithValue("@Shelter_occupancy_current", id.Shelter_occupancy_current);
                cmd.Parameters.AddWithValue("@New_household_registered", id.New_household_registered);
                cmd.Parameters.AddWithValue("@New_Shelter_address", id.New_Shelter_address);
                cmd.Parameters.AddWithValue("@New_Shelter_city", id.New_Shelter_city);
                cmd.Parameters.AddWithValue("@New_Shelter_State", id.New_Shelter_State);
                cmd.Parameters.AddWithValue("@New_Shelter_Zip", id.New_Shelter_Zip);
                cmd.Parameters.AddWithValue("@New_Contact_Number", id.New_Contact_Number);
                cmd.Parameters.AddWithValue("@Current_household_members_safe", id.Current_household_members_safe);
                cmd.Parameters.AddWithValue("@CheckIn_Date", id.CheckIn_Date);
                cmd.Parameters.AddWithValue("@CheckOut_Date", id.CheckOut_Date);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CLIENT_SHELTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Client_Shelter_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CLIENT_SHELTER_WC", con);
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




