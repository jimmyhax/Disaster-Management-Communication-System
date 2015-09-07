using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Inspection_Status : System.Web.UI.Page
    {
        public Int32 InspectionStatus_ID
        {
            get;
            set;
        }
        public Int32 Evacuation_Area_ID
        {
            get;
            set;
        }
        public Int32 Address_ID
        {
            get;
            set;
        }
        public String Inspection_Code
        {
            get;
            set;
        }
        public String Client_Found
        {
            get;
            set;
        }
        public String Client_Found_Status
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            InspectionStatus_ID = 0;
            Evacuation_Area_ID = 0;
            Address_ID = 0;
            Inspection_Code = "";
            Client_Found = "";
            Client_Found_Status = "";
        }
        public Inspection_Status Select(int id)
        {
            Inspection_Status Inspection_Status = new Inspection_Status();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_INSPECTION_STATUS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@InspectionStatus_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Inspection_Status.InspectionStatus_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Inspection_Status.InspectionStatus_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Inspection_Status.Evacuation_Area_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Inspection_Status.Evacuation_Area_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Inspection_Status.Address_ID = rdr.GetInt32(2);
                    }
                    else
                    {
                        Inspection_Status.Address_ID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Inspection_Status.Inspection_Code = rdr.GetString(3);
                    }
                    else
                    {
                        Inspection_Status.Inspection_Code = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Inspection_Status.Client_Found = rdr.GetString(4);
                    }
                    else
                    {
                        Inspection_Status.Client_Found = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Inspection_Status.Client_Found_Status = rdr.GetString(5);
                    }
                    else
                    {
                        Inspection_Status.Client_Found_Status = " ";
                    }
                    }
                    else
                    {
                    Inspection_Status.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Inspection_Status.SetColumnDefaults();
                return Inspection_Status;
                }
            finally
            {
                con.Close();
            }
            return Inspection_Status;
        }

        public Inspection_Status Insert(Inspection_Status id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_INSPECTION_STATUS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
                cmd.Parameters.AddWithValue("@Address_ID", id.Address_ID);
                cmd.Parameters.AddWithValue("@Inspection_Code", id.Inspection_Code);
                cmd.Parameters.AddWithValue("@Client_Found", id.Client_Found);
                cmd.Parameters.AddWithValue("@Client_Found_Status", id.Client_Found_Status);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_INSPECTION_STATUS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
                cmd.Parameters.AddWithValue("@Address_ID", id.Address_ID);
                cmd.Parameters.AddWithValue("@Inspection_Code", id.Inspection_Code);
                cmd.Parameters.AddWithValue("@Client_Found", id.Client_Found);
                cmd.Parameters.AddWithValue("@Client_Found_Status", id.Client_Found_Status);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.InspectionStatus_ID = rdr.GetInt32(0);
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
        public Boolean Update(Inspection_Status id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_INSPECTION_STATUS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@InspectionStatus_ID", id.InspectionStatus_ID);
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
                cmd.Parameters.AddWithValue("@Address_ID", id.Address_ID);
                cmd.Parameters.AddWithValue("@Inspection_Code", id.Inspection_Code);
                cmd.Parameters.AddWithValue("@Client_Found", id.Client_Found);
                cmd.Parameters.AddWithValue("@Client_Found_Status", id.Client_Found_Status);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_INSPECTION_STATUS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@InspectionStatus_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_INSPECTION_STATUS_WC", con);
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




