using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class ActionTokens : System.Web.UI.Page
    {
        public Int64 ActionID
        {
            get;
            set;
        }
        public Int32 ActionType
        {
            get;
            set;
        }
        public String Token
        {
            get;
            set;
        }
        public String Email
        {
            get;
            set;
        }
        public DateTime Created
        {
            get;
            set;
        }
        public String ReturnURL
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            ActionID = ;
            ActionType = 0;
            Token = "";
            Email = "";
            Created = DateTime.Now;
            ReturnURL = "";
        }
        public ActionTokens Select(int id)
        {
            ActionTokens ActionTokens = new ActionTokens();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ACTIONTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        ActionTokens.ActionID = 
                    }
                    else
                    {
                        ActionTokens.ActionID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        ActionTokens.ActionType = rdr.GetInt32(1);
                    }
                    else
                    {
                        ActionTokens.ActionType = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        ActionTokens.Token = rdr.GetString(2);
                    }
                    else
                    {
                        ActionTokens.Token = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        ActionTokens.Email = rdr.GetString(3);
                    }
                    else
                    {
                        ActionTokens.Email = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        ActionTokens.Created = rdr.GetDateTime(4);
                    }
                    else
                    {
                        ActionTokens.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        ActionTokens.ReturnURL = rdr.GetString(5);
                    }
                    else
                    {
                        ActionTokens.ReturnURL = " ";
                    }
                    }
                    else
                    {
                    ActionTokens.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                ActionTokens.SetColumnDefaults();
                return ActionTokens;
                }
            finally
            {
                con.Close();
            }
            return ActionTokens;
        }

        public ActionTokens Insert(ActionTokens id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ACTIONTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionType", id.ActionType);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@ReturnURL", id.ReturnURL);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ACTIONTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionType", id.ActionType);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@ReturnURL", id.ReturnURL);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.ActionID = rdr.GetInt32(0);
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
        public Boolean Update(ActionTokens id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ACTIONTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionID", id.ActionID);
                cmd.Parameters.AddWithValue("@ActionType", id.ActionType);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@ReturnURL", id.ReturnURL);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ACTIONTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ACTIONTOKENS_WC", con);
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




