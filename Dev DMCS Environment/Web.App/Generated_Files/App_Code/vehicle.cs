using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class vehicle : System.Web.UI.Page
    {
        public Int32 vehicle_id
        {
            get;
            set;
        }
        public Int32 case_id
        {
            get;
            set;
        }
        public Int32 client_id
        {
            get;
            set;
        }
        public String vehicle_make
        {
            get;
            set;
        }
        public String vehicle_model
        {
            get;
            set;
        }
        public String vehicle_type
        {
            get;
            set;
        }
        public Int32 vehicle_year
        {
            get;
            set;
        }
        public String vehicle_desc
        {
            get;
            set;
        }
        public String vin
        {
            get;
            set;
        }
        public Int32 start_mileage
        {
            get;
            set;
        }
        public DateTime first_service_date
        {
            get;
            set;
        }
        public DateTime last_service_date
        {
            get;
            set;
        }
        public String PLATENUMBER
        {
            get;
            set;
        }
        public String FUELTYPE
        {
            get;
            set;
        }
        public Int32 MPH
        {
            get;
            set;
        }
        public String INSURED
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            vehicle_id = 0;
            case_id = 0;
            client_id = 0;
            vehicle_make = "";
            vehicle_model = "";
            vehicle_type = "";
            vehicle_year = 0;
            vehicle_desc = "";
            vin = "";
            start_mileage = 0;
            first_service_date = DateTime.Now;
            last_service_date = DateTime.Now;
            PLATENUMBER = "";
            FUELTYPE = "";
            MPH = 0;
            INSURED = "";
        }
        public vehicle Select(int id)
        {
            vehicle vehicle = new vehicle();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VEHICLE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@vehicle_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        vehicle.vehicle_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        vehicle.vehicle_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        vehicle.case_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        vehicle.case_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        vehicle.client_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        vehicle.client_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        vehicle.vehicle_make = rdr.GetString(3);
                    }
                    else
                    {
                        vehicle.vehicle_make = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        vehicle.vehicle_model = rdr.GetString(4);
                    }
                    else
                    {
                        vehicle.vehicle_model = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        vehicle.vehicle_type = rdr.GetString(5);
                    }
                    else
                    {
                        vehicle.vehicle_type = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        vehicle.vehicle_year = rdr.GetInt32(6);
                    }
                    else
                    {
                        vehicle.vehicle_year = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        vehicle.vehicle_desc = rdr.GetString(7);
                    }
                    else
                    {
                        vehicle.vehicle_desc = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        vehicle.vin = rdr.GetString(8);
                    }
                    else
                    {
                        vehicle.vin = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        vehicle.start_mileage = rdr.GetInt32(9);
                    }
                    else
                    {
                        vehicle.start_mileage = 0;
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        vehicle.first_service_date = rdr.GetDateTime(10);
                    }
                    else
                    {
                        vehicle.first_service_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        vehicle.last_service_date = rdr.GetDateTime(11);
                    }
                    else
                    {
                        vehicle.last_service_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        vehicle.PLATENUMBER = rdr.GetString(12);
                    }
                    else
                    {
                        vehicle.PLATENUMBER = " ";
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        vehicle.FUELTYPE = rdr.GetString(13);
                    }
                    else
                    {
                        vehicle.FUELTYPE = " ";
                    }
                    if (!rdr.IsDBNull(14))
                    {
                        vehicle.MPH = rdr.GetInt32(14);
                    }
                    else
                    {
                        vehicle.MPH = 0;
                    }
                    if (!rdr.IsDBNull(15))
                    {
                        vehicle.INSURED = rdr.GetString(15);
                    }
                    else
                    {
                        vehicle.INSURED = " ";
                    }
                    }
                    else
                    {
                    vehicle.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                vehicle.SetColumnDefaults();
                return vehicle;
                }
            finally
            {
                con.Close();
            }
            return vehicle;
        }

        public vehicle Insert(vehicle id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_VEHICLE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@vehicle_make", id.vehicle_make);
                cmd.Parameters.AddWithValue("@vehicle_model", id.vehicle_model);
                cmd.Parameters.AddWithValue("@vehicle_type", id.vehicle_type);
                cmd.Parameters.AddWithValue("@vehicle_year", id.vehicle_year);
                cmd.Parameters.AddWithValue("@vehicle_desc", id.vehicle_desc);
                cmd.Parameters.AddWithValue("@vin", id.vin);
                cmd.Parameters.AddWithValue("@start_mileage", id.start_mileage);
                cmd.Parameters.AddWithValue("@first_service_date", id.first_service_date);
                cmd.Parameters.AddWithValue("@last_service_date", id.last_service_date);
                cmd.Parameters.AddWithValue("@PLATENUMBER", id.PLATENUMBER);
                cmd.Parameters.AddWithValue("@FUELTYPE", id.FUELTYPE);
                cmd.Parameters.AddWithValue("@MPH", id.MPH);
                cmd.Parameters.AddWithValue("@INSURED", id.INSURED);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_VEHICLE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@vehicle_make", id.vehicle_make);
                cmd.Parameters.AddWithValue("@vehicle_model", id.vehicle_model);
                cmd.Parameters.AddWithValue("@vehicle_type", id.vehicle_type);
                cmd.Parameters.AddWithValue("@vehicle_year", id.vehicle_year);
                cmd.Parameters.AddWithValue("@vehicle_desc", id.vehicle_desc);
                cmd.Parameters.AddWithValue("@vin", id.vin);
                cmd.Parameters.AddWithValue("@start_mileage", id.start_mileage);
                cmd.Parameters.AddWithValue("@first_service_date", id.first_service_date);
                cmd.Parameters.AddWithValue("@last_service_date", id.last_service_date);
                cmd.Parameters.AddWithValue("@PLATENUMBER", id.PLATENUMBER);
                cmd.Parameters.AddWithValue("@FUELTYPE", id.FUELTYPE);
                cmd.Parameters.AddWithValue("@MPH", id.MPH);
                cmd.Parameters.AddWithValue("@INSURED", id.INSURED);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.vehicle_id = rdr.GetInt32(0);
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
        public Boolean Update(vehicle id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_VEHICLE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@vehicle_id", id.vehicle_id);
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@vehicle_make", id.vehicle_make);
                cmd.Parameters.AddWithValue("@vehicle_model", id.vehicle_model);
                cmd.Parameters.AddWithValue("@vehicle_type", id.vehicle_type);
                cmd.Parameters.AddWithValue("@vehicle_year", id.vehicle_year);
                cmd.Parameters.AddWithValue("@vehicle_desc", id.vehicle_desc);
                cmd.Parameters.AddWithValue("@vin", id.vin);
                cmd.Parameters.AddWithValue("@start_mileage", id.start_mileage);
                cmd.Parameters.AddWithValue("@first_service_date", id.first_service_date);
                cmd.Parameters.AddWithValue("@last_service_date", id.last_service_date);
                cmd.Parameters.AddWithValue("@PLATENUMBER", id.PLATENUMBER);
                cmd.Parameters.AddWithValue("@FUELTYPE", id.FUELTYPE);
                cmd.Parameters.AddWithValue("@MPH", id.MPH);
                cmd.Parameters.AddWithValue("@INSURED", id.INSURED);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_VEHICLE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@vehicle_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VEHICLE_WC", con);
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




