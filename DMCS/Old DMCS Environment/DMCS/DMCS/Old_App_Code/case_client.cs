using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class case_client
{
    public Int32 case_id
    {
        get;
        set;
    }
    public Int32 client_id
    {
        get;
        set;
    }
    public Int32 address_id
    {
        get;
        set;
    }
    public Decimal cable_amt_owed_today
    {
        get;
        set;
    }
    public String colessee_name
    {
        get;
        set;
    }
    public String child_support
    {
        get;
        set;
    }
    public String child_support_memo
    {
        get;
        set;
    }
    public DateTime curr_residence_date
    {
        get;
        set;
    }
    public Decimal electric_amt_owed_today
    {
        get;
        set;
    }
    public String employment_memo
    {
        get;
        set;
    }
    public String employment_status
    {
        get;
        set;
    }
    public Decimal gas_or_heating_amt_owed_today
    {
        get;
        set;
    }
    public Decimal housing_amt_owed_today
    {
        get;
        set;
    }
    public String housing_status
    {
        get;
        set;
    }
    public String income_status
    {
        get;
        set;
    }
    public Int32 lease_num_adults
    {
        get;
        set;
    }
    public DateTime lease_start_date
    {
        get;
        set;
    }
    public Int32 minor_children
    {
        get;
        set;
    }
    public Decimal monthly_rent_amt
    {
        get;
        set;
    }
    public String Other_help_Sources
    {
        get;
        set;
    }
    public String Other_help_Sources_memo
    {
        get;
        set;
    }
    public Int32 prev_address_id
    {
        get;
        set;
    }
    public DateTime prev_residence_date
    {
        get;
        set;
    }
    public String relationship_to_head_of_household
    {
        get;
        set;
    }
    public String rental_name
    {
        get;
        set;
    }
    public String rental_phone
    {
        get;
        set;
    }
    public Decimal sewage_amt_owed_today
    {
        get;
        set;
    }
    public Decimal telephone_amt_owed_today
    {
        get;
        set;
    }
    public Decimal trash_removal_amt_owed_today
    {
        get;
        set;
    }
    public String us_status_memo
    {
        get;
        set;
    }
    public String related_ll
    {
        get;
        set;
    }
    public String relation_to_ll
    {
        get;
        set;
    }
    public Decimal mtg_amt_owed_today
    {
        get;
        set;
    }
    public String utilities_list
    {
        get;
        set;
    }
    public Decimal water_amt_owed_today
    {
        get;
        set;
    }
    public DateTime public_asst_app_date
    {
        get;
        set;
    }
    public DateTime util_allot_app_date
    {
        get;
        set;
    }
    public Decimal util_allot_amt
    {
        get;
        set;
    }
    public String utilities_incl
    {
        get;
        set;
    }
    public DateTime fd_stmps_app_date
    {
        get;
        set;
    }
    public Decimal fd_stmps_amt
    {
        get;
        set;
    }
    public String fd_Inc
    {
        get;
        set;
    }
    public DateTime afdc_app_date
    {
        get;
        set;
    }
    public Decimal afdc_amt
    {
        get;
        set;
    }
    public String afdc_Inc
    {
        get;
        set;
    }
    public DateTime oth_trustee_app_date
    {
        get;
        set;
    }
    public Decimal oth_trustee_amt
    {
        get;
        set;
    }
    public String oth_trustee_Inc
    {
        get;
        set;
    }
    public DateTime ss_app_date
    {
        get;
        set;
    }
    public Decimal ss_amt
    {
        get;
        set;
    }
    public String ss_Inc
    {
        get;
        set;
    }
    public DateTime va_app_date
    {
        get;
        set;
    }
    public Decimal va_amt
    {
        get;
        set;
    }
    public String va_Inc
    {
        get;
        set;
    }
    public DateTime eap_app_date
    {
        get;
        set;
    }
    public Decimal eap_amt
    {
        get;
        set;
    }
    public String eap_Inc
    {
        get;
        set;
    }
    public DateTime fema_app_date
    {
        get;
        set;
    }
    public Decimal fema_amt
    {
        get;
        set;
    }
    public String fema_Inc
    {
        get;
        set;
    }
    public DateTime unempl_app_date
    {
        get;
        set;
    }
    public Decimal unempl_amt
    {
        get;
        set;
    }
    public String unempl_Inc
    {
        get;
        set;
    }
    public DateTime grants_loans_app_date
    {
        get;
        set;
    }
    public Decimal grants_loans_amt
    {
        get;
        set;
    }
    public String grants_Inc
    {
        get;
        set;
    }
    public DateTime other_app_date
    {
        get;
        set;
    }
    public Decimal other_amt
    {
        get;
        set;
    }
    public String other_Inc
    {
        get;
        set;
    }
    public String denial_memo
    {
        get;
        set;
    }
    public String welfr_fraud_memo
    {
        get;
        set;
    }
    public String Client_issue_Desc
    {
        get;
        set;
    }
    public String Client_issue_resolved
    {
        get;
        set;
    }
    public String Client_issue_comments
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        case_id = 0;
        client_id = 0;
        address_id = 0;
        cable_amt_owed_today = 0;
        colessee_name = " ";
        child_support = " ";
        child_support_memo = " ";
        curr_residence_date = DateTime.Now;
        electric_amt_owed_today = 0;
        employment_memo = " ";
        employment_status = " ";
        gas_or_heating_amt_owed_today = 0;
        housing_amt_owed_today = 0;
        housing_status = " ";
        income_status = " ";
        lease_num_adults = 0;
        lease_start_date = DateTime.Now;
        minor_children = 0;
        monthly_rent_amt = 0;
        Other_help_Sources = " ";
        Other_help_Sources_memo = " ";
        prev_address_id = 0;
        prev_residence_date = DateTime.Now;
        relationship_to_head_of_household = " ";
        rental_name = " ";
        rental_phone = " ";
        sewage_amt_owed_today = 0;
        telephone_amt_owed_today = 0;
        trash_removal_amt_owed_today = 0;
        us_status_memo = " ";
        related_ll = " ";
        relation_to_ll = " ";
        mtg_amt_owed_today = 0;
        utilities_list = " ";
        water_amt_owed_today = 0;
        public_asst_app_date = DateTime.Now;
        util_allot_app_date = DateTime.Now;
        util_allot_amt = 0;
        utilities_incl = " ";
        fd_stmps_app_date = DateTime.Now;
        fd_stmps_amt = 0;
        fd_Inc = " ";
        afdc_app_date = DateTime.Now;
        afdc_amt = 0;
        afdc_Inc = " ";
        oth_trustee_app_date = DateTime.Now;
        oth_trustee_amt = 0;
        oth_trustee_Inc = " ";
        ss_app_date = DateTime.Now;
        ss_amt = 0;
        ss_Inc = " ";
        va_app_date = DateTime.Now;
        va_amt = 0;
        va_Inc = " ";
        eap_app_date = DateTime.Now;
        eap_amt = 0;
        eap_Inc = " ";
        fema_app_date = DateTime.Now;
        fema_amt = 0;
        fema_Inc = " ";
        unempl_app_date = DateTime.Now;
        unempl_amt = 0;
        unempl_Inc = " ";
        grants_loans_app_date = DateTime.Now;
        grants_loans_amt = 0;
        grants_Inc = " ";
        other_app_date = DateTime.Now;
        other_amt = 0;
        other_Inc = " ";
        denial_memo = " ";
        welfr_fraud_memo = " ";
        Client_issue_Desc = " ";
        Client_issue_resolved = " ";
        Client_issue_comments = " ";
    }
    public case_client Select(int id)
    {
        case_client case_client = new case_client();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CASE_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    case_client.case_id = rdr.GetInt32(0);
                }
                else
                {
                    case_client.case_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    case_client.client_id = rdr.GetInt32(1);
                }
                else
                {
                    case_client.client_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    case_client.address_id = rdr.GetInt32(2);
                }
                else
                {
                    case_client.address_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    case_client.cable_amt_owed_today = rdr.GetDecimal(3);
                }
                else
                {
                    case_client.cable_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    case_client.colessee_name = rdr.GetString(4);
                }
                else
                {
                    case_client.colessee_name = " ";
                }
                if (!rdr.IsDBNull(5))
                {
                    case_client.child_support = rdr.GetString(5);
                }
                else
                {
                    case_client.child_support = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    case_client.child_support_memo = rdr.GetString(6);
                }
                else
                {
                    case_client.child_support_memo = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    case_client.curr_residence_date = rdr.GetDateTime(7);
                }
                else
                {
                    case_client.curr_residence_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(8))
                {
                    case_client.electric_amt_owed_today = rdr.GetDecimal(8);
                }
                else
                {
                    case_client.electric_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(9))
                {
                    case_client.employment_memo = rdr.GetString(9);
                }
                else
                {
                    case_client.employment_memo = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    case_client.employment_status = rdr.GetString(10);
                }
                else
                {
                    case_client.employment_status = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    case_client.gas_or_heating_amt_owed_today = rdr.GetDecimal(11);
                }
                else
                {
                    case_client.gas_or_heating_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(12))
                {
                    case_client.housing_amt_owed_today = rdr.GetDecimal(12);
                }
                else
                {
                    case_client.housing_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(13))
                {
                    case_client.housing_status = rdr.GetString(13);
                }
                else
                {
                    case_client.housing_status = " ";
                }
                if (!rdr.IsDBNull(14))
                {
                    case_client.income_status = rdr.GetString(14);
                }
                else
                {
                    case_client.income_status = " ";
                }
                if (!rdr.IsDBNull(15))
                {
                    case_client.lease_num_adults = rdr.GetInt32(15);
                }
                else
                {
                    case_client.lease_num_adults = 0;
                }
                if (!rdr.IsDBNull(16))
                {
                    case_client.lease_start_date = rdr.GetDateTime(16);
                }
                else
                {
                    case_client.lease_start_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(17))
                {
                    case_client.minor_children = rdr.GetInt32(17);
                }
                else
                {
                    case_client.minor_children = 0;
                }
                if (!rdr.IsDBNull(18))
                {
                    case_client.monthly_rent_amt = rdr.GetDecimal(18);
                }
                else
                {
                    case_client.monthly_rent_amt = 0;
                }
                if (!rdr.IsDBNull(19))
                {
                    case_client.Other_help_Sources = rdr.GetString(19);
                }
                else
                {
                    case_client.Other_help_Sources = " ";
                }
                if (!rdr.IsDBNull(20))
                {
                    case_client.Other_help_Sources_memo = rdr.GetString(20);
                }
                else
                {
                    case_client.Other_help_Sources_memo = " ";
                }
                if (!rdr.IsDBNull(21))
                {
                    case_client.prev_address_id = rdr.GetInt32(21);
                }
                else
                {
                    case_client.prev_address_id = 0;
                }
                if (!rdr.IsDBNull(22))
                {
                    case_client.prev_residence_date = rdr.GetDateTime(22);
                }
                else
                {
                    case_client.prev_residence_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(23))
                {
                    case_client.relationship_to_head_of_household = rdr.GetString(23);
                }
                else
                {
                    case_client.relationship_to_head_of_household = " ";
                }
                if (!rdr.IsDBNull(24))
                {
                    case_client.rental_name = rdr.GetString(24);
                }
                else
                {
                    case_client.rental_name = " ";
                }
                if (!rdr.IsDBNull(25))
                {
                    case_client.rental_phone = rdr.GetString(25);
                }
                else
                {
                    case_client.rental_phone = " ";
                }
                if (!rdr.IsDBNull(26))
                {
                    case_client.sewage_amt_owed_today = rdr.GetDecimal(26);
                }
                else
                {
                    case_client.sewage_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(27))
                {
                    case_client.telephone_amt_owed_today = rdr.GetDecimal(27);
                }
                else
                {
                    case_client.telephone_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(28))
                {
                    case_client.trash_removal_amt_owed_today = rdr.GetDecimal(28);
                }
                else
                {
                    case_client.trash_removal_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(29))
                {
                    case_client.us_status_memo = rdr.GetString(29);
                }
                else
                {
                    case_client.us_status_memo = " ";
                }
                if (!rdr.IsDBNull(30))
                {
                    case_client.related_ll = rdr.GetString(30);
                }
                else
                {
                    case_client.related_ll = " ";
                }
                if (!rdr.IsDBNull(31))
                {
                    case_client.relation_to_ll = rdr.GetString(31);
                }
                else
                {
                    case_client.relation_to_ll = " ";
                }
                if (!rdr.IsDBNull(32))
                {
                    case_client.mtg_amt_owed_today = rdr.GetDecimal(32);
                }
                else
                {
                    case_client.mtg_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(33))
                {
                    case_client.utilities_list = rdr.GetString(33);
                }
                else
                {
                    case_client.utilities_list = " ";
                }
                if (!rdr.IsDBNull(34))
                {
                    case_client.water_amt_owed_today = rdr.GetDecimal(34);
                }
                else
                {
                    case_client.water_amt_owed_today = 0;
                }
                if (!rdr.IsDBNull(35))
                {
                    case_client.public_asst_app_date = rdr.GetDateTime(35);
                }
                else
                {
                    case_client.public_asst_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(36))
                {
                    case_client.util_allot_app_date = rdr.GetDateTime(36);
                }
                else
                {
                    case_client.util_allot_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(37))
                {
                    case_client.util_allot_amt = rdr.GetDecimal(37);
                }
                else
                {
                    case_client.util_allot_amt = 0;
                }
                if (!rdr.IsDBNull(38))
                {
                    case_client.utilities_incl = rdr.GetString(38);
                }
                else
                {
                    case_client.utilities_incl = " ";
                }
                if (!rdr.IsDBNull(39))
                {
                    case_client.fd_stmps_app_date = rdr.GetDateTime(39);
                }
                else
                {
                    case_client.fd_stmps_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(40))
                {
                    case_client.fd_stmps_amt = rdr.GetDecimal(40);
                }
                else
                {
                    case_client.fd_stmps_amt = 0;
                }
                if (!rdr.IsDBNull(41))
                {
                    case_client.fd_Inc = rdr.GetString(41);
                }
                else
                {
                    case_client.fd_Inc = " ";
                }
                if (!rdr.IsDBNull(42))
                {
                    case_client.afdc_app_date = rdr.GetDateTime(42);
                }
                else
                {
                    case_client.afdc_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(43))
                {
                    case_client.afdc_amt = rdr.GetDecimal(43);
                }
                else
                {
                    case_client.afdc_amt = 0;
                }
                if (!rdr.IsDBNull(44))
                {
                    case_client.afdc_Inc = rdr.GetString(44);
                }
                else
                {
                    case_client.afdc_Inc = " ";
                }
                if (!rdr.IsDBNull(45))
                {
                    case_client.oth_trustee_app_date = rdr.GetDateTime(45);
                }
                else
                {
                    case_client.oth_trustee_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(46))
                {
                    case_client.oth_trustee_amt = rdr.GetDecimal(46);
                }
                else
                {
                    case_client.oth_trustee_amt = 0;
                }
                if (!rdr.IsDBNull(47))
                {
                    case_client.oth_trustee_Inc = rdr.GetString(47);
                }
                else
                {
                    case_client.oth_trustee_Inc = " ";
                }
                if (!rdr.IsDBNull(48))
                {
                    case_client.ss_app_date = rdr.GetDateTime(48);
                }
                else
                {
                    case_client.ss_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(49))
                {
                    case_client.ss_amt = rdr.GetDecimal(49);
                }
                else
                {
                    case_client.ss_amt = 0;
                }
                if (!rdr.IsDBNull(50))
                {
                    case_client.ss_Inc = rdr.GetString(50);
                }
                else
                {
                    case_client.ss_Inc = " ";
                }
                if (!rdr.IsDBNull(51))
                {
                    case_client.va_app_date = rdr.GetDateTime(51);
                }
                else
                {
                    case_client.va_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(52))
                {
                    case_client.va_amt = rdr.GetDecimal(52);
                }
                else
                {
                    case_client.va_amt = 0;
                }
                if (!rdr.IsDBNull(53))
                {
                    case_client.va_Inc = rdr.GetString(53);
                }
                else
                {
                    case_client.va_Inc = " ";
                }
                if (!rdr.IsDBNull(54))
                {
                    case_client.eap_app_date = rdr.GetDateTime(54);
                }
                else
                {
                    case_client.eap_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(55))
                {
                    case_client.eap_amt = rdr.GetDecimal(55);
                }
                else
                {
                    case_client.eap_amt = 0;
                }
                if (!rdr.IsDBNull(56))
                {
                    case_client.eap_Inc = rdr.GetString(56);
                }
                else
                {
                    case_client.eap_Inc = " ";
                }
                if (!rdr.IsDBNull(57))
                {
                    case_client.fema_app_date = rdr.GetDateTime(57);
                }
                else
                {
                    case_client.fema_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(58))
                {
                    case_client.fema_amt = rdr.GetDecimal(58);
                }
                else
                {
                    case_client.fema_amt = 0;
                }
                if (!rdr.IsDBNull(59))
                {
                    case_client.fema_Inc = rdr.GetString(59);
                }
                else
                {
                    case_client.fema_Inc = " ";
                }
                if (!rdr.IsDBNull(60))
                {
                    case_client.unempl_app_date = rdr.GetDateTime(60);
                }
                else
                {
                    case_client.unempl_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(61))
                {
                    case_client.unempl_amt = rdr.GetDecimal(61);
                }
                else
                {
                    case_client.unempl_amt = 0;
                }
                if (!rdr.IsDBNull(62))
                {
                    case_client.unempl_Inc = rdr.GetString(62);
                }
                else
                {
                    case_client.unempl_Inc = " ";
                }
                if (!rdr.IsDBNull(63))
                {
                    case_client.grants_loans_app_date = rdr.GetDateTime(63);
                }
                else
                {
                    case_client.grants_loans_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(64))
                {
                    case_client.grants_loans_amt = rdr.GetDecimal(64);
                }
                else
                {
                    case_client.grants_loans_amt = 0;
                }
                if (!rdr.IsDBNull(65))
                {
                    case_client.grants_Inc = rdr.GetString(65);
                }
                else
                {
                    case_client.grants_Inc = " ";
                }
                if (!rdr.IsDBNull(66))
                {
                    case_client.other_app_date = rdr.GetDateTime(66);
                }
                else
                {
                    case_client.other_app_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(67))
                {
                    case_client.other_amt = rdr.GetDecimal(67);
                }
                else
                {
                    case_client.other_amt = 0;
                }
                if (!rdr.IsDBNull(68))
                {
                    case_client.other_Inc = rdr.GetString(68);
                }
                else
                {
                    case_client.other_Inc = " ";
                }
                if (!rdr.IsDBNull(69))
                {
                    case_client.denial_memo = rdr.GetString(69);
                }
                else
                {
                    case_client.denial_memo = " ";
                }
                if (!rdr.IsDBNull(70))
                {
                    case_client.welfr_fraud_memo = rdr.GetString(70);
                }
                else
                {
                    case_client.welfr_fraud_memo = " ";
                }
                if (!rdr.IsDBNull(71))
                {
                    case_client.Client_issue_Desc = rdr.GetString(71);
                }
                else
                {
                    case_client.Client_issue_Desc = " ";
                }
                if (!rdr.IsDBNull(72))
                {
                    case_client.Client_issue_resolved = rdr.GetString(72);
                }
                else
                {
                    case_client.Client_issue_resolved = " ";
                }
                if (!rdr.IsDBNull(73))
                {
                    case_client.Client_issue_comments = rdr.GetString(73);
                }
                else
                {
                    case_client.Client_issue_comments = " ";
                }
                }
                else
                {
                    case_client.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            case_client.SetColumnDefaults();
            return case_client;
            }
        finally
        {
            con.Close();
        }
        return case_client;
    }
    public case_client Select(int caseid, int clientid)
    {
        case_client case_client = new case_client();

        string ConnectionString = IDManager.connection();

        SqlConnection con = new SqlConnection(ConnectionString);


        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SP_DMCS_Select_Case_and_Client", con);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Case_id", caseid);
            cmd.Parameters.AddWithValue("@Client_id", clientid);

            SqlDataReader rdr = cmd.ExecuteReader();

            if (rdr.HasRows)
            {
                rdr.Read();

                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        case_client.case_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        case_client.case_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        case_client.client_id = rdr.GetInt32(1);
                    }
                    else
                    {
                        case_client.client_id = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        case_client.address_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        case_client.address_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        case_client.cable_amt_owed_today = rdr.GetDecimal(3);
                    }
                    else
                    {
                        case_client.cable_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        case_client.colessee_name = rdr.GetString(4);
                    }
                    else
                    {
                        case_client.colessee_name = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        case_client.child_support = rdr.GetString(5);
                    }
                    else
                    {
                        case_client.child_support = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        case_client.child_support_memo = rdr.GetString(6);
                    }
                    else
                    {
                        case_client.child_support_memo = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        case_client.curr_residence_date = rdr.GetDateTime(7);
                    }
                    else
                    {
                        case_client.curr_residence_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        case_client.electric_amt_owed_today = rdr.GetDecimal(8);
                    }
                    else
                    {
                        case_client.electric_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        case_client.employment_memo = rdr.GetString(9);
                    }
                    else
                    {
                        case_client.employment_memo = " ";
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        case_client.employment_status = rdr.GetString(10);
                    }
                    else
                    {
                        case_client.employment_status = " ";
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        case_client.gas_or_heating_amt_owed_today = rdr.GetDecimal(11);
                    }
                    else
                    {
                        case_client.gas_or_heating_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        case_client.housing_amt_owed_today = rdr.GetDecimal(12);
                    }
                    else
                    {
                        case_client.housing_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        case_client.housing_status = rdr.GetString(13);
                    }
                    else
                    {
                        case_client.housing_status = " ";
                    }
                    if (!rdr.IsDBNull(14))
                    {
                        case_client.income_status = rdr.GetString(14);
                    }
                    else
                    {
                        case_client.income_status = " ";
                    }
                    if (!rdr.IsDBNull(15))
                    {
                        case_client.lease_num_adults = rdr.GetInt32(15);
                    }
                    else
                    {
                        case_client.lease_num_adults = 0;
                    }
                    if (!rdr.IsDBNull(16))
                    {
                        case_client.lease_start_date = rdr.GetDateTime(16);
                    }
                    else
                    {
                        case_client.lease_start_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(17))
                    {
                        case_client.minor_children = rdr.GetInt32(17);
                    }
                    else
                    {
                        case_client.minor_children = 0;
                    }
                    if (!rdr.IsDBNull(18))
                    {
                        case_client.monthly_rent_amt = rdr.GetDecimal(18);
                    }
                    else
                    {
                        case_client.monthly_rent_amt = 0;
                    }
                    if (!rdr.IsDBNull(19))
                    {
                        case_client.Other_help_Sources = rdr.GetString(19);
                    }
                    else
                    {
                        case_client.Other_help_Sources = " ";
                    }
                    if (!rdr.IsDBNull(20))
                    {
                        case_client.Other_help_Sources_memo = rdr.GetString(20);
                    }
                    else
                    {
                        case_client.Other_help_Sources_memo = " ";
                    }
                    if (!rdr.IsDBNull(21))
                    {
                        case_client.prev_address_id = rdr.GetInt32(21);
                    }
                    else
                    {
                        case_client.prev_address_id = 0;
                    }
                    if (!rdr.IsDBNull(22))
                    {
                        case_client.prev_residence_date = rdr.GetDateTime(22);
                    }
                    else
                    {
                        case_client.prev_residence_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(23))
                    {
                        case_client.relationship_to_head_of_household = rdr.GetString(23);
                    }
                    else
                    {
                        case_client.relationship_to_head_of_household = " ";
                    }
                    if (!rdr.IsDBNull(24))
                    {
                        case_client.rental_name = rdr.GetString(24);
                    }
                    else
                    {
                        case_client.rental_name = " ";
                    }
                    if (!rdr.IsDBNull(25))
                    {
                        case_client.rental_phone = rdr.GetString(25);
                    }
                    else
                    {
                        case_client.rental_phone = " ";
                    }
                    if (!rdr.IsDBNull(26))
                    {
                        case_client.sewage_amt_owed_today = rdr.GetDecimal(26);
                    }
                    else
                    {
                        case_client.sewage_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(27))
                    {
                        case_client.telephone_amt_owed_today = rdr.GetDecimal(27);
                    }
                    else
                    {
                        case_client.telephone_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(28))
                    {
                        case_client.trash_removal_amt_owed_today = rdr.GetDecimal(28);
                    }
                    else
                    {
                        case_client.trash_removal_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(29))
                    {
                        case_client.us_status_memo = rdr.GetString(29);
                    }
                    else
                    {
                        case_client.us_status_memo = " ";
                    }
                    if (!rdr.IsDBNull(30))
                    {
                        case_client.related_ll = rdr.GetString(30);
                    }
                    else
                    {
                        case_client.related_ll = " ";
                    }
                    if (!rdr.IsDBNull(31))
                    {
                        case_client.relation_to_ll = rdr.GetString(31);
                    }
                    else
                    {
                        case_client.relation_to_ll = " ";
                    }
                    if (!rdr.IsDBNull(32))
                    {
                        case_client.mtg_amt_owed_today = rdr.GetDecimal(32);
                    }
                    else
                    {
                        case_client.mtg_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(33))
                    {
                        case_client.utilities_list = rdr.GetString(33);
                    }
                    else
                    {
                        case_client.utilities_list = " ";
                    }
                    if (!rdr.IsDBNull(34))
                    {
                        case_client.water_amt_owed_today = rdr.GetDecimal(34);
                    }
                    else
                    {
                        case_client.water_amt_owed_today = 0;
                    }
                    if (!rdr.IsDBNull(35))
                    {
                        case_client.public_asst_app_date = rdr.GetDateTime(35);
                    }
                    else
                    {
                        case_client.public_asst_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(36))
                    {
                        case_client.util_allot_app_date = rdr.GetDateTime(36);
                    }
                    else
                    {
                        case_client.util_allot_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(37))
                    {
                        case_client.util_allot_amt = rdr.GetDecimal(37);
                    }
                    else
                    {
                        case_client.util_allot_amt = 0;
                    }
                    if (!rdr.IsDBNull(38))
                    {
                        case_client.utilities_incl = rdr.GetString(38);
                    }
                    else
                    {
                        case_client.utilities_incl = " ";
                    }
                    if (!rdr.IsDBNull(39))
                    {
                        case_client.fd_stmps_app_date = rdr.GetDateTime(39);
                    }
                    else
                    {
                        case_client.fd_stmps_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(40))
                    {
                        case_client.fd_stmps_amt = rdr.GetDecimal(40);
                    }
                    else
                    {
                        case_client.fd_stmps_amt = 0;
                    }
                    if (!rdr.IsDBNull(41))
                    {
                        case_client.fd_Inc = rdr.GetString(41);
                    }
                    else
                    {
                        case_client.fd_Inc = " ";
                    }
                    if (!rdr.IsDBNull(42))
                    {
                        case_client.afdc_app_date = rdr.GetDateTime(42);
                    }
                    else
                    {
                        case_client.afdc_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(43))
                    {
                        case_client.afdc_amt = rdr.GetDecimal(43);
                    }
                    else
                    {
                        case_client.afdc_amt = 0;
                    }
                    if (!rdr.IsDBNull(44))
                    {
                        case_client.afdc_Inc = rdr.GetString(44);
                    }
                    else
                    {
                        case_client.afdc_Inc = " ";
                    }
                    if (!rdr.IsDBNull(45))
                    {
                        case_client.oth_trustee_app_date = rdr.GetDateTime(45);
                    }
                    else
                    {
                        case_client.oth_trustee_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(46))
                    {
                        case_client.oth_trustee_amt = rdr.GetDecimal(46);
                    }
                    else
                    {
                        case_client.oth_trustee_amt = 0;
                    }
                    if (!rdr.IsDBNull(47))
                    {
                        case_client.oth_trustee_Inc = rdr.GetString(47);
                    }
                    else
                    {
                        case_client.oth_trustee_Inc = " ";
                    }
                    if (!rdr.IsDBNull(48))
                    {
                        case_client.ss_app_date = rdr.GetDateTime(48);
                    }
                    else
                    {
                        case_client.ss_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(49))
                    {
                        case_client.ss_amt = rdr.GetDecimal(49);
                    }
                    else
                    {
                        case_client.ss_amt = 0;
                    }
                    if (!rdr.IsDBNull(50))
                    {
                        case_client.ss_Inc = rdr.GetString(50);
                    }
                    else
                    {
                        case_client.ss_Inc = " ";
                    }
                    if (!rdr.IsDBNull(51))
                    {
                        case_client.va_app_date = rdr.GetDateTime(51);
                    }
                    else
                    {
                        case_client.va_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(52))
                    {
                        case_client.va_amt = rdr.GetDecimal(52);
                    }
                    else
                    {
                        case_client.va_amt = 0;
                    }
                    if (!rdr.IsDBNull(53))
                    {
                        case_client.va_Inc = rdr.GetString(53);
                    }
                    else
                    {
                        case_client.va_Inc = " ";
                    }
                    if (!rdr.IsDBNull(54))
                    {
                        case_client.eap_app_date = rdr.GetDateTime(54);
                    }
                    else
                    {
                        case_client.eap_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(55))
                    {
                        case_client.eap_amt = rdr.GetDecimal(55);
                    }
                    else
                    {
                        case_client.eap_amt = 0;
                    }
                    if (!rdr.IsDBNull(56))
                    {
                        case_client.eap_Inc = rdr.GetString(56);
                    }
                    else
                    {
                        case_client.eap_Inc = " ";
                    }
                    if (!rdr.IsDBNull(57))
                    {
                        case_client.fema_app_date = rdr.GetDateTime(57);
                    }
                    else
                    {
                        case_client.fema_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(58))
                    {
                        case_client.fema_amt = rdr.GetDecimal(58);
                    }
                    else
                    {
                        case_client.fema_amt = 0;
                    }
                    if (!rdr.IsDBNull(59))
                    {
                        case_client.fema_Inc = rdr.GetString(59);
                    }
                    else
                    {
                        case_client.fema_Inc = " ";
                    }
                    if (!rdr.IsDBNull(60))
                    {
                        case_client.unempl_app_date = rdr.GetDateTime(60);
                    }
                    else
                    {
                        case_client.unempl_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(61))
                    {
                        case_client.unempl_amt = rdr.GetDecimal(61);
                    }
                    else
                    {
                        case_client.unempl_amt = 0;
                    }
                    if (!rdr.IsDBNull(62))
                    {
                        case_client.unempl_Inc = rdr.GetString(62);
                    }
                    else
                    {
                        case_client.unempl_Inc = " ";
                    }
                    if (!rdr.IsDBNull(63))
                    {
                        case_client.grants_loans_app_date = rdr.GetDateTime(63);
                    }
                    else
                    {
                        case_client.grants_loans_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(64))
                    {
                        case_client.grants_loans_amt = rdr.GetDecimal(64);
                    }
                    else
                    {
                        case_client.grants_loans_amt = 0;
                    }
                    if (!rdr.IsDBNull(65))
                    {
                        case_client.grants_Inc = rdr.GetString(65);
                    }
                    else
                    {
                        case_client.grants_Inc = " ";
                    }
                    if (!rdr.IsDBNull(66))
                    {
                        case_client.other_app_date = rdr.GetDateTime(66);
                    }
                    else
                    {
                        case_client.other_app_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(67))
                    {
                        case_client.other_amt = rdr.GetDecimal(67);
                    }
                    else
                    {
                        case_client.other_amt = 0;
                    }
                    if (!rdr.IsDBNull(68))
                    {
                        case_client.other_Inc = rdr.GetString(68);
                    }
                    else
                    {
                        case_client.other_Inc = " ";
                    }
                    if (!rdr.IsDBNull(69))
                    {
                        case_client.denial_memo = rdr.GetString(69);
                    }
                    else
                    {
                        case_client.denial_memo = " ";
                    }
                    if (!rdr.IsDBNull(70))
                    {
                        case_client.welfr_fraud_memo = rdr.GetString(70);
                    }
                    else
                    {
                        case_client.welfr_fraud_memo = " ";
                    }
                    if (!rdr.IsDBNull(71))
                    {
                        case_client.Client_issue_Desc = rdr.GetString(71);
                    }
                    else
                    {
                        case_client.Client_issue_Desc = " ";
                    }
                    if (!rdr.IsDBNull(72))
                    {
                        case_client.Client_issue_resolved = rdr.GetString(72);
                    }
                    else
                    {
                        case_client.Client_issue_resolved = " ";
                    }
                    if (!rdr.IsDBNull(73))
                    {
                        case_client.Client_issue_comments = rdr.GetString(73);
                    }
                    else
                    {
                        case_client.Client_issue_comments = " ";
                    }
                }

            }
            else
            {
                case_client.SetColumnDefaults();
            }
        }
        catch (Exception ex)
        {
            case_client.SetColumnDefaults();
            return case_client;
        }
        finally
        {
            con.Close();
        }

        return case_client;

    }
    public case_client Insert(case_client id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CASE_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@cable_amt_owed_today", id.cable_amt_owed_today);
            cmd.Parameters.AddWithValue("@colessee_name", id.colessee_name);
            cmd.Parameters.AddWithValue("@child_support", id.child_support);
            cmd.Parameters.AddWithValue("@child_support_memo", id.child_support_memo);
            cmd.Parameters.AddWithValue("@curr_residence_date", id.curr_residence_date);
            cmd.Parameters.AddWithValue("@electric_amt_owed_today", id.electric_amt_owed_today);
            cmd.Parameters.AddWithValue("@employment_memo", id.employment_memo);
            cmd.Parameters.AddWithValue("@employment_status", id.employment_status);
            cmd.Parameters.AddWithValue("@gas_or_heating_amt_owed_today", id.gas_or_heating_amt_owed_today);
            cmd.Parameters.AddWithValue("@housing_amt_owed_today", id.housing_amt_owed_today);
            cmd.Parameters.AddWithValue("@housing_status", id.housing_status);
            cmd.Parameters.AddWithValue("@income_status", id.income_status);
            cmd.Parameters.AddWithValue("@lease_num_adults", id.lease_num_adults);
            cmd.Parameters.AddWithValue("@lease_start_date", id.lease_start_date);
            cmd.Parameters.AddWithValue("@minor_children", id.minor_children);
            cmd.Parameters.AddWithValue("@monthly_rent_amt", id.monthly_rent_amt);
            cmd.Parameters.AddWithValue("@Other_help_Sources", id.Other_help_Sources);
            cmd.Parameters.AddWithValue("@Other_help_Sources_memo", id.Other_help_Sources_memo);
            cmd.Parameters.AddWithValue("@prev_address_id", id.prev_address_id);
            cmd.Parameters.AddWithValue("@prev_residence_date", id.prev_residence_date);
            cmd.Parameters.AddWithValue("@relationship_to_head_of_household", id.relationship_to_head_of_household);
            cmd.Parameters.AddWithValue("@rental_name", id.rental_name);
            cmd.Parameters.AddWithValue("@rental_phone", id.rental_phone);
            cmd.Parameters.AddWithValue("@sewage_amt_owed_today", id.sewage_amt_owed_today);
            cmd.Parameters.AddWithValue("@telephone_amt_owed_today", id.telephone_amt_owed_today);
            cmd.Parameters.AddWithValue("@trash_removal_amt_owed_today", id.trash_removal_amt_owed_today);
            cmd.Parameters.AddWithValue("@us_status_memo", id.us_status_memo);
            cmd.Parameters.AddWithValue("@related_ll", id.related_ll);
            cmd.Parameters.AddWithValue("@relation_to_ll", id.relation_to_ll);
            cmd.Parameters.AddWithValue("@mtg_amt_owed_today", id.mtg_amt_owed_today);
            cmd.Parameters.AddWithValue("@utilities_list", id.utilities_list);
            cmd.Parameters.AddWithValue("@water_amt_owed_today", id.water_amt_owed_today);
            cmd.Parameters.AddWithValue("@public_asst_app_date", id.public_asst_app_date);
            cmd.Parameters.AddWithValue("@util_allot_app_date", id.util_allot_app_date);
            cmd.Parameters.AddWithValue("@util_allot_amt", id.util_allot_amt);
            cmd.Parameters.AddWithValue("@utilities_incl", id.utilities_incl);
            cmd.Parameters.AddWithValue("@fd_stmps_app_date", id.fd_stmps_app_date);
            cmd.Parameters.AddWithValue("@fd_stmps_amt", id.fd_stmps_amt);
            cmd.Parameters.AddWithValue("@fd_Inc", id.fd_Inc);
            cmd.Parameters.AddWithValue("@afdc_app_date", id.afdc_app_date);
            cmd.Parameters.AddWithValue("@afdc_amt", id.afdc_amt);
            cmd.Parameters.AddWithValue("@afdc_Inc", id.afdc_Inc);
            cmd.Parameters.AddWithValue("@oth_trustee_app_date", id.oth_trustee_app_date);
            cmd.Parameters.AddWithValue("@oth_trustee_amt", id.oth_trustee_amt);
            cmd.Parameters.AddWithValue("@oth_trustee_Inc", id.oth_trustee_Inc);
            cmd.Parameters.AddWithValue("@ss_app_date", id.ss_app_date);
            cmd.Parameters.AddWithValue("@ss_amt", id.ss_amt);
            cmd.Parameters.AddWithValue("@ss_Inc", id.ss_Inc);
            cmd.Parameters.AddWithValue("@va_app_date", id.va_app_date);
            cmd.Parameters.AddWithValue("@va_amt", id.va_amt);
            cmd.Parameters.AddWithValue("@va_Inc", id.va_Inc);
            cmd.Parameters.AddWithValue("@eap_app_date", id.eap_app_date);
            cmd.Parameters.AddWithValue("@eap_amt", id.eap_amt);
            cmd.Parameters.AddWithValue("@eap_Inc", id.eap_Inc);
            cmd.Parameters.AddWithValue("@fema_app_date", id.fema_app_date);
            cmd.Parameters.AddWithValue("@fema_amt", id.fema_amt);
            cmd.Parameters.AddWithValue("@fema_Inc", id.fema_Inc);
            cmd.Parameters.AddWithValue("@unempl_app_date", id.unempl_app_date);
            cmd.Parameters.AddWithValue("@unempl_amt", id.unempl_amt);
            cmd.Parameters.AddWithValue("@unempl_Inc", id.unempl_Inc);
            cmd.Parameters.AddWithValue("@grants_loans_app_date", id.grants_loans_app_date);
            cmd.Parameters.AddWithValue("@grants_loans_amt", id.grants_loans_amt);
            cmd.Parameters.AddWithValue("@grants_Inc", id.grants_Inc);
            cmd.Parameters.AddWithValue("@other_app_date", id.other_app_date);
            cmd.Parameters.AddWithValue("@other_amt", id.other_amt);
            cmd.Parameters.AddWithValue("@other_Inc", id.other_Inc);
            cmd.Parameters.AddWithValue("@denial_memo", id.denial_memo);
            cmd.Parameters.AddWithValue("@welfr_fraud_memo", id.welfr_fraud_memo);
            cmd.Parameters.AddWithValue("@Client_issue_Desc", id.Client_issue_Desc);
            cmd.Parameters.AddWithValue("@Client_issue_resolved", id.Client_issue_resolved);
            cmd.Parameters.AddWithValue("@Client_issue_comments", id.Client_issue_comments);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_CASE_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@cable_amt_owed_today", id.cable_amt_owed_today);
            cmd.Parameters.AddWithValue("@colessee_name", id.colessee_name);
            cmd.Parameters.AddWithValue("@child_support", id.child_support);
            cmd.Parameters.AddWithValue("@child_support_memo", id.child_support_memo);
            cmd.Parameters.AddWithValue("@curr_residence_date", id.curr_residence_date);
            cmd.Parameters.AddWithValue("@electric_amt_owed_today", id.electric_amt_owed_today);
            cmd.Parameters.AddWithValue("@employment_memo", id.employment_memo);
            cmd.Parameters.AddWithValue("@employment_status", id.employment_status);
            cmd.Parameters.AddWithValue("@gas_or_heating_amt_owed_today", id.gas_or_heating_amt_owed_today);
            cmd.Parameters.AddWithValue("@housing_amt_owed_today", id.housing_amt_owed_today);
            cmd.Parameters.AddWithValue("@housing_status", id.housing_status);
            cmd.Parameters.AddWithValue("@income_status", id.income_status);
            cmd.Parameters.AddWithValue("@lease_num_adults", id.lease_num_adults);
            cmd.Parameters.AddWithValue("@lease_start_date", id.lease_start_date);
            cmd.Parameters.AddWithValue("@minor_children", id.minor_children);
            cmd.Parameters.AddWithValue("@monthly_rent_amt", id.monthly_rent_amt);
            cmd.Parameters.AddWithValue("@Other_help_Sources", id.Other_help_Sources);
            cmd.Parameters.AddWithValue("@Other_help_Sources_memo", id.Other_help_Sources_memo);
            cmd.Parameters.AddWithValue("@prev_address_id", id.prev_address_id);
            cmd.Parameters.AddWithValue("@prev_residence_date", id.prev_residence_date);
            cmd.Parameters.AddWithValue("@relationship_to_head_of_household", id.relationship_to_head_of_household);
            cmd.Parameters.AddWithValue("@rental_name", id.rental_name);
            cmd.Parameters.AddWithValue("@rental_phone", id.rental_phone);
            cmd.Parameters.AddWithValue("@sewage_amt_owed_today", id.sewage_amt_owed_today);
            cmd.Parameters.AddWithValue("@telephone_amt_owed_today", id.telephone_amt_owed_today);
            cmd.Parameters.AddWithValue("@trash_removal_amt_owed_today", id.trash_removal_amt_owed_today);
            cmd.Parameters.AddWithValue("@us_status_memo", id.us_status_memo);
            cmd.Parameters.AddWithValue("@related_ll", id.related_ll);
            cmd.Parameters.AddWithValue("@relation_to_ll", id.relation_to_ll);
            cmd.Parameters.AddWithValue("@mtg_amt_owed_today", id.mtg_amt_owed_today);
            cmd.Parameters.AddWithValue("@utilities_list", id.utilities_list);
            cmd.Parameters.AddWithValue("@water_amt_owed_today", id.water_amt_owed_today);
            cmd.Parameters.AddWithValue("@public_asst_app_date", id.public_asst_app_date);
            cmd.Parameters.AddWithValue("@util_allot_app_date", id.util_allot_app_date);
            cmd.Parameters.AddWithValue("@util_allot_amt", id.util_allot_amt);
            cmd.Parameters.AddWithValue("@utilities_incl", id.utilities_incl);
            cmd.Parameters.AddWithValue("@fd_stmps_app_date", id.fd_stmps_app_date);
            cmd.Parameters.AddWithValue("@fd_stmps_amt", id.fd_stmps_amt);
            cmd.Parameters.AddWithValue("@fd_Inc", id.fd_Inc);
            cmd.Parameters.AddWithValue("@afdc_app_date", id.afdc_app_date);
            cmd.Parameters.AddWithValue("@afdc_amt", id.afdc_amt);
            cmd.Parameters.AddWithValue("@afdc_Inc", id.afdc_Inc);
            cmd.Parameters.AddWithValue("@oth_trustee_app_date", id.oth_trustee_app_date);
            cmd.Parameters.AddWithValue("@oth_trustee_amt", id.oth_trustee_amt);
            cmd.Parameters.AddWithValue("@oth_trustee_Inc", id.oth_trustee_Inc);
            cmd.Parameters.AddWithValue("@ss_app_date", id.ss_app_date);
            cmd.Parameters.AddWithValue("@ss_amt", id.ss_amt);
            cmd.Parameters.AddWithValue("@ss_Inc", id.ss_Inc);
            cmd.Parameters.AddWithValue("@va_app_date", id.va_app_date);
            cmd.Parameters.AddWithValue("@va_amt", id.va_amt);
            cmd.Parameters.AddWithValue("@va_Inc", id.va_Inc);
            cmd.Parameters.AddWithValue("@eap_app_date", id.eap_app_date);
            cmd.Parameters.AddWithValue("@eap_amt", id.eap_amt);
            cmd.Parameters.AddWithValue("@eap_Inc", id.eap_Inc);
            cmd.Parameters.AddWithValue("@fema_app_date", id.fema_app_date);
            cmd.Parameters.AddWithValue("@fema_amt", id.fema_amt);
            cmd.Parameters.AddWithValue("@fema_Inc", id.fema_Inc);
            cmd.Parameters.AddWithValue("@unempl_app_date", id.unempl_app_date);
            cmd.Parameters.AddWithValue("@unempl_amt", id.unempl_amt);
            cmd.Parameters.AddWithValue("@unempl_Inc", id.unempl_Inc);
            cmd.Parameters.AddWithValue("@grants_loans_app_date", id.grants_loans_app_date);
            cmd.Parameters.AddWithValue("@grants_loans_amt", id.grants_loans_amt);
            cmd.Parameters.AddWithValue("@grants_Inc", id.grants_Inc);
            cmd.Parameters.AddWithValue("@other_app_date", id.other_app_date);
            cmd.Parameters.AddWithValue("@other_amt", id.other_amt);
            cmd.Parameters.AddWithValue("@other_Inc", id.other_Inc);
            cmd.Parameters.AddWithValue("@denial_memo", id.denial_memo);
            cmd.Parameters.AddWithValue("@welfr_fraud_memo", id.welfr_fraud_memo);
            cmd.Parameters.AddWithValue("@Client_issue_Desc", id.Client_issue_Desc);
            cmd.Parameters.AddWithValue("@Client_issue_resolved", id.Client_issue_resolved);
            cmd.Parameters.AddWithValue("@Client_issue_comments", id.Client_issue_comments);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.case_id = rdr.GetInt32(0);
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
    public Boolean Update(case_client id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CASE_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id.case_id);
            cmd.Parameters.AddWithValue("@client_id", id.client_id);
            cmd.Parameters.AddWithValue("@address_id", id.address_id);
            cmd.Parameters.AddWithValue("@cable_amt_owed_today", id.cable_amt_owed_today);
            cmd.Parameters.AddWithValue("@colessee_name", id.colessee_name);
            cmd.Parameters.AddWithValue("@child_support", id.child_support);
            cmd.Parameters.AddWithValue("@child_support_memo", id.child_support_memo);
            cmd.Parameters.AddWithValue("@curr_residence_date", id.curr_residence_date);
            cmd.Parameters.AddWithValue("@electric_amt_owed_today", id.electric_amt_owed_today);
            cmd.Parameters.AddWithValue("@employment_memo", id.employment_memo);
            cmd.Parameters.AddWithValue("@employment_status", id.employment_status);
            cmd.Parameters.AddWithValue("@gas_or_heating_amt_owed_today", id.gas_or_heating_amt_owed_today);
            cmd.Parameters.AddWithValue("@housing_amt_owed_today", id.housing_amt_owed_today);
            cmd.Parameters.AddWithValue("@housing_status", id.housing_status);
            cmd.Parameters.AddWithValue("@income_status", id.income_status);
            cmd.Parameters.AddWithValue("@lease_num_adults", id.lease_num_adults);
            cmd.Parameters.AddWithValue("@lease_start_date", id.lease_start_date);
            cmd.Parameters.AddWithValue("@minor_children", id.minor_children);
            cmd.Parameters.AddWithValue("@monthly_rent_amt", id.monthly_rent_amt);
            cmd.Parameters.AddWithValue("@Other_help_Sources", id.Other_help_Sources);
            cmd.Parameters.AddWithValue("@Other_help_Sources_memo", id.Other_help_Sources_memo);
            cmd.Parameters.AddWithValue("@prev_address_id", id.prev_address_id);
            cmd.Parameters.AddWithValue("@prev_residence_date", id.prev_residence_date);
            cmd.Parameters.AddWithValue("@relationship_to_head_of_household", id.relationship_to_head_of_household);
            cmd.Parameters.AddWithValue("@rental_name", id.rental_name);
            cmd.Parameters.AddWithValue("@rental_phone", id.rental_phone);
            cmd.Parameters.AddWithValue("@sewage_amt_owed_today", id.sewage_amt_owed_today);
            cmd.Parameters.AddWithValue("@telephone_amt_owed_today", id.telephone_amt_owed_today);
            cmd.Parameters.AddWithValue("@trash_removal_amt_owed_today", id.trash_removal_amt_owed_today);
            cmd.Parameters.AddWithValue("@us_status_memo", id.us_status_memo);
            cmd.Parameters.AddWithValue("@related_ll", id.related_ll);
            cmd.Parameters.AddWithValue("@relation_to_ll", id.relation_to_ll);
            cmd.Parameters.AddWithValue("@mtg_amt_owed_today", id.mtg_amt_owed_today);
            cmd.Parameters.AddWithValue("@utilities_list", id.utilities_list);
            cmd.Parameters.AddWithValue("@water_amt_owed_today", id.water_amt_owed_today);
            cmd.Parameters.AddWithValue("@public_asst_app_date", id.public_asst_app_date);
            cmd.Parameters.AddWithValue("@util_allot_app_date", id.util_allot_app_date);
            cmd.Parameters.AddWithValue("@util_allot_amt", id.util_allot_amt);
            cmd.Parameters.AddWithValue("@utilities_incl", id.utilities_incl);
            cmd.Parameters.AddWithValue("@fd_stmps_app_date", id.fd_stmps_app_date);
            cmd.Parameters.AddWithValue("@fd_stmps_amt", id.fd_stmps_amt);
            cmd.Parameters.AddWithValue("@fd_Inc", id.fd_Inc);
            cmd.Parameters.AddWithValue("@afdc_app_date", id.afdc_app_date);
            cmd.Parameters.AddWithValue("@afdc_amt", id.afdc_amt);
            cmd.Parameters.AddWithValue("@afdc_Inc", id.afdc_Inc);
            cmd.Parameters.AddWithValue("@oth_trustee_app_date", id.oth_trustee_app_date);
            cmd.Parameters.AddWithValue("@oth_trustee_amt", id.oth_trustee_amt);
            cmd.Parameters.AddWithValue("@oth_trustee_Inc", id.oth_trustee_Inc);
            cmd.Parameters.AddWithValue("@ss_app_date", id.ss_app_date);
            cmd.Parameters.AddWithValue("@ss_amt", id.ss_amt);
            cmd.Parameters.AddWithValue("@ss_Inc", id.ss_Inc);
            cmd.Parameters.AddWithValue("@va_app_date", id.va_app_date);
            cmd.Parameters.AddWithValue("@va_amt", id.va_amt);
            cmd.Parameters.AddWithValue("@va_Inc", id.va_Inc);
            cmd.Parameters.AddWithValue("@eap_app_date", id.eap_app_date);
            cmd.Parameters.AddWithValue("@eap_amt", id.eap_amt);
            cmd.Parameters.AddWithValue("@eap_Inc", id.eap_Inc);
            cmd.Parameters.AddWithValue("@fema_app_date", id.fema_app_date);
            cmd.Parameters.AddWithValue("@fema_amt", id.fema_amt);
            cmd.Parameters.AddWithValue("@fema_Inc", id.fema_Inc);
            cmd.Parameters.AddWithValue("@unempl_app_date", id.unempl_app_date);
            cmd.Parameters.AddWithValue("@unempl_amt", id.unempl_amt);
            cmd.Parameters.AddWithValue("@unempl_Inc", id.unempl_Inc);
            cmd.Parameters.AddWithValue("@grants_loans_app_date", id.grants_loans_app_date);
            cmd.Parameters.AddWithValue("@grants_loans_amt", id.grants_loans_amt);
            cmd.Parameters.AddWithValue("@grants_Inc", id.grants_Inc);
            cmd.Parameters.AddWithValue("@other_app_date", id.other_app_date);
            cmd.Parameters.AddWithValue("@other_amt", id.other_amt);
            cmd.Parameters.AddWithValue("@other_Inc", id.other_Inc);
            cmd.Parameters.AddWithValue("@denial_memo", id.denial_memo);
            cmd.Parameters.AddWithValue("@welfr_fraud_memo", id.welfr_fraud_memo);
            cmd.Parameters.AddWithValue("@Client_issue_Desc", id.Client_issue_Desc);
            cmd.Parameters.AddWithValue("@Client_issue_resolved", id.Client_issue_resolved);
            cmd.Parameters.AddWithValue("@Client_issue_comments", id.Client_issue_comments);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CASE_CLIENT", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@case_id", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CASE_CLIENT_WC", con);
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




