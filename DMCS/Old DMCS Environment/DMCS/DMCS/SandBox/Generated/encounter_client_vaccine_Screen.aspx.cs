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
public partial class encounter_client_vaccine_Screen : System.Web.UI.Page
{
            public encounter_client_vaccine encounter_client_vaccine = new encounter_client_vaccine();
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
        encounter_client_vaccine = Insert_encounter_client_vaccine_select(Convert.ToInt32(Insert_encounter_client_vaccine_GridView.SelectedValue));
    }
    public encounter_client_vaccine Insert_encounter_client_vaccine_select(int ID)
    {
        encounter_client_vaccine = encounter_client_vaccine.Select(ID);
        Insert_vaccine_id_txt.Text = Convert.ToString(encounter_client_vaccine.vaccine_id);
        Insert_current_client_medicine_txt.Text = Convert.ToString(encounter_client_vaccine.current_client_medicine);
        Insert_assistance_txt.Text = Convert.ToString(encounter_client_vaccine.assistance);
        Insert_quantity_txt.Text = Convert.ToString(encounter_client_vaccine.quantity);
        Insert_Under_six_months_old_txt.Text = Convert.ToString(encounter_client_vaccine.Under_six_months_old);
        Insert_pregnant_txt.Text = Convert.ToString(encounter_client_vaccine.pregnant);
        Insert_children_txt.Text = Convert.ToString(encounter_client_vaccine.children);
        Insert_occupation_txt.Text = Convert.ToString(encounter_client_vaccine.occupation);
        Insert_chronic_disease_txt.Text = Convert.ToString(encounter_client_vaccine.chronic_disease);
        Insert_qualify_txt.Text = Convert.ToString(encounter_client_vaccine.qualify);
        Insert_dose_date1_txt.Text = Convert.ToString(encounter_client_vaccine.dose_date1);
        Insert_dose_date2_txt.Text = Convert.ToString(encounter_client_vaccine.dose_date2);
        Insert_adult_consent_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id=" + ID);
        Insert_guardian_consent_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id=" + ID);
        Insert_vaccine_admin_txt.Text = Convert.ToString(encounter_client_vaccine.vaccine_admin);
        Insert_guardian_f_name_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_f_name);
        Insert_guardian_l_name_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_l_name);
        Insert_guardian_mi_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_mi);
        Insert_guardian_phone_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_phone);
        Insert_adult_consent_date_txt.Text = Convert.ToString(encounter_client_vaccine.adult_consent_date);
        Insert_guard_consent_date_txt.Text = Convert.ToString(encounter_client_vaccine.guard_consent_date);
        Insert_dose_form1_txt.Text = Convert.ToString(encounter_client_vaccine.dose_form1);
        Insert_dose_form2_txt.Text = Convert.ToString(encounter_client_vaccine.dose_form2);
        return encounter_client_vaccine;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        encounter_client_vaccine = encounter_client_vaccine_insert();
    }
    public encounter_client_vaccine encounter_client_vaccine_insert()
    {
        encounter_client_vaccine.vaccine_id = Convert.ToInt32(Insert_vaccine_id_txt.Text);
        encounter_client_vaccine.current_client_medicine = Insert_current_client_medicine_txt.Text;
        encounter_client_vaccine.assistance = Insert_assistance_txt.Text;
        encounter_client_vaccine.quantity = Convert.ToInt32(Insert_quantity_txt.Text);
        encounter_client_vaccine.Under_six_months_old = Insert_Under_six_months_old_txt.Text;
        encounter_client_vaccine.pregnant = Insert_pregnant_txt.Text;
        encounter_client_vaccine.children = Convert.ToInt32(Insert_children_txt.Text);
        encounter_client_vaccine.occupation = Insert_occupation_txt.Text;
        encounter_client_vaccine.chronic_disease = Insert_chronic_disease_txt.Text;
        encounter_client_vaccine.qualify = Insert_qualify_txt.Text;
        encounter_client_vaccine.dose_date1 = Convert.ToDateTime(Insert_dose_date1_txt.Text);
        encounter_client_vaccine.dose_date2 = Convert.ToDateTime(Insert_dose_date2_txt.Text);
        byte[] uploaded_picture = Insert_adult_consent_FileUpload.FileBytes;
        encounter_client_vaccine.adult_consent = uploaded_picture;
        uploaded_picture = Insert_guardian_consent_FileUpload.FileBytes;
        encounter_client_vaccine.guardian_consent = uploaded_picture;
        encounter_client_vaccine.vaccine_admin = Convert.ToDateTime(Insert_vaccine_admin_txt.Text);
        encounter_client_vaccine.guardian_f_name = Insert_guardian_f_name_txt.Text;
        encounter_client_vaccine.guardian_l_name = Insert_guardian_l_name_txt.Text;
        encounter_client_vaccine.guardian_mi = Insert_guardian_mi_txt.Text;
        encounter_client_vaccine.guardian_phone = Insert_guardian_phone_txt.Text;
        encounter_client_vaccine.adult_consent_date = Convert.ToDateTime(Insert_adult_consent_date_txt.Text);
        encounter_client_vaccine.guard_consent_date = Convert.ToDateTime(Insert_guard_consent_date_txt.Text);
        encounter_client_vaccine.dose_form1 = Insert_dose_form1_txt.Text;
        encounter_client_vaccine.dose_form2 = Insert_dose_form2_txt.Text;
        encounter_client_vaccine = encounter_client_vaccine.Insert(encounter_client_vaccine);
        Insert_encounter_client_vaccine_GridView.DataBind();
        Update_encounter_client_vaccine_GridView.DataBind();
        Delete_encounter_client_vaccine_GridView.DataBind();
        return encounter_client_vaccine;
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
        encounter_client_vaccine = Update_encounter_client_vaccine_select(Convert.ToInt32(Update_encounter_client_vaccine_GridView.SelectedValue));
    }
    public encounter_client_vaccine Update_encounter_client_vaccine_select(int ID)
    {
        encounter_client_vaccine = encounter_client_vaccine.Select(ID);
        Update_encounter_id_txt.Text = Convert.ToString(encounter_client_vaccine.encounter_id);
        Update_vaccine_id_txt.Text = Convert.ToString(encounter_client_vaccine.vaccine_id);
        Update_current_client_medicine_txt.Text = Convert.ToString(encounter_client_vaccine.current_client_medicine);
        Update_assistance_txt.Text = Convert.ToString(encounter_client_vaccine.assistance);
        Update_quantity_txt.Text = Convert.ToString(encounter_client_vaccine.quantity);
        Update_Under_six_months_old_txt.Text = Convert.ToString(encounter_client_vaccine.Under_six_months_old);
        Update_pregnant_txt.Text = Convert.ToString(encounter_client_vaccine.pregnant);
        Update_children_txt.Text = Convert.ToString(encounter_client_vaccine.children);
        Update_occupation_txt.Text = Convert.ToString(encounter_client_vaccine.occupation);
        Update_chronic_disease_txt.Text = Convert.ToString(encounter_client_vaccine.chronic_disease);
        Update_qualify_txt.Text = Convert.ToString(encounter_client_vaccine.qualify);
        Update_dose_date1_txt.Text = Convert.ToString(encounter_client_vaccine.dose_date1);
        Update_dose_date2_txt.Text = Convert.ToString(encounter_client_vaccine.dose_date2);
        Update_adult_consent_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id=" + ID);
        Update_guardian_consent_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id=" + ID);
        Update_vaccine_admin_txt.Text = Convert.ToString(encounter_client_vaccine.vaccine_admin);
        Update_guardian_f_name_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_f_name);
        Update_guardian_l_name_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_l_name);
        Update_guardian_mi_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_mi);
        Update_guardian_phone_txt.Text = Convert.ToString(encounter_client_vaccine.guardian_phone);
        Update_adult_consent_date_txt.Text = Convert.ToString(encounter_client_vaccine.adult_consent_date);
        Update_guard_consent_date_txt.Text = Convert.ToString(encounter_client_vaccine.guard_consent_date);
        Update_dose_form1_txt.Text = Convert.ToString(encounter_client_vaccine.dose_form1);
        Update_dose_form2_txt.Text = Convert.ToString(encounter_client_vaccine.dose_form2);
        return encounter_client_vaccine;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        encounter_client_vaccine = encounter_client_vaccine_update(Convert.ToInt32(Update_encounter_client_vaccine_GridView.SelectedValue));
    }
    public encounter_client_vaccine encounter_client_vaccine_update(int ID)
    {
        encounter_client_vaccine = encounter_client_vaccine.Select(ID);
        encounter_client_vaccine.encounter_id = Convert.ToInt32(Update_encounter_id_txt.Text);
        encounter_client_vaccine.vaccine_id = Convert.ToInt32(Update_vaccine_id_txt.Text);
        encounter_client_vaccine.current_client_medicine = Update_current_client_medicine_txt.Text;
        encounter_client_vaccine.assistance = Update_assistance_txt.Text;
        encounter_client_vaccine.quantity = Convert.ToInt32(Update_quantity_txt.Text);
        encounter_client_vaccine.Under_six_months_old = Update_Under_six_months_old_txt.Text;
        encounter_client_vaccine.pregnant = Update_pregnant_txt.Text;
        encounter_client_vaccine.children = Convert.ToInt32(Update_children_txt.Text);
        encounter_client_vaccine.occupation = Update_occupation_txt.Text;
        encounter_client_vaccine.chronic_disease = Update_chronic_disease_txt.Text;
        encounter_client_vaccine.qualify = Update_qualify_txt.Text;
        encounter_client_vaccine.dose_date1 = Convert.ToDateTime(Update_dose_date1_txt.Text);
        encounter_client_vaccine.dose_date2 = Convert.ToDateTime(Update_dose_date2_txt.Text);
        byte[] uploaded_picture = Update_adult_consent_FileUpload.FileBytes;
        encounter_client_vaccine.adult_consent = uploaded_picture;
        uploaded_picture = Update_guardian_consent_FileUpload.FileBytes;
        encounter_client_vaccine.guardian_consent = uploaded_picture;
        encounter_client_vaccine.vaccine_admin = Convert.ToDateTime(Update_vaccine_admin_txt.Text);
        encounter_client_vaccine.guardian_f_name = Update_guardian_f_name_txt.Text;
        encounter_client_vaccine.guardian_l_name = Update_guardian_l_name_txt.Text;
        encounter_client_vaccine.guardian_mi = Update_guardian_mi_txt.Text;
        encounter_client_vaccine.guardian_phone = Update_guardian_phone_txt.Text;
        encounter_client_vaccine.adult_consent_date = Convert.ToDateTime(Update_adult_consent_date_txt.Text);
        encounter_client_vaccine.guard_consent_date = Convert.ToDateTime(Update_guard_consent_date_txt.Text);
        encounter_client_vaccine.dose_form1 = Update_dose_form1_txt.Text;
        encounter_client_vaccine.dose_form2 = Update_dose_form2_txt.Text;
        encounter_client_vaccine.Update(encounter_client_vaccine);
        Insert_encounter_client_vaccine_GridView.DataBind();
        Update_encounter_client_vaccine_GridView.DataBind();
        Delete_encounter_client_vaccine_GridView.DataBind();
        return encounter_client_vaccine;
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
        encounter_client_vaccine = Delete_encounter_client_vaccine_select(Convert.ToInt32(Delete_encounter_client_vaccine_GridView.SelectedValue));
    }
    public encounter_client_vaccine Delete_encounter_client_vaccine_select(int ID)
    {
        encounter_client_vaccine = encounter_client_vaccine.Select(ID);
        Delete_encounter_id_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.encounter_id);
        Delete_vaccine_id_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.vaccine_id);
        Delete_current_client_medicine_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.current_client_medicine);
        Delete_assistance_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.assistance);
        Delete_quantity_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.quantity);
        Delete_Under_six_months_old_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.Under_six_months_old);
        Delete_pregnant_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.pregnant);
        Delete_children_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.children);
        Delete_occupation_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.occupation);
        Delete_chronic_disease_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.chronic_disease);
        Delete_qualify_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.qualify);
        Delete_dose_date1_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.dose_date1);
        Delete_dose_date2_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.dose_date2);
        Delete_adult_consent_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=adult_consent&ID=encounter_id=" + ID);
        Delete_guardian_consent_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=encounter_client_vaccine&Image_Name=guardian_consent&ID=encounter_id=" + ID);
        Delete_vaccine_admin_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.vaccine_admin);
        Delete_guardian_f_name_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.guardian_f_name);
        Delete_guardian_l_name_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.guardian_l_name);
        Delete_guardian_mi_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.guardian_mi);
        Delete_guardian_phone_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.guardian_phone);
        Delete_adult_consent_date_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.adult_consent_date);
        Delete_guard_consent_date_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.guard_consent_date);
        Delete_dose_form1_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.dose_form1);
        Delete_dose_form2_txt_lbl.Text = Convert.ToString(encounter_client_vaccine.dose_form2);
        return encounter_client_vaccine;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        encounter_client_vaccine_delete(Convert.ToInt32(Delete_encounter_client_vaccine_GridView.SelectedValue));
    }
    public void encounter_client_vaccine_delete(int ID)
    {
        encounter_client_vaccine.Delete(ID);
        Insert_encounter_client_vaccine_GridView.DataBind();
        Update_encounter_client_vaccine_GridView.DataBind();
        Delete_encounter_client_vaccine_GridView.DataBind();
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

