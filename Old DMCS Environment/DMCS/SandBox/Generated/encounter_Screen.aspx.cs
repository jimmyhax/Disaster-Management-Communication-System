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
public partial class encounter_Screen : System.Web.UI.Page
{
            public encounter encounter = new encounter();
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
        encounter = Insert_encounter_select(Convert.ToInt32(Insert_encounter_GridView.SelectedValue));
    }
    public encounter Insert_encounter_select(int ID)
    {
        encounter = encounter.Select(ID);
        Insert_case_id_txt.Text = Convert.ToString(encounter.case_id);
        Insert_agency_id_txt.Text = Convert.ToString(encounter.agency_id);
        Insert_call_center_id_txt.Text = Convert.ToString(encounter.call_center_id);
        Insert_client_id_txt.Text = Convert.ToString(encounter.client_id);
        Insert_create_date_txt.Text = Convert.ToString(encounter.create_date);
        Insert_close_date_txt.Text = Convert.ToString(encounter.close_date);
        Insert_disaster_id_txt.Text = Convert.ToString(encounter.disaster_id);
        Insert_Location_ID_txt.Text = Convert.ToString(encounter.Location_ID);
        Insert_Pet_Record_ID_txt.Text = Convert.ToString(encounter.Pet_Record_ID);
        return encounter;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        encounter = encounter_insert();
    }
    public encounter encounter_insert()
    {
        encounter.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        encounter.agency_id = Convert.ToInt32(Insert_agency_id_txt.Text);
        encounter.call_center_id = Convert.ToInt32(Insert_call_center_id_txt.Text);
        encounter.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        encounter.create_date = Convert.ToDateTime(Insert_create_date_txt.Text);
        encounter.close_date = Convert.ToDateTime(Insert_close_date_txt.Text);
        encounter.disaster_id = Convert.ToInt32(Insert_disaster_id_txt.Text);
        encounter.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        encounter.Pet_Record_ID = Convert.ToInt32(Insert_Pet_Record_ID_txt.Text);
        encounter = encounter.Insert(encounter);
        Insert_encounter_GridView.DataBind();
        Update_encounter_GridView.DataBind();
        Delete_encounter_GridView.DataBind();
        return encounter;
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
        encounter = Update_encounter_select(Convert.ToInt32(Update_encounter_GridView.SelectedValue));
    }
    public encounter Update_encounter_select(int ID)
    {
        encounter = encounter.Select(ID);
        Update_encounter_id_txt.Text = Convert.ToString(encounter.encounter_id);
        Update_case_id_txt.Text = Convert.ToString(encounter.case_id);
        Update_agency_id_txt.Text = Convert.ToString(encounter.agency_id);
        Update_call_center_id_txt.Text = Convert.ToString(encounter.call_center_id);
        Update_client_id_txt.Text = Convert.ToString(encounter.client_id);
        Update_create_date_txt.Text = Convert.ToString(encounter.create_date);
        Update_close_date_txt.Text = Convert.ToString(encounter.close_date);
        Update_disaster_id_txt.Text = Convert.ToString(encounter.disaster_id);
        Update_Location_ID_txt.Text = Convert.ToString(encounter.Location_ID);
        Update_Pet_Record_ID_txt.Text = Convert.ToString(encounter.Pet_Record_ID);
        return encounter;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        encounter = encounter_update(Convert.ToInt32(Update_encounter_GridView.SelectedValue));
    }
    public encounter encounter_update(int ID)
    {
        encounter = encounter.Select(ID);
        encounter.encounter_id = Convert.ToInt32(Update_encounter_id_txt.Text);
        encounter.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        encounter.agency_id = Convert.ToInt32(Update_agency_id_txt.Text);
        encounter.call_center_id = Convert.ToInt32(Update_call_center_id_txt.Text);
        encounter.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        encounter.create_date = Convert.ToDateTime(Update_create_date_txt.Text);
        encounter.close_date = Convert.ToDateTime(Update_close_date_txt.Text);
        encounter.disaster_id = Convert.ToInt32(Update_disaster_id_txt.Text);
        encounter.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        encounter.Pet_Record_ID = Convert.ToInt32(Update_Pet_Record_ID_txt.Text);
        encounter.Update(encounter);
        Insert_encounter_GridView.DataBind();
        Update_encounter_GridView.DataBind();
        Delete_encounter_GridView.DataBind();
        return encounter;
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
        encounter = Delete_encounter_select(Convert.ToInt32(Delete_encounter_GridView.SelectedValue));
    }
    public encounter Delete_encounter_select(int ID)
    {
        encounter = encounter.Select(ID);
        Delete_encounter_id_txt_lbl.Text = Convert.ToString(encounter.encounter_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(encounter.case_id);
        Delete_agency_id_txt_lbl.Text = Convert.ToString(encounter.agency_id);
        Delete_call_center_id_txt_lbl.Text = Convert.ToString(encounter.call_center_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(encounter.client_id);
        Delete_create_date_txt_lbl.Text = Convert.ToString(encounter.create_date);
        Delete_close_date_txt_lbl.Text = Convert.ToString(encounter.close_date);
        Delete_disaster_id_txt_lbl.Text = Convert.ToString(encounter.disaster_id);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(encounter.Location_ID);
        Delete_Pet_Record_ID_txt_lbl.Text = Convert.ToString(encounter.Pet_Record_ID);
        return encounter;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        encounter_delete(Convert.ToInt32(Delete_encounter_GridView.SelectedValue));
    }
    public void encounter_delete(int ID)
    {
        encounter.Delete(ID);
        Insert_encounter_GridView.DataBind();
        Update_encounter_GridView.DataBind();
        Delete_encounter_GridView.DataBind();
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

