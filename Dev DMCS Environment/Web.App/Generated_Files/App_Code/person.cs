using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class person : System.Web.UI.Page
    {
        public Int32 person_id
        {
            get;
            set;
        }
        public Int32 Resource_ID
        {
            get;
            set;
        }
        public Int32 address_id
        {
            get;
            set;
        }
        public Int32 address_id2
        {
            get;
            set;
        }
        public DateTime birthdate
        {
            get;
            set;
        }
        public String certification_number
        {
            get;
            set;
        }
        public String f_name
        {
            get;
            set;
        }
        public String m_initial
        {
            get;
            set;
        }
        public String l_name
        {
            get;
            set;
        }
        public String gender
        {
            get;
            set;
        }
        public String person_type
        {
            get;
            set;
        }
        public String phone_primary
        {
            get;
            set;
        }
        public String phone_secondary
        {
            get;
            set;
        }
        public String email
        {
            get;
            set;
        }
        public Int32 ssn
        {
            get;
            set;
        }
        public String Maiden_Name
        {
            get;
            set;
        }
        public DateTime Visa_Issue_Date
        {
            get;
            set;
        }
        public DateTime Visa_Expire_Date
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_B1
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_B2
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_K1
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_K3
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_L1
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_L2
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_H4
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_F1
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_J1
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_M1
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_H_1B
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_H_2B
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_B_2
        {
            get;
            set;
        }
        public Int32 Visa_Selected_Value_Schengen
        {
            get;
            set;
        }
        public DateTime Perm_Resident_Alien_Resid_Date
        {
            get;
            set;
        }
        public DateTime Perm_Resident_Alien_Expire_Date
        {
            get;
            set;
        }
        public Int32 Perm_Resident_Alien_A_number
        {
            get;
            set;
        }
        public Int32 Perm_Resident_Alien_USCIS_number
        {
            get;
            set;
        }
        public String Perm_Resident_Alien_Birth_Country
        {
            get;
            set;
        }
        public String Perm_Resident_Alien_Category
        {
            get;
            set;
        }
        public String Driver_State_ID
        {
            get;
            set;
        }
        public String Citizenship
        {
            get;
            set;
        }
        public String Marital_Status
        {
            get;
            set;
        }
        public Int32 Minor_Children
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            person_id = 0;
            Resource_ID = 0;
            address_id = 0;
            address_id2 = 0;
            birthdate = DateTime.Now;
            certification_number = "";
            f_name = "";
            m_initial = "";
            l_name = "";
            gender = "";
            person_type = "";
            phone_primary = "";
            phone_secondary = "";
            email = "";
            ssn = 0;
            Maiden_Name = "";
            Visa_Issue_Date = DateTime.Now;
            Visa_Expire_Date = DateTime.Now;
            Visa_Selected_Value_B1 = 0;
            Visa_Selected_Value_B2 = 0;
            Visa_Selected_Value_K1 = 0;
            Visa_Selected_Value_K3 = 0;
            Visa_Selected_Value_L1 = 0;
            Visa_Selected_Value_L2 = 0;
            Visa_Selected_Value_H4 = 0;
            Visa_Selected_Value_F1 = 0;
            Visa_Selected_Value_J1 = 0;
            Visa_Selected_Value_M1 = 0;
            Visa_Selected_Value_H_1B = 0;
            Visa_Selected_Value_H_2B = 0;
            Visa_Selected_Value_B_2 = 0;
            Visa_Selected_Value_Schengen = 0;
            Perm_Resident_Alien_Resid_Date = DateTime.Now;
            Perm_Resident_Alien_Expire_Date = DateTime.Now;
            Perm_Resident_Alien_A_number = 0;
            Perm_Resident_Alien_USCIS_number = 0;
            Perm_Resident_Alien_Birth_Country = "";
            Perm_Resident_Alien_Category = "";
            Driver_State_ID = "";
            Citizenship = "";
            Marital_Status = "";
            Minor_Children = 0;
        }
        public person Select(int id)
        {
            person person = new person();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PERSON", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@person_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        person.person_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        person.person_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        person.Resource_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        person.Resource_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        person.address_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        person.address_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        person.address_id2 = rdr.GetInt32(3);
                    }
                    else
                    {
                        person.address_id2 = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        person.birthdate = rdr.GetDateTime(4);
                    }
                    else
                    {
                        person.birthdate = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        person.certification_number = rdr.GetString(5);
                    }
                    else
                    {
                        person.certification_number = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        person.f_name = rdr.GetString(6);
                    }
                    else
                    {
                        person.f_name = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        person.m_initial = rdr.GetString(7);
                    }
                    else
                    {
                        person.m_initial = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        person.l_name = rdr.GetString(8);
                    }
                    else
                    {
                        person.l_name = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        person.gender = rdr.GetString(9);
                    }
                    else
                    {
                        person.gender = " ";
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        person.person_type = rdr.GetString(10);
                    }
                    else
                    {
                        person.person_type = " ";
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        person.phone_primary = rdr.GetString(11);
                    }
                    else
                    {
                        person.phone_primary = " ";
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        person.phone_secondary = rdr.GetString(12);
                    }
                    else
                    {
                        person.phone_secondary = " ";
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        person.email = rdr.GetString(13);
                    }
                    else
                    {
                        person.email = " ";
                    }
                    if (!rdr.IsDBNull(14))
                    {
                        person.ssn = rdr.GetInt32(14);
                    }
                    else
                    {
                        person.ssn = 0;
                    }
                    if (!rdr.IsDBNull(15))
                    {
                        person.Maiden_Name = rdr.GetString(15);
                    }
                    else
                    {
                        person.Maiden_Name = " ";
                    }
                    if (!rdr.IsDBNull(16))
                    {
                        person.Visa_Issue_Date = rdr.GetDateTime(16);
                    }
                    else
                    {
                        person.Visa_Issue_Date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(17))
                    {
                        person.Visa_Expire_Date = rdr.GetDateTime(17);
                    }
                    else
                    {
                        person.Visa_Expire_Date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(18))
                    {
                        person.Visa_Selected_Value_B1 = rdr.GetInt32(18);
                    }
                    else
                    {
                        person.Visa_Selected_Value_B1 = 0;
                    }
                    if (!rdr.IsDBNull(19))
                    {
                        person.Visa_Selected_Value_B2 = rdr.GetInt32(19);
                    }
                    else
                    {
                        person.Visa_Selected_Value_B2 = 0;
                    }
                    if (!rdr.IsDBNull(20))
                    {
                        person.Visa_Selected_Value_K1 = rdr.GetInt32(20);
                    }
                    else
                    {
                        person.Visa_Selected_Value_K1 = 0;
                    }
                    if (!rdr.IsDBNull(21))
                    {
                        person.Visa_Selected_Value_K3 = rdr.GetInt32(21);
                    }
                    else
                    {
                        person.Visa_Selected_Value_K3 = 0;
                    }
                    if (!rdr.IsDBNull(22))
                    {
                        person.Visa_Selected_Value_L1 = rdr.GetInt32(22);
                    }
                    else
                    {
                        person.Visa_Selected_Value_L1 = 0;
                    }
                    if (!rdr.IsDBNull(23))
                    {
                        person.Visa_Selected_Value_L2 = rdr.GetInt32(23);
                    }
                    else
                    {
                        person.Visa_Selected_Value_L2 = 0;
                    }
                    if (!rdr.IsDBNull(24))
                    {
                        person.Visa_Selected_Value_H4 = rdr.GetInt32(24);
                    }
                    else
                    {
                        person.Visa_Selected_Value_H4 = 0;
                    }
                    if (!rdr.IsDBNull(25))
                    {
                        person.Visa_Selected_Value_F1 = rdr.GetInt32(25);
                    }
                    else
                    {
                        person.Visa_Selected_Value_F1 = 0;
                    }
                    if (!rdr.IsDBNull(26))
                    {
                        person.Visa_Selected_Value_J1 = rdr.GetInt32(26);
                    }
                    else
                    {
                        person.Visa_Selected_Value_J1 = 0;
                    }
                    if (!rdr.IsDBNull(27))
                    {
                        person.Visa_Selected_Value_M1 = rdr.GetInt32(27);
                    }
                    else
                    {
                        person.Visa_Selected_Value_M1 = 0;
                    }
                    if (!rdr.IsDBNull(28))
                    {
                        person.Visa_Selected_Value_H_1B = rdr.GetInt32(28);
                    }
                    else
                    {
                        person.Visa_Selected_Value_H_1B = 0;
                    }
                    if (!rdr.IsDBNull(29))
                    {
                        person.Visa_Selected_Value_H_2B = rdr.GetInt32(29);
                    }
                    else
                    {
                        person.Visa_Selected_Value_H_2B = 0;
                    }
                    if (!rdr.IsDBNull(30))
                    {
                        person.Visa_Selected_Value_B_2 = rdr.GetInt32(30);
                    }
                    else
                    {
                        person.Visa_Selected_Value_B_2 = 0;
                    }
                    if (!rdr.IsDBNull(31))
                    {
                        person.Visa_Selected_Value_Schengen = rdr.GetInt32(31);
                    }
                    else
                    {
                        person.Visa_Selected_Value_Schengen = 0;
                    }
                    if (!rdr.IsDBNull(32))
                    {
                        person.Perm_Resident_Alien_Resid_Date = rdr.GetDateTime(32);
                    }
                    else
                    {
                        person.Perm_Resident_Alien_Resid_Date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(33))
                    {
                        person.Perm_Resident_Alien_Expire_Date = rdr.GetDateTime(33);
                    }
                    else
                    {
                        person.Perm_Resident_Alien_Expire_Date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(34))
                    {
                        person.Perm_Resident_Alien_A_number = rdr.GetInt32(34);
                    }
                    else
                    {
                        person.Perm_Resident_Alien_A_number = 0;
                    }
                    if (!rdr.IsDBNull(35))
                    {
                        person.Perm_Resident_Alien_USCIS_number = rdr.GetInt32(35);
                    }
                    else
                    {
                        person.Perm_Resident_Alien_USCIS_number = 0;
                    }
                    if (!rdr.IsDBNull(36))
                    {
                        person.Perm_Resident_Alien_Birth_Country = rdr.GetString(36);
                    }
                    else
                    {
                        person.Perm_Resident_Alien_Birth_Country = " ";
                    }
                    if (!rdr.IsDBNull(37))
                    {
                        person.Perm_Resident_Alien_Category = rdr.GetString(37);
                    }
                    else
                    {
                        person.Perm_Resident_Alien_Category = " ";
                    }
                    if (!rdr.IsDBNull(38))
                    {
                        person.Driver_State_ID = rdr.GetString(38);
                    }
                    else
                    {
                        person.Driver_State_ID = " ";
                    }
                    if (!rdr.IsDBNull(39))
                    {
                        person.Citizenship = rdr.GetString(39);
                    }
                    else
                    {
                        person.Citizenship = " ";
                    }
                    if (!rdr.IsDBNull(40))
                    {
                        person.Marital_Status = rdr.GetString(40);
                    }
                    else
                    {
                        person.Marital_Status = " ";
                    }
                    if (!rdr.IsDBNull(41))
                    {
                        person.Minor_Children = rdr.GetInt32(41);
                    }
                    else
                    {
                        person.Minor_Children = 0;
                    }
                    }
                    else
                    {
                    person.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                person.SetColumnDefaults();
                return person;
                }
            finally
            {
                con.Close();
            }
            return person;
        }

        public person Insert(person id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PERSON", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@address_id2", id.address_id2);
                cmd.Parameters.AddWithValue("@birthdate", id.birthdate);
                cmd.Parameters.AddWithValue("@certification_number", id.certification_number);
                cmd.Parameters.AddWithValue("@f_name", id.f_name);
                cmd.Parameters.AddWithValue("@m_initial", id.m_initial);
                cmd.Parameters.AddWithValue("@l_name", id.l_name);
                cmd.Parameters.AddWithValue("@gender", id.gender);
                cmd.Parameters.AddWithValue("@person_type", id.person_type);
                cmd.Parameters.AddWithValue("@phone_primary", id.phone_primary);
                cmd.Parameters.AddWithValue("@phone_secondary", id.phone_secondary);
                cmd.Parameters.AddWithValue("@email", id.email);
                cmd.Parameters.AddWithValue("@ssn", id.ssn);
                cmd.Parameters.AddWithValue("@Maiden_Name", id.Maiden_Name);
                cmd.Parameters.AddWithValue("@Visa_Issue_Date", id.Visa_Issue_Date);
                cmd.Parameters.AddWithValue("@Visa_Expire_Date", id.Visa_Expire_Date);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B1", id.Visa_Selected_Value_B1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B2", id.Visa_Selected_Value_B2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_K1", id.Visa_Selected_Value_K1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_K3", id.Visa_Selected_Value_K3);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_L1", id.Visa_Selected_Value_L1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_L2", id.Visa_Selected_Value_L2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H4", id.Visa_Selected_Value_H4);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_F1", id.Visa_Selected_Value_F1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_J1", id.Visa_Selected_Value_J1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_M1", id.Visa_Selected_Value_M1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H_1B", id.Visa_Selected_Value_H_1B);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H_2B", id.Visa_Selected_Value_H_2B);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B_2", id.Visa_Selected_Value_B_2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_Schengen", id.Visa_Selected_Value_Schengen);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Resid_Date", id.Perm_Resident_Alien_Resid_Date);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Expire_Date", id.Perm_Resident_Alien_Expire_Date);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_A_number", id.Perm_Resident_Alien_A_number);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_USCIS_number", id.Perm_Resident_Alien_USCIS_number);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Birth_Country", id.Perm_Resident_Alien_Birth_Country);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Category", id.Perm_Resident_Alien_Category);
                cmd.Parameters.AddWithValue("@Driver_State_ID", id.Driver_State_ID);
                cmd.Parameters.AddWithValue("@Citizenship", id.Citizenship);
                cmd.Parameters.AddWithValue("@Marital_Status", id.Marital_Status);
                cmd.Parameters.AddWithValue("@Minor_Children", id.Minor_Children);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PERSON", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@address_id2", id.address_id2);
                cmd.Parameters.AddWithValue("@birthdate", id.birthdate);
                cmd.Parameters.AddWithValue("@certification_number", id.certification_number);
                cmd.Parameters.AddWithValue("@f_name", id.f_name);
                cmd.Parameters.AddWithValue("@m_initial", id.m_initial);
                cmd.Parameters.AddWithValue("@l_name", id.l_name);
                cmd.Parameters.AddWithValue("@gender", id.gender);
                cmd.Parameters.AddWithValue("@person_type", id.person_type);
                cmd.Parameters.AddWithValue("@phone_primary", id.phone_primary);
                cmd.Parameters.AddWithValue("@phone_secondary", id.phone_secondary);
                cmd.Parameters.AddWithValue("@email", id.email);
                cmd.Parameters.AddWithValue("@ssn", id.ssn);
                cmd.Parameters.AddWithValue("@Maiden_Name", id.Maiden_Name);
                cmd.Parameters.AddWithValue("@Visa_Issue_Date", id.Visa_Issue_Date);
                cmd.Parameters.AddWithValue("@Visa_Expire_Date", id.Visa_Expire_Date);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B1", id.Visa_Selected_Value_B1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B2", id.Visa_Selected_Value_B2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_K1", id.Visa_Selected_Value_K1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_K3", id.Visa_Selected_Value_K3);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_L1", id.Visa_Selected_Value_L1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_L2", id.Visa_Selected_Value_L2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H4", id.Visa_Selected_Value_H4);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_F1", id.Visa_Selected_Value_F1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_J1", id.Visa_Selected_Value_J1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_M1", id.Visa_Selected_Value_M1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H_1B", id.Visa_Selected_Value_H_1B);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H_2B", id.Visa_Selected_Value_H_2B);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B_2", id.Visa_Selected_Value_B_2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_Schengen", id.Visa_Selected_Value_Schengen);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Resid_Date", id.Perm_Resident_Alien_Resid_Date);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Expire_Date", id.Perm_Resident_Alien_Expire_Date);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_A_number", id.Perm_Resident_Alien_A_number);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_USCIS_number", id.Perm_Resident_Alien_USCIS_number);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Birth_Country", id.Perm_Resident_Alien_Birth_Country);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Category", id.Perm_Resident_Alien_Category);
                cmd.Parameters.AddWithValue("@Driver_State_ID", id.Driver_State_ID);
                cmd.Parameters.AddWithValue("@Citizenship", id.Citizenship);
                cmd.Parameters.AddWithValue("@Marital_Status", id.Marital_Status);
                cmd.Parameters.AddWithValue("@Minor_Children", id.Minor_Children);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.person_id = rdr.GetInt32(0);
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
        public Boolean Update(person id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PERSON", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@person_id", id.person_id);
                cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
                cmd.Parameters.AddWithValue("@address_id", id.address_id);
                cmd.Parameters.AddWithValue("@address_id2", id.address_id2);
                cmd.Parameters.AddWithValue("@birthdate", id.birthdate);
                cmd.Parameters.AddWithValue("@certification_number", id.certification_number);
                cmd.Parameters.AddWithValue("@f_name", id.f_name);
                cmd.Parameters.AddWithValue("@m_initial", id.m_initial);
                cmd.Parameters.AddWithValue("@l_name", id.l_name);
                cmd.Parameters.AddWithValue("@gender", id.gender);
                cmd.Parameters.AddWithValue("@person_type", id.person_type);
                cmd.Parameters.AddWithValue("@phone_primary", id.phone_primary);
                cmd.Parameters.AddWithValue("@phone_secondary", id.phone_secondary);
                cmd.Parameters.AddWithValue("@email", id.email);
                cmd.Parameters.AddWithValue("@ssn", id.ssn);
                cmd.Parameters.AddWithValue("@Maiden_Name", id.Maiden_Name);
                cmd.Parameters.AddWithValue("@Visa_Issue_Date", id.Visa_Issue_Date);
                cmd.Parameters.AddWithValue("@Visa_Expire_Date", id.Visa_Expire_Date);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B1", id.Visa_Selected_Value_B1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B2", id.Visa_Selected_Value_B2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_K1", id.Visa_Selected_Value_K1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_K3", id.Visa_Selected_Value_K3);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_L1", id.Visa_Selected_Value_L1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_L2", id.Visa_Selected_Value_L2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H4", id.Visa_Selected_Value_H4);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_F1", id.Visa_Selected_Value_F1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_J1", id.Visa_Selected_Value_J1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_M1", id.Visa_Selected_Value_M1);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H_1B", id.Visa_Selected_Value_H_1B);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_H_2B", id.Visa_Selected_Value_H_2B);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_B_2", id.Visa_Selected_Value_B_2);
                cmd.Parameters.AddWithValue("@Visa_Selected_Value_Schengen", id.Visa_Selected_Value_Schengen);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Resid_Date", id.Perm_Resident_Alien_Resid_Date);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Expire_Date", id.Perm_Resident_Alien_Expire_Date);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_A_number", id.Perm_Resident_Alien_A_number);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_USCIS_number", id.Perm_Resident_Alien_USCIS_number);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Birth_Country", id.Perm_Resident_Alien_Birth_Country);
                cmd.Parameters.AddWithValue("@Perm_Resident_Alien_Category", id.Perm_Resident_Alien_Category);
                cmd.Parameters.AddWithValue("@Driver_State_ID", id.Driver_State_ID);
                cmd.Parameters.AddWithValue("@Citizenship", id.Citizenship);
                cmd.Parameters.AddWithValue("@Marital_Status", id.Marital_Status);
                cmd.Parameters.AddWithValue("@Minor_Children", id.Minor_Children);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PERSON", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@person_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PERSON_WC", con);
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




