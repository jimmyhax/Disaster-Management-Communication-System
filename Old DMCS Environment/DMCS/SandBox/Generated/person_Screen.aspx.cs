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
public partial class person_Screen : System.Web.UI.Page
{
            public person person = new person();
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
        person = Insert_person_select(Convert.ToInt32(Insert_person_GridView.SelectedValue));
    }
    public person Insert_person_select(int ID)
    {
        person = person.Select(ID);
        Insert_Resource_ID_txt.Text = Convert.ToString(person.Resource_ID);
        Insert_address_id_txt.Text = Convert.ToString(person.address_id);
        Insert_address_id2_txt.Text = Convert.ToString(person.address_id2);
        Insert_birthdate_txt.Text = Convert.ToString(person.birthdate);
        Insert_certification_number_txt.Text = Convert.ToString(person.certification_number);
        Insert_f_name_txt.Text = Convert.ToString(person.f_name);
        Insert_m_initial_txt.Text = Convert.ToString(person.m_initial);
        Insert_l_name_txt.Text = Convert.ToString(person.l_name);
        Insert_gender_txt.Text = Convert.ToString(person.gender);
        Insert_person_type_txt.Text = Convert.ToString(person.person_type);
        Insert_phone_primary_txt.Text = Convert.ToString(person.phone_primary);
        Insert_phone_secondary_txt.Text = Convert.ToString(person.phone_secondary);
        Insert_email_txt.Text = Convert.ToString(person.email);
        Insert_ssn_txt.Text = Convert.ToString(person.ssn);
        Insert_Maiden_Name_txt.Text = Convert.ToString(person.Maiden_Name);
        Insert_Visa_Issue_Date_txt.Text = Convert.ToString(person.Visa_Issue_Date);
        Insert_Visa_Expire_Date_txt.Text = Convert.ToString(person.Visa_Expire_Date);
        Insert_Visa_Selected_Value_B1_txt.Text = Convert.ToString(person.Visa_Selected_Value_B1);
        Insert_Visa_Selected_Value_B2_txt.Text = Convert.ToString(person.Visa_Selected_Value_B2);
        Insert_Visa_Selected_Value_K1_txt.Text = Convert.ToString(person.Visa_Selected_Value_K1);
        Insert_Visa_Selected_Value_K3_txt.Text = Convert.ToString(person.Visa_Selected_Value_K3);
        Insert_Visa_Selected_Value_L1_txt.Text = Convert.ToString(person.Visa_Selected_Value_L1);
        Insert_Visa_Selected_Value_L2_txt.Text = Convert.ToString(person.Visa_Selected_Value_L2);
        Insert_Visa_Selected_Value_H4_txt.Text = Convert.ToString(person.Visa_Selected_Value_H4);
        Insert_Visa_Selected_Value_F1_txt.Text = Convert.ToString(person.Visa_Selected_Value_F1);
        Insert_Visa_Selected_Value_J1_txt.Text = Convert.ToString(person.Visa_Selected_Value_J1);
        Insert_Visa_Selected_Value_M1_txt.Text = Convert.ToString(person.Visa_Selected_Value_M1);
        Insert_Visa_Selected_Value_H_1B_txt.Text = Convert.ToString(person.Visa_Selected_Value_H_1B);
        Insert_Visa_Selected_Value_H_2B_txt.Text = Convert.ToString(person.Visa_Selected_Value_H_2B);
        Insert_Visa_Selected_Value_B_2_txt.Text = Convert.ToString(person.Visa_Selected_Value_B_2);
        Insert_Visa_Selected_Value_Schengen_txt.Text = Convert.ToString(person.Visa_Selected_Value_Schengen);
        Insert_Perm_Resident_Alien_Resid_Date_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Resid_Date);
        Insert_Perm_Resident_Alien_Expire_Date_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Expire_Date);
        Insert_Perm_Resident_Alien_A_number_txt.Text = Convert.ToString(person.Perm_Resident_Alien_A_number);
        Insert_Perm_Resident_Alien_USCIS_number_txt.Text = Convert.ToString(person.Perm_Resident_Alien_USCIS_number);
        Insert_Perm_Resident_Alien_Birth_Country_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Birth_Country);
        Insert_Perm_Resident_Alien_Category_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Category);
        Insert_Driver_State_ID_txt.Text = Convert.ToString(person.Driver_State_ID);
        Insert_Citizenship_txt.Text = Convert.ToString(person.Citizenship);
        Insert_Marital_Status_txt.Text = Convert.ToString(person.Marital_Status);
        Insert_Minor_Children_txt.Text = Convert.ToString(person.Minor_Children);
        return person;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        person = person_insert();
    }
    public person person_insert()
    {
        person.Resource_ID = Convert.ToInt32(Insert_Resource_ID_txt.Text);
        person.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        person.address_id2 = Convert.ToInt32(Insert_address_id2_txt.Text);
        person.birthdate = Convert.ToDateTime(Insert_birthdate_txt.Text);
        person.certification_number = Insert_certification_number_txt.Text;
        person.f_name = Insert_f_name_txt.Text;
        person.m_initial = Insert_m_initial_txt.Text;
        person.l_name = Insert_l_name_txt.Text;
        person.gender = Insert_gender_txt.Text;
        person.person_type = Insert_person_type_txt.Text;
        person.phone_primary = Insert_phone_primary_txt.Text;
        person.phone_secondary = Insert_phone_secondary_txt.Text;
        person.email = Insert_email_txt.Text;
        person.ssn = Convert.ToInt32(Insert_ssn_txt.Text);
        person.Maiden_Name = Insert_Maiden_Name_txt.Text;
        person.Visa_Issue_Date = Convert.ToDateTime(Insert_Visa_Issue_Date_txt.Text);
        person.Visa_Expire_Date = Convert.ToDateTime(Insert_Visa_Expire_Date_txt.Text);
        person.Visa_Selected_Value_B1 = Convert.ToInt32(Insert_Visa_Selected_Value_B1_txt.Text);
        person.Visa_Selected_Value_B2 = Convert.ToInt32(Insert_Visa_Selected_Value_B2_txt.Text);
        person.Visa_Selected_Value_K1 = Convert.ToInt32(Insert_Visa_Selected_Value_K1_txt.Text);
        person.Visa_Selected_Value_K3 = Convert.ToInt32(Insert_Visa_Selected_Value_K3_txt.Text);
        person.Visa_Selected_Value_L1 = Convert.ToInt32(Insert_Visa_Selected_Value_L1_txt.Text);
        person.Visa_Selected_Value_L2 = Convert.ToInt32(Insert_Visa_Selected_Value_L2_txt.Text);
        person.Visa_Selected_Value_H4 = Convert.ToInt32(Insert_Visa_Selected_Value_H4_txt.Text);
        person.Visa_Selected_Value_F1 = Convert.ToInt32(Insert_Visa_Selected_Value_F1_txt.Text);
        person.Visa_Selected_Value_J1 = Convert.ToInt32(Insert_Visa_Selected_Value_J1_txt.Text);
        person.Visa_Selected_Value_M1 = Convert.ToInt32(Insert_Visa_Selected_Value_M1_txt.Text);
        person.Visa_Selected_Value_H_1B = Convert.ToInt32(Insert_Visa_Selected_Value_H_1B_txt.Text);
        person.Visa_Selected_Value_H_2B = Convert.ToInt32(Insert_Visa_Selected_Value_H_2B_txt.Text);
        person.Visa_Selected_Value_B_2 = Convert.ToInt32(Insert_Visa_Selected_Value_B_2_txt.Text);
        person.Visa_Selected_Value_Schengen = Convert.ToInt32(Insert_Visa_Selected_Value_Schengen_txt.Text);
        person.Perm_Resident_Alien_Resid_Date = Convert.ToDateTime(Insert_Perm_Resident_Alien_Resid_Date_txt.Text);
        person.Perm_Resident_Alien_Expire_Date = Convert.ToDateTime(Insert_Perm_Resident_Alien_Expire_Date_txt.Text);
        person.Perm_Resident_Alien_A_number = Convert.ToInt32(Insert_Perm_Resident_Alien_A_number_txt.Text);
        person.Perm_Resident_Alien_USCIS_number = Convert.ToInt32(Insert_Perm_Resident_Alien_USCIS_number_txt.Text);
        person.Perm_Resident_Alien_Birth_Country = Insert_Perm_Resident_Alien_Birth_Country_txt.Text;
        person.Perm_Resident_Alien_Category = Insert_Perm_Resident_Alien_Category_txt.Text;
        person.Driver_State_ID = Insert_Driver_State_ID_txt.Text;
        person.Citizenship = Insert_Citizenship_txt.Text;
        person.Marital_Status = Insert_Marital_Status_txt.Text;
        person.Minor_Children = Convert.ToInt32(Insert_Minor_Children_txt.Text);
        person = person.Insert(person);
        Insert_person_GridView.DataBind();
        Update_person_GridView.DataBind();
        Delete_person_GridView.DataBind();
        return person;
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
        person = Update_person_select(Convert.ToInt32(Update_person_GridView.SelectedValue));
    }
    public person Update_person_select(int ID)
    {
        person = person.Select(ID);
        Update_person_id_txt.Text = Convert.ToString(person.person_id);
        Update_Resource_ID_txt.Text = Convert.ToString(person.Resource_ID);
        Update_address_id_txt.Text = Convert.ToString(person.address_id);
        Update_address_id2_txt.Text = Convert.ToString(person.address_id2);
        Update_birthdate_txt.Text = Convert.ToString(person.birthdate);
        Update_certification_number_txt.Text = Convert.ToString(person.certification_number);
        Update_f_name_txt.Text = Convert.ToString(person.f_name);
        Update_m_initial_txt.Text = Convert.ToString(person.m_initial);
        Update_l_name_txt.Text = Convert.ToString(person.l_name);
        Update_gender_txt.Text = Convert.ToString(person.gender);
        Update_person_type_txt.Text = Convert.ToString(person.person_type);
        Update_phone_primary_txt.Text = Convert.ToString(person.phone_primary);
        Update_phone_secondary_txt.Text = Convert.ToString(person.phone_secondary);
        Update_email_txt.Text = Convert.ToString(person.email);
        Update_ssn_txt.Text = Convert.ToString(person.ssn);
        Update_Maiden_Name_txt.Text = Convert.ToString(person.Maiden_Name);
        Update_Visa_Issue_Date_txt.Text = Convert.ToString(person.Visa_Issue_Date);
        Update_Visa_Expire_Date_txt.Text = Convert.ToString(person.Visa_Expire_Date);
        Update_Visa_Selected_Value_B1_txt.Text = Convert.ToString(person.Visa_Selected_Value_B1);
        Update_Visa_Selected_Value_B2_txt.Text = Convert.ToString(person.Visa_Selected_Value_B2);
        Update_Visa_Selected_Value_K1_txt.Text = Convert.ToString(person.Visa_Selected_Value_K1);
        Update_Visa_Selected_Value_K3_txt.Text = Convert.ToString(person.Visa_Selected_Value_K3);
        Update_Visa_Selected_Value_L1_txt.Text = Convert.ToString(person.Visa_Selected_Value_L1);
        Update_Visa_Selected_Value_L2_txt.Text = Convert.ToString(person.Visa_Selected_Value_L2);
        Update_Visa_Selected_Value_H4_txt.Text = Convert.ToString(person.Visa_Selected_Value_H4);
        Update_Visa_Selected_Value_F1_txt.Text = Convert.ToString(person.Visa_Selected_Value_F1);
        Update_Visa_Selected_Value_J1_txt.Text = Convert.ToString(person.Visa_Selected_Value_J1);
        Update_Visa_Selected_Value_M1_txt.Text = Convert.ToString(person.Visa_Selected_Value_M1);
        Update_Visa_Selected_Value_H_1B_txt.Text = Convert.ToString(person.Visa_Selected_Value_H_1B);
        Update_Visa_Selected_Value_H_2B_txt.Text = Convert.ToString(person.Visa_Selected_Value_H_2B);
        Update_Visa_Selected_Value_B_2_txt.Text = Convert.ToString(person.Visa_Selected_Value_B_2);
        Update_Visa_Selected_Value_Schengen_txt.Text = Convert.ToString(person.Visa_Selected_Value_Schengen);
        Update_Perm_Resident_Alien_Resid_Date_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Resid_Date);
        Update_Perm_Resident_Alien_Expire_Date_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Expire_Date);
        Update_Perm_Resident_Alien_A_number_txt.Text = Convert.ToString(person.Perm_Resident_Alien_A_number);
        Update_Perm_Resident_Alien_USCIS_number_txt.Text = Convert.ToString(person.Perm_Resident_Alien_USCIS_number);
        Update_Perm_Resident_Alien_Birth_Country_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Birth_Country);
        Update_Perm_Resident_Alien_Category_txt.Text = Convert.ToString(person.Perm_Resident_Alien_Category);
        Update_Driver_State_ID_txt.Text = Convert.ToString(person.Driver_State_ID);
        Update_Citizenship_txt.Text = Convert.ToString(person.Citizenship);
        Update_Marital_Status_txt.Text = Convert.ToString(person.Marital_Status);
        Update_Minor_Children_txt.Text = Convert.ToString(person.Minor_Children);
        return person;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        person = person_update(Convert.ToInt32(Update_person_GridView.SelectedValue));
    }
    public person person_update(int ID)
    {
        person = person.Select(ID);
        person.person_id = Convert.ToInt32(Update_person_id_txt.Text);
        person.Resource_ID = Convert.ToInt32(Update_Resource_ID_txt.Text);
        person.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        person.address_id2 = Convert.ToInt32(Update_address_id2_txt.Text);
        person.birthdate = Convert.ToDateTime(Update_birthdate_txt.Text);
        person.certification_number = Update_certification_number_txt.Text;
        person.f_name = Update_f_name_txt.Text;
        person.m_initial = Update_m_initial_txt.Text;
        person.l_name = Update_l_name_txt.Text;
        person.gender = Update_gender_txt.Text;
        person.person_type = Update_person_type_txt.Text;
        person.phone_primary = Update_phone_primary_txt.Text;
        person.phone_secondary = Update_phone_secondary_txt.Text;
        person.email = Update_email_txt.Text;
        person.ssn = Convert.ToInt32(Update_ssn_txt.Text);
        person.Maiden_Name = Update_Maiden_Name_txt.Text;
        person.Visa_Issue_Date = Convert.ToDateTime(Update_Visa_Issue_Date_txt.Text);
        person.Visa_Expire_Date = Convert.ToDateTime(Update_Visa_Expire_Date_txt.Text);
        person.Visa_Selected_Value_B1 = Convert.ToInt32(Update_Visa_Selected_Value_B1_txt.Text);
        person.Visa_Selected_Value_B2 = Convert.ToInt32(Update_Visa_Selected_Value_B2_txt.Text);
        person.Visa_Selected_Value_K1 = Convert.ToInt32(Update_Visa_Selected_Value_K1_txt.Text);
        person.Visa_Selected_Value_K3 = Convert.ToInt32(Update_Visa_Selected_Value_K3_txt.Text);
        person.Visa_Selected_Value_L1 = Convert.ToInt32(Update_Visa_Selected_Value_L1_txt.Text);
        person.Visa_Selected_Value_L2 = Convert.ToInt32(Update_Visa_Selected_Value_L2_txt.Text);
        person.Visa_Selected_Value_H4 = Convert.ToInt32(Update_Visa_Selected_Value_H4_txt.Text);
        person.Visa_Selected_Value_F1 = Convert.ToInt32(Update_Visa_Selected_Value_F1_txt.Text);
        person.Visa_Selected_Value_J1 = Convert.ToInt32(Update_Visa_Selected_Value_J1_txt.Text);
        person.Visa_Selected_Value_M1 = Convert.ToInt32(Update_Visa_Selected_Value_M1_txt.Text);
        person.Visa_Selected_Value_H_1B = Convert.ToInt32(Update_Visa_Selected_Value_H_1B_txt.Text);
        person.Visa_Selected_Value_H_2B = Convert.ToInt32(Update_Visa_Selected_Value_H_2B_txt.Text);
        person.Visa_Selected_Value_B_2 = Convert.ToInt32(Update_Visa_Selected_Value_B_2_txt.Text);
        person.Visa_Selected_Value_Schengen = Convert.ToInt32(Update_Visa_Selected_Value_Schengen_txt.Text);
        person.Perm_Resident_Alien_Resid_Date = Convert.ToDateTime(Update_Perm_Resident_Alien_Resid_Date_txt.Text);
        person.Perm_Resident_Alien_Expire_Date = Convert.ToDateTime(Update_Perm_Resident_Alien_Expire_Date_txt.Text);
        person.Perm_Resident_Alien_A_number = Convert.ToInt32(Update_Perm_Resident_Alien_A_number_txt.Text);
        person.Perm_Resident_Alien_USCIS_number = Convert.ToInt32(Update_Perm_Resident_Alien_USCIS_number_txt.Text);
        person.Perm_Resident_Alien_Birth_Country = Update_Perm_Resident_Alien_Birth_Country_txt.Text;
        person.Perm_Resident_Alien_Category = Update_Perm_Resident_Alien_Category_txt.Text;
        person.Driver_State_ID = Update_Driver_State_ID_txt.Text;
        person.Citizenship = Update_Citizenship_txt.Text;
        person.Marital_Status = Update_Marital_Status_txt.Text;
        person.Minor_Children = Convert.ToInt32(Update_Minor_Children_txt.Text);
        person.Update(person);
        Insert_person_GridView.DataBind();
        Update_person_GridView.DataBind();
        Delete_person_GridView.DataBind();
        return person;
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
        person = Delete_person_select(Convert.ToInt32(Delete_person_GridView.SelectedValue));
    }
    public person Delete_person_select(int ID)
    {
        person = person.Select(ID);
        Delete_person_id_txt_lbl.Text = Convert.ToString(person.person_id);
        Delete_Resource_ID_txt_lbl.Text = Convert.ToString(person.Resource_ID);
        Delete_address_id_txt_lbl.Text = Convert.ToString(person.address_id);
        Delete_address_id2_txt_lbl.Text = Convert.ToString(person.address_id2);
        Delete_birthdate_txt_lbl.Text = Convert.ToString(person.birthdate);
        Delete_certification_number_txt_lbl.Text = Convert.ToString(person.certification_number);
        Delete_f_name_txt_lbl.Text = Convert.ToString(person.f_name);
        Delete_m_initial_txt_lbl.Text = Convert.ToString(person.m_initial);
        Delete_l_name_txt_lbl.Text = Convert.ToString(person.l_name);
        Delete_gender_txt_lbl.Text = Convert.ToString(person.gender);
        Delete_person_type_txt_lbl.Text = Convert.ToString(person.person_type);
        Delete_phone_primary_txt_lbl.Text = Convert.ToString(person.phone_primary);
        Delete_phone_secondary_txt_lbl.Text = Convert.ToString(person.phone_secondary);
        Delete_email_txt_lbl.Text = Convert.ToString(person.email);
        Delete_ssn_txt_lbl.Text = Convert.ToString(person.ssn);
        Delete_Maiden_Name_txt_lbl.Text = Convert.ToString(person.Maiden_Name);
        Delete_Visa_Issue_Date_txt_lbl.Text = Convert.ToString(person.Visa_Issue_Date);
        Delete_Visa_Expire_Date_txt_lbl.Text = Convert.ToString(person.Visa_Expire_Date);
        Delete_Visa_Selected_Value_B1_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_B1);
        Delete_Visa_Selected_Value_B2_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_B2);
        Delete_Visa_Selected_Value_K1_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_K1);
        Delete_Visa_Selected_Value_K3_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_K3);
        Delete_Visa_Selected_Value_L1_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_L1);
        Delete_Visa_Selected_Value_L2_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_L2);
        Delete_Visa_Selected_Value_H4_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_H4);
        Delete_Visa_Selected_Value_F1_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_F1);
        Delete_Visa_Selected_Value_J1_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_J1);
        Delete_Visa_Selected_Value_M1_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_M1);
        Delete_Visa_Selected_Value_H_1B_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_H_1B);
        Delete_Visa_Selected_Value_H_2B_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_H_2B);
        Delete_Visa_Selected_Value_B_2_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_B_2);
        Delete_Visa_Selected_Value_Schengen_txt_lbl.Text = Convert.ToString(person.Visa_Selected_Value_Schengen);
        Delete_Perm_Resident_Alien_Resid_Date_txt_lbl.Text = Convert.ToString(person.Perm_Resident_Alien_Resid_Date);
        Delete_Perm_Resident_Alien_Expire_Date_txt_lbl.Text = Convert.ToString(person.Perm_Resident_Alien_Expire_Date);
        Delete_Perm_Resident_Alien_A_number_txt_lbl.Text = Convert.ToString(person.Perm_Resident_Alien_A_number);
        Delete_Perm_Resident_Alien_USCIS_number_txt_lbl.Text = Convert.ToString(person.Perm_Resident_Alien_USCIS_number);
        Delete_Perm_Resident_Alien_Birth_Country_txt_lbl.Text = Convert.ToString(person.Perm_Resident_Alien_Birth_Country);
        Delete_Perm_Resident_Alien_Category_txt_lbl.Text = Convert.ToString(person.Perm_Resident_Alien_Category);
        Delete_Driver_State_ID_txt_lbl.Text = Convert.ToString(person.Driver_State_ID);
        Delete_Citizenship_txt_lbl.Text = Convert.ToString(person.Citizenship);
        Delete_Marital_Status_txt_lbl.Text = Convert.ToString(person.Marital_Status);
        Delete_Minor_Children_txt_lbl.Text = Convert.ToString(person.Minor_Children);
        return person;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        person_delete(Convert.ToInt32(Delete_person_GridView.SelectedValue));
    }
    public void person_delete(int ID)
    {
        person.Delete(ID);
        Insert_person_GridView.DataBind();
        Update_person_GridView.DataBind();
        Delete_person_GridView.DataBind();
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

