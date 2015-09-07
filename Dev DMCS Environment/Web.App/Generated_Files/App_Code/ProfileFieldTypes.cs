using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class ProfileFieldTypes : System.Web.UI.Page
    {
        public Int32 FieldTypeID
        {
            get;
            set;
        }
        public String FieldTypeName
        {
            get;
            set;
        }
        public String FieldTypeDescription
        {
            get;
            set;
        }
        public Int32 FieldTypeSize
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            FieldTypeID = 0;
            FieldTypeName = "";
            FieldTypeDescription = "";
            FieldTypeSize = 0;
        }
        public ProfileFieldTypes Select(int id)
        {
            ProfileFieldTypes ProfileFieldTypes = new ProfileFieldTypes();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROFILEFIELDTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldTypeID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        ProfileFieldTypes.FieldTypeID = rdr.GetInt32(0);
                    }
                    else
                    {
                        ProfileFieldTypes.FieldTypeID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        ProfileFieldTypes.FieldTypeName = rdr.GetString(1);
                    }
                    else
                    {
                        ProfileFieldTypes.FieldTypeName = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        ProfileFieldTypes.FieldTypeDescription = rdr.GetString(2);
                    }
                    else
                    {
                        ProfileFieldTypes.FieldTypeDescription = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        ProfileFieldTypes.FieldTypeSize = rdr.GetInt32(3);
                    }
                    else
                    {
                        ProfileFieldTypes.FieldTypeSize = 0;
                    }
                    }
                    else
                    {
                    ProfileFieldTypes.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                ProfileFieldTypes.SetColumnDefaults();
                return ProfileFieldTypes;
                }
            finally
            {
                con.Close();
            }
            return ProfileFieldTypes;
        }

        public ProfileFieldTypes Insert(ProfileFieldTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PROFILEFIELDTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldTypeID", id.FieldTypeID);
                cmd.Parameters.AddWithValue("@FieldTypeName", id.FieldTypeName);
                cmd.Parameters.AddWithValue("@FieldTypeDescription", id.FieldTypeDescription);
                cmd.Parameters.AddWithValue("@FieldTypeSize", id.FieldTypeSize);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PROFILEFIELDTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldTypeName", id.FieldTypeName);
                cmd.Parameters.AddWithValue("@FieldTypeDescription", id.FieldTypeDescription);
                cmd.Parameters.AddWithValue("@FieldTypeSize", id.FieldTypeSize);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.FieldTypeID = rdr.GetInt32(0);
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
        public Boolean Update(ProfileFieldTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PROFILEFIELDTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldTypeID", id.FieldTypeID);
                cmd.Parameters.AddWithValue("@FieldTypeName", id.FieldTypeName);
                cmd.Parameters.AddWithValue("@FieldTypeDescription", id.FieldTypeDescription);
                cmd.Parameters.AddWithValue("@FieldTypeSize", id.FieldTypeSize);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PROFILEFIELDTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldTypeID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROFILEFIELDTYPES_WC", con);
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




