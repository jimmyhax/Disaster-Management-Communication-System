using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class encounter : System.Web.UI.Page
    {
        public Int32 encounter_id
        {
            get;
            set;
        }
        public Int32 case_id
        {
            get;
            set;
        }
        public Int32 agency_id
        {
            get;
            set;
        }
        public Int32 call_center_id
        {
            get;
            set;
        }
        public Int32 client_id
        {
            get;
            set;
        }
        public DateTime create_date
        {
            get;
            set;
        }
        public DateTime close_date
        {
            get;
            set;
        }
        public Int32 disaster_id
        {
            get;
            set;
        }
        public Int32 Location_ID
        {
            get;
            set;
        }
        public Int32 Pet_Record_ID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            encounter_id = 0;
            case_id = 0;
            agency_id = 0;
            call_center_id = 0;
            client_id = 0;
            create_date = DateTime.Now;
            close_date = DateTime.Now;
            disaster_id = 0;
            Location_ID = 0;
            Pet_Record_ID = 0;
        }
        public encounter Select(int id)
        {
            encounter encounter = new encounter();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        encounter.encounter_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        encounter.encounter_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        encounter.case_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        encounter.case_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        encounter.agency_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        encounter.agency_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        encounter.call_center_id = rdr.GetInt32(3);
                    }
                    else
                    {
                        encounter.call_center_id = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        encounter.client_id = rdr.GetInt32(4);
                    }
                    else
                    {
                        encounter.client_id = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        encounter.create_date = rdr.GetDateTime(5);
                    }
                    else
                    {
                        encounter.create_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        encounter.close_date = rdr.GetDateTime(6);
                    }
                    else
                    {
                        encounter.close_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        encounter.disaster_id = rdr.GetInt32(7);
                    }
                    else
                    {
                        encounter.disaster_id = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        encounter.Location_ID = rdr.GetInt32(8);
                    }
                    else
                    {
                        encounter.Location_ID = 0;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        encounter.Pet_Record_ID = rdr.GetInt32(9);
                    }
                    else
                    {
                        encounter.Pet_Record_ID = 0;
                    }
                    }
                    else
                    {
                    encounter.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                encounter.SetColumnDefaults();
                return encounter;
                }
            finally
            {
                con.Close();
            }
            return encounter;
        }

        public encounter Insert(encounter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@create_date", id.create_date);
                cmd.Parameters.AddWithValue("@close_date", id.close_date);
                cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id.Pet_Record_ID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@create_date", id.create_date);
                cmd.Parameters.AddWithValue("@close_date", id.close_date);
                cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id.Pet_Record_ID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.encounter_id = rdr.GetInt32(0);
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
        public Boolean Update(encounter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@create_date", id.create_date);
                cmd.Parameters.AddWithValue("@close_date", id.close_date);
                cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id.Pet_Record_ID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ENCOUNTER_WC", con);
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




