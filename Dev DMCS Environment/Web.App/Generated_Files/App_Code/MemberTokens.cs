using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class MemberTokens : System.Web.UI.Page
    {
        public Int64 MemberTokenID
        {
            get;
            set;
        }
        public Int64 MemberID
        {
            get;
            set;
        }
        public String Token
        {
            get;
            set;
        }
        public String GeneratedBy
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
            MemberTokenID = ;
            MemberID = ;
            Token = "";
            GeneratedBy = "";
            Created = DateTime.Now;
            Modified = DateTime.Now;
        }
        public MemberTokens Select(int id)
        {
            MemberTokens MemberTokens = new MemberTokens();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberTokenID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        MemberTokens.MemberTokenID = 
                    }
                    else
                    {
                        MemberTokens.MemberTokenID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        MemberTokens.MemberID = 
                    }
                    else
                    {
                        MemberTokens.MemberID = ;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        MemberTokens.Token = rdr.GetString(2);
                    }
                    else
                    {
                        MemberTokens.Token = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        MemberTokens.GeneratedBy = rdr.GetString(3);
                    }
                    else
                    {
                        MemberTokens.GeneratedBy = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        MemberTokens.Created = rdr.GetDateTime(4);
                    }
                    else
                    {
                        MemberTokens.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        MemberTokens.Modified = rdr.GetDateTime(5);
                    }
                    else
                    {
                        MemberTokens.Modified = DateTime.Now;
                    }
                    }
                    else
                    {
                    MemberTokens.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                MemberTokens.SetColumnDefaults();
                return MemberTokens;
                }
            finally
            {
                con.Close();
            }
            return MemberTokens;
        }

        public MemberTokens Insert(MemberTokens id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEMBERTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                cmd.Parameters.AddWithValue("@GeneratedBy", id.GeneratedBy);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEMBERTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                cmd.Parameters.AddWithValue("@GeneratedBy", id.GeneratedBy);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.MemberTokenID = rdr.GetInt32(0);
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
        public Boolean Update(MemberTokens id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEMBERTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberTokenID", id.MemberTokenID);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@Token", id.Token);
                cmd.Parameters.AddWithValue("@GeneratedBy", id.GeneratedBy);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEMBERTOKENS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberTokenID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERTOKENS_WC", con);
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




