using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class MemberProfileFields : System.Web.UI.Page
    {
        public Int32 ProfileFieldID
        {
            get;
            set;
        }
        public Int64 MemberID
        {
            get;
            set;
        }
        public Int32 FieldID
        {
            get;
            set;
        }
        public No Type FieldValue
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
            ProfileFieldID = 0;
            MemberID = ;
            FieldID = 0;
            FieldValue = ;
            Created = DateTime.Now;
            Modified = DateTime.Now;
        }
        public MemberProfileFields Select(int id)
        {
            MemberProfileFields MemberProfileFields = new MemberProfileFields();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProfileFieldID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        MemberProfileFields.ProfileFieldID = rdr.GetInt32(0);
                    }
                    else
                    {
                        MemberProfileFields.ProfileFieldID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        MemberProfileFields.MemberID = 
                    }
                    else
                    {
                        MemberProfileFields.MemberID = ;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        MemberProfileFields.FieldID = rdr.GetInt32(2);
                    }
                    else
                    {
                        MemberProfileFields.FieldID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        MemberProfileFields.FieldValue = 
                    }
                    else
                    {
                        MemberProfileFields.FieldValue = ;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        MemberProfileFields.Created = rdr.GetDateTime(4);
                    }
                    else
                    {
                        MemberProfileFields.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        MemberProfileFields.Modified = rdr.GetDateTime(5);
                    }
                    else
                    {
                        MemberProfileFields.Modified = DateTime.Now;
                    }
                    }
                    else
                    {
                    MemberProfileFields.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                MemberProfileFields.SetColumnDefaults();
                return MemberProfileFields;
                }
            finally
            {
                con.Close();
            }
            return MemberProfileFields;
        }

        public MemberProfileFields Insert(MemberProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEMBERPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@FieldID", id.FieldID);
                cmd.Parameters.AddWithValue("@FieldValue", id.FieldValue);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEMBERPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@FieldID", id.FieldID);
                cmd.Parameters.AddWithValue("@FieldValue", id.FieldValue);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.ProfileFieldID = rdr.GetInt32(0);
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
        public Boolean Update(MemberProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEMBERPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProfileFieldID", id.ProfileFieldID);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@FieldID", id.FieldID);
                cmd.Parameters.AddWithValue("@FieldValue", id.FieldValue);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEMBERPROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProfileFieldID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERPROFILEFIELDS_WC", con);
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




