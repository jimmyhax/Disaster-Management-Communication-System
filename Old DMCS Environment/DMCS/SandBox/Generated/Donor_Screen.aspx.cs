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
public partial class Donor_Screen : System.Web.UI.Page
{
            public Donor Donor = new Donor();
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
        Donor = Insert_Donor_select(Convert.ToInt32(Insert_Donor_GridView.SelectedValue));
    }
    public Donor Insert_Donor_select(int ID)
    {
        Donor = Donor.Select(ID);
        Insert_PersonID_txt.Text = Convert.ToString(Donor.PersonID);
        Insert_Status_txt.Text = Convert.ToString(Donor.Status);
        Insert_DonorType_txt.Text = Convert.ToString(Donor.DonorType);
        Insert_AgencyID_txt.Text = Convert.ToString(Donor.AgencyID);
        Insert_Phone_txt.Text = Convert.ToString(Donor.Phone);
        return Donor;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Donor = Donor_insert();
    }
    public Donor Donor_insert()
    {
        Donor.PersonID = Convert.ToInt32(Insert_PersonID_txt.Text);
        Donor.Status = Insert_Status_txt.Text;
        Donor.DonorType = Insert_DonorType_txt.Text;
        Donor.AgencyID = Convert.ToInt32(Insert_AgencyID_txt.Text);
        Donor.Phone = Convert.ToInt32(Insert_Phone_txt.Text);
        Donor = Donor.Insert(Donor);
        Insert_Donor_GridView.DataBind();
        Update_Donor_GridView.DataBind();
        Delete_Donor_GridView.DataBind();
        return Donor;
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
        Donor = Update_Donor_select(Convert.ToInt32(Update_Donor_GridView.SelectedValue));
    }
    public Donor Update_Donor_select(int ID)
    {
        Donor = Donor.Select(ID);
        Update_donor_id_txt.Text = Convert.ToString(Donor.donor_id);
        Update_PersonID_txt.Text = Convert.ToString(Donor.PersonID);
        Update_Status_txt.Text = Convert.ToString(Donor.Status);
        Update_DonorType_txt.Text = Convert.ToString(Donor.DonorType);
        Update_AgencyID_txt.Text = Convert.ToString(Donor.AgencyID);
        Update_Phone_txt.Text = Convert.ToString(Donor.Phone);
        return Donor;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Donor = Donor_update(Convert.ToInt32(Update_Donor_GridView.SelectedValue));
    }
    public Donor Donor_update(int ID)
    {
        Donor = Donor.Select(ID);
        Donor.donor_id = Convert.ToInt32(Update_donor_id_txt.Text);
        Donor.PersonID = Convert.ToInt32(Update_PersonID_txt.Text);
        Donor.Status = Update_Status_txt.Text;
        Donor.DonorType = Update_DonorType_txt.Text;
        Donor.AgencyID = Convert.ToInt32(Update_AgencyID_txt.Text);
        Donor.Phone = Convert.ToInt32(Update_Phone_txt.Text);
        Donor.Update(Donor);
        Insert_Donor_GridView.DataBind();
        Update_Donor_GridView.DataBind();
        Delete_Donor_GridView.DataBind();
        return Donor;
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
        Donor = Delete_Donor_select(Convert.ToInt32(Delete_Donor_GridView.SelectedValue));
    }
    public Donor Delete_Donor_select(int ID)
    {
        Donor = Donor.Select(ID);
        Delete_donor_id_txt_lbl.Text = Convert.ToString(Donor.donor_id);
        Delete_PersonID_txt_lbl.Text = Convert.ToString(Donor.PersonID);
        Delete_Status_txt_lbl.Text = Convert.ToString(Donor.Status);
        Delete_DonorType_txt_lbl.Text = Convert.ToString(Donor.DonorType);
        Delete_AgencyID_txt_lbl.Text = Convert.ToString(Donor.AgencyID);
        Delete_Phone_txt_lbl.Text = Convert.ToString(Donor.Phone);
        return Donor;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Donor_delete(Convert.ToInt32(Delete_Donor_GridView.SelectedValue));
    }
    public void Donor_delete(int ID)
    {
        Donor.Delete(ID);
        Insert_Donor_GridView.DataBind();
        Update_Donor_GridView.DataBind();
        Delete_Donor_GridView.DataBind();
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

