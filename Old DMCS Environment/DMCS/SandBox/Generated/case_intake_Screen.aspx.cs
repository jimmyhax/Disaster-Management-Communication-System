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
public partial class case_intake_Screen : System.Web.UI.Page
{
            public case_intake case_intake = new case_intake();
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
        case_intake = Insert_case_intake_select(Convert.ToInt32(Insert_case_intake_GridView.SelectedValue));
    }
    public case_intake Insert_case_intake_select(int ID)
    {
        case_intake = case_intake.Select(ID);
        Insert_applic_end_date_time_txt.Text = Convert.ToString(case_intake.applic_end_date_time);
        Insert_applic_start_date_time_txt.Text = Convert.ToString(case_intake.applic_start_date_time);
        Insert_circum_emergency_event_txt.Text = Convert.ToString(case_intake.circum_emergency_event);
        Insert_circum_help_request_memo_txt.Text = Convert.ToString(case_intake.circum_help_request_memo);
        Insert_circum_income_stolen_txt.Text = Convert.ToString(case_intake.circum_income_stolen);
        Insert_circum_memo_txt.Text = Convert.ToString(case_intake.circum_memo);
        Insert_circum_no_income_txt.Text = Convert.ToString(case_intake.circum_no_income);
        Insert_circum_not_enough_income_txt.Text = Convert.ToString(case_intake.circum_not_enough_income);
        Insert_agency_id_txt.Text = Convert.ToString(case_intake.agency_id);
        Insert_call_center_id_txt.Text = Convert.ToString(case_intake.call_center_id);
        return case_intake;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        case_intake = case_intake_insert();
    }
    public case_intake case_intake_insert()
    {
        case_intake.applic_end_date_time = Convert.ToDateTime(Insert_applic_end_date_time_txt.Text);
        case_intake.applic_start_date_time = Convert.ToDateTime(Insert_applic_start_date_time_txt.Text);
        case_intake.circum_emergency_event = Insert_circum_emergency_event_txt.Text;
        case_intake.circum_help_request_memo = Insert_circum_help_request_memo_txt.Text;
        case_intake.circum_income_stolen = Insert_circum_income_stolen_txt.Text;
        case_intake.circum_memo = Insert_circum_memo_txt.Text;
        case_intake.circum_no_income = Insert_circum_no_income_txt.Text;
        case_intake.circum_not_enough_income = Insert_circum_not_enough_income_txt.Text;
        case_intake.agency_id = Convert.ToInt32(Insert_agency_id_txt.Text);
        case_intake.call_center_id = Convert.ToInt32(Insert_call_center_id_txt.Text);
        case_intake = case_intake.Insert(case_intake);
        Insert_case_intake_GridView.DataBind();
        Update_case_intake_GridView.DataBind();
        Delete_case_intake_GridView.DataBind();
        return case_intake;
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
        case_intake = Update_case_intake_select(Convert.ToInt32(Update_case_intake_GridView.SelectedValue));
    }
    public case_intake Update_case_intake_select(int ID)
    {
        case_intake = case_intake.Select(ID);
        Update_case_id_txt.Text = Convert.ToString(case_intake.case_id);
        Update_applic_end_date_time_txt.Text = Convert.ToString(case_intake.applic_end_date_time);
        Update_applic_start_date_time_txt.Text = Convert.ToString(case_intake.applic_start_date_time);
        Update_circum_emergency_event_txt.Text = Convert.ToString(case_intake.circum_emergency_event);
        Update_circum_help_request_memo_txt.Text = Convert.ToString(case_intake.circum_help_request_memo);
        Update_circum_income_stolen_txt.Text = Convert.ToString(case_intake.circum_income_stolen);
        Update_circum_memo_txt.Text = Convert.ToString(case_intake.circum_memo);
        Update_circum_no_income_txt.Text = Convert.ToString(case_intake.circum_no_income);
        Update_circum_not_enough_income_txt.Text = Convert.ToString(case_intake.circum_not_enough_income);
        Update_agency_id_txt.Text = Convert.ToString(case_intake.agency_id);
        Update_call_center_id_txt.Text = Convert.ToString(case_intake.call_center_id);
        return case_intake;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        case_intake = case_intake_update(Convert.ToInt32(Update_case_intake_GridView.SelectedValue));
    }
    public case_intake case_intake_update(int ID)
    {
        case_intake = case_intake.Select(ID);
        case_intake.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        case_intake.applic_end_date_time = Convert.ToDateTime(Update_applic_end_date_time_txt.Text);
        case_intake.applic_start_date_time = Convert.ToDateTime(Update_applic_start_date_time_txt.Text);
        case_intake.circum_emergency_event = Update_circum_emergency_event_txt.Text;
        case_intake.circum_help_request_memo = Update_circum_help_request_memo_txt.Text;
        case_intake.circum_income_stolen = Update_circum_income_stolen_txt.Text;
        case_intake.circum_memo = Update_circum_memo_txt.Text;
        case_intake.circum_no_income = Update_circum_no_income_txt.Text;
        case_intake.circum_not_enough_income = Update_circum_not_enough_income_txt.Text;
        case_intake.agency_id = Convert.ToInt32(Update_agency_id_txt.Text);
        case_intake.call_center_id = Convert.ToInt32(Update_call_center_id_txt.Text);
        case_intake.Update(case_intake);
        Insert_case_intake_GridView.DataBind();
        Update_case_intake_GridView.DataBind();
        Delete_case_intake_GridView.DataBind();
        return case_intake;
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
        case_intake = Delete_case_intake_select(Convert.ToInt32(Delete_case_intake_GridView.SelectedValue));
    }
    public case_intake Delete_case_intake_select(int ID)
    {
        case_intake = case_intake.Select(ID);
        Delete_case_id_txt_lbl.Text = Convert.ToString(case_intake.case_id);
        Delete_applic_end_date_time_txt_lbl.Text = Convert.ToString(case_intake.applic_end_date_time);
        Delete_applic_start_date_time_txt_lbl.Text = Convert.ToString(case_intake.applic_start_date_time);
        Delete_circum_emergency_event_txt_lbl.Text = Convert.ToString(case_intake.circum_emergency_event);
        Delete_circum_help_request_memo_txt_lbl.Text = Convert.ToString(case_intake.circum_help_request_memo);
        Delete_circum_income_stolen_txt_lbl.Text = Convert.ToString(case_intake.circum_income_stolen);
        Delete_circum_memo_txt_lbl.Text = Convert.ToString(case_intake.circum_memo);
        Delete_circum_no_income_txt_lbl.Text = Convert.ToString(case_intake.circum_no_income);
        Delete_circum_not_enough_income_txt_lbl.Text = Convert.ToString(case_intake.circum_not_enough_income);
        Delete_agency_id_txt_lbl.Text = Convert.ToString(case_intake.agency_id);
        Delete_call_center_id_txt_lbl.Text = Convert.ToString(case_intake.call_center_id);
        return case_intake;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        case_intake_delete(Convert.ToInt32(Delete_case_intake_GridView.SelectedValue));
    }
    public void case_intake_delete(int ID)
    {
        case_intake.Delete(ID);
        Insert_case_intake_GridView.DataBind();
        Update_case_intake_GridView.DataBind();
        Delete_case_intake_GridView.DataBind();
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

