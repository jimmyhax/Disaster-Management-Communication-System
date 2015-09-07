using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class campaign : System.Web.UI.Page
    {
        public Int32 campaign_id
        {
            get;
            set;
        }
        public String campaign_name
        {
            get;
            set;
        }
        public DateTime campaign_start_date
        {
            get;
            set;
        }
        public DateTime campaign_end_date
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            campaign_id = 0;
            campaign_name = "";
            campaign_start_date = DateTime.Now;
            campaign_end_date = DateTime.Now;
        }
        public campaign Select(int id)
        {
            campaign campaign = new campaign();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CAMPAIGN", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@campaign_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        campaign.campaign_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        campaign.campaign_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        campaign.campaign_name = rdr.GetString(1);
                    }
                    else
                    {
                        campaign.campaign_name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        campaign.campaign_start_date = rdr.GetDateTime(2);
                    }
                    else
                    {
                        campaign.campaign_start_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        campaign.campaign_end_date = rdr.GetDateTime(3);
                    }
                    else
                    {
                        campaign.campaign_end_date = DateTime.Now;
                    }
                    }
                    else
                    {
                    campaign.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                campaign.SetColumnDefaults();
                return campaign;
                }
            finally
            {
                con.Close();
            }
            return campaign;
        }

        public campaign Insert(campaign id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CAMPAIGN", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@campaign_name", id.campaign_name);
                cmd.Parameters.AddWithValue("@campaign_start_date", id.campaign_start_date);
                cmd.Parameters.AddWithValue("@campaign_end_date", id.campaign_end_date);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_CAMPAIGN", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@campaign_name", id.campaign_name);
                cmd.Parameters.AddWithValue("@campaign_start_date", id.campaign_start_date);
                cmd.Parameters.AddWithValue("@campaign_end_date", id.campaign_end_date);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.campaign_id = rdr.GetInt32(0);
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
        public Boolean Update(campaign id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CAMPAIGN", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@campaign_id", id.campaign_id);
                cmd.Parameters.AddWithValue("@campaign_name", id.campaign_name);
                cmd.Parameters.AddWithValue("@campaign_start_date", id.campaign_start_date);
                cmd.Parameters.AddWithValue("@campaign_end_date", id.campaign_end_date);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CAMPAIGN", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@campaign_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CAMPAIGN_WC", con);
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




