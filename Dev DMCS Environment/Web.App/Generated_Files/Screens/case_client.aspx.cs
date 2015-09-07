using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class case_clientClass : System.Web.UI.Page
    {
        public case_client case_client = new case_client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            case_client = case_client_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            case_client = case_client_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            case_client = case_client_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public case_client case_client_selectForInsert(int ID)
        {
            case_client = case_client.Select(ID);
            client_id_Insert_TextBox.Text = Convert.ToString(case_client.client_id);
            address_id_Insert_TextBox.Text = Convert.ToString(case_client.address_id);
            cable_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.cable_amt_owed_today);
            colessee_name_Insert_TextBox.Text = Convert.ToString(case_client.colessee_name);
            child_support_Insert_TextBox.Text = Convert.ToString(case_client.child_support);
            child_support_memo_Insert_TextBox.Text = Convert.ToString(case_client.child_support_memo);
            curr_residence_date_Insert_TextBox.Text = Convert.ToString(case_client.curr_residence_date);
            electric_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.electric_amt_owed_today);
            employment_memo_Insert_TextBox.Text = Convert.ToString(case_client.employment_memo);
            employment_status_Insert_TextBox.Text = Convert.ToString(case_client.employment_status);
            gas_or_heating_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.gas_or_heating_amt_owed_today);
            housing_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.housing_amt_owed_today);
            housing_status_Insert_TextBox.Text = Convert.ToString(case_client.housing_status);
            income_status_Insert_TextBox.Text = Convert.ToString(case_client.income_status);
            lease_num_adults_Insert_TextBox.Text = Convert.ToString(case_client.lease_num_adults);
            lease_start_date_Insert_TextBox.Text = Convert.ToString(case_client.lease_start_date);
            minor_children_Insert_TextBox.Text = Convert.ToString(case_client.minor_children);
            monthly_rent_amt_Insert_TextBox.Text = Convert.ToString(case_client.monthly_rent_amt);
            Other_help_Sources_Insert_TextBox.Text = Convert.ToString(case_client.Other_help_Sources);
            Other_help_Sources_memo_Insert_TextBox.Text = Convert.ToString(case_client.Other_help_Sources_memo);
            prev_address_id_Insert_TextBox.Text = Convert.ToString(case_client.prev_address_id);
            prev_residence_date_Insert_TextBox.Text = Convert.ToString(case_client.prev_residence_date);
            relationship_to_head_of_household_Insert_TextBox.Text = Convert.ToString(case_client.relationship_to_head_of_household);
            rental_name_Insert_TextBox.Text = Convert.ToString(case_client.rental_name);
            rental_phone_Insert_TextBox.Text = Convert.ToString(case_client.rental_phone);
            sewage_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.sewage_amt_owed_today);
            telephone_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.telephone_amt_owed_today);
            trash_removal_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.trash_removal_amt_owed_today);
            us_status_memo_Insert_TextBox.Text = Convert.ToString(case_client.us_status_memo);
            related_ll_Insert_TextBox.Text = Convert.ToString(case_client.related_ll);
            relation_to_ll_Insert_TextBox.Text = Convert.ToString(case_client.relation_to_ll);
            mtg_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.mtg_amt_owed_today);
            utilities_list_Insert_TextBox.Text = Convert.ToString(case_client.utilities_list);
            water_amt_owed_today_Insert_TextBox.Text = Convert.ToString(case_client.water_amt_owed_today);
            public_asst_app_date_Insert_TextBox.Text = Convert.ToString(case_client.public_asst_app_date);
            util_allot_app_date_Insert_TextBox.Text = Convert.ToString(case_client.util_allot_app_date);
            util_allot_amt_Insert_TextBox.Text = Convert.ToString(case_client.util_allot_amt);
            utilities_incl_Insert_TextBox.Text = Convert.ToString(case_client.utilities_incl);
            fd_stmps_app_date_Insert_TextBox.Text = Convert.ToString(case_client.fd_stmps_app_date);
            fd_stmps_amt_Insert_TextBox.Text = Convert.ToString(case_client.fd_stmps_amt);
            fd_Inc_Insert_TextBox.Text = Convert.ToString(case_client.fd_Inc);
            afdc_app_date_Insert_TextBox.Text = Convert.ToString(case_client.afdc_app_date);
            afdc_amt_Insert_TextBox.Text = Convert.ToString(case_client.afdc_amt);
            afdc_Inc_Insert_TextBox.Text = Convert.ToString(case_client.afdc_Inc);
            oth_trustee_app_date_Insert_TextBox.Text = Convert.ToString(case_client.oth_trustee_app_date);
            oth_trustee_amt_Insert_TextBox.Text = Convert.ToString(case_client.oth_trustee_amt);
            oth_trustee_Inc_Insert_TextBox.Text = Convert.ToString(case_client.oth_trustee_Inc);
            ss_app_date_Insert_TextBox.Text = Convert.ToString(case_client.ss_app_date);
            ss_amt_Insert_TextBox.Text = Convert.ToString(case_client.ss_amt);
            ss_Inc_Insert_TextBox.Text = Convert.ToString(case_client.ss_Inc);
            va_app_date_Insert_TextBox.Text = Convert.ToString(case_client.va_app_date);
            va_amt_Insert_TextBox.Text = Convert.ToString(case_client.va_amt);
            va_Inc_Insert_TextBox.Text = Convert.ToString(case_client.va_Inc);
            eap_app_date_Insert_TextBox.Text = Convert.ToString(case_client.eap_app_date);
            eap_amt_Insert_TextBox.Text = Convert.ToString(case_client.eap_amt);
            eap_Inc_Insert_TextBox.Text = Convert.ToString(case_client.eap_Inc);
            fema_app_date_Insert_TextBox.Text = Convert.ToString(case_client.fema_app_date);
            fema_amt_Insert_TextBox.Text = Convert.ToString(case_client.fema_amt);
            fema_Inc_Insert_TextBox.Text = Convert.ToString(case_client.fema_Inc);
            unempl_app_date_Insert_TextBox.Text = Convert.ToString(case_client.unempl_app_date);
            unempl_amt_Insert_TextBox.Text = Convert.ToString(case_client.unempl_amt);
            unempl_Inc_Insert_TextBox.Text = Convert.ToString(case_client.unempl_Inc);
            grants_loans_app_date_Insert_TextBox.Text = Convert.ToString(case_client.grants_loans_app_date);
            grants_loans_amt_Insert_TextBox.Text = Convert.ToString(case_client.grants_loans_amt);
            grants_Inc_Insert_TextBox.Text = Convert.ToString(case_client.grants_Inc);
            other_app_date_Insert_TextBox.Text = Convert.ToString(case_client.other_app_date);
            other_amt_Insert_TextBox.Text = Convert.ToString(case_client.other_amt);
            other_Inc_Insert_TextBox.Text = Convert.ToString(case_client.other_Inc);
            denial_memo_Insert_TextBox.Text = Convert.ToString(case_client.denial_memo);
            welfr_fraud_memo_Insert_TextBox.Text = Convert.ToString(case_client.welfr_fraud_memo);
            Client_issue_Desc_Insert_TextBox.Text = Convert.ToString(case_client.Client_issue_Desc);
            Client_issue_resolved_Insert_TextBox.Text = Convert.ToString(case_client.Client_issue_resolved);
            Client_issue_comments_Insert_TextBox.Text = Convert.ToString(case_client.Client_issue_comments);
            return case_client;
        }
        public case_client case_client_selectForUpdate(int ID)
        {
            case_client = case_client.Select(ID);
            case_id_Update_TextBox.Text = Convert.ToString(case_client.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(case_client.client_id);
            address_id_Update_TextBox.Text = Convert.ToString(case_client.address_id);
            cable_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.cable_amt_owed_today);
            colessee_name_Update_TextBox.Text = Convert.ToString(case_client.colessee_name);
            child_support_Update_TextBox.Text = Convert.ToString(case_client.child_support);
            child_support_memo_Update_TextBox.Text = Convert.ToString(case_client.child_support_memo);
            curr_residence_date_Update_TextBox.Text = Convert.ToString(case_client.curr_residence_date);
            electric_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.electric_amt_owed_today);
            employment_memo_Update_TextBox.Text = Convert.ToString(case_client.employment_memo);
            employment_status_Update_TextBox.Text = Convert.ToString(case_client.employment_status);
            gas_or_heating_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.gas_or_heating_amt_owed_today);
            housing_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.housing_amt_owed_today);
            housing_status_Update_TextBox.Text = Convert.ToString(case_client.housing_status);
            income_status_Update_TextBox.Text = Convert.ToString(case_client.income_status);
            lease_num_adults_Update_TextBox.Text = Convert.ToString(case_client.lease_num_adults);
            lease_start_date_Update_TextBox.Text = Convert.ToString(case_client.lease_start_date);
            minor_children_Update_TextBox.Text = Convert.ToString(case_client.minor_children);
            monthly_rent_amt_Update_TextBox.Text = Convert.ToString(case_client.monthly_rent_amt);
            Other_help_Sources_Update_TextBox.Text = Convert.ToString(case_client.Other_help_Sources);
            Other_help_Sources_memo_Update_TextBox.Text = Convert.ToString(case_client.Other_help_Sources_memo);
            prev_address_id_Update_TextBox.Text = Convert.ToString(case_client.prev_address_id);
            prev_residence_date_Update_TextBox.Text = Convert.ToString(case_client.prev_residence_date);
            relationship_to_head_of_household_Update_TextBox.Text = Convert.ToString(case_client.relationship_to_head_of_household);
            rental_name_Update_TextBox.Text = Convert.ToString(case_client.rental_name);
            rental_phone_Update_TextBox.Text = Convert.ToString(case_client.rental_phone);
            sewage_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.sewage_amt_owed_today);
            telephone_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.telephone_amt_owed_today);
            trash_removal_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.trash_removal_amt_owed_today);
            us_status_memo_Update_TextBox.Text = Convert.ToString(case_client.us_status_memo);
            related_ll_Update_TextBox.Text = Convert.ToString(case_client.related_ll);
            relation_to_ll_Update_TextBox.Text = Convert.ToString(case_client.relation_to_ll);
            mtg_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.mtg_amt_owed_today);
            utilities_list_Update_TextBox.Text = Convert.ToString(case_client.utilities_list);
            water_amt_owed_today_Update_TextBox.Text = Convert.ToString(case_client.water_amt_owed_today);
            public_asst_app_date_Update_TextBox.Text = Convert.ToString(case_client.public_asst_app_date);
            util_allot_app_date_Update_TextBox.Text = Convert.ToString(case_client.util_allot_app_date);
            util_allot_amt_Update_TextBox.Text = Convert.ToString(case_client.util_allot_amt);
            utilities_incl_Update_TextBox.Text = Convert.ToString(case_client.utilities_incl);
            fd_stmps_app_date_Update_TextBox.Text = Convert.ToString(case_client.fd_stmps_app_date);
            fd_stmps_amt_Update_TextBox.Text = Convert.ToString(case_client.fd_stmps_amt);
            fd_Inc_Update_TextBox.Text = Convert.ToString(case_client.fd_Inc);
            afdc_app_date_Update_TextBox.Text = Convert.ToString(case_client.afdc_app_date);
            afdc_amt_Update_TextBox.Text = Convert.ToString(case_client.afdc_amt);
            afdc_Inc_Update_TextBox.Text = Convert.ToString(case_client.afdc_Inc);
            oth_trustee_app_date_Update_TextBox.Text = Convert.ToString(case_client.oth_trustee_app_date);
            oth_trustee_amt_Update_TextBox.Text = Convert.ToString(case_client.oth_trustee_amt);
            oth_trustee_Inc_Update_TextBox.Text = Convert.ToString(case_client.oth_trustee_Inc);
            ss_app_date_Update_TextBox.Text = Convert.ToString(case_client.ss_app_date);
            ss_amt_Update_TextBox.Text = Convert.ToString(case_client.ss_amt);
            ss_Inc_Update_TextBox.Text = Convert.ToString(case_client.ss_Inc);
            va_app_date_Update_TextBox.Text = Convert.ToString(case_client.va_app_date);
            va_amt_Update_TextBox.Text = Convert.ToString(case_client.va_amt);
            va_Inc_Update_TextBox.Text = Convert.ToString(case_client.va_Inc);
            eap_app_date_Update_TextBox.Text = Convert.ToString(case_client.eap_app_date);
            eap_amt_Update_TextBox.Text = Convert.ToString(case_client.eap_amt);
            eap_Inc_Update_TextBox.Text = Convert.ToString(case_client.eap_Inc);
            fema_app_date_Update_TextBox.Text = Convert.ToString(case_client.fema_app_date);
            fema_amt_Update_TextBox.Text = Convert.ToString(case_client.fema_amt);
            fema_Inc_Update_TextBox.Text = Convert.ToString(case_client.fema_Inc);
            unempl_app_date_Update_TextBox.Text = Convert.ToString(case_client.unempl_app_date);
            unempl_amt_Update_TextBox.Text = Convert.ToString(case_client.unempl_amt);
            unempl_Inc_Update_TextBox.Text = Convert.ToString(case_client.unempl_Inc);
            grants_loans_app_date_Update_TextBox.Text = Convert.ToString(case_client.grants_loans_app_date);
            grants_loans_amt_Update_TextBox.Text = Convert.ToString(case_client.grants_loans_amt);
            grants_Inc_Update_TextBox.Text = Convert.ToString(case_client.grants_Inc);
            other_app_date_Update_TextBox.Text = Convert.ToString(case_client.other_app_date);
            other_amt_Update_TextBox.Text = Convert.ToString(case_client.other_amt);
            other_Inc_Update_TextBox.Text = Convert.ToString(case_client.other_Inc);
            denial_memo_Update_TextBox.Text = Convert.ToString(case_client.denial_memo);
            welfr_fraud_memo_Update_TextBox.Text = Convert.ToString(case_client.welfr_fraud_memo);
            Client_issue_Desc_Update_TextBox.Text = Convert.ToString(case_client.Client_issue_Desc);
            Client_issue_resolved_Update_TextBox.Text = Convert.ToString(case_client.Client_issue_resolved);
            Client_issue_comments_Update_TextBox.Text = Convert.ToString(case_client.Client_issue_comments);
            return case_client;
        }
        public case_client case_client_selectForDelete(int ID)
        {
            case_client = case_client.Select(ID);
            case_id_Delete_TextBox.Text = Convert.ToString(case_client.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(case_client.client_id);
            address_id_Delete_TextBox.Text = Convert.ToString(case_client.address_id);
            cable_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.cable_amt_owed_today);
            colessee_name_Delete_TextBox.Text = Convert.ToString(case_client.colessee_name);
            child_support_Delete_TextBox.Text = Convert.ToString(case_client.child_support);
            child_support_memo_Delete_TextBox.Text = Convert.ToString(case_client.child_support_memo);
            curr_residence_date_Delete_TextBox.Text = Convert.ToString(case_client.curr_residence_date);
            electric_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.electric_amt_owed_today);
            employment_memo_Delete_TextBox.Text = Convert.ToString(case_client.employment_memo);
            employment_status_Delete_TextBox.Text = Convert.ToString(case_client.employment_status);
            gas_or_heating_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.gas_or_heating_amt_owed_today);
            housing_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.housing_amt_owed_today);
            housing_status_Delete_TextBox.Text = Convert.ToString(case_client.housing_status);
            income_status_Delete_TextBox.Text = Convert.ToString(case_client.income_status);
            lease_num_adults_Delete_TextBox.Text = Convert.ToString(case_client.lease_num_adults);
            lease_start_date_Delete_TextBox.Text = Convert.ToString(case_client.lease_start_date);
            minor_children_Delete_TextBox.Text = Convert.ToString(case_client.minor_children);
            monthly_rent_amt_Delete_TextBox.Text = Convert.ToString(case_client.monthly_rent_amt);
            Other_help_Sources_Delete_TextBox.Text = Convert.ToString(case_client.Other_help_Sources);
            Other_help_Sources_memo_Delete_TextBox.Text = Convert.ToString(case_client.Other_help_Sources_memo);
            prev_address_id_Delete_TextBox.Text = Convert.ToString(case_client.prev_address_id);
            prev_residence_date_Delete_TextBox.Text = Convert.ToString(case_client.prev_residence_date);
            relationship_to_head_of_household_Delete_TextBox.Text = Convert.ToString(case_client.relationship_to_head_of_household);
            rental_name_Delete_TextBox.Text = Convert.ToString(case_client.rental_name);
            rental_phone_Delete_TextBox.Text = Convert.ToString(case_client.rental_phone);
            sewage_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.sewage_amt_owed_today);
            telephone_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.telephone_amt_owed_today);
            trash_removal_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.trash_removal_amt_owed_today);
            us_status_memo_Delete_TextBox.Text = Convert.ToString(case_client.us_status_memo);
            related_ll_Delete_TextBox.Text = Convert.ToString(case_client.related_ll);
            relation_to_ll_Delete_TextBox.Text = Convert.ToString(case_client.relation_to_ll);
            mtg_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.mtg_amt_owed_today);
            utilities_list_Delete_TextBox.Text = Convert.ToString(case_client.utilities_list);
            water_amt_owed_today_Delete_TextBox.Text = Convert.ToString(case_client.water_amt_owed_today);
            public_asst_app_date_Delete_TextBox.Text = Convert.ToString(case_client.public_asst_app_date);
            util_allot_app_date_Delete_TextBox.Text = Convert.ToString(case_client.util_allot_app_date);
            util_allot_amt_Delete_TextBox.Text = Convert.ToString(case_client.util_allot_amt);
            utilities_incl_Delete_TextBox.Text = Convert.ToString(case_client.utilities_incl);
            fd_stmps_app_date_Delete_TextBox.Text = Convert.ToString(case_client.fd_stmps_app_date);
            fd_stmps_amt_Delete_TextBox.Text = Convert.ToString(case_client.fd_stmps_amt);
            fd_Inc_Delete_TextBox.Text = Convert.ToString(case_client.fd_Inc);
            afdc_app_date_Delete_TextBox.Text = Convert.ToString(case_client.afdc_app_date);
            afdc_amt_Delete_TextBox.Text = Convert.ToString(case_client.afdc_amt);
            afdc_Inc_Delete_TextBox.Text = Convert.ToString(case_client.afdc_Inc);
            oth_trustee_app_date_Delete_TextBox.Text = Convert.ToString(case_client.oth_trustee_app_date);
            oth_trustee_amt_Delete_TextBox.Text = Convert.ToString(case_client.oth_trustee_amt);
            oth_trustee_Inc_Delete_TextBox.Text = Convert.ToString(case_client.oth_trustee_Inc);
            ss_app_date_Delete_TextBox.Text = Convert.ToString(case_client.ss_app_date);
            ss_amt_Delete_TextBox.Text = Convert.ToString(case_client.ss_amt);
            ss_Inc_Delete_TextBox.Text = Convert.ToString(case_client.ss_Inc);
            va_app_date_Delete_TextBox.Text = Convert.ToString(case_client.va_app_date);
            va_amt_Delete_TextBox.Text = Convert.ToString(case_client.va_amt);
            va_Inc_Delete_TextBox.Text = Convert.ToString(case_client.va_Inc);
            eap_app_date_Delete_TextBox.Text = Convert.ToString(case_client.eap_app_date);
            eap_amt_Delete_TextBox.Text = Convert.ToString(case_client.eap_amt);
            eap_Inc_Delete_TextBox.Text = Convert.ToString(case_client.eap_Inc);
            fema_app_date_Delete_TextBox.Text = Convert.ToString(case_client.fema_app_date);
            fema_amt_Delete_TextBox.Text = Convert.ToString(case_client.fema_amt);
            fema_Inc_Delete_TextBox.Text = Convert.ToString(case_client.fema_Inc);
            unempl_app_date_Delete_TextBox.Text = Convert.ToString(case_client.unempl_app_date);
            unempl_amt_Delete_TextBox.Text = Convert.ToString(case_client.unempl_amt);
            unempl_Inc_Delete_TextBox.Text = Convert.ToString(case_client.unempl_Inc);
            grants_loans_app_date_Delete_TextBox.Text = Convert.ToString(case_client.grants_loans_app_date);
            grants_loans_amt_Delete_TextBox.Text = Convert.ToString(case_client.grants_loans_amt);
            grants_Inc_Delete_TextBox.Text = Convert.ToString(case_client.grants_Inc);
            other_app_date_Delete_TextBox.Text = Convert.ToString(case_client.other_app_date);
            other_amt_Delete_TextBox.Text = Convert.ToString(case_client.other_amt);
            other_Inc_Delete_TextBox.Text = Convert.ToString(case_client.other_Inc);
            denial_memo_Delete_TextBox.Text = Convert.ToString(case_client.denial_memo);
            welfr_fraud_memo_Delete_TextBox.Text = Convert.ToString(case_client.welfr_fraud_memo);
            Client_issue_Desc_Delete_TextBox.Text = Convert.ToString(case_client.Client_issue_Desc);
            Client_issue_resolved_Delete_TextBox.Text = Convert.ToString(case_client.Client_issue_resolved);
            Client_issue_comments_Delete_TextBox.Text = Convert.ToString(case_client.Client_issue_comments);
            return case_client;
        }
        //Database CRUD Call Functions
        public case_client case_client_insert()
        {
            case_client.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            case_client.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            case_client.cable_amt_owed_today = Convert.ToDecimal(cable_amt_owed_today_Insert_TextBox.Text);
            case_client.colessee_name = colessee_name_Insert_TextBox.Text;
            case_client.child_support = child_support_Insert_TextBox.Text;
            case_client.child_support_memo = child_support_memo_Insert_TextBox.Text;
            case_client.curr_residence_date = Convert.ToDateTime(curr_residence_date_Insert_TextBox.Text);
            case_client.electric_amt_owed_today = Convert.ToDecimal(electric_amt_owed_today_Insert_TextBox.Text);
            case_client.employment_memo = employment_memo_Insert_TextBox.Text;
            case_client.employment_status = employment_status_Insert_TextBox.Text;
            case_client.gas_or_heating_amt_owed_today = Convert.ToDecimal(gas_or_heating_amt_owed_today_Insert_TextBox.Text);
            case_client.housing_amt_owed_today = Convert.ToDecimal(housing_amt_owed_today_Insert_TextBox.Text);
            case_client.housing_status = housing_status_Insert_TextBox.Text;
            case_client.income_status = income_status_Insert_TextBox.Text;
            case_client.lease_num_adults = Convert.ToInt32(lease_num_adults_Insert_TextBox.Text);
            case_client.lease_start_date = Convert.ToDateTime(lease_start_date_Insert_TextBox.Text);
            case_client.minor_children = Convert.ToInt32(minor_children_Insert_TextBox.Text);
            case_client.monthly_rent_amt = Convert.ToDecimal(monthly_rent_amt_Insert_TextBox.Text);
            case_client.Other_help_Sources = Other_help_Sources_Insert_TextBox.Text;
            case_client.Other_help_Sources_memo = Other_help_Sources_memo_Insert_TextBox.Text;
            case_client.prev_address_id = Convert.ToInt32(prev_address_id_Insert_TextBox.Text);
            case_client.prev_residence_date = Convert.ToDateTime(prev_residence_date_Insert_TextBox.Text);
            case_client.relationship_to_head_of_household = relationship_to_head_of_household_Insert_TextBox.Text;
            case_client.rental_name = rental_name_Insert_TextBox.Text;
            case_client.rental_phone = rental_phone_Insert_TextBox.Text;
            case_client.sewage_amt_owed_today = Convert.ToDecimal(sewage_amt_owed_today_Insert_TextBox.Text);
            case_client.telephone_amt_owed_today = Convert.ToDecimal(telephone_amt_owed_today_Insert_TextBox.Text);
            case_client.trash_removal_amt_owed_today = Convert.ToDecimal(trash_removal_amt_owed_today_Insert_TextBox.Text);
            case_client.us_status_memo = us_status_memo_Insert_TextBox.Text;
            case_client.related_ll = related_ll_Insert_TextBox.Text;
            case_client.relation_to_ll = relation_to_ll_Insert_TextBox.Text;
            case_client.mtg_amt_owed_today = Convert.ToDecimal(mtg_amt_owed_today_Insert_TextBox.Text);
            case_client.utilities_list = utilities_list_Insert_TextBox.Text;
            case_client.water_amt_owed_today = Convert.ToDecimal(water_amt_owed_today_Insert_TextBox.Text);
            case_client.public_asst_app_date = Convert.ToDateTime(public_asst_app_date_Insert_TextBox.Text);
            case_client.util_allot_app_date = Convert.ToDateTime(util_allot_app_date_Insert_TextBox.Text);
            case_client.util_allot_amt = Convert.ToDecimal(util_allot_amt_Insert_TextBox.Text);
            case_client.utilities_incl = utilities_incl_Insert_TextBox.Text;
            case_client.fd_stmps_app_date = Convert.ToDateTime(fd_stmps_app_date_Insert_TextBox.Text);
            case_client.fd_stmps_amt = Convert.ToDecimal(fd_stmps_amt_Insert_TextBox.Text);
            case_client.fd_Inc = fd_Inc_Insert_TextBox.Text;
            case_client.afdc_app_date = Convert.ToDateTime(afdc_app_date_Insert_TextBox.Text);
            case_client.afdc_amt = Convert.ToDecimal(afdc_amt_Insert_TextBox.Text);
            case_client.afdc_Inc = afdc_Inc_Insert_TextBox.Text;
            case_client.oth_trustee_app_date = Convert.ToDateTime(oth_trustee_app_date_Insert_TextBox.Text);
            case_client.oth_trustee_amt = Convert.ToDecimal(oth_trustee_amt_Insert_TextBox.Text);
            case_client.oth_trustee_Inc = oth_trustee_Inc_Insert_TextBox.Text;
            case_client.ss_app_date = Convert.ToDateTime(ss_app_date_Insert_TextBox.Text);
            case_client.ss_amt = Convert.ToDecimal(ss_amt_Insert_TextBox.Text);
            case_client.ss_Inc = ss_Inc_Insert_TextBox.Text;
            case_client.va_app_date = Convert.ToDateTime(va_app_date_Insert_TextBox.Text);
            case_client.va_amt = Convert.ToDecimal(va_amt_Insert_TextBox.Text);
            case_client.va_Inc = va_Inc_Insert_TextBox.Text;
            case_client.eap_app_date = Convert.ToDateTime(eap_app_date_Insert_TextBox.Text);
            case_client.eap_amt = Convert.ToDecimal(eap_amt_Insert_TextBox.Text);
            case_client.eap_Inc = eap_Inc_Insert_TextBox.Text;
            case_client.fema_app_date = Convert.ToDateTime(fema_app_date_Insert_TextBox.Text);
            case_client.fema_amt = Convert.ToDecimal(fema_amt_Insert_TextBox.Text);
            case_client.fema_Inc = fema_Inc_Insert_TextBox.Text;
            case_client.unempl_app_date = Convert.ToDateTime(unempl_app_date_Insert_TextBox.Text);
            case_client.unempl_amt = Convert.ToDecimal(unempl_amt_Insert_TextBox.Text);
            case_client.unempl_Inc = unempl_Inc_Insert_TextBox.Text;
            case_client.grants_loans_app_date = Convert.ToDateTime(grants_loans_app_date_Insert_TextBox.Text);
            case_client.grants_loans_amt = Convert.ToDecimal(grants_loans_amt_Insert_TextBox.Text);
            case_client.grants_Inc = grants_Inc_Insert_TextBox.Text;
            case_client.other_app_date = Convert.ToDateTime(other_app_date_Insert_TextBox.Text);
            case_client.other_amt = Convert.ToDecimal(other_amt_Insert_TextBox.Text);
            case_client.other_Inc = other_Inc_Insert_TextBox.Text;
            case_client.denial_memo = denial_memo_Insert_TextBox.Text;
            case_client.welfr_fraud_memo = welfr_fraud_memo_Insert_TextBox.Text;
            case_client.Client_issue_Desc = Client_issue_Desc_Insert_TextBox.Text;
            case_client.Client_issue_resolved = Client_issue_resolved_Insert_TextBox.Text;
            case_client.Client_issue_comments = Client_issue_comments_Insert_TextBox.Text;
            case_client = case_client.Insert(case_client);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return case_client;
        }
        public case_client case_client_update(int ID)
        {
            case_client = case_client.Select(ID);
            case_client.case_id = Convert.ToInt32(Update_GridView.SelectedValue);
            case_client.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            case_client.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            case_client.cable_amt_owed_today = Convert.ToDecimal(cable_amt_owed_today_Update_TextBox.Text);
            case_client.colessee_name = colessee_name_Update_TextBox.Text;
            case_client.child_support = child_support_Update_TextBox.Text;
            case_client.child_support_memo = child_support_memo_Update_TextBox.Text;
            case_client.curr_residence_date = Convert.ToDateTime(curr_residence_date_Update_TextBox.Text);
            case_client.electric_amt_owed_today = Convert.ToDecimal(electric_amt_owed_today_Update_TextBox.Text);
            case_client.employment_memo = employment_memo_Update_TextBox.Text;
            case_client.employment_status = employment_status_Update_TextBox.Text;
            case_client.gas_or_heating_amt_owed_today = Convert.ToDecimal(gas_or_heating_amt_owed_today_Update_TextBox.Text);
            case_client.housing_amt_owed_today = Convert.ToDecimal(housing_amt_owed_today_Update_TextBox.Text);
            case_client.housing_status = housing_status_Update_TextBox.Text;
            case_client.income_status = income_status_Update_TextBox.Text;
            case_client.lease_num_adults = Convert.ToInt32(lease_num_adults_Update_TextBox.Text);
            case_client.lease_start_date = Convert.ToDateTime(lease_start_date_Update_TextBox.Text);
            case_client.minor_children = Convert.ToInt32(minor_children_Update_TextBox.Text);
            case_client.monthly_rent_amt = Convert.ToDecimal(monthly_rent_amt_Update_TextBox.Text);
            case_client.Other_help_Sources = Other_help_Sources_Update_TextBox.Text;
            case_client.Other_help_Sources_memo = Other_help_Sources_memo_Update_TextBox.Text;
            case_client.prev_address_id = Convert.ToInt32(prev_address_id_Update_TextBox.Text);
            case_client.prev_residence_date = Convert.ToDateTime(prev_residence_date_Update_TextBox.Text);
            case_client.relationship_to_head_of_household = relationship_to_head_of_household_Update_TextBox.Text;
            case_client.rental_name = rental_name_Update_TextBox.Text;
            case_client.rental_phone = rental_phone_Update_TextBox.Text;
            case_client.sewage_amt_owed_today = Convert.ToDecimal(sewage_amt_owed_today_Update_TextBox.Text);
            case_client.telephone_amt_owed_today = Convert.ToDecimal(telephone_amt_owed_today_Update_TextBox.Text);
            case_client.trash_removal_amt_owed_today = Convert.ToDecimal(trash_removal_amt_owed_today_Update_TextBox.Text);
            case_client.us_status_memo = us_status_memo_Update_TextBox.Text;
            case_client.related_ll = related_ll_Update_TextBox.Text;
            case_client.relation_to_ll = relation_to_ll_Update_TextBox.Text;
            case_client.mtg_amt_owed_today = Convert.ToDecimal(mtg_amt_owed_today_Update_TextBox.Text);
            case_client.utilities_list = utilities_list_Update_TextBox.Text;
            case_client.water_amt_owed_today = Convert.ToDecimal(water_amt_owed_today_Update_TextBox.Text);
            case_client.public_asst_app_date = Convert.ToDateTime(public_asst_app_date_Update_TextBox.Text);
            case_client.util_allot_app_date = Convert.ToDateTime(util_allot_app_date_Update_TextBox.Text);
            case_client.util_allot_amt = Convert.ToDecimal(util_allot_amt_Update_TextBox.Text);
            case_client.utilities_incl = utilities_incl_Update_TextBox.Text;
            case_client.fd_stmps_app_date = Convert.ToDateTime(fd_stmps_app_date_Update_TextBox.Text);
            case_client.fd_stmps_amt = Convert.ToDecimal(fd_stmps_amt_Update_TextBox.Text);
            case_client.fd_Inc = fd_Inc_Update_TextBox.Text;
            case_client.afdc_app_date = Convert.ToDateTime(afdc_app_date_Update_TextBox.Text);
            case_client.afdc_amt = Convert.ToDecimal(afdc_amt_Update_TextBox.Text);
            case_client.afdc_Inc = afdc_Inc_Update_TextBox.Text;
            case_client.oth_trustee_app_date = Convert.ToDateTime(oth_trustee_app_date_Update_TextBox.Text);
            case_client.oth_trustee_amt = Convert.ToDecimal(oth_trustee_amt_Update_TextBox.Text);
            case_client.oth_trustee_Inc = oth_trustee_Inc_Update_TextBox.Text;
            case_client.ss_app_date = Convert.ToDateTime(ss_app_date_Update_TextBox.Text);
            case_client.ss_amt = Convert.ToDecimal(ss_amt_Update_TextBox.Text);
            case_client.ss_Inc = ss_Inc_Update_TextBox.Text;
            case_client.va_app_date = Convert.ToDateTime(va_app_date_Update_TextBox.Text);
            case_client.va_amt = Convert.ToDecimal(va_amt_Update_TextBox.Text);
            case_client.va_Inc = va_Inc_Update_TextBox.Text;
            case_client.eap_app_date = Convert.ToDateTime(eap_app_date_Update_TextBox.Text);
            case_client.eap_amt = Convert.ToDecimal(eap_amt_Update_TextBox.Text);
            case_client.eap_Inc = eap_Inc_Update_TextBox.Text;
            case_client.fema_app_date = Convert.ToDateTime(fema_app_date_Update_TextBox.Text);
            case_client.fema_amt = Convert.ToDecimal(fema_amt_Update_TextBox.Text);
            case_client.fema_Inc = fema_Inc_Update_TextBox.Text;
            case_client.unempl_app_date = Convert.ToDateTime(unempl_app_date_Update_TextBox.Text);
            case_client.unempl_amt = Convert.ToDecimal(unempl_amt_Update_TextBox.Text);
            case_client.unempl_Inc = unempl_Inc_Update_TextBox.Text;
            case_client.grants_loans_app_date = Convert.ToDateTime(grants_loans_app_date_Update_TextBox.Text);
            case_client.grants_loans_amt = Convert.ToDecimal(grants_loans_amt_Update_TextBox.Text);
            case_client.grants_Inc = grants_Inc_Update_TextBox.Text;
            case_client.other_app_date = Convert.ToDateTime(other_app_date_Update_TextBox.Text);
            case_client.other_amt = Convert.ToDecimal(other_amt_Update_TextBox.Text);
            case_client.other_Inc = other_Inc_Update_TextBox.Text;
            case_client.denial_memo = denial_memo_Update_TextBox.Text;
            case_client.welfr_fraud_memo = welfr_fraud_memo_Update_TextBox.Text;
            case_client.Client_issue_Desc = Client_issue_Desc_Update_TextBox.Text;
            case_client.Client_issue_resolved = Client_issue_resolved_Update_TextBox.Text;
            case_client.Client_issue_comments = Client_issue_comments_Update_TextBox.Text;
            case_client.Update(case_client);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return case_client;
        }
        public void case_client_delete(int ID)
        {
            case_client.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            case_client = case_client_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            case_client = case_client_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            case_client_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

