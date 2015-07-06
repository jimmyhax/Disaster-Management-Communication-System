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
using System.Configuration;
using System.Net;
using System.Diagnostics;
using System.Globalization;

namespace DMCS.Moduals.Missing_Pets
{
    public partial class Missing_Pets_Modual : System.Web.UI.Page
    {
        //finding client
        private person person = new person();
        private client client = new client();
        private ClientWPets ClientWPets = new ClientWPets();
        private Pet pet = new Pet();
        private Pet_type Pet_Type = new Pet_type();
        private Pet_Deceased Pet_Deceased = new Pet_Deceased();
        private Pet_Missing Pet_Missing = new Pet_Missing();
        private location Location = new location();
        private encounter encounter = new encounter();
        private case_intake case_intake = new case_intake();
        private case_client case_client = new case_client();




        protected void Page_Load(object sender, EventArgs e)
        {


            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }
            if (!IsPostBack)
            {
                // Add
                Insert_DateDeceased_txt.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
                Insert_DateMissing_txt.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
                Insert_TimeLost_txt.Text = System.DateTime.Now.ToString("hh:mm tt");
                Insert_dateFound_txt.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
                // Update
                Update_DateDeceased_txt.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
                Update_DateMissing_txt.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
                Update_TimeLost_txt.Text = System.DateTime.Now.ToString("hh:mm tt");
                Update_dateFound_txt.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
            }
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
            //Insert Image handeling
            if (IsPostBack && Insert_FileUpload1.PostedFile != null)
            {
                if (Insert_FileUpload1.PostedFile.FileName.Length > 0)
                {
                    Insert_FileUpload1.SaveAs(Server.MapPath("Pet_Images/Original/") + Insert_FileUpload1.PostedFile.FileName);
                    Insert_Preview_ImageBox.ImageUrl = "Pet_Images/Original/" + Insert_FileUpload1.PostedFile.FileName;
                    Insert_FileUpload1.Visible = false;
                    Insert_Change_PetImage_btn.Visible = true;
                    Insert_Image_Name.Text = Insert_FileUpload1.PostedFile.FileName;
                    
                }
            }
            //Update Image handeling
            if (IsPostBack && Update_FileUpload1.PostedFile != null)
            {
                if (Update_FileUpload1.PostedFile.FileName.Length > 0)
                {
                    Update_FileUpload1.SaveAs(Server.MapPath("Pet_Images/Original/") + Update_FileUpload1.PostedFile.FileName);
                    Update_Preview_ImageBox.ImageUrl = "Pet_Images/Original/" + Update_FileUpload1.PostedFile.FileName;
                    Update_FileUpload1.Visible = false;
                    Update_Change_PetImage_btn.Visible = true;
                    Update_Image_Name.Text = Update_FileUpload1.PostedFile.FileName;
                }
            }
        }
        //refresh list of pets
        protected void refreshPet()
        {
            try
            {
                String whereclause = "";

                if (Update_sPetName_txt.Text != "")
                {
                    whereclause += "and pet_Name LIKE '%" + Update_sPetName_txt.Text + "%'";
                }
                if (Update_sPetType_DDL.SelectedValue != "")
                {
                    whereclause += "and pet_Type LIKE '%" + Update_sPetType_DDL.SelectedValue + "%'";
                }
                if (Update_sPetBreed_txt.Text != "")
                {
                    whereclause += "and pet_Breed LIKE '%" + Update_sPetBreed_txt.Text + "%'";
                }

                Update_gvPetSearchresult.DataSource = pet.SelectWPetType(whereclause);

                Update_gvPetSearchresult.DataBind();
            }
            catch (Exception ex)
            {
                Update_lbl_pet_Error.Text = "Error looking for pet";
            }  
        }
        protected void BtnPetNameSearch_Click(object sender, EventArgs e)
        {
            Update_lbl_pet_Error.Text = "";
            if (Update_sPetName_txt.Text != "" || Update_sPetType_DDL.SelectedValue != "" || Update_sPetBreed_txt.Text != "" )
            {
                refreshPet();
            }
            else
            {
                Update_lbl_pet_Error.Text = "Please input information to a least one information box to use this search type.";
            }

        }
        //update the pet records -- update btn
        protected void update(object sender, EventArgs e)
        {

            if (Update_GVcases.SelectedValue == null)
            {
                Update_lbl_pet_Error.Text = "You must first select a case to continue";
                return;
            }
            else if (Update_gvClientSearchresult.SelectedValue == null)
            {
                Update_lbl_pet_Error.Text = "You must first select a client to continue";
                return;
            }
            if (Update_DDL_Call_Center.SelectedValue == "-1")
            {
                Update_lbl_pet_Error.Text = "Please a call center to contuinue.";
                return;
            }
            else if (Update_DDlDisasters.SelectedValue == "-1")
            {
                Update_lbl_pet_Error.Text = "Please a disaster to contuinue.";
                return;
            }
            else
            {

                person = person.Select(Convert.ToInt32(Update_gvClientSearchresult.SelectedDataKey.Value));
                client = client.Select(Convert.ToInt32(Update_gvClientSearchresult.SelectedDataKey.Value));
                
                //PetType exchange
                Pet_Type.Pet_Type_ID = GlobalVariables.Pet_Type_ID;

                Pet_Type.Pet_Type = Update_petType_ddl.SelectedValue;
                Pet_Type.Pet_Breed = Update_petBreed_txt.Text;
                Pet_Type.Pet_Species = Update_petSpecies_ddl.SelectedValue;


                //Pet exchange
                pet.Pet_Record_ID = Convert.ToInt32(Update_gvPetSearchresult.SelectedDataKey.Value);
                pet.Pet_Type_ID = GlobalVariables.Pet_Type_ID;

                pet.Pet_Name = Update_petName_txt.Text;
                pet.Pet_Location_Found_ID = 1;
                if (Update_petDateOfBirth_txt.Text != "") { pet.Pet_Date_Of_Birth = Convert.ToDateTime(Update_petDateOfBirth_txt.Text); }
                pet.Pet_RFID = Update_petRFID_txt.Text;
                pet.Date_Modified = DateTime.Now;
                pet.Date_Created = DateTime.Now;
                pet.Pet_Description = Update_petDiscription_txt.Text;
                pet.Pet_Gender = Convert.ToString(Update_petGender_DDL.SelectedValue);
                pet.Pet_Color = Update_petColor_txt.Text;
                pet.Pet_Vet_ID = Update_petVetID_txt.Text;
                pet.Pet_License_Tag = Update_petLicenseTag_txt.Text;
                pet.Pet_Tatoo_No = Update_petTatooNumber_txt.Text;
                pet.Pet_Sterilized = Convert.ToString(Update_petNeutered_DDL.SelectedValue);
                pet.Pet_Weight = Convert.ToInt32(Update_petWeight_txt.Text);
                pet.Pet_Condition = Update_petConditionID_ddl.SelectedValue;
                pet.Pet_Status = Update_petStatusID_txt.Text;


                if (Update_Image_Name.Text != "")
                {
                    //========= 
                    //Save Image to server then DB Object
                    string fileName = Update_gvPetSearchresult.SelectedDataKey.Value + "_" + Update_petName_txt.Text + ".jpg";
                    string smallPath = Server.MapPath("Pet_Images/100x100/" + fileName);
                    string mediumPath = Server.MapPath("Pet_Images/200x200/" + fileName);
                    string originalPath = Server.MapPath("Pet_Images/Original/" + fileName);
                    string originalTempPath = Server.MapPath("Pet_Images/Original/" + Update_Image_Name.Text);




                    //create clone image to re-size
                    System.Drawing.Image small_pet_picture = System.Drawing.Image.FromFile(originalTempPath);
                    //resize
                    small_pet_picture = resizeImage(small_pet_picture, new Size(100, 100));
                    //Convert back to byte[] array
                    byte[] small_pet_picture_bytes = imageToByteArray(small_pet_picture);

                    //create clone image to re-size                    
                    System.Drawing.Image medium_pet_picture = System.Drawing.Image.FromFile(originalTempPath);
                    //resize                    
                    medium_pet_picture = resizeImage(medium_pet_picture, new Size(200, 200));
                    //Convert back to byte[] array
                    byte[] medium_pet_picture_bytes = imageToByteArray(medium_pet_picture);

                    //create clone image to re-size                    
                    System.Drawing.Image original_pet_picture = System.Drawing.Image.FromFile(originalTempPath);
                    //Convert to byte[] array
                    byte[] original_pet_picture_bytes = imageToByteArray(original_pet_picture);

                    //save resized images
                    File.WriteAllBytes(@smallPath, small_pet_picture_bytes);
                    File.WriteAllBytes(@mediumPath, medium_pet_picture_bytes);
                    File.WriteAllBytes(@originalPath, original_pet_picture_bytes);
                    //save to database
                    pet.Pet_Picture = imageToByteArray(System.Drawing.Image.FromFile(originalPath));
                }
                else
                {
                    pet.Pet_Picture = new byte[0];
                }






                //ClientWPets
                ClientWPets.CLIENTWPETS_ID = GlobalVariables.CLIENTWPETS_ID;
                ClientWPets.Pet_Record_ID = pet.Pet_Record_ID;
                ClientWPets.Client_id = client.client_id;
                ClientWPets.Location_ID = GlobalVariables.Location_ID;
                ClientWPets.cp_Date = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd"));
                ClientWPets.ownership = Convert.ToString("y");



                //Location
                Location.Location_ID = GlobalVariables.Location_ID;
                Location.type = decideLocationType();
                Location.city = Update_city_txt.Text;
                Location.state = Update_state_txt.Text;
                Location.zip = Convert.ToInt32(Update_zip_txt.Text);
                Location.county = Update_county_txt.Text;
                Location.location_desc = Update_LocationDiscription_txt.Text;
                Location.n_long = Convert.ToDecimal(Update_long_txt.Text);
                Location.s_long = 0;
                Location.e_long = 0;
                Location.w_long = 0;
                Location.n_lat = Convert.ToDecimal(Update_lat_txt.Text);
                Location.s_lat = 0;
                Location.e_lat = 0;
                Location.w_lat = 0;



                //update 


                if (Pet_Deceased.Pet_Deceased_ID == 0 && Update_deceasedYes.Checked == true)
                {
                    if (Update_DateDeceased_txt.Text == "" || Update_serviceType_DDL.SelectedValue == "-1")
                    {
                        Update_lbl_pet_Error.Text = "Please fill out The Date Found and or Service Type.";
                    }
                    else
                    {
                        //Pet_Deceased exchange
                        Pet_Deceased.Pet_Deceased_ID = pet.Pet_Record_ID;
                        Pet_Deceased.Date_Deceased = Convert.ToDateTime(Update_DateDeceased_txt.Text);
                        Pet_Deceased.Funeral = Update_funeral_txt.Text;
                        Pet_Deceased.Cemetary_Name = Update_cemetaryName_txt.Text;
                        Pet_Deceased.Deceased_Type = Update_serviceType_DDL.SelectedValue;
                        Pet_Deceased.Date_Modified = DateTime.Now;
                        Pet_Deceased.Date_Created = DateTime.Now;
                        Pet_Deceased.Location_ID = Location.Location_ID;
                        Pet_Deceased = Pet_Deceased.Insert(Pet_Deceased);
                    }
                }
                if (GlobalVariables.Pet_Deceased_ID != 0 && Update_deceasedYes.Checked == true)
                {
                    if (Update_DateDeceased_txt.Text == "" || Update_serviceType_DDL.SelectedValue == "")
                    {
                        Update_lbl_pet_Error.Text = "Please fill out The Date Found and or Service Type.";
                    }
                    else
                    {
                        //Pet_Deceased exchange
                        Pet_Deceased.Pet_Deceased_ID = pet.Pet_Record_ID;
                        Pet_Deceased.Date_Deceased = Convert.ToDateTime(Update_DateDeceased_txt.Text);
                        Pet_Deceased.Funeral = Update_funeral_txt.Text;
                        Pet_Deceased.Cemetary_Name = Update_cemetaryName_txt.Text;
                        Pet_Deceased.Deceased_Type = Update_serviceType_DDL.SelectedValue;
                        Pet_Deceased.Location_ID = Location.Location_ID;
                        //Pet_Deceased.Date_Created == null
                        Pet_Deceased.Date_Modified = DateTime.Now;

                        Pet_Deceased.Update(Pet_Deceased);
                    }
                }
                if (GlobalVariables.Pet_Missing_ID == 0 && Update_missingYes.Checked == true)
                {
                    //Pet_Missing exchange
                    Pet_Missing.Pet_Missing_ID = pet.Pet_Record_ID;
                    Pet_Missing.Last_Known_Location_ID = Location.Location_ID;
                    Pet_Missing.Date_Reported = DateTime.Now;
                    Pet_Missing.Date_Created = DateTime.Now;
                    Pet_Missing.Date_Missing = Convert.ToDateTime(Update_DateMissing_txt.Text);
                    Pet_Missing.Time_Lost = Convert.ToDateTime(Update_TimeLost_txt.Text);
                    Pet_Missing.Collar_Description = Update_collarDescription_txt.Text;
                    Pet_Missing.Lost_Explanation = Update_lostExplanation_txt.Text;
                    if (Update_LengthOwned_txt.Text != "") { Pet_Missing.Length_Owned = Convert.ToInt32(Update_LengthOwned_txt.Text); }
                    if (Update_RewardAmt_txt.Text != "") { Pet_Missing.Reward_Amt = Convert.ToDecimal(Update_RewardAmt_txt.Text); }
                    Pet_Missing.Breeder = Update_Breeder_txt.Text;
                    Pet_Missing.Date_Modified = DateTime.Now;


                    Pet_Missing = Pet_Missing.Insert(Pet_Missing);
                }
                if (GlobalVariables.Pet_Missing_ID != 0 && Update_missingYes.Checked == true)
                {
                    //Pet_Missing exchange
                    Pet_Missing.Pet_Missing_ID = pet.Pet_Record_ID;
                    Pet_Missing.Last_Known_Location_ID = Location.Location_ID;
                    Pet_Missing.Date_Reported = DateTime.Now;
                    Pet_Missing.Date_Created = DateTime.Now;
                    Pet_Missing.Date_Missing = Convert.ToDateTime(Update_DateMissing_txt.Text);
                    Pet_Missing.Time_Lost = Convert.ToDateTime(Update_TimeLost_txt.Text);
                    Pet_Missing.Collar_Description = Update_collarDescription_txt.Text;
                    Pet_Missing.Lost_Explanation = Update_lostExplanation_txt.Text;
                    if (Update_LengthOwned_txt.Text != "") { Pet_Missing.Length_Owned = Convert.ToInt32(Update_LengthOwned_txt.Text); }
                    if (Update_RewardAmt_txt.Text != "") { Pet_Missing.Reward_Amt = Convert.ToDecimal(Update_RewardAmt_txt.Text); }
                    Pet_Missing.Breeder = Update_Breeder_txt.Text;
                    Pet_Missing.Date_Modified = DateTime.Now;
                    Pet_Missing.Update(Pet_Missing);
                }

                pet.Update(pet);
                Pet_Type.Update(Pet_Type);
                Location.Update(Location);
                ClientWPets.Update(ClientWPets);



                ////////////////////////////////////////
                encounter.case_id = GlobalVariables.CaseID;
                encounter.agency_id = 0;
                encounter.call_center_id = Convert.ToInt32(Update_DDL_Call_Center.SelectedValue);
                encounter.client_id = GlobalVariables.ClientID;
                encounter.create_date = DateTime.Now;
                if (GlobalVariables.Pet_Deceased_ID != null || GlobalVariables.Pet_Deceased_ID != 0)
                {
                    encounter.close_date = DateTime.Now;
                }
                else
                {
                    encounter.close_date = Convert.ToDateTime("9/9/9");
                }

                encounter.disaster_id = Convert.ToInt32(Update_DDlDisasters.SelectedValue);
                encounter.Location_ID = Location.Location_ID;
                encounter.Pet_Record_ID = pet.Pet_Record_ID;

                encounter.Insert(encounter);

                Update_lbl_pet_Error.Text = "The selected pets informatin has been successfully updated.";
            }
        }
        ////////////////////////////////////////
        /////////////////////////////////////////////
        //////////////////Start Client/////////////////////
        /////////////////////////////////////////////
        ////////////////////////////////////////


        //find client - search button
        //select a pet and display data
        protected void gvPetSearchresult_SelectedIndexChanged(object sender, EventArgs e)
        {
            pet = pet.Select(Convert.ToInt32(Update_gvPetSearchresult.SelectedDataKey.Value));
            GlobalVariables.Pet_Record_ID = Convert.ToInt32(Update_gvPetSearchresult.SelectedDataKey.Value);
            Pet_Type = Pet_Type.Select(pet.Pet_Type_ID);
            Pet_Missing = Pet_Missing.Select(pet.Pet_Record_ID);
            Pet_Deceased = Pet_Deceased.Select(pet.Pet_Record_ID);
            ClientWPets = ClientWPets.Select(pet.Pet_Record_ID);

            Location = Location.Select(ClientWPets.Location_ID);



            ////////////////////////////////////////////////////////////////////////////////////

            //Pet
            GlobalVariables.Pet_Deceased_ID = Pet_Deceased.Pet_Deceased_ID;
            GlobalVariables.Pet_Type_ID = pet.Pet_Type_ID;
            GlobalVariables.Pet_Missing_ID = Pet_Missing.Pet_Missing_ID;
            GlobalVariables.CLIENTWPETS_ID = ClientWPets.CLIENTWPETS_ID;
            GlobalVariables.Location_ID = ClientWPets.Location_ID;

            //Pet
            Update_petName_txt.Text = pet.Pet_Name;
            Update_petDateOfBirth_txt.Text = pet.Pet_Date_Of_Birth.ToShortDateString();
            Update_petRFID_txt.Text = Convert.ToString(pet.Pet_RFID);
            pet.Date_Modified = DateTime.Now;
            //pet.Date_Created = CANT CHANGE!!!
            Update_petDiscription_txt.Text = pet.Pet_Description;
            Update_petGender_DDL.SelectedValue = Convert.ToString(pet.Pet_Gender);
            Update_petColor_txt.Text = pet.Pet_Color;
            Update_petVetID_txt.Text = pet.Pet_Vet_ID;
            Update_petLicenseTag_txt.Text = pet.Pet_License_Tag;
            Update_petTatooNumber_txt.Text = pet.Pet_Tatoo_No;
            Update_petConditionID_ddl.SelectedValue = pet.Pet_Condition;
            Update_petStatusID_txt.Text = pet.Pet_Status;
            Update_petNeutered_DDL.SelectedValue = Convert.ToString(pet.Pet_Sterilized);
            Update_petWeight_txt.Text = Convert.ToString(pet.Pet_Weight);


            //PetType
            Update_petSpecies_ddl.SelectedValue = Pet_Type.Pet_Species;
            Update_petType_ddl.SelectedValue = Pet_Type.Pet_Type;
            Update_petBreed_txt.Text = Pet_Type.Pet_Breed;

            if (Pet_Missing.Pet_Missing_ID != 0)
            {
                //Missing
                Update_DateMissing_txt.Text = Pet_Missing.Date_Missing.ToShortDateString();
                Update_collarDescription_txt.Text = Pet_Missing.Collar_Description;
                Update_TimeLost_txt.Text = Convert.ToString(Pet_Missing.Time_Lost);
                Update_lostExplanation_txt.Text = Pet_Missing.Lost_Explanation;
                Update_LengthOwned_txt.Text = Convert.ToString(Pet_Missing.Length_Owned);
                Update_RewardAmt_txt.Text = Convert.ToString(Pet_Missing.Reward_Amt);
                Update_Breeder_txt.Text = Pet_Missing.Breeder;
            }

            if (Pet_Deceased.Pet_Deceased_ID != 0)
            {
                //Pet_Deceased
                Update_DateDeceased_txt.Text = Convert.ToString(Pet_Deceased.Date_Deceased);
                Update_funeral_txt.Text = Pet_Deceased.Funeral;
                Update_cemetaryName_txt.Text = Pet_Deceased.Cemetary_Name;
                Update_serviceType_DDL.SelectedValue = Convert.ToString(Pet_Deceased.Deceased_Type);
                Pet_Deceased.Date_Modified = DateTime.Now;
                if (Update_serviceType_DDL.SelectedValue == "F")
                {
                    Update_cemetaryName_L.Visible = true;
                    Update_cemetaryName_txt.Visible = true;
                    Update_funeral_txt.Visible = true;
                    Update_funeral_L.Visible = true;
                }
                else
                {
                    Update_cemetaryName_L.Visible = false;
                    Update_cemetaryName_txt.Visible = false;
                    Update_funeral_txt.Visible = false;
                    Update_funeral_L.Visible = false;
                }
            }






            //Location
            Update_address_txt.Text = Location.location_desc;
            Update_city_txt.Text = Location.city;
            Update_state_txt.Text = Location.state;
            Update_zip_txt.Text = Convert.ToString(Location.zip);
            Update_county_txt.Text = Location.county;
            Update_LocationDiscription_txt.Text = Location.location_desc;
            Update_long_txt.Text = Convert.ToString(Location.n_long);
            Update_lat_txt.Text = Convert.ToString(Location.n_lat);


            if (GlobalVariables.Pet_Missing_ID == 0 || GlobalVariables.Pet_Missing_ID == null)
            {
                Update_PetMissingInfoHead.Visible = false;
                Update_PetMissingInfoBody.Visible = false;
                Update_missingYes.Checked = false;



                Update_locationknown_L.Text = "Where is the Pet Located?";

            }
            else
            {
                Update_missingYes.Checked = true;
                Update_PetMissingInfoHead.Visible = true;
                Update_PetMissingInfoBody.Visible = true;
                Update_deceasedYes.Checked = false;

                Update_deceasedYes.Checked = false;
                Update_PetDeceasedInfoHead.Visible = false;
                Update_PetDeceasedInfoBody.Visible = false;

                Update_PetSearchSelected_L.Text += "</br>" + "== STATUS: Missing as of " + Convert.ToString(Pet_Missing.Date_Missing) + " ==";
                Update_locationknown_L.Text = "Where was the Pet Last Seen?";
            }


            if (GlobalVariables.Pet_Deceased_ID == 0 || GlobalVariables.Pet_Deceased_ID == null)
            {
                Update_PetDeceasedInfoHead.Visible = false;
                Update_PetDeceasedInfoBody.Visible = false;
                Update_deceasedYes.Checked = false;


                Update_locationknown_L.Text = "Where is the Pet Located?";
            }
            else
            {
                Update_deceasedYes.Checked = true;
                Update_PetDeceasedInfoHead.Visible = true;
                Update_PetDeceasedInfoBody.Visible = true;

                Update_missingYes.Checked = false;
                Update_PetMissingInfoHead.Visible = false;
                Update_PetMissingInfoBody.Visible = false;

                Update_PetSearchSelected_L.Text += "</br>" + "== STATUS: Deceased as of " + Convert.ToString(Pet_Deceased.Date_Deceased) + " ==";
                Update_locationknown_L.Text = "Where is the Pets Resting Place?";
            }


        }
        //change the page
        protected void gvPetSearchresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Update_gvPetSearchresult.PageIndex = e.NewPageIndex;
            refreshPet();
        }
        
        protected void Update_BtnNameSearch_Click(object sender, EventArgs e)
        {

            if ((Update_txtfirstname.Text != "") && (Update_txtlastname.Text != ""))
            {
                Update_refreshclient();
            }
            else
            {
                Update_lblSearchErrormsg.Text = "You must enter a first and last name in order to search clients.";
            }



        }
        //refresh list of clients
        protected void Update_refreshclient()
        {
            try
            {

                String whereclause = "person_type='C' AND f_name LIKE '%" + Update_txtfirstname.Text.Replace("'", "''") + "%' AND l_name LIKE '%" + Update_txtlastname.Text.Replace("'", "''") + "%'";

                Update_gvClientSearchresult.DataSource = person.Select(whereclause);
                Update_gvClientSearchresult.DataBind();


            }
            catch (Exception ex)
            {
                Update_lblSearchErrormsg.Text = "Error looking for client";
            }
        }
        //select a client and display data
        protected void Update_gvClientSearchresult_SelectedIndexChanged(object sender, EventArgs e)
        {
            Update_lbl_pet_Error.Text = "";
            person = person.Select(Convert.ToInt32(Update_gvClientSearchresult.SelectedDataKey.Value));
            GlobalVariables.PersonID = Convert.ToInt32(Update_gvClientSearchresult.SelectedDataKey.Value);

            client = client.Select(GlobalVariables.PersonID);
            GlobalVariables.ClientID = client.client_id;


            Update_txtfirstname.Text = person.f_name.ToString();
            Update_txtlastname.Text = person.l_name.ToString();


            Update_refreshcase();
        }
        //case search gridview
        protected void Update_GVcases_SelectedIndexChanged(object sender, EventArgs e)
        {
            case_intake = case_intake.Select(Convert.ToInt32(Update_GVcases.SelectedDataKey.Value));
            case_client = case_client.Select(Convert.ToInt32(Update_GVcases.SelectedDataKey.Value), Convert.ToInt32(GlobalVariables.PersonID));

            GlobalVariables.CaseID = case_client.case_id;
            GlobalVariables.ClientID = case_client.client_id;
        }
        protected void Update_refreshcase()
        {
            DataTable vlcaslst = new DataTable();
            DataTable casedt = new DataTable();



            vlcaslst.Columns.Add("Case_id", Type.GetType("System.Int32"));
            vlcaslst.Columns.Add("applic_end_Date_time", Type.GetType("System.DateTime"));
            vlcaslst.Columns.Add("applic_Start_Date_time", Type.GetType("System.DateTime"));

            String whereclause = "Client_id = " + person.person_id;
            casedt = case_client.Select(whereclause);

            if (casedt.Rows.Count > 0)
            {
                foreach (DataRow cr in casedt.Rows)
                {
                    DataRow caserow = vlcaslst.NewRow();

                    case_intake = case_intake.Select(Convert.ToInt32(cr["Case_id"]));


                    caserow.SetField(0, case_intake.case_id);
                    caserow.SetField(1, case_intake.applic_end_date_time);
                    caserow.SetField(2, case_intake.applic_start_date_time);

                    vlcaslst.Rows.Add(caserow);

                }

                Update_GVcases.DataSource = vlcaslst;
                Update_GVcases.DataBind();


            }
            else
            {
                Update_lbl_pet_Error.Text = "No case information exists";
            }
        }
        //pet Funerial type changed
        protected void Update_serviceTypeChange(object sender, EventArgs e)
        {

            if (Update_serviceType_DDL.Text == "Funeral")
            {
                Update_cemetaryName_L.Visible = true;
                Update_cemetaryName_txt.Visible = true;
                Update_funeral_txt.Visible = true;
                Update_funeral_L.Visible = true;
            }
            else
            {
                Update_cemetaryName_L.Visible = false;
                Update_cemetaryName_txt.Visible = false;
                Update_funeral_txt.Visible = false;
                Update_funeral_L.Visible = false;
            }

        }
        //MissingPet yes or no :displays pannel
        protected void Update_missingChangedYes(object sender, EventArgs e)
        {
            if (Update_missingYes.Checked == true)
            {
                Update_PetMissingInfoHead.Visible = true;
                Update_PetMissingInfoBody.Visible = true;
                Update_deceasedYes.Checked = false;
                Update_PetDeceasedInfoHead.Visible = false;
                Update_PetDeceasedInfoBody.Visible = false;

                Update_locationknown_L.Text = "Where was the Pet Last Seen?";

            }
            else
            {
                Update_PetMissingInfoHead.Visible = false;
                Update_PetMissingInfoBody.Visible = false;
                Update_missingYes.Checked = false;
                Update_locationknown_L.Text = "Where is the Pet Located?";
            }
        }
        //deceasedPet yes or no :displays panel
        protected void Update_deceasedChangedYes(object sender, EventArgs e)
        {
            if (Update_deceasedYes.Checked == true)
            {
                Update_PetDeceasedInfoHead.Visible = true;
                Update_PetDeceasedInfoBody.Visible = true;
                Update_missingYes.Checked = false;
                Update_PetMissingInfoHead.Visible = false;
                Update_PetMissingInfoBody.Visible = false;
                Update_missingYes.Checked = false;
                Update_locationknown_L.Text = "Where is the Pets Resting Place?";
            }
            else
            {
                Update_PetDeceasedInfoHead.Visible = false;
                Update_PetDeceasedInfoBody.Visible = false;
                Update_deceasedYes.Checked = false;
                Update_locationknown_L.Text = "Where is the Pet Located?";
            }

        }
        //reward radio button
        protected void Update_rewardChangedYes(object sender, EventArgs e)
        {
           
        }
        //decide location type
        private string decideLocationType()
        {
            var type = "";
            if (Update_deceasedYes.Checked == false && Update_missingYes.Checked == false)
            {
                type = "Current Location";
            }
            if (Update_deceasedYes.Checked == true)
            {
                type = "Resting Place";
            }
            if (Update_missingYes.Checked == true && ClientWPets.Client_id == null)
            {
                type = "Reported found";
            }
            if (Update_missingYes.Checked == true && ClientWPets.Client_id != null)
            {
                type = "Reported Lost";
            }

            return type;
        }
        ////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////
        /////////start Add functions///////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////


        //update the pet records -- update btn
        protected void Insert(object sender, EventArgs e)
        {
            if (Insert_GVcases.SelectedValue == null)
            {
                Insert_lbl_pet_Error.Text = "You must first select a case to continue";
                return;
            }
            else if (Insert_gvClientSearchresult.SelectedValue == null)
            {
                Insert_lbl_pet_Error.Text = "You must first select a client to continue";
                return;
            }
            else if (Insert_DDL_Call_Center.SelectedValue == "-1" )
            {
                Insert_lbl_pet_Error.Text = "Please a call center to contuinue.";
                return;
            }
            else if (Insert_DDlDisasters.SelectedValue == "-1")
            {
                Insert_lbl_pet_Error.Text = "Please a disaster to contuinue.";
                return;
            }
            else
            {

                //Location
                Location.type = decideLocationType();
                Location.city = Insert_city_txt.Text;
                Location.state = Insert_state_txt.Text;
                Location.zip = Convert.ToInt32(Insert_zip_txt.Text);
                Location.county = Insert_county_txt.Text;
                Location.location_desc = Insert_LocationDiscription_txt.Text;
                Location.n_long = Convert.ToDecimal(Insert_long_txt.Text);
                Location.s_long = 0;
                Location.e_long = 0;
                Location.w_long = 0;
                Location.n_lat = Convert.ToDecimal(Insert_lat_txt.Text);
                Location.s_lat = 0;
                Location.e_lat = 0;
                Location.w_lat = 0;

                Location = Location.Insert(Location);
                //PetType exchange
                Pet_Type.Pet_Type = Insert_petType_ddl.SelectedValue;
                Pet_Type.Pet_Breed = Insert_petBreed_txt.Text;
                Pet_Type.Pet_Species = Insert_petSpecies_ddl.SelectedValue;

                Pet_Type = Pet_Type.Insert(Pet_Type);

                pet.Pet_Type_ID = Pet_Type.Pet_Type_ID;
                pet.Pet_Name = Insert_petName_txt.Text;
                if (Insert_petDateOfBirth_txt.Text != "") { pet.Pet_Date_Of_Birth = Convert.ToDateTime(Insert_petDateOfBirth_txt.Text); }
                else { pet.Pet_Date_Of_Birth = Convert.ToDateTime("9/9/9"); }
                pet.Pet_RFID = Insert_petRFID_txt.Text;
                pet.Date_Modified = DateTime.Now;
                pet.Date_Created = DateTime.Now;
                pet.Pet_Description = Insert_petDiscription_txt.Text;
                pet.Pet_Gender = Convert.ToString(Insert_petGender_DDL.SelectedValue);
                pet.Pet_Color = Insert_petColor_txt.Text;
                pet.Pet_Vet_ID = Insert_petVetID_txt.Text;
                pet.Pet_License_Tag = Insert_petLicenseTag_txt.Text;
                pet.Pet_Tatoo_No = Insert_petTatooNumber_txt.Text;
                pet.Pet_Sterilized = Convert.ToString(Insert_petNeutered_DDL.SelectedValue);
                if (Insert_petWeight_txt.Text != "") { pet.Pet_Weight = Convert.ToInt32(Insert_petWeight_txt.Text); }
                if (Insert_petCondition_ddl.SelectedValue != "-1") { pet.Pet_Condition = Insert_petCondition_ddl.SelectedValue; }
                pet.Pet_Status = Insert_petStatus_txt.Text;
                pet.Pet_Location_Found_ID = 0;

                if (Insert_Image_Name.Text != "")
                {
                    //========= 
                    //Save image to server then DB Object

                    string fileName = pet.Pet_Record_ID + "_" + pet.Pet_Name + ".jpg";
                    string smallPath = Server.MapPath("Pet_Images/100x100/" + fileName);
                    string mediumPath = Server.MapPath("Pet_Images/200x200/" + fileName);
                    string originalPath = Server.MapPath("Pet_Images/Original/" + fileName);
                    string originalTempPath = Server.MapPath("Pet_Images/Original/" + Insert_Image_Name.Text);




                    //create clone image to re-size
                    System.Drawing.Image small_pet_picture = System.Drawing.Image.FromFile(originalTempPath);
                    //resize
                    small_pet_picture = resizeImage(small_pet_picture, new Size(100, 100));
                    //Convert back to byte[] array
                    byte[] small_pet_picture_bytes = imageToByteArray(small_pet_picture);

                    //create clone image to re-size                    
                    System.Drawing.Image medium_pet_picture = System.Drawing.Image.FromFile(originalTempPath);
                    //resize                    
                    medium_pet_picture = resizeImage(medium_pet_picture, new Size(200, 200));
                    //Convert back to byte[] array
                    byte[] medium_pet_picture_bytes = imageToByteArray(medium_pet_picture);

                    //create clone image to re-size                    
                    System.Drawing.Image original_pet_picture = System.Drawing.Image.FromFile(originalTempPath);
                    //Convert to byte[] array
                    byte[] original_pet_picture_bytes = imageToByteArray(original_pet_picture);

                    //save resized images
                    File.WriteAllBytes(@smallPath, small_pet_picture_bytes);
                    File.WriteAllBytes(@mediumPath, medium_pet_picture_bytes);
                    File.WriteAllBytes(@originalPath, original_pet_picture_bytes);
                    //save to database
                    pet.Pet_Picture = imageToByteArray(System.Drawing.Image.FromFile(originalPath));
                }
                else {
                    pet.Pet_Picture = new byte[0]; 
                }
                pet = pet.Insert(pet);

             

                if (Insert_missingYes.Checked == true)
                {

                    //Pet_Missing exchange
                    Pet_Missing.Pet_Missing_ID = pet.Pet_Record_ID;
                    Pet_Missing.Date_Reported = DateTime.Now;
                    Pet_Missing.Date_Created = DateTime.Now;
                    Pet_Missing.Date_Missing = Convert.ToDateTime(Insert_DateMissing_txt.Text);
                    Pet_Missing.Time_Lost = Convert.ToDateTime(Insert_TimeLost_txt.Text);
                    Pet_Missing.Collar_Description = Insert_collarDescription_txt.Text;
                    Pet_Missing.Lost_Explanation = Insert_lostExplanation_txt.Text;
                    if (Insert_LengthOwned_txt.Text != "") { Pet_Missing.Length_Owned = Convert.ToInt32(Insert_LengthOwned_txt.Text); }
                    if (Insert_RewardAmt_txt.Text != "") { Pet_Missing.Reward_Amt = Convert.ToDecimal(Insert_RewardAmt_txt.Text); }
                    Pet_Missing.Breeder = Insert_Breeder_txt.Text;
                    Pet_Missing.Date_Modified = DateTime.Now;
                    Pet_Missing.Last_Known_Location_ID = Location.Location_ID;

                    Pet_Missing = Pet_Missing.Insert(Pet_Missing);


                }


                if (Insert_deceasedYes.Checked == true)
                {
                    if (Insert_DateDeceased_txt.Text == "" || Insert_serviceType_DDL.SelectedValue == "-1")
                    {
                        Insert_lbl_pet_Error.Text = "Please fill out The Date Found and or Service Type.";

                        return;
                    }
                    else
                    {
                        //Pet_Deceased exchange
                        Pet_Deceased.Pet_Deceased_ID = pet.Pet_Record_ID;
                        Pet_Deceased.Date_Deceased = Convert.ToDateTime(Insert_DateDeceased_txt.Text);
                        Pet_Deceased.Funeral = Insert_funeral_txt.Text;
                        Pet_Deceased.Cemetary_Name = Insert_cemetaryName_txt.Text;
                        Pet_Deceased.Deceased_Type = Insert_serviceType_DDL.SelectedValue;
                        Pet_Deceased.Date_Created = DateTime.Now;
                        Pet_Deceased.Date_Modified = DateTime.Now;
                        Pet_Deceased.Location_ID = Location.Location_ID;

                        Pet_Deceased = Pet_Deceased.Insert(Pet_Deceased);

                    }
                }


                



                





                //ClientWPets
                ClientWPets.Pet_Record_ID = pet.Pet_Record_ID;
                ClientWPets.Client_id = Convert.ToInt32(Insert_gvClientSearchresult.SelectedValue);
                ClientWPets.Location_ID = Location.Location_ID;
                ClientWPets.cp_Date = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd"));
                ClientWPets.ownership = Convert.ToString("y");

                ClientWPets = ClientWPets.Insert(ClientWPets);





                ////////////////////////////////////////
                encounter.case_id = Convert.ToInt32(Insert_GVcases.SelectedValue);
                //encounter.agency_id.Equals(DBNull.Value);
                encounter.call_center_id = Convert.ToInt32(Insert_DDL_Call_Center.SelectedValue);
                encounter.client_id = Convert.ToInt32(Insert_gvClientSearchresult.SelectedValue);
                encounter.create_date = DateTime.Now;
                if (GlobalVariables.Pet_Deceased_ID != null || GlobalVariables.Pet_Deceased_ID != 0)
                {
                    encounter.close_date = DateTime.Now;
                }
                else
                {
                    //encounter.close_date = Convert.ToDateTime("9/9/9");
                }

                encounter.disaster_id = Convert.ToInt32(Insert_DDlDisasters.SelectedValue);
                encounter.Location_ID = Location.Location_ID;
                encounter.Pet_Record_ID = pet.Pet_Record_ID;

                encounter.Insert(encounter);

                Insert_lbl_pet_Error.Text = "The pet has been successfully saved.";
            }

        }
        //find client - search button
        protected void Insert_BtnNameSearch_Click(object sender, EventArgs e)
        {
            if ((Insert_txtFirstName.Text != "") && (Insert_txtLastName.Text != ""))
            {
                Insert_refreshclient();
            }
            else
            {
                Insert_lbl_pet_Error.Text = "you must enter a first and last name in order to search clients.";
            }

        }
        //refresh list of clients
        protected void Insert_refreshclient()
        {
            try
            {

                String whereclause = "person_type='C' AND f_name LIKE '%" + Insert_txtFirstName.Text.Replace("'", "''") + "%' AND l_name LIKE '%" + Insert_txtLastName.Text.Replace("'", "''") + "%'";

                Insert_gvClientSearchresult.DataSource = person.Select(whereclause);
                Insert_gvClientSearchresult.DataBind();


            }
            catch (Exception ex)
            {
                Insert_lbl_pet_Error.Text = "Error looking for client";
            }
        }
        //select a client and display data
        protected void Insert_gvClientSearchresult_SelectedIndexChanged(object sender, EventArgs e)
        {

            person = person.Select(Convert.ToInt32(Insert_gvClientSearchresult.SelectedDataKey.Value));
            GlobalVariables.PersonID = Convert.ToInt32(Insert_gvClientSearchresult.SelectedDataKey.Value);

            client = client.Select(GlobalVariables.PersonID);
            GlobalVariables.ClientID = client.client_id;


            Insert_txtFirstName.Text = person.f_name.ToString();
            Insert_txtLastName.Text = person.l_name.ToString();

            Insert_firstName_L.Visible = false;
            Insert_lastName_L.Visible = false;
            Insert_txtFirstName.Visible = false;
            Insert_txtLastName.Visible = false;
            Insert_btnNameSearch.Visible = false;
            Insert_changeClient.Visible = true;


            Insert_sClient_L.Text = "</br>" + person.f_name + " " + person.l_name + " is selected.";

            Insert_refreshcase();
        }
        protected void Insert_refreshcase()
        {
            DataTable vlcaslst = new DataTable();
            DataTable casedt = new DataTable();



            vlcaslst.Columns.Add("Case_id", Type.GetType("System.Int32"));
            vlcaslst.Columns.Add("applic_end_Date_time", Type.GetType("System.DateTime"));
            vlcaslst.Columns.Add("applic_Start_Date_time", Type.GetType("System.DateTime"));

            String whereclause = "Client_id = " + person.person_id;
            casedt = case_client.Select(whereclause);

            if (casedt.Rows.Count > 0)
            {
                foreach (DataRow cr in casedt.Rows)
                {
                    DataRow caserow = vlcaslst.NewRow();

                    case_intake = case_intake.Select(Convert.ToInt32(cr["Case_id"]));


                    caserow.SetField(0, case_intake.case_id);
                    caserow.SetField(1, case_intake.applic_end_date_time);
                    caserow.SetField(2, case_intake.applic_start_date_time);

                    vlcaslst.Rows.Add(caserow);

                }

                Insert_GVcases.DataSource = vlcaslst;
                Insert_GVcases.DataBind();



            }
            else
            {
                Insert_lbl_pet_Error.Text = "No case information exists";
            }
        }
        //change the page
        protected void Insert_gvClientSearchresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Insert_gvClientSearchresult.PageIndex = e.NewPageIndex;
            Insert_refreshclient();
        }
        //case search gridview
        protected void Insert_GVcases_SelectedIndexChanged(object sender, EventArgs e)
        {
            case_intake = case_intake.Select(Convert.ToInt32(Insert_GVcases.SelectedDataKey.Value));
            case_client = case_client.Select(Convert.ToInt32(Insert_GVcases.SelectedDataKey.Value), Convert.ToInt32(GlobalVariables.PersonID));

            GlobalVariables.CaseID = case_client.case_id;
            GlobalVariables.ClientID = case_client.client_id;



        }
        protected void Insert_serviceTypeChange(object sender, EventArgs e)
        {

            if (Insert_serviceType_DDL.SelectedValue == "B")
            {
                Insert_cemetaryName_L.Visible = true;
                Insert_cemetaryName_txt.Visible = true;
                Insert_funeral_txt.Visible = true;
                Insert_funeral_L.Visible = true;
            }
            else
            {
                Insert_cemetaryName_L.Visible = false;
                Insert_cemetaryName_txt.Visible = false;
                Insert_funeral_txt.Visible = false;
                Insert_funeral_L.Visible = false;
            }

        }
        //MissingPet yes or no :displays pannel
        protected void Insert_missingChangedYes(object sender, EventArgs e)
        {
            if (Insert_missingYes.Checked == true)
            {
                Insert_PetMissingInfoHead.Visible = true;
                Insert_PetMissingInfoBody.Visible = true;
                Insert_label2.Visible = true;
                Insert_deceasedYes.Checked = false;

                Insert_deceasedYes.Checked = false;
                Insert_PetDeceasedInfoHead.Visible = false;
                Insert_PetDeceasedInfoBody.Visible = false;


                Insert_locationknown_L.Text = "Where was the Pet Last Seen?";

            }
            else
            {
                Insert_PetMissingInfoHead.Visible = false;
                Insert_PetMissingInfoBody.Visible = false;
                Insert_label2.Visible = false;
                Insert_missingYes.Checked = false;


                Insert_locationknown_L.Text = "Where is the Pets Resting Place?";
            }
        }
        //deceasedPet yes or no :displays pannel
        protected void Insert_deceasedChangedYes(object sender, EventArgs e)
        {
            if (Insert_deceasedYes.Checked == true)
            {
                Insert_PetDeceasedInfoHead.Visible = true;
                Insert_PetDeceasedInfoBody.Visible = true;
                Insert_missingYes.Checked = false;
                Insert_PetMissingInfoHead.Visible = false;
                Insert_PetMissingInfoBody.Visible = false;
                Insert_missingYes.Checked = false;
                Insert_locationknown_L.Text = "Where is the Pets Resting Place?";
            }
            else
            {
                Insert_PetDeceasedInfoHead.Visible = false;
                Insert_PetDeceasedInfoBody.Visible = false;
                Insert_deceasedYes.Checked = false;
                Insert_locationknown_L.Text = "Where was the pet last seen?";
            }

        }
       
        protected void Insert_changeClient_Click(object sender, EventArgs e)
        {
            Insert_firstName_L.Visible = true;
            Insert_lastName_L.Visible = true;
            Insert_txtFirstName.Visible = true;
            Insert_txtLastName.Visible = true;
            Insert_btnNameSearch.Visible = true;
            Insert_changeClient.Visible = false;
        }
        
        //decide location type
        private string Insert_decideLocationType()
        {
            var type = "";
            if (Insert_deceasedYes.Checked == false && Insert_missingYes.Checked == false)
            {
                type = "Current Location";
            }
            if (Insert_deceasedYes.Checked == true)
            {
                type = "Resting Place";
            }
            if (Insert_missingYes.Checked == true && (ClientWPets.Client_id == null || ClientWPets.Client_id == 0))
            {
                type = "Reported found";
            }
            if (Insert_missingYes.Checked == true && (ClientWPets.Client_id != null || ClientWPets.Client_id != 0))
            {
                type = "Reported Lost";
            }

            return type;
        }
        ///////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////
        /////////End ADD functions////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////

        ////////////////////////////////////////
        /////////////////////////////////////////////
        //////////Start Mis. Page Commands////////////
        /////////////////////////////////////////////
        ////////////////////////////////////////
        protected void clear()
        {
            //ADD
            Insert_petName_txt.Text = "";
            Insert_petDateOfBirth_txt.Text = "";
            Insert_petRFID_txt.Text = "";
            Insert_petDiscription_txt.Text = "";
            Insert_petGender_DDL.SelectedValue = "";
            Insert_petColor_txt.Text = "";
            Insert_petVetID_txt.Text = "";
            Insert_petLicenseTag_txt.Text = "";
            Insert_petTatooNumber_txt.Text = "";
            Insert_petNeutered_DDL.SelectedValue = "";
            Insert_petWeight_txt.Text = "";
            Insert_petCondition_ddl.SelectedValue = "-1";
            Insert_petStatus_txt.Text = "";


            //PetType
            Insert_petSpecies_ddl.SelectedValue = "-1";
            Insert_petType_ddl.SelectedValue = "-1";
            Insert_petBreed_txt.Text = "";
            Insert_petGender_DDL.SelectedValue = "";
            Insert_petColor_txt.Text = "";

            //Missing
            Insert_DateMissing_txt.Text = "";
            Insert_collarDescription_txt.Text = "";
            Insert_TimeLost_txt.Text = "";
            Insert_lostExplanation_txt.Text = "";
            Insert_LengthOwned_txt.Text = "";
            Insert_RewardAmt_txt.Text = "";
            Insert_Breeder_txt.Text = "";



            //Pet_Deceased
            Insert_DateDeceased_txt.Text = "";
            Insert_funeral_txt.Text = "";
            Insert_cemetaryName_txt.Text = "";
            Insert_serviceType_DDL.SelectedValue = "-1";





            //Location
            Insert_city_txt.Text = "";
            Insert_state_txt.Text = "";
            Insert_zip_txt.Text = "";
            Insert_county_txt.Text = "";
            Insert_LocationDiscription_txt.Text = "";
            Insert_long_txt.Text = "";
            Insert_lat_txt.Text = "";

            


            /////////////////////////////////
            //UPDATE
            Update_petName_txt.Text = "";
            Update_petDateOfBirth_txt.Text = "";
            Update_petRFID_txt.Text = "";
            Update_petDiscription_txt.Text = "";
            Update_petGender_DDL.SelectedValue = "";
            Update_petColor_txt.Text = "";
            Update_petVetID_txt.Text = "";
            Update_petLicenseTag_txt.Text = "";
            Update_petTatooNumber_txt.Text = "";
            Update_petNeutered_DDL.SelectedValue = "";
            Update_petWeight_txt.Text = "";
            Update_petConditionID_ddl.SelectedValue = "-1";
            Update_petStatusID_txt.Text = "";


            //PetType
            Update_petSpecies_ddl.SelectedValue = "-1";
            Update_petType_ddl.SelectedValue = "-1";
            Update_petBreed_txt.Text = "";
            Update_petGender_DDL.SelectedValue = "";
            Update_petColor_txt.Text = "";

            //Missing
            Update_DateMissing_txt.Text = "";
            Update_collarDescription_txt.Text = "";
            Update_TimeLost_txt.Text = "";
            Update_lostExplanation_txt.Text = "";
            Update_LengthOwned_txt.Text = "";
            Update_RewardAmt_txt.Text = "";
            Update_Breeder_txt.Text = "";



            //Pet_Deceased
            Update_DateDeceased_txt.Text = "";
            Update_funeral_txt.Text = "";
            Update_cemetaryName_txt.Text = "";
            Update_serviceType_DDL.SelectedValue = "-1";





            //Location
            Update_city_txt.Text = "";
            Update_state_txt.Text = "";
            Update_zip_txt.Text = "";
            Update_county_txt.Text = "";
            Update_LocationDiscription_txt.Text = "";
            Update_long_txt.Text = "";
            Update_lat_txt.Text = "";

            //Update_locationknown_L.Text = "";

            Update_PetSearchSelected_L.Text = "";


        }

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

        protected void Insert_Change_PetImage_btn_Click(object sender, EventArgs e)
        {
            Insert_FileUpload1.Visible = true;
            Insert_Change_PetImage_btn.Visible = false;
            Insert_Preview_ImageBox.ImageUrl = "Image/petPlaceHolder.png";
            Insert_Image_Name.Text = "";
        }
        protected void Update_Change_Image_btn_Click(object sender, EventArgs e)
        {
            Update_FileUpload1.Visible = true;
            Update_Change_PetImage_btn.Visible = false;
            Update_Preview_ImageBox.ImageUrl = "Image/petPlaceHolder.png";
            Update_Image_Name.Text = "";
        }

        protected void Update_sPetName_txt_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Update_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the value in the c04_oprogrs column. You'll have to use

                string Pet_Gender = e.Row.Cells[3].Text;

                if (Pet_Gender == "m")
                {
                    e.Row.Cells[3].Text = "Male";
                }
                else if (Pet_Gender == "f")
                {
                    e.Row.Cells[3].Text = "Female";
                }
            }
        }
        ////////////////////////////////////////
        /////////////////////////////////////////////
        //////////End Mis.Page Commands////////////
        /////////////////////////////////////////////
        ////////////////////////////////////////
    }
}