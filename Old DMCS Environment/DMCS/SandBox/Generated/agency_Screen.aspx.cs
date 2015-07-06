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
public partial class agency_Screen : System.Web.UI.Page
{
            public agency agency = new agency();
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
        agency = Insert_agency_select(Convert.ToInt32(Insert_agency_GridView.SelectedValue));
    }
    public agency Insert_agency_select(int ID)
    {
        agency = agency.Select(ID);
        Insert_address_id_txt.Text = Convert.ToString(agency.address_id);
        Insert_agency_name_txt.Text = Convert.ToString(agency.agency_name);
        Insert_primary_fName_txt.Text = Convert.ToString(agency.primary_fName);
        Insert_primary_lName_txt.Text = Convert.ToString(agency.primary_lName);
        Insert_primary_phone_txt.Text = Convert.ToString(agency.primary_phone);
        Insert_sec_fName_txt.Text = Convert.ToString(agency.sec_fName);
        Insert_sec_lName_txt.Text = Convert.ToString(agency.sec_lName);
        Insert_sec_phone_txt.Text = Convert.ToString(agency.sec_phone);
        return agency;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        agency = agency_insert();
    }
    public agency agency_insert()
    {
        agency.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        agency.agency_name = Insert_agency_name_txt.Text;
        agency.primary_fName = Insert_primary_fName_txt.Text;
        agency.primary_lName = Insert_primary_lName_txt.Text;
        agency.primary_phone = Insert_primary_phone_txt.Text;
        agency.sec_fName = Insert_sec_fName_txt.Text;
        agency.sec_lName = Insert_sec_lName_txt.Text;
        agency.sec_phone = Insert_sec_phone_txt.Text;
        agency = agency.Insert(agency);
        Insert_agency_GridView.DataBind();
        Update_agency_GridView.DataBind();
        Delete_agency_GridView.DataBind();
        return agency;
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
        agency = Update_agency_select(Convert.ToInt32(Update_agency_GridView.SelectedValue));
    }
    public agency Update_agency_select(int ID)
    {
        agency = agency.Select(ID);
        Update_agency_id_txt.Text = Convert.ToString(agency.agency_id);
        Update_address_id_txt.Text = Convert.ToString(agency.address_id);
        Update_agency_name_txt.Text = Convert.ToString(agency.agency_name);
        Update_primary_fName_txt.Text = Convert.ToString(agency.primary_fName);
        Update_primary_lName_txt.Text = Convert.ToString(agency.primary_lName);
        Update_primary_phone_txt.Text = Convert.ToString(agency.primary_phone);
        Update_sec_fName_txt.Text = Convert.ToString(agency.sec_fName);
        Update_sec_lName_txt.Text = Convert.ToString(agency.sec_lName);
        Update_sec_phone_txt.Text = Convert.ToString(agency.sec_phone);
        return agency;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        agency = agency_update(Convert.ToInt32(Update_agency_GridView.SelectedValue));
    }
    public agency agency_update(int ID)
    {
        agency = agency.Select(ID);
        agency.agency_id = Convert.ToInt32(Update_agency_id_txt.Text);
        agency.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        agency.agency_name = Update_agency_name_txt.Text;
        agency.primary_fName = Update_primary_fName_txt.Text;
        agency.primary_lName = Update_primary_lName_txt.Text;
        agency.primary_phone = Update_primary_phone_txt.Text;
        agency.sec_fName = Update_sec_fName_txt.Text;
        agency.sec_lName = Update_sec_lName_txt.Text;
        agency.sec_phone = Update_sec_phone_txt.Text;
        agency.Update(agency);
        Insert_agency_GridView.DataBind();
        Update_agency_GridView.DataBind();
        Delete_agency_GridView.DataBind();
        return agency;
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
        agency = Delete_agency_select(Convert.ToInt32(Delete_agency_GridView.SelectedValue));
    }
    public agency Delete_agency_select(int ID)
    {
        agency = agency.Select(ID);
        Delete_agency_id_txt_lbl.Text = Convert.ToString(agency.agency_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(agency.address_id);
        Delete_agency_name_txt_lbl.Text = Convert.ToString(agency.agency_name);
        Delete_primary_fName_txt_lbl.Text = Convert.ToString(agency.primary_fName);
        Delete_primary_lName_txt_lbl.Text = Convert.ToString(agency.primary_lName);
        Delete_primary_phone_txt_lbl.Text = Convert.ToString(agency.primary_phone);
        Delete_sec_fName_txt_lbl.Text = Convert.ToString(agency.sec_fName);
        Delete_sec_lName_txt_lbl.Text = Convert.ToString(agency.sec_lName);
        Delete_sec_phone_txt_lbl.Text = Convert.ToString(agency.sec_phone);
        return agency;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        agency_delete(Convert.ToInt32(Delete_agency_GridView.SelectedValue));
    }
    public void agency_delete(int ID)
    {
        agency.Delete(ID);
        Insert_agency_GridView.DataBind();
        Update_agency_GridView.DataBind();
        Delete_agency_GridView.DataBind();
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

