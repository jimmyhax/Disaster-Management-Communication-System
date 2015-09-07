using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class DomainProfileFields : System.Web.UI.Page
    {
        public Int32 DomainFieldID
        {
            get;
            set;
        }
        public Int32 DomainID
        {
            get;
            set;
        }
        public Int32 ProfileFieldID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            DomainFieldID = 0;
            DomainID = 0;
            ProfileFieldID = 0;
        }
        public DomainProfileFields Select(int id)
        {
            DomainProfileFields DomainProfileFields = new DomainProfileFields();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DOMAINPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainFieldID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        DomainProfileFields.DomainFieldID = rdr.GetInt32(0);
                    }
                    else
                    {
                        DomainProfileFields.DomainFieldID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        DomainProfileFields.DomainID = rdr.GetInt32(1);
                    }
                    else
                    {
                        DomainProfileFields.DomainID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        DomainProfileFields.ProfileFieldID = rdr.GetInt32(2);
                    }
                    else
                    {
                        DomainProfileFields.ProfileFieldID = 0;
                    }
                    }
                    else
                    {
                    DomainProfileFields.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                DomainProfileFields.SetColumnDefaults();
                return DomainProfileFields;
                }
            finally
            {
                con.Close();
            }
            return DomainProfileFields;
        }

        public DomainProfileFields Insert(DomainProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DOMAINPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainID", id.DomainID);
                cmd.Parameters.AddWithValue("@ProfileFieldID", id.ProfileFieldID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_DOMAINPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainID", id.DomainID);
                cmd.Parameters.AddWithValue("@ProfileFieldID", id.ProfileFieldID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.DomainFieldID = rdr.GetInt32(0);
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
        public Boolean Update(DomainProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DOMAINPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainFieldID", id.DomainFieldID);
                cmd.Parameters.AddWithValue("@DomainID", id.DomainID);
                cmd.Parameters.AddWithValue("@ProfileFieldID", id.ProfileFieldID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DOMAINPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DomainFieldID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DOMAINPROFILEFIELDS_WC", con);
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




