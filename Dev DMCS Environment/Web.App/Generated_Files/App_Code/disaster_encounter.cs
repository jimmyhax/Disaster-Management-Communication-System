using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class disaster_encounter : System.Web.UI.Page
    {
        public Int32 disaster_encounter_id
        {
            get;
            set;
        }
        public Int32 disaster_id
        {
            get;
            set;
        }
        public Int32 encounter_id
        {
            get;
            set;
        }
        public Int32 location_id
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            disaster_encounter_id = 0;
            disaster_id = 0;
            encounter_id = 0;
            location_id = 0;
        }
        public disaster_encounter Select(int id)
        {
            disaster_encounter disaster_encounter = new disaster_encounter();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_encounter_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        disaster_encounter.disaster_encounter_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        disaster_encounter.disaster_encounter_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        disaster_encounter.disaster_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        disaster_encounter.disaster_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        disaster_encounter.encounter_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        disaster_encounter.encounter_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        disaster_encounter.location_id = rdr.GetInt32(3);
                    }
                    else
                    {
                        disaster_encounter.location_id = 0;
                    }
                    }
                    else
                    {
                    disaster_encounter.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                disaster_encounter.SetColumnDefaults();
                return disaster_encounter;
                }
            finally
            {
                con.Close();
            }
            return disaster_encounter;
        }

        public disaster_encounter Insert(disaster_encounter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DISASTER_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
                cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
                cmd.Parameters.AddWithValue("@location_id", id.location_id);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_DISASTER_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
                cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
                cmd.Parameters.AddWithValue("@location_id", id.location_id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.disaster_encounter_id = rdr.GetInt32(0);
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
        public Boolean Update(disaster_encounter id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DISASTER_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_encounter_id", id.disaster_encounter_id);
                cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
                cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
                cmd.Parameters.AddWithValue("@location_id", id.location_id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DISASTER_ENCOUNTER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@disaster_encounter_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_ENCOUNTER_WC", con);
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




