using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class MemberDomains : System.Web.UI.Page
    {
        public Int32 MemberDomainID
        {
            get;
            set;
        }
        public Int64 MemberID
        {
            get;
            set;
        }
        public Int32 DomainID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            MemberDomainID = 0;
            MemberID = ;
            DomainID = 0;
        }
        public MemberDomains Select(int id)
        {
            MemberDomains MemberDomains = new MemberDomains();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERDOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberDomainID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        MemberDomains.MemberDomainID = rdr.GetInt32(0);
                    }
                    else
                    {
                        MemberDomains.MemberDomainID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        MemberDomains.MemberID = 
                    }
                    else
                    {
                        MemberDomains.MemberID = ;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        MemberDomains.DomainID = rdr.GetInt32(2);
                    }
                    else
                    {
                        MemberDomains.DomainID = 0;
                    }
                    }
                    else
                    {
                    MemberDomains.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                MemberDomains.SetColumnDefaults();
                return MemberDomains;
                }
            finally
            {
                con.Close();
            }
            return MemberDomains;
        }

        public MemberDomains Insert(MemberDomains id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEMBERDOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@DomainID", id.DomainID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEMBERDOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@DomainID", id.DomainID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.MemberDomainID = rdr.GetInt32(0);
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
        public Boolean Update(MemberDomains id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEMBERDOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberDomainID", id.MemberDomainID);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@DomainID", id.DomainID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEMBERDOMAINS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberDomainID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERDOMAINS_WC", con);
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




