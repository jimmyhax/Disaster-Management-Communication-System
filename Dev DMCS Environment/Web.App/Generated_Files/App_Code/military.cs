using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class military : System.Web.UI.Page
    {
        public Int32 military_id
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
        public DateTime discharge_date
        {
            get;
            set;
        }
        public DateTime enlistment_date
        {
            get;
            set;
        }
        public String military_branch
        {
            get;
            set;
        }
        public Int32 serial_num
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            military_id = 0;
            case_id = 0;
            client_id = 0;
            discharge_date = DateTime.Now;
            enlistment_date = DateTime.Now;
            military_branch = "";
            serial_num = 0;
        }
        public military Select(int id)
        {
            military military = new military();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MILITARY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@military_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        military.military_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        military.military_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        military.case_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        military.case_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        military.client_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        military.client_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        military.discharge_date = rdr.GetDateTime(3);
                    }
                    else
                    {
                        military.discharge_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        military.enlistment_date = rdr.GetDateTime(4);
                    }
                    else
                    {
                        military.enlistment_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        military.military_branch = rdr.GetString(5);
                    }
                    else
                    {
                        military.military_branch = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        military.serial_num = rdr.GetInt32(6);
                    }
                    else
                    {
                        military.serial_num = 0;
                    }
                    }
                    else
                    {
                    military.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                military.SetColumnDefaults();
                return military;
                }
            finally
            {
                con.Close();
            }
            return military;
        }

        public military Insert(military id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_MILITARY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@discharge_date", id.discharge_date);
                cmd.Parameters.AddWithValue("@enlistment_date", id.enlistment_date);
                cmd.Parameters.AddWithValue("@military_branch", id.military_branch);
                cmd.Parameters.AddWithValue("@serial_num", id.serial_num);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_MILITARY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@discharge_date", id.discharge_date);
                cmd.Parameters.AddWithValue("@enlistment_date", id.enlistment_date);
                cmd.Parameters.AddWithValue("@military_branch", id.military_branch);
                cmd.Parameters.AddWithValue("@serial_num", id.serial_num);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.military_id = rdr.GetInt32(0);
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
        public Boolean Update(military id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_MILITARY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@military_id", id.military_id);
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@discharge_date", id.discharge_date);
                cmd.Parameters.AddWithValue("@enlistment_date", id.enlistment_date);
                cmd.Parameters.AddWithValue("@military_branch", id.military_branch);
                cmd.Parameters.AddWithValue("@serial_num", id.serial_num);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_MILITARY", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@military_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_MILITARY_WC", con);
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




