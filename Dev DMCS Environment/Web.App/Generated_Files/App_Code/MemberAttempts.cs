using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class MemberAttempts : System.Web.UI.Page
    {
        public Int64 AttemptID
        {
            get;
            set;
        }
        public Int64 MemberID
        {
            get;
            set;
        }
        public Int32 AttemptType
        {
            get;
            set;
        }
        public Int32 Attempts
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
        public Int32 IsAttemptValid
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            AttemptID = ;
            MemberID = ;
            AttemptType = 0;
            Attempts = 0;
            Created = DateTime.Now;
            Modified = DateTime.Now;
            IsAttemptValid = 0;
        }
        public MemberAttempts Select(int id)
        {
            MemberAttempts MemberAttempts = new MemberAttempts();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERATTEMPTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AttemptID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        MemberAttempts.AttemptID = 
                    }
                    else
                    {
                        MemberAttempts.AttemptID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        MemberAttempts.MemberID = 
                    }
                    else
                    {
                        MemberAttempts.MemberID = ;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        MemberAttempts.AttemptType = rdr.GetInt32(2);
                    }
                    else
                    {
                        MemberAttempts.AttemptType = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        MemberAttempts.Attempts = rdr.GetInt32(3);
                    }
                    else
                    {
                        MemberAttempts.Attempts = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        MemberAttempts.Created = rdr.GetDateTime(4);
                    }
                    else
                    {
                        MemberAttempts.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        MemberAttempts.Modified = rdr.GetDateTime(5);
                    }
                    else
                    {
                        MemberAttempts.Modified = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        MemberAttempts.IsAttemptValid = rdr.GetInt32(6);
                    }
                    else
                    {
                        MemberAttempts.IsAttemptValid = 0;
                    }
                    }
                    else
                    {
                    MemberAttempts.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                MemberAttempts.SetColumnDefaults();
                return MemberAttempts;
                }
            finally
            {
                con.Close();
            }
            return MemberAttempts;
        }

        public MemberAttempts Insert(MemberAttempts id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEMBERATTEMPTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@AttemptType", id.AttemptType);
                cmd.Parameters.AddWithValue("@Attempts", id.Attempts);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@IsAttemptValid", id.IsAttemptValid);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEMBERATTEMPTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@AttemptType", id.AttemptType);
                cmd.Parameters.AddWithValue("@Attempts", id.Attempts);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@IsAttemptValid", id.IsAttemptValid);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.AttemptID = rdr.GetInt32(0);
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
        public Boolean Update(MemberAttempts id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEMBERATTEMPTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AttemptID", id.AttemptID);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@AttemptType", id.AttemptType);
                cmd.Parameters.AddWithValue("@Attempts", id.Attempts);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@IsAttemptValid", id.IsAttemptValid);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEMBERATTEMPTS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AttemptID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERATTEMPTS_WC", con);
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




