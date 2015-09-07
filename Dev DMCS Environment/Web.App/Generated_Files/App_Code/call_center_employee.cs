using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class call_center_employee : System.Web.UI.Page
    {
        public Int32 call_center_employee_id
        {
            get;
            set;
        }
        public Int32 call_center_id
        {
            get;
            set;
        }
        public Int32 employee_id
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            call_center_employee_id = 0;
            call_center_id = 0;
            employee_id = 0;
        }
        public call_center_employee Select(int id)
        {
            call_center_employee call_center_employee = new call_center_employee();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_employee_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        call_center_employee.call_center_employee_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        call_center_employee.call_center_employee_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        call_center_employee.call_center_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        call_center_employee.call_center_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        call_center_employee.employee_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        call_center_employee.employee_id = 0;
                    }
                    }
                    else
                    {
                    call_center_employee.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                call_center_employee.SetColumnDefaults();
                return call_center_employee;
                }
            finally
            {
                con.Close();
            }
            return call_center_employee;
        }

        public call_center_employee Insert(call_center_employee id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_CALL_CENTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.call_center_employee_id = rdr.GetInt32(0);
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
        public Boolean Update(call_center_employee id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_employee_id", id.call_center_employee_id);
                cmd.Parameters.AddWithValue("@call_center_id", id.call_center_id);
                cmd.Parameters.AddWithValue("@employee_id", id.employee_id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@call_center_employee_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE_WC", con);
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




