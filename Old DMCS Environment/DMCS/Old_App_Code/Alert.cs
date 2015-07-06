using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
using System.Collections;
namespace DMCS
{
    public class Alert
    {
        public Int32 Alert_ID
        {
            get;
            set;
        }
        public String Alert_Message
        {
            get;
            set;
        }
        public String Alert_Type
        {
            get;
            set;
        }
        public DateTime Date
        {
            get;
            set;
        }
        public Int32 Person_ID
        {
            get;
            set;
        }


        public void SetColumnDefaults()
        {
            Alert_ID = 0;
            Alert_Message = " ";
            Alert_Type = " ";
            Date = DateTime.Now;
            Person_ID = 0;
        }
        public Alert Select(int id)
        {
            Alert Alert = new Alert();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ALERT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Alert_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Alert.Alert_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Alert.Alert_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Alert.Alert_Message = rdr.GetString(1);
                    }
                    else
                    {
                        Alert.Alert_Message = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Alert.Alert_Type = rdr.GetString(2);
                    }
                    else
                    {
                        Alert.Alert_Type = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Alert.Date = rdr.GetDateTime(3);
                    }
                    else
                    {
                        Alert.Date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Alert.Person_ID = rdr.GetInt32(4);
                    }
                    else
                    {
                        Alert.Person_ID = 0;
                    }
                }
                else
                {
                    Alert.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
                Alert.SetColumnDefaults();
                return Alert;
            }
            finally
            {
                con.Close();
            }
            return Alert;
        }

        public Alert Insert(Alert id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ALERT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Alert_Message", id.Alert_Message);
                cmd.Parameters.AddWithValue("@Alert_Type", id.Alert_Type);
                cmd.Parameters.AddWithValue("@Date", id.Date);
                cmd.Parameters.AddWithValue("@Person_ID", id.Person_ID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ALERT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Alert_Message", id.Alert_Message);
                cmd.Parameters.AddWithValue("@Alert_Type", id.Alert_Type);
                cmd.Parameters.AddWithValue("@Date", id.Date);
                cmd.Parameters.AddWithValue("@Person_ID", id.Person_ID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Alert_ID = rdr.GetInt32(0);
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
        public Boolean Update(Alert id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ALERT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Alert_ID", id.Alert_ID);
                cmd.Parameters.AddWithValue("@Alert_Message", id.Alert_Message);
                cmd.Parameters.AddWithValue("@Alert_Type", id.Alert_Type);
                cmd.Parameters.AddWithValue("@Date", id.Date);
                cmd.Parameters.AddWithValue("@Person_ID", id.Person_ID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ALERT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Alert_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ALERT_WC", con);
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

        public DataTable Send_Text_Alert(string whereclause)
        {
            DataTable alrows = new DataTable();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("[SP_DMCS_SELECT_COUNTY_ALERT_PHONE_NUMBERS_WC]", con);
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

    public class Email_To_Text_Provider
    {
        public string[] Email_List()
        {
            List<string> Array = new List<string>();
            //verison
            Array.Add("@vtext.com");
            //Nextel
            Array.Add("@messaging.nextel.com");
            //US Cellular
            Array.Add("@email.uscc.net");
            //T-mobile
            Array.Add("@tmomail.net");
            //Sprint
            Array.Add("@messaging.sprintpcs.com");
            //Tracfone
            Array.Add("@txt.att.net");
            
            string[] Arr = Array.ToArray();
            return Arr;
        }
    }
}




