using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class FEMA : System.Web.UI.Page
    {
        public Int32 FEMA_ID
        {
            get;
            set;
        }
        public Int32 Cost_Code
        {
            get;
            set;
        }
        public String Equipment
        {
            get;
            set;
        }
        public String Specification
        {
            get;
            set;
        }
        public String Capacity_Size
        {
            get;
            set;
        }
        public String HP
        {
            get;
            set;
        }
        public String Notes
        {
            get;
            set;
        }
        public String Unit
        {
            get;
            set;
        }
        public String Rate
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            FEMA_ID = 0;
            Cost_Code = 0;
            Equipment = "";
            Specification = "";
            Capacity_Size = "";
            HP = "";
            Notes = "";
            Unit = "";
            Rate = "";
        }
        public FEMA Select(int id)
        {
            FEMA FEMA = new FEMA();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_FEMA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FEMA_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        FEMA.FEMA_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        FEMA.FEMA_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        FEMA.Cost_Code = rdr.GetInt32(1);
                    }
                    else
                    {
                        FEMA.Cost_Code = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        FEMA.Equipment = rdr.GetString(2);
                    }
                    else
                    {
                        FEMA.Equipment = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        FEMA.Specification = rdr.GetString(3);
                    }
                    else
                    {
                        FEMA.Specification = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        FEMA.Capacity_Size = rdr.GetString(4);
                    }
                    else
                    {
                        FEMA.Capacity_Size = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        FEMA.HP = rdr.GetString(5);
                    }
                    else
                    {
                        FEMA.HP = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        FEMA.Notes = rdr.GetString(6);
                    }
                    else
                    {
                        FEMA.Notes = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        FEMA.Unit = rdr.GetString(7);
                    }
                    else
                    {
                        FEMA.Unit = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        FEMA.Rate = rdr.GetString(8);
                    }
                    else
                    {
                        FEMA.Rate = " ";
                    }
                    }
                    else
                    {
                    FEMA.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                FEMA.SetColumnDefaults();
                return FEMA;
                }
            finally
            {
                con.Close();
            }
            return FEMA;
        }

        public FEMA Insert(FEMA id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_FEMA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FEMA_ID", id.FEMA_ID);
                cmd.Parameters.AddWithValue("@Cost_Code", id.Cost_Code);
                cmd.Parameters.AddWithValue("@Equipment", id.Equipment);
                cmd.Parameters.AddWithValue("@Specification", id.Specification);
                cmd.Parameters.AddWithValue("@Capacity_Size", id.Capacity_Size);
                cmd.Parameters.AddWithValue("@HP", id.HP);
                cmd.Parameters.AddWithValue("@Notes", id.Notes);
                cmd.Parameters.AddWithValue("@Unit", id.Unit);
                cmd.Parameters.AddWithValue("@Rate", id.Rate);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_FEMA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Cost_Code", id.Cost_Code);
                cmd.Parameters.AddWithValue("@Equipment", id.Equipment);
                cmd.Parameters.AddWithValue("@Specification", id.Specification);
                cmd.Parameters.AddWithValue("@Capacity_Size", id.Capacity_Size);
                cmd.Parameters.AddWithValue("@HP", id.HP);
                cmd.Parameters.AddWithValue("@Notes", id.Notes);
                cmd.Parameters.AddWithValue("@Unit", id.Unit);
                cmd.Parameters.AddWithValue("@Rate", id.Rate);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.FEMA_ID = rdr.GetInt32(0);
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
        public Boolean Update(FEMA id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_FEMA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FEMA_ID", id.FEMA_ID);
                cmd.Parameters.AddWithValue("@Cost_Code", id.Cost_Code);
                cmd.Parameters.AddWithValue("@Equipment", id.Equipment);
                cmd.Parameters.AddWithValue("@Specification", id.Specification);
                cmd.Parameters.AddWithValue("@Capacity_Size", id.Capacity_Size);
                cmd.Parameters.AddWithValue("@HP", id.HP);
                cmd.Parameters.AddWithValue("@Notes", id.Notes);
                cmd.Parameters.AddWithValue("@Unit", id.Unit);
                cmd.Parameters.AddWithValue("@Rate", id.Rate);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_FEMA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FEMA_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_FEMA_WC", con);
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




