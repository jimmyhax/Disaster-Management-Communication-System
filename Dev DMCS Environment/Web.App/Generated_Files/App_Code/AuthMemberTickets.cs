using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class AuthMemberTickets : System.Web.UI.Page
    {
        public Int64 AuthMemberTicketID
        {
            get;
            set;
        }
        public Int64 MemberID
        {
            get;
            set;
        }
        public DateTime IssueDate
        {
            get;
            set;
        }
        public DateTime Expiration
        {
            get;
            set;
        }
        public Int32 IsPersistent
        {
            get;
            set;
        }
        public String Token
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            AuthMemberTicketID = ;
            MemberID = ;
            IssueDate = DateTime.Now;
            Expiration = DateTime.Now;
            IsPersistent = 0;
            Token = "";
        }
        public AuthMemberTickets Select(int id)
        {
            AuthMemberTickets AuthMemberTickets = new AuthMemberTickets();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AUTHMEMBERTICKETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AuthMemberTicketID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        AuthMemberTickets.AuthMemberTicketID = 
                    }
                    else
                    {
                        AuthMemberTickets.AuthMemberTicketID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        AuthMemberTickets.MemberID = 
                    }
                    else
                    {
                        AuthMemberTickets.MemberID = ;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        AuthMemberTickets.IssueDate = rdr.GetDateTime(2);
                    }
                    else
                    {
                        AuthMemberTickets.IssueDate = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        AuthMemberTickets.Expiration = rdr.GetDateTime(3);
                    }
                    else
                    {
                        AuthMemberTickets.Expiration = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        AuthMemberTickets.IsPersistent = rdr.GetInt32(4);
                    }
                    else
                    {
                        AuthMemberTickets.IsPersistent = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        AuthMemberTickets.Token = rdr.GetString(5);
                    }
                    else
                    {
                        AuthMemberTickets.Token = " ";
                    }
                    }
                    else
                    {
                    AuthMemberTickets.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                AuthMemberTickets.SetColumnDefaults();
                return AuthMemberTickets;
                }
            finally
            {
                con.Close();
            }
            return AuthMemberTickets;
        }

        public AuthMemberTickets Insert(AuthMemberTickets id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_AUTHMEMBERTICKETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@IssueDate", id.IssueDate);
                cmd.Parameters.AddWithValue("@Expiration", id.Expiration);
                cmd.Parameters.AddWithValue("@IsPersistent", id.IsPersistent);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_AUTHMEMBERTICKETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@IssueDate", id.IssueDate);
                cmd.Parameters.AddWithValue("@Expiration", id.Expiration);
                cmd.Parameters.AddWithValue("@IsPersistent", id.IsPersistent);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.AuthMemberTicketID = rdr.GetInt32(0);
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
        public Boolean Update(AuthMemberTickets id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_AUTHMEMBERTICKETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AuthMemberTicketID", id.AuthMemberTicketID);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@IssueDate", id.IssueDate);
                cmd.Parameters.AddWithValue("@Expiration", id.Expiration);
                cmd.Parameters.AddWithValue("@IsPersistent", id.IsPersistent);
                cmd.Parameters.AddWithValue("@Token", id.Token);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_AUTHMEMBERTICKETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AuthMemberTicketID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AUTHMEMBERTICKETS_WC", con);
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




