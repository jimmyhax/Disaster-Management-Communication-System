using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class medical_assistance : System.Web.UI.Page
    {
        public Int32 medical_assist_order_id
        {
            get;
            set;
        }
        public Int32 em_id
        {
            get;
            set;
        }
        public DateTime medical_assist_date
        {
            get;
            set;
        }
        public Int32 medical_assist_doctor_id
        {
            get;
            set;
        }
        public Decimal medical_assist_hosp_price
        {
            get;
            set;
        }
        public String medical_assist_hospital_name
        {
            get;
            set;
        }
        public String medical_assist_script_meds
        {
            get;
            set;
        }
        public Decimal medical_assist_script_price
        {
            get;
            set;
        }
        public Int32 medical_assist_script_quantity
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            medical_assist_order_id = 0;
            em_id = 0;
            medical_assist_date = DateTime.Now;
            medical_assist_doctor_id = 0;
            medical_assist_hosp_price = 0;
            medical_assist_hospital_name = "";
            medical_assist_script_meds = "";
            medical_assist_script_price = 0;
            medical_assist_script_quantity = 0;
        }
        public medical_assistance Select(int id)
        {
            medical_assistance medical_assistance = new medical_assistance();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEDICAL_ASSISTANCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@medical_assist_order_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        medical_assistance.medical_assist_order_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        medical_assistance.medical_assist_order_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        medical_assistance.em_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        medical_assistance.em_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        medical_assistance.medical_assist_date = rdr.GetDateTime(2);
                    }
                    else
                    {
                        medical_assistance.medical_assist_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        medical_assistance.medical_assist_doctor_id = rdr.GetInt32(3);
                    }
                    else
                    {
                        medical_assistance.medical_assist_doctor_id = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        medical_assistance.medical_assist_hosp_price = rdr.GetDecimal(4);
                    }
                    else
                    {
                        medical_assistance.medical_assist_hosp_price = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        medical_assistance.medical_assist_hospital_name = rdr.GetString(5);
                    }
                    else
                    {
                        medical_assistance.medical_assist_hospital_name = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        medical_assistance.medical_assist_script_meds = rdr.GetString(6);
                    }
                    else
                    {
                        medical_assistance.medical_assist_script_meds = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        medical_assistance.medical_assist_script_price = rdr.GetDecimal(7);
                    }
                    else
                    {
                        medical_assistance.medical_assist_script_price = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        medical_assistance.medical_assist_script_quantity = rdr.GetInt32(8);
                    }
                    else
                    {
                        medical_assistance.medical_assist_script_quantity = 0;
                    }
                    }
                    else
                    {
                    medical_assistance.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                medical_assistance.SetColumnDefaults();
                return medical_assistance;
                }
            finally
            {
                con.Close();
            }
            return medical_assistance;
        }

        public medical_assistance Insert(medical_assistance id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MEDICAL_ASSISTANCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@em_id", id.em_id);
                cmd.Parameters.AddWithValue("@medical_assist_date", id.medical_assist_date);
                cmd.Parameters.AddWithValue("@medical_assist_doctor_id", id.medical_assist_doctor_id);
                cmd.Parameters.AddWithValue("@medical_assist_hosp_price", id.medical_assist_hosp_price);
                cmd.Parameters.AddWithValue("@medical_assist_hospital_name", id.medical_assist_hospital_name);
                cmd.Parameters.AddWithValue("@medical_assist_script_meds", id.medical_assist_script_meds);
                cmd.Parameters.AddWithValue("@medical_assist_script_price", id.medical_assist_script_price);
                cmd.Parameters.AddWithValue("@medical_assist_script_quantity", id.medical_assist_script_quantity);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MEDICAL_ASSISTANCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@em_id", id.em_id);
                cmd.Parameters.AddWithValue("@medical_assist_date", id.medical_assist_date);
                cmd.Parameters.AddWithValue("@medical_assist_doctor_id", id.medical_assist_doctor_id);
                cmd.Parameters.AddWithValue("@medical_assist_hosp_price", id.medical_assist_hosp_price);
                cmd.Parameters.AddWithValue("@medical_assist_hospital_name", id.medical_assist_hospital_name);
                cmd.Parameters.AddWithValue("@medical_assist_script_meds", id.medical_assist_script_meds);
                cmd.Parameters.AddWithValue("@medical_assist_script_price", id.medical_assist_script_price);
                cmd.Parameters.AddWithValue("@medical_assist_script_quantity", id.medical_assist_script_quantity);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.medical_assist_order_id = rdr.GetInt32(0);
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
        public Boolean Update(medical_assistance id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MEDICAL_ASSISTANCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@medical_assist_order_id", id.medical_assist_order_id);
                cmd.Parameters.AddWithValue("@em_id", id.em_id);
                cmd.Parameters.AddWithValue("@medical_assist_date", id.medical_assist_date);
                cmd.Parameters.AddWithValue("@medical_assist_doctor_id", id.medical_assist_doctor_id);
                cmd.Parameters.AddWithValue("@medical_assist_hosp_price", id.medical_assist_hosp_price);
                cmd.Parameters.AddWithValue("@medical_assist_hospital_name", id.medical_assist_hospital_name);
                cmd.Parameters.AddWithValue("@medical_assist_script_meds", id.medical_assist_script_meds);
                cmd.Parameters.AddWithValue("@medical_assist_script_price", id.medical_assist_script_price);
                cmd.Parameters.AddWithValue("@medical_assist_script_quantity", id.medical_assist_script_quantity);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MEDICAL_ASSISTANCE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@medical_assist_order_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MEDICAL_ASSISTANCE_WC", con);
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




