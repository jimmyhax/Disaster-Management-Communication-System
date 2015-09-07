using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class services : System.Web.UI.Page
    {
        public Int32 service_id
        {
            get;
            set;
        }
        public String Company
        {
            get;
            set;
        }
        public String service_type
        {
            get;
            set;
        }
        public DateTime Estimated_Time
        {
            get;
            set;
        }
        public String Email
        {
            get;
            set;
        }
        public Int32 Phone_Number
        {
            get;
            set;
        }
        public Int32 Full_Cost
        {
            get;
            set;
        }
        public Int32 Estimated_Cost
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            service_id = 0;
            Company = "";
            service_type = "";
            Estimated_Time = DateTime.Now;
            Email = "";
            Phone_Number = 0;
            Full_Cost = 0;
            Estimated_Cost = 0;
        }
        public services Select(int id)
        {
            services services = new services();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@service_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        services.service_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        services.service_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        services.Company = rdr.GetString(1);
                    }
                    else
                    {
                        services.Company = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        services.service_type = rdr.GetString(2);
                    }
                    else
                    {
                        services.service_type = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        services.Estimated_Time = rdr.GetDateTime(3);
                    }
                    else
                    {
                        services.Estimated_Time = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        services.Email = rdr.GetString(4);
                    }
                    else
                    {
                        services.Email = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        services.Phone_Number = rdr.GetInt32(5);
                    }
                    else
                    {
                        services.Phone_Number = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        services.Full_Cost = rdr.GetInt32(6);
                    }
                    else
                    {
                        services.Full_Cost = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        services.Estimated_Cost = rdr.GetInt32(7);
                    }
                    else
                    {
                        services.Estimated_Cost = 0;
                    }
                    }
                    else
                    {
                    services.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                services.SetColumnDefaults();
                return services;
                }
            finally
            {
                con.Close();
            }
            return services;
        }

        public services Insert(services id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Company", id.Company);
                cmd.Parameters.AddWithValue("@service_type", id.service_type);
                cmd.Parameters.AddWithValue("@Estimated_Time", id.Estimated_Time);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Phone_Number", id.Phone_Number);
                cmd.Parameters.AddWithValue("@Full_Cost", id.Full_Cost);
                cmd.Parameters.AddWithValue("@Estimated_Cost", id.Estimated_Cost);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Company", id.Company);
                cmd.Parameters.AddWithValue("@service_type", id.service_type);
                cmd.Parameters.AddWithValue("@Estimated_Time", id.Estimated_Time);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Phone_Number", id.Phone_Number);
                cmd.Parameters.AddWithValue("@Full_Cost", id.Full_Cost);
                cmd.Parameters.AddWithValue("@Estimated_Cost", id.Estimated_Cost);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.service_id = rdr.GetInt32(0);
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
        public Boolean Update(services id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@service_id", id.service_id);
                cmd.Parameters.AddWithValue("@Company", id.Company);
                cmd.Parameters.AddWithValue("@service_type", id.service_type);
                cmd.Parameters.AddWithValue("@Estimated_Time", id.Estimated_Time);
                cmd.Parameters.AddWithValue("@Email", id.Email);
                cmd.Parameters.AddWithValue("@Phone_Number", id.Phone_Number);
                cmd.Parameters.AddWithValue("@Full_Cost", id.Full_Cost);
                cmd.Parameters.AddWithValue("@Estimated_Cost", id.Estimated_Cost);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_SERVICES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@service_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_SERVICES_WC", con);
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




