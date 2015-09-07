using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Members : System.Web.UI.Page
    {
        public Int64 MemberID
        {
            get;
            set;
        }
        public String Name
        {
            get;
            set;
        }
        public String Email
        {
            get;
            set;
        }
        public String Password
        {
            get;
            set;
        }
        public String Avatar
        {
            get;
            set;
        }
        public Int32 IsEnable
        {
            get;
            set;
        }
        public Int32 IsBuiltIn
        {
            get;
            set;
        }
        public DateTime LastLogin
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
        public String TimeZoneID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            MemberID = ;
            Name = "";
            Email = "";
            Password = "";
            Avatar = "";
            IsEnable = 0;
            IsBuiltIn = 0;
            LastLogin = DateTime.Now;
            Created = DateTime.Now;
            Modified = DateTime.Now;
            TimeZoneID = "";
        }
        public Members Select(int id)
        {
            Members Members = new Members();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Members.MemberID = 
                    }
                    else
                    {
                        Members.MemberID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Members.Name = rdr.GetString(1);
                    }
                    else
                    {
                        Members.Name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Members.Email = rdr.GetString(2);
                    }
                    else
                    {
                        Members.Email = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Members.Password = rdr.GetString(3);
                    }
                    else
                    {
                        Members.Password = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Members.Avatar = rdr.GetString(4);
                    }
                    else
                    {
                        Members.Avatar = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Members.IsEnable = rdr.GetInt32(5);
                    }
                    else
                    {
                        Members.IsEnable = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Members.IsBuiltIn = rdr.GetInt32(6);
                    }
                    else
                    {
                        Members.IsBuiltIn = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        Members.LastLogin = rdr.GetDateTime(7);
                    }
                    else
                    {
                        Members.LastLogin = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        Members.Created = rdr.GetDateTime(8);
                    }
                    else
                    {
                        Members.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        Members.Modified = rdr.GetDateTime(9);
                    }
                    else
                    {
                        Members.Modified = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        Members.TimeZoneID = rdr.GetString(10);
                    }
                    else
                    {
                        Members.TimeZoneID = " ";
                    }
                    }
                    else
                    {
                    Members.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Members.SetColumnDefaults();
                return Members;
                }
            finally
            {
                con.Close();
            }
            return Members;
        }

        public Members Insert(Members id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEMBERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Password", id.Password);
                cmd.Parameters.AddWithValue("@Avatar", id.Avatar);
                cmd.Parameters.AddWithValue("@IsEnable", id.IsEnable);
                cmd.Parameters.AddWithValue("@IsBuiltIn", id.IsBuiltIn);
                cmd.Parameters.AddWithValue("@LastLogin", id.LastLogin);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@TimeZoneID", id.TimeZoneID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEMBERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Password", id.Password);
                cmd.Parameters.AddWithValue("@Avatar", id.Avatar);
                cmd.Parameters.AddWithValue("@IsEnable", id.IsEnable);
                cmd.Parameters.AddWithValue("@IsBuiltIn", id.IsBuiltIn);
                cmd.Parameters.AddWithValue("@LastLogin", id.LastLogin);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@TimeZoneID", id.TimeZoneID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.MemberID = rdr.GetInt32(0);
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
        public Boolean Update(Members id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEMBERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Password", id.Password);
                cmd.Parameters.AddWithValue("@Avatar", id.Avatar);
                cmd.Parameters.AddWithValue("@IsEnable", id.IsEnable);
                cmd.Parameters.AddWithValue("@IsBuiltIn", id.IsBuiltIn);
                cmd.Parameters.AddWithValue("@LastLogin", id.LastLogin);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@TimeZoneID", id.TimeZoneID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEMBERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERS_WC", con);
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




