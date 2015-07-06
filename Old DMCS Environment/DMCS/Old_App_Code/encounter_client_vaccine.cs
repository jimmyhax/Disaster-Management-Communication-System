using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class encounter_client_vaccine
{
    public Int32 encounter_id
    {
        get;
        set;
    }
    public Int32 vaccine_id
    {
        get;
        set;
    }
    public String current_client_medicine
    {
        get;
        set;
    }
    public String assistance
    {
        get;
        set;
    }
    public Int32 quantity
    {
        get;
        set;
    }
    public String Under_six_months_old
    {
        get;
        set;
    }
    public String pregnant
    {
        get;
        set;
    }
    public Int32 children
    {
        get;
        set;
    }
    public String occupation
    {
        get;
        set;
    }
    public String chronic_disease
    {
        get;
        set;
    }
    public String qualify
    {
        get;
        set;
    }
    public DateTime dose_date1
    {
        get;
        set;
    }
    public DateTime dose_date2
    {
        get;
        set;
    }
    public byte[] adult_consent
    {
        get;
        set;
    }
    public byte[] guardian_consent
    {
        get;
        set;
    }
    public DateTime vaccine_admin
    {
        get;
        set;
    }
    public String guardian_f_name
    {
        get;
        set;
    }
    public String guardian_l_name
    {
        get;
        set;
    }
    public String guardian_mi
    {
        get;
        set;
    }
    public String guardian_phone
    {
        get;
        set;
    }
    public DateTime adult_consent_date
    {
        get;
        set;
    }
    public DateTime guard_consent_date
    {
        get;
        set;
    }
    public String dose_form1
    {
        get;
        set;
    }
    public String dose_form2
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        encounter_id = 0;
        vaccine_id = 0;
        current_client_medicine = " ";
        assistance = " ";
        quantity = 0;
        Under_six_months_old = " ";
        pregnant = " ";
        children = 0;
        occupation = " ";
        chronic_disease = " ";
        qualify = " ";
        dose_date1 = DateTime.Now;
        dose_date2 = DateTime.Now;
        adult_consent = null;
        guardian_consent = null;
        vaccine_admin = DateTime.Now;
        guardian_f_name = " ";
        guardian_l_name = " ";
        guardian_mi = " ";
        guardian_phone = " ";
        adult_consent_date = DateTime.Now;
        guard_consent_date = DateTime.Now;
        dose_form1 = " ";
        dose_form2 = " ";
    }
    public encounter_client_vaccine Select(int id)
    {
        encounter_client_vaccine encounter_client_vaccine = new encounter_client_vaccine();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@encounter_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    encounter_client_vaccine.encounter_id = rdr.GetInt32(0);
                }
                else
                {
                    encounter_client_vaccine.encounter_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    encounter_client_vaccine.vaccine_id = rdr.GetInt32(1);
                }
                else
                {
                    encounter_client_vaccine.vaccine_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    encounter_client_vaccine.current_client_medicine = rdr.GetString(2);
                }
                else
                {
                    encounter_client_vaccine.current_client_medicine = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    encounter_client_vaccine.assistance = rdr.GetString(3);
                }
                else
                {
                    encounter_client_vaccine.assistance = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    encounter_client_vaccine.quantity = rdr.GetInt32(4);
                }
                else
                {
                    encounter_client_vaccine.quantity = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    encounter_client_vaccine.Under_six_months_old = rdr.GetString(5);
                }
                else
                {
                    encounter_client_vaccine.Under_six_months_old = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    encounter_client_vaccine.pregnant = rdr.GetString(6);
                }
                else
                {
                    encounter_client_vaccine.pregnant = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    encounter_client_vaccine.children = rdr.GetInt32(7);
                }
                else
                {
                    encounter_client_vaccine.children = 0;
                }
                if (!rdr.IsDBNull(8))
                {
                    encounter_client_vaccine.occupation = rdr.GetString(8);
                }
                else
                {
                    encounter_client_vaccine.occupation = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    encounter_client_vaccine.chronic_disease = rdr.GetString(9);
                }
                else
                {
                    encounter_client_vaccine.chronic_disease = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    encounter_client_vaccine.qualify = rdr.GetString(10);
                }
                else
                {
                    encounter_client_vaccine.qualify = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    encounter_client_vaccine.dose_date1 = rdr.GetDateTime(11);
                }
                else
                {
                    encounter_client_vaccine.dose_date1 = DateTime.Now;
                }
                if (!rdr.IsDBNull(12))
                {
                    encounter_client_vaccine.dose_date2 = rdr.GetDateTime(12);
                }
                else
                {
                    encounter_client_vaccine.dose_date2 = DateTime.Now;
                }
                if (!rdr.IsDBNull(13))
                {
                    encounter_client_vaccine.adult_consent = (byte[])rdr["adult_consent"];
                }
                else
                {
                    encounter_client_vaccine.adult_consent = null;
                }
                if (!rdr.IsDBNull(14))
                {
                    encounter_client_vaccine.guardian_consent = (byte[])rdr["guardian_consent"];
                }
                else
                {
                    encounter_client_vaccine.guardian_consent = null;
                }
                if (!rdr.IsDBNull(15))
                {
                    encounter_client_vaccine.vaccine_admin = rdr.GetDateTime(15);
                }
                else
                {
                    encounter_client_vaccine.vaccine_admin = DateTime.Now;
                }
                if (!rdr.IsDBNull(16))
                {
                    encounter_client_vaccine.guardian_f_name = rdr.GetString(16);
                }
                else
                {
                    encounter_client_vaccine.guardian_f_name = " ";
                }
                if (!rdr.IsDBNull(17))
                {
                    encounter_client_vaccine.guardian_l_name = rdr.GetString(17);
                }
                else
                {
                    encounter_client_vaccine.guardian_l_name = " ";
                }
                if (!rdr.IsDBNull(18))
                {
                    encounter_client_vaccine.guardian_mi = rdr.GetString(18);
                }
                else
                {
                    encounter_client_vaccine.guardian_mi = " ";
                }
                if (!rdr.IsDBNull(19))
                {
                    encounter_client_vaccine.guardian_phone = rdr.GetString(19);
                }
                else
                {
                    encounter_client_vaccine.guardian_phone = " ";
                }
                if (!rdr.IsDBNull(20))
                {
                    encounter_client_vaccine.adult_consent_date = rdr.GetDateTime(20);
                }
                else
                {
                    encounter_client_vaccine.adult_consent_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(21))
                {
                    encounter_client_vaccine.guard_consent_date = rdr.GetDateTime(21);
                }
                else
                {
                    encounter_client_vaccine.guard_consent_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(22))
                {
                    encounter_client_vaccine.dose_form1 = rdr.GetString(22);
                }
                else
                {
                    encounter_client_vaccine.dose_form1 = " ";
                }
                if (!rdr.IsDBNull(23))
                {
                    encounter_client_vaccine.dose_form2 = rdr.GetString(23);
                }
                else
                {
                    encounter_client_vaccine.dose_form2 = " ";
                }
                }
                else
                {
                    encounter_client_vaccine.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            encounter_client_vaccine.SetColumnDefaults();
            return encounter_client_vaccine;
            }
        finally
        {
            con.Close();
        }
        return encounter_client_vaccine;
    }

    public encounter_client_vaccine Insert(encounter_client_vaccine id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
            cmd.Parameters.AddWithValue("@vaccine_id", id.vaccine_id);
            cmd.Parameters.AddWithValue("@current_client_medicine", id.current_client_medicine);
            cmd.Parameters.AddWithValue("@assistance", id.assistance);
            cmd.Parameters.AddWithValue("@quantity", id.quantity);
            cmd.Parameters.AddWithValue("@Under_six_months_old", id.Under_six_months_old);
            cmd.Parameters.AddWithValue("@pregnant", id.pregnant);
            cmd.Parameters.AddWithValue("@children", id.children);
            cmd.Parameters.AddWithValue("@occupation", id.occupation);
            cmd.Parameters.AddWithValue("@chronic_disease", id.chronic_disease);
            cmd.Parameters.AddWithValue("@qualify", id.qualify);
            cmd.Parameters.AddWithValue("@dose_date1", id.dose_date1);
            cmd.Parameters.AddWithValue("@dose_date2", id.dose_date2);
            cmd.Parameters.AddWithValue("@adult_consent", id.adult_consent);
            cmd.Parameters.AddWithValue("@guardian_consent", id.guardian_consent);
            cmd.Parameters.AddWithValue("@vaccine_admin", id.vaccine_admin);
            cmd.Parameters.AddWithValue("@guardian_f_name", id.guardian_f_name);
            cmd.Parameters.AddWithValue("@guardian_l_name", id.guardian_l_name);
            cmd.Parameters.AddWithValue("@guardian_mi", id.guardian_mi);
            cmd.Parameters.AddWithValue("@guardian_phone", id.guardian_phone);
            cmd.Parameters.AddWithValue("@adult_consent_date", id.adult_consent_date);
            cmd.Parameters.AddWithValue("@guard_consent_date", id.guard_consent_date);
            cmd.Parameters.AddWithValue("@dose_form1", id.dose_form1);
            cmd.Parameters.AddWithValue("@dose_form2", id.dose_form2);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vaccine_id", id.vaccine_id);
            cmd.Parameters.AddWithValue("@current_client_medicine", id.current_client_medicine);
            cmd.Parameters.AddWithValue("@assistance", id.assistance);
            cmd.Parameters.AddWithValue("@quantity", id.quantity);
            cmd.Parameters.AddWithValue("@Under_six_months_old", id.Under_six_months_old);
            cmd.Parameters.AddWithValue("@pregnant", id.pregnant);
            cmd.Parameters.AddWithValue("@children", id.children);
            cmd.Parameters.AddWithValue("@occupation", id.occupation);
            cmd.Parameters.AddWithValue("@chronic_disease", id.chronic_disease);
            cmd.Parameters.AddWithValue("@qualify", id.qualify);
            cmd.Parameters.AddWithValue("@dose_date1", id.dose_date1);
            cmd.Parameters.AddWithValue("@dose_date2", id.dose_date2);
            cmd.Parameters.AddWithValue("@adult_consent", id.adult_consent);
            cmd.Parameters.AddWithValue("@guardian_consent", id.guardian_consent);
            cmd.Parameters.AddWithValue("@vaccine_admin", id.vaccine_admin);
            cmd.Parameters.AddWithValue("@guardian_f_name", id.guardian_f_name);
            cmd.Parameters.AddWithValue("@guardian_l_name", id.guardian_l_name);
            cmd.Parameters.AddWithValue("@guardian_mi", id.guardian_mi);
            cmd.Parameters.AddWithValue("@guardian_phone", id.guardian_phone);
            cmd.Parameters.AddWithValue("@adult_consent_date", id.adult_consent_date);
            cmd.Parameters.AddWithValue("@guard_consent_date", id.guard_consent_date);
            cmd.Parameters.AddWithValue("@dose_form1", id.dose_form1);
            cmd.Parameters.AddWithValue("@dose_form2", id.dose_form2);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.encounter_id = rdr.GetInt32(0);
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
    public Boolean Update(encounter_client_vaccine id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@encounter_id", id.encounter_id);
            cmd.Parameters.AddWithValue("@vaccine_id", id.vaccine_id);
            cmd.Parameters.AddWithValue("@current_client_medicine", id.current_client_medicine);
            cmd.Parameters.AddWithValue("@assistance", id.assistance);
            cmd.Parameters.AddWithValue("@quantity", id.quantity);
            cmd.Parameters.AddWithValue("@Under_six_months_old", id.Under_six_months_old);
            cmd.Parameters.AddWithValue("@pregnant", id.pregnant);
            cmd.Parameters.AddWithValue("@children", id.children);
            cmd.Parameters.AddWithValue("@occupation", id.occupation);
            cmd.Parameters.AddWithValue("@chronic_disease", id.chronic_disease);
            cmd.Parameters.AddWithValue("@qualify", id.qualify);
            cmd.Parameters.AddWithValue("@dose_date1", id.dose_date1);
            cmd.Parameters.AddWithValue("@dose_date2", id.dose_date2);
            cmd.Parameters.AddWithValue("@adult_consent", id.adult_consent);
            cmd.Parameters.AddWithValue("@guardian_consent", id.guardian_consent);
            cmd.Parameters.AddWithValue("@vaccine_admin", id.vaccine_admin);
            cmd.Parameters.AddWithValue("@guardian_f_name", id.guardian_f_name);
            cmd.Parameters.AddWithValue("@guardian_l_name", id.guardian_l_name);
            cmd.Parameters.AddWithValue("@guardian_mi", id.guardian_mi);
            cmd.Parameters.AddWithValue("@guardian_phone", id.guardian_phone);
            cmd.Parameters.AddWithValue("@adult_consent_date", id.adult_consent_date);
            cmd.Parameters.AddWithValue("@guard_consent_date", id.guard_consent_date);
            cmd.Parameters.AddWithValue("@dose_form1", id.dose_form1);
            cmd.Parameters.AddWithValue("@dose_form2", id.dose_form2);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@encounter_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE_WC", con);
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




