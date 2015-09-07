using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class MemberSocialNetworks : System.Web.UI.Page
    {
        public Int64 MemberSocialNetworkID
        {
            get;
            set;
        }
        public Int64 MemberID
        {
            get;
            set;
        }
        public Int32 SocialNetworkID
        {
            get;
            set;
        }
        public String SocialNetworkUserID
        {
            get;
            set;
        }
        public String SocialNetworkUserEmail
        {
            get;
            set;
        }
        public String SocialNetworkUserName
        {
            get;
            set;
        }
        public String AccessToken
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            MemberSocialNetworkID = ;
            MemberID = ;
            SocialNetworkID = 0;
            SocialNetworkUserID = "";
            SocialNetworkUserEmail = "";
            SocialNetworkUserName = "";
            AccessToken = "";
        }
        public MemberSocialNetworks Select(int id)
        {
            MemberSocialNetworks MemberSocialNetworks = new MemberSocialNetworks();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERSOCIALNETWORKS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberSocialNetworkID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        MemberSocialNetworks.MemberSocialNetworkID = 
                    }
                    else
                    {
                        MemberSocialNetworks.MemberSocialNetworkID = ;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        MemberSocialNetworks.MemberID = 
                    }
                    else
                    {
                        MemberSocialNetworks.MemberID = ;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        MemberSocialNetworks.SocialNetworkID = rdr.GetInt32(2);
                    }
                    else
                    {
                        MemberSocialNetworks.SocialNetworkID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        MemberSocialNetworks.SocialNetworkUserID = rdr.GetString(3);
                    }
                    else
                    {
                        MemberSocialNetworks.SocialNetworkUserID = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        MemberSocialNetworks.SocialNetworkUserEmail = rdr.GetString(4);
                    }
                    else
                    {
                        MemberSocialNetworks.SocialNetworkUserEmail = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        MemberSocialNetworks.SocialNetworkUserName = rdr.GetString(5);
                    }
                    else
                    {
                        MemberSocialNetworks.SocialNetworkUserName = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        MemberSocialNetworks.AccessToken = rdr.GetString(6);
                    }
                    else
                    {
                        MemberSocialNetworks.AccessToken = " ";
                    }
                    }
                    else
                    {
                    MemberSocialNetworks.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                MemberSocialNetworks.SetColumnDefaults();
                return MemberSocialNetworks;
                }
            finally
            {
                con.Close();
            }
            return MemberSocialNetworks;
        }

        public MemberSocialNetworks Insert(MemberSocialNetworks id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEMBERSOCIALNETWORKS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@SocialNetworkID", id.SocialNetworkID);
                cmd.Parameters.AddWithValue("@SocialNetworkUserID", id.SocialNetworkUserID);
                cmd.Parameters.AddWithValue("@SocialNetworkUserEmail", id.SocialNetworkUserEmail);
                cmd.Parameters.AddWithValue("@SocialNetworkUserName", id.SocialNetworkUserName);
                cmd.Parameters.AddWithValue("@AccessToken", id.AccessToken);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEMBERSOCIALNETWORKS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@SocialNetworkID", id.SocialNetworkID);
                cmd.Parameters.AddWithValue("@SocialNetworkUserID", id.SocialNetworkUserID);
                cmd.Parameters.AddWithValue("@SocialNetworkUserEmail", id.SocialNetworkUserEmail);
                cmd.Parameters.AddWithValue("@SocialNetworkUserName", id.SocialNetworkUserName);
                cmd.Parameters.AddWithValue("@AccessToken", id.AccessToken);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.MemberSocialNetworkID = rdr.GetInt32(0);
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
        public Boolean Update(MemberSocialNetworks id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEMBERSOCIALNETWORKS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberSocialNetworkID", id.MemberSocialNetworkID);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@SocialNetworkID", id.SocialNetworkID);
                cmd.Parameters.AddWithValue("@SocialNetworkUserID", id.SocialNetworkUserID);
                cmd.Parameters.AddWithValue("@SocialNetworkUserEmail", id.SocialNetworkUserEmail);
                cmd.Parameters.AddWithValue("@SocialNetworkUserName", id.SocialNetworkUserName);
                cmd.Parameters.AddWithValue("@AccessToken", id.AccessToken);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEMBERSOCIALNETWORKS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MemberSocialNetworkID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEMBERSOCIALNETWORKS_WC", con);
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




