using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class personClass : System.Web.UI.Page
    {
        public person person = new person();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            person = person_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            person = person_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            person = person_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public person person_selectForInsert(int ID)
        {
            person = person.Select(ID);
            Resource_ID_Insert_TextBox.Text = Convert.ToString(person.Resource_ID);
            address_id_Insert_TextBox.Text = Convert.ToString(person.address_id);
            address_id2_Insert_TextBox.Text = Convert.ToString(person.address_id2);
            birthdate_Insert_TextBox.Text = Convert.ToString(person.birthdate);
            certification_number_Insert_TextBox.Text = Convert.ToString(person.certification_number);
            f_name_Insert_TextBox.Text = Convert.ToString(person.f_name);
            m_initial_Insert_TextBox.Text = Convert.ToString(person.m_initial);
            l_name_Insert_TextBox.Text = Convert.ToString(person.l_name);
            gender_Insert_TextBox.Text = Convert.ToString(person.gender);
            person_type_Insert_TextBox.Text = Convert.ToString(person.person_type);
            phone_primary_Insert_TextBox.Text = Convert.ToString(person.phone_primary);
            phone_secondary_Insert_TextBox.Text = Convert.ToString(person.phone_secondary);
            email_Insert_TextBox.Text = Convert.ToString(person.email);
            ssn_Insert_TextBox.Text = Convert.ToString(person.ssn);
            Maiden_Name_Insert_TextBox.Text = Convert.ToString(person.Maiden_Name);
            Visa_Issue_Date_Insert_TextBox.Text = Convert.ToString(person.Visa_Issue_Date);
            Visa_Expire_Date_Insert_TextBox.Text = Convert.ToString(person.Visa_Expire_Date);
            Visa_Selected_Value_B1_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B1);
            Visa_Selected_Value_B2_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B2);
            Visa_Selected_Value_K1_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_K1);
            Visa_Selected_Value_K3_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_K3);
            Visa_Selected_Value_L1_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_L1);
            Visa_Selected_Value_L2_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_L2);
            Visa_Selected_Value_H4_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H4);
            Visa_Selected_Value_F1_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_F1);
            Visa_Selected_Value_J1_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_J1);
            Visa_Selected_Value_M1_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_M1);
            Visa_Selected_Value_H_1B_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H_1B);
            Visa_Selected_Value_H_2B_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H_2B);
            Visa_Selected_Value_B_2_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B_2);
            Visa_Selected_Value_Schengen_Insert_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_Schengen);
            Perm_Resident_Alien_Resid_Date_Insert_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Resid_Date);
            Perm_Resident_Alien_Expire_Date_Insert_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Expire_Date);
            Perm_Resident_Alien_A_number_Insert_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_A_number);
            Perm_Resident_Alien_USCIS_number_Insert_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_USCIS_number);
            Perm_Resident_Alien_Birth_Country_Insert_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Birth_Country);
            Perm_Resident_Alien_Category_Insert_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Category);
            Driver_State_ID_Insert_TextBox.Text = Convert.ToString(person.Driver_State_ID);
            Citizenship_Insert_TextBox.Text = Convert.ToString(person.Citizenship);
            Marital_Status_Insert_TextBox.Text = Convert.ToString(person.Marital_Status);
            Minor_Children_Insert_TextBox.Text = Convert.ToString(person.Minor_Children);
            return person;
        }
        public person person_selectForUpdate(int ID)
        {
            person = person.Select(ID);
            person_id_Update_TextBox.Text = Convert.ToString(person.person_id);
            Resource_ID_Update_TextBox.Text = Convert.ToString(person.Resource_ID);
            address_id_Update_TextBox.Text = Convert.ToString(person.address_id);
            address_id2_Update_TextBox.Text = Convert.ToString(person.address_id2);
            birthdate_Update_TextBox.Text = Convert.ToString(person.birthdate);
            certification_number_Update_TextBox.Text = Convert.ToString(person.certification_number);
            f_name_Update_TextBox.Text = Convert.ToString(person.f_name);
            m_initial_Update_TextBox.Text = Convert.ToString(person.m_initial);
            l_name_Update_TextBox.Text = Convert.ToString(person.l_name);
            gender_Update_TextBox.Text = Convert.ToString(person.gender);
            person_type_Update_TextBox.Text = Convert.ToString(person.person_type);
            phone_primary_Update_TextBox.Text = Convert.ToString(person.phone_primary);
            phone_secondary_Update_TextBox.Text = Convert.ToString(person.phone_secondary);
            email_Update_TextBox.Text = Convert.ToString(person.email);
            ssn_Update_TextBox.Text = Convert.ToString(person.ssn);
            Maiden_Name_Update_TextBox.Text = Convert.ToString(person.Maiden_Name);
            Visa_Issue_Date_Update_TextBox.Text = Convert.ToString(person.Visa_Issue_Date);
            Visa_Expire_Date_Update_TextBox.Text = Convert.ToString(person.Visa_Expire_Date);
            Visa_Selected_Value_B1_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B1);
            Visa_Selected_Value_B2_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B2);
            Visa_Selected_Value_K1_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_K1);
            Visa_Selected_Value_K3_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_K3);
            Visa_Selected_Value_L1_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_L1);
            Visa_Selected_Value_L2_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_L2);
            Visa_Selected_Value_H4_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H4);
            Visa_Selected_Value_F1_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_F1);
            Visa_Selected_Value_J1_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_J1);
            Visa_Selected_Value_M1_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_M1);
            Visa_Selected_Value_H_1B_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H_1B);
            Visa_Selected_Value_H_2B_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H_2B);
            Visa_Selected_Value_B_2_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B_2);
            Visa_Selected_Value_Schengen_Update_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_Schengen);
            Perm_Resident_Alien_Resid_Date_Update_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Resid_Date);
            Perm_Resident_Alien_Expire_Date_Update_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Expire_Date);
            Perm_Resident_Alien_A_number_Update_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_A_number);
            Perm_Resident_Alien_USCIS_number_Update_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_USCIS_number);
            Perm_Resident_Alien_Birth_Country_Update_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Birth_Country);
            Perm_Resident_Alien_Category_Update_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Category);
            Driver_State_ID_Update_TextBox.Text = Convert.ToString(person.Driver_State_ID);
            Citizenship_Update_TextBox.Text = Convert.ToString(person.Citizenship);
            Marital_Status_Update_TextBox.Text = Convert.ToString(person.Marital_Status);
            Minor_Children_Update_TextBox.Text = Convert.ToString(person.Minor_Children);
            return person;
        }
        public person person_selectForDelete(int ID)
        {
            person = person.Select(ID);
            person_id_Delete_TextBox.Text = Convert.ToString(person.person_id);
            Resource_ID_Delete_TextBox.Text = Convert.ToString(person.Resource_ID);
            address_id_Delete_TextBox.Text = Convert.ToString(person.address_id);
            address_id2_Delete_TextBox.Text = Convert.ToString(person.address_id2);
            birthdate_Delete_TextBox.Text = Convert.ToString(person.birthdate);
            certification_number_Delete_TextBox.Text = Convert.ToString(person.certification_number);
            f_name_Delete_TextBox.Text = Convert.ToString(person.f_name);
            m_initial_Delete_TextBox.Text = Convert.ToString(person.m_initial);
            l_name_Delete_TextBox.Text = Convert.ToString(person.l_name);
            gender_Delete_TextBox.Text = Convert.ToString(person.gender);
            person_type_Delete_TextBox.Text = Convert.ToString(person.person_type);
            phone_primary_Delete_TextBox.Text = Convert.ToString(person.phone_primary);
            phone_secondary_Delete_TextBox.Text = Convert.ToString(person.phone_secondary);
            email_Delete_TextBox.Text = Convert.ToString(person.email);
            ssn_Delete_TextBox.Text = Convert.ToString(person.ssn);
            Maiden_Name_Delete_TextBox.Text = Convert.ToString(person.Maiden_Name);
            Visa_Issue_Date_Delete_TextBox.Text = Convert.ToString(person.Visa_Issue_Date);
            Visa_Expire_Date_Delete_TextBox.Text = Convert.ToString(person.Visa_Expire_Date);
            Visa_Selected_Value_B1_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B1);
            Visa_Selected_Value_B2_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B2);
            Visa_Selected_Value_K1_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_K1);
            Visa_Selected_Value_K3_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_K3);
            Visa_Selected_Value_L1_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_L1);
            Visa_Selected_Value_L2_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_L2);
            Visa_Selected_Value_H4_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H4);
            Visa_Selected_Value_F1_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_F1);
            Visa_Selected_Value_J1_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_J1);
            Visa_Selected_Value_M1_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_M1);
            Visa_Selected_Value_H_1B_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H_1B);
            Visa_Selected_Value_H_2B_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_H_2B);
            Visa_Selected_Value_B_2_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_B_2);
            Visa_Selected_Value_Schengen_Delete_TextBox.Text = Convert.ToString(person.Visa_Selected_Value_Schengen);
            Perm_Resident_Alien_Resid_Date_Delete_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Resid_Date);
            Perm_Resident_Alien_Expire_Date_Delete_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Expire_Date);
            Perm_Resident_Alien_A_number_Delete_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_A_number);
            Perm_Resident_Alien_USCIS_number_Delete_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_USCIS_number);
            Perm_Resident_Alien_Birth_Country_Delete_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Birth_Country);
            Perm_Resident_Alien_Category_Delete_TextBox.Text = Convert.ToString(person.Perm_Resident_Alien_Category);
            Driver_State_ID_Delete_TextBox.Text = Convert.ToString(person.Driver_State_ID);
            Citizenship_Delete_TextBox.Text = Convert.ToString(person.Citizenship);
            Marital_Status_Delete_TextBox.Text = Convert.ToString(person.Marital_Status);
            Minor_Children_Delete_TextBox.Text = Convert.ToString(person.Minor_Children);
            return person;
        }
        //Database CRUD Call Functions
        public person person_insert()
        {
            person.Resource_ID = Convert.ToInt32(Resource_ID_Insert_TextBox.Text);
            person.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            person.address_id2 = Convert.ToInt32(address_id2_Insert_TextBox.Text);
            person.birthdate = Convert.ToDateTime(birthdate_Insert_TextBox.Text);
            person.certification_number = certification_number_Insert_TextBox.Text;
            person.f_name = f_name_Insert_TextBox.Text;
            person.m_initial = m_initial_Insert_TextBox.Text;
            person.l_name = l_name_Insert_TextBox.Text;
            person.gender = gender_Insert_TextBox.Text;
            person.person_type = person_type_Insert_TextBox.Text;
            person.phone_primary = phone_primary_Insert_TextBox.Text;
            person.phone_secondary = phone_secondary_Insert_TextBox.Text;
            person.email = email_Insert_TextBox.Text;
            person.ssn = Convert.ToInt32(ssn_Insert_TextBox.Text);
            person.Maiden_Name = Maiden_Name_Insert_TextBox.Text;
            person.Visa_Issue_Date = Convert.ToDateTime(Visa_Issue_Date_Insert_TextBox.Text);
            person.Visa_Expire_Date = Convert.ToDateTime(Visa_Expire_Date_Insert_TextBox.Text);
            person.Visa_Selected_Value_B1 = Convert.ToInt32(Visa_Selected_Value_B1_Insert_TextBox.Text);
            person.Visa_Selected_Value_B2 = Convert.ToInt32(Visa_Selected_Value_B2_Insert_TextBox.Text);
            person.Visa_Selected_Value_K1 = Convert.ToInt32(Visa_Selected_Value_K1_Insert_TextBox.Text);
            person.Visa_Selected_Value_K3 = Convert.ToInt32(Visa_Selected_Value_K3_Insert_TextBox.Text);
            person.Visa_Selected_Value_L1 = Convert.ToInt32(Visa_Selected_Value_L1_Insert_TextBox.Text);
            person.Visa_Selected_Value_L2 = Convert.ToInt32(Visa_Selected_Value_L2_Insert_TextBox.Text);
            person.Visa_Selected_Value_H4 = Convert.ToInt32(Visa_Selected_Value_H4_Insert_TextBox.Text);
            person.Visa_Selected_Value_F1 = Convert.ToInt32(Visa_Selected_Value_F1_Insert_TextBox.Text);
            person.Visa_Selected_Value_J1 = Convert.ToInt32(Visa_Selected_Value_J1_Insert_TextBox.Text);
            person.Visa_Selected_Value_M1 = Convert.ToInt32(Visa_Selected_Value_M1_Insert_TextBox.Text);
            person.Visa_Selected_Value_H_1B = Convert.ToInt32(Visa_Selected_Value_H_1B_Insert_TextBox.Text);
            person.Visa_Selected_Value_H_2B = Convert.ToInt32(Visa_Selected_Value_H_2B_Insert_TextBox.Text);
            person.Visa_Selected_Value_B_2 = Convert.ToInt32(Visa_Selected_Value_B_2_Insert_TextBox.Text);
            person.Visa_Selected_Value_Schengen = Convert.ToInt32(Visa_Selected_Value_Schengen_Insert_TextBox.Text);
            person.Perm_Resident_Alien_Resid_Date = Convert.ToDateTime(Perm_Resident_Alien_Resid_Date_Insert_TextBox.Text);
            person.Perm_Resident_Alien_Expire_Date = Convert.ToDateTime(Perm_Resident_Alien_Expire_Date_Insert_TextBox.Text);
            person.Perm_Resident_Alien_A_number = Convert.ToInt32(Perm_Resident_Alien_A_number_Insert_TextBox.Text);
            person.Perm_Resident_Alien_USCIS_number = Convert.ToInt32(Perm_Resident_Alien_USCIS_number_Insert_TextBox.Text);
            person.Perm_Resident_Alien_Birth_Country = Perm_Resident_Alien_Birth_Country_Insert_TextBox.Text;
            person.Perm_Resident_Alien_Category = Perm_Resident_Alien_Category_Insert_TextBox.Text;
            person.Driver_State_ID = Driver_State_ID_Insert_TextBox.Text;
            person.Citizenship = Citizenship_Insert_TextBox.Text;
            person.Marital_Status = Marital_Status_Insert_TextBox.Text;
            person.Minor_Children = Convert.ToInt32(Minor_Children_Insert_TextBox.Text);
            person = person.Insert(person);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return person;
        }
        public person person_update(int ID)
        {
            person = person.Select(ID);
            person.person_id = Convert.ToInt32(Update_GridView.SelectedValue);
            person.Resource_ID = Convert.ToInt32(Resource_ID_Update_TextBox.Text);
            person.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            person.address_id2 = Convert.ToInt32(address_id2_Update_TextBox.Text);
            person.birthdate = Convert.ToDateTime(birthdate_Update_TextBox.Text);
            person.certification_number = certification_number_Update_TextBox.Text;
            person.f_name = f_name_Update_TextBox.Text;
            person.m_initial = m_initial_Update_TextBox.Text;
            person.l_name = l_name_Update_TextBox.Text;
            person.gender = gender_Update_TextBox.Text;
            person.person_type = person_type_Update_TextBox.Text;
            person.phone_primary = phone_primary_Update_TextBox.Text;
            person.phone_secondary = phone_secondary_Update_TextBox.Text;
            person.email = email_Update_TextBox.Text;
            person.ssn = Convert.ToInt32(ssn_Update_TextBox.Text);
            person.Maiden_Name = Maiden_Name_Update_TextBox.Text;
            person.Visa_Issue_Date = Convert.ToDateTime(Visa_Issue_Date_Update_TextBox.Text);
            person.Visa_Expire_Date = Convert.ToDateTime(Visa_Expire_Date_Update_TextBox.Text);
            person.Visa_Selected_Value_B1 = Convert.ToInt32(Visa_Selected_Value_B1_Update_TextBox.Text);
            person.Visa_Selected_Value_B2 = Convert.ToInt32(Visa_Selected_Value_B2_Update_TextBox.Text);
            person.Visa_Selected_Value_K1 = Convert.ToInt32(Visa_Selected_Value_K1_Update_TextBox.Text);
            person.Visa_Selected_Value_K3 = Convert.ToInt32(Visa_Selected_Value_K3_Update_TextBox.Text);
            person.Visa_Selected_Value_L1 = Convert.ToInt32(Visa_Selected_Value_L1_Update_TextBox.Text);
            person.Visa_Selected_Value_L2 = Convert.ToInt32(Visa_Selected_Value_L2_Update_TextBox.Text);
            person.Visa_Selected_Value_H4 = Convert.ToInt32(Visa_Selected_Value_H4_Update_TextBox.Text);
            person.Visa_Selected_Value_F1 = Convert.ToInt32(Visa_Selected_Value_F1_Update_TextBox.Text);
            person.Visa_Selected_Value_J1 = Convert.ToInt32(Visa_Selected_Value_J1_Update_TextBox.Text);
            person.Visa_Selected_Value_M1 = Convert.ToInt32(Visa_Selected_Value_M1_Update_TextBox.Text);
            person.Visa_Selected_Value_H_1B = Convert.ToInt32(Visa_Selected_Value_H_1B_Update_TextBox.Text);
            person.Visa_Selected_Value_H_2B = Convert.ToInt32(Visa_Selected_Value_H_2B_Update_TextBox.Text);
            person.Visa_Selected_Value_B_2 = Convert.ToInt32(Visa_Selected_Value_B_2_Update_TextBox.Text);
            person.Visa_Selected_Value_Schengen = Convert.ToInt32(Visa_Selected_Value_Schengen_Update_TextBox.Text);
            person.Perm_Resident_Alien_Resid_Date = Convert.ToDateTime(Perm_Resident_Alien_Resid_Date_Update_TextBox.Text);
            person.Perm_Resident_Alien_Expire_Date = Convert.ToDateTime(Perm_Resident_Alien_Expire_Date_Update_TextBox.Text);
            person.Perm_Resident_Alien_A_number = Convert.ToInt32(Perm_Resident_Alien_A_number_Update_TextBox.Text);
            person.Perm_Resident_Alien_USCIS_number = Convert.ToInt32(Perm_Resident_Alien_USCIS_number_Update_TextBox.Text);
            person.Perm_Resident_Alien_Birth_Country = Perm_Resident_Alien_Birth_Country_Update_TextBox.Text;
            person.Perm_Resident_Alien_Category = Perm_Resident_Alien_Category_Update_TextBox.Text;
            person.Driver_State_ID = Driver_State_ID_Update_TextBox.Text;
            person.Citizenship = Citizenship_Update_TextBox.Text;
            person.Marital_Status = Marital_Status_Update_TextBox.Text;
            person.Minor_Children = Convert.ToInt32(Minor_Children_Update_TextBox.Text);
            person.Update(person);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return person;
        }
        public void person_delete(int ID)
        {
            person.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            person = person_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            person = person_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            person_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

