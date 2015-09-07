using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Evacuation_Area : System.Web.UI.Page
    {
        public Int32 Evacuation_Area_ID
        {
            get;
            set;
        }
        public Int32 Location_ID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Evacuation_Area_ID = 0;
            Location_ID = 0;
        }
        public Evacuation_Area Select(int id)
        {
            Evacuation_Area Evacuation_Area = new Evacuation_Area();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EVACUATION_AREA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Evacuation_Area.Evacuation_Area_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Evacuation_Area.Evacuation_Area_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Evacuation_Area.Location_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Evacuation_Area.Location_ID = 0;
                    }
                    }
                    else
                    {
                    Evacuation_Area.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Evacuation_Area.SetColumnDefaults();
                return Evacuation_Area;
                }
            finally
            {
                con.Close();
            }
            return Evacuation_Area;
        }

        public Evacuation_Area Insert(Evacuation_Area id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EVACUATION_AREA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_EVACUATION_AREA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Evacuation_Area_ID = rdr.GetInt32(0);
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
        public Boolean Update(Evacuation_Area id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EVACUATION_AREA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EVACUATION_AREA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EVACUATION_AREA_WC", con);
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




