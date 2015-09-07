using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class deceased : System.Web.UI.Page
    {
        public Int32 deceased_id
        {
            get;
            set;
        }
        public DateTime date_of_autopsy
        {
            get;
            set;
        }
        public String external_exam
        {
            get;
            set;
        }
        public String identifying_marks
        {
            get;
            set;
        }
        public String internal_exam
        {
            get;
            set;
        }
        public String reason_of_death
        {
            get;
            set;
        }
        public DateTime time_of_death
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            deceased_id = 0;
            date_of_autopsy = DateTime.Now;
            external_exam = "";
            identifying_marks = "";
            internal_exam = "";
            reason_of_death = "";
            time_of_death = DateTime.Now;
        }
        public deceased Select(int id)
        {
            deceased deceased = new deceased();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DECEASED", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@deceased_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        deceased.deceased_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        deceased.deceased_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        deceased.date_of_autopsy = rdr.GetDateTime(1);
                    }
                    else
                    {
                        deceased.date_of_autopsy = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        deceased.external_exam = rdr.GetString(2);
                    }
                    else
                    {
                        deceased.external_exam = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        deceased.identifying_marks = rdr.GetString(3);
                    }
                    else
                    {
                        deceased.identifying_marks = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        deceased.internal_exam = rdr.GetString(4);
                    }
                    else
                    {
                        deceased.internal_exam = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        deceased.reason_of_death = rdr.GetString(5);
                    }
                    else
                    {
                        deceased.reason_of_death = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        deceased.time_of_death = rdr.GetDateTime(6);
                    }
                    else
                    {
                        deceased.time_of_death = DateTime.Now;
                    }
                    }
                    else
                    {
                    deceased.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                deceased.SetColumnDefaults();
                return deceased;
                }
            finally
            {
                con.Close();
            }
            return deceased;
        }

        public deceased Insert(deceased id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DECEASED", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@deceased_id", id.deceased_id);
                cmd.Parameters.AddWithValue("@date_of_autopsy", id.date_of_autopsy);
                cmd.Parameters.AddWithValue("@external_exam", id.external_exam);
                cmd.Parameters.AddWithValue("@identifying_marks", id.identifying_marks);
                cmd.Parameters.AddWithValue("@internal_exam", id.internal_exam);
                cmd.Parameters.AddWithValue("@reason_of_death", id.reason_of_death);
                cmd.Parameters.AddWithValue("@time_of_death", id.time_of_death);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_DECEASED", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@date_of_autopsy", id.date_of_autopsy);
                cmd.Parameters.AddWithValue("@external_exam", id.external_exam);
                cmd.Parameters.AddWithValue("@identifying_marks", id.identifying_marks);
                cmd.Parameters.AddWithValue("@internal_exam", id.internal_exam);
                cmd.Parameters.AddWithValue("@reason_of_death", id.reason_of_death);
                cmd.Parameters.AddWithValue("@time_of_death", id.time_of_death);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.deceased_id = rdr.GetInt32(0);
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
        public Boolean Update(deceased id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DECEASED", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@deceased_id", id.deceased_id);
                cmd.Parameters.AddWithValue("@date_of_autopsy", id.date_of_autopsy);
                cmd.Parameters.AddWithValue("@external_exam", id.external_exam);
                cmd.Parameters.AddWithValue("@identifying_marks", id.identifying_marks);
                cmd.Parameters.AddWithValue("@internal_exam", id.internal_exam);
                cmd.Parameters.AddWithValue("@reason_of_death", id.reason_of_death);
                cmd.Parameters.AddWithValue("@time_of_death", id.time_of_death);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DECEASED", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@deceased_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DECEASED_WC", con);
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




