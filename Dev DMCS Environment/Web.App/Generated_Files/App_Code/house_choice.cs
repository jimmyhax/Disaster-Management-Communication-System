using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class house_choice : System.Web.UI.Page
    {
        public Int32 house_choice_id
        {
            get;
            set;
        }
        public Int32 house_id
        {
            get;
            set;
        }
        public Int32 address_id
        {
            get;
            set;
        }
        public Int32 house_choice_bathrooms
        {
            get;
            set;
        }
        public String house_choice_comments
        {
            get;
            set;
        }
        public Int32 house_choice_contact_person_id
        {
            get;
            set;
        }
        public String house_choice_laundry
        {
            get;
            set;
        }
        public Int32 house_choice_no_floors
        {
            get;
            set;
        }
        public String house_choice_parking
        {
            get;
            set;
        }
        public Decimal house_choice_rent
        {
            get;
            set;
        }
        public String house_choice_type
        {
            get;
            set;
        }
        public Int32 house_choice_units_avail
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            house_choice_id = 0;
            house_id = 0;
            address_id = 0;
            house_choice_bathrooms = 0;
            house_choice_comments = "";
            house_choice_contact_person_id = 0;
            house_choice_laundry = "";
            house_choice_no_floors = 0;
            house_choice_parking = "";
            house_choice_rent = 0;
            house_choice_type = "";
            house_choice_units_avail = 0;
        }
        public house_choice Select(int id)
        {
            house_choice house_choice = new house_choice();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_HOUSE_CHOICE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_choice_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        house_choice.house_choice_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        house_choice.house_choice_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        house_choice.house_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        house_choice.house_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        house_choice.address_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        house_choice.address_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        house_choice.house_choice_bathrooms = rdr.GetInt32(3);
                    }
                    else
                    {
                        house_choice.house_choice_bathrooms = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        house_choice.house_choice_comments = rdr.GetString(4);
                    }
                    else
                    {
                        house_choice.house_choice_comments = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        house_choice.house_choice_contact_person_id = rdr.GetInt32(5);
                    }
                    else
                    {
                        house_choice.house_choice_contact_person_id = 0;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        house_choice.house_choice_laundry = rdr.GetString(6);
                    }
                    else
                    {
                        house_choice.house_choice_laundry = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        house_choice.house_choice_no_floors = rdr.GetInt32(7);
                    }
                    else
                    {
                        house_choice.house_choice_no_floors = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        house_choice.house_choice_parking = rdr.GetString(8);
                    }
                    else
                    {
                        house_choice.house_choice_parking = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        house_choice.house_choice_rent = rdr.GetDecimal(9);
                    }
                    else
                    {
                        house_choice.house_choice_rent = 0;
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        house_choice.house_choice_type = rdr.GetString(10);
                    }
                    else
                    {
                        house_choice.house_choice_type = " ";
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        house_choice.house_choice_units_avail = rdr.GetInt32(11);
                    }
                    else
                    {
                        house_choice.house_choice_units_avail = 0;
                    }
                    }
                    else
                    {
                    house_choice.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                house_choice.SetColumnDefaults();
                return house_choice;
                }
            finally
            {
                con.Close();
            }
            return house_choice;
        }

        public house_choice Insert(house_choice id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_HOUSE_CHOICE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_id", id.house_id);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@house_choice_bathrooms", id.house_choice_bathrooms);
                cmd.Parameters.AddWithValue("@house_choice_comments", id.house_choice_comments);
                cmd.Parameters.AddWithValue("@house_choice_contact_person_id", id.house_choice_contact_person_id);
                cmd.Parameters.AddWithValue("@house_choice_laundry", id.house_choice_laundry);
                cmd.Parameters.AddWithValue("@house_choice_no_floors", id.house_choice_no_floors);
                cmd.Parameters.AddWithValue("@house_choice_parking", id.house_choice_parking);
                cmd.Parameters.AddWithValue("@house_choice_rent", id.house_choice_rent);
                cmd.Parameters.AddWithValue("@house_choice_type", id.house_choice_type);
                cmd.Parameters.AddWithValue("@house_choice_units_avail", id.house_choice_units_avail);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_HOUSE_CHOICE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_id", id.house_id);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@house_choice_bathrooms", id.house_choice_bathrooms);
                cmd.Parameters.AddWithValue("@house_choice_comments", id.house_choice_comments);
                cmd.Parameters.AddWithValue("@house_choice_contact_person_id", id.house_choice_contact_person_id);
                cmd.Parameters.AddWithValue("@house_choice_laundry", id.house_choice_laundry);
                cmd.Parameters.AddWithValue("@house_choice_no_floors", id.house_choice_no_floors);
                cmd.Parameters.AddWithValue("@house_choice_parking", id.house_choice_parking);
                cmd.Parameters.AddWithValue("@house_choice_rent", id.house_choice_rent);
                cmd.Parameters.AddWithValue("@house_choice_type", id.house_choice_type);
                cmd.Parameters.AddWithValue("@house_choice_units_avail", id.house_choice_units_avail);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.house_choice_id = rdr.GetInt32(0);
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
        public Boolean Update(house_choice id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_HOUSE_CHOICE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_choice_id", id.house_choice_id);
                cmd.Parameters.AddWithValue("@house_id", id.house_id);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@house_choice_bathrooms", id.house_choice_bathrooms);
                cmd.Parameters.AddWithValue("@house_choice_comments", id.house_choice_comments);
                cmd.Parameters.AddWithValue("@house_choice_contact_person_id", id.house_choice_contact_person_id);
                cmd.Parameters.AddWithValue("@house_choice_laundry", id.house_choice_laundry);
                cmd.Parameters.AddWithValue("@house_choice_no_floors", id.house_choice_no_floors);
                cmd.Parameters.AddWithValue("@house_choice_parking", id.house_choice_parking);
                cmd.Parameters.AddWithValue("@house_choice_rent", id.house_choice_rent);
                cmd.Parameters.AddWithValue("@house_choice_type", id.house_choice_type);
                cmd.Parameters.AddWithValue("@house_choice_units_avail", id.house_choice_units_avail);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_HOUSE_CHOICE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@house_choice_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_HOUSE_CHOICE_WC", con);
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




