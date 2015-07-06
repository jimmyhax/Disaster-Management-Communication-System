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
public partial class encounter_services_Screen : System.Web.UI.Page
{
            public encounter_services encounter_services = new encounter_services();
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
        encounter_services = Insert_encounter_services_select(Convert.ToInt32(Insert_encounter_services_GridView.SelectedValue));
    }
    public encounter_services Insert_encounter_services_select(int ID)
    {
        encounter_services = encounter_services.Select(ID);
        Insert_encounter_id_txt.Text = Convert.ToString(encounter_services.encounter_id);
        Insert_mobile_unit_id_txt.Text = Convert.ToString(encounter_services.mobile_unit_id);
        Insert_service_id_txt.Text = Convert.ToString(encounter_services.service_id);
        Insert_service_date_txt.Text = Convert.ToString(encounter_services.service_date);
        Insert_service_completed_txt.Text = Convert.ToString(encounter_services.service_completed);
        return encounter_services;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        encounter_services = encounter_services_insert();
    }
    public encounter_services encounter_services_insert()
    {
        encounter_services.encounter_id = Convert.ToInt32(Insert_encounter_id_txt.Text);
        encounter_services.mobile_unit_id = Convert.ToInt32(Insert_mobile_unit_id_txt.Text);
        encounter_services.service_id = Convert.ToInt32(Insert_service_id_txt.Text);
        encounter_services.service_date = Convert.ToDateTime(Insert_service_date_txt.Text);
        encounter_services.service_completed = Convert.ToDateTime(Insert_service_completed_txt.Text);
        encounter_services = encounter_services.Insert(encounter_services);
        Insert_encounter_services_GridView.DataBind();
        Update_encounter_services_GridView.DataBind();
        Delete_encounter_services_GridView.DataBind();
        return encounter_services;
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
        encounter_services = Update_encounter_services_select(Convert.ToInt32(Update_encounter_services_GridView.SelectedValue));
    }
    public encounter_services Update_encounter_services_select(int ID)
    {
        encounter_services = encounter_services.Select(ID);
        Update_encounter_serv_id_txt.Text = Convert.ToString(encounter_services.encounter_serv_id);
        Update_encounter_id_txt.Text = Convert.ToString(encounter_services.encounter_id);
        Update_mobile_unit_id_txt.Text = Convert.ToString(encounter_services.mobile_unit_id);
        Update_service_id_txt.Text = Convert.ToString(encounter_services.service_id);
        Update_service_date_txt.Text = Convert.ToString(encounter_services.service_date);
        Update_service_completed_txt.Text = Convert.ToString(encounter_services.service_completed);
        return encounter_services;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        encounter_services = encounter_services_update(Convert.ToInt32(Update_encounter_services_GridView.SelectedValue));
    }
    public encounter_services encounter_services_update(int ID)
    {
        encounter_services = encounter_services.Select(ID);
        encounter_services.encounter_serv_id = Convert.ToInt32(Update_encounter_serv_id_txt.Text);
        encounter_services.encounter_id = Convert.ToInt32(Update_encounter_id_txt.Text);
        encounter_services.mobile_unit_id = Convert.ToInt32(Update_mobile_unit_id_txt.Text);
        encounter_services.service_id = Convert.ToInt32(Update_service_id_txt.Text);
        encounter_services.service_date = Convert.ToDateTime(Update_service_date_txt.Text);
        encounter_services.service_completed = Convert.ToDateTime(Update_service_completed_txt.Text);
        encounter_services.Update(encounter_services);
        Insert_encounter_services_GridView.DataBind();
        Update_encounter_services_GridView.DataBind();
        Delete_encounter_services_GridView.DataBind();
        return encounter_services;
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
        encounter_services = Delete_encounter_services_select(Convert.ToInt32(Delete_encounter_services_GridView.SelectedValue));
    }
    public encounter_services Delete_encounter_services_select(int ID)
    {
        encounter_services = encounter_services.Select(ID);
        Delete_encounter_serv_id_txt_lbl.Text = Convert.ToString(encounter_services.encounter_serv_id);
        Delete_encounter_id_txt_lbl.Text = Convert.ToString(encounter_services.encounter_id);
        Delete_mobile_unit_id_txt_lbl.Text = Convert.ToString(encounter_services.mobile_unit_id);
        Delete_service_id_txt_lbl.Text = Convert.ToString(encounter_services.service_id);
        Delete_service_date_txt_lbl.Text = Convert.ToString(encounter_services.service_date);
        Delete_service_completed_txt_lbl.Text = Convert.ToString(encounter_services.service_completed);
        return encounter_services;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        encounter_services_delete(Convert.ToInt32(Delete_encounter_services_GridView.SelectedValue));
    }
    public void encounter_services_delete(int ID)
    {
        encounter_services.Delete(ID);
        Insert_encounter_services_GridView.DataBind();
        Update_encounter_services_GridView.DataBind();
        Delete_encounter_services_GridView.DataBind();
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

