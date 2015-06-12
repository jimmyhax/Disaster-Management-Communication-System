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
public partial class medical_assistance_Screen : System.Web.UI.Page
{
            public medical_assistance medical_assistance = new medical_assistance();
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
        medical_assistance = Insert_medical_assistance_select(Convert.ToInt32(Insert_medical_assistance_GridView.SelectedValue));
    }
    public medical_assistance Insert_medical_assistance_select(int ID)
    {
        medical_assistance = medical_assistance.Select(ID);
        Insert_em_id_txt.Text = Convert.ToString(medical_assistance.em_id);
        Insert_medical_assist_date_txt.Text = Convert.ToString(medical_assistance.medical_assist_date);
        Insert_medical_assist_doctor_id_txt.Text = Convert.ToString(medical_assistance.medical_assist_doctor_id);
        Insert_medical_assist_hosp_price_txt.Text = Convert.ToString(medical_assistance.medical_assist_hosp_price);
        Insert_medical_assist_hospital_name_txt.Text = Convert.ToString(medical_assistance.medical_assist_hospital_name);
        Insert_medical_assist_script_meds_txt.Text = Convert.ToString(medical_assistance.medical_assist_script_meds);
        Insert_medical_assist_script_price_txt.Text = Convert.ToString(medical_assistance.medical_assist_script_price);
        Insert_medical_assist_script_quantity_txt.Text = Convert.ToString(medical_assistance.medical_assist_script_quantity);
        return medical_assistance;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        medical_assistance = medical_assistance_insert();
    }
    public medical_assistance medical_assistance_insert()
    {
        medical_assistance.em_id = Convert.ToInt32(Insert_em_id_txt.Text);
        medical_assistance.medical_assist_date = Convert.ToDateTime(Insert_medical_assist_date_txt.Text);
        medical_assistance.medical_assist_doctor_id = Convert.ToInt32(Insert_medical_assist_doctor_id_txt.Text);
        medical_assistance.medical_assist_hosp_price = Convert.ToDecimal(Insert_medical_assist_hosp_price_txt.Text);
        medical_assistance.medical_assist_hospital_name = Insert_medical_assist_hospital_name_txt.Text;
        medical_assistance.medical_assist_script_meds = Insert_medical_assist_script_meds_txt.Text;
        medical_assistance.medical_assist_script_price = Convert.ToDecimal(Insert_medical_assist_script_price_txt.Text);
        medical_assistance.medical_assist_script_quantity = Convert.ToInt32(Insert_medical_assist_script_quantity_txt.Text);
        medical_assistance = medical_assistance.Insert(medical_assistance);
        Insert_medical_assistance_GridView.DataBind();
        Update_medical_assistance_GridView.DataBind();
        Delete_medical_assistance_GridView.DataBind();
        return medical_assistance;
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
        medical_assistance = Update_medical_assistance_select(Convert.ToInt32(Update_medical_assistance_GridView.SelectedValue));
    }
    public medical_assistance Update_medical_assistance_select(int ID)
    {
        medical_assistance = medical_assistance.Select(ID);
        Update_medical_assist_order_id_txt.Text = Convert.ToString(medical_assistance.medical_assist_order_id);
        Update_em_id_txt.Text = Convert.ToString(medical_assistance.em_id);
        Update_medical_assist_date_txt.Text = Convert.ToString(medical_assistance.medical_assist_date);
        Update_medical_assist_doctor_id_txt.Text = Convert.ToString(medical_assistance.medical_assist_doctor_id);
        Update_medical_assist_hosp_price_txt.Text = Convert.ToString(medical_assistance.medical_assist_hosp_price);
        Update_medical_assist_hospital_name_txt.Text = Convert.ToString(medical_assistance.medical_assist_hospital_name);
        Update_medical_assist_script_meds_txt.Text = Convert.ToString(medical_assistance.medical_assist_script_meds);
        Update_medical_assist_script_price_txt.Text = Convert.ToString(medical_assistance.medical_assist_script_price);
        Update_medical_assist_script_quantity_txt.Text = Convert.ToString(medical_assistance.medical_assist_script_quantity);
        return medical_assistance;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        medical_assistance = medical_assistance_update(Convert.ToInt32(Update_medical_assistance_GridView.SelectedValue));
    }
    public medical_assistance medical_assistance_update(int ID)
    {
        medical_assistance = medical_assistance.Select(ID);
        medical_assistance.medical_assist_order_id = Convert.ToInt32(Update_medical_assist_order_id_txt.Text);
        medical_assistance.em_id = Convert.ToInt32(Update_em_id_txt.Text);
        medical_assistance.medical_assist_date = Convert.ToDateTime(Update_medical_assist_date_txt.Text);
        medical_assistance.medical_assist_doctor_id = Convert.ToInt32(Update_medical_assist_doctor_id_txt.Text);
        medical_assistance.medical_assist_hosp_price = Convert.ToDecimal(Update_medical_assist_hosp_price_txt.Text);
        medical_assistance.medical_assist_hospital_name = Update_medical_assist_hospital_name_txt.Text;
        medical_assistance.medical_assist_script_meds = Update_medical_assist_script_meds_txt.Text;
        medical_assistance.medical_assist_script_price = Convert.ToDecimal(Update_medical_assist_script_price_txt.Text);
        medical_assistance.medical_assist_script_quantity = Convert.ToInt32(Update_medical_assist_script_quantity_txt.Text);
        medical_assistance.Update(medical_assistance);
        Insert_medical_assistance_GridView.DataBind();
        Update_medical_assistance_GridView.DataBind();
        Delete_medical_assistance_GridView.DataBind();
        return medical_assistance;
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
        medical_assistance = Delete_medical_assistance_select(Convert.ToInt32(Delete_medical_assistance_GridView.SelectedValue));
    }
    public medical_assistance Delete_medical_assistance_select(int ID)
    {
        medical_assistance = medical_assistance.Select(ID);
        Delete_medical_assist_order_id_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_order_id);
        Delete_em_id_txt_lbl.Text = Convert.ToString(medical_assistance.em_id);
        Delete_medical_assist_date_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_date);
        Delete_medical_assist_doctor_id_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_doctor_id);
        Delete_medical_assist_hosp_price_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_hosp_price);
        Delete_medical_assist_hospital_name_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_hospital_name);
        Delete_medical_assist_script_meds_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_script_meds);
        Delete_medical_assist_script_price_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_script_price);
        Delete_medical_assist_script_quantity_txt_lbl.Text = Convert.ToString(medical_assistance.medical_assist_script_quantity);
        return medical_assistance;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        medical_assistance_delete(Convert.ToInt32(Delete_medical_assistance_GridView.SelectedValue));
    }
    public void medical_assistance_delete(int ID)
    {
        medical_assistance.Delete(ID);
        Insert_medical_assistance_GridView.DataBind();
        Update_medical_assistance_GridView.DataBind();
        Delete_medical_assistance_GridView.DataBind();
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

