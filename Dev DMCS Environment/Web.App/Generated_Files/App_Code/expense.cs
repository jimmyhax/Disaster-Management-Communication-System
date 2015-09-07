using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class expense : System.Web.UI.Page
    {
        public Int32 expense_id
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
        public DateTime date_paid
        {
            get;
            set;
        }
        public Decimal expense_amt_paid
        {
            get;
            set;
        }
        public String expense_amt_paid_to
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            expense_id = 0;
            case_id = 0;
            client_id = 0;
            date_paid = DateTime.Now;
            expense_amt_paid = 0;
            expense_amt_paid_to = "";
        }
        public expense Select(int id)
        {
            expense expense = new expense();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EXPENSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@expense_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        expense.expense_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        expense.expense_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        expense.case_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        expense.case_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        expense.client_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        expense.client_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        expense.date_paid = rdr.GetDateTime(3);
                    }
                    else
                    {
                        expense.date_paid = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        expense.expense_amt_paid = rdr.GetDecimal(4);
                    }
                    else
                    {
                        expense.expense_amt_paid = 0;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        expense.expense_amt_paid_to = rdr.GetString(5);
                    }
                    else
                    {
                        expense.expense_amt_paid_to = " ";
                    }
                    }
                    else
                    {
                    expense.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                expense.SetColumnDefaults();
                return expense;
                }
            finally
            {
                con.Close();
            }
            return expense;
        }

        public expense Insert(expense id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EXPENSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@date_paid", id.date_paid);
                cmd.Parameters.AddWithValue("@expense_amt_paid", id.expense_amt_paid);
                cmd.Parameters.AddWithValue("@expense_amt_paid_to", id.expense_amt_paid_to);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_EXPENSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@date_paid", id.date_paid);
                cmd.Parameters.AddWithValue("@expense_amt_paid", id.expense_amt_paid);
                cmd.Parameters.AddWithValue("@expense_amt_paid_to", id.expense_amt_paid_to);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.expense_id = rdr.GetInt32(0);
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
        public Boolean Update(expense id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EXPENSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@expense_id", id.expense_id);
                cmd.Parameters.AddWithValue("@case_id", id.case_id);
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@date_paid", id.date_paid);
                cmd.Parameters.AddWithValue("@expense_amt_paid", id.expense_amt_paid);
                cmd.Parameters.AddWithValue("@expense_amt_paid_to", id.expense_amt_paid_to);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EXPENSE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@expense_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EXPENSE_WC", con);
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




