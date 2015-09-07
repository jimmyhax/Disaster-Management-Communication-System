using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class requestor : System.Web.UI.Page
    {
        public Int32 RequestorID
        {
            get;
            set;
        }
        public Int32 EncounterID
        {
            get;
            set;
        }
        public String Requestor_Type
        {
            get;
            set;
        }
        public Int32 MobilUnitID
        {
            get;
            set;
        }
        public Int32 PersonID
        {
            get;
            set;
        }
        public Int32 AgencyID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            RequestorID = 0;
            EncounterID = 0;
            Requestor_Type = "";
            MobilUnitID = 0;
            PersonID = 0;
            AgencyID = 0;
        }
        public requestor Select(int id)
        {
            requestor requestor = new requestor();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_REQUESTOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RequestorID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        requestor.RequestorID = rdr.GetInt32(0);
                    }
                    else
                    {
                        requestor.RequestorID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        requestor.EncounterID = rdr.GetInt32(1);
                    }
                    else
                    {
                        requestor.EncounterID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        requestor.Requestor_Type = rdr.GetString(2);
                    }
                    else
                    {
                        requestor.Requestor_Type = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        requestor.MobilUnitID = rdr.GetInt32(3);
                    }
                    else
                    {
                        requestor.MobilUnitID = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        requestor.PersonID = rdr.GetInt32(4);
                    }
                    else
                    {
                        requestor.PersonID = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        requestor.AgencyID = rdr.GetInt32(5);
                    }
                    else
                    {
                        requestor.AgencyID = 0;
                    }
                    }
                    else
                    {
                    requestor.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                requestor.SetColumnDefaults();
                return requestor;
                }
            finally
            {
                con.Close();
            }
            return requestor;
        }

        public requestor Insert(requestor id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_REQUESTOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EncounterID", id.EncounterID);
                cmd.Parameters.AddWithValue("@Requestor_Type", id.Requestor_Type);
                cmd.Parameters.AddWithValue("@MobilUnitID", id.MobilUnitID);
                cmd.Parameters.AddWithValue("@PersonID", id.PersonID);
                cmd.Parameters.AddWithValue("@AgencyID", id.AgencyID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_REQUESTOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EncounterID", id.EncounterID);
                cmd.Parameters.AddWithValue("@Requestor_Type", id.Requestor_Type);
                cmd.Parameters.AddWithValue("@MobilUnitID", id.MobilUnitID);
                cmd.Parameters.AddWithValue("@PersonID", id.PersonID);
                cmd.Parameters.AddWithValue("@AgencyID", id.AgencyID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.RequestorID = rdr.GetInt32(0);
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
        public Boolean Update(requestor id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_REQUESTOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RequestorID", id.RequestorID);
                cmd.Parameters.AddWithValue("@EncounterID", id.EncounterID);
                cmd.Parameters.AddWithValue("@Requestor_Type", id.Requestor_Type);
                cmd.Parameters.AddWithValue("@MobilUnitID", id.MobilUnitID);
                cmd.Parameters.AddWithValue("@PersonID", id.PersonID);
                cmd.Parameters.AddWithValue("@AgencyID", id.AgencyID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_REQUESTOR", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RequestorID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_REQUESTOR_WC", con);
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




