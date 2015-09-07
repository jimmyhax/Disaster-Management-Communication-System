using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Pet_Vaccine_Type : System.Web.UI.Page
    {
        public Int32 Vaccine_Type_ID
        {
            get;
            set;
        }
        public String Vaccine_Name
        {
            get;
            set;
        }
        public String Vaccine_Reactions
        {
            get;
            set;
        }
        public String Vaccine_Type
        {
            get;
            set;
        }
        public String Vaccine_Description
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Vaccine_Type_ID = 0;
            Vaccine_Name = "";
            Vaccine_Reactions = "";
            Vaccine_Type = "";
            Vaccine_Description = "";
        }
        public Pet_Vaccine_Type Select(int id)
        {
            Pet_Vaccine_Type Pet_Vaccine_Type = new Pet_Vaccine_Type();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_VACCINE_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Vaccine_Type_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Pet_Vaccine_Type.Vaccine_Type_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Pet_Vaccine_Type.Vaccine_Type_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Pet_Vaccine_Type.Vaccine_Name = rdr.GetString(1);
                    }
                    else
                    {
                        Pet_Vaccine_Type.Vaccine_Name = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Pet_Vaccine_Type.Vaccine_Reactions = rdr.GetString(2);
                    }
                    else
                    {
                        Pet_Vaccine_Type.Vaccine_Reactions = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Pet_Vaccine_Type.Vaccine_Type = rdr.GetString(3);
                    }
                    else
                    {
                        Pet_Vaccine_Type.Vaccine_Type = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Pet_Vaccine_Type.Vaccine_Description = rdr.GetString(4);
                    }
                    else
                    {
                        Pet_Vaccine_Type.Vaccine_Description = " ";
                    }
                    }
                    else
                    {
                    Pet_Vaccine_Type.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Pet_Vaccine_Type.SetColumnDefaults();
                return Pet_Vaccine_Type;
                }
            finally
            {
                con.Close();
            }
            return Pet_Vaccine_Type;
        }

        public Pet_Vaccine_Type Insert(Pet_Vaccine_Type id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PET_VACCINE_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Vaccine_Name", id.Vaccine_Name);
                cmd.Parameters.AddWithValue("@Vaccine_Reactions", id.Vaccine_Reactions);
                cmd.Parameters.AddWithValue("@Vaccine_Type", id.Vaccine_Type);
                cmd.Parameters.AddWithValue("@Vaccine_Description", id.Vaccine_Description);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PET_VACCINE_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Vaccine_Name", id.Vaccine_Name);
                cmd.Parameters.AddWithValue("@Vaccine_Reactions", id.Vaccine_Reactions);
                cmd.Parameters.AddWithValue("@Vaccine_Type", id.Vaccine_Type);
                cmd.Parameters.AddWithValue("@Vaccine_Description", id.Vaccine_Description);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Vaccine_Type_ID = rdr.GetInt32(0);
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
        public Boolean Update(Pet_Vaccine_Type id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PET_VACCINE_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Vaccine_Type_ID", id.Vaccine_Type_ID);
                cmd.Parameters.AddWithValue("@Vaccine_Name", id.Vaccine_Name);
                cmd.Parameters.AddWithValue("@Vaccine_Reactions", id.Vaccine_Reactions);
                cmd.Parameters.AddWithValue("@Vaccine_Type", id.Vaccine_Type);
                cmd.Parameters.AddWithValue("@Vaccine_Description", id.Vaccine_Description);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PET_VACCINE_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Vaccine_Type_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_VACCINE_TYPE_WC", con);
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




