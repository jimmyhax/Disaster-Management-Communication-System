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
public partial class donation_Screen : System.Web.UI.Page
{
            public donation donation = new donation();
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
        donation = Insert_donation_select(Convert.ToInt32(Insert_donation_GridView.SelectedValue));
    }
    public donation Insert_donation_select(int ID)
    {
        donation = donation.Select(ID);
        Insert_Receipt_ID_txt.Text = Convert.ToString(donation.Receipt_ID);
        Insert_Resource_ID_txt.Text = Convert.ToString(donation.Resource_ID);
        Insert_Donor_ID_txt.Text = Convert.ToString(donation.Donor_ID);
        Insert_Date_txt.Text = Convert.ToString(donation.Date);
        Insert_Quantity_txt.Text = Convert.ToString(donation.Quantity);
        Insert_Agency_ID_txt.Text = Convert.ToString(donation.Agency_ID);
        Insert_Is_Monetary_txt.Text = Convert.ToString(donation.Is_Monetary);
        Insert_Is_FEMA_txt.Text = Convert.ToString(donation.Is_FEMA);
        return donation;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        donation = donation_insert();
    }
    public donation donation_insert()
    {
        donation.Receipt_ID = Convert.ToInt32(Insert_Receipt_ID_txt.Text);
        donation.Resource_ID = Convert.ToInt32(Insert_Resource_ID_txt.Text);
        donation.Donor_ID = Convert.ToInt32(Insert_Donor_ID_txt.Text);
        donation.Date = Convert.ToDateTime(Insert_Date_txt.Text);
        donation.Quantity = Convert.ToInt32(Insert_Quantity_txt.Text);
        donation.Agency_ID = Convert.ToInt32(Insert_Agency_ID_txt.Text);
        donation.Is_Monetary = Convert.ToBoolean(Insert_Is_Monetary_txt.Text);
        donation.Is_FEMA = Convert.ToBoolean(Insert_Is_FEMA_txt.Text);
        donation = donation.Insert(donation);
        Insert_donation_GridView.DataBind();
        Update_donation_GridView.DataBind();
        Delete_donation_GridView.DataBind();
        return donation;
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
        donation = Update_donation_select(Convert.ToInt32(Update_donation_GridView.SelectedValue));
    }
    public donation Update_donation_select(int ID)
    {
        donation = donation.Select(ID);
        Update_Donation_ID_txt.Text = Convert.ToString(donation.Donation_ID);
        Update_Receipt_ID_txt.Text = Convert.ToString(donation.Receipt_ID);
        Update_Resource_ID_txt.Text = Convert.ToString(donation.Resource_ID);
        Update_Donor_ID_txt.Text = Convert.ToString(donation.Donor_ID);
        Update_Date_txt.Text = Convert.ToString(donation.Date);
        Update_Quantity_txt.Text = Convert.ToString(donation.Quantity);
        Update_Agency_ID_txt.Text = Convert.ToString(donation.Agency_ID);
        Update_Is_Monetary_txt.Text = Convert.ToString(donation.Is_Monetary);
        Update_Is_FEMA_txt.Text = Convert.ToString(donation.Is_FEMA);
        return donation;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        donation = donation_update(Convert.ToInt32(Update_donation_GridView.SelectedValue));
    }
    public donation donation_update(int ID)
    {
        donation = donation.Select(ID);
        donation.Donation_ID = Convert.ToInt32(Update_Donation_ID_txt.Text);
        donation.Receipt_ID = Convert.ToInt32(Update_Receipt_ID_txt.Text);
        donation.Resource_ID = Convert.ToInt32(Update_Resource_ID_txt.Text);
        donation.Donor_ID = Convert.ToInt32(Update_Donor_ID_txt.Text);
        donation.Date = Convert.ToDateTime(Update_Date_txt.Text);
        donation.Quantity = Convert.ToInt32(Update_Quantity_txt.Text);
        donation.Agency_ID = Convert.ToInt32(Update_Agency_ID_txt.Text);
        donation.Is_Monetary = Convert.ToBoolean(Update_Is_Monetary_txt.Text);
        donation.Is_FEMA = Convert.ToBoolean(Update_Is_FEMA_txt.Text);
        donation.Update(donation);
        Insert_donation_GridView.DataBind();
        Update_donation_GridView.DataBind();
        Delete_donation_GridView.DataBind();
        return donation;
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
        donation = Delete_donation_select(Convert.ToInt32(Delete_donation_GridView.SelectedValue));
    }
    public donation Delete_donation_select(int ID)
    {
        donation = donation.Select(ID);
        Delete_Donation_ID_txt_lbl.Text = Convert.ToString(donation.Donation_ID);
        Delete_Receipt_ID_txt_lbl.Text = Convert.ToString(donation.Receipt_ID);
        Delete_Resource_ID_txt_lbl.Text = Convert.ToString(donation.Resource_ID);
        Delete_Donor_ID_txt_lbl.Text = Convert.ToString(donation.Donor_ID);
        Delete_Date_txt_lbl.Text = Convert.ToString(donation.Date);
        Delete_Quantity_txt_lbl.Text = Convert.ToString(donation.Quantity);
        Delete_Agency_ID_txt_lbl.Text = Convert.ToString(donation.Agency_ID);
        Delete_Is_Monetary_txt_lbl.Text = Convert.ToString(donation.Is_Monetary);
        Delete_Is_FEMA_txt_lbl.Text = Convert.ToString(donation.Is_FEMA);
        return donation;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        donation_delete(Convert.ToInt32(Delete_donation_GridView.SelectedValue));
    }
    public void donation_delete(int ID)
    {
        donation.Delete(ID);
        Insert_donation_GridView.DataBind();
        Update_donation_GridView.DataBind();
        Delete_donation_GridView.DataBind();
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

