using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Donor : System.Web.UI.Page
    {
        public Int32 donor_id
        {
            get;
            set;
        }
        public Int32 PersonID
        {
            get;
            set;
        }
        public String Status
        {
            get;
            set;
        }
        public String DonorType
        {
            get;
            set;
        }
        public Int32 AgencyID
        {
            get;
            set;
        }
        public Int32 Phone
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            donor_id = 0;
            PersonID = 0;
            Status = "";
            DonorType = "";
            AgencyID = 0;
            Phone = 0;
        }
        public Donor Select(int id)
        {
            Donor Donor = new Donor();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DONOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@donor_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Donor.donor_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        Donor.donor_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Donor.PersonID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Donor.PersonID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Donor.Status = rdr.GetString(2);
                    }
                    else
                    {
                        Donor.Status = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Donor.DonorType = rdr.GetString(3);
                    }
                    else
                    {
                        Donor.DonorType = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Donor.AgencyID = rdr.GetInt32(4);
                    }
                    else
                    {
                        Donor.AgencyID = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Donor.Phone = rdr.GetInt32(5);
                    }
                    else
                    {
                        Donor.Phone = 0;
                    }
                    }
                    else
                    {
                    Donor.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Donor.SetColumnDefaults();
                return Donor;
                }
            finally
            {
                con.Close();
            }
            return Donor;
        }

        public Donor Insert(Donor id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DONOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PersonID", id.PersonID);
                cmd.Parameters.AddWithValue("@Status", id.Status);
                cmd.Parameters.AddWithValue("@DonorType", id.DonorType);
                cmd.Parameters.AddWithValue("@AgencyID", id.AgencyID);
                cmd.Parameters.AddWithValue("@Phone", id.Phone);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_DONOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PersonID", id.PersonID);
                cmd.Parameters.AddWithValue("@Status", id.Status);
                cmd.Parameters.AddWithValue("@DonorType", id.DonorType);
                cmd.Parameters.AddWithValue("@AgencyID", id.AgencyID);
                cmd.Parameters.AddWithValue("@Phone", id.Phone);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.donor_id = rdr.GetInt32(0);
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
        public Boolean Update(Donor id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DONOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@donor_id", id.donor_id);
                cmd.Parameters.AddWithValue("@PersonID", id.PersonID);
                cmd.Parameters.AddWithValue("@Status", id.Status);
                cmd.Parameters.AddWithValue("@DonorType", id.DonorType);
                cmd.Parameters.AddWithValue("@AgencyID", id.AgencyID);
                cmd.Parameters.AddWithValue("@Phone", id.Phone);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DONOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@donor_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DONOR_WC", con);
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




