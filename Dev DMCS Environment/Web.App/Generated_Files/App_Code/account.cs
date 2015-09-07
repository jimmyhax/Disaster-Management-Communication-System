using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class account : System.Web.UI.Page
    {
        public Int32 Account_ID
        {
            get;
            set;
        }
        public Int32 Bank_ID
        {
            get;
            set;
        }
        public String Account_Num
        {
            get;
            set;
        }
        public String Type
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Account_ID = 0;
            Bank_ID = 0;
            Account_Num = "";
            Type = "";
        }
        public account Select(int id)
        {
            account account = new account();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ACCOUNT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Account_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        account.Account_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        account.Account_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        account.Bank_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        account.Bank_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        account.Account_Num = rdr.GetString(2);
                    }
                    else
                    {
                        account.Account_Num = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        account.Type = rdr.GetString(3);
                    }
                    else
                    {
                        account.Type = " ";
                    }
                    }
                    else
                    {
                    account.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                account.SetColumnDefaults();
                return account;
                }
            finally
            {
                con.Close();
            }
            return account;
        }

        public account Insert(account id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ACCOUNT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Bank_ID", id.Bank_ID);
                cmd.Parameters.AddWithValue("@Account_Num", id.Account_Num);
                cmd.Parameters.AddWithValue("@Type", id.Type);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ACCOUNT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Bank_ID", id.Bank_ID);
                cmd.Parameters.AddWithValue("@Account_Num", id.Account_Num);
                cmd.Parameters.AddWithValue("@Type", id.Type);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Account_ID = rdr.GetInt32(0);
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
        public Boolean Update(account id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ACCOUNT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Account_ID", id.Account_ID);
                cmd.Parameters.AddWithValue("@Bank_ID", id.Bank_ID);
                cmd.Parameters.AddWithValue("@Account_Num", id.Account_Num);
                cmd.Parameters.AddWithValue("@Type", id.Type);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ACCOUNT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Account_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ACCOUNT_WC", con);
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




