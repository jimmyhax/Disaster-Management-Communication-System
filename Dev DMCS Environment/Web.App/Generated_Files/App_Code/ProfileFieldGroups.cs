using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class ProfileFieldGroups : System.Web.UI.Page
    {
        public Int32 FieldGroupID
        {
            get;
            set;
        }
        public String FieldGroupName
        {
            get;
            set;
        }
        public String FieldGroupDescription
        {
            get;
            set;
        }
        public Int32 OrderID
        {
            get;
            set;
        }
        public Int32 IsActive
        {
            get;
            set;
        }
        public Int32 AdminUseOnly
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            FieldGroupID = 0;
            FieldGroupName = "";
            FieldGroupDescription = "";
            OrderID = 0;
            IsActive = 0;
            AdminUseOnly = 0;
        }
        public ProfileFieldGroups Select(int id)
        {
            ProfileFieldGroups ProfileFieldGroups = new ProfileFieldGroups();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROFILEFIELDGROUPS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldGroupID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        ProfileFieldGroups.FieldGroupID = rdr.GetInt32(0);
                    }
                    else
                    {
                        ProfileFieldGroups.FieldGroupID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        ProfileFieldGroups.FieldGroupName = rdr.GetString(1);
                    }
                    else
                    {
                        ProfileFieldGroups.FieldGroupName = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        ProfileFieldGroups.FieldGroupDescription = rdr.GetString(2);
                    }
                    else
                    {
                        ProfileFieldGroups.FieldGroupDescription = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        ProfileFieldGroups.OrderID = rdr.GetInt32(3);
                    }
                    else
                    {
                        ProfileFieldGroups.OrderID = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        ProfileFieldGroups.IsActive = rdr.GetInt32(4);
                    }
                    else
                    {
                        ProfileFieldGroups.IsActive = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        ProfileFieldGroups.AdminUseOnly = rdr.GetInt32(5);
                    }
                    else
                    {
                        ProfileFieldGroups.AdminUseOnly = 0;
                    }
                    }
                    else
                    {
                    ProfileFieldGroups.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                ProfileFieldGroups.SetColumnDefaults();
                return ProfileFieldGroups;
                }
            finally
            {
                con.Close();
            }
            return ProfileFieldGroups;
        }

        public ProfileFieldGroups Insert(ProfileFieldGroups id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PROFILEFIELDGROUPS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldGroupName", id.FieldGroupName);
                cmd.Parameters.AddWithValue("@FieldGroupDescription", id.FieldGroupDescription);
                cmd.Parameters.AddWithValue("@OrderID", id.OrderID);
                cmd.Parameters.AddWithValue("@IsActive", id.IsActive);
                cmd.Parameters.AddWithValue("@AdminUseOnly", id.AdminUseOnly);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PROFILEFIELDGROUPS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldGroupName", id.FieldGroupName);
                cmd.Parameters.AddWithValue("@FieldGroupDescription", id.FieldGroupDescription);
                cmd.Parameters.AddWithValue("@OrderID", id.OrderID);
                cmd.Parameters.AddWithValue("@IsActive", id.IsActive);
                cmd.Parameters.AddWithValue("@AdminUseOnly", id.AdminUseOnly);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.FieldGroupID = rdr.GetInt32(0);
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
        public Boolean Update(ProfileFieldGroups id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PROFILEFIELDGROUPS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldGroupID", id.FieldGroupID);
                cmd.Parameters.AddWithValue("@FieldGroupName", id.FieldGroupName);
                cmd.Parameters.AddWithValue("@FieldGroupDescription", id.FieldGroupDescription);
                cmd.Parameters.AddWithValue("@OrderID", id.OrderID);
                cmd.Parameters.AddWithValue("@IsActive", id.IsActive);
                cmd.Parameters.AddWithValue("@AdminUseOnly", id.AdminUseOnly);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PROFILEFIELDGROUPS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldGroupID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROFILEFIELDGROUPS_WC", con);
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




