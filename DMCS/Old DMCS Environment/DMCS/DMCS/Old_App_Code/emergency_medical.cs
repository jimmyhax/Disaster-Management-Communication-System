using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class emergency_medical
{
    public Int32 em_id
    {
        get;
        set;
    }
    public Int32 client_id
    {
        get;
        set;
    }
    public String ambulance_company_name
    {
        get;
        set;
    }
    public String ambulance_identification
    {
        get;
        set;
    }
    public DateTime appointment_date
    {
        get;
        set;
    }
    public String area_of_specialty
    {
        get;
        set;
    }
    public String assistance_order
    {
        get;
        set;
    }
    public DateTime date_of_service
    {
        get;
        set;
    }
    public String degree_certifications
    {
        get;
        set;
    }
    public String doctor_appointments
    {
        get;
        set;
    }
    public Int32 doctor_id
    {
        get;
        set;
    }
    public DateTime doctor_start_date
    {
        get;
        set;
    }
    public Int32 driver_id
    {
        get;
        set;
    }
    public String educational_institution_name
    {
        get;
        set;
    }
    public String external_examination
    {
        get;
        set;
    }
    public String hospital_name
    {
        get;
        set;
    }
    public String internal_examination
    {
        get;
        set;
    }
    public String lights_sirens_to_scene
    {
        get;
        set;
    }
    public String location_type
    {
        get;
        set;
    }
    public Int32 number_of_days_admitted
    {
        get;
        set;
    }
    public String office_location
    {
        get;
        set;
    }
    public String other_remarks
    {
        get;
        set;
    }
    public String prescription_medicines
    {
        get;
        set;
    }
    public DateTime time_of_service
    {
        get;
        set;
    }
    public Decimal total_cost
    {
        get;
        set;
    }
    public Int32 deceased_id
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        em_id = 0;
        client_id = 0;
        ambulance_company_name = " ";
        ambulance_identification = " ";
        appointment_date = DateTime.Now;
        area_of_specialty = " ";
        assistance_order = " ";
        date_of_service = DateTime.Now;
        degree_certifications = " ";
        doctor_appointments = " ";
        doctor_id = 0;
        doctor_start_date = DateTime.Now;
        driver_id = 0;
        educational_institution_name = " ";
        external_examination = " ";
        hospital_name = " ";
        internal_examination = " ";
        lights_sirens_to_scene = " ";
        location_type = " ";
        number_of_days_admitted = 0;
        office_location = " ";
        other_remarks = " ";
        prescription_medicines = " ";
        time_of_service = DateTime.Now;
        total_cost = 0;
        deceased_id = 0;
    }
    public emergency_medical Select(int id)
    {
        emergency_medical emergency_medical = new emergency_medical();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMERGENCY_MEDICAL", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@em_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    emergency_medical.em_id = rdr.GetInt32(0);
                }
                else
                {
                    emergency_medical.em_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    emergency_medical.client_id = rdr.GetInt32(1);
                }
                else
                {
                    emergency_medical.client_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    emergency_medical.ambulance_company_name = rdr.GetString(2);
                }
                else
                {
                    emergency_medical.ambulance_company_name = " ";
                }
                if (!rdr.IsDBNull(3))
                {
                    emergency_medical.ambulance_identification = rdr.GetString(3);
                }
                else
                {
                    emergency_medical.ambulance_identification = " ";
                }
                if (!rdr.IsDBNull(4))
                {
                    emergency_medical.appointment_date = rdr.GetDateTime(4);
                }
                else
                {
                    emergency_medical.appointment_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(5))
                {
                    emergency_medical.area_of_specialty = rdr.GetString(5);
                }
                else
                {
                    emergency_medical.area_of_specialty = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    emergency_medical.assistance_order = rdr.GetString(6);
                }
                else
                {
                    emergency_medical.assistance_order = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    emergency_medical.date_of_service = rdr.GetDateTime(7);
                }
                else
                {
                    emergency_medical.date_of_service = DateTime.Now;
                }
                if (!rdr.IsDBNull(8))
                {
                    emergency_medical.degree_certifications = rdr.GetString(8);
                }
                else
                {
                    emergency_medical.degree_certifications = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    emergency_medical.doctor_appointments = rdr.GetString(9);
                }
                else
                {
                    emergency_medical.doctor_appointments = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    emergency_medical.doctor_id = rdr.GetInt32(10);
                }
                else
                {
                    emergency_medical.doctor_id = 0;
                }
                if (!rdr.IsDBNull(11))
                {
                    emergency_medical.doctor_start_date = rdr.GetDateTime(11);
                }
                else
                {
                    emergency_medical.doctor_start_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(12))
                {
                    emergency_medical.driver_id = rdr.GetInt32(12);
                }
                else
                {
                    emergency_medical.driver_id = 0;
                }
                if (!rdr.IsDBNull(13))
                {
                    emergency_medical.educational_institution_name = rdr.GetString(13);
                }
                else
                {
                    emergency_medical.educational_institution_name = " ";
                }
                if (!rdr.IsDBNull(14))
                {
                    emergency_medical.external_examination = rdr.GetString(14);
                }
                else
                {
                    emergency_medical.external_examination = " ";
                }
                if (!rdr.IsDBNull(15))
                {
                    emergency_medical.hospital_name = rdr.GetString(15);
                }
                else
                {
                    emergency_medical.hospital_name = " ";
                }
                if (!rdr.IsDBNull(16))
                {
                    emergency_medical.internal_examination = rdr.GetString(16);
                }
                else
                {
                    emergency_medical.internal_examination = " ";
                }
                if (!rdr.IsDBNull(17))
                {
                    emergency_medical.lights_sirens_to_scene = rdr.GetString(17);
                }
                else
                {
                    emergency_medical.lights_sirens_to_scene = " ";
                }
                if (!rdr.IsDBNull(18))
                {
                    emergency_medical.location_type = rdr.GetString(18);
                }
                else
                {
                    emergency_medical.location_type = " ";
                }
                if (!rdr.IsDBNull(19))
                {
                    emergency_medical.number_of_days_admitted = rdr.GetInt32(19);
                }
                else
                {
                    emergency_medical.number_of_days_admitted = 0;
                }
                if (!rdr.IsDBNull(20))
                {
                    emergency_medical.office_location = rdr.GetString(20);
                }
                else
                {
                    emergency_medical.office_location = " ";
                }
                if (!rdr.IsDBNull(21))
                {
                    emergency_medical.other_remarks = rdr.GetString(21);
                }
                else
                {
                    emergency_medical.other_remarks = " ";
                }
                if (!rdr.IsDBNull(22))
                {
                    emergency_medical.prescription_medicines = rdr.GetString(22);
                }
                else
                {
                    emergency_medical.prescription_medicines = " ";
                }
                if (!rdr.IsDBNull(23))
                {
                    emergency_medical.time_of_service = rdr.GetDateTime(23);
                }
                else
                {
                    emergency_medical.time_of_service = DateTime.Now;
                }
                if (!rdr.IsDBNull(24))
                {
                    emergency_medical.total_cost = rdr.GetDecimal(24);
                }
                else
                {
                    emergency_medical.total_cost = 0;
                }
                if (!rdr.IsDBNull(25))
                {
                    emergency_medical.deceased_id = rdr.GetInt32(25);
                }
                else
                {
                    emergency_medical.deceased_id = 0;
                }
                }
                else
                {
                    emergency_medical.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            emergency_medical.SetColumnDefaults();
            return emergency_medical;
            }
        finally
        {
            con.Close();
        }
        return emergency_medical;
    }

    public emergency_medical Insert(emergency_medical id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_EMERGENCY_MEDICAL", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@ambulance_company_name", id.ambulance_company_name);
            cmd.Parameters.AddWithValue("@ambulance_identification", id.ambulance_identification);
            cmd.Parameters.AddWithValue("@appointment_date", id.appointment_date);
            cmd.Parameters.AddWithValue("@area_of_specialty", id.area_of_specialty);
            cmd.Parameters.AddWithValue("@assistance_order", id.assistance_order);
            cmd.Parameters.AddWithValue("@date_of_service", id.date_of_service);
            cmd.Parameters.AddWithValue("@degree_certifications", id.degree_certifications);
            cmd.Parameters.AddWithValue("@doctor_appointments", id.doctor_appointments);
            cmd.Parameters.AddWithValue("@doctor_id", id.doctor_id);
            cmd.Parameters.AddWithValue("@doctor_start_date", id.doctor_start_date);
            cmd.Parameters.AddWithValue("@driver_id", id.driver_id);
            cmd.Parameters.AddWithValue("@educational_institution_name", id.educational_institution_name);
            cmd.Parameters.AddWithValue("@external_examination", id.external_examination);
            cmd.Parameters.AddWithValue("@hospital_name", id.hospital_name);
            cmd.Parameters.AddWithValue("@internal_examination", id.internal_examination);
            cmd.Parameters.AddWithValue("@lights_sirens_to_scene", id.lights_sirens_to_scene);
            cmd.Parameters.AddWithValue("@location_type", id.location_type);
            cmd.Parameters.AddWithValue("@number_of_days_admitted", id.number_of_days_admitted);
            cmd.Parameters.AddWithValue("@office_location", id.office_location);
            cmd.Parameters.AddWithValue("@other_remarks", id.other_remarks);
            cmd.Parameters.AddWithValue("@prescription_medicines", id.prescription_medicines);
            cmd.Parameters.AddWithValue("@time_of_service", id.time_of_service);
            cmd.Parameters.AddWithValue("@total_cost", id.total_cost);
            cmd.Parameters.AddWithValue("@deceased_id", id.deceased_id);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_EMERGENCY_MEDICAL", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@ambulance_company_name", id.ambulance_company_name);
            cmd.Parameters.AddWithValue("@ambulance_identification", id.ambulance_identification);
            cmd.Parameters.AddWithValue("@appointment_date", id.appointment_date);
            cmd.Parameters.AddWithValue("@area_of_specialty", id.area_of_specialty);
            cmd.Parameters.AddWithValue("@assistance_order", id.assistance_order);
            cmd.Parameters.AddWithValue("@date_of_service", id.date_of_service);
            cmd.Parameters.AddWithValue("@degree_certifications", id.degree_certifications);
            cmd.Parameters.AddWithValue("@doctor_appointments", id.doctor_appointments);
            cmd.Parameters.AddWithValue("@doctor_id", id.doctor_id);
            cmd.Parameters.AddWithValue("@doctor_start_date", id.doctor_start_date);
            cmd.Parameters.AddWithValue("@driver_id", id.driver_id);
            cmd.Parameters.AddWithValue("@educational_institution_name", id.educational_institution_name);
            cmd.Parameters.AddWithValue("@external_examination", id.external_examination);
            cmd.Parameters.AddWithValue("@hospital_name", id.hospital_name);
            cmd.Parameters.AddWithValue("@internal_examination", id.internal_examination);
            cmd.Parameters.AddWithValue("@lights_sirens_to_scene", id.lights_sirens_to_scene);
            cmd.Parameters.AddWithValue("@location_type", id.location_type);
            cmd.Parameters.AddWithValue("@number_of_days_admitted", id.number_of_days_admitted);
            cmd.Parameters.AddWithValue("@office_location", id.office_location);
            cmd.Parameters.AddWithValue("@other_remarks", id.other_remarks);
            cmd.Parameters.AddWithValue("@prescription_medicines", id.prescription_medicines);
            cmd.Parameters.AddWithValue("@time_of_service", id.time_of_service);
            cmd.Parameters.AddWithValue("@total_cost", id.total_cost);
            cmd.Parameters.AddWithValue("@deceased_id", id.deceased_id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.em_id = rdr.GetInt32(0);
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
    public Boolean Update(emergency_medical id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_EMERGENCY_MEDICAL", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@em_id", id.em_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@ambulance_company_name", id.ambulance_company_name);
            cmd.Parameters.AddWithValue("@ambulance_identification", id.ambulance_identification);
            cmd.Parameters.AddWithValue("@appointment_date", id.appointment_date);
            cmd.Parameters.AddWithValue("@area_of_specialty", id.area_of_specialty);
            cmd.Parameters.AddWithValue("@assistance_order", id.assistance_order);
            cmd.Parameters.AddWithValue("@date_of_service", id.date_of_service);
            cmd.Parameters.AddWithValue("@degree_certifications", id.degree_certifications);
            cmd.Parameters.AddWithValue("@doctor_appointments", id.doctor_appointments);
            cmd.Parameters.AddWithValue("@doctor_id", id.doctor_id);
            cmd.Parameters.AddWithValue("@doctor_start_date", id.doctor_start_date);
            cmd.Parameters.AddWithValue("@driver_id", id.driver_id);
            cmd.Parameters.AddWithValue("@educational_institution_name", id.educational_institution_name);
            cmd.Parameters.AddWithValue("@external_examination", id.external_examination);
            cmd.Parameters.AddWithValue("@hospital_name", id.hospital_name);
            cmd.Parameters.AddWithValue("@internal_examination", id.internal_examination);
            cmd.Parameters.AddWithValue("@lights_sirens_to_scene", id.lights_sirens_to_scene);
            cmd.Parameters.AddWithValue("@location_type", id.location_type);
            cmd.Parameters.AddWithValue("@number_of_days_admitted", id.number_of_days_admitted);
            cmd.Parameters.AddWithValue("@office_location", id.office_location);
            cmd.Parameters.AddWithValue("@other_remarks", id.other_remarks);
            cmd.Parameters.AddWithValue("@prescription_medicines", id.prescription_medicines);
            cmd.Parameters.AddWithValue("@time_of_service", id.time_of_service);
            cmd.Parameters.AddWithValue("@total_cost", id.total_cost);
            cmd.Parameters.AddWithValue("@deceased_id", id.deceased_id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_EMERGENCY_MEDICAL", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@em_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_EMERGENCY_MEDICAL_WC", con);
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




