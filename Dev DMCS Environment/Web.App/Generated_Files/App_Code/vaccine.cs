using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class vaccine : System.Web.UI.Page
    {
        public Int32 vaccine_id
        {
            get;
            set;
        }
        public Int32 medicine_id
        {
            get;
            set;
        }
        public Int32 Num_of_reg_doses
        {
            get;
            set;
        }
        public String vaccine_name
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            vaccine_id = 0;
            medicine_id = 0;
            Num_of_reg_doses = 0;
            vaccine_name = "";
        }
        public vaccine Select(int id)
        {
            vaccine vaccine = new vaccine();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VACCINE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@vaccine_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        vaccine.vaccine_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        vaccine.vaccine_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        vaccine.medicine_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        vaccine.medicine_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        vaccine.Num_of_reg_doses = rdr.GetInt32(2);
                    }
                    else
                    {
                        vaccine.Num_of_reg_doses = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        vaccine.vaccine_name = rdr.GetString(3);
                    }
                    else
                    {
                        vaccine.vaccine_name = " ";
                    }
                    }
                    else
                    {
                    vaccine.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                vaccine.SetColumnDefaults();
                return vaccine;
                }
            finally
            {
                con.Close();
            }
            return vaccine;
        }

        public vaccine Insert(vaccine id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_VACCINE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@medicine_id", id.medicine_id);
                cmd.Parameters.AddWithValue("@Num_of_reg_doses", id.Num_of_reg_doses);
                cmd.Parameters.AddWithValue("@vaccine_name", id.vaccine_name);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_VACCINE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@medicine_id", id.medicine_id);
                cmd.Parameters.AddWithValue("@Num_of_reg_doses", id.Num_of_reg_doses);
                cmd.Parameters.AddWithValue("@vaccine_name", id.vaccine_name);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.vaccine_id = rdr.GetInt32(0);
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
        public Boolean Update(vaccine id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_VACCINE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@vaccine_id", id.vaccine_id);
                cmd.Parameters.AddWithValue("@medicine_id", id.medicine_id);
                cmd.Parameters.AddWithValue("@Num_of_reg_doses", id.Num_of_reg_doses);
                cmd.Parameters.AddWithValue("@vaccine_name", id.vaccine_name);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_VACCINE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@vaccine_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_VACCINE_WC", con);
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




