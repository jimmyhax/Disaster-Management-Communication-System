using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Domains : System.Web.UI.Page
    {
        public Int32 DomainID
        {
            get;
            set;
        }
        public String Name
        {
            get;
            set;
        }
        public String Description
        {
            get;
            set;
        }
        public DateTime Created
        {
            get;
            set;
        }
        public DateTime Modified
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            DomainID = 0;
            Name = "";
            Description = "";
            Created = DateTime.Now;
            Modified = DateTime.Now;
        }
        public Domains Select(int id)
        {
            Domains Domains = new Domains();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Domains.DomainID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Domains.DomainID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Domains.Name = rdr.GetString(1);
                    }
                    else
                    {
                        Domains.Name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Domains.Description = rdr.GetString(2);
                    }
                    else
                    {
                        Domains.Description = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Domains.Created = rdr.GetDateTime(3);
                    }
                    else
                    {
                        Domains.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Domains.Modified = rdr.GetDateTime(4);
                    }
                    else
                    {
                        Domains.Modified = DateTime.Now;
                    }
                    }
                    else
                    {
                    Domains.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Domains.SetColumnDefaults();
                return Domains;
                }
            finally
            {
                con.Close();
            }
            return Domains;
        }

        public Domains Insert(Domains id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_DOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.DomainID = rdr.GetInt32(0);
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
        public Boolean Update(Domains id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainID", id.DomainID);
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DOMAINS_WC", con);
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




