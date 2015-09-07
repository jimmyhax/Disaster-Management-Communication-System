using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class MemberAttemptTypes : System.Web.UI.Page
    {
        public Int32 MemberAttemptTypeID
        {
            get;
            set;
        }
        public String AttemptTypeDescription
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            MemberAttemptTypeID = 0;
            AttemptTypeDescription = "";
        }
        public MemberAttemptTypes Select(int id)
        {
            MemberAttemptTypes MemberAttemptTypes = new MemberAttemptTypes();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERATTEMPTTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberAttemptTypeID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        MemberAttemptTypes.MemberAttemptTypeID = rdr.GetInt32(0);
                    }
                    else
                    {
                        MemberAttemptTypes.MemberAttemptTypeID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        MemberAttemptTypes.AttemptTypeDescription = rdr.GetString(1);
                    }
                    else
                    {
                        MemberAttemptTypes.AttemptTypeDescription = " ";
                    }
                    }
                    else
                    {
                    MemberAttemptTypes.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                MemberAttemptTypes.SetColumnDefaults();
                return MemberAttemptTypes;
                }
            finally
            {
                con.Close();
            }
            return MemberAttemptTypes;
        }

        public MemberAttemptTypes Insert(MemberAttemptTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEMBERATTEMPTTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberAttemptTypeID", id.MemberAttemptTypeID);
                cmd.Parameters.AddWithValue("@AttemptTypeDescription", id.AttemptTypeDescription);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEMBERATTEMPTTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AttemptTypeDescription", id.AttemptTypeDescription);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.MemberAttemptTypeID = rdr.GetInt32(0);
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
        public Boolean Update(MemberAttemptTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEMBERATTEMPTTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberAttemptTypeID", id.MemberAttemptTypeID);
                cmd.Parameters.AddWithValue("@AttemptTypeDescription", id.AttemptTypeDescription);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEMBERATTEMPTTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberAttemptTypeID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERATTEMPTTYPES_WC", con);
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




