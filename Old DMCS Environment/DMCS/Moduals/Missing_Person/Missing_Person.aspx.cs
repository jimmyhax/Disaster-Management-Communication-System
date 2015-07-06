using DMCS.App_Code;
using System;
using System.IO;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Drawing;

namespace DMCS.Moduals.Missing_Person
{
    public partial class Missing_Person : System.Web.UI.Page
    {
        private address address = new address();
        private person person = new person();
        private client client = new client();
        private missing missing = new missing();
        private location Location = new location();
        private encounter encounter = new encounter();
        private case_intake case_intake = new case_intake();
        private case_client case_client = new case_client();
        private deceased deceased = new deceased();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "initialize", "initialize();", true);


        }


        

        //INSERT
        protected void insert_Click(object sender, EventArgs e)
        {
            try
            {
                address = address_insert();
                person = person_insert();
                client = client_insert();
                missing = missing_insert();

                if (Insert_deceasedYes.Checked == true)
                {
                    deceased = deceased_insert();
                }
                case_intake = case_intake_insert();
                case_client = case_client_insert();
                encounter = encounter_insert();
            }
            catch { Insert_lbl_Client_Error.Text = "There has been an error updating information for the missing client."; }
            finally { Insert_lbl_Client_Error.Text = "The missing client's information has been successfully updated."; }
        }

        //UPDATE
        protected void update_Click(object sender, EventArgs e)
        {

            try
            {
                //check to see if a insert is needed for deceased
                person = person.Select(Convert.ToInt32(Update_gvClientSearchresult.SelectedValue));
                client = client.Select(person.person_id);
                if (Update_deceasedYes.Checked == true)
                {
                    person = person_update(Convert.ToInt32(Update_gvClientSearchresult.SelectedValue));
                    missing = missing_update(person.person_id);
                    //check if update of insert of deceased
                    deceased = deceased.Select(client.client_id);
                    if (deceased.deceased_id == 0) { deceased = deceased_insert_For_Update(); }
                    else { deceased = deceased_update(person.person_id); }
                }
                else
                {
                    person = person_update(Convert.ToInt32(Update_gvClientSearchresult.SelectedValue));
                    missing = missing_update(person.person_id);
                }
                address = address_update(person.address_id);
                client = client_update(person.person_id);
                encounter = encounter_insert();
                Update_refreshclient();
            }
            catch { Update_lbl_Client_Error.Text = "There has been an error updating information for the missing client."; }
            finally { Update_lbl_Client_Error.Text = "The missing client's information has been successfully updated."; }
        }



        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////
        //////////////////////
        //Methods To Call
        //INSERT
        public address address_insert()
        {
            address.address_type_id = 1;
            address.city = Insert_Client_city_txt.Text;
            address.country = Insert_Client_country_txt.Text;
            address.County_Township = Insert_Client_County_Township_txt.Text;
            address.longitude = Convert.ToDecimal(Insert_Client_longitude_txt.Text);
            address.latitude = Convert.ToDecimal(Insert_Client_latitude_txt.Text);
            address.state = Insert_Client_state_txt.Text;
            address.str_add = Insert_Client_str_add_txt.Text;
            address.str_add2 = Insert_Client_str_add2_txt.Text;
            address.zip_plus_four = Insert_Client_zip_plus_four_txt.Text;
            address = address.Insert(address);
            //GridView1.DataBind();
            return address;
        }
        public person person_insert()
        {
            person.Resource_ID = 0;
            person.address_id = address.address_id;
            person.address_id2 = 0;
            person.f_name = Insert_f_name_txt.Text;
            person.m_initial = Insert_m_initial_txt.Text;
            person.l_name = Insert_l_name_txt.Text;
            person.certification_number = "HI!";
            person.gender = Insert_gender_ddl.SelectedValue;
            person.person_type = "C";
            person.phone_primary = Insert_phone_primary_txt.Text;
            person.ssn = Convert.ToInt32(Insert_ssn_txt.Text);
            person.birthdate = Convert.ToDateTime("1 / 1 / 1900");
            person.phone_secondary = "";
            person.email = "";
            person.ssn = 0;
            person.Maiden_Name = "";
            person.Visa_Issue_Date = Convert.ToDateTime("1 / 1 / 1900");
            person.Visa_Expire_Date = Convert.ToDateTime("1 / 1 / 1900");
            person.Visa_Selected_Value_B1 = 0;
            person.Visa_Selected_Value_B2 = 0;
            person.Visa_Selected_Value_K1 = 0;
            person.Visa_Selected_Value_K3 = 0; 
            person.Visa_Selected_Value_L1 = 0;
            person.Visa_Selected_Value_L2 = 0;
            person.Visa_Selected_Value_H4 = 0;
            person.Visa_Selected_Value_F1 = 0;
            person.Visa_Selected_Value_J1 = 0;
            person.Visa_Selected_Value_M1 = 0;
            person.Visa_Selected_Value_H_1B = 0;
            person.Visa_Selected_Value_H_2B = 0;
            person.Visa_Selected_Value_B_2 = 0;
            person.Visa_Selected_Value_Schengen = 0;
            person.Perm_Resident_Alien_Resid_Date = Convert.ToDateTime("1 / 1 / 1900");
            person.Perm_Resident_Alien_Expire_Date = Convert.ToDateTime("1 / 1 / 1900");
            person.Perm_Resident_Alien_A_number = 0;
            person.Perm_Resident_Alien_USCIS_number = 0;
            person.Perm_Resident_Alien_Birth_Country = "";
            person.Perm_Resident_Alien_Category = "";
            person.Driver_State_ID = "";
            person.Citizenship = "";
            person.Marital_Status = "";
            person.Minor_Children = 0;


            person = person.Insert(person);
            ////Insert_gvClientSearchresult.DataBind();
            return person;
        }
        public client client_insert()
        {
            client.client_id = person.person_id;
            if (Insert_deceasedYes.Checked == true)
            {
                client.client_status = "D";
            }
            else
            {
                client.client_status = "M";
            }
            client.ethnicity = Insert_ethnicity_txt.Text;
            client.eye_color = Insert_eye_color_ddl.SelectedValue;
            client.hair_color = Insert_hair_color_ddl.SelectedValue;
            client.height = Insert_height_ddl.SelectedValue;
            byte[] uploaded_picture = Insert_FileUpload.FileBytes;
            Insert_Save_Picture();
            client.picture = uploaded_picture;
            client.weight = Convert.ToInt32(Insert_weight_txt.Text);
            client.skin_color = Insert_skin_color_ddl.SelectedValue;
            client.Subscribed_Alerts = "N";
            client.Info_Field = "";
            client.Client_Shelter_ID = 0;
            client.Emergency_Contact_Name = "";
            client.Emergency_Contact_Number = "";

            client = client.Insert(client);
            //GridView1.DataBind();
            return client;
        }
        public missing missing_insert()
        {
            missing.Missing_id = client.client_id;
            missing.client_other_info = Insert_client_other_info_txt.Text;
            missing.clothing = Insert_clothing_txt.Text;
            missing.date_of_disappearance = Convert.ToDateTime(Insert_date_of_disappearance_txt.Text);
            missing.last_known_location = Insert_LocationDiscription_txt.Text;
            missing = missing.Insert(missing);
            //Insert_gvClientSearchresult.DataBind();
            return missing;
        }
        public deceased deceased_insert()
        {
            deceased.deceased_id = client.client_id;
            deceased.date_of_autopsy = Convert.ToDateTime(Insert_date_of_autopsy_txt.Text);
            deceased.external_exam = Insert_external_exam_txt.Text;
            deceased.identifying_marks = Insert_identifying_marks_txt.Text;
            deceased.internal_exam = Insert_internal_exam_txt.Text;
            deceased.reason_of_death = Insert_reason_of_death_txt.Text;
            deceased.time_of_death = Convert.ToDateTime(Insert_time_of_death_txt.Text);

            deceased = deceased.Insert(deceased);
            //GridView1.DataBind();
            return deceased;
        }
        public case_intake case_intake_insert()
        {
            case_intake.applic_end_date_time = Convert.ToDateTime("1 / 1 / 1900");
            case_intake.applic_start_date_time = DateTime.Now;
            case_intake.circum_emergency_event = "YES";
            case_intake.circum_help_request_memo = "MISSING PERSON";
            case_intake.circum_income_stolen = "NO";
            case_intake.circum_memo = "NO";
            case_intake.circum_no_income = "NO";
            case_intake.circum_not_enough_income = "NO";
            case_intake.agency_id = 0;
            case_intake.call_center_id = Convert.ToInt32(Insert_DDL_Call_Center.SelectedValue);
            case_intake = case_intake.Insert(case_intake);
            //GridView1.DataBind();
            return case_intake;
        }
        public case_client case_client_insert()
        {
            case_client.case_id = case_intake.case_id;
            case_client.client_id = client.client_id ;
            case_client.address_id = address.address_id;
            case_client.cable_amt_owed_today = 0;
            case_client.colessee_name = "";
            case_client.child_support = "X";
            case_client.child_support_memo = "";
            case_client.curr_residence_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.electric_amt_owed_today = 0;
            case_client.employment_memo = "";
            case_client.employment_status = "X";
            case_client.gas_or_heating_amt_owed_today = 0;
            case_client.housing_amt_owed_today = 0;
            case_client.housing_status = "X";
            case_client.income_status = "X";
            case_client.lease_num_adults = 0;
            case_client.lease_start_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.minor_children = 0;
            case_client.monthly_rent_amt = 0;
            case_client.Other_help_Sources = "";
            case_client.Other_help_Sources_memo = "";
            case_client.prev_address_id = 0;
            case_client.prev_residence_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.relationship_to_head_of_household = "X";
            case_client.rental_name = "";
            case_client.rental_phone = "";
            case_client.sewage_amt_owed_today = 0;
            case_client.telephone_amt_owed_today = 0;
            case_client.trash_removal_amt_owed_today = 0;
            case_client.us_status_memo = "";
            case_client.related_ll = "X";
            case_client.relation_to_ll = "X";
            case_client.mtg_amt_owed_today = 0;
            case_client.utilities_list = "";
            case_client.water_amt_owed_today = 0;
            case_client.public_asst_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.util_allot_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.util_allot_amt = 0;
            case_client.utilities_incl = "";
            case_client.fd_stmps_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.fd_stmps_amt = 0;
            case_client.fd_Inc = "";
            case_client.afdc_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.afdc_amt = 0;
            case_client.afdc_Inc = "";
            case_client.oth_trustee_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.oth_trustee_amt = 0;
            case_client.oth_trustee_Inc = "";
            case_client.ss_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.ss_amt = 0;
            case_client.ss_Inc = "";
            case_client.va_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.va_amt = 0;
            case_client.va_Inc = "";
            case_client.eap_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.eap_amt = 0;
            case_client.eap_Inc = "";
            case_client.fema_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.fema_amt = 0;
            case_client.fema_Inc = "";
            case_client.unempl_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.unempl_amt = 0;
            case_client.unempl_Inc = "";
            case_client.grants_loans_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.grants_loans_amt = 0;
            case_client.grants_Inc = "";
            case_client.other_app_date = Convert.ToDateTime("1 / 1 / 1900");
            case_client.other_amt = 0;
            case_client.other_Inc = "";
            case_client.denial_memo = "";
            case_client.welfr_fraud_memo = "";
            case_client.Client_issue_Desc = "";
            case_client.Client_issue_resolved = "";
            case_client.Client_issue_comments = "";
            case_client = case_client.Insert(case_client);
            //GridView1.DataBind();
            return case_client;
        }
        public encounter encounter_insert()
        {
            encounter.agency_id = 0;
            encounter.case_id = case_intake.case_id;
            encounter.call_center_id = Convert.ToInt32(Insert_DDL_Call_Center.SelectedValue);
            encounter.client_id = client.client_id;
            encounter.create_date = DateTime.Now;
            encounter.close_date = Convert.ToDateTime("1 / 1 / 1900");
            encounter.disaster_id = Convert.ToInt32(Insert_DDlDisasters.SelectedValue);
            encounter.Location_ID = 0;
            encounter.Pet_Record_ID = 0;
            encounter = encounter.Insert(encounter);
            //GridView1.DataBind();
            return encounter;
        }
        //UPDATE
        public deceased deceased_update(int ID)
        {
            deceased = deceased.Select(ID);
            deceased.date_of_autopsy = Convert.ToDateTime(Update_date_of_autopsy_txt.Text);
            deceased.external_exam = Update_external_exam_txt.Text;
            deceased.identifying_marks = Update_identifying_marks_txt.Text;
            deceased.internal_exam = Update_internal_exam_txt.Text;
            deceased.reason_of_death = Update_reason_of_death_txt.Text;
            deceased.time_of_death = Convert.ToDateTime(Update_time_of_death_txt.Text);
            deceased.Update(deceased);
            //GridView1.DataBind();
            return deceased;
        }
        public deceased deceased_insert_For_Update()
        {
            deceased.deceased_id = client.client_id;
            deceased.date_of_autopsy = Convert.ToDateTime(Update_date_of_autopsy_txt.Text);
            deceased.external_exam = Update_external_exam_txt.Text;
            deceased.identifying_marks = Update_identifying_marks_txt.Text;
            deceased.internal_exam = Update_internal_exam_txt.Text;
            deceased.reason_of_death = Update_reason_of_death_txt.Text;
            deceased.time_of_death = Convert.ToDateTime(Update_time_of_death_txt.Text);

            deceased = deceased.Insert(deceased);
            //GridView1.DataBind();
            return deceased;
        }
        public missing missing_update(int ID)
        {
            missing = missing.Select(ID);
            missing.client_other_info = Update_client_other_info_txt.Text;
            missing.clothing = Update_clothing_txt.Text;
            missing.date_of_disappearance = Convert.ToDateTime(Update_date_of_disappearance_txt.Text);
            missing.last_known_location = Update_LocationDiscription_txt.Text;
            missing.Update(missing);
            //Insert_gvClientSearchresult.DataBind();
            return missing;
        }
        public person person_update(int ID)
        {
            person = person.Select(ID);
            //person.person_id = Convert.ToInt32(Update_gvClientSearchresult.SelectedValue);
            person.f_name = Update_f_name_txt.Text;
            person.m_initial = Update_m_initial_txt.Text;
            person.l_name = Update_l_name_txt.Text;
            person.gender = Update_gender_ddl.SelectedValue;
            person.person_type = "C";
            person.phone_primary = Update_phone_primary_txt.Text;
            person.ssn = Convert.ToInt32(Update_ssn_txt.Text);
            person.Minor_Children = -1;
            person.Update(person);
            //Update_gvClientSearchresult.DataBind();
            return person;
        }
        public client client_update(int ID)
        {
            client = client.Select(ID);
            if (Update_deceasedYes.Checked == true)
            {
                client.client_status = "D";
            }
            else
            {
                client.client_status = "M";
            }
            client.ethnicity = Update_ethnicity_txt.Text;
            client.eye_color = Update_eye_color_ddl.SelectedValue;
            client.hair_color = Update_hair_color_ddl.SelectedValue;
            client.height = Update_height_ddl.SelectedValue;
            if (Update_FileUpload.HasFile == true)
            {
                byte[] uploaded_picture = Update_FileUpload.FileBytes;
                client.picture = uploaded_picture;
            }
            client.weight = Convert.ToInt32(Update_weight_txt.Text);
            client.skin_color = Update_skin_color_ddl.SelectedValue ;
            client.Update(client);
            //GridView1.DataBind();
            return client;
        }
        public address address_update(int ID)
        {
            address = address.Select(ID);
            address.city = Update_Client_city_txt.Text;
            address.country = Update_Client_country_txt.Text;
            address.County_Township = Update_Client_County_Township_txt.Text;
            address.longitude = Convert.ToDecimal(Update_Client_longitude_txt.Text);
            address.latitude = Convert.ToDecimal(Update_Client_latitude_txt.Text);
            address.state = Update_Client_state_txt.Text;
            address.str_add = Update_Client_str_add_txt.Text;
            address.str_add2 = Update_Client_str_add2_txt.Text;
            address.zip_plus_four = Update_Client_zip_plus_four_txt.Text;
            address.Update(address);
            //GridView1.DataBind();
            return address;
        }
        /////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////
        /////////////////////////////UPDATE GRIDVIEW
        protected void Update_client_search_btn_Click(object sender, EventArgs e)
        {
            if ((Update_txtFirstName.Text != "") && (Update_txtLastName.Text != ""))
            {
                Update_gridview1_div.Style.Add("display", "block");

                Update_refreshclient();
            }
            else
            {
                Update_lbl_Client_Error.Text = "you must enter a first and last name in order to search clients.";
            }
        }
        //refresh list of clients
        protected void Update_refreshclient()
        {
            try
            {

                String whereclause = "AND f_name LIKE '%" + Update_txtFirstName.Text.Replace("'", "''") + "%' AND l_name LIKE '%" + Update_txtLastName.Text.Replace("'", "''") + "%'";

                Update_gvClientSearchresult.DataSource = person.Select_Missing(whereclause);
                Update_gvClientSearchresult.DataBind();


            }
            catch (Exception ex)
            {
                Update_lbl_Client_Error.Text = "Error looking for missing person";
            }
        }
        //select a client and display data
        protected void Update_gvClientSearchresult_SelectedIndexChanged(object sender, EventArgs e)
        {

            person = person.Select(Convert.ToInt32(Update_gvClientSearchresult.SelectedDataKey.Value));
            GlobalVariables.PersonID = Convert.ToInt32(Update_gvClientSearchresult.SelectedDataKey.Value);

            address = address.Select(person.address_id);
            missing = missing.Select(person.person_id);
            deceased = deceased.Select(person.person_id);

            client = client.Select(person.person_id);
            GlobalVariables.ClientID = client.client_id;


            Update_LocationDiscription_txt.Text = missing.last_known_location;
            Update_reason_of_death_txt.Text = deceased.reason_of_death;
            Update_time_of_death_txt.Text = Convert.ToString(deceased.time_of_death);
            Update_identifying_marks_txt.Text = deceased.identifying_marks;
            Update_external_exam_txt.Text = deceased.external_exam;
            Update_date_of_autopsy_txt.Text = Convert.ToString(deceased.date_of_autopsy.ToShortDateString());
            Update_internal_exam_txt.Text = deceased.external_exam;
            Update_client_other_info_txt.Text = missing.client_other_info;
            Update_Client_latitude_txt.Text = Convert.ToString(address.latitude);
            Update_Client_longitude_txt.Text = Convert.ToString(address.longitude);
            Update_Client_zip_plus_four_txt.Text = Convert.ToString(address.zip_plus_four);
            Update_Client_str_add2_txt.Text = address.str_add;
            Update_Client_str_add_txt.Text = address.str_add2;
            Update_Client_County_Township_txt.Text = address.County_Township;
            Update_Client_country_txt.Text = address.country;
            Update_Client_state_txt.Text = address.state;
            Update_Client_city_txt.Text = address.city;
            Update_hair_color_ddl.SelectedValue = client.hair_color;
            Update_skin_color_ddl.SelectedValue = client.skin_color;
            Update_eye_color_ddl.SelectedValue = client.eye_color;
            Update_ethnicity_txt.Text = client.ethnicity;
            Update_weight_txt.Text = Convert.ToString(client.weight);
            Update_height_ddl.SelectedValue = Convert.ToString(client.height);
            Update_date_of_disappearance_txt.Text = Convert.ToString(missing.date_of_disappearance.ToShortDateString());
            Update_clothing_txt.Text = missing.clothing;
            Update_phone_primary_txt.Text = person.phone_primary;
            Update_ssn_txt.Text = Convert.ToString(person.ssn);
            Update_gender_ddl.SelectedValue = person.gender;
            Update_l_name_txt.Text = person.l_name;
            Update_m_initial_txt.Text = person.m_initial;
            Update_f_name_txt.Text = person.f_name;


            //change condishions
            Update_txtFirstName.Text = person.f_name.ToString();
            Update_txtLastName.Text = person.l_name.ToString();



            if (client.client_status == "D")
            {
                Update_Deceased_Div.Style.Add("display", "block");
                Update_deceasedYes.Checked = true;
                Update_missingYes.Checked = false;
            }
            else 
            {
                Update_Deceased_Div.Style.Add("display", "none");
                Update_deceasedYes.Checked = false;
                Update_missingYes.Checked = true;
            }


            Update_sClient_L.Text = "</br>" + person.f_name + " " + person.l_name + " is selected.";

            

        }
        protected void Update_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the value in the c04_oprogrs column. You'll have to use

                string client_status = e.Row.Cells[4].Text;
                string Gender = e.Row.Cells[5].Text;

                if (client_status == "M")
                {
                    e.Row.Cells[4].Text = "Missing";
                }
                else if (client_status == "D")
                {
                    e.Row.Cells[4].Text = "Deceased";
                }
                if (Gender == "M")
                {
                    e.Row.Cells[5].Text = "Male";
                }
                else if (Gender == "F")
                {
                    e.Row.Cells[5].Text = "Female";
                }
            }
        }
        protected void Update_changeClient_Click(object sender, EventArgs e)
        {
            Update_firstName_L.Visible = true;
            Update_lastName_L.Visible = true;
            Update_txtFirstName.Visible = true;
            Update_txtLastName.Visible = true;
            Update_client_search_btn.Visible = true;
            Update_changeClient.Visible = false;
        }

        /////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////
        /////////////////////////////INSERT CONDISHIONALS
        protected void Insert_missingChangedYes(object sender, EventArgs e)
        {
            if (Insert_missingYes.Checked == true)
            {
                RequiredFieldValidator11.ValidationGroup = "none";
                RequiredFieldValidator12.ValidationGroup = "none";
                CompareValidator1.ValidationGroup = "none";

                Insert_Deceased_Div.Style.Add("display", "none");
                Insert_deceasedYes.Checked = false;
                Insert_locationknown_L.Text = "Where was the Individual Last Seen?";
            }
            else
            {
                Insert_locationknown_L.Text = "Where is the bodys resting place?";
            }
        }
        protected void Insert_deceasedChangedYes(object sender, EventArgs e)
        {
            if (Insert_deceasedYes.Checked == true)
            {
                RequiredFieldValidator11.ValidationGroup = "valGroup_Insert";
                RequiredFieldValidator12.ValidationGroup = "valGroup_Insert";
                CompareValidator1.ValidationGroup = "valGroup_Insert";

                Insert_Deceased_Div.Style.Add("display", "block");
                Insert_missingYes.Checked = false;
                Insert_locationknown_L.Text = "Where is the bodys Resting Place?";
            }
            else
            {
                Insert_locationknown_L.Text = "Where was the Individual Last Seen?";
            }

        }
        protected void Insert_Clear_btn_Click(object sender, EventArgs e)
        {

            Insert_LocationDiscription_txt.Text = "";
            Insert_reason_of_death_txt.Text = "";
            Insert_time_of_death_txt.Text = "";
            Insert_identifying_marks_txt.Text = "";
            Insert_external_exam_txt.Text = "";
            Insert_date_of_autopsy_txt.Text = "";
            Insert_internal_exam_txt.Text = "";
            Insert_client_other_info_txt.Text = "";
            Insert_Client_latitude_txt.Text = "";
            Insert_Client_longitude_txt.Text = "";
            Insert_Client_zip_plus_four_txt.Text = "";
            Insert_Client_str_add2_txt.Text = "";
            Insert_Client_str_add_txt.Text = "";
            Insert_Client_County_Township_txt.Text = "";
            Insert_Client_country_txt.Text = "";
            Insert_Client_state_txt.Text = "";
            Insert_Client_city_txt.Text = "";
            Insert_hair_color_ddl.SelectedValue = "-1";
            Insert_skin_color_ddl.SelectedValue = "-1";
            Insert_eye_color_ddl.SelectedValue = "-1";
            Insert_ethnicity_txt.Text = "";
            Insert_weight_txt.Text = "";
            Insert_height_ddl.SelectedValue = "-1";
            Insert_date_of_disappearance_txt.Text = "";
            Insert_clothing_txt.Text = "";
            Insert_phone_primary_txt.Text = "";
            Insert_ssn_txt.Text = "";
            Insert_gender_ddl.SelectedValue = "-1";
            Insert_l_name_txt.Text = "";
            Insert_m_initial_txt.Text = "";
            Insert_f_name_txt.Text = "";
            //Insert_txtLastName.Text = "";
            //Insert_txtFirstName.Text = "";
        }
        private void Insert_Save_Picture()
        {
            string fileExt = System.IO.Path.GetExtension(Insert_FileUpload.FileName);
                
            if (fileExt == ".jpeg" || fileExt == ".jpg")
            {

                //========= 
                // Save File to Show sub directory 
                // Must be in fix length the set up pet.Picture for input

                string Insert_fileName = person.f_name + "_" + person.m_initial + "_" + person.l_name + ".jpg";
                string smallPath = Server.MapPath("~/Moduals/Missing_Person/Images/100x100/" + Insert_fileName);
                string mediumPath = Server.MapPath("~/Moduals/Missing_Person/Images/200x200/" + Insert_fileName);
                string originalPath = Server.MapPath("~/Moduals/Missing_Person/Images/Original/" + Insert_fileName);

                //save original to server
                Insert_FileUpload.SaveAs(originalPath);

                //create clone image to re-size
                System.Drawing.Image small_picture = System.Drawing.Image.FromFile(originalPath);
                //resize
                small_picture = resizeImage(small_picture, new Size(100, 100));
                //Convert back to byte[] array
                byte[] small_picture_bytes = imageToByteArray(small_picture);

                //create clone image to re-size                    
                System.Drawing.Image medium_picture = System.Drawing.Image.FromFile(originalPath);
                //resize                    
                medium_picture = resizeImage(medium_picture, new Size(200, 200));
                //Convert back to byte[] array
                byte[] medium_picture_bytes = imageToByteArray(medium_picture);

                //save resized images
                File.WriteAllBytes(@smallPath + Insert_fileName, small_picture_bytes);
                File.WriteAllBytes(@mediumPath + Insert_fileName, medium_picture_bytes);

                imgViewFile.ImageUrl = Server.MapPath("~/Moduals/Missing_Person/Images/100x100/" + Insert_fileName);

                
            }
        }
        /////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////
        //////////////////////////////UPDATE CONDISHIONALS
        protected void Update_missingChangedYes(object sender, EventArgs e)
        {
            if (Update_missingYes.Checked == true)
            {
                RequiredFieldValidator25.ValidationGroup = "none";
                RequiredFieldValidator26.ValidationGroup = "none";
                CompareValidator3.ValidationGroup = "none";

                Update_Deceased_Div.Style.Add("display", "none");
                Update_locationknown_L.Text = "Where was the Individual Last Seen?";
                Update_deceasedYes.Checked = false;
            }
            else
            {
                Update_locationknown_L.Text = "Where is the bodys resting place?";
            }
        }
        protected void Update_deceasedChangedYes(object sender, EventArgs e)
        {
            if (Update_deceasedYes.Checked == true)
            {
                RequiredFieldValidator25.ValidationGroup = "valGroup_Update";
                RequiredFieldValidator26.ValidationGroup = "valGroup_Update";
                CompareValidator3.ValidationGroup = "valGroup_Update";

                Update_Deceased_Div.Style.Add("display", "block");
                Update_locationknown_L.Text = "Where is the bodys Resting Place?";
                Update_missingYes.Checked = false;
            }
            else
            {
                Update_locationknown_L.Text = "Where was the Individual Last Seen?";
            }

        }
        protected void Update_Clear_btn_Click(object sender, EventArgs e)
        {
            Update_LocationDiscription_txt.Text = "";
            Update_reason_of_death_txt.Text = "";
            Update_time_of_death_txt.Text = "";
            Update_identifying_marks_txt.Text = "";
            Update_external_exam_txt.Text = "";
            Update_date_of_autopsy_txt.Text = "";
            Update_internal_exam_txt.Text = "";
            Update_client_other_info_txt.Text = "";
            Update_Client_latitude_txt.Text = "";
            Update_Client_longitude_txt.Text = "";
            Update_Client_zip_plus_four_txt.Text = "";
            Update_Client_str_add2_txt.Text = "";
            Update_Client_str_add_txt.Text = "";
            Update_Client_County_Township_txt.Text = "";
            Update_Client_country_txt.Text = "";
            Update_Client_state_txt.Text = "";
            Update_Client_city_txt.Text = "";
            Update_hair_color_ddl.SelectedValue = "-1";
            Update_skin_color_ddl.SelectedValue = "-1";
            Update_eye_color_ddl.SelectedValue = "-1";
            Update_ethnicity_txt.Text = "";
            Update_weight_txt.Text = "";
            Update_height_ddl.SelectedValue = "-1";
            Update_date_of_disappearance_txt.Text = "";
            Update_clothing_txt.Text = "";
            Update_phone_primary_txt.Text = "";
            Update_ssn_txt.Text = "";
            Update_gender_ddl.SelectedValue = "-1";
            Update_l_name_txt.Text = "";
            Update_m_initial_txt.Text = "";
            Update_f_name_txt.Text = "";
            Update_txtLastName.Text = "";
            Update_txtFirstName.Text = "";
        }

        /////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////
        //////////////////////////////UNIVERSIAL CONDISHIONALS
        //resize image
        public static System.Drawing.Image resizeImage(System.Drawing.Image imgToResize, Size size)
        {
            return (System.Drawing.Image)(new Bitmap(imgToResize, size));
        }
        // convert image to byte array
        public byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }
        //Byte array to photo
        public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
            return returnImage;
        }
    }
}