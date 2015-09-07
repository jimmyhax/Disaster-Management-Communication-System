using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class house : System.Web.UI.Page
    {
        public Int32 house_id
        {
            get;
            set;
        }
        public String house_name
        {
            get;
            set;
        }
        public String house_eligibility
        {
            get;
            set;
        }
        public DateTime house_request_date
        {
            get;
            set;
        }
        public Decimal house_voucher_amt
        {
            get;
            set;
        }
        public DateTime house_voucher_begin_date
        {
            get;
            set;
        }
        public DateTime house_voucher_exp_date
        {
            get;
            set;
        }
        public Int32 house_voucher_num
        {
            get;
            set;
        }
        public String house_voucher_schedule
        {
            get;
            set;
        }
        public Int32 house_wait_list
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            house_id = 0;
            house_name = "";
            house_eligibility = "";
            house_request_date = DateTime.Now;
            house_voucher_amt = 0;
            house_voucher_begin_date = DateTime.Now;
            house_voucher_exp_date = DateTime.Now;
            house_voucher_num = 0;
            house_voucher_schedule = "";
            house_wait_list = 0;
        }
        public house Select(int id)
        {
            house house = new house();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_HOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        house.house_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        house.house_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        house.house_name = rdr.GetString(1);
                    }
                    else
                    {
                        house.house_name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        house.house_eligibility = rdr.GetString(2);
                    }
                    else
                    {
                        house.house_eligibility = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        house.house_request_date = rdr.GetDateTime(3);
                    }
                    else
                    {
                        house.house_request_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        house.house_voucher_amt = rdr.GetDecimal(4);
                    }
                    else
                    {
                        house.house_voucher_amt = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        house.house_voucher_begin_date = rdr.GetDateTime(5);
                    }
                    else
                    {
                        house.house_voucher_begin_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        house.house_voucher_exp_date = rdr.GetDateTime(6);
                    }
                    else
                    {
                        house.house_voucher_exp_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        house.house_voucher_num = rdr.GetInt32(7);
                    }
                    else
                    {
                        house.house_voucher_num = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        house.house_voucher_schedule = rdr.GetString(8);
                    }
                    else
                    {
                        house.house_voucher_schedule = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        house.house_wait_list = rdr.GetInt32(9);
                    }
                    else
                    {
                        house.house_wait_list = 0;
                    }
                    }
                    else
                    {
                    house.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                house.SetColumnDefaults();
                return house;
                }
            finally
            {
                con.Close();
            }
            return house;
        }

        public house Insert(house id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_HOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_name", id.house_name);
                cmd.Parameters.AddWithValue("@house_eligibility", id.house_eligibility);
                cmd.Parameters.AddWithValue("@house_request_date", id.house_request_date);
                cmd.Parameters.AddWithValue("@house_voucher_amt", id.house_voucher_amt);
                cmd.Parameters.AddWithValue("@house_voucher_begin_date", id.house_voucher_begin_date);
                cmd.Parameters.AddWithValue("@house_voucher_exp_date", id.house_voucher_exp_date);
                cmd.Parameters.AddWithValue("@house_voucher_num", id.house_voucher_num);
                cmd.Parameters.AddWithValue("@house_voucher_schedule", id.house_voucher_schedule);
                cmd.Parameters.AddWithValue("@house_wait_list", id.house_wait_list);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_HOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_name", id.house_name);
                cmd.Parameters.AddWithValue("@house_eligibility", id.house_eligibility);
                cmd.Parameters.AddWithValue("@house_request_date", id.house_request_date);
                cmd.Parameters.AddWithValue("@house_voucher_amt", id.house_voucher_amt);
                cmd.Parameters.AddWithValue("@house_voucher_begin_date", id.house_voucher_begin_date);
                cmd.Parameters.AddWithValue("@house_voucher_exp_date", id.house_voucher_exp_date);
                cmd.Parameters.AddWithValue("@house_voucher_num", id.house_voucher_num);
                cmd.Parameters.AddWithValue("@house_voucher_schedule", id.house_voucher_schedule);
                cmd.Parameters.AddWithValue("@house_wait_list", id.house_wait_list);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.house_id = rdr.GetInt32(0);
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
        public Boolean Update(house id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_HOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_id", id.house_id);
                cmd.Parameters.AddWithValue("@house_name", id.house_name);
                cmd.Parameters.AddWithValue("@house_eligibility", id.house_eligibility);
                cmd.Parameters.AddWithValue("@house_request_date", id.house_request_date);
                cmd.Parameters.AddWithValue("@house_voucher_amt", id.house_voucher_amt);
                cmd.Parameters.AddWithValue("@house_voucher_begin_date", id.house_voucher_begin_date);
                cmd.Parameters.AddWithValue("@house_voucher_exp_date", id.house_voucher_exp_date);
                cmd.Parameters.AddWithValue("@house_voucher_num", id.house_voucher_num);
                cmd.Parameters.AddWithValue("@house_voucher_schedule", id.house_voucher_schedule);
                cmd.Parameters.AddWithValue("@house_wait_list", id.house_wait_list);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_HOUSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_HOUSE_WC", con);
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




