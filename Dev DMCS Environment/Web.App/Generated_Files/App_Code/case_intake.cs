using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class case_intake : System.Web.UI.Page
    {
        public Int32 case_id
        {
            get;
            set;
        }
        public DateTime applic_end_date_time
        {
            get;
            set;
        }
        public DateTime applic_start_date_time
        {
            get;
            set;
        }
        public String circum_emergency_event
        {
            get;
            set;
        }
        public String circum_help_request_memo
        {
            get;
            set;
        }
        public String circum_income_stolen
        {
            get;
            set;
        }
        public String circum_memo
        {
            get;
            set;
        }
        public String circum_no_income
        {
            get;
            set;
        }
        public String circum_not_enough_income
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

        public void SetColumnDefaults()
        {
            case_id = 0;
            applic_end_date_time = DateTime.Now;
            applic_start_date_time = DateTime.Now;
            circum_emergency_event = "";
            circum_help_request_memo = "";
            circum_income_stolen = "";
            circum_memo = "";
            circum_no_income = "";
            circum_not_enough_income = "";
            agency_id = 0;
            call_center_id = 0;
        }
        public case_intake Select(int id)
        {
            case_intake case_intake = new case_intake();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CASE_INTAKE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        case_intake.case_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        case_intake.case_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        case_intake.applic_end_date_time = rdr.GetDateTime(1);
                    }
                    else
                    {
                        case_intake.applic_end_date_time = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        case_intake.applic_start_date_time = rdr.GetDateTime(2);
                    }
                    else
                    {
                        case_intake.applic_start_date_time = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        case_intake.circum_emergency_event = rdr.GetString(3);
                    }
                    else
                    {
                        case_intake.circum_emergency_event = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        case_intake.circum_help_request_memo = rdr.GetString(4);
                    }
                    else
                    {
                        case_intake.circum_help_request_memo = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        case_intake.circum_income_stolen = rdr.GetString(5);
                    }
                    else
                    {
                        case_intake.circum_income_stolen = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        case_intake.circum_memo = rdr.GetString(6);
                    }
                    else
                    {
                        case_intake.circum_memo = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        case_intake.circum_no_income = rdr.GetString(7);
                    }
                    else
                    {
                        case_intake.circum_no_income = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        case_intake.circum_not_enough_income = rdr.GetString(8);
                    }
                    else
                    {
                        case_intake.circum_not_enough_income = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        case_intake.agency_id = rdr.GetInt32(9);
                    }
                    else
                    {
                        case_intake.agency_id = 0;
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        case_intake.call_center_id = rdr.GetInt32(10);
                    }
                    else
                    {
                        case_intake.call_center_id = 0;
                    }
                    }
                    else
                    {
                    case_intake.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                case_intake.SetColumnDefaults();
                return case_intake;
                }
            finally
            {
                con.Close();
            }
            return case_intake;
        }

        public case_intake Insert(case_intake id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CASE_INTAKE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@applic_end_date_time", id.applic_end_date_time);
                cmd.Parameters.AddWithValue("@applic_start_date_time", id.applic_start_date_time);
                cmd.Parameters.AddWithValue("@circum_emergency_event", id.circum_emergency_event);
                cmd.Parameters.AddWithValue("@circum_help_request_memo", id.circum_help_request_memo);
                cmd.Parameters.AddWithValue("@circum_income_stolen", id.circum_income_stolen);
                cmd.Parameters.AddWithValue("@circum_memo", id.circum_memo);
                cmd.Parameters.AddWithValue("@circum_no_income", id.circum_no_income);
                cmd.Parameters.AddWithValue("@circum_not_enough_income", id.circum_not_enough_income);
                cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_CASE_INTAKE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@applic_end_date_time", id.applic_end_date_time);
                cmd.Parameters.AddWithValue("@applic_start_date_time", id.applic_start_date_time);
                cmd.Parameters.AddWithValue("@circum_emergency_event", id.circum_emergency_event);
                cmd.Parameters.AddWithValue("@circum_help_request_memo", id.circum_help_request_memo);
                cmd.Parameters.AddWithValue("@circum_income_stolen", id.circum_income_stolen);
                cmd.Parameters.AddWithValue("@circum_memo", id.circum_memo);
                cmd.Parameters.AddWithValue("@circum_no_income", id.circum_no_income);
                cmd.Parameters.AddWithValue("@circum_not_enough_income", id.circum_not_enough_income);
                cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.case_id = rdr.GetInt32(0);
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
        public Boolean Update(case_intake id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CASE_INTAKE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@applic_end_date_time", id.applic_end_date_time);
                cmd.Parameters.AddWithValue("@applic_start_date_time", id.applic_start_date_time);
                cmd.Parameters.AddWithValue("@circum_emergency_event", id.circum_emergency_event);
                cmd.Parameters.AddWithValue("@circum_help_request_memo", id.circum_help_request_memo);
                cmd.Parameters.AddWithValue("@circum_income_stolen", id.circum_income_stolen);
                cmd.Parameters.AddWithValue("@circum_memo", id.circum_memo);
                cmd.Parameters.AddWithValue("@circum_no_income", id.circum_no_income);
                cmd.Parameters.AddWithValue("@circum_not_enough_income", id.circum_not_enough_income);
                cmd.Parameters.AddWithValue("@agency_id", id.agency_id);
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CASE_INTAKE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CASE_INTAKE_WC", con);
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




