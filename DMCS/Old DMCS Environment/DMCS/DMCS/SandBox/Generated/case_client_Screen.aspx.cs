using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;
using System.Web.Mvc;
using DMCS.App_Code;

namespace DMCS.SandBox.Generated
{
public partial class case_client_Screen : System.Web.UI.Page
{
            public case_client case_client = new case_client();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!ClientScript.IsStartupScriptRegistered("initialize"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "initialize", "initialize();", true);
        }
        if (!Page.IsPostBack)
        {   }
    }
    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Insert Tab Methods
    protected void Insert_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Insert_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        case_client = Insert_case_client_select(Convert.ToInt32(Insert_case_client_GridView.SelectedValue));
    }
    public case_client Insert_case_client_select(int ID)
    {
        case_client = case_client.Select(ID);
        Insert_client_id_txt.Text = Convert.ToString(case_client.client_id);
        Insert_address_id_txt.Text = Convert.ToString(case_client.address_id);
        Insert_cable_amt_owed_today_txt.Text = Convert.ToString(case_client.cable_amt_owed_today);
        Insert_colessee_name_txt.Text = Convert.ToString(case_client.colessee_name);
        Insert_child_support_txt.Text = Convert.ToString(case_client.child_support);
        Insert_child_support_memo_txt.Text = Convert.ToString(case_client.child_support_memo);
        Insert_curr_residence_date_txt.Text = Convert.ToString(case_client.curr_residence_date);
        Insert_electric_amt_owed_today_txt.Text = Convert.ToString(case_client.electric_amt_owed_today);
        Insert_employment_memo_txt.Text = Convert.ToString(case_client.employment_memo);
        Insert_employment_status_txt.Text = Convert.ToString(case_client.employment_status);
        Insert_gas_or_heating_amt_owed_today_txt.Text = Convert.ToString(case_client.gas_or_heating_amt_owed_today);
        Insert_housing_amt_owed_today_txt.Text = Convert.ToString(case_client.housing_amt_owed_today);
        Insert_housing_status_txt.Text = Convert.ToString(case_client.housing_status);
        Insert_income_status_txt.Text = Convert.ToString(case_client.income_status);
        Insert_lease_num_adults_txt.Text = Convert.ToString(case_client.lease_num_adults);
        Insert_lease_start_date_txt.Text = Convert.ToString(case_client.lease_start_date);
        Insert_minor_children_txt.Text = Convert.ToString(case_client.minor_children);
        Insert_monthly_rent_amt_txt.Text = Convert.ToString(case_client.monthly_rent_amt);
        Insert_Other_help_Sources_txt.Text = Convert.ToString(case_client.Other_help_Sources);
        Insert_Other_help_Sources_memo_txt.Text = Convert.ToString(case_client.Other_help_Sources_memo);
        Insert_prev_address_id_txt.Text = Convert.ToString(case_client.prev_address_id);
        Insert_prev_residence_date_txt.Text = Convert.ToString(case_client.prev_residence_date);
        Insert_relationship_to_head_of_household_txt.Text = Convert.ToString(case_client.relationship_to_head_of_household);
        Insert_rental_name_txt.Text = Convert.ToString(case_client.rental_name);
        Insert_rental_phone_txt.Text = Convert.ToString(case_client.rental_phone);
        Insert_sewage_amt_owed_today_txt.Text = Convert.ToString(case_client.sewage_amt_owed_today);
        Insert_telephone_amt_owed_today_txt.Text = Convert.ToString(case_client.telephone_amt_owed_today);
        Insert_trash_removal_amt_owed_today_txt.Text = Convert.ToString(case_client.trash_removal_amt_owed_today);
        Insert_us_status_memo_txt.Text = Convert.ToString(case_client.us_status_memo);
        Insert_related_ll_txt.Text = Convert.ToString(case_client.related_ll);
        Insert_relation_to_ll_txt.Text = Convert.ToString(case_client.relation_to_ll);
        Insert_mtg_amt_owed_today_txt.Text = Convert.ToString(case_client.mtg_amt_owed_today);
        Insert_utilities_list_txt.Text = Convert.ToString(case_client.utilities_list);
        Insert_water_amt_owed_today_txt.Text = Convert.ToString(case_client.water_amt_owed_today);
        Insert_public_asst_app_date_txt.Text = Convert.ToString(case_client.public_asst_app_date);
        Insert_util_allot_app_date_txt.Text = Convert.ToString(case_client.util_allot_app_date);
        Insert_util_allot_amt_txt.Text = Convert.ToString(case_client.util_allot_amt);
        Insert_utilities_incl_txt.Text = Convert.ToString(case_client.utilities_incl);
        Insert_fd_stmps_app_date_txt.Text = Convert.ToString(case_client.fd_stmps_app_date);
        Insert_fd_stmps_amt_txt.Text = Convert.ToString(case_client.fd_stmps_amt);
        Insert_fd_Inc_txt.Text = Convert.ToString(case_client.fd_Inc);
        Insert_afdc_app_date_txt.Text = Convert.ToString(case_client.afdc_app_date);
        Insert_afdc_amt_txt.Text = Convert.ToString(case_client.afdc_amt);
        Insert_afdc_Inc_txt.Text = Convert.ToString(case_client.afdc_Inc);
        Insert_oth_trustee_app_date_txt.Text = Convert.ToString(case_client.oth_trustee_app_date);
        Insert_oth_trustee_amt_txt.Text = Convert.ToString(case_client.oth_trustee_amt);
        Insert_oth_trustee_Inc_txt.Text = Convert.ToString(case_client.oth_trustee_Inc);
        Insert_ss_app_date_txt.Text = Convert.ToString(case_client.ss_app_date);
        Insert_ss_amt_txt.Text = Convert.ToString(case_client.ss_amt);
        Insert_ss_Inc_txt.Text = Convert.ToString(case_client.ss_Inc);
        Insert_va_app_date_txt.Text = Convert.ToString(case_client.va_app_date);
        Insert_va_amt_txt.Text = Convert.ToString(case_client.va_amt);
        Insert_va_Inc_txt.Text = Convert.ToString(case_client.va_Inc);
        Insert_eap_app_date_txt.Text = Convert.ToString(case_client.eap_app_date);
        Insert_eap_amt_txt.Text = Convert.ToString(case_client.eap_amt);
        Insert_eap_Inc_txt.Text = Convert.ToString(case_client.eap_Inc);
        Insert_fema_app_date_txt.Text = Convert.ToString(case_client.fema_app_date);
        Insert_fema_amt_txt.Text = Convert.ToString(case_client.fema_amt);
        Insert_fema_Inc_txt.Text = Convert.ToString(case_client.fema_Inc);
        Insert_unempl_app_date_txt.Text = Convert.ToString(case_client.unempl_app_date);
        Insert_unempl_amt_txt.Text = Convert.ToString(case_client.unempl_amt);
        Insert_unempl_Inc_txt.Text = Convert.ToString(case_client.unempl_Inc);
        Insert_grants_loans_app_date_txt.Text = Convert.ToString(case_client.grants_loans_app_date);
        Insert_grants_loans_amt_txt.Text = Convert.ToString(case_client.grants_loans_amt);
        Insert_grants_Inc_txt.Text = Convert.ToString(case_client.grants_Inc);
        Insert_other_app_date_txt.Text = Convert.ToString(case_client.other_app_date);
        Insert_other_amt_txt.Text = Convert.ToString(case_client.other_amt);
        Insert_other_Inc_txt.Text = Convert.ToString(case_client.other_Inc);
        Insert_denial_memo_txt.Text = Convert.ToString(case_client.denial_memo);
        Insert_welfr_fraud_memo_txt.Text = Convert.ToString(case_client.welfr_fraud_memo);
        Insert_Client_issue_Desc_txt.Text = Convert.ToString(case_client.Client_issue_Desc);
        Insert_Client_issue_resolved_txt.Text = Convert.ToString(case_client.Client_issue_resolved);
        Insert_Client_issue_comments_txt.Text = Convert.ToString(case_client.Client_issue_comments);
        return case_client;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        case_client = case_client_insert();
    }
    public case_client case_client_insert()
    {
        case_client.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        case_client.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        case_client.cable_amt_owed_today = Convert.ToDecimal(Insert_cable_amt_owed_today_txt.Text);
        case_client.colessee_name = Insert_colessee_name_txt.Text;
        case_client.child_support = Insert_child_support_txt.Text;
        case_client.child_support_memo = Insert_child_support_memo_txt.Text;
        case_client.curr_residence_date = Convert.ToDateTime(Insert_curr_residence_date_txt.Text);
        case_client.electric_amt_owed_today = Convert.ToDecimal(Insert_electric_amt_owed_today_txt.Text);
        case_client.employment_memo = Insert_employment_memo_txt.Text;
        case_client.employment_status = Insert_employment_status_txt.Text;
        case_client.gas_or_heating_amt_owed_today = Convert.ToDecimal(Insert_gas_or_heating_amt_owed_today_txt.Text);
        case_client.housing_amt_owed_today = Convert.ToDecimal(Insert_housing_amt_owed_today_txt.Text);
        case_client.housing_status = Insert_housing_status_txt.Text;
        case_client.income_status = Insert_income_status_txt.Text;
        case_client.lease_num_adults = Convert.ToInt32(Insert_lease_num_adults_txt.Text);
        case_client.lease_start_date = Convert.ToDateTime(Insert_lease_start_date_txt.Text);
        case_client.minor_children = Convert.ToInt32(Insert_minor_children_txt.Text);
        case_client.monthly_rent_amt = Convert.ToDecimal(Insert_monthly_rent_amt_txt.Text);
        case_client.Other_help_Sources = Insert_Other_help_Sources_txt.Text;
        case_client.Other_help_Sources_memo = Insert_Other_help_Sources_memo_txt.Text;
        case_client.prev_address_id = Convert.ToInt32(Insert_prev_address_id_txt.Text);
        case_client.prev_residence_date = Convert.ToDateTime(Insert_prev_residence_date_txt.Text);
        case_client.relationship_to_head_of_household = Insert_relationship_to_head_of_household_txt.Text;
        case_client.rental_name = Insert_rental_name_txt.Text;
        case_client.rental_phone = Insert_rental_phone_txt.Text;
        case_client.sewage_amt_owed_today = Convert.ToDecimal(Insert_sewage_amt_owed_today_txt.Text);
        case_client.telephone_amt_owed_today = Convert.ToDecimal(Insert_telephone_amt_owed_today_txt.Text);
        case_client.trash_removal_amt_owed_today = Convert.ToDecimal(Insert_trash_removal_amt_owed_today_txt.Text);
        case_client.us_status_memo = Insert_us_status_memo_txt.Text;
        case_client.related_ll = Insert_related_ll_txt.Text;
        case_client.relation_to_ll = Insert_relation_to_ll_txt.Text;
        case_client.mtg_amt_owed_today = Convert.ToDecimal(Insert_mtg_amt_owed_today_txt.Text);
        case_client.utilities_list = Insert_utilities_list_txt.Text;
        case_client.water_amt_owed_today = Convert.ToDecimal(Insert_water_amt_owed_today_txt.Text);
        case_client.public_asst_app_date = Convert.ToDateTime(Insert_public_asst_app_date_txt.Text);
        case_client.util_allot_app_date = Convert.ToDateTime(Insert_util_allot_app_date_txt.Text);
        case_client.util_allot_amt = Convert.ToDecimal(Insert_util_allot_amt_txt.Text);
        case_client.utilities_incl = Insert_utilities_incl_txt.Text;
        case_client.fd_stmps_app_date = Convert.ToDateTime(Insert_fd_stmps_app_date_txt.Text);
        case_client.fd_stmps_amt = Convert.ToDecimal(Insert_fd_stmps_amt_txt.Text);
        case_client.fd_Inc = Insert_fd_Inc_txt.Text;
        case_client.afdc_app_date = Convert.ToDateTime(Insert_afdc_app_date_txt.Text);
        case_client.afdc_amt = Convert.ToDecimal(Insert_afdc_amt_txt.Text);
        case_client.afdc_Inc = Insert_afdc_Inc_txt.Text;
        case_client.oth_trustee_app_date = Convert.ToDateTime(Insert_oth_trustee_app_date_txt.Text);
        case_client.oth_trustee_amt = Convert.ToDecimal(Insert_oth_trustee_amt_txt.Text);
        case_client.oth_trustee_Inc = Insert_oth_trustee_Inc_txt.Text;
        case_client.ss_app_date = Convert.ToDateTime(Insert_ss_app_date_txt.Text);
        case_client.ss_amt = Convert.ToDecimal(Insert_ss_amt_txt.Text);
        case_client.ss_Inc = Insert_ss_Inc_txt.Text;
        case_client.va_app_date = Convert.ToDateTime(Insert_va_app_date_txt.Text);
        case_client.va_amt = Convert.ToDecimal(Insert_va_amt_txt.Text);
        case_client.va_Inc = Insert_va_Inc_txt.Text;
        case_client.eap_app_date = Convert.ToDateTime(Insert_eap_app_date_txt.Text);
        case_client.eap_amt = Convert.ToDecimal(Insert_eap_amt_txt.Text);
        case_client.eap_Inc = Insert_eap_Inc_txt.Text;
        case_client.fema_app_date = Convert.ToDateTime(Insert_fema_app_date_txt.Text);
        case_client.fema_amt = Convert.ToDecimal(Insert_fema_amt_txt.Text);
        case_client.fema_Inc = Insert_fema_Inc_txt.Text;
        case_client.unempl_app_date = Convert.ToDateTime(Insert_unempl_app_date_txt.Text);
        case_client.unempl_amt = Convert.ToDecimal(Insert_unempl_amt_txt.Text);
        case_client.unempl_Inc = Insert_unempl_Inc_txt.Text;
        case_client.grants_loans_app_date = Convert.ToDateTime(Insert_grants_loans_app_date_txt.Text);
        case_client.grants_loans_amt = Convert.ToDecimal(Insert_grants_loans_amt_txt.Text);
        case_client.grants_Inc = Insert_grants_Inc_txt.Text;
        case_client.other_app_date = Convert.ToDateTime(Insert_other_app_date_txt.Text);
        case_client.other_amt = Convert.ToDecimal(Insert_other_amt_txt.Text);
        case_client.other_Inc = Insert_other_Inc_txt.Text;
        case_client.denial_memo = Insert_denial_memo_txt.Text;
        case_client.welfr_fraud_memo = Insert_welfr_fraud_memo_txt.Text;
        case_client.Client_issue_Desc = Insert_Client_issue_Desc_txt.Text;
        case_client.Client_issue_resolved = Insert_Client_issue_resolved_txt.Text;
        case_client.Client_issue_comments = Insert_Client_issue_comments_txt.Text;
        case_client = case_client.Insert(case_client);
        Insert_case_client_GridView.DataBind();
        Update_case_client_GridView.DataBind();
        Delete_case_client_GridView.DataBind();
        return case_client;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Update_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        case_client = Update_case_client_select(Convert.ToInt32(Update_case_client_GridView.SelectedValue));
    }
    public case_client Update_case_client_select(int ID)
    {
        case_client = case_client.Select(ID);
        Update_case_id_txt.Text = Convert.ToString(case_client.case_id);
        Update_client_id_txt.Text = Convert.ToString(case_client.client_id);
        Update_address_id_txt.Text = Convert.ToString(case_client.address_id);
        Update_cable_amt_owed_today_txt.Text = Convert.ToString(case_client.cable_amt_owed_today);
        Update_colessee_name_txt.Text = Convert.ToString(case_client.colessee_name);
        Update_child_support_txt.Text = Convert.ToString(case_client.child_support);
        Update_child_support_memo_txt.Text = Convert.ToString(case_client.child_support_memo);
        Update_curr_residence_date_txt.Text = Convert.ToString(case_client.curr_residence_date);
        Update_electric_amt_owed_today_txt.Text = Convert.ToString(case_client.electric_amt_owed_today);
        Update_employment_memo_txt.Text = Convert.ToString(case_client.employment_memo);
        Update_employment_status_txt.Text = Convert.ToString(case_client.employment_status);
        Update_gas_or_heating_amt_owed_today_txt.Text = Convert.ToString(case_client.gas_or_heating_amt_owed_today);
        Update_housing_amt_owed_today_txt.Text = Convert.ToString(case_client.housing_amt_owed_today);
        Update_housing_status_txt.Text = Convert.ToString(case_client.housing_status);
        Update_income_status_txt.Text = Convert.ToString(case_client.income_status);
        Update_lease_num_adults_txt.Text = Convert.ToString(case_client.lease_num_adults);
        Update_lease_start_date_txt.Text = Convert.ToString(case_client.lease_start_date);
        Update_minor_children_txt.Text = Convert.ToString(case_client.minor_children);
        Update_monthly_rent_amt_txt.Text = Convert.ToString(case_client.monthly_rent_amt);
        Update_Other_help_Sources_txt.Text = Convert.ToString(case_client.Other_help_Sources);
        Update_Other_help_Sources_memo_txt.Text = Convert.ToString(case_client.Other_help_Sources_memo);
        Update_prev_address_id_txt.Text = Convert.ToString(case_client.prev_address_id);
        Update_prev_residence_date_txt.Text = Convert.ToString(case_client.prev_residence_date);
        Update_relationship_to_head_of_household_txt.Text = Convert.ToString(case_client.relationship_to_head_of_household);
        Update_rental_name_txt.Text = Convert.ToString(case_client.rental_name);
        Update_rental_phone_txt.Text = Convert.ToString(case_client.rental_phone);
        Update_sewage_amt_owed_today_txt.Text = Convert.ToString(case_client.sewage_amt_owed_today);
        Update_telephone_amt_owed_today_txt.Text = Convert.ToString(case_client.telephone_amt_owed_today);
        Update_trash_removal_amt_owed_today_txt.Text = Convert.ToString(case_client.trash_removal_amt_owed_today);
        Update_us_status_memo_txt.Text = Convert.ToString(case_client.us_status_memo);
        Update_related_ll_txt.Text = Convert.ToString(case_client.related_ll);
        Update_relation_to_ll_txt.Text = Convert.ToString(case_client.relation_to_ll);
        Update_mtg_amt_owed_today_txt.Text = Convert.ToString(case_client.mtg_amt_owed_today);
        Update_utilities_list_txt.Text = Convert.ToString(case_client.utilities_list);
        Update_water_amt_owed_today_txt.Text = Convert.ToString(case_client.water_amt_owed_today);
        Update_public_asst_app_date_txt.Text = Convert.ToString(case_client.public_asst_app_date);
        Update_util_allot_app_date_txt.Text = Convert.ToString(case_client.util_allot_app_date);
        Update_util_allot_amt_txt.Text = Convert.ToString(case_client.util_allot_amt);
        Update_utilities_incl_txt.Text = Convert.ToString(case_client.utilities_incl);
        Update_fd_stmps_app_date_txt.Text = Convert.ToString(case_client.fd_stmps_app_date);
        Update_fd_stmps_amt_txt.Text = Convert.ToString(case_client.fd_stmps_amt);
        Update_fd_Inc_txt.Text = Convert.ToString(case_client.fd_Inc);
        Update_afdc_app_date_txt.Text = Convert.ToString(case_client.afdc_app_date);
        Update_afdc_amt_txt.Text = Convert.ToString(case_client.afdc_amt);
        Update_afdc_Inc_txt.Text = Convert.ToString(case_client.afdc_Inc);
        Update_oth_trustee_app_date_txt.Text = Convert.ToString(case_client.oth_trustee_app_date);
        Update_oth_trustee_amt_txt.Text = Convert.ToString(case_client.oth_trustee_amt);
        Update_oth_trustee_Inc_txt.Text = Convert.ToString(case_client.oth_trustee_Inc);
        Update_ss_app_date_txt.Text = Convert.ToString(case_client.ss_app_date);
        Update_ss_amt_txt.Text = Convert.ToString(case_client.ss_amt);
        Update_ss_Inc_txt.Text = Convert.ToString(case_client.ss_Inc);
        Update_va_app_date_txt.Text = Convert.ToString(case_client.va_app_date);
        Update_va_amt_txt.Text = Convert.ToString(case_client.va_amt);
        Update_va_Inc_txt.Text = Convert.ToString(case_client.va_Inc);
        Update_eap_app_date_txt.Text = Convert.ToString(case_client.eap_app_date);
        Update_eap_amt_txt.Text = Convert.ToString(case_client.eap_amt);
        Update_eap_Inc_txt.Text = Convert.ToString(case_client.eap_Inc);
        Update_fema_app_date_txt.Text = Convert.ToString(case_client.fema_app_date);
        Update_fema_amt_txt.Text = Convert.ToString(case_client.fema_amt);
        Update_fema_Inc_txt.Text = Convert.ToString(case_client.fema_Inc);
        Update_unempl_app_date_txt.Text = Convert.ToString(case_client.unempl_app_date);
        Update_unempl_amt_txt.Text = Convert.ToString(case_client.unempl_amt);
        Update_unempl_Inc_txt.Text = Convert.ToString(case_client.unempl_Inc);
        Update_grants_loans_app_date_txt.Text = Convert.ToString(case_client.grants_loans_app_date);
        Update_grants_loans_amt_txt.Text = Convert.ToString(case_client.grants_loans_amt);
        Update_grants_Inc_txt.Text = Convert.ToString(case_client.grants_Inc);
        Update_other_app_date_txt.Text = Convert.ToString(case_client.other_app_date);
        Update_other_amt_txt.Text = Convert.ToString(case_client.other_amt);
        Update_other_Inc_txt.Text = Convert.ToString(case_client.other_Inc);
        Update_denial_memo_txt.Text = Convert.ToString(case_client.denial_memo);
        Update_welfr_fraud_memo_txt.Text = Convert.ToString(case_client.welfr_fraud_memo);
        Update_Client_issue_Desc_txt.Text = Convert.ToString(case_client.Client_issue_Desc);
        Update_Client_issue_resolved_txt.Text = Convert.ToString(case_client.Client_issue_resolved);
        Update_Client_issue_comments_txt.Text = Convert.ToString(case_client.Client_issue_comments);
        return case_client;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        case_client = case_client_update(Convert.ToInt32(Update_case_client_GridView.SelectedValue));
    }
    public case_client case_client_update(int ID)
    {
        case_client = case_client.Select(ID);
        case_client.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        case_client.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        case_client.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        case_client.cable_amt_owed_today = Convert.ToDecimal(Update_cable_amt_owed_today_txt.Text);
        case_client.colessee_name = Update_colessee_name_txt.Text;
        case_client.child_support = Update_child_support_txt.Text;
        case_client.child_support_memo = Update_child_support_memo_txt.Text;
        case_client.curr_residence_date = Convert.ToDateTime(Update_curr_residence_date_txt.Text);
        case_client.electric_amt_owed_today = Convert.ToDecimal(Update_electric_amt_owed_today_txt.Text);
        case_client.employment_memo = Update_employment_memo_txt.Text;
        case_client.employment_status = Update_employment_status_txt.Text;
        case_client.gas_or_heating_amt_owed_today = Convert.ToDecimal(Update_gas_or_heating_amt_owed_today_txt.Text);
        case_client.housing_amt_owed_today = Convert.ToDecimal(Update_housing_amt_owed_today_txt.Text);
        case_client.housing_status = Update_housing_status_txt.Text;
        case_client.income_status = Update_income_status_txt.Text;
        case_client.lease_num_adults = Convert.ToInt32(Update_lease_num_adults_txt.Text);
        case_client.lease_start_date = Convert.ToDateTime(Update_lease_start_date_txt.Text);
        case_client.minor_children = Convert.ToInt32(Update_minor_children_txt.Text);
        case_client.monthly_rent_amt = Convert.ToDecimal(Update_monthly_rent_amt_txt.Text);
        case_client.Other_help_Sources = Update_Other_help_Sources_txt.Text;
        case_client.Other_help_Sources_memo = Update_Other_help_Sources_memo_txt.Text;
        case_client.prev_address_id = Convert.ToInt32(Update_prev_address_id_txt.Text);
        case_client.prev_residence_date = Convert.ToDateTime(Update_prev_residence_date_txt.Text);
        case_client.relationship_to_head_of_household = Update_relationship_to_head_of_household_txt.Text;
        case_client.rental_name = Update_rental_name_txt.Text;
        case_client.rental_phone = Update_rental_phone_txt.Text;
        case_client.sewage_amt_owed_today = Convert.ToDecimal(Update_sewage_amt_owed_today_txt.Text);
        case_client.telephone_amt_owed_today = Convert.ToDecimal(Update_telephone_amt_owed_today_txt.Text);
        case_client.trash_removal_amt_owed_today = Convert.ToDecimal(Update_trash_removal_amt_owed_today_txt.Text);
        case_client.us_status_memo = Update_us_status_memo_txt.Text;
        case_client.related_ll = Update_related_ll_txt.Text;
        case_client.relation_to_ll = Update_relation_to_ll_txt.Text;
        case_client.mtg_amt_owed_today = Convert.ToDecimal(Update_mtg_amt_owed_today_txt.Text);
        case_client.utilities_list = Update_utilities_list_txt.Text;
        case_client.water_amt_owed_today = Convert.ToDecimal(Update_water_amt_owed_today_txt.Text);
        case_client.public_asst_app_date = Convert.ToDateTime(Update_public_asst_app_date_txt.Text);
        case_client.util_allot_app_date = Convert.ToDateTime(Update_util_allot_app_date_txt.Text);
        case_client.util_allot_amt = Convert.ToDecimal(Update_util_allot_amt_txt.Text);
        case_client.utilities_incl = Update_utilities_incl_txt.Text;
        case_client.fd_stmps_app_date = Convert.ToDateTime(Update_fd_stmps_app_date_txt.Text);
        case_client.fd_stmps_amt = Convert.ToDecimal(Update_fd_stmps_amt_txt.Text);
        case_client.fd_Inc = Update_fd_Inc_txt.Text;
        case_client.afdc_app_date = Convert.ToDateTime(Update_afdc_app_date_txt.Text);
        case_client.afdc_amt = Convert.ToDecimal(Update_afdc_amt_txt.Text);
        case_client.afdc_Inc = Update_afdc_Inc_txt.Text;
        case_client.oth_trustee_app_date = Convert.ToDateTime(Update_oth_trustee_app_date_txt.Text);
        case_client.oth_trustee_amt = Convert.ToDecimal(Update_oth_trustee_amt_txt.Text);
        case_client.oth_trustee_Inc = Update_oth_trustee_Inc_txt.Text;
        case_client.ss_app_date = Convert.ToDateTime(Update_ss_app_date_txt.Text);
        case_client.ss_amt = Convert.ToDecimal(Update_ss_amt_txt.Text);
        case_client.ss_Inc = Update_ss_Inc_txt.Text;
        case_client.va_app_date = Convert.ToDateTime(Update_va_app_date_txt.Text);
        case_client.va_amt = Convert.ToDecimal(Update_va_amt_txt.Text);
        case_client.va_Inc = Update_va_Inc_txt.Text;
        case_client.eap_app_date = Convert.ToDateTime(Update_eap_app_date_txt.Text);
        case_client.eap_amt = Convert.ToDecimal(Update_eap_amt_txt.Text);
        case_client.eap_Inc = Update_eap_Inc_txt.Text;
        case_client.fema_app_date = Convert.ToDateTime(Update_fema_app_date_txt.Text);
        case_client.fema_amt = Convert.ToDecimal(Update_fema_amt_txt.Text);
        case_client.fema_Inc = Update_fema_Inc_txt.Text;
        case_client.unempl_app_date = Convert.ToDateTime(Update_unempl_app_date_txt.Text);
        case_client.unempl_amt = Convert.ToDecimal(Update_unempl_amt_txt.Text);
        case_client.unempl_Inc = Update_unempl_Inc_txt.Text;
        case_client.grants_loans_app_date = Convert.ToDateTime(Update_grants_loans_app_date_txt.Text);
        case_client.grants_loans_amt = Convert.ToDecimal(Update_grants_loans_amt_txt.Text);
        case_client.grants_Inc = Update_grants_Inc_txt.Text;
        case_client.other_app_date = Convert.ToDateTime(Update_other_app_date_txt.Text);
        case_client.other_amt = Convert.ToDecimal(Update_other_amt_txt.Text);
        case_client.other_Inc = Update_other_Inc_txt.Text;
        case_client.denial_memo = Update_denial_memo_txt.Text;
        case_client.welfr_fraud_memo = Update_welfr_fraud_memo_txt.Text;
        case_client.Client_issue_Desc = Update_Client_issue_Desc_txt.Text;
        case_client.Client_issue_resolved = Update_Client_issue_resolved_txt.Text;
        case_client.Client_issue_comments = Update_Client_issue_comments_txt.Text;
        case_client.Update(case_client);
        Insert_case_client_GridView.DataBind();
        Update_case_client_GridView.DataBind();
        Delete_case_client_GridView.DataBind();
        return case_client;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Delete_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        case_client = Delete_case_client_select(Convert.ToInt32(Delete_case_client_GridView.SelectedValue));
    }
    public case_client Delete_case_client_select(int ID)
    {
        case_client = case_client.Select(ID);
        Delete_case_id_txt_lbl.Text = Convert.ToString(case_client.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(case_client.client_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(case_client.address_id);
        Delete_cable_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.cable_amt_owed_today);
        Delete_colessee_name_txt_lbl.Text = Convert.ToString(case_client.colessee_name);
        Delete_child_support_txt_lbl.Text = Convert.ToString(case_client.child_support);
        Delete_child_support_memo_txt_lbl.Text = Convert.ToString(case_client.child_support_memo);
        Delete_curr_residence_date_txt_lbl.Text = Convert.ToString(case_client.curr_residence_date);
        Delete_electric_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.electric_amt_owed_today);
        Delete_employment_memo_txt_lbl.Text = Convert.ToString(case_client.employment_memo);
        Delete_employment_status_txt_lbl.Text = Convert.ToString(case_client.employment_status);
        Delete_gas_or_heating_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.gas_or_heating_amt_owed_today);
        Delete_housing_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.housing_amt_owed_today);
        Delete_housing_status_txt_lbl.Text = Convert.ToString(case_client.housing_status);
        Delete_income_status_txt_lbl.Text = Convert.ToString(case_client.income_status);
        Delete_lease_num_adults_txt_lbl.Text = Convert.ToString(case_client.lease_num_adults);
        Delete_lease_start_date_txt_lbl.Text = Convert.ToString(case_client.lease_start_date);
        Delete_minor_children_txt_lbl.Text = Convert.ToString(case_client.minor_children);
        Delete_monthly_rent_amt_txt_lbl.Text = Convert.ToString(case_client.monthly_rent_amt);
        Delete_Other_help_Sources_txt_lbl.Text = Convert.ToString(case_client.Other_help_Sources);
        Delete_Other_help_Sources_memo_txt_lbl.Text = Convert.ToString(case_client.Other_help_Sources_memo);
        Delete_prev_address_id_txt_lbl.Text = Convert.ToString(case_client.prev_address_id);
        Delete_prev_residence_date_txt_lbl.Text = Convert.ToString(case_client.prev_residence_date);
        Delete_relationship_to_head_of_household_txt_lbl.Text = Convert.ToString(case_client.relationship_to_head_of_household);
        Delete_rental_name_txt_lbl.Text = Convert.ToString(case_client.rental_name);
        Delete_rental_phone_txt_lbl.Text = Convert.ToString(case_client.rental_phone);
        Delete_sewage_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.sewage_amt_owed_today);
        Delete_telephone_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.telephone_amt_owed_today);
        Delete_trash_removal_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.trash_removal_amt_owed_today);
        Delete_us_status_memo_txt_lbl.Text = Convert.ToString(case_client.us_status_memo);
        Delete_related_ll_txt_lbl.Text = Convert.ToString(case_client.related_ll);
        Delete_relation_to_ll_txt_lbl.Text = Convert.ToString(case_client.relation_to_ll);
        Delete_mtg_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.mtg_amt_owed_today);
        Delete_utilities_list_txt_lbl.Text = Convert.ToString(case_client.utilities_list);
        Delete_water_amt_owed_today_txt_lbl.Text = Convert.ToString(case_client.water_amt_owed_today);
        Delete_public_asst_app_date_txt_lbl.Text = Convert.ToString(case_client.public_asst_app_date);
        Delete_util_allot_app_date_txt_lbl.Text = Convert.ToString(case_client.util_allot_app_date);
        Delete_util_allot_amt_txt_lbl.Text = Convert.ToString(case_client.util_allot_amt);
        Delete_utilities_incl_txt_lbl.Text = Convert.ToString(case_client.utilities_incl);
        Delete_fd_stmps_app_date_txt_lbl.Text = Convert.ToString(case_client.fd_stmps_app_date);
        Delete_fd_stmps_amt_txt_lbl.Text = Convert.ToString(case_client.fd_stmps_amt);
        Delete_fd_Inc_txt_lbl.Text = Convert.ToString(case_client.fd_Inc);
        Delete_afdc_app_date_txt_lbl.Text = Convert.ToString(case_client.afdc_app_date);
        Delete_afdc_amt_txt_lbl.Text = Convert.ToString(case_client.afdc_amt);
        Delete_afdc_Inc_txt_lbl.Text = Convert.ToString(case_client.afdc_Inc);
        Delete_oth_trustee_app_date_txt_lbl.Text = Convert.ToString(case_client.oth_trustee_app_date);
        Delete_oth_trustee_amt_txt_lbl.Text = Convert.ToString(case_client.oth_trustee_amt);
        Delete_oth_trustee_Inc_txt_lbl.Text = Convert.ToString(case_client.oth_trustee_Inc);
        Delete_ss_app_date_txt_lbl.Text = Convert.ToString(case_client.ss_app_date);
        Delete_ss_amt_txt_lbl.Text = Convert.ToString(case_client.ss_amt);
        Delete_ss_Inc_txt_lbl.Text = Convert.ToString(case_client.ss_Inc);
        Delete_va_app_date_txt_lbl.Text = Convert.ToString(case_client.va_app_date);
        Delete_va_amt_txt_lbl.Text = Convert.ToString(case_client.va_amt);
        Delete_va_Inc_txt_lbl.Text = Convert.ToString(case_client.va_Inc);
        Delete_eap_app_date_txt_lbl.Text = Convert.ToString(case_client.eap_app_date);
        Delete_eap_amt_txt_lbl.Text = Convert.ToString(case_client.eap_amt);
        Delete_eap_Inc_txt_lbl.Text = Convert.ToString(case_client.eap_Inc);
        Delete_fema_app_date_txt_lbl.Text = Convert.ToString(case_client.fema_app_date);
        Delete_fema_amt_txt_lbl.Text = Convert.ToString(case_client.fema_amt);
        Delete_fema_Inc_txt_lbl.Text = Convert.ToString(case_client.fema_Inc);
        Delete_unempl_app_date_txt_lbl.Text = Convert.ToString(case_client.unempl_app_date);
        Delete_unempl_amt_txt_lbl.Text = Convert.ToString(case_client.unempl_amt);
        Delete_unempl_Inc_txt_lbl.Text = Convert.ToString(case_client.unempl_Inc);
        Delete_grants_loans_app_date_txt_lbl.Text = Convert.ToString(case_client.grants_loans_app_date);
        Delete_grants_loans_amt_txt_lbl.Text = Convert.ToString(case_client.grants_loans_amt);
        Delete_grants_Inc_txt_lbl.Text = Convert.ToString(case_client.grants_Inc);
        Delete_other_app_date_txt_lbl.Text = Convert.ToString(case_client.other_app_date);
        Delete_other_amt_txt_lbl.Text = Convert.ToString(case_client.other_amt);
        Delete_other_Inc_txt_lbl.Text = Convert.ToString(case_client.other_Inc);
        Delete_denial_memo_txt_lbl.Text = Convert.ToString(case_client.denial_memo);
        Delete_welfr_fraud_memo_txt_lbl.Text = Convert.ToString(case_client.welfr_fraud_memo);
        Delete_Client_issue_Desc_txt_lbl.Text = Convert.ToString(case_client.Client_issue_Desc);
        Delete_Client_issue_resolved_txt_lbl.Text = Convert.ToString(case_client.Client_issue_resolved);
        Delete_Client_issue_comments_txt_lbl.Text = Convert.ToString(case_client.Client_issue_comments);
        return case_client;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        case_client_delete(Convert.ToInt32(Delete_case_client_GridView.SelectedValue));
    }
    public void case_client_delete(int ID)
    {
        case_client.Delete(ID);
        Insert_case_client_GridView.DataBind();
        Update_case_client_GridView.DataBind();
        Delete_case_client_GridView.DataBind();
    }





    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Universial Methods
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // EXAMPLE:
            // client_status = e.Row.Cells[5].Text;
            // Gender = e.Row.Cells[4].Text;

            //if (e.Row.Cells[5].Text == "M")
            //{
            //    e.Row.Cells[5].Text = "Missing";
            //}
            //else if (e.Row.Cells[5].Text == "D")
            //{
            //    e.Row.Cells[5].Text = "Deceased";
            //}
            //if (e.Row.Cells[4].Text == "M")
            //{
            //    e.Row.Cells[4].Text = "Male";
            //}
            //else if (e.Row.Cells[4].Text == "F")
            //{
            //    e.Row.Cells[4].Text = "Female";
            //}
        }
    }




  }
}

