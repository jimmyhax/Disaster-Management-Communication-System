using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Parameters : System.Web.UI.Page
    {
        public Int32 ID
        {
            get;
            set;
        }
        public String Name
        {
            get;
            set;
        }
        public No Type Value
        {
            get;
            set;
        }
        public Int64 MemberID
        {
            get;
            set;
        }
        public DateTime Created
        {
            get;
            set;
        }
        public Int32 TypeID
        {
            get;
            set;
        }
        public DateTime Modified
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            ID = 0;
            Name = "";
            Value = ;
            MemberID = ;
            Created = DateTime.Now;
            TypeID = 0;
            Modified = DateTime.Now;
        }
        public Parameters Select(int id)
        {
            Parameters Parameters = new Parameters();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PARAMETERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Parameters.ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Parameters.ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Parameters.Name = rdr.GetString(1);
                    }
                    else
                    {
                        Parameters.Name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Parameters.Value = 
                    }
                    else
                    {
                        Parameters.Value = ;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Parameters.MemberID = 
                    }
                    else
                    {
                        Parameters.MemberID = ;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Parameters.Created = rdr.GetDateTime(4);
                    }
                    else
                    {
                        Parameters.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Parameters.TypeID = rdr.GetInt32(5);
                    }
                    else
                    {
                        Parameters.TypeID = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Parameters.Modified = rdr.GetDateTime(6);
                    }
                    else
                    {
                        Parameters.Modified = DateTime.Now;
                    }
                    }
                    else
                    {
                    Parameters.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Parameters.SetColumnDefaults();
                return Parameters;
                }
            finally
            {
                con.Close();
            }
            return Parameters;
        }

        public Parameters Insert(Parameters id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PARAMETERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Value", id.Value);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@TypeID", id.TypeID);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PARAMETERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Value", id.Value);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@TypeID", id.TypeID);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.ID = rdr.GetInt32(0);
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
        public Boolean Update(Parameters id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PARAMETERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id.ID);
                cmd.Parameters.AddWithValue("@Name", id.Name);
                cmd.Parameters.AddWithValue("@Value", id.Value);
                cmd.Parameters.AddWithValue("@MemberID", id.MemberID);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@TypeID", id.TypeID);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PARAMETERS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PARAMETERS_WC", con);
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




