using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class ParameterTypes : System.Web.UI.Page
    {
        public Int32 TypeID
        {
            get;
            set;
        }
        public String TypeName
        {
            get;
            set;
        }
        public Int32 TypeSize
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            TypeID = 0;
            TypeName = "";
            TypeSize = 0;
        }
        public ParameterTypes Select(int id)
        {
            ParameterTypes ParameterTypes = new ParameterTypes();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PARAMETERTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TypeID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        ParameterTypes.TypeID = rdr.GetInt32(0);
                    }
                    else
                    {
                        ParameterTypes.TypeID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        ParameterTypes.TypeName = rdr.GetString(1);
                    }
                    else
                    {
                        ParameterTypes.TypeName = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        ParameterTypes.TypeSize = rdr.GetInt32(2);
                    }
                    else
                    {
                        ParameterTypes.TypeSize = 0;
                    }
                    }
                    else
                    {
                    ParameterTypes.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                ParameterTypes.SetColumnDefaults();
                return ParameterTypes;
                }
            finally
            {
                con.Close();
            }
            return ParameterTypes;
        }

        public ParameterTypes Insert(ParameterTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PARAMETERTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TypeID", id.TypeID);
                cmd.Parameters.AddWithValue("@TypeName", id.TypeName);
                cmd.Parameters.AddWithValue("@TypeSize", id.TypeSize);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PARAMETERTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TypeName", id.TypeName);
                cmd.Parameters.AddWithValue("@TypeSize", id.TypeSize);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.TypeID = rdr.GetInt32(0);
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
        public Boolean Update(ParameterTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PARAMETERTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TypeID", id.TypeID);
                cmd.Parameters.AddWithValue("@TypeName", id.TypeName);
                cmd.Parameters.AddWithValue("@TypeSize", id.TypeSize);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PARAMETERTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TypeID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PARAMETERTYPES_WC", con);
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




