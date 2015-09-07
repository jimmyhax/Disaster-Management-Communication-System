using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Evacuation_Encounter_Shelter_Employee : System.Web.UI.Page
    {
        public Int32 Evacuation_Encounter_Shelter_Employee_ID
        {
            get;
            set;
        }
        public Int32 Shelter_ID
        {
            get;
            set;
        }
        public Int32 Employee_ID
        {
            get;
            set;
        }
        public Int32 Evacuation_Area_ID
        {
            get;
            set;
        }
        public Int32 Encounter_ID
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Evacuation_Encounter_Shelter_Employee_ID = 0;
            Shelter_ID = 0;
            Employee_ID = 0;
            Evacuation_Area_ID = 0;
            Encounter_ID = 0;
        }
        public Evacuation_Encounter_Shelter_Employee Select(int id)
        {
            Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee = new Evacuation_Encounter_Shelter_Employee();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Encounter_Shelter_Employee_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Evacuation_Encounter_Shelter_Employee.Shelter_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Evacuation_Encounter_Shelter_Employee.Shelter_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Evacuation_Encounter_Shelter_Employee.Employee_ID = rdr.GetInt32(2);
                    }
                    else
                    {
                        Evacuation_Encounter_Shelter_Employee.Employee_ID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID = rdr.GetInt32(3);
                    }
                    else
                    {
                        Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Evacuation_Encounter_Shelter_Employee.Encounter_ID = rdr.GetInt32(4);
                    }
                    else
                    {
                        Evacuation_Encounter_Shelter_Employee.Encounter_ID = 0;
                    }
                    }
                    else
                    {
                    Evacuation_Encounter_Shelter_Employee.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Evacuation_Encounter_Shelter_Employee.SetColumnDefaults();
                return Evacuation_Encounter_Shelter_Employee;
                }
            finally
            {
                con.Close();
            }
            return Evacuation_Encounter_Shelter_Employee;
        }

        public Evacuation_Encounter_Shelter_Employee Insert(Evacuation_Encounter_Shelter_Employee id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
                cmd.Parameters.AddWithValue("@Employee_ID", id.Employee_ID);
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
                cmd.Parameters.AddWithValue("@Encounter_ID", id.Encounter_ID);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
                cmd.Parameters.AddWithValue("@Employee_ID", id.Employee_ID);
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
                cmd.Parameters.AddWithValue("@Encounter_ID", id.Encounter_ID);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Evacuation_Encounter_Shelter_Employee_ID = rdr.GetInt32(0);
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
        public Boolean Update(Evacuation_Encounter_Shelter_Employee id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Encounter_Shelter_Employee_ID", id.Evacuation_Encounter_Shelter_Employee_ID);
                cmd.Parameters.AddWithValue("@Shelter_ID", id.Shelter_ID);
                cmd.Parameters.AddWithValue("@Employee_ID", id.Employee_ID);
                cmd.Parameters.AddWithValue("@Evacuation_Area_ID", id.Evacuation_Area_ID);
                cmd.Parameters.AddWithValue("@Encounter_ID", id.Encounter_ID);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Evacuation_Encounter_Shelter_Employee_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE_WC", con);
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




