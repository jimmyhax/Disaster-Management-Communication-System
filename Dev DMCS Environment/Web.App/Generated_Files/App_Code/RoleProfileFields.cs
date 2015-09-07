using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class RoleProfileFields : System.Web.UI.Page
    {
        public Int32 RoleFieldID
        {
            get;
            set;
        }
        public Int64 RoleID
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
            RoleFieldID = 0;
            RoleID = ;
            ProfileFieldID = 0;
        }
        public RoleProfileFields Select(int id)
        {
            RoleProfileFields RoleProfileFields = new RoleProfileFields();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ROLEPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleFieldID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        RoleProfileFields.RoleFieldID = rdr.GetInt32(0);
                    }
                    else
                    {
                        RoleProfileFields.RoleFieldID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        RoleProfileFields.RoleID = 
                    }
                    else
                    {
                        RoleProfileFields.RoleID = ;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        RoleProfileFields.ProfileFieldID = rdr.GetInt32(2);
                    }
                    else
                    {
                        RoleProfileFields.ProfileFieldID = 0;
                    }
                    }
                    else
                    {
                    RoleProfileFields.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                RoleProfileFields.SetColumnDefaults();
                return RoleProfileFields;
                }
            finally
            {
                con.Close();
            }
            return RoleProfileFields;
        }

        public RoleProfileFields Insert(RoleProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ROLEPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleID", id.RoleID);
                cmd.Parameters.AddWithValue("@ProfileFieldID", id.ProfileFieldID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ROLEPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleID", id.RoleID);
                cmd.Parameters.AddWithValue("@ProfileFieldID", id.ProfileFieldID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.RoleFieldID = rdr.GetInt32(0);
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
        public Boolean Update(RoleProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ROLEPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleFieldID", id.RoleFieldID);
                cmd.Parameters.AddWithValue("@RoleID", id.RoleID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ROLEPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleFieldID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ROLEPROFILEFIELDS_WC", con);
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




