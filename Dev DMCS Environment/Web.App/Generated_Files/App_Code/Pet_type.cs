using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Pet_type : System.Web.UI.Page
    {
        public Int32 Pet_Type_ID
        {
            get;
            set;
        }
        public String Pet_Species
        {
            get;
            set;
        }
        public String Pet_Type
        {
            get;
            set;
        }
        public String Pet_Breed
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Pet_Type_ID = 0;
            Pet_Species = "";
            Pet_Type = "";
            Pet_Breed = "";
        }
        public Pet_type Select(int id)
        {
            Pet_type Pet_type = new Pet_type();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Type_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Pet_type.Pet_Type_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Pet_type.Pet_Type_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Pet_type.Pet_Species = rdr.GetString(1);
                    }
                    else
                    {
                        Pet_type.Pet_Species = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Pet_type.Pet_Type = rdr.GetString(2);
                    }
                    else
                    {
                        Pet_type.Pet_Type = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Pet_type.Pet_Breed = rdr.GetString(3);
                    }
                    else
                    {
                        Pet_type.Pet_Breed = " ";
                    }
                    }
                    else
                    {
                    Pet_type.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Pet_type.SetColumnDefaults();
                return Pet_type;
                }
            finally
            {
                con.Close();
            }
            return Pet_type;
        }

        public Pet_type Insert(Pet_type id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PET_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Species", id.Pet_Species);
                cmd.Parameters.AddWithValue("@Pet_Type", id.Pet_Type);
                cmd.Parameters.AddWithValue("@Pet_Breed", id.Pet_Breed);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PET_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Species", id.Pet_Species);
                cmd.Parameters.AddWithValue("@Pet_Type", id.Pet_Type);
                cmd.Parameters.AddWithValue("@Pet_Breed", id.Pet_Breed);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Pet_Type_ID = rdr.GetInt32(0);
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
        public Boolean Update(Pet_type id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PET_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Type_ID", id.Pet_Type_ID);
                cmd.Parameters.AddWithValue("@Pet_Species", id.Pet_Species);
                cmd.Parameters.AddWithValue("@Pet_Type", id.Pet_Type);
                cmd.Parameters.AddWithValue("@Pet_Breed", id.Pet_Breed);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PET_TYPE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Type_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_TYPE_WC", con);
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




