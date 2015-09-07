using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class AuditEventSources : System.Web.UI.Page
    {
        public Int32 SourceID
        {
            get;
            set;
        }
        public String Description
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            SourceID = 0;
            Description = "";
        }
        public AuditEventSources Select(int id)
        {
            AuditEventSources AuditEventSources = new AuditEventSources();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AUDITEVENTSOURCES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SourceID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        AuditEventSources.SourceID = rdr.GetInt32(0);
                    }
                    else
                    {
                        AuditEventSources.SourceID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        AuditEventSources.Description = rdr.GetString(1);
                    }
                    else
                    {
                        AuditEventSources.Description = " ";
                    }
                    }
                    else
                    {
                    AuditEventSources.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                AuditEventSources.SetColumnDefaults();
                return AuditEventSources;
                }
            finally
            {
                con.Close();
            }
            return AuditEventSources;
        }

        public AuditEventSources Insert(AuditEventSources id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_AUDITEVENTSOURCES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SourceID", id.SourceID);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_AUDITEVENTSOURCES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Description", id.Description);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.SourceID = rdr.GetInt32(0);
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
        public Boolean Update(AuditEventSources id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_AUDITEVENTSOURCES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SourceID", id.SourceID);
                cmd.Parameters.AddWithValue("@Description", id.Description);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_AUDITEVENTSOURCES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SourceID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_AUDITEVENTSOURCES_WC", con);
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




