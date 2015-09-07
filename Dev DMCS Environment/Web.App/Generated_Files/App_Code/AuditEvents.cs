using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class AuditEvents : System.Web.UI.Page
    {
        public Int64 EventID
        {
            get;
            set;
        }
        public Int32 EventSource
        {
            get;
            set;
        }
        public Int32 EventType
        {
            get;
            set;
        }
        public String Description
        {
            get;
            set;
        }
        public String MemberEmail
        {
            get;
            set;
        }
        public No Type Details
        {
            get;
            set;
        }
        public String IPAddress
        {
            get;
            set;
        }
        public DateTime Created
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            EventID = ;
            EventSource = 0;
            EventType = 0;
            Description = "";
            MemberEmail = "";
            Details = ;
            IPAddress = "";
            Created = DateTime.Now;
        }
        public AuditEvents Select(int id)
        {
            AuditEvents AuditEvents = new AuditEvents();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AUDITEVENTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EventID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        AuditEvents.EventID = 
                    }
                    else
                    {
                        AuditEvents.EventID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        AuditEvents.EventSource = rdr.GetInt32(1);
                    }
                    else
                    {
                        AuditEvents.EventSource = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        AuditEvents.EventType = rdr.GetInt32(2);
                    }
                    else
                    {
                        AuditEvents.EventType = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        AuditEvents.Description = rdr.GetString(3);
                    }
                    else
                    {
                        AuditEvents.Description = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        AuditEvents.MemberEmail = rdr.GetString(4);
                    }
                    else
                    {
                        AuditEvents.MemberEmail = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        AuditEvents.Details = 
                    }
                    else
                    {
                        AuditEvents.Details = ;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        AuditEvents.IPAddress = rdr.GetString(6);
                    }
                    else
                    {
                        AuditEvents.IPAddress = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        AuditEvents.Created = rdr.GetDateTime(7);
                    }
                    else
                    {
                        AuditEvents.Created = DateTime.Now;
                    }
                    }
                    else
                    {
                    AuditEvents.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                AuditEvents.SetColumnDefaults();
                return AuditEvents;
                }
            finally
            {
                con.Close();
            }
            return AuditEvents;
        }

        public AuditEvents Insert(AuditEvents id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_AUDITEVENTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EventSource", id.EventSource);
                cmd.Parameters.AddWithValue("@EventType", id.EventType);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.Parameters.AddWithValue("@MemberEmail", id.MemberEmail);
                cmd.Parameters.AddWithValue("@Details", id.Details);
                cmd.Parameters.AddWithValue("@IPAddress", id.IPAddress);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_AUDITEVENTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EventSource", id.EventSource);
                cmd.Parameters.AddWithValue("@EventType", id.EventType);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.Parameters.AddWithValue("@MemberEmail", id.MemberEmail);
                cmd.Parameters.AddWithValue("@Details", id.Details);
                cmd.Parameters.AddWithValue("@IPAddress", id.IPAddress);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.EventID = rdr.GetInt32(0);
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
        public Boolean Update(AuditEvents id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_AUDITEVENTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EventID", id.EventID);
                cmd.Parameters.AddWithValue("@EventSource", id.EventSource);
                cmd.Parameters.AddWithValue("@EventType", id.EventType);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.Parameters.AddWithValue("@MemberEmail", id.MemberEmail);
                cmd.Parameters.AddWithValue("@Details", id.Details);
                cmd.Parameters.AddWithValue("@IPAddress", id.IPAddress);
                cmd.Parameters.AddWithValue("@Created", id.Created);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_AUDITEVENTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EventID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AUDITEVENTS_WC", con);
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




