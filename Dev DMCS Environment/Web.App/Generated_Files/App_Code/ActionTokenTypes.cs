using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class ActionTokenTypes : System.Web.UI.Page
    {
        public Int32 ActionTypeID
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
            ActionTypeID = 0;
            Description = "";
        }
        public ActionTokenTypes Select(int id)
        {
            ActionTokenTypes ActionTokenTypes = new ActionTokenTypes();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ACTIONTOKENTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionTypeID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        ActionTokenTypes.ActionTypeID = rdr.GetInt32(0);
                    }
                    else
                    {
                        ActionTokenTypes.ActionTypeID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        ActionTokenTypes.Description = rdr.GetString(1);
                    }
                    else
                    {
                        ActionTokenTypes.Description = " ";
                    }
                    }
                    else
                    {
                    ActionTokenTypes.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                ActionTokenTypes.SetColumnDefaults();
                return ActionTokenTypes;
                }
            finally
            {
                con.Close();
            }
            return ActionTokenTypes;
        }

        public ActionTokenTypes Insert(ActionTokenTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ACTIONTOKENTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionTypeID", id.ActionTypeID);
                cmd.Parameters.AddWithValue("@Description", id.Description);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ACTIONTOKENTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Description", id.Description);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.ActionTypeID = rdr.GetInt32(0);
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
        public Boolean Update(ActionTokenTypes id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ACTIONTOKENTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionTypeID", id.ActionTypeID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ACTIONTOKENTYPES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ActionTypeID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ACTIONTOKENTYPES_WC", con);
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




