using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class encounter_services : System.Web.UI.Page
    {
        public Int32 encounter_serv_id
        {
            get;
            set;
        }
        public Int32 encounter_id
        {
            get;
            set;
        }
        public Int32 mobile_unit_id
        {
            get;
            set;
        }
        public Int32 service_id
        {
            get;
            set;
        }
        public DateTime service_date
        {
            get;
            set;
        }
        public DateTime service_completed
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            encounter_serv_id = 0;
            encounter_id = 0;
            mobile_unit_id = 0;
            service_id = 0;
            service_date = DateTime.Now;
            service_completed = DateTime.Now;
        }
        public encounter_services Select(int id)
        {
            encounter_services encounter_services = new encounter_services();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ENCOUNTER_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_serv_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        encounter_services.encounter_serv_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        encounter_services.encounter_serv_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        encounter_services.encounter_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        encounter_services.encounter_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        encounter_services.mobile_unit_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        encounter_services.mobile_unit_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        encounter_services.service_id = rdr.GetInt32(3);
                    }
                    else
                    {
                        encounter_services.service_id = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        encounter_services.service_date = rdr.GetDateTime(4);
                    }
                    else
                    {
                        encounter_services.service_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        encounter_services.service_completed = rdr.GetDateTime(5);
                    }
                    else
                    {
                        encounter_services.service_completed = DateTime.Now;
                    }
                    }
                    else
                    {
                    encounter_services.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                encounter_services.SetColumnDefaults();
                return encounter_services;
                }
            finally
            {
                con.Close();
            }
            return encounter_services;
        }

        public encounter_services Insert(encounter_services id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ENCOUNTER_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
                cmd.Parameters.AddWithValue("@mobile_unit_id", id.mobile_unit_id);
                cmd.Parameters.AddWithValue("@service_id", id.service_id);
                cmd.Parameters.AddWithValue("@service_date", id.service_date);
                cmd.Parameters.AddWithValue("@service_completed", id.service_completed);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_ENCOUNTER_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
                cmd.Parameters.AddWithValue("@mobile_unit_id", id.mobile_unit_id);
                cmd.Parameters.AddWithValue("@service_id", id.service_id);
                cmd.Parameters.AddWithValue("@service_date", id.service_date);
                cmd.Parameters.AddWithValue("@service_completed", id.service_completed);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.encounter_serv_id = rdr.GetInt32(0);
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
        public Boolean Update(encounter_services id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ENCOUNTER_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_serv_id", id.encounter_serv_id);
                cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
                cmd.Parameters.AddWithValue("@mobile_unit_id", id.mobile_unit_id);
                cmd.Parameters.AddWithValue("@service_id", id.service_id);
                cmd.Parameters.AddWithValue("@service_date", id.service_date);
                cmd.Parameters.AddWithValue("@service_completed", id.service_completed);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ENCOUNTER_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@encounter_serv_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ENCOUNTER_SERVICES_WC", con);
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




