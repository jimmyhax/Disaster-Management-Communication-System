using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Roles : System.Web.UI.Page
    {
        public Int64 RoleID
        {
            get;
            set;
        }
        public String Name
        {
            get;
            set;
        }
        public Int32 IsBuiltIn
        {
            get;
            set;
        }
        public String BackColor
        {
            get;
            set;
        }
        public String ForeColor
        {
            get;
            set;
        }
        public String Settings
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
            RoleID = ;
            Name = "";
            IsBuiltIn = 0;
            BackColor = "";
            ForeColor = "";
            Settings = "";
            Created = DateTime.Now;
            Modified = DateTime.Now;
        }
        public Roles Select(int id)
        {
            Roles Roles = new Roles();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ROLES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Roles.RoleID = 
                    }
                    else
                    {
                        Roles.RoleID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Roles.Name = rdr.GetString(1);
                    }
                    else
                    {
                        Roles.Name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Roles.IsBuiltIn = rdr.GetInt32(2);
                    }
                    else
                    {
                        Roles.IsBuiltIn = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Roles.BackColor = rdr.GetString(3);
                    }
                    else
                    {
                        Roles.BackColor = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Roles.ForeColor = rdr.GetString(4);
                    }
                    else
                    {
                        Roles.ForeColor = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Roles.Settings = rdr.GetString(5);
                    }
                    else
                    {
                        Roles.Settings = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Roles.Created = rdr.GetDateTime(6);
                    }
                    else
                    {
                        Roles.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        Roles.Modified = rdr.GetDateTime(7);
                    }
                    else
                    {
                        Roles.Modified = DateTime.Now;
                    }
                    }
                    else
                    {
                    Roles.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Roles.SetColumnDefaults();
                return Roles;
                }
            finally
            {
                con.Close();
            }
            return Roles;
        }

        public Roles Insert(Roles id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ROLES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@IsBuiltIn", id.IsBuiltIn);
                cmd.Parameters.AddWithValue("@BackColor", id.BackColor);
                cmd.Parameters.AddWithValue("@ForeColor", id.ForeColor);
                cmd.Parameters.AddWithValue("@Settings", id.Settings);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ROLES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@IsBuiltIn", id.IsBuiltIn);
                cmd.Parameters.AddWithValue("@BackColor", id.BackColor);
                cmd.Parameters.AddWithValue("@ForeColor", id.ForeColor);
                cmd.Parameters.AddWithValue("@Settings", id.Settings);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.RoleID = rdr.GetInt32(0);
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
        public Boolean Update(Roles id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ROLES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleID", id.RoleID);
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@IsBuiltIn", id.IsBuiltIn);
                cmd.Parameters.AddWithValue("@BackColor", id.BackColor);
                cmd.Parameters.AddWithValue("@ForeColor", id.ForeColor);
                cmd.Parameters.AddWithValue("@Settings", id.Settings);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ROLES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoleID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ROLES_WC", con);
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




